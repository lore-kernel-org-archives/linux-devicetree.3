Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991589;
	b=mm/1zX2zirSCR0g4+KVL/Tel2tpdbS572mkSBXpJB83rzvGhurVu2sTj0R2poWEPBWdM
	 BoVMGlpsvJ98fRKwc1+x3LQCghtFyzDdbP6zByaUhrxyi9O0acwK+JF/LPwCF32JKJRBw
	 GnCOnSCBrV0pbdRCX02Rx9N4u/xv0cG6I366MXj5XsB+NCY795tX6ULmuqyOqT36W+FYy
	 E4DLsBNkXg8FvC8PF/Ieevejzj0mL8p4etjxOn4ZVcYiRsyy0W2Yfh7gn31k+qLcEv7f5
	 Z5gJ1f/Bbmar4jJVTKfUK8WmsLDNn2Xk3guq4CKRHmHm9C2aX4lvLDhumjLstP2+48g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991589;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Deh2ySOKE6BX1A0sFODoyKCHwwoGviIpLJxpfCVxq4I=;
	b=jFRMIA+jt3WAFHsTxGg0Yz6PSlVk7Vu51pwjg8ZuVApiOWeqk0GZ5uBIpvUKKve9YoGM
	 2ocqMHKAYaGOJaQ1O/v/mZBb2b09G49hWTWJubRX+yHVNNIhtr+yqOitguQtVLbJsa+5c
	 tiJnuoyWRMme2Zia1914qJww1i3Zgu1my3RqVZtFBgajRdPGxuBuqp5kLdu7Am6tJ/3zX
	 VcNxt04GZCNG69r3Tz1SeC2Gm83GSWvwrfSqxgXumNg2ppcQzBY5Ur99dRCw8QfvqyS1l
	 eIVsaXgqx3/J78/gf5wbSfEGw5VvFvg71b2zgl44lPtk3fX2R97AdQRNChnt3mPehvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HccBx4ZY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A1C606A329
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 18:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HccBx4ZY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5521F0089F;
	Fri,  6 Nov 2026 18:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793991588;
	bh=Deh2ySOKE6BX1A0sFODoyKCHwwoGviIpLJxpfCVxq4I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HccBx4ZYTGF9pixsjJNxKKdt/GNFdoe2RioI+rT5Wy2Qhd0pU6chbD/BS2ZnB7WfL
	 wrj5WUTH1vdOk1xYbtSfhFGkan1ZOtIZuybT4pNOfOH/01/FEsdlAZxxCUuOA734Bk
	 NUyFfGWcPedV4D+2MUmORi3SiSWdu+j3lUsWKuQxdTHStruBOnXamF67LVPG0q14u6
	 r7P9La5x9ie4/ZwSJjKXA11RcLBxkhyg8QcygZY9q5CvcIz2Uu9wo3l47qe/tl1nhi
	 OqD1tLedlMI73+25BqSYSEBl81lxGHaOaVj4lkisGYXYQh3v+zSj8PZnVUEtsADqsM
	 eRIFInYoSeLsA==
Message-ID: <sashiko-outbox-202123@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: sm8150: Add CAMSS and CCI
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Gigena" <mail@andrewgigena.dev>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v3-7-0103e8a0bbcd@andrewgigena.dev>
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-7-0103e8a0bbcd@andrewgigena.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 18:59:47 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] arm64: dts: qcom: sm8150: camss endpoints omit required
  data-lanes
- [Low] arm64: dts: qcom: sm8150: camss placed before csiphy0..3 out of
  address order
--

commit c52d60a765d4e993fcd753e18db2ef2055f389e5
Author: Andrew Gigena <mail@andrewgigena.dev>

arm64: dts: qcom: sm8150: Add CAMSS and CCI nodes

This commit adds Devicetree nodes for the SM8150 CAMSS ISP, four CSI2
PHYs, and two CCI I2C controllers along with their TLMM pin
configurations.

> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/q=
com/sm8150.dtsi
> index 293fcbacff346..008f787235b86 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
[ ... ]
> @@ -3782,6 +3862,414 @@ camnoc_virt: interconnect@ac00000 {
[ ... ]
> +		camss: isp@acaf000 {
> +			compatible =3D "qcom,sm8150-camss";
> +			status =3D "disabled";
[ ... ]
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +
> +					camss_csi0_in: endpoint {
> +						remote-endpoint =3D <&csiphy0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +
> +					camss_csi1_in: endpoint {
> +						remote-endpoint =3D <&csiphy1_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg =3D <2>;
> +
> +					camss_csi2_in: endpoint {
> +						remote-endpoint =3D <&csiphy2_out>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg =3D <3>;
> +
> +					camss_csi3_in: endpoint {
> +						remote-endpoint =3D <&csiphy3_out>;
> +					};
> +				};
> +			};
> +		};

[Severity: Medium]
Should port@0 through port@3 in camss omit the pre-populated
camss_csi0_in..camss_csi3_in endpoint nodes here so that board DTS files
instantiate only the active endpoints with their data-lanes?

Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml requires
data-lanes on every endpoint under port@[0-3], so enabling camss on a
board that uses fewer than all four CSI2 PHYs leaves the unused
endpoints without data-lanes and fails dtbs_check.  At runtime, if a
board DTS only sets data-lanes on the sensor-facing csiphyN_in endpoint,
camss_parse_ports() -> camss_parse_endpoint_node() parses camss_csiN_in
without data-lanes, does not select V4L2_MBUS_CSI2_DPHY in
v4l2_fwnode_endpoint_parse(), and fails probe with -EINVAL:

drivers/media/platform/qcom/camss/camss.c:camss_parse_endpoint_node() {
    ...
	v4l2_fwnode_endpoint_parse(of_fwnode_handle(node), &vep);
	if (vep.bus_type !=3D V4L2_MBUS_CSI2_DPHY) {
		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
		return -EINVAL;
	}
    ...
}

> +
> +		csiphy0: phy@ac65000 {
> +			compatible =3D "qcom,sm8150-csi2-phy";
> +			reg =3D <0 0xac65000 0 0x1000>;
> +			status =3D "disabled";

[Severity: Low]
Should csiphy0..csiphy3 (phy@ac65000..phy@ac68000) be placed before
camss (isp@acaf000) to keep /soc@0 child nodes in ascending unit-address
order?

Because of_platform_populate() registers devices in node order, placing
isp@acaf000 before phy@ac65000..phy@ac68000 also causes camss_probe() ->
camss_init_subdevices() -> msm_csiphy_subdev_init() to run before the
PHY providers are registered when built-in, hitting -EPROBE_DEFER from
devm_phy_get_by_of_node() and logging a spurious dev_err("csiphy %d init
fail\n").  In addition, status =3D "disabled" in camss and
csiphy0..csiphy3 should sit after the standard device properties (before
child nodes), and the reg addresses in these nodes should be zero-padded
to 8 hex digits (such as 0x0ac4a000) to match surrounding /soc@0 nodes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-sm8150-v7.=
4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev?part=3D7
