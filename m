Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793656938;
	b=WK/g8CuDrrzOScrcHj5qw4NK2y2D3HAFXXuoOqUStwtWSwqrpavoRN83izPV+BS/UkVT
	 xTAcVszXWXxf/0chAGTZJm8rrDC9B0p+4QDI1d834hiSnsUbFqwQB4DVhWeQdXoWtT5Wf
	 9rccjQm9DHQatkdrs3lCbMopmSv0Xfc+PeVWSHeRmWpZ7Kyh3vsRHz8lx2gzk3vab1ZtH
	 Y54ac+wbfba2vtNDilQv4ay90cSTNK4AQkqTQTV3wSqPytzdtP+MGZsELZxJ7LUR9pmBK
	 Ia2NN8im7t7REAfYVmwE2U/U67kSqrEMZ14nn6lLETLN+/5PTepr3GmJYpdvfFfvmGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xtjp8uRsMeZtzljno56JPnA05zYp6kp0pecErzMaG48=;
	b=vrMJyhSV5DmIbWzlSRKYAv7oEuTaBmeuS38TnI5w0ujeS3uMpCOgNALuSQ8qZwdRB0ng
	 Tybg1K35S2RRB0dX7qFhSgswTnfN8aeOdqVoaGjoKO37UTm0tnXltoNdc8s54lGnHyfcb
	 V5SUHrhVv3+4r7s/+pmypYU3pC0TmN1+uEIdFFLh0M/9EXrFKp08jHkHg/kHjRf2NDaBj
	 uRWWz0p+LYMQucUsZGt3TspvQNpuanBNO+X2HlimOWP7hPUiOHDnDlDYuhnckakMoZAZ9
	 GZ0vKTfpVFmU9nzMj7glW5cDk85PLG3VUmmMFGI/LuszgQb96FmRS7dJ1QpR0pd1UFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FtzV/kmq";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AB3606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 22:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73AB3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FtzV/kmq
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so2287786a91.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 14:02:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793656938; cv=none;
        d=google.com; s=arc-20260327;
        b=SuAjlW642uGWLIQ9BwsK2ansYjc7ds2FyD/KcydWSOLyrNklE901gYGOclO+rV9qql
         82TR5WInDQhns9644GNTzsACfzeVod/Yyh2NhQIG/+VSVpfKbnD5Tv7P58eDnhLeFNHS
         g6SnCr/ACQNkzoY5z4zcvz1zJ0fvTnCm32QFkvpOVZJK3IcyHCEpg4TT336BSScP/GKY
         B4I91pQNumg4tDlmpjr0PCeOMe4cNDmObz+uKwA06pD3ahxV1lqDLqJUAKAJkGOagPvG
         F5U6hz/c7O6Mm+w6LXDOb/zAq4s/r3T11hStLtm121V2YtGuqxgfKLD3Vf1sblAUFd8D
         hR1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xtjp8uRsMeZtzljno56JPnA05zYp6kp0pecErzMaG48=;
        fh=kRa35YjdVvKiyPJTgF6v0fHywQNi4LyDA8aUamrjRLc=;
        b=EBTK/q4axV8sfWUWHBofdLSeZnRocJqjDWgDwB5mMbNA9FEC5fpExbWwceEC07v6Yx
         3+/Age2LHgVJ+lXu2RolRnRe9NEamX3KC+13Defjyv1hAqpvIee4vnuO2OgahYGvDXhV
         j6CnWMd+8BrVSSmfPSazUoK7t7loimkCoSr0Axt+rszrS090xc4iLbg4hu6EdKg6XqUa
         DCxp49gCnr6eztVsAwrvtCbhFNgIh+egT6p29DfcpGO1LWIAYqX4gD8BuoFIfYO2QIat
         /i0RjTUOCGnzo8gbGrOZcaQ6ziFGfhzqBUHZx++KJ8eDJYT85zAa0jFzq0K9x83aZunp
         5vPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793656938; x=1794261738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xtjp8uRsMeZtzljno56JPnA05zYp6kp0pecErzMaG48=;
        b=FtzV/kmqv9areQHRn6/otxXIOMkJUes4tg7sifCJO158wF+zxsDDam/J2xYzFpqYnZ
         rER1bAX8cRFZelQZ+jRQzGOypJFLI8wAXLRtsnQaONjO4+9e3f11Zh8UurdLeaJZD7TM
         m0HMsc3SwI1MECW8osBo3WkWeS9z4rdOWp4gdT+fPI2CziiBPQYnkLqx1cm9scY05eOr
         Znik/wsE5shxbAZrMoebZwOJu9kVBeAolGGFs337WgPK37m8WssqINlwhwdv8MFNY74x
         kvTeGXdeqJyZcMjJbiQOfau8EnMKet6o7TR6S7j29XyjqgOzMY78n9+039ME/90nTzxD
         G/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656938; x=1794261738;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xtjp8uRsMeZtzljno56JPnA05zYp6kp0pecErzMaG48=;
        b=mgPh+F8XL/O46+jipIS77CB7feRpbcfZ3MaewTVNExt+N785SOX8U5aTslnIdFDZeE
         SoSdOhPajdKG7W/rbSbCAzhJhw1d2A4nPl7VlbN3xYRdmnEpeIdx1IfUqDnxlVxJsxmi
         RlLowM6OS0vjF3ltq6G2DWHTob9SdBryvZ5BkHuVagu+7poIwEtm0IoTKwTfaETyJ5/t
         WzyvrykXsMQX/AYM9DvqaTPFCR/y3GaYjw7Ks5k8tgI3aOjt9O56VCmaKFyY8ArCDn6O
         zy5l8JyyAtwrJfVcfQbnVP8UITZdnw75MO1U/C9P2/p48UsFw1ZOP8hKCzAAm5ZIk/oR
         7eNg==
X-Forwarded-Encrypted: i=1; AKwUvBwGZmQ/wZR+D34EkfqXBom1glDc1lxE/RicxJiPQ0jBZ1PuconkMeZ9fg8IqZ9xnn8XBLoWDuDfZcBq@vger.kernel.org
X-Gm-Message-State: APuU4Z+4o5HA05znAi981QDG7Q7+R06aXdcKCgHUBaA3hSsiM49gf4Wd
	JwLB1XVI0CwUa6J1ronJZ4LYCkiE3lk5/ViU4CQVEPb/rNwdEou+HQC23mU9HABpuj/wJ7xVFwf
	gpcsk9jv1i/7jUPkU8dJq8AtcdkC5PdE=
X-Gm-Gg: AYBFou0X4Fi7e5JN5PeSaJWW+feTsoU3CLZaP8zOiJfT/fcRko89ubaroy6UgEDJ/yC
	cpGYstMgAMda5+idfRk63DhTCm1gd08D1L73k9zmKaje2pnTIeJ9A+KuvKXwk1Kv6QTDE95AKOI
	BiUfWdlu9h98wCXGeUvRIFEjyVAEC7zVVJ9ASvbR5ENKEUzxekBw0w8JVnh9XNb2/Lll1n/o0sv
	w2B3wOSs40+MltULkiLXjQ3NIrY39tPrLb5UjddEcB4eAGpd4/Vd4JBxQZKxC7a8OlDs8B/7x5F
	FGWVXLL3UokqC4kDxuKOkIGA49vQM5/XTLHyPOKgRRCXNaSmgeq++ZwSaZVuQ2suReiZWCf3a9e
	sJsOb9MeqvkNBL9s7xg0u+GG2+kPS5rneN3i/oZyX3SmbDSNbBwcitExJ6X3KYuTMzDu2g+31iP
	KHDyQLXtcLp0WVG/jSvDoQkoc5LRm1CcoIEVdzjo5TuDbW6Y0A4w==
X-Received: by 2002:a17:90b:5286:b0:3ad:a8bc:20cb with SMTP id
 98e67ed59e1d1-3ae8987d2d2mr9574855a91.66.1793656937652; Mon, 02 Nov 2026
 14:02:17 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com> <17766357.Ash8RoxBsO@diego>
In-Reply-To: <17766357.Ash8RoxBsO@diego>
From: Joachim Eastwood <joachim.eastwood@gmail.com>
Date: Mon, 2 Nov 2026 23:02:05 +0100
X-Gm-Features: AclHuK9tCDntyLcfsDMcIMJcuLi-7mMTrptnQIWxhgk53CbLpMpuIZ3RXH4vlrk
Message-ID: <CAPSPb=uNcjWHa0SH+qvO0VC7Vku6fP6OajWR9noO52_R2HDOvw@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] arm64: dts: rockchip: NanoPi 6 series fixes and improvements
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Lin <Shawn.lin@rock-chips.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

On Sun, 1 Nov 2026 at 23:19, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Hi Joachim
>
> Am Sonntag, 1. November 2026, 22:55:18 Mitteleurop=C3=A4ische Normalzeit =
schrieb Joachim Eastwood via B4 Relay:
> > This patch series contains a few fixes and miscellaneous improvements
> > for the NanoPi 6 series of boards.
> >
> > Patch 1 fixes the voltage range on the SDMMC regulator.
> > Patch 2 enables HS400 mode on eMMC. Tested on my M6 board.
> > Patch 3 adds an IIO HWMON device to monitor the input voltage.
> > Patch 4 moves a regulator that only exist R6 boards to the correct dtsi=
.
> > Patch 5-9 renames DT names to match the schematics signals/nets.
> >
> > If patch 5-9 is just considered churn I'll drop them. These are more
> > nice to have and just makes it easier to cross-reference DT and
> > schematics.
> >
> > Schematics for the boards can be found here:
> > M6: https://wiki.friendlyelec.com/wiki/images/8/85/NanoPi_M6_2405_SCH.P=
DF
> > R6C: https://wiki.friendlyelec.com/wiki/images/f/f7/NanoPi_R6C_2302_SCH=
.PDF
> > R6S: https://wiki.friendlyelec.com/wiki/images/2/2f/NanoPi_R6S_2208_SCH=
.PDF
> >
> > Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> > ---
> > Changes in v2:
> > - Add schematic links to cover letter to ease review
> > - Renamed rtl8211f node to gmac
> > - Add R-b tags from Shawn Lin
> > - Rebased on v7.4-rc1
> > - Link to v1: https://patch.msgid.link/20261014-nanopi-m6-improvements-=
v1-0-e713f71eb4d3@gmail.com
>
> looks like we worked at the same time :-) .
yeah, seems like that :)

> As you will have seen just now, I applied your v1, so please send any
> needed changes as follow up patches.
Sure, thanks for applying!

There wasn't a lot of changes in v2, so it will be just a small patch to
renamed the rtl8211f node to gmac in the common nanopi.dtsi file.
I will include the patch in the next version of the M6V2 board support
patch set [1]. Sashiko found some issues so a new version is coming.

[1]: https://lore.kernel.org/linux-rockchip/20261101-nanopi-m6v2-v1-0-e401e=
a64b394@gmail.com/


best regards,
Joachim Eastwood
