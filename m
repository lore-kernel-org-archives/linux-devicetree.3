Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6CD282F01
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 00:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788655812; cv=none; b=or3Q+XbQns/18bQvB0ZsFs+E2UMUMzhmaNU8WwCeiDKmiuwa2U9H6U+vNxbsfe8MXg2sPJptc3RpXw+UB092awuxy8ZGP7LCQuGmj6E5FPsYxSsRrxBRx6lS6kjlezVNkvgaHH0WhxChqvAtpZfC1qE3MLMJiWBRcaYdy8XcEwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788655812; c=relaxed/simple;
	bh=78evJSf0QcNXtfk43vPm2VDOpG24tY1IZGzpQsMylZs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j7Hh5sQ22COp9XDV+xJkN7L9jXRLTTuAsBf8VFwG3SLwHN/pFUQ/c/InGFvTrNCRAdUJu1lI7RFJodoGY+KrNt8GrjdkPk+9gSkbIXESxv62vFFWnU0AtjHROgDWscZwopRXeVFz4UwpmnXidJHt8tEKMhmvEWjzgqhJgTDceJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4R4VW3g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4R4VW3g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7C81F00A3A;
	Sun,  6 Sep 2026 00:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788655811;
	bh=pAh216dnaykPaKDz3okYsKFtpzP790fFPY0oJIwaQe8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D4R4VW3g2mamsmyAWuj7cq1WG3YodtH8uIgigOM37uk7PIYSlDrDOb8Yhy3uKFSm3
	 37o+BE5HYufqJRGHbyAprQYhHbu+ugDI/AW/HanP7gb861xdKaoio0nky/ZHkXd2+s
	 xgc52ZS2EyLr/r9noWrKy1jf32KpQlcDu0lNhNdhfqV/KGNbM7WI6h5FLghYYOai2i
	 nPbon+RpfLw/C+gsvnBTerTfq4BKer7oShe4UaKtH/Q0gV2NP7iLgDEl/Tm1iOwzia
	 PE4HJeptbN0t2EEqY6YrRIkPqgmRyr2qH/pCBwkz1avBHrFWN7tnDc3BMYx081m9aW
	 lgol8Nh27wdhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 4/4] arm64: dts: qcom: sdm670-google: Add modemsmem
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260906-modemsmem-v1-4-a3634b553841@ixit.cz>
References: <20260906-modemsmem-v1-0-a3634b553841@ixit.cz>
 <20260906-modemsmem-v1-4-a3634b553841@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 00:50:10 +0000
Message-Id: <20260906005010.DE7C81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing probe dependency between the `modemsmem` platform device a=
nd the modem remoteproc driver.
- [High] Probe fails if the SMEM item is already allocated by the bootloade=
r (-EEXIST).
- [High] Uninitialized SMEM memory is exposed to the modem because several =
fields are not initialized.
--

commit f684325f1bc358462d3e26fd3838d75a70d04ce2
Author: Richard Acayan <mailingradian@gmail.com>

arm64: dts: qcom: sdm670-google: Add modemsmem

The Pixel 3a modem needs the modemsmem client. Add it in the device
tree so the modem can properly boot.

> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/ar=
m64/boot/dts/qcom/sdm670-google-common.dtsi
> index b4854801a5f5e..4604c4eb2192a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> @@ -66,6 +66,11 @@ key-vol-up {
>  		};
>  	};
> =20
> +	modemsmem {
> +		compatible =3D "google,modemsmem";
> +		qcom,smem-id =3D <134>;
> +	};
> +

[Severity: High]
Is there a missing probe dependency between the modemsmem platform device
and the modem remoteproc driver?

Because this node is defined as a standalone platform device with no
parent-child relationship or fw_devlink dependency (like a phandle) to the
modem node, the kernel driver core will probe them in an unconstrained orde=
r.

If remoteproc probes first and starts the modem firmware, will the modem
driver crash or fail to boot if it attempts to read SMEM item 134 before it
is allocated and populated?

[Severity: High]
Does this node addition trigger a probe failure on warm reboots?

Looking at modemsmem_probe() in drivers/soc/qcom/modemsmem.c:

	ret =3D qcom_smem_alloc(QCOM_SMEM_HOST_ANY, smem_id, sizeof(*info));
	if (ret)
		return dev_err_probe(dev, ret, "Could not allocate modem smem\n");

If the requested SMEM item was already allocated (e.g., by the bootloader
or persisting across a warm reboot), qcom_smem_alloc() returns -EEXIST.

Because modemsmem_probe() treats any non-zero return value as a fatal error
instead of tolerating -EEXIST, will this prevent the modem from receiving
updated SoC information?

[Severity: High]
Does allocating this SMEM item expose uninitialized memory to the modem?

Looking at write_socinfo() in drivers/soc/qcom/modemsmem.c:

	target->version =3D cpu_to_le32(MODEM_SMEM_VERSION);
	target->major_id =3D cpu_to_le32(PLAT_VER_TO_MAJOR_ID(plat_ver));
	target->minor_id =3D cpu_to_le32(PLAT_VER_TO_MINOR_ID(plat_ver));
	target->platform =3D socinfo->hw_plat;
	target->subtype =3D socinfo->hw_plat_subtype;

qcom_smem_alloc() allocates memory from the SMEM region but does not
zero-initialize it. Since only 5 of the 8 fields in struct modem_smem_info
are assigned, the remaining fields (modem_flag, efs_magic, ftm_magic) are
left untouched.

Could this lead to unpredictable behavior if the modem firmware reads and
processes these uninitialized garbage values?

>  	reserved-memory {
>  		#address-cells =3D <2>;
>  		#size-cells =3D <2>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-modemsmem-=
v1-0-a3634b553841@ixit.cz?part=3D4
