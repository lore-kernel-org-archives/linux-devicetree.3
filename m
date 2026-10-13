Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0842469859
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 17:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912997; cv=none; b=Ieb7ADL0lQFKgD9T1gcc0TM7IX52PeI3/qGdeklplWlyV987LA9IU5FtlMycP7RXDXzKulgd1BWZxThKYSD3hhdGFdmO9g/pgj2dEMiRCacL06wrK3FUDWxFj9CDTUd9RE3dbxHUUR1zNHetT4waQ3p+CxahVvNi6uAHVwkvm9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912997; c=relaxed/simple;
	bh=Y3m+IiRPjHXlRcCy5kt0s5eCMwrp2C3UhEBDizZT22I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F5jY8jt1RjTslhE3P5RsMtwdoTi+nszrKgg7Y5+D5/wwRJF0LHttC/T93utVQnFHrrzfbmWUOjLfB2FMC39fhZ+QmyUdslv85oydPYUjsT3V5pZEpZVqo60t5AhPQoHC9f3rUu6lfwA6qEoaRs7yOIPrdLwf2imvmIThQ4Ld+00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sWSKRDYf; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sWSKRDYf"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a9787a15bdso27498151fa.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791912994; x=1792517794; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3m+IiRPjHXlRcCy5kt0s5eCMwrp2C3UhEBDizZT22I=;
        b=sWSKRDYfEI2zJ8ek2B8JekPO7bpouaU4ye6ZLMzaLhFtP1AhCCxqdVnUU1AvhKNrDd
         v2MC0OEebHbDFaMpOxCzNS6pSlTBUtHQmanosOVAV1K4Zu71B+jUWzJz/COc5WxhFuWq
         Ek78aoVLycp+SnFOteb/roZXxKhe3ULXz1tvDGSIGnbrBYDAzjAuiEdVdwxfPcQZgAXv
         wCT1j3P5xVlnwX+G31vpUkkaO4ImQpP/FcajorsT+5mbbirQUlS4Y3GW3rHli3jtu1lv
         s8V/49TqBiKHlLbI7Ltn08J0xb8u+qJiSyxKX4SGXaK4YjlXK3kxzIWa5tvhgxWXE14G
         XlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912994; x=1792517794;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y3m+IiRPjHXlRcCy5kt0s5eCMwrp2C3UhEBDizZT22I=;
        b=wMCEXM0OT+f+XsRe4/0DQwe5muyIbO9Pb8GFtsj6E+wDbuMs5DVUrq44yQfSxgs05y
         +5QT8OXzHU4rpS7C6BUhALgmSpUkqZa8v5GiLUCkErhbLiaSDUUwKFr51+0E5GlNT4E6
         LHbNBcNc0bGxo2FrB0L6ETHQqAARpMNhdyoY1x64B9gKrmSrq5RCrZ6V/eB3FpnuWoMq
         AcX66GRJngnXUxpMAkjCvQz6onv8/Y4s5aYaRUBoklzcT711pMJ4oXP/7bVwp4Fj2dFj
         Tz34wHSWkZGFJmgzOiPSEKytnqsqb2jatFAgDNXrmzyeQDzXdkGzQBVHsa8wBX36/wMD
         0vrw==
X-Forwarded-Encrypted: i=1; AKwUvBzNiGTdk4BR2JfK6NSuly3OOzxgjLvpIoIvG+9l5z7i8iU57zNFAb2WtQM5O5v4vfIPFpG/+Ul+FcnD@vger.kernel.org
X-Gm-Message-State: AFq9FYKlFAs1Go2n/UASA4uR80qv5rsPjRJc1Wiq6+wCDojbiIcBmso5
	4SE0DO+A8bt4Ryhi8Nu4uh3x3nV0dIj6/dkFEtVgBcLtUVmmoNyX9zsN
X-Gm-Gg: AYBFou0cawwE2kGCOHwTBtay0PZSw0TsM9qDjAuFIVwjeC95VstSyvh2+xl07naCCa0
	3rNxEcD3V+z/2v1AqE/8vOZ5+l/6HueKf2DdTPbv5ufhK/xR52bMTt7GPMhzU4acyAvzLsBGFoN
	JRGZc9rL55AOPoEqGnAD2GqHOrIy6tBfzSeC/T8T2qAE/SkrDbL/ODsp2wU5ZJO56EetmTRPj/C
	D7JCLtCgDX9qi6hkPlRDDshlLmDupTTEyc7RMdMTRqAajuoOxLY+LzZO/OWc9uNylGiR2Bv3nyl
	WO8enXTUWYlff5r7Z7lO54BZhjN82dbInKo5cTqaD+crg1owbWoEBkb+/RESOWT7GnUpyMWZufq
	Z7llMdm3DdDNvA2BSDs8srH5m7Ve0R8G7qeC8hpNMd3FLd1QPnL+Ba7FpnTwCGxjriK0pJy+Yt6
	veKNCtu5xgLkmFzqNcJjPfq819utGmGddQ/7ClYuT+shJTKuvd/Vp99OefCbrodFGwgdK1GMoo2
	yV5ruZKjCN9K8clrVsTVyOnR8C23KzT1s+p//Zd5MuLwS0/mRL3nR38lxfWHUZgFLUU
X-Received: by 2002:a2e:a585:0:b0:3a5:f982:9c62 with SMTP id 38308e7fff4ca-3a9c4eb6b77mr31027101fa.1.1791912993414;
        Tue, 13 Oct 2026 10:36:33 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cf7ffesm36421781fa.41.2026.10.13.10.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:36:31 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 00/11] Cortina Systems CS75xx: interrupt controller, GPIO,
 I2C and TWD watchdog
In-Reply-To: <20261013-plastic-dragging-8232efb058ef@spud>
References: <20261012-b4-cs75xx-s2-v1-0-8a7641b7b79c@gmail.com>
 <20261012-dreamlike-hazily-19bb60326f0a@spud>
 <179187542217.3247897.4323160442877168450@gmail.com>
 <20261013-plastic-dragging-8232efb058ef@spud>
Date: Tue, 13 Oct 2026 20:36:28 +0300
Message-ID: <179191298807.12554.2183121269667635269@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On Tue, Oct 13, 2026 at 05:52:36PM +0100, Conor Dooley wrote:
> If things are just tightly packed, that's fine and you don't need to
> make it a syscon. Just because something looks suspect doesn't mean that
> it is actually wrong.
>
> In your shoes, I think what I would do is leave i2c/interrupt
> controller/gpios etc all as independent nodes.
>
> I would however model the pinctrl as a single node, with
> reg = <0xf000001c 0x14>
> I think, rather than 5 instances 0x4 wide.

Thanks, that makes it simple: the interrupt controller, I2C and GPIO
nodes stay as they are, and the pin controller, when it comes, gets one
node for the five mux registers.

I checked the boot loader's pin mux on the board: it leaves the reset
button line and the touchscreen interrupt line muxed to GPIO, so the
dts does not change with the mux register gone from the GPIO binding.

> My take would probably be not sending new versions until at least 48h
> has passed since the last reply on the current version, rather than 48h
> or w/e from time of posting.

Noted. Arnd also asked to wait for the 7.4 merge window to close, so the
next version comes on top of v7.4-rc1.

Thanks,
Fil

