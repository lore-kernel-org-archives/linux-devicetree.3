Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371952;
	b=P5UfgvANL/WpNHKUBJxSmzzy6GiQaR3LdtucgQZ+Erx+K2HlDrN92sfjHOph1Z1jkATD
	 F1DY5Ep5596E4lh3QZzV01p/4/X2jB2IqU/feDvQxAWHGkHfOg25tV9EnnYmdzrPWlwjl
	 gNz/Cb7YDI+i8bs56kt8oK8gMxzo4y8sPfYREL5tz2wb2/u+ObQCHp28C7oVtZWn/I2v9
	 LIM1AB1RuObJKuW2Lj+zNLFF85SHTIDnjY7GRx5d0E1/v2hRuohlb64P27uKVLQ9Vkn5f
	 evrMT2ubYyA7lILw9OPfLRzGAf8AcvTOrTlmXKXNj3nfE0bdWUFnfIjN4dhIXuxcKJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371952;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=l9CfgsFXDwrrEwwpmeKXg+KOAvu1yqasIfQl+WG4JYU=;
	b=a9fHA6h5TgBAdDBCPnlgOj65lR3oEn3jTpKxggB4K8Rg6LI7fnrlqm0DzbtLZ0CtxFVW
	 5494A6OfVx7F2Ezw8bE4PUx4A1c7CkA9bY5S/d+m8Ffl6WaSDCE44ze63Hx89bfkyoart
	 q2YeylnZUmuxwqIKieXUhPI/4Jq9clbh3/JdOqysg2U2FXnbzhncVVR+sr7NTv3IEU1fm
	 smZAu37B4tKf7MVJv/S3qeHtoUlQX5/HHgYeC8Qd1yic4ZZZsNnBxWpCpy9h60oHVbmoU
	 VJ847kl1+pPO84BmC+wy1sleYiOpti8RLSFGFQQexk+j0SWyI613HSRV50khAsJEe5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LGc/9FGB";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA7A606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LGc/9FGB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D031F000C6
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795371951;
	bh=l9CfgsFXDwrrEwwpmeKXg+KOAvu1yqasIfQl+WG4JYU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LGc/9FGBPBQZUvNmnpW9aoAV8DRN4f++L4BqYc5ofUu3imrsycqXZMRcVEBlOftP4
	 vqUSv2ddiGT8RF7fySiPJY4OCXr+N9UBJewMpLaZV5PW/2ggNoZZFKTFBjOTYnyc7D
	 79wisqxD9VZDky1SD0clVI6y5/AKpoUdxmnLf4iXtYiyRraYk8SLRMeqRC1C15AJVs
	 5Z6mvSNeDKCG3CdgJt7EnNrcGIaG5B5PNHiDeR/dULP6ZZ2SypagrvzPfAq0QfmVqy
	 mRjtpd8gKMvNXE4FMqpuahcZlvUqm9DGbYBFVGmqKSasaJSjjMyFMHHe1TGuiDCKU3
	 xZXITtGy+mlxQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c1c0c8d61aso1541272e87.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 10:25:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFMk16U0ZCcjemMHLRbGM714dKhJBlT8FlD5Qg4bEVNIZvVcnx4g8wAb5r+uqdLBplvuVlPcoPmmNPu@vger.kernel.org
X-Gm-Message-State: APuU4Z94y6apTG/z/HxX1s6XU5FoZ1wVQ8eedtmuFv2+uDShUOcUDiSn
	/KAufSnvQTDuF3IGYgBBHwtIB5X3U+CoFVTQp+Mkne6qy6NR6sGx1TZlVNmtB14Zy2GIFZUdwUf
	xjKIjvadkqMGRPyTi1yIWY87CMr8WXw8=
X-Received: by 2002:a05:6512:6d2:b0:5c0:d9e2:f66 with SMTP id
 2adb3069b0e04-5c1bc7b4301mr2437293e87.20.1795371950328; Sun, 22 Nov 2026
 10:25:50 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-cs75xx-gpio-v6-0-37aeda0aaedd@gmail.com> <20261119-cs75xx-gpio-v6-1-37aeda0aaedd@gmail.com>
In-Reply-To: <20261119-cs75xx-gpio-v6-1-37aeda0aaedd@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Nov 2026 19:25:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLkbKaRW8J-ZRxkrM5SX0-7eZPu=C_5OLCGquYOtWU4TOg@mail.gmail.com>
X-Gm-Features: Aa3M54rbItLFWFNiExC6gKouuAtPmZpVlhpXK-hpWeRjgFU7aqgZIJC1n_xCbCk
Message-ID: <CAD++jLkbKaRW8J-ZRxkrM5SX0-7eZPu=C_5OLCGquYOtWU4TOg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: gpio: Add Cortina Systems CS7542 GPIO controller
To: filipp.dunsky@gmail.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 4:09=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> The Cortina Systems CS75xx SoCs have five banks of 32 GPIO lines. Each
> pin is shared between a GPIO line and a peripheral function; the pin
> mux lives in the global control block and is not described here.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
