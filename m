Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D868D409E14
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066714; cv=pass; b=m5R0+a8D0jiBvn6s88OCi0l45IJp/qyAQ7fj7O9hwOsxK3MjsvJzAmgzSXF3V5sUwPw4EPQh9+S3DPLBerNTCzXDG0nfpXMhbugKmM2RQli7MnetEKPv20eqc6V9YIMPnsIgw0Byec3UeN401+H9YC9GETA2yl5U/L/uHYCASBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066714; c=relaxed/simple;
	bh=Ahm7wwN7gT9Tdg7MhigiWgrVAwRBRLvlQpRrmshYWXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oyktUXx3ntwczHYcZ7YdHKMUZm2a4djF7c/hmQbXIe1YaCs46TNFpRYyNDgY9vEU0dY3+atPFf/oU78dO+eQvGwZdmpmmeOWNPYuFDDKBCiIud74MISKXFUZrESPEXgIWxylw9LFn6Boj7xEVSqVnrHPCBwuS0UubuDpKXzUEwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jdknypbD; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdknypbD"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304f0039c02so1028931eec.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780066712; cv=none;
        d=google.com; s=arc-20240605;
        b=imQqqxBXofgHWW4UzrLiC7DVCmMEypFj/CaYdiTdFrS7B38B5m0jH+wwWgeHd9Qvha
         wP6OczaDW0SGxHpSEwC4NPA4JH4m6eXQJVnd2m6rTobm2JYZiZk/x68yEhDP7A5OYDnw
         SKpcuYgUu42zbWvUlH0iMp8WRg5i8pvZKU6KOliIa6ST6eXTKWEyom5i54oPVi+U2qb5
         WT7vNy5Vx2GYn1SRJMYBDYDU4uwPK77JlUwbjGmbpjRWMY8HJSOoB2nwOFeH/cmto7Nn
         rSMSsDKe9aq0XHavdOq2jwMsng65PZfx1MCuuefJ1aaTp1QEIhaAFICWjFtNevtv89x9
         oqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B2m5uck2ux9YJhiKWVIGIxilYfiZI8IMVJ+BiI1fBMk=;
        fh=08q21IpV0dB2gE00t/h0B/j4yi6LBpqMH+ub5PV5MYs=;
        b=bSFXElokAtIw1l/8pAHlHdtKYNZ+D/FnFnnV5/2wey+cmCkjTpnJg3k8owE410Rh82
         KsZL8cPh4Yp//c0jGbaiNdLxrTXeo9THBXquCpHFJKvNfqhQ/RfMFH9u5bq2r/IXONGD
         JifHQ7V7QNLc/VEhNr9Yj/5IpSNFOuUc7CSrchbnr740eezaGaxlRdUJrVunHsS9u/5X
         RDTS6SXzsaroXFSM5AavrEuJSz5apud6d8lyyRWgRh9oEi3iufxULCfg4C+Soe5/P9ML
         Opb4HWjS2CoN+GF5iCpK4MSK/1vsofZsRLqLeuopDirklNZOfSQR+a3F9DYX3fkxHwkp
         GhLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780066712; x=1780671512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2m5uck2ux9YJhiKWVIGIxilYfiZI8IMVJ+BiI1fBMk=;
        b=jdknypbDjlfMKAY9K7xQLWJHozqtvAqBjy30F2cUiT0FVlyDVnXb9Kna5Y8/l/svgM
         SON6T3tuCD5pQOTngygOEX84iSDwUTUGLVg5QF3h/Sj36N1WntvWnjWhd4Ca270pTPPI
         GB78CzV8lZYH/cdxtT6GGbi5Y6I/64JFDK5ACLjIVc99ZoHOhvaHzQth64RZxKelX3Tw
         oTXrphnDTF9nNJoxFama2xVOk6urTl52fh/mK+6ChEXMHs4MXDpNC8jqXw0hQpm5pL9w
         N0UapB6D3PMm1/1EcNNTk9tBzQHsNWnuHBBkI1Vl7xSU7GoIErs8nYrp6yC+l5R3RwGR
         MfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066712; x=1780671512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B2m5uck2ux9YJhiKWVIGIxilYfiZI8IMVJ+BiI1fBMk=;
        b=LX+2VKO/IPZdA5lucUoV+yIqba8wJU0cmG+i6OtcmUOUItgCK8LWUuxsXUAAZ7p+YE
         4flqWQw1G/vrNAIHZ8yvZ+fUypc5OtIh3IR3Rs7HgLE/WLlml/RVHbCd3oG6hjN1IBhM
         91kC3C7QrVN9hvSxBDgu55fcIrkg3ZbM0MbIagZzXy8LrHrVtBe4VS9JDLOA6Oe6YR8k
         im15oSRI7+z+mjBjc8HnI/uzJyHLKWHmXLLxyH+i2PJjPFVVtClGe7G7lzXtbY6Ducvi
         f8a6EU3Rjd2igwpME1eyKqM50v2Fve7Xa8tSjU+UdBmPDSmN6KLEpd6HZO039I4o3TJQ
         zWBg==
X-Forwarded-Encrypted: i=1; AFNElJ+miIzUctOljkGSfEf57IFo1QtNSb2eSvlsLMFwwGZus2sn3osP1vfi3s2OeGavapoM5XIMf5AFjUnj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwv++ir+bIjij0Q6IxB0U/ixTjU9JFd+3PxHxRWfYoP2Id3a7d
	YMkYTjIUuJ9Szdgzwti6lcUq6ev8zWmWRj3vBQGTv0NFhrlu88X4UMjf3wDkzHL/BQyqxhtkAKF
	iHIc//IyJYzvw2tnOBwx8zTZ9rNeln80=
X-Gm-Gg: Acq92OF21jxusZ6siYvQxyo7B6waVfJlY9ZTsVGtBhfiXggv8N8Dw0ZenI4P7HvMKSA
	fBTlPmnc6hWmmTP3ri+f8fiUF9dcX1sU4YhHp35Whxsvfs+l+1shS4sg0AT2R1tthJBzy/dNA2R
	5fq/7nv/EjoyxaYEGjwOU+Vn0m25x97B9Ks6bF7i67IAYzOzLIVuBOEmALgJBG9Up546IXv5D9B
	00IgoZUcHPaovtuDw0hHEV6fBST7DH8ws3QT0nFpUYpUWK7c+WtkyXaJZtNbaC4khC75BO+Gh/6
	D6Qy7EGaSIqYMQQL4zc=
X-Received: by 2002:a05:7301:5803:b0:2d9:6373:ad22 with SMTP id
 5a478bee46e88-304fa4ff6ebmr84685eec.12.1780066711924; Fri, 29 May 2026
 07:58:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523084408.50346-1-clamor95@gmail.com>
In-Reply-To: <20260523084408.50346-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 29 May 2026 17:58:20 +0300
X-Gm-Features: AVHnY4K7CEePsHXKgJoKhVenrbgr-KoCglYNTN1RuRaSjnz6Zt-v8XpgPPiCcOo
Message-ID: <CAPVz0n3GAgR7N9kAJCN_ycsgFi3B92iz2thoYcwACpd4Y6K5Vg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add support for Infineon/Intel XMM6260 modem
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 23 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:4=
4 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> The Infineon/Intel XMM6260 is a 3G-focused, slim modem platform designed
> for smartphones, data cards, and Machine-to-Machine (M2M) applications.
>
> The modem is typically connected via the application processor's USB line
> in HSIC mode. To function correctly, the modem must control this line, as
> it requires precise timing to initiate or de-initialize the USB connectio=
n.
> This control is necessary to successfully enumerate the next stage of the
> USB device loader (moving from firmware loading to the actual device
> interface for example).
>
> Patchset adds support for the generic portion of the Infineon XMM6260
> baseband modem, which was used in many Tegra-, OMAP-, and Exynos-based
> devices circa 2012. This driver provides generic power sequences,
> manages initial communication with the application processor, handles the
> SoC-specific modem powersequence, and verifies that the modem USB device
> appears correctly.
>
> While current support is relatively basic, this configuration already
> allows the modem device to appear in the dmesg of my device
> (LG Optimus Vu (P895)):
>
> [    9.427014] ci_hdrc ci_hdrc.1: EHCI Host Controller
> [    9.431488] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus nu=
mber 1
> [    9.457197] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
> [    9.460370] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.16
> [    9.468470] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
> [    9.475597] usb usb1: Product: EHCI Host Controller
> [    9.480508] usb usb1: Manufacturer: Linux 6.16.0+ ehci_hcd
> [    9.485913] usb usb1: SerialNumber: ci_hdrc.1
> [    9.490862] hub 1-0:1.0: USB hub found
> [    9.494005] hub 1-0:1.0: 1 port detected
> [    9.657191] usb 1-1: new high-speed USB device number 2 using ci_hdrc
> [    9.844726] usb 1-1: New USB device found, idVendor=3D1519, idProduct=
=3D0020, bcdDevice=3D12.74
> [    9.850530] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
> [    9.857594] usb 1-1: Product: HSIC Device
> [    9.861606] usb 1-1: Manufacturer: Comneon
> [    9.865627] usb 1-1: SerialNumber: 0123456789
> [    9.908739] cdc_acm 1-1:1.0: ttyACM0: USB ACM device
>
> This patchset is a part of larger series aiming to bring XMM6260 modem
> support for Tegra devices:
> https://lore.kernel.org/lkml/20260511135703.62470-1-clamor95@gmail.com/
>
> ---
> Changes in v2:
> - changed phy to pwrseq in schema
> - adjusted Kconfig dependencies
> - implemented bitmap for modem state tracking
> - switched from phy to power sequencing
> - in notifier added chech to filter only USB events
> - in notifier added USB_DEVICE_REMOVE
> - added tracking for regulator, rfkill access, usb device
>   presence and poweroff calls using bitops
> - moved pseq on call from work to irq handler
> - improved rfkill registration logic
> ---
>
> Svyatoslav Ryhel (2):
>   dt-bindings: net: Document Infineon/Intel XMM6260 modem
>   net: usb: Add Infineon XMM6260 Baseband modem support
>
>  .../bindings/net/infineon,xmm6260.yaml        |  74 ++++
>  drivers/net/usb/Kconfig                       |  15 +
>  drivers/net/usb/Makefile                      |   1 +
>  drivers/net/usb/baseband-xmm6260.c            | 378 ++++++++++++++++++
>  4 files changed, 468 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/infineon,xmm626=
0.yaml
>  create mode 100644 drivers/net/usb/baseband-xmm6260.c
>
> --
> 2.51.0
>

Hello there! There will be no v3. Sorry for disturbing LKML with 15
year old obsolete tech. My mistake.
