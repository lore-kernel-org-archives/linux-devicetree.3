Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5253402BAD
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 19:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778266969; cv=none; b=Z22LgsAp5UiV1JlrVGw6XCxDCSR9YJYSnNjydx/lrG9Mpq2XTkxRtdzFZVcm+0sVDl/gJKbHq3KiRc2eU7qwM7OaTpAAV1KzgaVyAVK/yN+Kj3bZ4l/qTwHJct9uw9R4u1EzkxkgwM9wCxIpA1XQHNpXrAowZB3nQglTIJ+Jr64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778266969; c=relaxed/simple;
	bh=WmHtNIx/033pCQPYwNeXafkRSJWwPmtHIxnfRkKekxw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MC3X0QKxjlV6BK7WY/yPprXbWTJlTKDNkzVXbFBxt7hA1HlOVR1RtLpWVEqTMEsfeHthr8kY7/iwjEoM0e2uIoDAIvpMHIBHnH8uiVOsWuThKzOPfwoPx+Gms+kdx6oFLCIBrkd718zce+O1RHIFocQWT8aGe5kPcNNDmxLOwTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AzkzoiTe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AzkzoiTe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F54C2BCB0;
	Fri,  8 May 2026 19:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778266969;
	bh=WmHtNIx/033pCQPYwNeXafkRSJWwPmtHIxnfRkKekxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=AzkzoiTezyZAk8ivEBaWvgxHJeZaC48U6METbFpDe5f2Z+0s6IuZFKD2a2aHaXCIC
	 +l50Qi1FrN8HZwozE0Om/tDmaFivoZx3Ui6ATvx0wAv2oQtYiRmzpM8Be7sErHFgix
	 ddeTQ+U2sB4GqZUkWSRFr0y1FCaZsv9CjudAUca/2w+054M9fb20qt3J7PCeTq5ugS
	 zwv7F2RUPrDQ5PUzhODeM4yzhst2SFmCiePDoU2DUNopB929ZKtzTZ67QqqmbZTXCL
	 J5Me02wQFingQD5wk2ieJ+mOHRRdD42awt5cK0GXP9qK2QmI6q1myrI11f9XgLqTJP
	 81fCJ2pAl/XEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] mailbox: qcom-apcs-ipc: Add Shikra APCS IPC
 support
Reply-To: sashiko@lists.linux.dev
To: "Sneh Mankad" <sneh.mankad@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v2-4-ab76fd9e71de@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v2-4-ab76fd9e71de@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 19:02:48 +0000
Message-Id: <20260508190249.56F54C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch adds a new compatible string `qcom,shikra-apss-shared` th=
at reuses existing driver data (`apps_shared_apcs_data`), directly violatin=
g an explicit maintainer directive in the code.
--

commit 6670ebc79f6a6772d5ca45315526be52e226e375
Author: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

mailbox: qcom-apcs-ipc: Add Shikra APCS IPC support

This commit enables Shikra APCS IPC support by adding the compatible string.
It reuses the existing apps_shared_apcs_data.

> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qc=
om-apcs-ipc-mailbox.c
> index d3a8f6b4a03b3..25f76965921ba 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -168,6 +168,7 @@ static const struct of_device_id qcom_apcs_ipc_of_mat=
ch[] =3D {
>  	{ .compatible =3D "qcom,ipq8074-apcs-apps-global", .data =3D &ipq6018_a=
pcs_data },
>  	{ .compatible =3D "qcom,sc7180-apss-shared", .data =3D &apps_shared_apc=
s_data },
>  	{ .compatible =3D "qcom,sc8180x-apss-shared", .data =3D &apps_shared_ap=
cs_data },
> +	{ .compatible =3D "qcom,shikra-apss-shared", .data =3D &apps_shared_apc=
s_data },

This isn't a bug, but does this addition conflict with the maintainer comme=
nt
located earlier in the qcom_apcs_ipc_of_match array?

The array contains an explicit directive:
/* Do not add any more entries using existing driver data */

Should this new device instead use a fallback compatible string in the
devicetree, such as "qcom,shikra-apss-shared", "qcom,sdm845-apss-shared",
rather than expanding the driver's match table?

>  	{ .compatible =3D "qcom,sm8150-apss-shared", .data =3D &apps_shared_apc=
s_data },
>  	{}
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-shikra_mai=
lbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com?part=3D4
