Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBC947DFAF
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709277; cv=pass; b=sRrlojDXl4uuAWss9xjy6FyCfqxIHe1v5QColSlUbVB1OGhIFhH7NPeVKwotw9FRMOj34rE1oOe5/wHvo0pSfxNsD91Gb5QJ4ZofS0Lst2KRp0SItd/2IBZVAiOBKRlg63ATWOTo8B2KIqwRJGF65/9yonieZqQLEzvpU+efzRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709277; c=relaxed/simple;
	bh=nsI28AOe10DwMfFECWTYXs7YxbtRBLvRLKMl55KqieY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOsL3kDSFk+CPvwhMrh4p+7do6rmsqwPtc+9d3Js/+iN2KU9PJouQPdLKy3hp6Hbbb+/33n1bI0SiDhlGij7OqKMNj60wrEblkTT20c+hMYCTdxKReTsfLqGfeIbqGs+M3PRPvMkInZO2yPIpAvUzLqSzIGDD0g2oc8m3CMEMP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RWUIahWE; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RWUIahWE"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-80814edb536so92472797b3.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784709267; cv=none;
        d=google.com; s=arc-20260327;
        b=MFs4Yo1DX4v2lr43wxS8gngR/CcH/7m1B5Y9RGniWOrp1sorM1SY6HnhKbReYzp5jU
         L662Co8r1uMcge6UTubo51z73JkOXLkNeSzZGknHSdRBziuygC5d5BhhUI9SHxweNjIv
         EWgkLjM0yMBgyfBDcPWPMkUjGt/v0lcy5JaNd9NoO3P7JJaYbJ2nyarAVBEQY8HXDUsd
         j3tnyElVpUnM3ejetU4WXtVHcMVwJAxTIbQiNVgSTQkeRjY5hXscdm18IKCVAX9xRLtN
         mgwsIlpVWeokLIBpb5ym5pemx+Y31ERy1xPhMiM1O+IVxkRtYiv9SYcYXqAlx7ItIm2e
         XFOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mo8WgYh25ldjyX8DCM5vtgvNxtGzO4105EDC10m83EQ=;
        fh=LNqm7OEtV5slkxbFy776T0aQptq2QzOio0jLYBTL2lc=;
        b=YQSLlK+p1RlwyWUz/GiUP4nsBYlrJmnCroCcpBQuOIB00WvIrVcdZge1K8iaz7Pzmz
         cVVvnOnKHisOct2hy5EgLwQfsKbibFqltfNfzE2c8BaNXd7Uykeb4BWwXPbjAPPveNKT
         G0i+3O9eMRNzKAtgpkT3Epd5XrIwSrC7nJ+1SFv3/xPcjUk1d2MaksVPzZ7OikzIY1Ns
         cZB+9PAK3iTs6GhTO21FHHku5jbkEYeJuClukptAb/tmlrhN0IOPx1QrDd6KFyX5eFef
         J3hj1YWv+rgbrakXQCVHgkBPtALTKAr076zDR1Q6LlDDznYzIv2Kw5kH+M9OtrzmA+ax
         izCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784709267; x=1785314067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mo8WgYh25ldjyX8DCM5vtgvNxtGzO4105EDC10m83EQ=;
        b=RWUIahWEmhU3BvBkZbity1BNYB/Eenyu3p4xEb3lXaQGwCayDs/ICdYUkdFJIxZZPa
         WHjVR/qucmaAcuUmqM5TLYPBhmmCsQ7WOjIk2AK7kbxHEzZJgk4P0iHS8JqJg2iiEET+
         REScANg4FtV6kYkmXLaOm6qYzdjNFCKd+3xec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784709267; x=1785314067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mo8WgYh25ldjyX8DCM5vtgvNxtGzO4105EDC10m83EQ=;
        b=UMwY1598BwU9TY3wiyP4inlUa89V96ciUTbnJtRrM1rmQ1bCUu0PyrZLDAVJ6HLTBI
         b/I+aTepuXYtrkvnnojdGIy4f3BllWFIIUnghY+xOL4w4W+fbGHQGo1pX03t6euGO70a
         p8hXUxYJ06UOgWsawftglnfOF1aCzzOzTXPcfUnFU/tAne+RIXuwmZ1T9FcyuGhZ3bC6
         0XQqrb9I7Vj028/h0xG9dwcD6I2+F5od3WC6QIvYSEhferI2jvB+Ejclr6SmDtbeQawq
         z7ide9Aln21Ota/U1HZDLJ348TXp5sQEdWR3+2MyWdBAxeeg1Yh0QkkZCYwrSJmDzViN
         iBrQ==
X-Forwarded-Encrypted: i=1; AHgh+RrqaGpEEYtaYWzf4ejYyTSZBN8YNzeHOKrVDmeHXfJPGl6UTiHNVoDs3KKfjPoi7x7XHektjlUNp5El@vger.kernel.org
X-Gm-Message-State: AOJu0YxXwQIFaVngpAerg/Qq32YhMKPNS7XHEF9PrvxkvvGWWogaQCG8
	nj3FyBOYIlbSdmyB6qXN8IfMrWcdXGcSZ5o6E8JcejyTVKnoaVn0EHYFxPYtKGF1mcQ6/hbXfgI
	oRD5laXmE9qH+3gcLb1gfEfcIT4++YAO1yKScckeKCwA9SsLrdzA=
X-Gm-Gg: AR+sD11RT4tu9YPxQDK+cNl+jscNzw56EKhjJnGoMXQCiu3sh+OcK2KpLbBB5jHfEtk
	PLH0fKcbcmNTOJXxKP8UMWEiCy0UkCwZMwO6QbLRvIjIy0CrEi6uLuCwhoTgiHWgOQYpFqCmSzS
	ZnKgIA4eUioNdkebqqThSJr52jGjMgyJcXBD9ONLfY/yLYNvIPZyz/8k7onDQ4CIGzBGfElm2AF
	Rd9p6HUVnUWZURHU7jPyxUPCpnq0a1IsEG6r1c4Qm9fUYRTX7fHyupA0ONUQg6/9F6JuF8A0ept
	uPNr30C25QK1/KnB
X-Received: by 2002:a05:690c:c453:b0:81e:bf0e:55da with SMTP id
 00721157ae682-81ef260c885mr66446937b3.48.1784709266701; Wed, 22 Jul 2026
 01:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721075226.2347933-1-wenst@chromium.org> <20260721075226.2347933-7-wenst@chromium.org>
 <al9IwVR7Whw2DiXU@ashevche-desk.local>
In-Reply-To: <al9IwVR7Whw2DiXU@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 16:34:15 +0800
X-Gm-Features: AUfX_myMObbdQM6Uou8RDo9wMrLkt0Z3Ce7LljI10q7k1rjjaXzvygc1Ey8OWtE
Message-ID: <CAGXv+5EkcASZ__Cyp4PnwemPd2xAe+WL-ics9jqHLuxWjWyT7w@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] i2c: of-prober: Defer regulator_disable() on
 successful probe in simple helper
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 6:24=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jul 21, 2026 at 03:52:20PM +0800, Chen-Yu Tsai wrote:
> > When a I2C component is found, it's device node is immediately enabled.
> > This triggers device creation and driver binding. The prober will hold
> > the regulator enable reference across this part. If the driver probes
> > synchronously, then it happens within this window. On the other hand,
> > if the driver probes asynchronously, there is high chance that it
> > happens after the prober's cleanup function was called, in which case
> > the regulator would have been disabled when the driver's probe function
> > is called. This would then require the driver to wait 100 ms for the
> > hardware to reinitialize, even if the probe function was just a split
> > second late and the regulator was disabled a few milliseconds ago.
> >
> > Recently, some of the drivers for the component that are targeted by th=
e
> > I2C OF component prober gained the ability to skip waiting for hardware
> > initialization if the regulator was left enabled. This happens when the
> > PMIC has them on by default, or if the component prober left them on
> > after probing the component.
> >
> > Wait a bit of time before dropping the enable refcount on our end so
> > that the actual driver has the opportunity to catch and increase the
> > refcount on their end. The 100 ms delay was arbitrarily chosen.
>
> ...
>
> > +     /*
> > +      * Wait a bit of time for async drivers to probe and increase the
> > +      * regulator enable count. This allows the drivers to check and
> > +      * skip waiting for re-initialization.
> > +      */
> > +     if (defer_disable) {
> > +             dev_dbg(dev, "Deferring regulator disable\n");
> > +             msleep(100);
>
> How was this value chosen?

I just chose an arbitrary round value.

If both the prober and the driver for the probed device (trackpad in
this example) are builtin, the time between enabling the node and the
driver asynchronously probing is between 5 ms and 30 ms, but could
also see outliers exceeding 100 ms.

If you're worried the value won't suit every user, I could make it a
parameter of the simple helpers? And the user itself could be made to
probe asynchronously to not block the main code path.


ChenYu
