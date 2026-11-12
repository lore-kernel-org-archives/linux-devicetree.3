Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496536;
	b=F5iq/dG/gYqxDh9x/u/3M/DHIyxYCziyD6KT5znS/V5U2xdhNEjjo4/j3XRx2b/sOM0Z
	 90CROmkEL8fL/2Dlx/lowWfDeSDlbAmU4XiF45Jqfr8e+1kVRhBNHKWGbdMnzx8fMFUY0
	 GW+CZKCTEPTnLJ6bGfWXpQrc+MVlgF6ztOgziSbSGpgF5xfpXpBsYpm5iqQUXSY52JVYQ
	 XYZ4cysdgHWmvYYx+DCEHTt6hz/wKGTHuXMxMVv+F1oRaPg9pLUrLR9UCJCz8dnRx+IiJ
	 OzdA87A8WD1NfSCneoKinGV13vA1KA23a0OSlAOYYNOfhEKcIpUEZoT3Kmr/8OF1H/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496536;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=58Mz0t/hlLLuiZeWpE0SHkeJJdrm5aAjKDDahhhZu60=;
	b=KVs3pSiJ8JnYuLh/VZEHpLjnfEq96Gow7iB9We6HiL2JN/M04XorhyjaSJW2NlQqPaZ4
	 p+2YNQgNisMeLAqbTww2OO6WtUmbbRGCnyWbfvcVS+mBuwsls0m87GqvdX65PEpemsHSB
	 YwEDrWlJGOi0lX+Gul7rwbpFjHmoSxU+0NOQ5Y+5GvPmbrUhTi6XuwL7sIPHgiEmQ8XJY
	 QHA/b5HePajnfFaDNbFHeSq8kOjEt55gcwenpJZGojgra1fPs9a9SfEaHbA4VHUDJNrYl
	 Qz3e9VS63mQKwK6O1XjSsBH/7uKzzOgN0YaUW2g8zgqm51igHiDBuqqiSgoYgU9VRww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ERZ170QQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCE9606A338
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ERZ170QQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C5D1F000C2;
	Thu, 12 Nov 2026 15:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794496536;
	bh=58Mz0t/hlLLuiZeWpE0SHkeJJdrm5aAjKDDahhhZu60=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ERZ170QQOLV6LMyM+wGYGGkxa2sHB63VUjS329eQ3viUwnqbqoGebMZQj5pgfmG9Z
	 /QshVXBegAj4XkYbVeMJvrIe3vSAmjHgVC+K+7Wj6gFCQ8NLX4W7E1HiGnKn4n75R0
	 L1tw4Y53h3g39OXnqx4EK+nx3+B3oJ10QL3AYUVuaUmyHD7bpbPXmOQ+Y5Ut9GFr3H
	 /JloEVLSO7TCcBLcaovMG3mHUXRAdwy3fYxO3HrZCog8vXmGWcishz2vmf8AFrDPy1
	 4DRUH9XtWCy8tOSKZOP1lWArFDqMry2lpGTih1lOHMDPzuWRmCfC4f99hw6BJK1U3H
	 GQB+VGT8JecxA==
Message-ID: <sashiko-outbox-211417@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: display: panel: Make DSI panels port
 optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261112150650.137216-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261112150650.137216-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 15:15:35 +0000
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
- [Low] dt-bindings: display: panel: ilitek,ili9806e: port made optional
  for SPI panel
--

commit bcf90e9f5f8315b117fe2401d0e209382d33f585
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: display: panel: Make DSI panels port optional

This commit removes the port property from the required list in several
DSI display panel Device Tree binding schemas so that panels placed
directly under a DSI bus node do not require an OF graph port.

> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili98=
06e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.=
yaml
> index 2080d9e0ffac4..9a2602ddd9060 100644
> --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
> @@ -33,7 +33,6 @@ required:
>    - vdd-supply
>    - reset-gpios
>    - backlight
> -  - port
> =20
>  if:
>    properties:

[Severity: Low]
Should port remain required in the conditional then branch for
rocktech,rk050hr345-ct106a?

While densitron,dmt028vghmcmi-1d and ortustech,com35h3p70ulc are MIPI-DSI
panels, rocktech,rk050hr345-ct106a is an SPI-controlled DPI/RGB panel
(registered with DRM_MODE_CONNECTOR_DPI in ili9806e_spi_probe()).  Because
its node sits under an SPI controller rather than a DSI host, the RGB
display controller still needs the OF graph port to link to the panel.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112150650.1372=
16-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1
