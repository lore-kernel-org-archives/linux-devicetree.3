Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12F32F5A29
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162003; cv=none; b=JTjljYp6wLuOQlPw+8i6KZaYpIGqWLfbwTO3eW1T4TeIb9YeJ6wytmA/rF8zdQZ485UuzHcYKKC8KgQgYFtP4ml62fIP9G9+gYEkZtDPLDKdxdPlEldyZAA/qQmnYyhLCVLhe/RnWg4BW414Edh8Fw3+9LI87hcLSH48cHPXruk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162003; c=relaxed/simple;
	bh=ueznzBdgXrz4G8Y3h4NVWABJH+Xw5c/zWK9JGj2XZ4o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rs2w0C+Cf6WHCOft3cDsrbLkRK8OMcmqnUPDk3iivmxM1FiLiHz/FyZw2OlLaCWLdrASqNDxcYsk+5uCoT+vS0DEL/ym/JaJvUn6o1v31zZ5AcIkpdv9qt5NhrvK39pyeUY8jq3rpTJJ9SOSci17cvM5wxnjxe49ZhwXByKKb/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=maxV1OE6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="maxV1OE6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA89B1F000E9;
	Mon, 27 Jul 2026 14:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785162002;
	bh=qTDITuwwXTH23RPD5XWcK8XN8lSpfL1f7w58MDAzI1c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=maxV1OE6Ow/XU0/ftYEMF8aDApN4YJo3uxrQnw7dTGJCPtdubqLKKo/4TQUcMv2im
	 JYmAOWB/W+1+pxNnAR1R62s6Aiyo3jXq+g9rIUeNscnJcCaVPoJzci3g/dvkKjbO4q
	 rmS4+B+fyamZNw9+RSLz3O41QsHsHOUX5mODhr2DkAN6X9Vp+RVw0jBvb9YATMbtsA
	 uEuSHFuML5Jj7+UKyVPp4aguNrz6VzV11OoJ1SdtWiwoNOhfVZYyiIm/lsqb5l8MLX
	 i4/N12WsRfVr83+vj7WH7DN9RPe/FDqyQOKQHaACisLpNp9BE7xSFahDgHyq/QrXnV
	 rzhaixYlQIz5w==
From: sashiko-bot@kernel.org
Subject: Re: [RESEND V2 1/2] dt-bindings: pinctrl: tegra264: fix DAP2
 DIN/DOUT pin names
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prathamesh Shete" <pshete@nvidia.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727141121.772110-1-pshete@nvidia.com>
References: <20260727141121.772110-1-pshete@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 14:20:00 +0000
Message-Id: <20260727142001.EA89B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The dt-bindings update renames the pins dap2_din_pv7 and dap2_dout=
_pw0 to dap2_din_pw0 and dap2_dout_pv7, but fails to update the correspondi=
ng string names in the pinctrl driver, breaking device tree parsing at runt=
ime.
--

--- Patch [1]: [RESEND V2 1/2] dt-bindings: pinctrl: tegra264: fix DAP2 DIN=
/DOUT pin names ---
commit 467f2064204e431cbe2d5bcbda6fbbde377327d8
Author: Prathamesh Shete <pshete@nvidia.com>

dt-bindings: pinctrl: tegra264: fix DAP2 DIN/DOUT pin names

This commit corrects the ball suffixes for the DAP2 DIN and DOUT pins in the
Tegra264 pinctrl dt-bindings. It renames dap2_din_pv7 and dap2_dout_pw0 to
dap2_din_pw0 and dap2_dout_pv7 in both the pin properties and drive groups.

> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pi=
nmux-main.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-=
pinmux-main.yaml
> index c40409d3263c2..01db762e82bc0 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-ma=
in.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-ma=
in.yaml
> @@ -44,7 +44,7 @@ patternProperties:
>                      soc_gpio173_pu3, soc_gpio174_pu4, soc_gpio175_pu5,
>                      soc_gpio176_pu6, soc_gpio177_pu7, soc_gpio178_pv0,
>                      pwm10_pv1, uart4_tx_pv2, uart4_rx_pv3, uart4_rts_n_p=
v4,
> -                    uart4_cts_n_pv5, dap2_clk_pv6, dap2_din_pv7, dap2_do=
ut_pw0,
> +                    uart4_cts_n_pv5, dap2_clk_pv6, dap2_din_pw0, dap2_do=
ut_pv7,

[Severity: High]
Does this change break device tree parsing at runtime?

While the binding is updated to enforce the correct pin names, it appears t=
he
corresponding pinctrl driver was not updated to match.

Looking at tegra264_main_groups() in drivers/pinctrl/tegra/pinctrl-tegra264=
.c,
the driver still registers the pin groups using the old names:

    PINGROUP(dap2_din_pv7, I2S2_SDATA_OUT, RSVD1, RSVD2, RSVD3, 0x6050, ...
    PINGROUP(dap2_dout_pw0, I2S2_SDATA_IN, RSVD1, RSVD2, RSVD3, 0x6058, ...

Because the binding now requires dap2_din_pw0 and dap2_dout_pv7, device tre=
es
adhering to the new binding will fail to match the driver's string identifi=
ers.

Will this cause the pinctrl core to fail to configure the DAP2 interface
because it cannot find the updated names in the driver?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727141121.7721=
10-1-pshete@nvidia.com?part=3D1
