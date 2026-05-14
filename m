Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C461EA7F4
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731521; cv=none; b=kSxioeNIqXUSnch83a3H5xAVX8sLPsgkzyajG3f0FmxvGkaPyrB7lYpoqst2oMqVTcfDIJCG7HaLFiq1ez89KojHpvjT4yYH9h0skObmyDYWXVxPbd96/jwHVP3aIV57aidFt9UToQ7ZUhksvuuzVaYYyNh8wdtzUHvXlpULJtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731521; c=relaxed/simple;
	bh=Pq6GcboP2d7eR1Q9seH0i7Hx6J56CwxChCqzDR1v7vU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tpyMctIXmG6iqsy3dKFGLzzBAiUt0ekx/+A7ZEl/2Lve9q5dNsxNnzdx0rQDOntxgInxEHzvqOPb+N8mas0TDu45w/M5FRrP254PtbFV+klB/Evr9/pTvol99pC2xKwz5zBF6AY9ChGbAkfTUlk+7AVNpwH2lgk58YwVoKTRZ44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXSpg9bM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXSpg9bM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF16C2BCB7;
	Thu, 14 May 2026 04:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778731520;
	bh=Pq6GcboP2d7eR1Q9seH0i7Hx6J56CwxChCqzDR1v7vU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UXSpg9bMr9b+LxyiKmuGgbKrvcJHVbPAzSMznl37ggmjUvdq/zAnLPZM0mBk0T7kV
	 OOQyOAFkcBJAW3AbC0sN70tThgprpCe6jeZ4ZtSbxgoZ4vSzWKtwemKztHakQml8zG
	 WvBPYSko6CNec1WYKRu8q5yX2qFpjhU48sSgKXqpauiXOxgYXLdiv077poq9ymS0oG
	 qTJNCmTsD9DTC3xJj498I9+xWtQd5EdLCTXyR8hzLOgLgpgvwrDMAM0/xpV4htCLnW
	 nbok7PIzhgCNxLV53yMhtJImPCxGufDY3d96WKkoz7D4bl8N8dIWC0Hb9rmLxKoutp
	 42kuAB/ey/2TA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: amlogic: t7: khadas-vim4: add
 PWM-driven status LED
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau via B4 Relay" <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, krzk+dt@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260513-add-kvim4-sysled-v2-3-3ec9779e8875@aliel.fr>
References: <20260513-add-kvim4-sysled-v2-3-3ec9779e8875@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 04:05:19 +0000
Message-Id: <20260514040520.5FF16C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The subnode for the LED under `pwm-leds` is named `status`, which v=
iolates the `leds-pwm` device tree binding schema.
--

commit fa7913b140af3e7d64c22b109d1765f504180ad0
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

arm64: dts: amlogic: t7: khadas-vim4: add PWM-driven status LED

This commit enables the pwm_ao_cd controller and adds a pwm-leds node with a
heartbeat trigger to expose the status LED on the VIM4 board.

> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dt=
s b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -53,6 +53,16 @@ dc_in: regulator-dc-in {
>  		regulator-always-on;
>  	};
> =20
> +	pwm-leds {
> +		compatible =3D "pwm-leds";
> +
> +		status {

Does this subnode name trigger a device tree schema validation error?

The leds-pwm binding schema in
Documentation/devicetree/bindings/leds/leds-pwm.yaml specifies
additionalProperties: false and expects child node names to match the
regular expression ^led(-[0-9a-f]+)?$.

Using status as a node name is also confusing since it is commonly used as a
standard device tree property.

Should this be renamed to something like led-status or led-0 to comply with
the schema?

> +			linux,default-trigger=3D"heartbeat";
> +			max-brightness =3D <255>;
> +			pwms =3D <&pwm_ao_cd 0 30040 0>;
> +		};
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-add-kvim4-=
sysled-v2-0-3ec9779e8875@aliel.fr?part=3D3
