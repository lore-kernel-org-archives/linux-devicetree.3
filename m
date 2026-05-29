Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F463F1AC3
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 15:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780068252; cv=none; b=CjVfCmJEShuGm5ikg3XqfnwAiwsgeHGGIkD/lqzTGBvFO8pQN7WalC9LgfhaCutjN/HGVXrQRetuUm+ELFAk+tmWhrdoaXsqBKnYduJVP/E5fD/EhugR5SzYUERghLPA/S67Q3Q3yH47ey0gOTY+9b2JzmtsoQVoe+boG/9Fvsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780068252; c=relaxed/simple;
	bh=3uq3gBL5bRU68FRgO7uZgR65VNH+OrpzrJhTI6sf9Gw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GiiYnVtQ4zH8+kRq1zeeIKhO1vTIEp2lk5yhcSblIEhAN4yy37mbvy0FikNA089l8CS83cnEX7/r5XiLNrd5usvd/9xg34VyuIyz71fctqW1EWvd+YxGPwlb9RZVNulT60hL4iWiFHCFYBsXs53tqojnnndXixxXwmAw54Wb5IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tvucf8I3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tvucf8I3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5DD1F00893;
	Fri, 29 May 2026 15:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780068250;
	bh=FycuxqWpn+eA/NJGBczEmMUjoTdd4QFoRXsx0CvG2SY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tvucf8I3HoChxdenoi0VuSmTcflYXLuyyRVr0zqY3xDcl3mcyjkFE+j0F80Iz7BUd
	 HJ06NrkDsXJ4dMEk5FDHU3kS9h8nbenodD/G8h/kKNGxFoxapAX+ER7PlIMQU5sSsi
	 FLKxd2Yu6NsgIaqNCryvP/XWBHac9Izp20DnbU/sZAGFTpPP4xYLDaKkwDRtYFXnxl
	 fmlpC/u4trPCwCR8IFIgFq1Ze9xrOt+TXySp1hdhgMeehyK8q87bn5wchCwWjfSOEe
	 j31Izz/9EVgNFCa5xqF3vjOfRPY02emrLt5woqEKXnz/XIUTgPRkXeM+4x7ipCeegI
	 7sGgmzhsxyJgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 6/7] arm64: dts: ti: k3-am69-aquila: Add Toradex
 Capacitive Touch Display 7" DSI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vitor Soares" <ivitro@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529120853.636015-15-ivitro@gmail.com>
References: <20260529120853.636015-15-ivitro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 15:24:10 +0000
Message-Id: <20260529152410.BF5DD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The PWM controller required for the display backlight is not enabl=
ed in the overlay.
- [Low] The panel node uses an undocumented compatible string and a non-sta=
ndard node name.
--

commit 9407fc282e8f0c8e125332b85c771abdd92f5aff
Author: Vitor Soares <vitor.soares@toradex.com>

arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display 7" DSI

This commit adds a device tree overlay for the Toradex Capacitive Touch
Display 7" DSI on the Aquila DSI_1 interface. It configures the panel,
backlight, touch controller, and the DSI-to-LVDS bridge.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitiv=
e-touch-display-7inch-dsi

> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso
> @@ -0,0 +1,149 @@
[ ... ]
> +&{/} {
> +	backlight_pwm3: backlight-pwm3 {
> +		compatible =3D "pwm-backlight";
> +		brightness-levels =3D <0 45 63 88 119 158 203 255>;
> +		default-brightness-level =3D <4>;
> +		/* Aquila PWM_3_DSI (AQUILA B46) */
> +		pwms =3D <&main_ehrpwm5 0 6666667 0>;
> +	};

[Severity: High]
The main_ehrpwm5 node appears to be disabled by default in the base SoC
device tree and is not enabled in the clover base board file.

Does this overlay need to include a status =3D "okay" override for
main_ehrpwm5? Without it, the pwm-backlight driver may fail to acquire the
PWM channel, leaving the display backlight non-functional.

> +
> +	panel-lvds-bridge {
> +		compatible =3D "riverdi,rvt70hslnwca0", "panel-lvds";

[Severity: Low]
Is the riverdi,rvt70hslnwca0 compatible string documented in the device tree
bindings? Undocumented compatible strings and vendor prefixes typically
trigger validation errors.

Additionally, should the node name be changed to a generic name like panel
instead of panel-lvds-bridge to adhere to the device tree specification?

> +		backlight =3D <&backlight_pwm3>;
> +		data-mapping =3D "vesa-24";
> +		height-mm =3D <86>;
> +		width-mm =3D <154>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529120853.6360=
15-9-ivitro@gmail.com?part=3D6
