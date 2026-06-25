Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812141E32A2
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782378630; cv=pass; b=MgUH8oNizuMU93S25q9w9Juczv7D7+46/uZiu+jFriNuFCN6hJ3Z0PPb1sF/kQ19S59OdLPjAbIGbTrd14qc5gdnUOvEk44uEyQM4XOjiKdSHfxdRSuJlfnt27J3R94ZxljJi2SjMVRr1gBrpCwa7j321IYrijwCnfaL04v+M3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782378630; c=relaxed/simple;
	bh=PybBbFFbv2qgp/wGc6XtY0wnuLp8C2DGakY4TdWZcjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DW0qtt7mu64TO691qYNxV4sky8Ihj5DCakUsSeYK+an5K2Y/QHGPyVxS93KOMCNAf3ppyNihKOc9kC0pe7+/kkM0pzEPrxfAw5au3Xpi1io1OW/tO/dWBVCA0NAl111elAdurngGa+K50gIEW9FvZnPu7AjgS77hn7x5vkjqepg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=I+i+w1Kr; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="I+i+w1Kr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so4899715e9.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782378627; cv=none;
        d=google.com; s=arc-20260327;
        b=CbuSNy+4JZCyUlPSi4HdkIU30oj6p4pk48rjSyWnlT3Qws9A3mj1RgA/jk9XJHiQwx
         +S6R38k0BdrRPDxJNTzTrOpLobO1KOalmuwLB91iyq3flgXKnM6QgI0OS0Wfr9GjofFk
         5epC6XRYg9/K/xtV4MN9gX5nPERitHdZQ3FHeNjN2768l2iMKQumNCme9or1gbVQ3zoW
         gT2pLJ123kjXb6sOMQMiLBVyQSJ+7sKcdi50iUe8BazX2/oIcaYDK+lBmyjYZrR7379G
         h0Lfeui11BY0falrutdFQxGqV/wDfLz2Rpnd0IfgBe7Pkhb87prumU7HzsG3LQdX0k6q
         jnew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PybBbFFbv2qgp/wGc6XtY0wnuLp8C2DGakY4TdWZcjY=;
        fh=fKx1HpXW+UU/KuvX6kNBS+H5FXyZUCqvzhS/SLz+wvE=;
        b=WsSEC1Aw8VjTwiE30QgnE2yeDvs8QP7w1hpxJ1xcO2gvuuGcGWFX3qH5SaNnXT5c1W
         U/4LGCiTiUPg8NoWb5o4qysljwim56YBBSy8/CI+1a5D23osntmuNLRrZ8lHGIpPgG3O
         mTNdARiXFAuUHONLe9XR4uWtYJXBzbUQ+7k2a7P9YqXfBVz+tyHQx1wZd82KuFQvgPd1
         Yrm/XijgEm8E2twNvAhSi4whsCxZH16yruri4646t5HvhkUomvdkHpMePbev+sVAnpcZ
         UojxGjjrCBCtgCIwg5nLhHg1wTqrWMqh+5GZYvrB2Tjz2y9TUutqZLQoWNV+jnSfdph+
         u5LA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782378627; x=1782983427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PybBbFFbv2qgp/wGc6XtY0wnuLp8C2DGakY4TdWZcjY=;
        b=I+i+w1KroVJhttVDKplJ2/thfg47SaAyIUin2mCOCx6aOtnsoevAXlascKdRMNApfs
         4WZtS5XZe2PTZlCR/VJ66XwyD759v8AvdrX9od8Ll1ZOJUAFRnTv5JEM4EHSxsjAVRZA
         zJgWzRr5pU8UbqRzgNIKZZzhLciYtakwfoO7oaUSvdOS/S10H22Ai93IBRXLqPH17f3Z
         qGJC0ZPB9vTszPz5P6Yf+ARii/yvZusFoewj7y60XOvQ6Y1bFno7fV1KH/P+I09Oh75j
         sKiZqTu/Q4aTBjT476ZSM3V1OSLnZmQl8SRz3uLsAbQOLOxtJA2V9X3ugaBcphotjWAV
         Lc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378627; x=1782983427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PybBbFFbv2qgp/wGc6XtY0wnuLp8C2DGakY4TdWZcjY=;
        b=VRS5XO/W+fnK53J29r+6Idzn4pHQY2QKhHGuFIc21RRRWERYXc94tuhTLcrKS0aR2p
         GCYyoWpFlpBS48CtiHOxSZOlECJqGBtmvCdglx8eg+0Zx193RpzVlBJWshTjFXZJVD8H
         6WII7iBhPSQON0KSVjbgv6yx9w6LURFwvPxHMNbRVF6Dnoqu14S2XW9H7fyUQP4lqvt0
         hI3K9vBWLp/h1yb3HDHpdVIWAQXsCR73I8p5gjX/DHCEXxaW/UXwZRPB81WXD6XRwBQD
         Ys2iEQZgjG7NGUxfBoJZt4uZLb8iFQ2AN7/9aACkanb7kWhXvONRYV10WTskNVtj+rGQ
         CbYg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+2m2gz1FUcjA3SJZ4Fed+6mqhHpZNkM8xArdL0IJUMrVKdvFDrW7yuanCwCu0+mGXyJQ1VyT4z3Lt@vger.kernel.org
X-Gm-Message-State: AOJu0YxqkZjhZMiyU5C0wkiqcou44KDuNwCaXnrxK4SwGTgvBN9zzrAr
	pK2B/NVdac5AFZEXS+grsLVrgAmU4O9Ky478JJ5UuoOzWjCi2SWs/T9xziVAE+8TgNMeunQrmtn
	vDSOukpqJS70cGvLoH1WJtBFyM7YlNHPbTEOtnJwb4Q==
X-Gm-Gg: AfdE7clRYOycW625cATdFo0DHCMgVmblq+78iI7PZbzsbY+afPeVdagI5dJ9l18xokl
	SG9I1YSVjrETaaQsxLIVtwuZaWkyvuKg4A2whA2GT+K7FVhB9cSdCc4CToPrVjsz77xgqUcfRhC
	WwSmJqhKvlgVF/VKWOBsJ/TiaLXxrI6KWmz+zWLXwR1avUOMaQMgvY8lPx2HonXv+7bn+fshKl9
	QjCCWFvkbP/o4Q+uxd0C9NGKuThVEGULeggeKOwilpUl4cPEUf9Kcof7ISu2rgvGzgcuGai4+kT
	jX8e6wMpGuPNrfjsGSv15V1s/N7PDkBnPTSzTC/2HnyfuAYbONknk5OHsw==
X-Received: by 2002:a05:6000:24c6:b0:463:b7f2:cc7a with SMTP id
 ffacd0b85a97d-46da9508504mr2493751f8f.17.1782378626958; Thu, 25 Jun 2026
 02:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782224059.git.gregoire.layet@9elements.com>
 <73b2bd81ce70814612e6d3cb689c3296de742aaf.1782224059.git.gregoire.layet@9elements.com>
 <20260624-original-vigorous-mayfly-dfceac@quoll> <CAFi2wKbKr8FMcJeGWA5e1UZUTh2=LwYNkLEj6exd2as7=AcvVQ@mail.gmail.com>
 <b9ca9e36-a851-4a98-a739-ca99dd534d6d@kernel.org>
In-Reply-To: <b9ca9e36-a851-4a98-a739-ca99dd534d6d@kernel.org>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Thu, 25 Jun 2026 11:10:14 +0200
X-Gm-Features: AVVi8CdVW0AmRhEG0L6wUoqXHMzj3ec0waXKRN6u-RXjXnalVyhv5A88QhYFWcQ
Message-ID: <CAFi2wKY-73nXEKxp3vfB0RBsB+VB_stNk6NKk8gCopaoav6Tww@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: serial: 8250: aspeed: add
 aspeed,vuart-over-pci bool prop
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

> > It's a Virtual UART. Internally, it's two FIFOs accessible via
> > 8250-compatible register sets on both ends.
>
> I do not know what is Virtual UART...

Yes the name of ASPEED is a bit weird, it means that it is not a real
UART. It is two 8250-compatible register sets, and the data path is
handled by two hardware FIFOs (one per direction).

> > There is 4 Virtuals UARTs on the LPC bus of the AST2600 and 2 of them
> > are bridged over the PCI bus.
> > So, from the host, you can access the 8250 register set on the PCI bus.
>
> You mean these appear (or are) as PCI devices?

Yes but not as a UART devices.
The two VUART are accessible under the same PCIe BMC device, at the
VUART addresses configured on the BMC. They are accessible on the BAR1
of the PCIe BMC device.
There is a 2 bit left shift between the addresses of the registers on
the BMC LPC bus and the addresses accessible over the PCI device.
0x3F8 on the BMC is accessible at BAR1 0xFE0 over the PCI device.

The PCIe BMC Device is one PCI device where you can access several
peripherals. It's not one PCI device per VUART.

For example, you can also enable the KCS channel 4 and it will be also
accessible via the BAR1 of the PCI BMC device. KCS is a protocol used
for IPMI.

Only these two peripherals can be accessed over the PCI BMC device and
they need to be enabled.
The host cannot access everything on the LPC bus of the BMC.

Best regards,
Gr=C3=A9goire
