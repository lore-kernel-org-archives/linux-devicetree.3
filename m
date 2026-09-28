Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9BD38B14B
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 12:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598501; cv=none; b=Sgjzn+JatFxcyNvBUG0drfkfNmnXygOiaj7zcJN8aDBhlM1ur2AY/BNirMebED8rynaCJIXAhXJSknn7BSnlIk7zZFWoX7up1B9Qwn54Ror1ZP01vo5yJwYDW0WTwQDhWsrCtxIdkn1PyFREO4M9ZnxmEH0fwbrRIJTlOh7RBD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598501; c=relaxed/simple;
	bh=RzI+lYBnSg9uxTWwxsPcc5qUoLFVRCk1FuW4TnYBzb4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQlgB+obr2jPON+wnLXbk1e1CYTsFJpPWTngeizo97Ek3/gEnRVbXYwRlBcozaUZZ/N/AtaRv62qbo3CutgoVqDYLdr/hl+HAmSt/KFtQxzOEICuUqa6OoZaT0q+/jZjNAgHP9EzWlsoL3HfL8F1pDzJuoONhfiZI3rQUardVeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H33rHdQU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H33rHdQU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9523B1F00893
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 12:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790598500;
	bh=18zZ4w67xPFAyx/AwnVltR5Mq+7FjXQv1vEOTQN2L80=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=H33rHdQUEt9NvgwF1WUutCLGdZlShyfrHCpF8CNGSU9xotje2R1DhNZxNMdb1T7u6
	 boGZCg1F6vcRZzHRcDketdk8gfo3Gf0asA5b++2vPIegzLdt92FCw0e3RFCApsitCi
	 256d0y60Fc1oX9k7AfZS5drmiWNfNQuKzcD0DlJTlIirShdwae2murdbLKRRggfYKZ
	 JFzw3WSXfQLcyT8LWU6gcqd9/k/82OpRZwFyo5ovgocL6wgHYClTnbJxGWjxrnpDbV
	 rA19h2T7xzTjMDeGieWk8xx+SK1y9RigbS1V8A20XIJ2dwZIoGFo7B3PwrqzbcLpHV
	 cLEitLfOztP+Q==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a60ed65bc8so25258571fa.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 05:28:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw0CQCtQusui+YPt+S3/+0zHsRbpOg3Ov25WPIvuvAQ9MJ7L932++HE9WgqDn/+aYfTUYVpAnDkKVYs@vger.kernel.org
X-Gm-Message-State: AFq9FYIgg/IIAMZgKAKsmxZEzs04O011V4hgtmGyFiL9G0prmpYbSk9p
	nYyBJbr0DDHK6tf/PnVpSKHtXjvt9yVK7zPDxY/9tS2HO7wPlS/T0GksrEz93XDybfThNxpBkbm
	v67TF1gEfqWMVEclZpfxNEMFjh0gH7hP2qCnKeluuoQ==
X-Received: by 2002:a05:651c:2214:b0:3a6:60e0:baf with SMTP id
 38308e7fff4ca-3a660e01006mr14151621fa.23.1790598499331; Mon, 28 Sep 2026
 05:28:19 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 08:28:18 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 08:28:18 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260923-upstream-tda54-gpio-v1-1-d1a0a199c836@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-upstream-tda54-gpio-v1-0-d1a0a199c836@ti.com> <20260923-upstream-tda54-gpio-v1-1-d1a0a199c836@ti.com>
Date: Mon, 28 Sep 2026 08:28:18 -0400
X-Gmail-Original-Message-ID: <CAMRc=MezO+9L9mepev-ALuk4qjqTOPTGj+odn-8=MbN_9osVzQ@mail.gmail.com>
X-Gm-Features: AclHuK-1coS2iHzWVwKTF6Xd6k62FlfAI_kmaUqeI63pyJfGvXQpAqoQ2bx1pNY
Message-ID: <CAMRc=MezO+9L9mepev-ALuk4qjqTOPTGj+odn-8=MbN_9osVzQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: gpio-davinci: Add the tda54 support
To: Aniket Limaye <a-limaye@ti.com>
Cc: Keerthy <j-keerthy@ti.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, vigneshr@ti.com, 
	u-kumar1@ti.com, nm@ti.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Sep 2026 14:56:44 +0200, Aniket Limaye <a-limaye@ti.com> said:
> New version of GPIO IP used in TDA54 SoCs adds support for level-triggered
> interrupts via extended registers.
> Add the device binding for ti,tda54-gpio.
>

Nit: Does the new feature really matter for the binding if it doesn't warrant
any changes in properties?

Bart

> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-davinci.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> index 1434d08f8b74..02b6b9a436a6 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> @@ -18,6 +18,7 @@ properties:
>                - ti,am654-gpio
>                - ti,j721e-gpio
>                - ti,am64-gpio
> +              - ti,tda54-gpio
>            - const: ti,keystone-gpio
>
>        - items:
>
> --
> 2.53.0
>
>
