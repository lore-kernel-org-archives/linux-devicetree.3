Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802835;
	b=eFMu0nw+pAJzIps1/5Nv2v7DBkzJY7F0pso41bD7E1xUCQl/IEDgNkZJLUZ2jw5nvcu6
	 8QigkEROqKXyAT9LGGaJFd1+CARkabr8W1y49g7+oXdS6IYvJZxD5ZbcUYluBHvhEGpoA
	 F5SY0mVE8weTPSCSDL8xsXCyODsjcS4Re8rKPsvYPEhWPqg/I6hqnveBggELpWWzwA9pF
	 WwlLDvqdjDTYWG/BpQtY2uK74JjaHpo5X4S5DXrX/TW2mgYQArCPCinzxLchq/oUqDIsI
	 SyfqW1QggPKicYsLXiEsyjNlytZrTDoFcwwsjlNnZNzr6DuGnZy5vVcdkwrVhvvwv1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=N4IXqSRG1pwptTB8gRp0YajkwGXGGA4iFphY2Hyaf8U=;
	b=1aHQNTfhPD3Y1VT592kUUZbn3YnJz6n2FdCXl43s256bEscekqo4kI+0SbtIHhzRAuVx
	 pYOlznzFXo+X3BreTETSLU2+oLC6xgm3R4gBdXbqXjS2aeIjBeplTb947qBxp5yIm8SSs
	 FSi+trc69L9oE7UtyFJaf4i8CDqPWJVUeOU2rKCVI9E8+GhHrY3V1vdZBOaPYfNtHOYiI
	 jw4mjvh+IfkqOjkPhVk9nx1vor1cQ+kOK9SnB7nFGHmYlbeRmUnLlY6JlJSKZLyjXDJYx
	 3GVlglbz68xSQ9TaQhNohq66tZJQym6gt7dnrACxVNgcQIQ0pky0fKJRPcWgKntvKPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vV7J3gzr;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ED8606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 18:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5ED8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vV7J3gzr
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-483d290f398so4359421fac.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 10:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802834; x=1796407634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N4IXqSRG1pwptTB8gRp0YajkwGXGGA4iFphY2Hyaf8U=;
        b=vV7J3gzrc2Ynuj6Kl8R/Gqecn+9qYz5vEkrgs4TQJH5XR/fxcZXk6gC6a213kF/wJX
         3KosVliZRBSjj4KdOS8ljP3kxqc01HhnlnZlc6/PfyfzWu1fTt8+bT8S2T0HtIolyM1f
         fEwQRigkIaGkbUyKzBqbeU9X8ZMYZ9WFf7hmBptyYpVyoEvjAdy7ntVqETkF4F95mDBZ
         FLNoJ5HrsVU2gSi/GM31yCkXka5qL0FSKhhHIZvM6ibu/76PpICq7VO/2eT0dO9cGrPX
         /cuI+G45+Ah+BUlLJrwvbQR/lYgbMpZCgE6uOTgUEwCSuDfE8nF0cePmsg51fiqBEvw1
         YodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802834; x=1796407634;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4IXqSRG1pwptTB8gRp0YajkwGXGGA4iFphY2Hyaf8U=;
        b=xjMDA3pCYra0r/3ibdZWraD7cgJzMoXIPBJdBb/z6cwxmCN2muyx5YWLjSdi/Q5q83
         Bl0ouQqPh3Y7jW7BEFXT5m9nARK5p3wgf6O5j8ZkdvhWLO+y/NMQvnu8us8egI9KiuFU
         G556cf7wO6LLkJf+AduJAX5N60lNkt7NAjUKixRVs2lB0hVngr7tf3GXxB7Cvb2fluIi
         3dgZ7pqem1mgN5vm9vcEOROU8cZ2cS6GlHwAGI9F0H8M9GouG1SPMgKeONAChC5QxKD4
         RtWeRuqT2UUbsiDB+sENh2OkaY/+yfD5YBiVsh8dUO8QD+e0p0s6sFgaZrq3eRIOVtWH
         uVbg==
X-Forwarded-Encrypted: i=1; AL+hErHx7feT0slCxPSSu4068UKInwY3e8P7/Zo74lez9VEyWSWD2OMnkZmwc5gcRX3A53IWRblINmQmqWwD@vger.kernel.org
X-Gm-Message-State: APuU4Z8HiQunVi7p+YYP21tznZgok6Ry4penYwF5gTOClFIjCrOkVfoz
	y9p9npsYm6XKKdl1yoQpnSKxZPfo0rOS+GioHYTVwMZPPgHOOR8VfSnr
X-Gm-Gg: AZFdTZfyqT6xGyaKP3+qPjP8pHA0jj1MX5myPaHWV/Xb3u2fFTbhMVrAI5Ag9+zt/dI
	ZZtwzKYcK7aVSha51MNGBNxrING3UDiDRJ/sG9xvhKXUbHXQFXbMrOVrJG1D4MT2vm+HAALVeOo
	NKP6aZU62YdG2Wyd0zMEESeK+u2CpbipTYkwWi+iK/81CCQAg4NfAOcz2jo8VHh3Cah6z5Z4I/B
	UH5Cb+U6VvWw2DTFHI/eTKwQlg8qK5NO/cYur+0oV6bdWBzqBgUIhhB75LgV2Y9j57CpvULy0AK
	pQCC7Tnjfo5D1T3Eq4RkjfZp4y73raAlITNl9eVLr0agHZ9XOapoKl6XePxDzzvTREvk71mFrmP
	AMCXQEjgv0HaFxrMJv9zJ9UzQGpdVvwNJjESnTIGrQyl+0Bemx+TlTSmhSfTluIYwqyW45wICZM
	eMAXoKHF8yTWfgU4phNuCuQmrkmqmmbxckr1War6KRU6I59UDKAhcd71g72FZHCDayw4eX+BZBs
	NUkczj6+bzU4VlXOUWn2buNqEZiH3CHeGaL5H4qX3rCTdXWQxMGYdgcTOqCc02giyY4Y4SqyzZ8
	+JVYIBFeRWWqZ6hJ4ybLfGR9ZKUwd815TIBX+gRxFQS+JBMA8B3MTlT1XBRlcz0GRbVdKp+G012
	tKAdoNSg6ceW3CYdAfDfOYUyoSQrC
X-Received: by 2002:a05:6870:440c:b0:4a7:6dc:af5f with SMTP id 586e51a60fabf-4bc858f9583mr23176950fac.53.1795802833555;
        Fri, 27 Nov 2026 10:07:13 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bd3008160dsm23406139fac.16.2026.11.27.10.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:07:13 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 3/5] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Fri, 27 Nov 2026 13:07:11 -0500
Message-ID: <20261127-a733-dt-v6-02-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <0a7f4a31-81ac-44ee-8cd2-7b5526af7442@arm.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-3@gmail.com> <0a7f4a31-81ac-44ee-8cd2-7b5526af7442@arm.com>
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > +			linux,default-trigger = "heartbeat";
>
> I don't think we should have an LED wasted on a heartbeat when there is
> already a controllable power LED. I think a second LED should be left up
> to the user to configure. If they want, they can always set the
> heartbeat trigger via sysfs, although I'd probably do this on the power
> LED instead.
> So I believe there should be no default-trigger line.

Agreed, v7 drops it.

> > +	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;
>
> Since the Allwinner GPIO notation with bank and pin number is hard to
> read, we always add the pin name (PF6) as a comment, see other .dts files.

v7 adds /* PF6 */.

> > +			reg_eldo1: eldo1 {
> > +				regulator-name = "vdd2l-lpddr";
>
> So I saw the same issue on the A7A, also with LPDDR5: the schematic says
> 0.9V, but at boot time it was 1.075V. The kernel corrected it to 0.9V,
> without apparent problems, but I didn't stress it at all, so can't say
> whether this is stable. Various LPDDR5 datasheets suggests VDD2L should
> be 0.9V, or at least in the range between 0.87V and 0.97V, though in
> some configurations it can also be tied to VDD2H at 1.05V.
> So we are none the wiser, I guess, it would be good to figure out what
> the PMIC reset value is for ELDO1, so to know whether it's the
> vendors(?) DRAM init that deliberately programs EDLO1 to 1.075V, or if
> it's just left untouched.

The reset value is not in anything I have; I have no AXP318W
datasheet. Reading ELDO1's control register before the boot firmware's
DRAM init would settle it.

> > +			reg_swout2: swout2 {
> > +				/* VCC-IO to the console and microSD. */
>
> I guess you mean "GPIO headers" instead of console?

Yes. VCC-IO supplies Port B, which goes to the GPIO headers (including
UART0 on PB9/PB10), and the 3.3 V Port F path for the microSD. v7 will
say "GPIO headers".

Enzo
