Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795593180;
	b=CQxTUbXW0pl7mdaRvP2WqtlbWeHAEcPj9azELTtDmroXJiaxQ+4FXN0Mz82qfHiwRFIZ
	 3SjyJQKVfDTl+aUmbaqZmswjFwiQ+D6suPK367nyxJ5NC8LZD5ZFUdOArnELbJLVIcTut
	 0kNFQb3lrdM4GZPGyW3IWdPvFLvQllKbJhk2OoZRBiIZyvtH6ukO6V1ftyOZy241pW30w
	 SI3hu65qJRQ97bP1apwuSJaGJj8yrdYjso9LZRB0V47a2+7DyxFpUBvkqN2azjbwAUSkU
	 C+UEauaBYFMa8dg20JvfM49tJirvbNsVjfLpbeFRgeRWHMgnWaWIT2Qf/IV3/6hYQ3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=KSGHti+DBG58dWZXRAMCvoWIexuD6kTB1LwSNHMxBG8=;
	b=nYtDCYUwRdvp/h/4Gpe2Os/vmRmq0Ii/ReUpVRGRi77oaODz7PGgpXvWFVHLE7+BEVZ9
	 Yhzg++vtzw6E4HRaZ2EAKBOIR8XM6Xy9XcW12sE+8OSK5l6DfrYRzoDh/i7In0JLJLTsG
	 Lt0oVeOu4U3Mi1nv07iOt1L7xYeU2/aZkDQwYNoCZAnMdaKxklTyXAnjS65OvLEPYouA8
	 cfcKQgZBdsjhDAnfn18/m/sp5OsigfUi/69V/W92zBrRoXLvri9BgbRqruFdUuOuWt25f
	 HPWBA+QzlFljQDWecZmhlxT+PAQDt3LSAbKrExfXhm1EfSkAAUnBcZoNSpjrFYrHytg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aDyLHikh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FB2606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 07:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38FB2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aDyLHikh
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b8627e0eb2so7085156a12.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 23:52:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795593178; cv=none;
        d=google.com; s=arc-20260327;
        b=VXO/xaMVj1BeTQ/Gw7IwxXOw5BaTgi8h5Qpi/uMCjazrEblr6XKJ5+jQP+LKItp8wn
         ZkJqYOJMK3HJtWCjEsfaa+CCT1bzyZbe3PwSZ84jmpby35tCUXBNqM068dfz6MoTuQ89
         TaCt+tbcHP1d2CZDr5tyeyNTEM9T0rJVgaJGt0yV+6MhFWaaxKHguhhGB86qKkIZ9Sx5
         WkpLZa7CKEa2AanuRPrt7U9u0544kPeZ8cDHqhb8p3XwT4EppYTdROOV/j5J3JbHpTJe
         iQ9D2yS52Nbcz6bLZjEvyktboBla+o1JrD4zWWb6ITiRWwQAPdkwvS0y32JtjHtNh2Gm
         juoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KSGHti+DBG58dWZXRAMCvoWIexuD6kTB1LwSNHMxBG8=;
        fh=K7ASm8YZSPWnAWKK9NEYJ4V3TiBWqftXQSHQlDvxOxM=;
        b=k9LOvsKhQE9DF0QyRUJy4QQQJwuUBHP0v6fxHQhQqAiqbzxXN5TmzwPtniZDRaPHu+
         nKLFYRratIbAYGnapzz7HfhfBV5+NZtMf/XgbV9Vsf2me3Cg75JKTcdNcv4JTMOYXNO8
         ZQnEFz+POXeo0nCw+e6TKAkxWHlMDKS9TFz3J+uYUYxyd+E+2P7MJxd4y1CmlJSEKtMV
         VrrWS6brgBXkFJB6mmkdxmlW34OwQxabfDAlYb+OiZgoaMTTtAMlPRBSsVkdWX9xxyQI
         30tsR+cs/2K8DZzAQYneiDil67gEpUcC2uAgT8nNAlN5sBy3F9qu6R2aeDzrrX9nGN/i
         +y+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593178; x=1796197978; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KSGHti+DBG58dWZXRAMCvoWIexuD6kTB1LwSNHMxBG8=;
        b=aDyLHikheDNbi8azh6Epo9AEAHxsh/YJg7QFPJQn+eqFu/PZ5RUzomLFyC4NfA7eC3
         jYb12360DCyDnUBoL+evpcuBOQL2jrYz/atOMvAPtTxupEFMB+SNnHHPN63Ic9NJfArI
         95J+ASpBbkneO1GLZ28Mebg/sn6ueh/0WdgPRXdLALA/lzCzUU0UNn+zCNkyDPVFmJ3I
         k4e09w312FncylWh393IMRckU6gAzF/P2R37P9fm4srgylqVX1tdcA2hq48E91+RmWff
         0VvOlE/VU7klDdWnB6OW7DCeeIizgTw2EmIVDzCCp8DjjiyPcgA6L1b6Xa1zKAap8Taa
         CKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593178; x=1796197978;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KSGHti+DBG58dWZXRAMCvoWIexuD6kTB1LwSNHMxBG8=;
        b=j0stbFLDWwU7yZ/b5ZLzE7xJ5wf5q4O7OxKO2/KY0fHf34sT+kU5qwxJXwjcDJMoG/
         BKRCg8MKY2EOnKhRTcghCd8V/W6gT2UCDM57no4D9l8jbHVanCmzzffuPzfYmlORbbAN
         KxctZ2nR+RHfrCulmynv/foiHBaK6nIUIAxVzWkr5h+uz5qGIDJXCsoY/u7WVAnOow+i
         EoiiLtk8QF5zfeFTQmGW2mHESWn00vJld/DmcA7rKOgJpISBuybmbuiRPPe2tJS8VLWj
         vfu0+H0wLJf8FI1QvYTUC40jhFJM0Jx1IFP4gqliOXnk91cEe3geY+Qxw0Qyz/kIopIk
         A/QA==
X-Forwarded-Encrypted: i=1; AL+hErGIC9WNXRAB+ZWQ2255TQVA8Wc/euAaqoJYi9P7OgbsHBKQLCovY9pJGIIexnPCGbJO3BdSgAgkcFjl@vger.kernel.org
X-Gm-Message-State: APuU4Z9EPKzHxkIGyIaYAW7S6cUw+dmflMnec/xGHR/8HKE7JN4OHdOM
	xLHiqPWMQMMFVonpa0M+igOXm01YXDkAEFhMGFCYCAhd3MGxr3Gx0hyDudOUWtJ2MKzVBe07It/
	R4A5wU/sW4HUZy1kjJKPTIgTTI0V5KqI=
X-Gm-Gg: AZFdTZe4qIaeGsGF6vzh8ejNPLeKJsRjKmRMclW2cu80nkW/xwGE4VKx8hEGRyTT2w7
	4H6FuDXkfBC59etj5GnK5ZRzEfA2YN0CByDBCsnQ7lYbRtKNuoQ7IaswnwSaUeZ7XIS+nmZ6zu8
	ohYDA++CEK/Yt7tx39EjVYJ1lM2n3OZd5BS4vEg+Yo77z6I85MGKU5zrEuWNaT0SVEyUPIMYjtW
	OoIwl8qPjG1hfMJJM3SQkp90JegnIrDOp1aB1+sTDhhQpmhTmM+ScH+/IwtcPb1HY5vfzu7r1np
	TF3oqJkkxOIBOjQNQ2TUuVxAxkrnMidun1raJy+XEZGBit7HlGBTzKIArKs2D2tqy7Zgepqq5om
	4AXgnOi0qFvlXQisu2v3dh230Oty6bb3qQgc=
X-Received: by 2002:aa7:c0c5:0:b0:6b6:4dcd:9677 with SMTP id
 4fb4d7f45d1cf-6ba37d62867mr9467600a12.14.1795593178308; Tue, 24 Nov 2026
 23:52:58 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
 <awS2-clBenE1r1a1@aurel32.net> <12933da0-9bc8-4f92-96d4-36c5673d3f5e@gmail.com>
 <awXUSuYOUQMPCl-5@aurel32.net>
In-Reply-To: <awXUSuYOUQMPCl-5@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 25 Nov 2026 13:22:44 +0530
X-Gm-Features: Aa3M54q54Z3pQu7569lgjovS1EclOCcqRbeez4LQayhOiQc7wEhf9EIuKCN7Gzs
Message-ID: <CANAwSgRf0XpWnyDaoiGySFv3NPKCBYn6BODf1M+P4w58BF-duw@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: Zixian Zeng <sycamoremoon376@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Aurelien,

On Wed, 25 Nov 2026 at 00:14, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi Zixian,
>
> On 2026-11-24 11:31, Zixian Zeng wrote:
> > Hi Aurelien,
> >
> > On 2026/11/24 5:58, Aurelien Jarno wrote:
> > > Hi,
> > >
> > > On 2026-11-23 12:41, Zixian Zeng wrote:
> > > > The bananapi-f3 carries an AT24C02 compatible EEPROM GT24C02B [1]:
> > > > 256 bytes with an 8-byte write page, which can be found in schematic[2].
> > > > The device tree declares pagesize = <16>, which does not match the
> > > > eeprom chip datasheet which declares pagesize 8 bytes.
> > >
> > > Oops, I am not sure how I got that wrong. Sorry about that.
>
> The question of the page size has been raised in the initial review [1],
> and it seems that the GT24C02 has a 16-byte page size, while the
> GT24C02B [2] has a 8-byte page size. The BPI-F3 schematics confirms that
> the B version is used. Sorry about the mistake.
>
> > > > EEPROM pagesize of k1-bananapi-cm6-io[3] and k1-orangepi-rv2[4] changed
> > > > together, based on the chip model shown in the schematic diagram.
> > >
> > > The k1-milkv-jupiter board is also affected with the same issue, despite
> > > using a slightly different EEPROM (24C04).
> > >
> >
> > The GT24C04A EEPROM used on k1-milkv-jupiter board doesn't seem to have
> > the same issue, which you can find "Page Size: 16 bytes" in datasheet:
> > https://www.giantec-semi.com/uploads/20220929/GT24C04A.pdf
>
> Indeed you are correct, and I confirm that this is the exact version
> used on the schematics. Therefore there is no need to extend your patch,
> it can be merged that way.
>
> > But I don't have the board, simple test would be appreciated. Perhaps I
> > should include test steps in the commit message for the next revision.
>
> Unfortunately the board has the EEPROM write protection pin connected to
> VCC, which means the write protection is enabled. Therefore testing is
> not so easy.
>
> Regards
> Aurelien
>
> [1] https://lore.kernel.org/linux-riscv/aNLzRJcKCYOngc7z@aurel32.net/
> [2] https://www.giantec-semi.com/juchen1123/uploads/pdf/GT24C02_DS_Au.pdf
>
Apologies, this is a different issue.

I am currently working on enabling multi-DTB support in U-Boot SPL
for SpacemiT K1 boards.

While investigating the board detection issue, I noticed that the EEPROM
on my Banana Pi BPI-F3 does not contain a Product Name TLV entry.

alarm@k1:~$ sudo hexdump -C /sys/bus/i2c/devices/2-0050/eeprom
00000000  54 6c 76 49 6e 66 6f 00  01 00 20 24 06 fe fe fe  |TlvInfo... $....|
00000010  d5 52 bd 2a 02 00 02 23  0c 39 38 61 39 63 33 61  |.R.*...#.98a9c3a|
00000020  32 62 64 34 37 fe 04 3b  e3 ff bd ff ff ff ff ff  |2bd47..;........|
00000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
*
00000100

Although the EEPROM is readable, the missing Product Name TLV entry
explains why read_product_name() returns `-ENOENT` (-2), assuming the
EEPROM read and validation succeed.

Consequently, automatic board detection fails, and U-Boot falls back to
CONFIG_DEFAULT_DEVICE_TREE, which may select an incorrect device
tree for the target board.

Since the SD card-detect GPIO polarity differs between the Banana Pi BPI-F3
and MusePi Pro, selecting the incorrect device tree can result in SD
card detection
and boot failures.

The following SPL boot log shows the board detection failure, although
DDR initialization completes successfully:

```
U-Boot SPL 2026.10-01060-gf3080abcfe92-dirty (Oct 24 2026 - 17:30:03 +0530)
Fail to detect board:-2
vdd_core, value:900000
vdd_1v8, value:1800000
vdd_1v8_mmc, value:1800000
DDR firmware: [0xc0820900]:0xf0227179, size:0x8d98
DDR is ready
```
Could you please confirm whether the Product Name TLV entry is
expected to be programmed into the EEPROM during manufacturing?

Also, is there a recommended approach for handling boards with missing
product information in the EEPROM to ensure reliable automatic device
tree selection?

> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
>
Thanks
-Anand
