Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814510;
	b=HNH+i3eg+Pqecs+/s4wsyFbhQKknhxZf4R2u1yLhcF4v5mFTzHoICUJN+f4v24hsCVGi
	 uAShxpVuA2BRoEmRlAdOFyuV0eX6WofhPkXtDr6fXep3urCdlt/EEhCAJKsLQWZmAmZVq
	 jLf2jcCB5YnzwzyZD9zNnGOJESAwBLqFwAbmjiWop+SSJFfT0OXro/uYTkzlNI3Prn7wj
	 th8ADtW6ZKuPCrf+81xKeovy0rYUm4BEQn/51s3HbODDkW7MDugDdcP4SduLn6rdKyR4y
	 GU+re5PgwbHndCdzYCT8eQFbFglF7YCjcS85KsVghlndiiEE2q8Q8QfUuIgoMZ3nWwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814510;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kzgMA+BoNh4318PKmzU8+96/GQlJJW72mLpVm0a/udo=;
	b=OiqZxCevPk+em806yzvnjMf5rUKG6yrZgwlq/UYI5s+w4NbV7RX9i+nSTpJe9P3Fpgr0
	 5Yqhq10QnepuW+/tnvchPbJ2sz9K2/kDg/lzGnbYnFoRu3jf4maIbasUGTQmbHGQXM/V4
	 P4ktbNk+N9HNXZHkaA0YCEEsbSbaBORCRg86vCl+7kmLZ9FUMDhjk5e8Yu36gQ/JAWYWX
	 +kd+GvvKFb/3um2rWmTEBTpmxbfjbx7wrp9JYouzBQTBUsLhveNxO7BLic8E9sCycES/1
	 xw3jCT7qKBO/g8ull3uj+IskXlWJSxYgeNS5HpVXycw//eHfy7Tv2RduU9tr/zrCVsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m1FBb6np;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30466606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m1FBb6np
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF091F000C4;
	Mon, 16 Nov 2026 07:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814509;
	bh=kzgMA+BoNh4318PKmzU8+96/GQlJJW72mLpVm0a/udo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m1FBb6npvaFzOvnmRk245ktUDhZ440KJOyl1Ry0DbLBKcCWx+VqccPCJt4AsU0MII
	 Ppe+iaPOgeaVNknk7F3+569+ZcCqvOEHeljYoEgnG0+EwW6Ut8MlXdT+zYubPfecG1
	 rN6Sn/gGem9R7+I2zIll9Mn5Q5tzJKD1q2/CfPeojCGUJWELvtOMJ/wfpY7mZbs7b+
	 XTSJ17g5/0sYGjxawuExyDw7R6tmVpoXoyusXWYwyBus7CleDG9wvtYor19n5qQLsc
	 8Ru9zfDihMdKRrpFJPwU4eFCT38orUgqurDlOrN7X5FSpF3KoQZsefrexCKU2sF/tw
	 jmvWqZQ6aqeBA==
Message-ID: <sashiko-outbox-216440@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH wireless-next v5 1/4] dt-bindings: net: wireless: Add
 AIC8800D80 SDIO Wi-Fi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yanli Yang" <yanli.yang@bedmex.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <179481380235.4.9476425206200425967@bedmex.com>
References: <179481380235.4.7388336477392853157@bedmex.com>
 <179481380235.4.9476425206200425967@bedmex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 07:35:07 +0000
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
- [Low] dt-bindings: net: wireless: duplicate GPIO pin in aic8800d80
  example
--

commit b667af697cde7fb1ec4d5589a84fc742a4bcc924
Author: Zhirun Liu <zhirunliu@aicsemi.com>

dt-bindings: net: wireless: Add AIC8800D80 SDIO Wi-Fi

This commit adds the Device Tree binding schema for the AICSemi AIC8800D80
and AIC8800D80N SDIO Wi-Fi function and registers the aicsemi vendor prefix.

> diff --git a/Documentation/devicetree/bindings/net/wireless/aicsemi,aic88=
00d80-fmac.yaml b/Documentation/devicetree/bindings/net/wireless/aicsemi,ai=
c8800d80-fmac.yaml
> new file mode 100644
> index 0000000000000..f9ad3cd6e07cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/aicsemi,aic8800d80-f=
mac.yaml
> @@ -0,0 +1,78 @@

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    mmc {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        wifi@1 {
> +            compatible =3D "aicsemi,aic8800d80-fmac";
> +            reg =3D <1>;
> +            interrupt-parent =3D <&gpio1>;
> +            interrupts =3D <18 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names =3D "host-wakeup";
> +            device-wakeup-gpios =3D <&gpio1 18 GPIO_ACTIVE_HIGH>;
> +        };
> +    };

[Severity: Low]
Should interrupts and device-wakeup-gpios use two different pins on gpio1
in this example?  Here the WIFI_WAKE_HOST input interrupt and the
HOST_WAKE_WIFI output GPIO are both assigned to pin 18 on gpio1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179481380235.4.7388=
336477392853157@bedmex.com?part=3D1
