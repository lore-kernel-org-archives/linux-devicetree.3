Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E894C4A8A1C
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050583; cv=pass; b=QSNdN6ytpgi4EDVhRfLb0851O9LAXNFAkOu/JrWhOMBtBTBqDmEg0IA/9gL4IYllzX6ct2KMIOsRB9Fy8OTjCCWn/rJhLefAAcGCUzUfy61SKvyrgC9FFheA/Y8d/BRgkuUiDSAU78oKmWTXhHKVAt1plsQKMjZtBKdVrq6yH40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050583; c=relaxed/simple;
	bh=s0GzHLToX8l2pJV6FGUrdQW+qoZWtYzYSSm2Om3AhAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVyjEkOF5woc/vbQg9F82Dqj6hh0n8g6kgIjYrR2ZdHaic+JazghoXtzjG2LqdN7EW/SmFDabAiNs2jfvjszeYEzcg1vHjl/W9iTUwRrMmwVWkqMi+912PPN/0YhHeAgeD46bUrEvy0OiuZgPRyVD1jwMa7Na5M15kviSY9T+VY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0cx1fJ/; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0cx1fJ/"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35f036b17easo1883887eec.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 00:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792050580; cv=none;
        d=google.com; s=arc-20260327;
        b=SPgaSxXNaB631iIOaiO7P2PvDTVgpPnt9gXfQflidwyJfaEJzG/WXrorBDBRGLxzqs
         TXJyk7+H987e4J7iRWhoIj7IjTLN6RlwdgxcejTwGZtForMEGAh/8IAQp0epYsPzMmIp
         T4xwZ7uze0skcIjGJa04S96NzcXgR6C1wCTJOZtbL2Wy2LVf2cFhmC1GcmiPmWETZfE0
         SqgZrP1eTykslB2WwZmgg9I2AwHXbyWTIgYsW8vEQY4vWhIIttZtyMKcn4F98qf1ocpT
         X+2yhwZ5NmSKExmo6zrE2f/giRqW+U353aIbYSYdN0qY5hP9rBkquB39dvQEcUpYMN6y
         TFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bn76A1L1zSnfTuyCF8XnV2/uvU4lFD6V/f9S5z9LEdU=;
        fh=R8TvhXOnOAmh6w6rlGTK1Ma4JYX6H3WWGTfQ+wIj/4w=;
        b=IflzIRWDJVIswx9IX0qvpnxVVeK559mNb/bd2b9vFy7C22fE2nbLVLupDgqKUfn4nL
         6MdoYCeUCNLwTcHljEVtsJyicQtFtqP+OlRn2/ISIOqVcWwTb+tYfVQL+hlD6ZO8M7XT
         aobJRGIQkeKwlmtrdhXP+s1bf6MSoo0UjWG9nRA2JmmBV75KAiyJhIBWWXF1j78HGN57
         8DvXFiHS0HAvtWmrUctDML9gElKW7PBLE9hXCvFu3Rbe4a3IJfi4v74026tN/wVDDqYD
         vQ5oDNxpSgQJHgRMUo67JE5+BeLQTd4VfpdODVEv6sKudTEJHwcrlGhYgz5Gn13BXxDN
         y8Yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050580; x=1792655380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bn76A1L1zSnfTuyCF8XnV2/uvU4lFD6V/f9S5z9LEdU=;
        b=O0cx1fJ/BDpY7KUOgOuGRDjQHPXU2Sax1fG8UyVch+sPis5isWnLDv1fKhlI82OOxS
         NIfC6XolPitBu+MBvV1+lbhC5MvQeuY4RdH7zDza7wN+PM+j6+X9KHsTn5XfMEVcHs4l
         UpBVMDNrxx8KWwTuYTO54TYGlMumcnqDAs3qSqNtkdiUb7ddZI52uT3FpXMJX65sPiM9
         LPFcp/qfPpW2gu7vMvqb0/okQ+p1ZpdJkIkIp6PxCru0wyxuXw1aX2f87vnqUsOxHTG+
         rv7Hekdck37en3gS4yd5UwKbomrHDGm7JXe7L6XqUwqPdycf4bKkvea9wGCccF/mT7KZ
         VKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050580; x=1792655380;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bn76A1L1zSnfTuyCF8XnV2/uvU4lFD6V/f9S5z9LEdU=;
        b=V7dpW7RwEaDY/UEh0GcMNf2dHrSMbE8ahcF3vO/e7d4MaURgvddLDR4Fdd8qXVNikk
         JDOIsEQVEk1pclY+D4QpF85UmAzKiaeMHdTjozOYyPP2iD9K3gRgKeKXCHnYbBxg8q1c
         eQuK6/XtGoDuacIWfGkDGOXWmor42k76oT6zWvHyrNu5PlpRzBBjPcAuamBrbpr90+oF
         g0dFZa7ISaopcwi5mE7byhoyAMjkfy9BLwZGAYfzFKAjzIxSEo2IXxrRRPbItps7g8Bn
         sCbKuYz2fOx6eOat8fhUcsMdk8mfespahTncSrBJBzHEm0snSE18OBgg8zxUgIZLaPBP
         iqKg==
X-Forwarded-Encrypted: i=1; AKwUvBw6w9VTiyomNW9uNHnSpEi3RjgUIjjaJTTR3rsgHKkb1K/6g4MHsl+JqhN2vi8y4qs5yoUFkikRIUNo@vger.kernel.org
X-Gm-Message-State: AFq9FYKrAG75lMf4/gPgCfZUWr3V2YmKsO/O9jTO/ci+V/bRWS7RzsLT
	SdqX+RZKGiPTMqabDdeAUSQwt3s5w6rsSD1q02zywgqURM5y8HTYNApoQSOZ9BZGrJDbpyjT2OR
	DegoKNLHB29Dr5wlf9BLjE2ryMz9Emc4=
X-Gm-Gg: AYBFou2Jgdm2LLciWcYVG9iIx5q2YRtfJGZ0tDoqMigcRYd4OF6+RdNM3+LAhwxovdW
	KVtIVAI2xTLSnmE3PYKtbqgp2smy5JiK58d6XvSq3vzMzIayugYbWfZHNDg6dlLI1CBo8EpQ+bd
	DcSfYEiR+J7kY0QfbFvNUGzZ1Ziq/YU11rYakRhhq8IOvw1o7WGbWERYAJtR0OD4srQybE0Z8Uz
	wfaRJroUkkNLLEhP0RhVmn2UEw76I1rbsy06ZaxUbjs2HC38qus7kv7XsvBQ/hM/c64Rdp5uA4Y
	99G5gWVsAwnJL3ao71mlQYNHPnAoPHxYEIl+s5i3t/5YGP/P+3PnAkPDHl3idh2VPm+NXXKRWD2
	DwBvWn159G5X0
X-Received: by 2002:a05:693c:80c5:b0:35f:6d9d:af68 with SMTP id
 5a478bee46e88-35f6d9db757mr1154283eec.23.1792050579562; Thu, 15 Oct 2026
 00:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013173504.451391-1-clamor95@gmail.com> <20261013173504.451391-7-clamor95@gmail.com>
 <f5d367e3847da2f3d3db0abd0a099920@gmail.com>
In-Reply-To: <f5d367e3847da2f3d3db0abd0a099920@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Oct 2026 10:49:28 +0300
X-Gm-Features: AclHuK_Oo9j5QRqhps9x8wmywtw4oQlKiNMQc_P7VxvfWQOhI0DwxVL2kvoPOvI
Message-ID: <CAPVz0n1YcHwH7b8kg82Gfh7GaT=O9Sx0YEhx9jAGkZ=C1JV_JA@mail.gmail.com>
Subject: Re: [PATCH v11 6/7] power: supply: Add driver for ASUS Transformer battery
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 04:3=
8 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Tue, Oct 13, 2026 at 08:35:02PM +0300, Svyatoslav Ryhel wrote:
> > +static int asus_ec_battery_get_property(struct power_supply *psy,
> > +                                     enum power_supply_property psp,
> > +                                     union power_supply_propval *val)
> > +{
> > +     struct asus_ec_battery_data *priv =3D power_supply_get_drvdata(ps=
y);
> > +     int ret;
> > +
> > +     switch (psp) {
> > +     case POWER_SUPPLY_PROP_PRESENT:
> > +             val->intval =3D 1;
> > +             break;
> > +
> > +     default:
> > +             ret =3D asus_ec_battery_get_value(priv, psp);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             val->intval =3D (s16)ret;
> > +
> > +             switch (psp) {
> ...
> > +             case POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW:
> > +             case POWER_SUPPLY_PROP_TIME_TO_FULL_NOW:
> > +                     val->intval *=3D 60;
> > +                     break;
>
> asus_ec_battery_get_value() returns a u16 (via get_unaligned_le16()), and
> unconditionally casting it with (s16)ret sign-extends unsigned 16-bit
> properties >=3D 0x8000 into negative values.
>
> In particular, when the battery is not discharging or not charging,
> TIME_TO_EMPTY_NOW / TIME_TO_FULL_NOW report 0xffff, which (s16)ret turns
> into -1 and then -60 seconds instead of an unsigned value (or -ENODATA).
> Should only signed properties (like POWER_SUPPLY_PROP_CURRENT_NOW) be cas=
t
> to s16?
>
> Thanks.
>

You have a point. I assume that using val->intval =3D ret * 60 should be
acceptable.

> --
> Dmitry
