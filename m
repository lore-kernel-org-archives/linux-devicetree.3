Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795030266;
	b=zJ7qoNkhGOPk0X7Aj0DGHeAKhfTX1hgSPZQ9+u5Ob5nJKRJO/lpqHorASPvw5WIad/PK
	 IaYMWXDCCAEnmqTv+Jmox+Vqvn5aqcbyaMGBCgmzaeFGYNVrxR+7pJQ0jYvkWaGhJO9yB
	 WDByfJpT+lkboNcJfZvH5GUh6grCZnzYIw2H3/5YmoNkCg4eMg0a1pqc1mnvoCtM3LL16
	 IwYhdyEACA4Z2kFdNJsTfeMuVzzxoPmuoJmlwlLajm1TH5kLlqi/Wi4gHXUKq8p/R6/fz
	 jnnLy/KHgSrJDz1Ix5dZMve+M1h4NK1hjyswRrQNg43wWo6uCIgtx+2GfxyZIzdIS8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795030266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
	b=A1fguzubnMjMFakSxBOCGOqHjyZ6DX/W3DMhCj/j/GyuJpubbrIdwU+QJ5R30ASJPHZ+
	 cY25LogZHACdCGE9GXjH+vtpDzMuNn0tv6XiEhoCvTZA1dk7CapNIgV3zXXcUuq4OCT8J
	 dEmPDZ0ENaOgmLyE3TF47ERYG3z+bKJP4dJ+dOkK6OQyeZuqNU5sDhbAV/0DEnT83IihW
	 XF9O5fPj2UhWW08Z++aZvY3bAv8aR+3vP5OG+ZRDvGyxZW2XMKud7OfIr2EFMzrPP4HXm
	 YV2mWD3rqqZFV7oSAKoN4XP1maDdg/60Jw5jf/LWHJXpgvERFzIiP+xr1JUYkYvu6XQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YYTxxlax;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7852606F533
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 19:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7852606F533
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YYTxxlax
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c445c95d553so200904466b.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 11:31:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795030264; cv=none;
        d=google.com; s=arc-20260327;
        b=qKjFix2+NX/Lf1ryYivWgXevc+8d9X3/rC2H7azHU0YsF58NDwonYrJDDZFBhyD2ga
         p72trk4v4IsgtQdkdwtJBpGAe41unnakRXNi0wfcr7ko52wKPqh06daVm1eEvY43G4oR
         3aHf7XexLYZdFL+Bq24yZONFzGyqJ/6YQUmD5ixYGNexx8e5WggG1EosSic6+thLjpF9
         ZpioAjGg2syQf93KAgnxEDYbJcYoqwlAN+7CmGXhRQOu9gMKTVHHYD8xXfqDExOY6Bg4
         +CnD2VHZb/iYgl7yeK69vIfK6PIAG9DtdDHG2VqmNZaVvyq7+UKkKg0B7lBViK0M+iXn
         1mfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
        fh=xRzbeue0Zbw6m3aE+Qu23XJEY8oIgWQ0wcDWNwFxqyo=;
        b=C/WH6hGThZJ3OmashZl2EeCme64lqx+dZW90Tj3p49lRhFPF/ZKguePp1lkTppA8BB
         S5/n2n2KRV4XpuAaduWCKsp6AxO09Rsf8xWCz3cj8ySFNhvAkCTfZtouOKa7VAHesj6G
         +Yon8CeSAO0cspTUI9dk6phK4f5z59dE7RGPJ1fRvyaEnbgzXdVgbupA3CSNLG37q7js
         5EmsOPDdZSAdopJJEf+erJPtuKLOQk+TCcIMg2/9gJQ2EnJjX8/8slma+lZF3zjOSIkf
         ii4T3YTp2SJ92jErDcQyFMOfqb/cHzef1Ax9yOxHOUIFwDZVjbZLOaNjLzIjgGtUgCMM
         wvGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795030264; x=1795635064; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
        b=YYTxxlaxQ2WfhHso/oEI2r56Wf/FngEvX4IGgjBf48e9sct9kQaN5+W9clSYP5LlZW
         9lGoVnhGTEg9+TUbmq/jjF0sC+rmU+Buy7VOy6sH/tPxGdqjjnXGgl2MbLOCk/+k9Rho
         IZJxpHNo6bOT5jZstLoYdAJHZylRxqvtOwCldTOD8whfdnvEhqKJXAdU83+/L7lRIx9v
         fzcCiYcUTwNu01GC9OfJiH6YaqiVEysh0kMaSWmSU8YUIYlmG2BvarbXEefoJFvoMsw5
         PH5l2eEIFL9NtYcZ9lHXeSizazga9SFSOqqZtZ+ipAiyUSM6RiF73meQ1GDoIrwk7+Wd
         OScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795030264; x=1795635064;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
        b=WL3OAEYZBORlrQpcSuvQHvS3zjJk58ekw0NqM3xKvZR3BE9HTNn43+iApWtAIgUIMd
         lQoR1KFQB3AOujmn+4Qyi/FCMGVqT5CQ2a4s6O7yXAvCTuxqfEVcOYDPRCZxZMmHN2jS
         5NT6yEjtGth8qlO8YYt38gEY3OZvsP389KNO0/leLebsi8b5xMX3D2jv4CwM/H/3vG8C
         Ldr9f7wxHA9Ff/25FoY4zJ5rDaKmFyufwplxBHeNoFMFQPdegSn6wspdq0amqwo4R3Sk
         XMtSCFPMXp4q3mraf48NcalmZBPJIv5HzcNIoqzhrYi+n70/v03KSWIZpVFS/QcRCWiI
         Bfww==
X-Forwarded-Encrypted: i=1; AL+hErEwc8U3dFq7Hiqo7rEFIeG2ggoMAuBBWDoccG7/k0MHK54HiLfXTkgBkWBinCmn+lcPpBRdvuNKyH3D@vger.kernel.org
X-Gm-Message-State: APuU4Z9S6iGhVmNhrpHed7KcuOfa74SZD+dCaQgbc3KFH4OPhIc2/yHj
	8DV+f/gVF59y0pZW61FlKEHNkD60S2Unar+uXgJ/Dbl9a2KgC2KUtOZWFrEd7+YLYqamvsoCGfY
	WZqMZYYq6eZTbFcSnBkNp8aK0et1s7n8=
X-Gm-Gg: AYBFou1KfMdiCNG2l1FDKraM0j163Qu+fzcZvUy4ZxB1Ekutl8w4iPKYgyrXn41UPpK
	ELs/W0ohBDqGUT9dKj68CI+u1Yq2hDap3ABNSx2wYCsDFl+E6bd+0ed8gYKtiQEDA2owACp1IV9
	V9nLXrkzdxJ4ubiHuLuLbNOYQX4KBLNvM9fMsDqPC+VqFMu3nwcH3iAG3PUl1/tdUXZh/ibhpRp
	7CEukarlY3GHkNfEh5bqE38V+huOLM268x73xcu0JYKQQeASpzL2nWUb+t/ltPYyI7TrN+Ecv3u
	dJE0qSaAJsTgb+t4hMZWcjosQKIxd3F84V8BQBbZ08sUZ9JUIQF24tix8+e/angYtIwxKR2Jkeh
	mvaEbwZLQiKr0hOFWcStkzP4KQeZipYr30s4=
X-Received: by 2002:a17:907:f816:b0:c2e:317e:d711 with SMTP id
 a640c23a62f3a-c510e398889mr303013866b.27.1795030263845; Wed, 18 Nov 2026
 11:31:03 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105194426.1113050-1-l.scorcia@gmail.com> <20261118152346.GC98456@joneslee-macbookpro.roam.internal>
In-Reply-To: <20261118152346.GC98456@joneslee-macbookpro.roam.internal>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 18 Nov 2026 20:30:52 +0100
X-Gm-Features: AclHuK-Q_ZR_eSDZWgs8r4i-RTkFZUMV5FI3ZV4LgWAQGQjLtUrjcLbEIObtllI
Message-ID: <CAORyz2+7q3BTeW3NsaiwN9riAbHV0Q_tCm6bBV7RoiDeAbcLrg@mail.gmail.com>
Subject: Re: [PATCH v12 0/8] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> MFD looks okay now.  How many more Acks do you need?
Still need the regulator Ack. Mark Brown provided an Ack for the first
version (almost a year ago) of the regulator patch [1], but it was
substantially modified in later revisions so I dropped that Ack.
I'll move Mark Brown from Cc to To tag in this email for a gentle
ping, I hope that's not against the ML etiquette.

> NB: This patch-set looks split in two in my inbox?
Now that you mention it, I see the split too. Weird, I sent it using
git send-email as always. I can resend it if it's an issue.

Thank you

[1] https://lore.kernel.org/linux-mediatek/20261105195206.3440-5-l.scorcia@gmail.com/

--
Luca Leonardo Scorcia
l.scorcia@gmail.com
