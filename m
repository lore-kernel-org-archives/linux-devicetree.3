Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F8F4854E8
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782479; cv=none; b=bKFwzttKOQNGDlzuFGR+WUlKW/ZaRiLlM5CNOccZ2kfbmMpRxrixyPqKxJPHLjx0bTbZDJpn3vnFWZDG5uepGOOozOw1W7DqbBpXsMkhk+T13Hy1ok6VfqLLWzurwJwKFOLFxnrKsco6rlUkNfsGilSU2oPTC1oXr0QKKB+wYwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782479; c=relaxed/simple;
	bh=2KuBlj7IGUhN47/aYl/GFhCkQ4m0rqlfetEf7bv+hkg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gVsSL9QFTe1YvtyRmIN+nNkKSq9tj1eqAx1wCu1xwh92Q0S/X/LmQK21bYq5KjaevQyQhzJAXHTyWqQ7JQDh1Z8zV37FMbnWTsovCY4aKtcX+HiI3TEpdwWy0tUZQnlvxMrMQ6E/soU0ggtKe8uLumYb6E7nolyZkYu97h2JbI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+Kz8fQB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+Kz8fQB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8803F1F00A3A;
	Mon,  7 Sep 2026 12:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788782477;
	bh=B2+CX1iKeAvs4jZi/vkpnwJAkSMw0fBzKnVpJRb9tmE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i+Kz8fQBJA3oPpjd6dZp56m4HhBJilmuZuSpwXWm1codPZ6l5Jfz06kuTmjM4bq2y
	 kcV4R/yKqP+LckVnIet8+5g8Hj93D4qnupItVU3yQ3HUvtVZo/QOhSEEGDuhp2T4+v
	 CDvs8uAdQ+0/F/4UB8p8LVVM0TuZZmRu3hLSg7iHPp0C14lFKl82A5EOQgQROUYni9
	 97yMDiTKKbUTg5+A4WkdZ/AQScjeRrhOimLPqFwqWK5SiH4+HZYs3OGmLrBiae1qgQ
	 2BwLmN2ERu8xcVcUExo2FBGIH2atytRzJZAuPxenN+aKgOcBGpOjn6h1FqYd8cil4V
	 tkhBTTNUGWJmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Samsung AMS662ZS01
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vsevolod Nevorotov" <sevanevorotov29@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260907115130.95394-2-sevanevorotov29@gmail.com>
References: <20260907115130.95394-1-sevanevorotov29@gmail.com>
 <20260907115130.95394-2-sevanevorotov29@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 12:01:17 +0000
Message-Id: <20260907120117.8803F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The binding introduces a custom `vout-gpios` property instead of us=
ing a standard property or a regulator node.
- [Low] The device tree example assigns the exact same active pinctrl state=
 to both the default and sleep states.
--

commit 35f05d4d7ea0faa656ae9f5edd021117b1b534c6
Author: Vsevolod Nevorotov <sevanevorotov29@gmail.com>

dt-bindings: display: panel: Add Samsung AMS662ZS01

Add Device Tree binding documentation for the Samsung AMS662ZS01
FHD+ AMOLED DSI panel found in the OnePlus 9RT smartphone.

> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams6=
62zs01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams66=
2zs01.yaml
> new file mode 100644
> index 0000000000000..b2697d140edef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,ams662zs01.=
yaml
[ ... ]
> +  reset-gpios:
> +    maxItems: 1
> +
> +  vout-gpios:
> +    maxItems: 1
> +    description: Panel VOUT enable GPIO line

[Severity: Low]
Is a custom vout-gpios property required here?

Using custom GPIO properties for standard panel functionality like power
enabling fragments the device tree ABI and prevents the use of generic
driver infrastructure.

Could this be modeled with standard paradigms instead, such as
enable-gpios or a regulator-fixed node?

> +
> +  vddio-supply:
> +    description: 1.8V I/O power supply
[ ... ]
> +            vddio-supply =3D <&vreg_l12c_1p8>;
> +            vdd-supply =3D <&vreg_l13c_3p0>;
> +
> +            pinctrl-names =3D "default", "sleep";
> +            pinctrl-0 =3D <&mdp_vsync_active>;
> +            pinctrl-1 =3D <&mdp_vsync_active>;

[Severity: Low]
Should the sleep state use a different pin configuration?

The example assigns the exact same active pinctrl state (&mdp_vsync_active)=
 to
both the default and sleep states.

Since device tree examples are frequently copied verbatim into production
device trees by developers, using the active pin configuration for the
sleep state defeats power management and can lead to increased power
leakage during system suspend.

> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint =3D <&mdss_dsi0_out>;
> +                };
> +            };
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907115130.9539=
4-1-sevanevorotov29@gmail.com?part=3D1
