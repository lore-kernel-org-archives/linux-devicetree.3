Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910197;
	b=uSIR6jWv66aVpQbsQeS9sQ1k0AbX6Brb9JqbcTJH+x1tUUMR6uMKIa5+kmF2YqMZqr/8
	 BC1BqDn4CNOMAztpwytcoqO9xJNNg0amMPoRvFEn8MeJG26BHTE1sV9ZmprWrRPokHtOr
	 hv6xk7O3gjcBmTj0o3WQkmcSLegK+UaQT8wajiYMUL+qTreyyXZNauIiomnab07pvoKnL
	 UjmI000qbSJIY41BFKbfx84bDwJBMmL8rLDjgvRZFUeNOKr/TVzHfIlKpC9ruHv5b2YpU
	 dUyFjln8FiK7mOhLRLtdsujHERq1UE5UAb3zEEPA8sQAKXI1mrFuU9rhn/kbFAW8JEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910197;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Zijtj8oRnUhmq8nJwvW4RuvRSCE2yvzPezhEDKGNnBs=;
	b=aa/pn5zB+M2p6UzKG3HwDGCtWlLlruz4WdfCv71XzAdh9Zpd16kins2XliWvJwgA+RoY
	 LfevHmIPTwMt9sQor7MNzzJljX6kYvtoqxtuCOlKnlnD/Msuot8NG+dXjhW223Fy9Y6Y9
	 VEPcy4wGHL7yPIvt8X46pIARNo2iNOaUpd/rsGSzaiYhydfBcIvGO399NSxk4KktBu5D2
	 opTSofz7+2VqPmhmtNR1/gvXwiMDUkl8DmFNZPI6YgEUb+Bhbs0i+DKIzpFugMIHongHK
	 TWnY/QImG7Bcm0BBD89EJVRBS7g+k/CAvfAg/ACPagfA9+lc2q3kQ9k/goeAoyBi8Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZryeUptg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECEC606A331
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZryeUptg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3693E1F00923
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794910197;
	bh=Zijtj8oRnUhmq8nJwvW4RuvRSCE2yvzPezhEDKGNnBs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZryeUptgE+CTRECXG6PaFFIo2ynUQLFGJoEd6SIe0bh6T+R/8Ylgar/c7UC7XvKKC
	 RboUXutefAjs9UYoNbZHAKOaTW5RdZ5zVYtKi0OfrOVqV6O15XplMzPAJsgewCr4HB
	 jYy1L7eKdJ6jhTQiiqJPM67KFcuQlnIrmZewUg0LJp8wECWmle0XH2HTiWC1acvEg3
	 MYnT4y7Fn62BBVq1IiXmI2aahHYNKiTgJnPAsemi0K9G8QGaSJp9BMSiJVdz3A2V/W
	 vjdvoLdHPWv0dWGgHsG+gw8ftu2pno184/1QGkhwvlTsaCs/wqp6SdJ1kK2zoj/VIm
	 ggZq9GRKBJJsA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c17ef1e18cso386482e87.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 02:09:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF45Dw4Q6aMEZis3f7qH8cl+t//N2pDcRbMrs+2+12gksu3wGu9W+9FVEbc4u7xpG+JTvC3w26Wj5hH@vger.kernel.org
X-Gm-Message-State: APuU4Z9VxngVEHThcscIJjTianugdfSxFYO6NZVe1S0S3vlSWIXqdZig
	a3W43DMVSQZpg/xTbHt6LX5nZffM2IDSoTV8nEwUry43aK7EZy1TGvibdfi8D8iEnN4RCwwLA7J
	q56n7J3MMj5YHGToTUzXS1QXljDdkzNI=
X-Received: by 2002:a05:6512:3e10:b0:5c0:91e:a95b with SMTP id
 2adb3069b0e04-5c17077e429mr4781706e87.14.1794910195950; Tue, 17 Nov 2026
 02:09:55 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-apple-m5-initial-devicetrees-v3-0-cee55de54b2f@cyberchaos.dev>
 <20261106-apple-m5-initial-devicetrees-v3-9-cee55de54b2f@cyberchaos.dev>
In-Reply-To: <20261106-apple-m5-initial-devicetrees-v3-9-cee55de54b2f@cyberchaos.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 11:09:42 +0100
X-Gmail-Original-Message-ID: <CAD++jLmvsXAZwb2ak4vumXqZTPgGNqm=fdgWEgw7VqqzvU83WQ@mail.gmail.com>
X-Gm-Features: Aa3M54oq4YzlnIadSqNmPikBx7uA231ihP8lcXU-Pc_buuhnmKKyHs_C06WfytM
Message-ID: <CAD++jLmvsXAZwb2ak4vumXqZTPgGNqm=fdgWEgw7VqqzvU83WQ@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] arm64: dts: apple: Add minimal t8142 (M5) device trees
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hector Martin <marcan@marcan.st>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Sasha Finkelstein <k@chaosmail.tech>, Mark Kettenis <kettenis@openbsd.org>, 
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 10:24=E2=80=AFPM Yureka Lilian <yureka@cyberchaos.de=
v> wrote:

> Added device trees for the following devices:
> - apple,j704 - MacBook Pro (14-inch, M5, 2026)
> - apple,j813 - MacBook Air (13-inch, M5, 2026)
> - apple,j815 - MacBook Air (15-inch, M5, 2026)
>
> The device trees have a minimal set of devices limited to CPU cores,
> interrupt controller, watchdog, serial, pin controllers, i2c and
> framebuffer.
>
> Boot-tested on j704 with macOS 26.6 iBoot/firmware and the latest m1n1.
>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Looks good!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
