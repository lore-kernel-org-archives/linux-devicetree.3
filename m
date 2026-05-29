Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B941B25333F
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 13:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063133; cv=none; b=Klq+fReKJM24XZ3KbOaGgErySCk02eVJMeHpfVpytP+Jztia9oebDQf05bCbVujPfYmkKE2792x4R2RN6//rl3XR6+HATP2ah4MZKGVGyKpY2aNAiUxtZbCW1/Qm/cQBc6I5lcn8/YkV+IOV4TvkKRmjQSbqb17cMaSTCspZB90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063133; c=relaxed/simple;
	bh=zHxaAfZN6iyilagqBj0YYfBBThFE+h4Qnawj8MQakXQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P0ZMenU4nQaQRttXxI825+/tn55JSIyaRUEBeoO72ncRp9rVQHgftMKsvj3sLsmE/IOhg9d+zuFw6gMY98AXZOIvD/qbaC2BfZTvfgu+HCgVKwYVdpbAjH056fVuy/obJqY2AzArLM2NZL7eIyEbaQoJm9THE1R5C0TItDTs6Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULCmcRum; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULCmcRum"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F251F00893;
	Fri, 29 May 2026 13:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780063132;
	bh=dczUpHlKVE8JbbQuy+TsuU+xIT6ZwQJIMkiTWAko1zE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ULCmcRumhWLGgrT03f+m37yFlzQ9rdcawDm4fOvb9j858vcpEx/s/RpsRSPc7+f0I
	 wk/pLVrkcCFTHRHPvSVgBmsX9Uz9JLa64cv5EPQOJW+HKxb3GwHnZ8HxkvRHmV5EsZ
	 dYOgiRckBO1BaeYMrpjXyWrrkCNMcvtQm9kvZ3JBHXxQmJjSw032RTcnn9PBRKo+ur
	 qB5YVHzvTTIXSOow+eKkV7/UA1HQ9UmUlMyxb4JNcSx8AAtJ6e9txLbfkhgDBhQMNC
	 qa0t+uf8vkg44oTNmoRar9rnVNvuvztEWrz2NFKcJt2jCsMiSbuf5tPGIWPSimgpx4
	 U4+9f/T1wEMTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 4/7] arm64: dts: ti: k3-am69-aquila: Add Toradex
 Capacitive Touch Display 7" DSI with adapter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vitor Soares" <ivitro@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260529120853.636015-13-ivitro@gmail.com>
References: <20260529120853.636015-13-ivitro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 13:58:51 +0000
Message-Id: <20260529135852.43F251F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Undocumented compatible string and vendor prefix for 'riverdi'
--

commit 1ed674eebe23fa54174222cfe24295de9c767b11
Author: Vitor Soares <vitor.soares@toradex.com>

arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display 7" DSI=
 with adapter
   =20
This commit adds a device tree overlay for the Toradex Capacitive Touch
Display 7" DSI used on the Aquila Development Board. It configures the DSI =
to
LVDS bridge, touchscreen interface, and panel timings.
   =20
Link: https://developer.toradex.com/hardware/accessories/displays/capacitiv=
e-touch-display-7inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-displa=
y-adapter

> diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touc=
h-7inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-=
touch-7inch-dsi.dtso
> new file mode 100644
> index 0000000000000..9c8ab35ef673c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-7inch=
-dsi.dtso

[ ... ]

> +&{/} {
> +	backlight_pwm3: backlight-pwm3 {
> +		compatible =3D "pwm-backlight";
> +		brightness-levels =3D <0 45 63 88 119 158 203 255>;
> +		default-brightness-level =3D <4>;
> +		/* Aquila PWM_3_DSI (AQUILA B46) */
> +		pwms =3D <&main_ehrpwm5 0 6666667 0>;
> +	};
> +
> +	panel-lvds-bridge {
> +		compatible =3D "riverdi,rvt70hslnwca0", "panel-lvds";

[Severity: Low]
Is the vendor prefix 'riverdi' missing from vendor-prefixes.yaml?

Should the panel variant 'riverdi,rvt70hslnwca0' also be documented in
panel-lvds.yaml?

Including undocumented compatible strings will cause dtbs_check to fail with
schema validation errors.

> +		backlight =3D <&backlight_pwm3>;
> +		data-mapping =3D "vesa-24";
> +		height-mm =3D <86>;
> +		width-mm =3D <154>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529120853.6360=
15-9-ivitro@gmail.com?part=3D4
