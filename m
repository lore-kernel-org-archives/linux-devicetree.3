Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61F941D12B
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 04:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785816185; cv=pass; b=roNuYt6KkgoMucjScsRKEv0mfAZXXRugnXptgcaCxk2jLclHP0vI5Yh6ZzTu+eNAvF/GzSCakPIlR2AcuLHEOQSwXUpFaLtL9xnNP12b1KsB6mTn2hR5n6QAfmM6Zs3XMI0ErWTyvuQ55KB+XEoWY0pPCn89fgKPzgX19a5xYT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785816185; c=relaxed/simple;
	bh=RkdB92KGZY7tyP0CuxNF3WyK0sWw7koVzFr0NNoR0sc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ioxSU/UrRAgil82uChaROQ8ZQ+SfbKCA2sCK98FETzS54TeUcOzFOvTUsPmujH200/l4ae7eh7oVAR+GBOK++c/PTRaUMckDlfRKEYdlQKay/3OvfQ3IpMob4l846REcTJDKCoklY12CtJICICSFLQnO/bCx1ihMe6nJEwaD5Os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xb6qbD/g; arc=pass smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xb6qbD/g"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-754ac74c495so1283050137.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 21:03:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785816182; cv=none;
        d=google.com; s=arc-20260327;
        b=g7I54Zw2kSvcHjORRWKsp+yESd07SUfnk8PX5+nYSRAsj+rBPxZ+GdSJIG4elpiOQY
         sK00VybcYRJRUVm3PQLpabfJkVXDA3k2D1FwcRJk0KeZq499f6boCLGsrYuoc3qD0ds/
         YQt+KQq8eqSsIb9HJxmRN6tfML5gMYScbQuNZGlbiS8LZdM19nMi2nLjivwA8SgCfdaz
         2gMmHz4xuQozbEjxQZKo6lyEuLFHp7fii5iDOU/9bcCIbvNUaa96CQZmKr2QbDPhFs2+
         ZLMk1KQ7ixBmfuQgQddh06D96SNZ1YV7dMGvSeDFp+9hwfHGGJLRQgeqpEZLcGaezdos
         Kd6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vjyfvHU8F3NgL4NW8N8+pld5mLwJIrHHWmLLvG4oy4g=;
        fh=PMcWp/3C8A+044li5wmHz0q65H76b4UyXAOe4l4PW5s=;
        b=sFHVOAaAM78RkPlJqV0lQt5fGbfc4msIVIN5GzZ/LJEQ+zgZlzz3UxTFczlQTbi4Y6
         20e4aRmOjI/qmbx/TB/HsJrOQ1EinlMuQstJ0s8xkOrAbVBXv7lz2Nuj66zldympmou7
         Hb56HEIN+sdokMxRh4PHYxvpfykvXKqtGIWBZQ2OuRwgn2/hB+420C8WVUlVQ65HdGXE
         Bpxy3s/XIhuPDEdXsYS55uM2N2wc5ZGEZlBa+aiEWvWGRLrI51xUwU0/kJTiLYn6jm+E
         2HfmwI6R3CLd8BTUYZts2U30dpy1aPmIjTLB7KEsEzVVLAntctmoBgxxQZLIzTFhOPTC
         zooA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785816182; x=1786420982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vjyfvHU8F3NgL4NW8N8+pld5mLwJIrHHWmLLvG4oy4g=;
        b=Xb6qbD/gZN1fxX/kenbFvB0Ro308w++AMJG9KrgkmFLQjh37LT+apr5yEExHxIQfWS
         vS7dDwtgO3zUGSHvORS1I6gjydYmv+iz1zk7MbRBhpS09tFAXLKYpseGge9ZFX546xXT
         ANSKOfFTHDPLRbfoEXbanXm+Yl3Wpf4ixD1ef/DN7ltNZwmXrkYemL25RjqhHPR7H1qx
         Jt7+ua2zvaE3FSA0iUFTfhitzmq7dKa7svLIqeTTLYCbNfjAuC+pjmV3uQ2HN3OUUJur
         E1FXlrSXn2dthwG5naVNzxW7+LOJ863Kjl54IVd7LByAwUPUyK1Cw2fXatINDcMM+Z8V
         +WJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785816182; x=1786420982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjyfvHU8F3NgL4NW8N8+pld5mLwJIrHHWmLLvG4oy4g=;
        b=g8kPCsuvuzFpyOPnbtqUHa6WsW6Y8MNUywsRBMv0J8bCEm4rn3pjSAP23Bx48B6iKA
         vIHAcU+rrsfiRzpK9Jamw6whOyWpWn5mD2XbHhr4frywZ1WJ6EyPPRYjpHPCMqu8gW88
         9SZ5EGEP+mKDfNGTSxzpgq4EQ6NH6YjrhxwYXlwpuTbRYcJIEL4Mukre3NCFed63Qzry
         Dp/SifyzoDn5U2n8UY+oE9vgGGeE0YgBhPnX1x3cUi9scTLi81u6LjqJSmpRG9eYiwcK
         q7Zvy+We1vHZuXrlF/PlogpxMhYLsiR/4p6l8DtSTc19K6N/r2yxoNOtxGD8yU10xyMP
         NBLg==
X-Forwarded-Encrypted: i=1; AHgh+RqN5p8SUySeYY0Y0Q93rwV0A31RmXu2Mq3oqUnGmHDSGKYWi7MRG+KQv6D8Pi7mXQ5B67lk+WixQOeQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yynit91iIa/qXFn04tXHn/hvMenIKDy8xehvcny8Auo1kInAtaQ
	6TFHnJOn7KyxEUORKT1KixZ8T1/E102jJovGKkt2pC6K4m/xH0DiyZf37TYdbGafBBrgdXhesgc
	U6OrEY2dgz0ajOL88OCUVP4SJlXuszAA=
X-Gm-Gg: AR+sD119VHCSiH4EDrVZXBCPFK/8ntkPc5c/pz5r0Prwhv+ZH68c/Gr9psYGkkSCjwR
	jhNs/Ro2AorGOW1dR+8Fa+MAuuToDC/7v7nXg/5tZPRzzKWOyFFU38M5pyjQafgQdZ9eDLujpzd
	fHAevj6PxneKYJGEvPGCoDI1T6D0f/2f7cZkrdM70WVT4w23uh34ZEFk2I4PJvbNSwmesoSjo34
	gAKRPkE98t1SwNAPiakHmQNL5YnUECNssv2Odg7bgxMvdPEoAxbR4ZQmfYOkFkN/BNbcK+m/oZX
	DagzKqvVLlrem7tKFpazXjT/q6cadPQgOE13TaRTI/8yjBNCl6Jmo58zpkzGZX1zUe4yqsPXJBn
	5FRCQ083K5zEdsfUBGbz7JpodgB6fz5GFJT5q2abrajIgv8CVfQ1RHuSeIRwWO/c3eAT4ABFn/V
	k7rlrtaZ7gXSEm9Rz59KP7B/2RWAg3sKzM6gOduolcioCb1NzK
X-Received: by 2002:a05:6102:6899:b0:726:cd42:d023 with SMTP id
 ada2fe7eead31-75b2375d6eemr8045788137.11.1785816182410; Mon, 03 Aug 2026
 21:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-submit-mdio-of-dynamic-v2-v2-0-f8841f3124d7@gmail.com> <c1c5ce0f-2c65-4c19-a525-cdd2ef33b6e4@lunn.ch>
In-Reply-To: <c1c5ce0f-2c65-4c19-a525-cdd2ef33b6e4@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 22:02:50 -0600
X-Gm-Features: AUfX_mzYnShoXS6dXEQ_Ip01VArc0qPkR2yK0Lso7PSkwQm8kgd7SY9mx0R0MLc
Message-ID: <CADvTj4o+B933k4TUshgcvZ4tENDbit3fHEBtwy5ODpsf60osyw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/3] net: mdio: support dynamic OF device changes
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 8:06=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Aug 03, 2026 at 05:48:09PM -0600, James Hilliard wrote:
> > MDIO buses enumerate firmware children only when the bus is registered.=
 A
> > later devicetree overlay or status transition is ignored, unlike on I2C=
 and
> > SPI buses. Supporting live reconfiguration also means that population a=
nd
> > removal can race address scanning, PHY attachment and bus teardown.
> >
> > Patch 1 factors fixed-address child registration and legacy PHY scannin=
g
> > into helpers shared by initial and dynamic population.
> >
> > Patch 2 serializes MDIO device-map changes, reserves addresses while
> > registration is in progress, and coordinates scans, attachment, removal
> > and bus teardown. Dynamically removed devices remain pinned until bus
> > teardown, preserving the borrowed-pointer convention of
> > mdiobus_get_phy().
> >
> > Patch 3 adds the OF reconfiguration notifier. It supports fixed-address
> > PHYs and generic MDIO devices, scanned PHY addresses, and Ethernet PHY
> > packages. It also preflights overlay removal and rejects removal of
> > attached or in-flight PHYs before their firmware nodes can disappear.
>
> This is a lot of complexity which i think should be avoided by just
> getting the bootloader to put the correct nodes in DT.

This should all be generic OF_DYNAMIC support for MDIO, so the
changes shouldn't really be tied to a specific PHY driver in any case.

> If this was a hat on top of a SBC, with an EEPROM indicating what the
> hat was, then maybe DT overlays would make sense. But from what you
> have said, this is a fixed PCB design, nothing hot/cold plugable.

Some H616/H618 boards have the ethernet port on an expansion board:
http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/2=
W-expansion-board.html

>
>      Andrew
>
