Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEED39C632
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 02:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788144214; cv=pass; b=fM7zVvlxSLJXbIrsBs9faE2jJNiUgV/SsP9OqvyoawL3tYyJmotoSOlAxJKhhJXbU6AaBHZQNHhnfZcq2yAB9VDEyPzzRcOXg+6gW5soCiTYVD+p7qP/oorCgjDmeoUkBdcZZWEQTSnYFnPnfxN7XVeU4kFK0snLzfUdW7vj4dM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788144214; c=relaxed/simple;
	bh=6ahtd83ldSoDYRvF3THgth4QTO0pTAI9WpqI9ilo/OA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h6ogpyzymKbzc83bsfaPNuo4vLtNXBa+5jZYKHOBP7UY+cLjXwpjgEPWeO08t4o9Ki+xrmeZkcwbZcx+niZkrE8AuGRFn+NXHr45AYV2IuCq081E05I7qr+tJhRe7hgTeaJFxqsn7zUAgjkkUoV0NQVhYTlm7rr3dZ+d2oAStiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJfVLkwH; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJfVLkwH"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-836c8bdac50so31481677b3.0
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 19:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788144210; cv=none;
        d=google.com; s=arc-20260327;
        b=OHhTs24Y5lvnw1wTqBX3X5FeXPtRvhyIC9SpWtMp/5FyHh6BPskB99EWZwPf4WtGfo
         5gKN3OAg9hZNnIJaHOuQUg9LFwSI5ZhBYr0zje9sXfq0577dXP3k3YTKfpjL9tAqtUhu
         rdiL6ls02LGVKyyKeantZniTd+6KSF7MXsJ39ms4Dag42fo4JWU+YOZKl8zNeZMuFaxE
         N+JJ6EIFLHnegJvH292IlMZnkgWgG2pf3cTD5O5oSoOi/7VGaH3JQ0EvUNSOwv7wqiba
         Tk0Yj0vHOD18ISLP7Q3pRl3ZgKaeauVIbIDCpxCbm595XXJK2K/PJNJqQ07OjaOebkIR
         FNtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NbE6ygLElQTTYS/K7ZqBXF2buqZVjb40e1vBsSRV3Do=;
        fh=xhHJtbXS+mkGtCqLwzIoGrFD/sZGVimAAnbzLrS1DuY=;
        b=SW+qXPYiXMtuano+UDJ30HG+fkTopBjL2Le5w/Wp0aNXQVOT8+AAWbHSy7dhkLe694
         NKzV+BGGi2X4P5PbQdbme8utz4ar254c20PrQwQoKcIRnr/LTO9slfwAnL7kiKu6MRXK
         2/HFj8xdl2FxCzDBjMAytEfCuShaORG/uMU2CSEL8nzwg3nrO8WL3788fptd7bgh8gtU
         Kk90bVqCBIz6iDc03vEEJuV/+NNsaWuXWhVZja7T51r5gu83u1pqUeunJ5hJOQKGHJAH
         5vI36ERW9dD8f2gweDQ0qwdceK+BAAwoiFVQRr/N2bI6ftHjPoLl+Q8rCjdQzHfLo7PB
         P8/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788144210; x=1788749010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NbE6ygLElQTTYS/K7ZqBXF2buqZVjb40e1vBsSRV3Do=;
        b=fJfVLkwHSc+g8tOzDdqFC1nxH+LO9L1/sLCjt6DAcUocboQwftZwvaXi3rugKyAaTp
         UZcGouo1FdCpP0fF3zjNy3MgbWg1TEF419d6AYlrTUcucNmoDlR0xNmKwKrr1ScO0nSD
         KoTE3voeQfmP3cRWA8AtUA0O4XRAFDmNojEAi/lf+QBb7bGOGPKW43BV4l8L6jdig/MA
         foTGhboc5DNwP4w9me5YbPWZXo7+6COUAudupKUxHlsKRtb3apZKEWffybLueZcM3pAh
         LsT3czJb0cqCRVCRn+WYmAwLnle96QOX2PDeueuh2ugEOrK+E6jH1jbnFSGJFUQ2G1Za
         Nr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788144210; x=1788749010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbE6ygLElQTTYS/K7ZqBXF2buqZVjb40e1vBsSRV3Do=;
        b=X+d0Ph4+pVTeReqLFYXprsGrVlXW3kRS1Pr8U0krWFn5cshl2mFYT8h4pxDJ67Uedb
         1HBglC85EfHNx0eo9TTU7gcVc6dBiIJ9g5aM22fkKU9uWQCkU5D7sfcf4M62zDDIBCZL
         ip4b+uWGjxEn1vE/S9hQLM5J1itF3V1nx2NVcv3W1zmUjXYZL0IPk8XpjKEuWlLEws0b
         d+UU0vt8GOUoOlFimz8lSXnTiawwcUlzcMJX4Lekw7GlY08mS0LuEigGjtLEiJHjywd6
         x7/H/PZOl2MYQ7C74lyMRuTHTzEyypdMAjmzcOsKkxtR/6ymmS1KN9+R9e0m20jtaKod
         MmPQ==
X-Forwarded-Encrypted: i=1; AKwUvByTsvQoFU+rzJRUKwU5SbEoKOlgQ1Z+ysHdaBt+73w07rQFdCa9p8VJ1mdzBdUoJ7mteDS12+22hBOE@vger.kernel.org
X-Gm-Message-State: AFuF++m4/zDcTntifwju54oHS8iXyGEJUrE3MCs+lKEcRMn2xBClQty0
	coxkXOtyNo6EZc+BeKkhy+KGdm2a6Nwav2Ko5qjwHwp54OZlx93BM3Ywcg/IIgjXGwzVynOjD3D
	Bzwlglh5EqAq90UFfls6Ps7b6/pcs1nQ=
X-Gm-Gg: AYBFou37rXXmYEbGYVVxk/grqF4hAGOgInFAqA4Nhbh0YPfCyAQCQYw8PrTBO2F3t+y
	2HrUtKQsNPPV+HKs2oNYcRCiKdcVL3ZmYD1iKFFkjCh4qy25rlauvIYWMVoq7jWbhJYpLeZKtGI
	5H9Qf5zIQlriXy+htppYfNLzKcvy3sBxykbWXaIwNWq/Odom/zpbMJYTXcpQj9oWdWqgzKU/Fnd
	fnsCfI/fJ2ERKDoqBG4DaNcbdhqDzLMZmS7tkREDNbq++j9b7EYL3bAR3q1Fp193qzfWceqfQ18
	qkxgPYKsLsaPyNmRC89UmaFwT5ex2n2GpvNSe0T6P7uJww==
X-Received: by 2002:a05:690c:38a:b0:81e:695b:585c with SMTP id
 00721157ae682-8678f0c3792mr241247b3.4.1788144210009; Sun, 30 Aug 2026
 19:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com> <d60f234e-1b9e-44cc-9bad-da79e794fe44@lunn.ch>
In-Reply-To: <d60f234e-1b9e-44cc-9bad-da79e794fe44@lunn.ch>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 31 Aug 2026 08:13:19 +0530
X-Gm-Features: AcwNN1XmXTP91gt09bDas9PoVw9lX5EEpGOPuilZRVTJETaIpy2y2cTeB3EQiZQ
Message-ID: <CAMFFDGi161c0a8CX4DAaRzc66xTG2oRZ7DOgsG7pNRo-YP9-cw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

I do not currently have the PCB layout or RGMII trace-length information,
so I cannot confirm that the PCB provides approximately 2 ns of TX delay
but no RX delay.

My hardware results are:

rgmii negotiates 1000baseT/Full, but RX traffic fails with CRC errors.
rgmii-rxid passes a 5000-packet test with no loss or RX CRC errors.
rgmii-id also passes the same test.

These results indicate that an RX delay is required, but they do not
establish whether the TX delay is provided by the PCB, MAC, or PHY. I
therefore agree that the traffic test alone is insufficient to justify
rgmii-rxid.

I have contacted ASRock Rack requesting confirmation of the RGMII timing
and PCB trace-delay configuration. I will wait for that information
before selecting the phy-mode for the next revision or making a claim
about where the TX delay is implemented.

Thanks,
Prasanth

On Mon, Aug 31, 2026 at 1:53=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sun, Aug 30, 2026 at 11:50:34PM +0530, Prasanth Kumar Padarthi wrote:
> > Add device tree support for the ASRock Rack B650D4U BMC, which is
> > based on the ASPEED AST2600 SoC.
> >
> > The series adds the board compatible and describes the BMC memory,
> > SPI NOR flash layout, UART console, and MAC0 connected to an
> > RTL8211F Ethernet PHY.
> >
> > The MAC0 RGMII timing configuration was validated on B650D4U
> > hardware. With plain "rgmii", the PHY negotiated 1000baseT/Full but
> > received no valid packets and accumulated RX CRC errors. With
> > "rgmii-rxid", a 5000-packet test completed with 0% packet loss and
> > no RX CRC errors. "rgmii-id" was also tested successfully, but the
> > additional TX delay is not required, so "rgmii-rxid" is retained.
>
> Please take a read of:
>
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bi=
ndings/net/ethernet-controller.yaml#L287
>
> Does the PCB have 2ns of delay for TX, but notR RX?
>
>      Andrew
