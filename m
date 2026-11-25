Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577925;
	b=hwhxWpngroFhFBM9lhOIOYlN+aM23PsojoEtgd+dw/C6sFseJyuCcuY1idGBfV1TsWEp
	 1xiVOwbPCBBUBTHzcPVhVv912dVdkLUImYXBXxxMtfR/GGLLOyvopnSHBc5nflYiAb7L8
	 Ri7qojPSQNVzktdpyaXS9qS0H7OWcOYuAssFLmJDHnMq7E1H2Fh3NQdBf+JJtd8ovm+ia
	 NgRlBJVt7R3+ymUbKagDzDr60tGFeaJWH5wYttj32Tu6gHiRcfH3mQPbdgfwN29jEP5k4
	 RVyxP/fKysADfeA5TLzUBqjJqvd1n/qmmpBnuPiOrfxzjp/lT4gnU0fKTO80Rj++JVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577925;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qtxhHqI2xyZIMBG6lqydCFd6I2RDxz5AWfI1CWS2xr4=;
	b=Qi9gAJbp0injkx5CRARZN9CeMOwI1xtqpKgDiSWLpuz5ng4B33u4eQC0P0xewxxQC7hh
	 9kPsir6pTBjc8Q12mx18AMOCf8jGEgWmLkwyL3Qx+imUD8tDi19eU7u+L35Bt9mM2z4MW
	 ajWtss86/UckpblFIDNh+++/vXzN+ToQMr+ToXc0RbJjAyCoT22vlUOwZdIPR+YM+5ud/
	 2U07uTd08XGQgmJomTkl7hfct6yVZAmTCxsPmkW+rTbrqWUX30hIbSj/6BVAwS1uqz01X
	 +PJBGJ/0JvuaDpM4xZiG2i+6zRRg6QDe1HBmBhr0X3my/htpqTSSydHUArXFMIiV2tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="naHp/BVn";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FC5606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=naHp/BVn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B371F000C6;
	Wed, 25 Nov 2026 03:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795577924;
	bh=qtxhHqI2xyZIMBG6lqydCFd6I2RDxz5AWfI1CWS2xr4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=naHp/BVnrHj0SeVV/oGlBsiMg3WosST9j6PNo1bEZ32EV0TaIpcXKJUDRD9m3kc/d
	 Fw7HrK/YEicsDTabRN6rLUln6TXclCV4Cy+sWBPHDjnZmNcsBMjxSyaHog7V1wUaso
	 HKPuDcFwqC/O9lMNBG8ttRvTskodg6bDPQd9YOmwoQyTbtmtvaIq0qPdSlqzjKumff
	 Dvf98us6NBXNlkWV5GjEpnd8Te1svTsh1GnDGNjGbHgOQmxnp5Dkce+h7GwlOSRvAY
	 29fE/NZkRM2+WZwRgAKJjSITLvvMewNeID/ZqrHpc7+UAp9MtBB4SJMTuwakisOeBh
	 40vmUM0biZgAw==
Message-ID: <sashiko-outbox-232475@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 4/9] media: iris: Add power sequence for glymur
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261125-glymur-v12-4-5c34dfd73fc2@oss.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
 <20261125-glymur-v12-4-5c34dfd73fc2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 03:38:43 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] media: iris: unchecked LPI poll timeout in
  iris_vpu36_power_off_vcodec()
--

commit 998f4f5571d3cd5ed169b9dcdfec4f6181739b16
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Add power sequence for glymur

This commit adds the VPU v3.6 power-on, power-off, and hardware-mode
operations for the dual-vcodec Glymur platform.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/medi=
a/platform/qcom/iris/iris_vpu3x.c
> index e1822b0ba4baf..4c591538ed82c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c

[ ... ]

> @@ -221,6 +221,119 @@ static void iris_vpu35_power_off_hw(struct iris_cor=
e *core)
>  	iris_vpu33_power_off_hardware(core);
>  }
> =20
> +static void iris_vpu36_power_off_vcodec(struct iris_core *core, u32 core=
_id)
> +{

[ ... ]

> +	do {
> +		writel(power_down_prep[core_id], core->reg_base + AON_WRAPPER_MVP_NOC_=
LPI_CONTROL);
> +		usleep_range(15, 20);
> +		value =3D readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
> +
> +		handshake_done =3D value & lpi_status_done[core_id];
> +		handshake_busy =3D value & (lpi_status_deny[core_id] | lpi_status_acti=
ve[core_id]);
> +
> +		if (handshake_done || !handshake_busy)
> +			break;
> +
> +		writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +		usleep_range(15, 20);
> +	} while (++count < 1000);
> +
> +	readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
> +			   value, value & lpi_status_done[core_id], 200, 2000);
> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +	writel(bridge_sw_reset[core_id] | bridge_hw_reset[core_id],
> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);

[Severity: Medium]
Should iris_vpu36_power_off_vcodec() check the return value of
readl_poll_timeout() on AON_WRAPPER_MVP_NOC_LPI_STATUS and jump to
disable_power on timeout, matching the DMA_NOC_IDLE poll earlier in this
function and iris_vpu33_power_off_hardware()?

If the NoC LPI handshake times out without asserting
lpi_status_done[core_id], ignoring the error clears
AON_WRAPPER_MVP_NOC_LPI_CONTROL and asserts CPU_CS_AHB_BRIDGE_SYNC_RESET
while the NoC handshake is still incomplete, which can hang the bus.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-glymur-v12=
-0-5c34dfd73fc2@oss.qualcomm.com?part=3D4
