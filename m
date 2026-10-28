Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180837;
	b=UuleOA9ncBhqN8uDfc6gTwW1oOe127o4BlQR2TxIn8k0TkY1os/Mn70pb0APCFgDooU8
	 yHBRSNNxATJZpvAUCjUo4L41/kSRuqnfgUh3dUSCLW/fUUgl6J5CLXmuHETEhBv+E/ZtZ
	 rZc9DAM2LvvT8ZADU/pzBkvcQnH7CQwlhWuKmXmXu8KUJMttUvQEfY6csnq0mKF28/7L6
	 2LEiswziBQRr4x/Sf9bV/MPY5hUYE1BpE+/93MqeljVM6XVh46mDTal5ZGOOu+VkecC6y
	 ksyhTw2eDLpsC/fu7o0NkAeRXJp3mEpAJfolvj+QT9FHEGHtvE7SjTkfvuX2Xr5s7ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180837;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=WusbLHVsIxfQC7Yt912VgHXMTR66ioRkw44xspu0Cqw=;
	b=OW1cJuNSX1bKexoOnEO6e64g+ctNe54R1zh1EEOGVd8UPZigL6o+9sdoYkn7qPKxl3J0
	 zN4FrRz+y7+zDhvJjF442sPxB8MPxCwDKfjGoWgp+lg+gA/3FNXPW5qLC4Jksd7cqKrbM
	 0na2MSNgv1B5FIxS08nH7yln7G5Luk+06fNXCZGGCFjLup5XqGkgocWr9U7hgnA3NGlmy
	 0EI5w2LuAica3C5VQglFxdEFR0Uy0l4XMF2ERmLHFNGX7ArGKgt3/KEVCuOUqENdN9hCd
	 v1/8ynZkYGu060w0zM9ollKNR1B3ngONqNIE/RMvE3tW4LcRRMTLPDG5yPsnIChJIqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="EaQ/uJCb";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AE9606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EaQ/uJCb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2FED1F031E1
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793180836;
	bh=WusbLHVsIxfQC7Yt912VgHXMTR66ioRkw44xspu0Cqw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=EaQ/uJCbnWPXlHtr5OchiT406Hq3ckTH12cvHcaO0eg76LUu6zZYqp2I+ZblwuK4G
	 2y9GB87LiAGcjLyDz+TAXxojKPvNn5cDnX7AX2KtBg/52nk5plIi3MZbZSNZaqzdgl
	 hwDgZtycuoKdchx4iyzhEccJvEpOXakE/BG6yAH/P160raDXwi35gICZofQ12jklux
	 DvT3GhUW2o4PI8rImduLewy47S8RuBZJRK2O9JWLVli3KMV1c+64q9bhsc0pP0NxSs
	 S2SL6kIjUXCPkKwg6yLinabNr0PR4vgOsQ/eyT/5tVkecqDyEe559M1V/3/3l2W8PD
	 IOZ3Lk20BwfNQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso5808601fa.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 02:47:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzLMe8Z50+Lfk8kcJKabLQQR92oVtg0Tqs4sQcU2MDeTehWKxpG5m+aCIizyrBsoRQRWQS4fCwZYHCK@vger.kernel.org
X-Gm-Message-State: AFq9FYJvllE/hxvdCOIHBP7oNd9Ywelz7ZaBULcf7at3adnfQ0nH5Ece
	BWHbCKSn5s+La4XX6ee/lvLRycFMkHG5wGDKiaOUeqZ7+IkBLX3z8cloBe2bhxHUPabvaPKaLPi
	JXwGIiv7W7t2FleXkqJBIzRlXzPq3V1+zgSHU2GlJ6w==
X-Received: by 2002:a05:651c:210e:b0:3a7:69bd:80ad with SMTP id
 38308e7fff4ca-3ac9cf74f2bmr4236611fa.6.1793180835578; Wed, 28 Oct 2026
 02:47:15 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:47:13 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:47:13 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <528b079a19bd4043754bfb56db8e5950bdda62f6.1792776697.git.geert+renesas@glider.be>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <528b079a19bd4043754bfb56db8e5950bdda62f6.1792776697.git.geert+renesas@glider.be>
Date: Wed, 28 Oct 2026 02:47:13 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdH37DhKMtagN3Ua1doY7ZgD3f+ok3V+h86kb4J8-dtQQ@mail.gmail.com>
X-Gm-Features: AclHuK_iGosVAQO6GwGuzhCeB4_YYSDAdlMHAhkY-OLVFYNCMrxDS4lJ3KzFIGQ
Message-ID: <CAMRc=MdH37DhKMtagN3Ua1doY7ZgD3f+ok3V+h86kb4J8-dtQQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] gpio: rcar: Convert to gpiochip_generic_{request,free}()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Oct 2026 19:50:39 +0200, Geert Uytterhoeven
<geert+renesas@glider.be> said:
> When a gpio device node has no gpio-ranges property,
> pinctrl_gpio_request() returns -EPROBE_DEFER and its GPIOs are unusable.
>
> Restore the ability to use GPIOs before pin control support is added by
> using the gpiolib helpers instead, which cater for this use case.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

This sound like a fix? Can you add the Fixes tag? Is this patch independent
from the rest?

Bart
