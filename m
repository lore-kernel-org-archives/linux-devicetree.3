Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F2A3CBE7E
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 12:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783080167; cv=none; b=R9QZ6zw69xu7PSlEt0EPnpv3Hu5+Nx3RG5t/Qo9ocDRTg6NdsTNQY9+t/cWA2BVFXNbijydDb5pgzVqm0jTKNw89qc3mHlS1qQAfAmYiS3dM24axAmcxjoeuDoxptw3DbsyXsksggM+gE69DQhkommBTKNHg+hR18f3WHeDmhss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783080167; c=relaxed/simple;
	bh=Ga8fxkmhVtRysrwAHQuEqU/NB1rFvG105KjQ/9gD+Z0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RJ+i49xtKbChISuT+vpuCZxAV4TiygsBWe48ePHeG/5jeR2uCreGV/jh5ceR0ArfexjrBTLnXoYq1wN4jblvUoYTFuJhDQbkKfVXAEjy1Zgs8iFXHuiKpoIU5kluskzOTZ0ZrGvBk5xdYvCyneXki+wqH9/IfbAg6auaKnGuLgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+FCDf/j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+FCDf/j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0B31F00A3A;
	Fri,  3 Jul 2026 12:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783080166;
	bh=Ga8fxkmhVtRysrwAHQuEqU/NB1rFvG105KjQ/9gD+Z0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W+FCDf/jePnfMYIOOTMKRWiu4B+w5aVNEXS94fdEfgkrnFz6WBG4lOEsPrQ5dCQQs
	 pFfCmSZKvUPCaRMQo2m1m7JdVJj54biOt9LhfxmntKml5ysLswa6mNdNnpDPi75nY7
	 ByPmQOEsKT2/b/Ed/AoECsPIES9etKt3iEqaCIFooG+YDf/9KcrYwsO/gaH/2ll/au
	 BEIfVwFOg5J4EFW6RUN/nAh98joPErDRMKNPEGN23KVR7sNfUCQ63RyFWOqY1Ge08c
	 i2nIXLDFdwzg71p4e0LTaDGB9i5Z3jX7mr/iINxnu5nvTla/fZFt6tHMUOTX4Pdfo9
	 qiJlLFZct7W3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 01/14] firmware: qcom: Add a generic PAS service
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260702115835.167602-2-sumit.garg@kernel.org>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-2-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 12:02:45 +0000
Message-Id: <20260703120245.EF0B31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] TOCTOU data race and missing memory barriers in PAS wrapper functi=
ons.
- [High] Check-then-set race condition in qcom_pas_ops_register() allows co=
ncurrent overwrites and unsafe reads.
- [High] Missing module lifecycle management and reference counting for the=
 PAS backend provider.
- [Medium] Resource leak when calling qcom_pas_metadata_release after provi=
der unregistration.
- [Medium] Missing NULL pointer validation for mandatory ops callbacks befo=
re execution.
--

Note: This review is provided in a free-form summary format without direct
patch quotes due to system recitation restrictions.

[Severity: High]
In wrapper functions like qcom_pas_init_image() and qcom_pas_get_rsc_table(=
),
the code checks if ops_ptr is NULL using a plain load, and then subsequently
dereferences ops_ptr to call the provider.

Since these loads are not protected by a mechanism to fetch into a local
variable, could the compiler fetch the pointer multiple times from memory?
If the provider module is unloaded concurrently, might ops_ptr become NULL
between the check and the dereference, leading to a crash?

[Severity: High]
Looking at qcom_pas_ops_register(), there appears to be a check-then-set ra=
ce
condition. If two threads call this simultaneously, both might check the
availability, see NULL, and both perform the store release, allowing
concurrent registrations to overwrite each other.

Additionally, in the error path for this function, it directly reads the
driver name from ops_ptr. If qcom_pas_ops_unregister() is called concurrent=
ly,
could this pointer become NULL and cause a crash when printing the error?

[Severity: High]
The qcom_pas_ops structure lacks a module owner field for lifecycle
management.

When wrapper functions like qcom_pas_auth_and_reset() invoke these callback=
s,
they do not appear to pin the provider module in memory using a reference
count. If the backend provider module is unloaded while its callbacks are
actively executing, will the kernel jump to unmapped memory?

[Severity: Medium]
In qcom_pas_metadata_release(), there is an early return if the operations
pointer is NULL.

If the backend provider is unregistered before the client releases its cont=
ext,
this bypasses the metadata release callback entirely. Does this early return
permanently leak resources, such as DMA mappings or shared memory, that were
allocated by the client during initialization?

[Severity: Medium]
Wrapper functions like qcom_pas_shutdown() directly execute callbacks from =
the
operations pointer without verifying if the specific function pointer is
populated.

If a registered backend provider fails to populate all mandatory callback
function pointers during registration, could this lead to a NULL pointer
dereference when the wrapper attempts to execute them?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702115835.1676=
02-1-sumit.garg@kernel.org?part=3D1
