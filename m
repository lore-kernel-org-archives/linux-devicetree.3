Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D08937E5CD
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 03:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790826254; cv=pass; b=g7La6jqg0jqAb2ksZqlsX7iPXegMg/26YARHDLLJ/85f/AQnBc5vz3ptWU+Kub+twSB9iYSa1wq/YhgQNVHA8GEjfIfDq+d6bg1gB65U33cIWJbtKBqOMzv1xcWKJcX0mSrtUSJm8p44yHtWRyh5M/P8RntflYIMr6L/BmK6lek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790826254; c=relaxed/simple;
	bh=LrQWUWcyoDeObLLAUc8VHSE0FIeAJ25asgQVsl+itso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fdwmu3O2d2ZEJiwEL8mP6j75WrXFqdlvndj20eElbGPte24QYZjom6EQ4/NSWmsWPfw/hvuP5FZO1y2leq2ShGmeSmWytaEvWr/BNX1Inv+bfqQyMXvgsPyy/tpcb6Km8/UGZTw2gb6PMNQ7h5xSgTxMFPmMar1C8RPqHm6RPOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9Jc1zxA; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9Jc1zxA"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7fccba9c675so2044621a34.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 20:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790826252; cv=none;
        d=google.com; s=arc-20260327;
        b=VAwRU+GZ5z2vCGwyTt4eRDnYp2oBg7N6qlCw7yCQqh/nuN9QQi+dNSuHQhpmdlOZaq
         Ig3fa3MIufJGE0Gp7d6coB+U1tCieGolaCQifl5XGu2NaL7mUWZb7sMSbkl++7KrFEKt
         GJrRNoqI/jhWtqCIQA8dv8EnYg/djKZtug48JZwHiqq5DkWRqt8ULLidLwHaB9GJ73Y3
         rAmxsF/663Y7eeVlNaT9ujB6fm0Q9ZLNXA25PaoiUg7hv/CSph/NcPCQ1dHVw1ycu1w0
         HGsgC/p90cQr0T0MQxrx1Oz+qt+2eYwQnUW/vcJVGSoqSN4opoHBkbY/szP148tpjYZE
         LJ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w4ijuTp5svOtTgrjejnJF22Eh5tEOHO/CkeB5GXCR3I=;
        fh=wgulUv0fgtTFqy3RUJXKcWaV7cto2lE7vRJGE/0/6qQ=;
        b=re8+LcF/yf5z3QwR9ouA8Z3gddeNhn6PoPbpNf93OTFenPV6mV6+0R+RjZgwc3J0rq
         SbL4COqgrthb7PSGbTUkEKIxg+StQMdiyWXZg6BhnYxrwmQqm9x+UTZEoedPxVRSnENk
         /iG3N1hYOFcsZ+tqYsHwJmstWE9yIwgrTo0fKi38GV6C6AdGM55hHZlOT2QJsLv/62Jp
         07dFWOAv6i6wCx2oQVVRnhBa4pQEj9tTv19dvGjVkuCkf74s6MShK1W2fhQ/3ZBwurPH
         +p/drvuSIaPSdeaC+KyzNC9I/BIovEMOc/sJAoGdn4c2ao+78SVrKaFBhjybm+HedqbP
         ohrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790826252; x=1791431052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w4ijuTp5svOtTgrjejnJF22Eh5tEOHO/CkeB5GXCR3I=;
        b=o9Jc1zxAb92HTvsoBZV+o+DGs/vsigXorO3UyF0yWl6ETaIFoCdaWFcnYsKbkQIsiT
         PqjlFb8c4gpi3qxABs1PJhN5O9fqNgVbB3FEeHladfxFP7uxut/9RI5eLgq80z/gDTXz
         YzO1N1j3t3RhEiWsgzsfC1+QfVMhzwA9TdWarQxiLRJh/jrWizyXnzS1xNsP4JzdPoOV
         Lz5yHWpPEKG6w/4Z+QGl6OMhEOkTsQO45UvDo4HNYWdlEWThIPQJU4x1TY7o/bJtnG8r
         +F9nVVlDJqNwhNDhXvMvye6drzN4OVYWFwneF5FsTjsDTHh6kfh3hGxIBjLdI28s3Xq6
         EiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790826252; x=1791431052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4ijuTp5svOtTgrjejnJF22Eh5tEOHO/CkeB5GXCR3I=;
        b=fhAqwRsDEL3UjVzHAawCaioLecLQ3MfWUQw3aZq9w+eIP6K1qmYejFrqAEFVmMjV3f
         u+VN5OXRO7ro2PRBFeXD39q8FiuBi8VNd86jBuXjTtl3wjUbFFFp8C2G96MKNV6Z6lUP
         WVtmriOA3v1YXT+u+Xsj+/WRJ5rrHLFOSVM8SCPmwmjD/qhAeyUuGFupw/qJ76pzb3Ej
         hh9GlshQ3PHgfZTbX0FCsS602nUYclN+9Ixy5qY9AMOMY87OwW2CY3+D4Z3aBedxbLup
         d6kU6jsgdT8Am+TnFN7HYLJeCx38aJ6X+zqLg+KtlSeeqft5evJ6VhSvHT2mfQmYwS8R
         xU/w==
X-Forwarded-Encrypted: i=1; AKwUvBwc4RdyCHHgdrNXbAugjZPzwfutlT2O/T8n4wpzcCHkntb9r5c0KLLLSmbfusTK7t24VHLqsKEJzWOc@vger.kernel.org
X-Gm-Message-State: AFuF++lGXkdjDafYhW4M++huDQ2wZ25+PPqbu5/ZfgYeeL+imy4BfJh4
	lv5qntQdsW4i7KgxjZfclQvvqXJw5aypo1Bg+HT0HO1CVeH7TE+NNj46xTNPiKgEedcIX/Jtake
	qiTj6CZFTFMGRw9IfVxxcTE0YZMrS7Sw=
X-Gm-Gg: AYBFou056hOk5wxUzJt+AIAqSGYSWJfSYANVEJN3XR8X71a11ta6g5gQWsYGmJIds/w
	Dza0PkbB3GyxlIX9oGRzc0Xm5akX9JcKfQmSO50uN/vPdR19af45JlU79oahML1cyV8nHJHQA6R
	mWIzcxB4/uU37/MrdQk7oxjE4u7QFJpb7PzdwbYtMQdhkMeuV4TteYZb82ORTmrud98QkMKRBgG
	6eMrWT3eMi/du5e6kEsdrK6IjoZ0gqbgt0niOW+OJNFxEHAXoqUSWDdR7AUM3QMl6vBCm7gwvCW
	/sx5+zTu9eRarPkIO6hy34p/kBuKEzYxcv7C/Ldfm2fwRJzuPtG2qNG0gp/HCVxkrt0=
X-Received: by 2002:a05:6820:4cc7:b0:6d9:58a1:824 with SMTP id
 006d021491bc7-6ddba7942ffmr1480642eaf.22.1790826251774; Wed, 30 Sep 2026
 20:44:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
 <20260926-b4-mt7629-toprgu-v1-1-c124bf9ac273@gmail.com> <20260929-spiffy-harrier-of-snow-b78e7b@quoll>
In-Reply-To: <20260929-spiffy-harrier-of-snow-b78e7b@quoll>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Thu, 1 Oct 2026 11:44:00 +0800
X-Gm-Features: AclHuK9LNVBWetA4umqzLuoUjfCXVTn1WDE30aATZ75mv1-R3SpbZ9mzZOo88bg
Message-ID: <CAJsYDVLimYZXk6mFrnsObCYFnK3HxqVJpuee+msnCi-GAUTXbQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: reset: mediatek: add MT7629 TOPRGU reset indices
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

On Tue, Sep 29, 2026 at 4:44=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sat, Sep 26, 2026 at 07:13:59PM +0800, Chuanhong Guo wrote:
> > Define all seven reset IDs documented in the MT7629 TOPRGU SWSYSRST
> > register: INFRA, ETHDMA, DDRPHY, INFRA_AO, CONN, APMIXED and CONN_MCU.
> > Use their register bit positions as reset IDs.
>
> If so, I say you don't need bindings then... but fine except:
>
> >
> > Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> > ---
> >  include/dt-bindings/reset/mt7629-resets.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/include/dt-bindings/reset/mt7629-resets.h b/include/dt-bin=
dings/reset/mt7629-resets.h
> > index 6bb85734f68d..828919eee298 100644
> > --- a/include/dt-bindings/reset/mt7629-resets.h
> > +++ b/include/dt-bindings/reset/mt7629-resets.h
> > @@ -53,6 +53,15 @@
> >  #define MT7629_PCIE0_USER_RST                        30
> >  #define MT7629_PCIE0_PIPE_RST                        31
> >
> > +/* TOPRGU resets */
>
> Didn't new bindings switch to continues indexes?
>

This is written for the existing reset driver in mtk_wdt.c. I don't
want to add a reset id remap when all the other SoCs in that
driver use binding ids matching their hardware bits.

Is this OK for existing drivers?
I can also live with plain numbers in the device tree if that's preferred.

Another option would be to include mt7622-resets.h for mt7629 dt
as their TOPRGU definitions match exactly. But that would bring other
unused mt7622 definitions into mt7629 dt, probably not ideal.

> > +#define MT7629_TOPRGU_INFRA_SW_RST           0
> > +#define MT7629_TOPRGU_ETHDMA_SW_RST          1
> > +#define MT7629_TOPRGU_DDRPHY_SW_RST          6
> > +#define MT7629_TOPRGU_INFRA_AO_SW_RST                8
>
> Best regards,
> Krzysztof
>

--
Regards,
Chuanhong Guo
