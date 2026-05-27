Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E104D3B5F63
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876987; cv=none; b=upQfAGh4JrDTmtoLLKRiVz9KdrPCmcs0O+WTwTMSBV/TtPFJPmNQPFbZ8sFrGioouzmcDtBsTnEWfxhLq81uRvv/ilCLv2Xs+ifTd5/z4vUqFokJfQlhUr0bkVmRTXM7nN4MFOG5nV/CoDbgMOOr2c/c0DKmAMyfdiv/9QIyguI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876987; c=relaxed/simple;
	bh=uZQJ9D0kVafSlOXp9dZsDb9umsnbRYNEeOuSupzXKAw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t+TbGPwdK4h3G4zhL/urcg64jYiF6jlfmCc6wvGOft/9osg+I5QHS31PTfv43Ik8pUuuwyzYgHjefQy45lvWXPdRnu2aeL1smKRwi0F3doeHzquTpVMZp/6YlKBlVU8KvLawjOW+WpOcp7Ta3vm6ajuWn3VMpknL0PJOMCQMEbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JAO42bUZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JAO42bUZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22021F00A3A;
	Wed, 27 May 2026 10:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779876982;
	bh=J9kWqOUFz1WIaIZlgjr7sHOy3+6w+Bjqa82fnd0C5bI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JAO42bUZt7WUa4T32U9KL+MD8zmTQ4Pc+XwGJSXVOtAKAJrW8ov5fVLmRiERmjmNh
	 kvP8+R4+s15qiR1LVw2AFSRsz6fDfQ/suWvSPioq0icTNY5GdavyZSajXSGRMrRFMI
	 GIKJXRW1aAKgARnRhtI59dFjS3F/A67N0uCfe+pQAn0ag25j8gYU4UEBbsp81QW7XC
	 dVRhg91sRSIj/1X+QAylWj1PLzlJfFVafEMcT64Oa/SG2w/BL7T9qlRCy/WRsWripE
	 9nZF0HILQNRD0VYtNoBnc/4j3/MoKXCoj/KEHGr8hLaPHpLl+a4IZROU0WVJN7dyOH
	 tI43QNzuSvumA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 18/24] arm64: dts: qcom: talos: Reduce OS PDC DRV
 span to 0x10000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260527094333.2311731-19-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-19-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 10:16:21 +0000
Message-Id: <20260527101621.B22021F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Reducing the PDC register span to 0x10000 causes the qcom-pdc dr=
iver to emit a boot warning and override the size back to 0x30000, negating=
 the purpose of the patch.
--

commit d70fb9cd4a6ef5ac1791e6576ca81f3526300257
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: talos: Reduce OS PDC DRV span to 0x10000

This commit reduces the OS PDC DRV register window size for talos in the
device tree. It changes the first reg entry size from 0x30000 to 0x10000.

> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qc=
om/talos.dtsi
> index ff5afbfce2a47..6f6c9fe1758b1 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -4529,7 +4529,7 @@ dispcc: clock-controller@af00000 {
> =20
>  		pdc: interrupt-controller@b220000 {
>  			compatible =3D "qcom,qcs615-pdc", "qcom,pdc";
> -			reg =3D <0x0 0x0b220000 0x0 0x30000>,
> +			reg =3D <0x0 0x0b220000 0x0 0x10000>,

[Severity: Medium]
Will this regression cause a boot warning and be overridden by the driver?

Looking at drivers/irqchip/qcom-pdc.c, the driver enforces a minimum region
size of 0x30000:

#define QCOM_PDC_SIZE 0x30000
...
	res_size =3D max_t(resource_size_t, resource_size(&res), QCOM_PDC_SIZE);
	if (res_size > resource_size(&res))
		pr_warn("%pOF: invalid reg size, please fix DT\n", node);

Because the device tree size is now smaller than QCOM_PDC_SIZE, the driver
will print this warning on every boot, and will still ioremap the full
0x30000 bytes anyway.

Does the qcom-pdc driver need an update to handle the smaller 0x10000 size
properly alongside this device tree change?

>  			      <0x0 0x17c000f0 0x0 0x64>;
>  			qcom,pdc-ranges =3D <0 480 94>, <94 609 31>, <125 63 1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527094333.2311=
731-1-mukesh.ojha@oss.qualcomm.com?part=3D18
