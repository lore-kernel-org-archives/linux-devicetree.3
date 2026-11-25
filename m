Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607453;
	b=XOL1Kf0Dwr76rk6Qz1Tb0KtUqk5N5m6jo9ukmI5N+aA4g4TIYMp+18Ch4FdxVgzHuCyF
	 eUv+xnRvaM2Nq7yQEqhl5oZySHCBBEeC2k0Nn2OxWNwrKK4pd+kyyF930UpVrzABAtWdI
	 Lc63qBAo5T/ZbyGSf0hDFB5qSEjgkgubNmagASdtNV1fh9l2xj5sd5ke2bPE/kRg+B7b7
	 25aypU81sMlKT4aTiGZpcnYDqniro9DDbhWYpb4UrhhvYBR/IxNVj45Cn/TfTPNIYag+3
	 ql6WlbqDxOB3lYgo/1kJnTfkuhVRZupTbcsWT9OvaiWmghSPerUfaFO9HDyDK6ZGtRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AK/FrytH2tf+B+57Lq9wnH5wu00oxO/OQC1ZXkryskE=;
	b=Ny2d6HahiMZUn5MIf9PRC/S5j7nRwH0EXK7rNacgCuBZ8u1NPfRhIhTVCwpyQ0Y141Px
	 QDyeJiRIgCGml3XrN+b2VdrcU7gH0Xe7Tp5CJa2jYoQeeGobtzjmgd83MKCzde3xyE2UR
	 qO9o2ChAyG1AkuLJkzNTSh4rbjnfJhj4mUgXRGFshaFeNxxW3+sTXZkYe997qfpMmKVX5
	 7zMkd16Zv54tIWDhlhv5kMfngG/4iYHjTWyx3gAm3vs23olKRORsTQSDZ0ny6QYMlhQ4N
	 XBPxzEsk0BLxOEZwZDOVk8kPic9yssqKo9+ilf/lgmhQWeX63MBnNQzoiNFg7BWM10g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cCKrplZv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7461D606A334
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7461D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cCKrplZv
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c506a231b88so770543966b.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:50:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795607452; cv=none;
        d=google.com; s=arc-20260327;
        b=NzhMxhVSIrFE+Do1l0IzcxgkkhKPTs1J5+P6J57nki/hYV/DCfpsQTD8K9/t2a5tpd
         xYD7/gp/uUOhMdPzkYQ/bklKVuHvjI3HnPcMrYmSqQsiBA7DOT4il4ruro4aT1s2Uo4C
         I+WW+8OAIxXcVD1uyY1Xvy8Ma3UT6fvgmzHFq5C2VRYOmedD4S6/TsZA7CqcTb2OgKmU
         RiPYXTOfQyzNF9Y+bipYIkwnOCtW/lIs5OLZo5pMLbSQHVKNcbJ/3bLjI6lehgiEoaDh
         esylkb3vi3d81DP2CGqVvvwIzfAebAzt4dC2yOO4WyHACrsebX5s+C350DcSTTmLiRp6
         SZqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AK/FrytH2tf+B+57Lq9wnH5wu00oxO/OQC1ZXkryskE=;
        fh=oFVldEV3PcN45KIEPvDBK4NBsJkargjCGqSEU4gIEEg=;
        b=lv/h73/CgyS5Mcs5XZMmrqVD1pimAB38jXPEqxQJI/FjhWP9usWKLmEwSy0rw2eZ7c
         AQ5Z6JivrjkVswTYzZjDagp37liGJjhyMoPgpFZidt/7VQixW6vFnMBxWB347DYo5fmc
         DIoTwfeIEh/rCzpSXmYEY5MGNnwEV6vyCNWWiCdpCPU3xzt6DZpzwKu12iswdGYpJAFc
         l3nBLTnTW6fBkJkChLEa6zxjNlklE/eRQmk/bMjp1Uww4E91UAyYAJfQZBvLoQrqpCdS
         wzyPyeaAvZOINF4hlckJ7oy3Hiu0a9nebAYxR6Q1GNo5+PA6RDk6621cPmwulQhNqRl8
         GMag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607452; x=1796212252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AK/FrytH2tf+B+57Lq9wnH5wu00oxO/OQC1ZXkryskE=;
        b=cCKrplZvKmTmChiU/HWkkzSUlDXxoFNlvdQW5t4JT7LvZaH0zotWEszT5kKBJmcN0m
         vPomZV2tFWvlHcSrTbIAZuo5IG+DDIIhkqdzaluUlsEaQbjEEHWkEha+8MbbvKJfHpNJ
         bXl3xKAlMN3VvWpQbWEtysh7LbJqy03KCAvbBb4/lPCY56uKVSlnQ/rDAF0EPCdFR7da
         whyxBm9WY9e0pNEXmVJmY3HAxKfEu64s8CS2jmMBv4BH0cWdBkWz2XGF5xzGEM5kJXEv
         Equ5HQ0aYS3C+qnGSq1ascS5uzpxPVUWCGsWcVKOYAfoIori+vEAGi22Mpu0Ajet8D72
         wlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607452; x=1796212252;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AK/FrytH2tf+B+57Lq9wnH5wu00oxO/OQC1ZXkryskE=;
        b=Z3XwzzMIuXFvXJG9oA+D5iU++19bu4NLaHtggsi1VbfJtF/Ymdm4EEqOL4FQhUfrVp
         TODB7hAjXzMVlZwiMNjLLSnAsT8Ygl4hIkLEGIlMTyb0tOdrun6lTIXVvkJg1Zy9hbGL
         RdsnLhnAR6fD6v4YjzcX7D7L42MP7KMqAkxuy22hI023fFvAZ38hi2D8sZD7czH8rXQu
         WJbHg41xE/kzGP5JR+FkyGBYf+Y2IWQzFGBFkWU5gmom47kHoTMLDB9aG+945pbbnsfy
         BA4J3J2zP/IWp+bSG+3ZqjB6oS260wrgM6in+J7WYvjw9ANcIp3FmwtLR/QPPRXyrnfQ
         SboA==
X-Forwarded-Encrypted: i=1; AL+hErHqUSnASf3mxE6VlENGl2u9OS2INd8cR+2QrkGwSRCaE+VuHaHp7rmqtgZeCIJ1m+2myOHbPFoPqSzQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/JhRnEirGce+ORYKEx4Sknm1SnqCPhZ8vX+2MVFH3xiaWnQdZg
	yR+RB8f4pLSEznwyj0DAGsuFLO83Z6YxGJ0eu+dnMi7AxxZaf83SuUHVmAQ5rTHeEnniS9QZ8/Z
	Fwpss9qK7RKBCQVxK9A1fxWgnxGQECaU=
X-Gm-Gg: AZFdTZdHz+JUV4O0S1Y2Aaec4CAwPimt5HxSXvJFgJ+Xdcol8+Jee6gLCjSrAtR8dc0
	LpInsT+eK1QGbUSDQJkGlRNLllps3Z74cpflAej0GmhozZpfXpeXjdG7I6IxeA0O468rBPQTPrJ
	e7OT/3NjukR3zZQzhU/e1u4EqWXoMy8K8T/fCRmOsBD/+k0/AusBKNXI9DjrgreiYHy78IWx3rP
	Ayj/tqvK/ltZtjbUfHvToP5th5MplTxYx0uzToThx6v2mHr71x/2jwjJ/7WWBaImfVDPUwG4SjU
	TS7X9pM5IGVTR1W5uA6871a0jo4EsIeCiX7GKflDfC+oBDMSrpecFMA9yx7gIoXmmHspXPdwQh7
	lywzbo2KONCztiaitcG1/V1PqhIiyNJX4DnR3AEg=
X-Received: by 2002:a17:907:ba01:b0:c50:521f:13de with SMTP id
 a640c23a62f3a-c513a897601mr1361763166b.35.1795607451572; Wed, 25 Nov 2026
 03:50:51 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
 <20261124094914.2993988-4-a.shimko.dev@gmail.com> <977f8fec-4cae-4003-b878-a7eb5aeee48c@lunn.ch>
In-Reply-To: <977f8fec-4cae-4003-b878-a7eb5aeee48c@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:50:39 +0300
X-Gm-Features: Aa3M54oKEgG2JL9N45FOQuqjvfRbhcjaW8XTghdzQJCbxKeIwx-6DyB-aMwShTI
Message-ID: <CAOPX746TNm7m6d6G-WyUzDptEVRJR0AuUzKa_Hg=P7s8CchhHw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: phy: dap8211r: add PHY LED control support
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, Nov 25, 2026 at 12:47=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> On Tue, Nov 24, 2026 at 12:49:12PM +0300, Artem Shimko wrote:
> > Add support for hardware-controlled LEDs and brightness on the DAP8211R
> > PHY. The chip exposes three LEDs that can be programmed to react to lin=
k,
> > speed, duplex, and TX/RX activity or be driven via the force mode.
> >
> > Add the dap8211r_write_ext() helper to access extended registers via th=
e
> > PHY indirect access registers, and implement callbacks for:
> > led_brightness_set(), led_hw_is_supported(), led_hw_control_set(),
> > led_hw_control_get().
> >
> > Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>

Thank you for the review!

Sashiko AI flagged a Medium issue in dap8211r_led_hw_control_get():
the function returns 0 even when LED_x_CON holds a state that cannot
be expressed as rules (TX/RX without ACT_BLINK, or ACT_BLINK without
TX/RX). I'd like to send a v6 that adds:

if (!!(led_mode & DAP8211R_LED_ACT_BLINK) !=3D
   !!(led_mode & (DAP8211R_LED_RX | DAP8211R_LED_TX)))
return -EOPNOTSUPP;

May i keep your Reviewed-by tag on
v6, given that this is a small, targeted fix?

--
Best regards,
artem
