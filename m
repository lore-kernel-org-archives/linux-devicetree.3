Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794042793;
	b=mqWWQS5oylL2am1fggQ/PfA5vQicPkjtbLWuD6Lc2elAFAvrkD2Ey3sNJS2ogJQKbD3/
	 axIjpp2YdIZSeEnBLlUwpwFf8L3UmFTpTf4gVZYbViWB8XlwECyS7vXRElq7EmOnspSXO
	 qv213+wRaUFzClYdOLzlwQoTlOhInUOQhi2NzbvX0pEGsgaSF9YQVU3cZM81NMgp66H5F
	 QbX2KWeu/IsO3SaOoELPo6oWd00uUobvstf1vqpGccq1w8qatgUzW4SLeqAAZbg+LQJ2l
	 FflWSdqM2agh3h+jNVuPbhxkrnE7hRHtMZSQlIcAa2JnreMErZ8COClvw8T1sTyZLZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794042793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XBdcxSgsOzWhMK/iioasbAbzzS822OCTsFGBZkPYLKU=;
	b=29iBnb11IcMP7OQJgMIUYt/54OM7LSR7zxkuT1hunLNc+omO4PLmWsE8UqfDQjIcsY8A
	 hjDlkAurPBlKkhMBULiFyCSBKJ5A7c0EMEs/1uoZvKwLIrbydParJijT5zQJ7V3HOP4jc
	 cCjwfRL89aUtEq67b+rLecOk3USj4mxH0KCTNMx8wa6PZgEQ2M84gtDTCSyU4HYuDfC7b
	 kFGRxEzW9Z1EtrPj4vu9ZWv9cOihAjmC5fs06voZl60T85AvKE1RnFFso+ZhHL3mE1dF6
	 kbJzA2YyXFVxppRHuLASIwpWNDWGULFZfiBj/QAx80DxScHCkvJb3SJ7k+vKb4PnRTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PpC+99v8;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9468E606A32C
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 09:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9468E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PpC+99v8
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b566cf56c1so1503554a12.2
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 01:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794042791; x=1794647591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XBdcxSgsOzWhMK/iioasbAbzzS822OCTsFGBZkPYLKU=;
        b=PpC+99v87SaXQw5ylR+lrr5/ZH1RuePq2a1OgNLIaS38ZMR3RYdF4hx18UtoJrK7Bz
         cDz8HorQo7nEY0LPSKTZJ0+VMfpgTFB/fmQTB2MnwtwzApPlWBQJZT9bel1Pjxup3zPG
         csiFs1kIsgXuQWrnGe1KAI6bR2n+MkMHxvtZILO3Al90D21moEeKF0Bnyu42F0dO+BZ7
         9yDp/t4S/08ii3TJkTRqrxZzM5ZnmckjZKZkiBk1R0G6GorJGM0xCSRXZRD+GJSkVB1B
         GHrcHStlZaKqCFZ5DEUdZrm2zaumoa+ZDclAgNgITqhw6brOZOEC/Wex6PDojgg3fgnD
         g3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794042791; x=1794647591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XBdcxSgsOzWhMK/iioasbAbzzS822OCTsFGBZkPYLKU=;
        b=rvzC++TEG8+YTSyNtgl3Lix8c0hyo3SDsjMwNak/tNMo+5tvVqpqOC/lePvPFsKpJd
         PfTYNYwtYPlVj+XP1SF6SwsMB2ogfWN3IjCUBCDiZBR5R9OLBMK3kGlreW8iCGQ8rgrm
         0xyGD6o6T1KJ3jLrEkbeQOoeCVMolJCHWREHzdoaPSOK/s+yKGtF09iTB6+Tb/vOUBu0
         NuAXvhJTGfrPCABciZRcEdnjky9goqDgZpCsOtKyyGrAaCCVqKjKLU7BBGS1E5AWSmoI
         pqO6dJE47DJVppmQC75UOk0dNRkYU/RkZR0ZpArcfpbOUVOb2pD1i8UWDB1PDYVQRmgY
         6pBA==
X-Forwarded-Encrypted: i=1; AL+hErE/qJsDQguIAowyuki44plmXR1Kf3sIostnSTAsXF8JIwOOHp2cutvup39J1UpyiyTFJ4UoantvPmai@vger.kernel.org
X-Gm-Message-State: APuU4Z+3FSQbjgBjUkHwVg9CbSzGYoYtkBQqKQcJoRVD+bLGMPfUIqHS
	ysjwUCM2iH6EexbBI6hxPDPK/kNReP1purftz56cB1ys1eGagboKXaKa
X-Gm-Gg: AYBFou3gaVpzHt+faaCeyWkDQIju9Oy8Ux+Hb3ge9REbMyi0qOhlGHSDd2Qb3Tcq6Js
	ClZihBxPTK/faVVyCnbhRLcC/4Oxha73euHswbM779fgXX0jh8pnk58T5DrFqxU94K8EHQtnofd
	oi+Ydxp7Ir5jj7IEZPyEpRBCmsa139xvfgYqC1/x+8J7soyzK4AQWgHEUksKwwgRHB8fXs7Z+o3
	rT8E/OtDG+2HRgZwH7uPNYBy55r9QbBiYBqoMp9T1kUUIOX9NGhzpo1ByFCEHlz/iXJZ2rbPWHN
	auBF9O0iPL+Ejh7yDBouPcNoog8a6MoFAaI78lmcQUpvLOhUV4d8npYIPXvyMy/vY2um8T7pIpJ
	L+UrrS6mgfFQ0mdLzNbtKQ4BTvzOBnUozi7Tn10hpqj8isfwtEi4zY7C+7IPhSwSMyXqJYrO5eU
	HJwr4ubPNDc7RK+EvHwM00lVSSw2rMkyvg4kfxnny/FroLvNepsPwbtZUj3hsEEFTonXOVzh5wk
	G1nIUmO5YUWGBVoAv1qmoagi3nftJtZKnGTGNEN8egNU5KPIM4VsSU2hndm9nXzQMB1Sbdu6zoW
	8Ru/i0ksJU44Gxp7EGrVtG+p1zI9hLC5brSTTMF9fYDuJ2OCJg==
X-Received: by 2002:aa7:c3cb:0:b0:6b3:c422:9257 with SMTP id 4fb4d7f45d1cf-6b597805d85mr2374834a12.25.1794042790711;
        Sat, 07 Nov 2026 01:13:10 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b6e82bc5d7sm1405043a12.13.2026.11.07.01.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 01:13:09 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Alexander Letuchiy <asalde.le1@gmail.com>,
	Roman Vivchar <rva333@protonmail.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6895
Date: Sat,  7 Nov 2026 12:13:02 +0300
Message-ID: <20261107091302.16545-1-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <au7UMdlP9O6oo41i@buffalo-ssd>
References: <au7UMdlP9O6oo41i@buffalo-ssd>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Akari,
(Resending as plain text, the lists rejected my previous reply because
it had an HTML part. Sorry for the duplicate.)

On Sat, Nov 07, 2026 at 08:18 AM, Akari Tsuyukusa wrote:
> Please give MT6895 its own "mediatek,mt6895-wdt" compatible without
> "mediatek,mt6589-wdt" fallback. Its TOPRGU reset support can be added
> once the actual reset layout has been confirmed.

Thanks for the explanation, I missed that the mt6589 entry now
registers a reset controller. I'll make mediatek,mt6895-wdt a
standalone compatible in v2 and add a driver match entry for it without
reset data.

I'll wait for comments on the rest of the series before sending v2.

Best regards,
Alexander
