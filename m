Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D083793DC
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 18:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780942365; cv=none; b=MAHnvXqj8nDh2ei1/cXaP1FtrXdOvjZ4ntZ2POPminEhWlm6S9Y7LbwIZvj/KWx3W1VwUoOxenZJRqpwR+tWWlan/MZXywbvCUasLbdXDDMgwRPyTRgeO/+YMykwvz+bcXqX5Wdd/1Q6POI3Dh0G3gfixunr9+SDZ+uf9T2J7dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780942365; c=relaxed/simple;
	bh=I7394MEyoSxd+9fzhwAGhrKgTK9mndcubui0ARoQdLQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qfxa6QWGQ568oPS5yjLuu4IfSNl/5ZLUrzT6//v3hxhE5j7rd7KgdTSWjs2fbbCnmk4FKVxomUb3u4FqUAhUP6m4YwcOES/3yRcgRcTkXBdTgYGkBiv3hIiRh+leIN4/UOhLt1qbm5IZKLV+5QHoOb9fCYu75DpcYOanOEhJlEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ld3DB6Nq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ld3DB6Nq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047CC1F00893;
	Mon,  8 Jun 2026 18:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780942364;
	bh=ityvO1O4HgjlIlC5l4rVZhmLGAUoK58LsHEr6xOeztk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ld3DB6NqaCBZXdt6qFVBZxik3KEU58JedFDrgclIN3hw2X8bKB+xPHB1sawEnTuQM
	 0gA5iTQaQI3Kt21LzLm9orx8SemkE+zrzawwlmTIYbsx3SwveM3G9k8EAvWw4Vg6SM
	 +wrVcj0plW13oH9CujjmUjSkB+uODekZN+jnXjoSjq97ZH+O9pcUauYlPJkwgUGLWO
	 l6vfB8KlYP1PKyG3Qkq0dG1LdwdjFI4gGzO/IZu1zEWT3fNsY8dEe+imCYsNVmmF2Z
	 XfL+lGOXAlHNYo3LVqgrM1w7fNYotLeYoR3mz4DQmofIFF30u6lJ7yGEnI0j4rCd1V
	 A71HBkS1B1jLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V6 6/6] arm64: dts: rockchip: Add Anbernic RG Vita-Pro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260608175521.67449-7-macroalpha82@gmail.com>
References: <20260608175521.67449-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 18:12:43 +0000
Message-Id: <20260608181244.047CC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The SPI joysticks are inaccessible from userspace due to a missing=
 SPI child node.
--

commit 2097a3f0d4026d4220ee53d9f1d7508fedf974d2
Author: Chris Morgan <macromorgan@hotmail.com>

arm64: dts: rockchip: Add Anbernic RG Vita-Pro

This commit adds a device tree for the Anbernic RG Vita-Pro based on the
Rockchip RK3576. It sets up definitions and configurations for various
hardware components like display, buttons, battery, and networking.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts=
 b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
> new file mode 100644
> index 0000000000000..344ba18705338
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
> @@ -0,0 +1,1327 @@

[ ... ]

> +&spi1 {
> +	num-cs =3D <1>;
> +	pinctrl-0 =3D <&spi1m2_pins>, <&spi1m2_csn0>;
> +	status =3D "okay";
> +
> +	/* SPI controlled MCU for joystick and joystick LEDs. */
> +};

[Severity: High]
The commit message mentions "2 Analog joysticks controlled via userspace",
and this comment notes an SPI controlled MCU for the joystick. However,
there is no child node defined under this &spi1 controller.

Without a child node binding to a driver, the SPI core will not instantiate
a logical device, preventing userspace from communicating with the
joysticks. Could a spidev or similar child node be added here to expose the
interface?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608175521.6744=
9-1-macroalpha82@gmail.com?part=3D6
