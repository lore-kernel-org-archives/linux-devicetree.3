Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB883FD946
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 09:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762372; cv=none; b=ofv/iwuXzNXK6uh7tjFudyMD9bXMa03r85DWc0Q+34HBNmsImxYSuaa4x4+LumbacPthyDzbkof+AnVqbHliPzZeQGcDHOQ7hmIA7T6vVsMEAkFX9OGyW2tNjojpQ6YF6e5jEjEYZZN5sE/DQF5ksfnAbZN/A270RQmopkp4rjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762372; c=relaxed/simple;
	bh=oCb8pD0GTaCJdPRTDUHDOrP9QLPA+6gtpfNrrUBXRJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PvTOgwiyh5VgCMs1VWXBn6GpSRw0K1E+akad9hmvlf8V7xQD4OIVPqlh4tqWZT3muWfKGb2e/A/CRXD7XdyWAQIzVts519++MkvQ10c3DYlKH4E3Ku549jn1a0Ed1gpz256JuKK3IqnN2Wh5JWLhnYw+JX1qjlCBjmS7ek/H2BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6tr1a0g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6tr1a0g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060711F008A5
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 09:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790762369;
	bh=oCb8pD0GTaCJdPRTDUHDOrP9QLPA+6gtpfNrrUBXRJg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O6tr1a0gBYWZkpeMvgU5003ZZF2hvp01nK6gayO050AgawGtnlJGzmkb+56s/NCDO
	 A1bjob4XwhA9eznQjvunlM+/jZk2lde2N/4Uzk0m6ooQD4j7CL+4fG7QBili8lcK/I
	 g9dAp1oD6gO/JZgvytw4/P44yevzxJo2717wD/1GbpqLcavqFG3Fxd9sLwbRYvPcwd
	 E5HsytA1J/TQ5IPCt96V5op4r9CIDr4/+s8nC2w4XvK7Wssbu6AkiAaD+KclGM/H09
	 +DxOsRI6fxmENhCqiUH/jPrzfwdBKyR5YY5vis5bZgJdPgRjm/ZwF7wbGXbJv2nww9
	 KxlAUulZmJnJQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b76668f4ddso1874061e87.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 02:59:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwRNKt+c5uaC5ZRwnCmyX4LNHef3Y7mnU9dYpvFYOqLxwvcHUYLB6yZC+avkeWD366R4zlYnfFdaqwH@vger.kernel.org
X-Gm-Message-State: AFq9FYLm4ogRTbiJLpvR2WEik80LEk0bYmRQg2SaaqhxgOh5zdQ7DxD+
	6+NI9KHs8Uh1Gmza8+U76pN5I9CsMOhnkXknCSx4BQgQs5I1V3i7BNdUYdeA3N0z1n85yhuyecC
	F5TYfKTk4ZC05gj7jsRdqqDzxEjaQm+k=
X-Received: by 2002:ac2:464d:0:b0:5b8:f573:35ea with SMTP id
 2adb3069b0e04-5ba4069be69mr221068e87.16.1790762367713; Wed, 30 Sep 2026
 02:59:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com> <20260930-b4-cs75xx-v1-2-4617c4463529@gmail.com>
In-Reply-To: <20260930-b4-cs75xx-v1-2-4617c4463529@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 11:59:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLkubGK4wetxXQz8PPDU4aHdSC7e0RgZtwOjrAWzHxX=RA@mail.gmail.com>
X-Gm-Features: AclHuK-m3HmD7lYV6qupQKjYpsgXbfMsgcuHzWJL7-TIFY8_vvfiqbhmnPD4sQM
Message-ID: <CAD++jLkubGK4wetxXQz8PPDU4aHdSC7e0RgZtwOjrAWzHxX=RA@mail.gmail.com>
Subject: Re: [PATCH RFC 02/10] dt-bindings: arm: Add Cortina Systems CS7542
 and Securifi Almond+
To: filipp.dunsky@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 9:00=E2=80=AFAM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Add the top-level binding for boards built around the Cortina Systems
> CS7542 ("Goldengate G2") network processor, a dual Cortex-A9 SoC, and
> the first such board, the Securifi Almond+ touchscreen router.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
