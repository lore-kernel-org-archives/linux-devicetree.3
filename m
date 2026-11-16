Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836321;
	b=o5GfHlXdRxhD+ytvCLB6s6VEffUao91me/jh10fHAoIf9d4EdG27NHYenJMM6DJuI//d
	 Z6am+pXUxPay5YzBZeZlqW3lWwpNGpTnMaBhB1waQqySHpsD+7jLEFmD+wvSh94Kj4T2N
	 Btm8wAwC8XhW39ec5Wwan8QpyZvuFVg0AvFRGj1tJDyE2hIagpaOSY1rNmKqkdLNC7s7r
	 aehMvcMTXw+FCAL+7exefuDKdHYJjx+7MRkAyyW+SD8Zm8kIDzv53nE8yQobwKHLoq/8C
	 oQRSIqF7mtCEQaQ/1F7nx/2JH/uBpF+J+SOq+vEidUPtzFrqRDWu/BYvvRm/fUL+bnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836321;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=59PfDd0VpStac2ysf6Porax1g63p2cCCVlYSfpOHaNo=;
	b=YiCoYUCWRvxbJ+bpyucc6mSSexvUBgVX9k4ShJQVtfx5Sb0UAO+PkeIDnlKnhxwG9vRl
	 bk6DqdnRGTlduIjHCXgv0SeuhWX5ryEBRF4Fl3g0ov8P4whTyWVCrkgUS+WGnWC6M15Lr
	 d3FggJijJf3fOF51t20FQ2b08yHKT2TcM+MXDkdQDCedWMh+w/milxcu0SJLFptSPYi0l
	 CNvu+yCi4PkItcv7WzWWQXaw0WSYFKsuIsjxwudhN11aGozJEicuZS0ylWsw5em8XK7WS
	 kwK/Uw3LUGC9NeJfQz71xi74zRC10Y7K+xwSXqFTWy957EsIu97KoVqluSPpR/D/ewg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ivz2bEkW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFCD606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ivz2bEkW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0551F000C4;
	Mon, 16 Nov 2026 13:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794836321;
	bh=59PfDd0VpStac2ysf6Porax1g63p2cCCVlYSfpOHaNo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ivz2bEkWrds1FXElHF1G5QuonC/Y9MehV8TCrOHCLflMU+A+XxL/qz0evh0hSxSsk
	 +D2nqN684cN9pZ2CKTEEFlcAL+0UOiw5xJtCieTlmjmUosihSvf/ZAPhjfkw4RJuqC
	 7/6nKhmv/7fNvPINPNbdc4XN1elHaKl3ve/+y5qgbcqFqVE4DEA4c1JOux3jcRLTUP
	 Mf+gQZ8Ub5tkI7okbrx6B2RKwx8K0Ea6KjeXWogYg+Mpq1/R49tDChe/rLQiXWnaK8
	 j18i7QvViLCt/taC/TvjmYAmBaCdDUw3wo/VtpZFbJPX6hCHceXqzO7IpFNdwV6ILG
	 Y0h6EarD37kCA==
Message-ID: <sashiko-outbox-217094@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/11] dt-bindings: display/msm: Document Nord MDSS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261116-nord-drv-dt-v3-3-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
 <20261116-nord-drv-dt-v3-3-e3d3bf0e2c49@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 13:38:40 +0000
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
- [Medium] dt-bindings: display/msm: qcom,nord-mdss omits
  qcom,sa8775p-dp fallback
- [Low] dt-bindings: display/msm: inconsistent DP1 clocks and PHY reg
  sizes in example
--

commit 7e933ce5ebfd089e4cac22428484f5b572292bc8
Author: Mahadevan P <mahadevan.p@oss.qualcomm.com>

dt-bindings: display/msm: Document Nord MDSS

This commit adds the devicetree binding schema for the Qualcomm Nord
display subsystem (MDSS 12.1).

> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss=
.yaml b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
> new file mode 100644
> index 0000000000000..abd80dae4e7f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml

[ ... ]

> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,nord-dp

[Severity: Medium]
Should the compatible constraint here allow the "qcom,sa8775p-dp" fallback,
and should both displayport-controller nodes in the example below include
it?

Documentation/devicetree/bindings/display/msm/dp-controller.yaml requires
"qcom,nord-dp" to be followed by "qcom,sa8775p-dp":

Documentation/devicetree/bindings/display/msm/dp-controller.yaml
      - items:
          - enum:
              - qcom,qcs8300-dp
              - qcom,nord-dp
          - const: qcom,sa8775p-dp

Using "const: qcom,nord-dp" here rejects the required fallback, and
omitting "qcom,sa8775p-dp" from displayport-controller@af54000 and
displayport-controller@af5c000 in the example causes dt_binding_check to
fail against dp-controller.yaml.  Using "contains: const: qcom,nord-dp"
(as in qcom,qcs8300-mdss.yaml) and adding "qcom,sa8775p-dp" to the example
nodes would resolve this.

[ ... ]

> +        displayport-controller@af5c000 {
> +            compatible =3D "qcom,nord-dp";
> +
> +            reg =3D <0xaf5c000 0x200>,
> +                  <0xaf5c200 0x200>,
> +                  <0xaf5d000 0xc00>,
> +                  <0xaf5e000 0x400>,
> +                  <0xaf5f000 0x400>,
> +                  <0xaf60000 0x400>,
> +                  <0xaf61000 0x400>,
> +                  <0xaf62000 0x600>,
> +                  <0xaf63000 0x600>;
> +
> +            clocks =3D <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK>;
> +            clock-names =3D "core_iface", "core_aux",
> +                          "ctrl_link", "ctrl_link_iface",
> +                          "stream_pixel", "stream_1_pixel",
> +                          "stream_2_pixel", "stream_3_pixel";
> +
> +            assigned-clocks =3D <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_C=
LK_SRC>,
> +                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_C=
LK_SRC>,
> +                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_C=
LK_SRC>;
> +            assigned-clock-parents =3D <&dp1_phy 0>,
> +                                     <&dp1_phy 1>,
> +                                     <&dp1_phy 1>;

[ ... ]

> +        dp1_phy: phy@fc6a00 {
> +            compatible =3D "qcom,nord-dp-phy";
> +
> +            reg =3D <0xfc6a00 0x200>,
> +                  <0xfc6200 0xd0>,
> +                  <0xfc6600 0xd0>,
> +                  <0xfc6000 0x1c8>;

[Severity: Low]
Are the assigned-clocks on displayport-controller@af5c000 and the reg sizes
on dp1_phy in the example intended to differ from the first DP instance?

displayport-controller@af5c000 requests all four stream pixel clocks in
clocks, but assigned-clocks omits MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK_SRC
and MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK_SRC (which are present on
displayport-controller@af54000).  In addition, dp1_phy uses SA8775P
register sizes (0x200, 0xd0, 0xd0, 0x1c8) instead of the qcom,nord-dp-phy
sizes used by dp0_phy (0x1d0, 0x128, 0x128, 0x200), leaving the fourth
region smaller than NORD_DP_QSERDES_COM_C_READY_STATUS at offset 0x1f8.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-nord-drv-d=
t-v3-0-e3d3bf0e2c49@oss.qualcomm.com?part=3D3
