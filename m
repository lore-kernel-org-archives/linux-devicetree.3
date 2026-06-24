Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE68E272801
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782305298; cv=pass; b=cvQWIBCb6deJuHg5O8eXgE/SwshpgYHlGojBL3/GVlH34GnCXBq2BmOnVw+jvAQM4oQchKTFK8VJWbXhoaovgjBBTH/gWkhhMPF/KmJ/uSsOwUZ2QHXDGdd51csK5mNknY8rz70+OGZJlzqF7w3xlolJ403IiG0e9CWtu7v3imA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782305298; c=relaxed/simple;
	bh=Eq5j+mgRZceDcTZasDH7TbWj5H7RHsli0Kha0kPj5L8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQSIseGICzoBj1YJBrJI1WRESw5jx92rJKKC2eXLF2WzrAcRowA7A3hPX5XJAeNoWpNjOd56agZRpZKi03E5dwMh19xyLUOOmN5cwDhYdKR6mQ7wjsUco5nhVbWOIrGJqgbZtkpI+CuncBDGh/7VtI9U/AJpSpxkWfk58kNmnbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=fqnf9DNj; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="fqnf9DNj"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so7442715e9.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 05:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782305294; cv=none;
        d=google.com; s=arc-20240605;
        b=fRzVESrlWwA0fps+Lrjx0abvYvlDk6ksrLOC9RAVoLx14TyyAbdueLxQklU4vO20Aa
         W2BTdv1L/5TSGTH/Zem0Ro6v22MjiT3SCd8IndHfseqaoIJdvXjIvUx+mfGUzPg03zL0
         3diJVHBFvT8aTC7fidNeiPal6tz4LCMZe8wRKbPXe95u8WSUjRt5nby9rjalpdNW5QVk
         bDqxnX8gsorcsx/Qfglzer84ivndBFa7WKso1X43kokcTIinuqQrdbXQhit/8I692qnY
         SERGbKku2+bubYLKuKMo6GKmqWzYNU7Q3xhNXDa8njJ3/WHvyIVPYUxX2GH2zKi4jsAs
         JZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3MWM4Rp4reeuC51yhNdvSwjoOhRN6bkNqY5FS9+XPUo=;
        fh=BDM+GzkB2qdRQsh01yBOMDtu/GbiPw+N3mhU3rpW+BE=;
        b=NLFxIRBXdPwci0fzn5qlfJbga00BjmcNrDOWieIokYq0NTuFn+Y3hPvTg3Yn6uGQDS
         6g2ta66eVQtPtIrPp7IVLBoDQcpqZCYkOZlgbhvIbp4fFUPeXbnAvhgbneOmBeAmdK5L
         svSCeQ45V7Pah+0IOOBtq/a4ElKONqL45kFQPDYoKSZpZBS6EVqgPPT4o7w84N4A1FVN
         8JGWkFaKCj5Pung1QJ32+4TihiUpfitPnDSuACAbLDilOh1n8oA8TCW6ovEzXWUkZcYS
         dKXO8shQqTaEQwLm1dHk6/R3Kwx3RXuAHylCmd2O0vFQCnVq4x2/O+YiXaHa9KnP3OpE
         T/Mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782305294; x=1782910094; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MWM4Rp4reeuC51yhNdvSwjoOhRN6bkNqY5FS9+XPUo=;
        b=fqnf9DNjSIG+PyANSfaJ7VvDHz04fWQ2iaVTl6HHaguDnrGx1wftZnISlg1J5SjqBr
         i2eOaKvDnDBrxvlBaXejSDV14WfltagY+zqG5khJDKD7HUtwgM/b75/EzlF0kyva1KVx
         +CaNb7dmLRNCzxDhYQxljaFLFZ7QK2sY1fQHDQ3A6YD51F8U1anI5fYLG1fxbqBtGYIf
         rr1er2iUvBvgl9heXvgTKlHxZs9pGN7bET199aOQoG8Pogspka+f+qT2k+uOING32vM+
         K3+UMd0rsrjEaggQOWnaci3ePlQMLXfdN+wMsas1iB+OiwmKfxM3YuwTniWbJFT9aB66
         LBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782305294; x=1782910094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3MWM4Rp4reeuC51yhNdvSwjoOhRN6bkNqY5FS9+XPUo=;
        b=V3T9m+DKy/BOFQCCPUiJ8ZoFb7h0BYZ2JqT5sMMbf/Mn+Cc8GsC4vNd1FIpOL1D98C
         iCNTZNhnvy0I0iDgEwHFD1m+FVW17CuUNc+vkSCp+HoYeSEfJhSj+okb5dbS0d/Z04rf
         ZsFlkgJP8bH+H49lOC630kPosyPBoLeiLLTkNPbH297Wfg1Yc6ucdKIFk1+K/YVyBfF6
         InEMQ1kCOzYO9KeJo0H1cjkn5oH1aJ765MKGiNYmdmgvfx1fekFZxc3rzwutlnDrucRs
         UQT3hOu+lABpTFchmEsYO2uNOC/mNBv3vEfYzf4SyrHET8P2q/ZR5F5YN4wXUtGIfEZZ
         M8uQ==
X-Forwarded-Encrypted: i=1; AFNElJ/6brmQFCDJHsb6rqKvNsOd/pGnjoqENPjBoF6ni57sMAJN9JomCws+8c/UGRgXmrxkg+B8oaPaFpkC@vger.kernel.org
X-Gm-Message-State: AOJu0YzVC5DPveYYxJ88C8S/58Vx/joButfw5AswLSdgjTywwSlL8CeQ
	b+/jDJISoWa/q04AQ7ngQAEaLSw+PIa8E/OxzMfynCuqPDjRUdkk76R7IoZ5N0eb7Zd6gDtSX3q
	P0FuBJ7/0DTXw6yFCpTGR1OafF+Dj4ny/KCKQ1/GYyg==
X-Gm-Gg: AfdE7ckxgvF/eDbsH0xaPHFK972hmKdupLBjEUZV+AADpAuWcx2bxua8HcyGHhRGWg5
	flvwEsW5hQFOcgUrkKlA1UCf9Kgl+SehX5XLwI4EAFXeCf6a3Qjmm6NDffeUJLwcSFwTRGNFO8g
	onvg3Xf9UwqzjNzDXG3eX2Mdyjw09UWgWT4kAPVI3MvXW6bBiFpBxgCVjU3KZRfEyIEhNVTRInv
	9+aexh8SSCWxenIYBCZme0bHNtqAcZPAf9HhS6lHXddDEcwGZXzybaL+qU7PI4lgT8enyfmog8/
	aEcv/h4iM2eQH4IwCxtU3Wq18FAAaCXtUGy9SfxzT6G4JQI+S/7831DrYA==
X-Received: by 2002:a05:600c:699b:b0:492:6113:d4fc with SMTP id
 5b1f17b1804b1-4926113d5camr38002035e9.17.1782305293997; Wed, 24 Jun 2026
 05:48:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782224059.git.gregoire.layet@9elements.com>
 <73b2bd81ce70814612e6d3cb689c3296de742aaf.1782224059.git.gregoire.layet@9elements.com>
 <20260624-original-vigorous-mayfly-dfceac@quoll>
In-Reply-To: <20260624-original-vigorous-mayfly-dfceac@quoll>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Wed, 24 Jun 2026 14:48:02 +0200
X-Gm-Features: AVVi8CeO23_9ds8O0yHhJLM3WPWltEB3CF7pRM6viO6egbyN_FuIGSRsMbnIPSw
Message-ID: <CAFi2wKbKr8FMcJeGWA5e1UZUTh2=LwYNkLEj6exd2as7=AcvVQ@mail.gmail.com>
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

> What does that mean? How UART can be accessible over PCI bus?

It's a Virtual UART. Internally, it's two FIFOs accessible via
8250-compatible register sets on both ends.
There is 4 Virtuals UARTs on the LPC bus of the AST2600 and 2 of them
are bridged over the PCI bus.
So, from the host, you can access the 8250 register set on the PCI bus.

> > +  aspeed,vuart-over-pci:
> > +    type: boolean
> > +    default: false
>
> There is no such syntax. Please do not introduce own style. Instead,
> look at other files how this is done.

Ack. I will remove 'default: false' for the v4.

> > +    description: |
>
> Do not need '|' unless you need to preserve formatting.

Acknowledged

Best regards,
Gr=C3=A9goire
