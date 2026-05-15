Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BA537DEAB
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848617; cv=none; b=YhaI2zLvxBu4z6PwDFQbChR6kIrBiZnmfHDePPBhr7lXfZY1G3HWw1Wmc1IJejJIGbkiTuvoi5nCyBapzsiq6CLlnH11AzRgvqxzk/iaBcu3eifw3CE1dCWnvV/i1AliUkp/NIU2eq8jZXAnsHGN8s+uiBIggxVfP6YpVKYhjFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848617; c=relaxed/simple;
	bh=U6xpjZYkLzNu3aw3I+h7bk/wrZv7nov0VS4muO2jNHA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WC4kYO7p4UhFJ5EwEL5pt1PAtR5lvFEK0kORmgUk7BEDlfoaSkuZ3fIigILqoPxKqPOfMOMQ033i9H3ZnTqMjQHjbCL5vVhhYYuYp/eOqOMR9Ax3oWmMgNMajQZZIwCzoo4nqHpnKfRBOdFCZHfVGe9IBWu9AR+TxewhVN0kWUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AF6nGwfO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AF6nGwfO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3889EC2BCB0;
	Fri, 15 May 2026 12:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778848617;
	bh=U6xpjZYkLzNu3aw3I+h7bk/wrZv7nov0VS4muO2jNHA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=AF6nGwfOSZrHJBsQwI1afa2I+sKFdcFS9c4wtCRuWdF89wHar4A04TEFg9uj9Dv6z
	 3vJph8LgKD+v3d+uLXXsSzVmXWXaNwG+iwOIOPot/C77c8ypv2x8DXUYw4Cav7d6ip
	 FDKUBEZk2bxfvtAOp3cgOR/AwNrQLUO3l+UwD2o2+YIALHqkSNRrmmNhlkLdQPFwsK
	 xcOR8yKb0dEExfRIM8b3M7VEj3FxDZX9dkB/GQR00yRNZftF0MmGZMEXkU1Z/Nv81m
	 EHt/2phKBnt1sgq5L+N0RIojnOGNhVkc/RfWAUAdqL83HENUVlc492yeVDiML5MZjO
	 8K+3dea3sJ9+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: qcom: dts: qcm6490: Add JPEG encoder DT
 properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515-qcom-jpeg-v4l2-v1-3-f38c2e1b3555@oss.qualcomm.com>
References: <20260515-qcom-jpeg-v4l2-v1-3-f38c2e1b3555@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 12:36:56 +0000
Message-Id: <20260515123657.3889EC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The new device tree node violates generic naming conventions and co=
ntains properties that will fail DT schema validation.
--

commit b8074fba99ec8410569dbab1538fc6fc7f0597b9
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
arm64: qcom: dts: qcm6490: Add JPEG encoder DT properties

Add the required JPEG encoder definitions to the device tree.

> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
[ ... ]
> @@ -5305,6 +5305,58 @@ port@4 {
>  			};
>  		};
> =20
> +		qcom_jpeg_enc: qcom,jpegenc@ac4e000 {

This isn't a bug, but does this node name violate generic naming
conventions? Devicetree specifications generally require using generic
names such as jpeg-encoder@ac4e000 or video-codec@ac4e000 instead of
vendor-specific names.

> +				cell-index =3D <0>;

Can this cause a schema validation failure? The cell-index property does
not appear to be defined in the qcom,jpeg-encoder.yaml schema. Since the
schema specifies additionalProperties: false, this undocumented property
will trigger a make dtbs_check validation error.

> +				compatible =3D "qcom,qcm6490-jenc";
> +
> +				reg =3D
> +						<0 0xac4e000 0 0x4000>,
> +						<0 0xac40000 0 0x1000>;
> +
> +				reg-names =3D
> +						"jpeg_regs",
> +						"cpas_regs";

Are these reg-names aligned with the schema constraints? It appears they
use underscores, whereas the schema explicitly constrains these items to
use hyphens (jpeg-regs, cpas-regs). This mismatch will cause schema
validation to fail, even though the driver retrieves them safely by index.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-qcom-jpeg-=
v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com?part=3D3
