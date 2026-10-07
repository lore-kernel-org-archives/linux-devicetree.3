Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1633914FE
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 11:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373390; cv=none; b=WJYvaQ2H/1Dp9HhN68WCyjmZCMzlGrJTf6abSf/OUPdf4VNBm368TnU/Hr2+jPfLYr03hnuJB2p92IcfVSVKUgJPeedqVNeBnlNdh969SkgtetPqX6e0U8Gqb5+D3/0FU1wBS6peelF1Xsycvha8MGR67FyQg0guLChMBFL91Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373390; c=relaxed/simple;
	bh=ivEueNLxHk2vH0nhb5BeLMWpDwc53kCrNP3a0jUDX2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UqHHfcuC6qghFMyOzI5MD2Uv7UVF2rB7jgwhOdGhNLYJrrHDyfk41SLlwz8OHReZIeIFAVEYH5rsfctf5NMV95Sim4GBNTF1CfGMeZ1ZVJD7RCpgVbuSR1sxG4R9EtGSefwI4C2OsgdsKbefU4/t2a5cFxhFoE1rYgb6jQk3QVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Absiup7E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Absiup7E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3941F008BF
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 11:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791373375;
	bh=ivEueNLxHk2vH0nhb5BeLMWpDwc53kCrNP3a0jUDX2E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Absiup7ECYSXtrMLN/bQJldHdg5wxZGDLix0U8l7vCt6iJ5wXNpBZmIZqT7C+5lHq
	 27PTTD4MsUwJmOOuo3mI9KClXBNcemGkTqBc75zSm8ywK/a1kOT8bsCzs9DKtNh5fq
	 ulv+K8+ZCyA3qODDwnMeU8aaH4vpY6oT5LIGLvRN/rfTLyPIOVGbXtcV8z8mecRZ3b
	 +t8oiIH+2V3L1ciu9oGJQvQIFIyV1XLMKbkeB0NBcTea0TaPuafymBDujnjZ9wrKIs
	 084xhaNxwgT7ZmQwakmkMkT1vmNxyUsFFF4UPjTNLsHFKPbdnSC68reF373N4Nyy7r
	 uCIZ2h73YJHwQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bc18f54abbso3204311e87.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 04:42:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxzCChdypio5Og3XgFPCr9E4HA6wbuOOHjBCiSli5c5b5G8Sipt4p3TGmCed56XSZAyWUl/qYX2bp1q@vger.kernel.org
X-Gm-Message-State: AFq9FYIUmKzAOvSgUc0L7+6h0P4b3n0Ed7DcF5eKiZ0k+knAqVr+iy0K
	wfkSutJuhaeFWzPh7hf6y3AzKYWSQWNe0Ssf8ld96PiFlbtDnslsBC7FW5rAWNyteeq0xKqaaQS
	jnmI4yHt3Zt42Xm+xjb4mUPb6swaU1V8=
X-Received: by 2002:a05:6512:10d6:b0:5b8:eb3a:759b with SMTP id
 2adb3069b0e04-5bcd071739fmr695555e87.42.1791373374528; Wed, 07 Oct 2026
 04:42:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-b4-cs75xx-v2-0-b7d6e1e24d44@gmail.com> <20261006-b4-cs75xx-v2-10-b7d6e1e24d44@gmail.com>
In-Reply-To: <20261006-b4-cs75xx-v2-10-b7d6e1e24d44@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:42:41 +0200
X-Gmail-Original-Message-ID: <CAD++jLnnRQtkM70jJG4+a399jAoGTX14uQVV0VRi-xqUeA9xXw@mail.gmail.com>
X-Gm-Features: AclHuK8nAoHDN1ANkg2tOlHkE-yX--9Ilsr5akWlC4NL-_UZZlci4TouPpcsIFE
Message-ID: <CAD++jLnnRQtkM70jJG4+a399jAoGTX14uQVV0VRi-xqUeA9xXw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 10/10] MAINTAINERS: Add entry for Cortina Systems CS75xx
To: filipp.dunsky@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	Jason Li <jason.li@cortina-access.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 8:17=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Add an entry covering the Cortina Systems CS75xx platform code, device
> trees, bindings and UART driver.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
