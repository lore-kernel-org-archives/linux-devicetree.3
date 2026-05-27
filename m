Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E93E3EC2E7
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876405; cv=none; b=n4UO/o3h00NvOGDCdTqQ7vPdebeXAMhAix5JlUtKYPyRDkGCWSUOhR5++pUvFpdu24eCYxk3pVG/a5gynAFIlqFI/+C35w0P8PBA+5hYNOhw/eFl2KBaZHz2NykjoIsdHvcXRJ0Wnvt9vtgoV+UNI8rGD/bp2QAqt4CBSB5gy8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876405; c=relaxed/simple;
	bh=zzgJ3StY3k0TRFh7dFt1w+Q3BVUosX0xUI4I7NegnoU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G5mReI6LITY3pkiazwij/Kp661tixW64T6IoZ0L5bToATNIO1fJMcEC0gQvvO6cPJkoEAYxzDcmBbTXBQdQ/2V1T07SJ8ohmNVu/y4+YoFpnelFuaMm9e8Dap9vKIJrvqRx11UR0rOzkBoEgoYU3xaEReUSb1fexrKmL9Gigmzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nnq4P+hi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nnq4P+hi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B191F000E9;
	Wed, 27 May 2026 10:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779876403;
	bh=4oXg1RYL5lBTQe1jznI756Zs6t/yRr9AONT2tp0bv2o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nnq4P+hiasbxh3K0VkBSDSYMZEUOS5yIa8fRWA8d3ep3ZjH49ZyI2hYAlmZaYe0Y+
	 //2RsP+J+cZrlExQBVsYX/075msVxybTMRZFcntSbwL+SlriclElCf0kcMymzVUIxS
	 13IU/lpLYQtq52SuvAzc2noOfTf5JOFAPf7ABDPeQGy55aS+kjLQJaCjDMpknonZMZ
	 kbfslQRnbCMpdi3IiH/qw8BkpdXSpndQ75/bRe5XCSKbZuO7/LBYBZw4s38hNNpg8m
	 V+ZC9C2FVrJoNg1eH/VtjbQpxi1VnHdgHU/12nCZliUw5vUSx53AI5I08WsNWWuXjZ
	 TbJjii8FmO1fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/24] arm64: dts: qcom: sm8550: Reduce OS PDC DRV
 span to 0x10000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260527094333.2311731-13-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-13-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 10:06:42 +0000
Message-Id: <20260527100643.28B191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Reducing the OS PDC DRV register window to 0x10000 in the DT wit=
hout updating the qcom-pdc driver triggers a spurious boot warning and null=
ifies the size reduction.
--

commit af73b863314fd2efa87dbeb8a5636a342659cea6
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: sm8550: Reduce OS PDC DRV span to 0x10000

This commit reduces the OS PDC DRV register window size from 0x30000 to
0x10000 in the sm8550 device tree.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/q=
com/sm8550.dtsi
> index 912525e9bca6f..de04610ef47e8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -4245,7 +4245,7 @@ usb_1_dwc3_ss: endpoint {
> =20
>  		pdc: interrupt-controller@b220000 {
>  			compatible =3D "qcom,sm8550-pdc", "qcom,pdc";
> -			reg =3D <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
> +			reg =3D <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;

[Severity: Medium]
Does this reduction trigger a boot warning and map 0x30000 bytes anyway?

Looking at drivers/irqchip/qcom-pdc.c, QCOM_PDC_SIZE is hardcoded to
0x30000.

The driver calculates the actual mapping size using:
res_size =3D max_t(resource_size_t, resource_size(&res), QCOM_PDC_SIZE);

With the DT size reduced to 0x10000, res_size still evaluates to 0x30000.
The driver then checks if (res_size > resource_size(&res)), which becomes
true, and unconditionally emits pr_warn("%pOF: invalid reg size, please fix
DT\n", node) on boot.

Furthermore, it proceeds to call ioremap(res.start, res_size), mapping
0x30000 bytes instead of the intended 0x10000. This seems to nullify the
size reduction introduced by this patch.

>  			qcom,pdc-ranges =3D <0 480 94>, <94 609 31>,
>  					  <125 63 1>, <126 716 12>,
>  					  <138 251 5>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527094333.2311=
731-1-mukesh.ojha@oss.qualcomm.com?part=3D12
