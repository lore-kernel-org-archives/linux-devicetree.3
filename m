Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A488B134CCF
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 01:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002745; cv=none; b=Ll1wPR6KCLVhV6ymIyHRxgeqny1Ww218sVucC6/afNJMWGMNOUARWEN5UCLzYI6UxMLwzxYoRvcTB84uKVmOjPew/gPNV3YgW/jCAA3PJ5KoCmq+DmySdXq1X9WyFDH3vE5FsTaB6rmhR7XN5/HU0Q+1q+iDA36et2adIRJU/TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002745; c=relaxed/simple;
	bh=VysFvzTUtHoHNiKGP3ppBo5Ab3RwR88lLPEvdYjfL1w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eSh8sHxLh+J2Hwy5ZkL+6fQqLCmwKvRkJ0SnoCeN8euSJIn9vumWIj2FeexiE+qrWQBPVuPvFkojZlBMPQFaFdw4kyAti83soMX22Iu/ZDWG9hz69ycS06MNr3UInPfJlomvWZ/rd6t4IvFstXvyLAEJClgsv8xZeJKuWKghjIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gi9UKqLK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gi9UKqLK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A961F000FF;
	Thu, 10 Sep 2026 01:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789002734;
	bh=DIZ6UHoQq54klvG6jMRNKYHV1stk0lix1peQsgT9lXc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gi9UKqLKjY8Lal+pXvptfMis5egJC+EFoJyT8rewGlEHp2ilO19ua7NZ25tbFhOKE
	 Rw0OYfVVnfWRomneUkwgVMos9NLCPLJP3hhlCH7Z08rIEn7PsKTEjvlpr4jSbT2H+f
	 uUV+hsW3EJCFGqNYq2IcX+nV3Z0RgvZdamZR+WWmOC++ZBQwByDRWQPlYArYE2Gfgw
	 Wcoiah2rYR04hLxW+RBVTqTUicFSge2ygc3faKAYEMMKY7nDOs6LNsXqKJw2oK2W8j
	 vetZni/Qd2PWFomZCSS/jlph2tGkpC0TDAhjTC2VkFd9i7kYYrdt8pqnDzQlNx+UvQ
	 mgYksWSQUebCg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v1 4/6] mailbox: riscv-rpmi-message: add TEE service
 group definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: marouene.boubakri@oss.nxp.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260910012057.106966-5-marouene.boubakri@oss.nxp.com>
References: <20260910012057.106966-1-marouene.boubakri@oss.nxp.com>
 <20260910012057.106966-5-marouene.boubakri@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 01:12:13 +0000
Message-Id: <20260910011214.16A961F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Addition of definitions for an unratified, draft RISC-V specific=
ation violates the architecture's patch acceptance policy.
--

commit d0b34adf5a1cb66c49ab346280950958f9917cd2
Author: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

mailbox: riscv-rpmi-message: add TEE service group definitions

This commit adds the TEE service group ID and TEE service IDs to the
RPMI definitions to support the RPMI v2.0 specification.

> diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/m=
ailbox/riscv-rpmi-message.h
> index e135c6564d0c8..0530e1dddf3c5 100644
> --- a/include/linux/mailbox/riscv-rpmi-message.h
> +++ b/include/linux/mailbox/riscv-rpmi-message.h

[ ... ]

> @@ -119,6 +120,30 @@ enum rpmi_sysmsi_service_id {
>  	RPMI_SYSMSI_SRV_ID_MAX_COUNT
>  };
> =20
> +/* RPMI TEE service IDs */
> +enum rpmi_tee_service_id {
> +	RPMI_TEE_SRV_ENABLE_NOTIFICATION =3D 0x01,

[Severity: Medium]
Does adding definitions from a specification draft violate the RISC-V patch
acceptance policy?

The commit message notes that the RPMI v2.0 specification is "currently in
development" and the patch adds service IDs defined in a "specification
draft".

Documentation/arch/riscv/patch-acceptance.rst requires RISC-V
specifications to be either "Frozen" or "Ratified" before patches can be
accepted into the kernel.

If the specification changes before final ratification, wouldn't the kernel
be forced to maintain backward compatibility for unratified draft elements
like rpmi_tee_service_id in include/linux/mailbox/riscv-rpmi-message.h,
leading to maintenance burden and potential ABI breakage?

> +	RPMI_TEE_SRV_PROBE_FEATURES =3D 0x02,
> +	RPMI_TEE_SRV_PROBE_SYSTEM =3D 0x03,

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910012057.1069=
66-1-marouene.boubakri@oss.nxp.com?part=3D4
