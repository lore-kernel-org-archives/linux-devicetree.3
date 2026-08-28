Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8941044DB7B
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787921242; cv=none; b=XkTD2sZ0AZRT02bozmvAPcsCqouxgM76Me1kkV2acXZGLsftClIpla1LEWg4mhiwSwyFFickI6S8bRoKFRFTtH/GCpx3+rS2fkm/yY3Dy7SMP29QbvQXipX7GFTeB+enwoayUaY1qPcDm33ckHdgfVEhCObF+DdnumzOJJIwFmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787921242; c=relaxed/simple;
	bh=QpMCPyv2X5j+QPls3ZBDxN52iEix8eJA2zvh6qQlMW8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VXV0Se4NLWkhpuyANCD80f4uY93c+vGvHOYZ3CqDeerapCa3ElR4NlFt+fZ3RElHCo3Yovewk0nEdNvq89QTNwdV1ZW8QN/mC8NtvQ9+wRhdAgUIIqPf+kjo9SQRDIE307HwnTuJqH89s1WRG3tSelmUrpzXjNYzQ5r+zQ+yxFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtUE/Hja; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtUE/Hja"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98BE81F000E9;
	Fri, 28 Aug 2026 12:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787921232;
	bh=60m328cU1aSV08AD6rhu4Gqt6X+I3sI/OS+YQ8DtFiw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FtUE/Hja7ZQdtD98raX7Y0fHkfnPcK0fQGIQaS7XSx9QcwVxtwMCDys2oPuXEf8/f
	 CEBvHNL3GfkPqF8+72c9En3p4sCEuHyFPbRxZAh8Q/2wORdWdESazpgnrejvnJVR/P
	 NkhN5XjnRusTQ5DkeJisrGC+Qp+9aYl2tWJz0Q1ZKTIXWWQn6QtMzfYhJ3uG0+h/u8
	 /5HDO9L0g2d8zMpqb7ANE4hSp8KqvE08RPBpJNPuSkjZVtZFiihZhfwO7gVUn0brMd
	 p1kUNLm9jRVpO5tnA4SEKq77vGJOhaWbCUhdPX7dqMa6cajMs39ILTOKPYLm/i8nu8
	 TWmqGO+LjiSeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/11] arm64: dts: qcom: sm8550: Disable Inline Crypto
 Engine by default
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260828-b4-dts-qcom-disable-ice-by-default-v1-1-1d6e0c2f5a69@oss.qualcomm.com>
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
 <20260828-b4-dts-qcom-disable-ice-by-default-v1-1-1d6e0c2f5a69@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 12:47:12 +0000
Message-Id: <20260828124712.98BE81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Disabling the Inline Crypto Engine (ICE) node by default in the So=
C DTSI causes UFS probe to fail for any board that enables UFS without expl=
icitly enabling ICE, breaking backward compatibility.
--

commit 16a0192ad11b331cfd04d9e22cced4ae705ad4f3
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: sm8550: Disable Inline Crypto Engine by default

Since UFS_PHY_GDSC is attached to the Inline Crypto Engine and the driver
does not currently enable runtime PM, the GDSC remains enabled while the
device is idle, even on boards where there are no consumers.

So disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/q=
com/sm8550.dtsi
> index 0e701e709235c..a2bfd857f3fc0 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2840,6 +2840,8 @@ ice: crypto@1d88000 {
>  			clock-names =3D "core",
>  				      "iface";
>  			power-domains =3D <&gcc UFS_PHY_GDSC>;
> +
> +			status =3D "disabled";

[Severity: High]
Does disabling the ICE node by default break backward compatibility for
boards that enable UFS without explicitly enabling ICE?

Since the qcom,ice phandle is retained in the ufs_mem_hc node, when a
board doesn't explicitly set status =3D "okay" for the ICE node,
of_find_device_by_node() will return NULL for the disabled node.

This causes of_qcom_ice_get() to return -ENODEV instead of -EOPNOTSUPP:

drivers/soc/qcom/ice.c:of_qcom_ice_get() {
    ...
	pdev =3D of_find_device_by_node(node);
	if (!pdev) {
		dev_err(dev, "Cannot find device node %s\n", node->name);
		return ERR_PTR(-ENODEV);
	}
    ...
}

Because it returns -ENODEV, the UFS driver treats this as a hard error and
aborts the entire UFS probe, rather than gracefully degrading without inline
encryption:

drivers/ufs/host/ufs-qcom.c:ufs_qcom_ice_init() {
    ...
	ice =3D devm_of_qcom_ice_get(dev);
	if (IS_ERR(ice)) {
		if (ice !=3D ERR_PTR(-EOPNOTSUPP))
			return PTR_ERR(ice);
    ...
}

Could this prevent the system from booting if the root filesystem is on UFS?

>  		};
> =20
>  		tcsr_mutex: hwlock@1f40000 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-b4-dts-qco=
m-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com?part=3D1
