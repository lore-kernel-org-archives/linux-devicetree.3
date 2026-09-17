Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9170E53ED11
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652296; cv=none; b=RABAw1wAFde8HeuSfA4WYNt4xZbWcYWZHx5pebLRxwFQS6ZGlHnsSLDVFlv1MKJPXcQD+PlC0kEhFjw5HOfgJCuCJxQCwojN7yPfECQOje6VeuMZEx3eNXocZE9R1eHj9KAFWZRXWDqtS7WYoJ0YJTXJ3Six+Sa1MPkki5U8b3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652296; c=relaxed/simple;
	bh=ueTzMBbv3DZQ6lQWxxSD9O9bJcvtWpfcoVYA86mXEBg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TO9elPA/PbPXcf+2TB26FOhc+kltYHMnKuKdBwFgvloFvobzo1VmloxIBTaiRq7d8xQCUah6d09QCIjw8jijcpY5zehWC5wax7IFRsVwB9GecWwDdcyAiOu8Ht9nYMHdq2CUWCILjTBJEOwq3+BQ5m3+3auJSSWllzRWheo54wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIgleKPm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIgleKPm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B171F000FF;
	Thu, 17 Sep 2026 13:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789652287;
	bh=R556wRBFXMMhGkA7og4topZg/AxCO++IvhZx9oUcIA4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OIgleKPmB+Y4huK/MY3oyMGnCn1fMSlS9Bx/4Advjfoqq4d/fYpaIN7ruifHBP3lF
	 Gy8etzo7nL4pMAc20rfUbJjt9UYYbyIV5Ilo9536ND3AyLEeX38VVAWPQycsR84Mwv
	 WgrEnrvsMGaiW+hAvkYRhbCD/NcKrm3Qh8vVBezlcb6geCsNhLIialu85c9o44DL8s
	 GwJFoBCE1PHCbGa/WNKN+9JVuFjBGLUSbMl1MYZCObg9CYgeT0+Uabf7hIAcmZIaDB
	 figUVXS+HbVqY029EbTWZHP0lVU93xZtZ8E2oaJoodXNmzfWgSH1NqSVeBcJXtNTOv
	 zqb5loFhOuc0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/12] arm64: dts: qcom: x1e80100-crd: Add ov08x40
 RGB sensor on CSIPHY4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-6-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
 <20260917-x1e-camss-csi2-phy-dtsi-v7-6-1a63eb35838b@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 13:38:06 +0000
Message-Id: <20260917133807.52B171F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: x1e80100-crd: Broken CAMSS OF graph and missing =
PHY regulators
--

commit ffc60037283c2ea9b513225f3dfd676a7b8869ad
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB sensor on CSIPHY4
   =20
Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
connected to CSIPHY4 in four lane mode.

> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/q=
com/x1-crd.dtsi
> index 47cfda908c515..a98f5c5b623bc 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi

[ ... ]

> @@ -933,6 +935,70 @@ &gpu {
>  	status =3D "okay";
>  };
> =20
> +&camss {
> +	status =3D "okay";
> +};

[Severity: High]
Will the upstream driver fail to manage the CSIPHY block since this node
is missing the vdd-csiphy-0p8-supply and vdd-csiphy-1p2-supply properties?

The upstream camss.c driver manages up the CSIPHY block natively and
requires its regulators to be defined on the camss node itself.

> +
> +&camss_csiphy4_in_port {
> +	camss_csiphy4_inep: endpoint {
> +		data-lanes =3D <1 2 3 4>;
> +		remote-endpoint =3D <&csiphy4_out_ep>;
> +	};
> +};

[Severity: High]
Is it intended to connect the CAMSS port to the intermediate PHY node
instead of directly to the sensor here?

> +
> +&cci1 {
> +	status =3D "okay";
> +};
> +
> +&cci1_i2c1 {
> +	camera@36 {

[ ... ]

> +		port {
> +			ov08x40_out_ep: endpoint {
> +				data-lanes =3D <1 2 3 4>;
> +				link-frequencies =3D /bits/ 64 <400000000>;
> +				remote-endpoint =3D <&csiphy4_in_ep>;
> +			};
> +		};
> +	};
> +};

[Severity: High]
Does routing the sensor output to the intermediate PHY node instead of the
CAMSS node break sensor discovery?

The CAMSS driver discovers sensors by iterating over its own ports and
expecting remote endpoints to be V4L2 subdevices.

> +
> +&csiphy4 {
> +	vdda-0p9-supply =3D <&vreg_l2c_0p8>;
> +	vdda-1p2-supply =3D <&vreg_l1c_1p2>;
> +
> +	status =3D "okay";
> +};

[Severity: High]
Because there is no upstream Linux driver for this standalone CSIPHY node,
will these regulators ever be requested and enabled?

> +
> +&csiphy4_in_port {
> +	csiphy4_in_ep: endpoint {
> +		bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +		data-lanes =3D <1 2 3 4>;
> +		remote-endpoint =3D <&ov08x40_out_ep>;
> +	};
> +};
> +
> +&csiphy4_out_port {
> +	csiphy4_out_ep: endpoint {
> +		remote-endpoint =3D <&camss_csiphy4_inep>;
> +	};
> +};

[Severity: High]
Do these intermediate OF graph links between the sensor, the split CSIPHY,
and CAMSS prevent the V4L2 async notifier from registering the subdevice?

The CAMSS V4L2 async notifier in camss_parse_ports() might wait indefinitely
for a non-existent csiphy4 subdevice to register, preventing pipeline probe.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-x1e-camss-=
csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org?part=3D6
