Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78F52EFDAF
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 20:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781294823; cv=none; b=hpa6qQjKj7SorRWib2eohNIrhuQT1ZJE4DQ7e7nnxzclf62UktSyvtTUeLM9dgRAdi2fjN2hH7vGqA0d5+OZhI9S6qN+Og3tpjDts6hM1B1Ev6lUFChA0QhT1TtK4jmHW14KDjemRifvPkLws3Q2f5KYfiwXHnXgDZwleG527bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781294823; c=relaxed/simple;
	bh=ZvuOJ8Ov4fSgnIQ8EIyZRPf0RBk0sYj0XTNcTbg22kE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oqwXiBxg6wkojI+4JiWT4cHdQrWNxSSzAlzqlCHedowrOr27IXBTWok2btbzxz3wvamMpu5MSKvzjq0VXcmq4K6dUeHO6s+V6pmPdIh5L29ySQGjT0rjv8QhW6/V3PO4O3/mB/bNCT7T/w5JX1ig279MVe2VeAuCn76O2TuO6qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hyaMEE7D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyaMEE7D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF141F000E9;
	Fri, 12 Jun 2026 20:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781294820;
	bh=kx0YCmV4X5CXccH/ZporFiWFi2CIsGzYnmfaESMqWOM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hyaMEE7DSg1Y9voXA2Cvs6a0xNqXkBdMKQhwPHzv2vywj5GfHzia10CEmu3JjF85J
	 x2bEvb9y0RT3Mr7ICUdsJe1QzH9/MU9gZ5jfFgLGESj2YpOYB16FWyurZDgz7ftOo8
	 +ff+ajvgl56UbVeT96GMQpuKFf7CJgZdAiM/9+1J13Oje6i9gQnslv5oyfNhDdjDzr
	 w+XFVH5f/nxsSub5dTbxVTA2Rs3Ctsy4UGHlV4IIBlMv8xcJvWSji7FR+Etl4/eiCp
	 B6y/vuyqiAv2rTuj1upoHXOlBsPGgrEL9w/ofypXsUhLCV36Fajws29drhA9NIRzE5
	 D8+cCrCxXY2Fw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sm8550: Add JPEG encoder node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260612194417.1737009-3-atanas.filipov@oss.qualcomm.com>
References: <20260612194417.1737009-3-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 20:06:59 +0000
Message-Id: <20260612200700.5FF141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] Unnecessary presence of the deprecated `cell-index` property in the=
 newly added JPEG encoder node.
- [Low] The `interconnects` property uses the hardcoded magic number `0` fo=
r path tags instead of semantic macros.
- [Low] Device tree node `jpeg-encoder@ac4e000` is placed out of order base=
d on its unit-address.
--

commit 7c79d5580891bdc3ade6113afec02f777f964fdb
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
   =20
arm64: dts: qcom: sm8550: Add JPEG encoder node
   =20
This patch adds the JPEG encoder hardware node to the SM8550 device tree.
It configures resources like clocks, power domains, IOMMUs, and interconnec=
ts
to allow the qcom-jpeg V4L2 encoder driver to bind and operate.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/q=
com/sm8550.dtsi
> index 912525e9bca6f..8090b8b1d7bda 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
[ ... ]
> @@ -3677,6 +3677,48 @@ port@7 {
>  			};
>  		};
> =20
> +		qcom_jpeg_enc: jpeg-encoder@ac4e000 {

[Severity: Low]
Is this node placed out of order according to its unit-address?

Usually, nodes within the soc container are strictly sorted by their unit
address. Since this is at 0xac4e000, should it be placed before
isp@acb7000 rather than appended after it?

> +			cell-index =3D <0>;

[Severity: Low]
Is the cell-index property still needed here?

The device tree binding typically describes this as a legacy hardware insta=
nce
index, and modern upstream drivers usually do not rely on it. Could we remo=
ve
it to align with modern device tree conventions?

> +			compatible =3D "qcom,sm8550-jenc";
> +
> +			reg =3D <0 0xac4e000 0 0x4000>;
[ ... ]
> +			iommus =3D <&apps_smmu 0x20C0 0x20>,
> +				 <&apps_smmu 0x20E0 0x20>;
> +
> +			interconnects =3D <&gem_noc MASTER_APPSS_PROC 0
> +					 &config_noc SLAVE_CAMERA_CFG 0>,
> +					<&mmss_noc MASTER_CAMNOC_HF 0
> +					 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_CAMNOC_SF 0
> +					 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_CAMNOC_ICP 0
> +					 &mc_virt SLAVE_EBI1 0>;

[Severity: Low]
Would it be better to use the standard semantic macros for the interconnect
path tags instead of hardcoding 0?

While the Qualcomm RPMh driver might map 0 to QCOM_ICC_TAG_ALWAYS internall=
y,
using the macro explicitly would maintain consistency with the other
interconnect nodes in the tree and clarify the intended power and bandwidth
configuration.

> +
> +			interconnect-names =3D "cam_ahb",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612194417.1737=
009-1-atanas.filipov@oss.qualcomm.com?part=3D2
