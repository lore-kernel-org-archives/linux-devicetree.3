Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889A93612E9
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 07:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777014800; cv=none; b=Vi47B+ZkOUyzmyTEtEnh4JXBxXrF6/0zIBxO+OGgJ3fl7CyLoem/qucmRMPU7Df3ryCcXAY7DPwxubt56gNjAyBx/83nySQOayxCLYS9sXNnIkK4x1j/9u+RrsAKpHlJ1e8EhYjrvuDm5tmNDNYkPWUvvkWnBsoC60qSPO+tE4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777014800; c=relaxed/simple;
	bh=tLZ/GDek49sI5Zs/eZ/fXFs5/EAJg95zumCgRfB6mFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kGNlp5UyMRhSxePiGPye2iwfCzBiDdScW/KY/NRCNRTecRH/MMvlh5n3DncN64nNtSYkKuuYX6hJR1x61M1bxP1H0igH8aIo8X/+ffkKsJPIF0XcW0dzdyKBFwaxnArn5T/OvX5JUoqTWaSKOh5guuMVBO9YeANiNQfd1Ja/564=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqTAkPNF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqTAkPNF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8A8C2BCB9
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 07:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777014799;
	bh=tLZ/GDek49sI5Zs/eZ/fXFs5/EAJg95zumCgRfB6mFI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZqTAkPNFuRt4zBNN91MjsuvIMRLyywfrnFCAPb7T7f0WzSHRKVAzABlzj6MTWuHbO
	 DipU6fp9WKBSaiUKDif7XxbY2cwSKQFsZVjec2UqA6paA98OtJdhzXApvhX9eQM1B5
	 KWVQ48tVMzv2gxHax2ms3LlSmP4v3rQ1z0m6p71HyPxmc48Q4c4VbWzKoOQ3d0NGMI
	 BtrWK5VwCDE+cOiJ6a45f6dCGhdjqDGEPtZGrNrAcJkWy4okptGPbEExz8hJJUsr+s
	 jnkuFrOqTdX49kDYy4u6sIUy7EAaa7WILsMvqfJfS7CRoujVTv8Ba4S9IT2zFRoh/G
	 moZTOHfwajdSQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a41099fa86so6646085e87.2
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 00:13:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+hL5HspjTAl8U86IhARX9JnkxzOP9qTZ2fnwXznWQAvTGUkSFV1end225BEmYrzgxINMoAA8fH655x@vger.kernel.org
X-Gm-Message-State: AOJu0Yx95mb+DK42x56CI9Krdp5J5N3EHEPCpoq5wtbpJ8SEgoHVhjOs
	BNtw9+ezQ9NZhXk8Q/cNiAUHOQuxwIX3P8hOB2CwjuYGQfUz8YbXPJGc/AvoW3Lvr4QqZ8G+cHv
	ULoQn+UhiNU5S+PrX3MmeaiBr8ADMysA=
X-Received: by 2002:a05:6512:3b0b:b0:5a2:c0ab:b57f with SMTP id
 2adb3069b0e04-5a4172bfef2mr9090696e87.14.1777014797734; Fri, 24 Apr 2026
 00:13:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421-send-v5-0-ace038e63515@gmail.com> <20260421-send-v5-8-ace038e63515@gmail.com>
In-Reply-To: <20260421-send-v5-8-ace038e63515@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 09:13:06 +0200
X-Gmail-Original-Message-ID: <CAD++jL=_eDY_mG_QBreSrZiho0hUrDSciedq=vrxXaTiMwrSyg@mail.gmail.com>
X-Gm-Features: AQROBzAS_qKgmsidFIdx7V3XpX1JGmVrzkG_9S8znjc0YtyWq-b8e9KYfjIHcLw
Message-ID: <CAD++jL=_eDY_mG_QBreSrZiho0hUrDSciedq=vrxXaTiMwrSyg@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] ARM: defconfig: Add a zx29 defconfig file
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, soc@lists.linux.dev, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 10:24=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:

> This enables existing drivers that already are (UART) or will be (USB,
> GPIO) necessary to operate this board even if they aren't declared in
> the DTS yet.
>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

*I* personally (as SoC maintainer) think that having a few more defconfigs
is fine, even helpful.

But I would defer this to the more senior SoC maintainers because I think
their stance is something like:

- We have multi_v7_defconfig for compile testing

- We know that binary gets way to big for your system: it's for build
  testing and perhaps booting in QEMU or systems with many MB of
  RAM, not for actually running it on products.

- You are encouraged to keep your own defconfig out-of-tree.

However I even challenged this myself by adding a defconfig for memory
constrained Broadcoms a while back (NACKed/ignored ;) so if it was all
up to me I would merge this.

Yours,
Linus Walleij
