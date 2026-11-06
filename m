Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999599;
	b=wshasyaYmUe52+kje8rQ+4Yu2VJRJF1MU0i4ZZN9JbYNTePYBQfhvSre4rz1iY43RYYx
	 93nUKnRc6XLzdbrfQTBUvfbdpaS+ShBHlKzGKzYiAuyf/SwV9LbhU/bu8iqy3tn7wg+E4
	 HPrELvZ4JsL1HOLXWAdmrYBFVVMgAivO/mHPLFW0jr2MD1bsWdsMJL9q/qLMHI0UXrS48
	 FcpZH0e6sBT+c5R4eYwvze6me2/JAi9t9Quhm+Ysxr0FAm/YJVLuFaSKdsXToG+4TMTf6
	 LOtzNWa4shdxMQQ+cfBGw6z2TS7eCq4wUAR/4wncAeDN+fIUPLpN0/rzxuEQS6lpW5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KAgB2fssjvIHHivLsh4UbVD8IvzJBAHBr6xJYRkzEJE=;
	b=ZwtjdhKDo46iJRnMPlEotHNnd/HhRYazo6MBgDU5xUZwrYTFnEntn+wtJRbS/XPME9H0
	 OrNXFU2D2YQfxiPlnmO02f4raMBzpNE7woVdZforHnHGuDI8A+8EvXCBbyWhMzrxSvsXG
	 kt4VcCbfxog1FNjyWQKpa8JeXQU4FL9yzWNCw1cOGV4/kHLCfcBH4bhlU9HjcEzHLMnW5
	 RbVjFVAB8cqo0EyppImbC30Ov+HBMrUxCeo+h56Aweb7PL/sjun12cH1Gnjgy8sgp63Aj
	 lBvr01rhVq8iNwqz+yLrG7hlF4PDySaDRSrrRUohdnl4W1F+5a8nUQebaeaEPYfU+Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNssPANh;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC3D606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 21:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CC3D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNssPANh
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so11327495e9.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 13:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793999597; x=1794604397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAgB2fssjvIHHivLsh4UbVD8IvzJBAHBr6xJYRkzEJE=;
        b=nNssPANhtZ3wzKp1c63u6YxR9nA9RLek2d5ZArlqR/5bmeQT7Q8Syuod0hALs9b9BK
         NGyyci6Mqiu8Va+cquY4+qPrWRxTpJ2qg+/AOWHQgfEwf+O2tZChYBiCxQ1ek4SkLULZ
         HKCnkbyLbNxBlb71sB05ArRhzSB9wGamoXLzIkvEEOR8ozKcAedKV7b3Jv0ibtu/KD/Q
         Zm8Li/iWTpogD+j9W37+RWXVAzAXIp7/OKtLisQictcTPoTlE5HPvAmU++MUBLyvO2oT
         4NQvWT40HbaG9WTiOOCO9Nh4GgJHsY2FxO+a83RIP4/XFHH9t8rRgihiwUy00eM+bv2z
         9TpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793999597; x=1794604397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAgB2fssjvIHHivLsh4UbVD8IvzJBAHBr6xJYRkzEJE=;
        b=j5zxvFb3ztgRDk/HjQna/tVaPRojslijYmQTyK0w6oEXdcJGtrQ5jpzR5++8logvWi
         dwZZ7AdnaFRz4NpD6ppZBRAVOH3uSTJmKNHJm/LRLWOeWF6FplLe0Egpvq/V5MtTEcgq
         rXF+wBkAvBq1jH0UY140j51HonaKaowG1OYVBqulfFANETt6q9/m3HvHmcrStj6BIq1e
         EgeoSbaEWtmTETEG6SOClobReIKX4z9rdGLUv7gleWWahLG9pdSywlhCVljWW9lwY+Rc
         awzpTbim0G4Pr614Fn6Zm3EOrjVZUvAj6j6wPQtImEdOotnto944yNXDtFOi8DuvsXfy
         nSuA==
X-Forwarded-Encrypted: i=1; AKwUvBz+xUwhLKy/69+Gn0e5kzXz2A2U0sIvW1jEFt+lNsGreK+aHroFoN8VVwjyk7wrnvkm3No1jJKEYMbS@vger.kernel.org
X-Gm-Message-State: APuU4Z/xSSg4pQLehosz9/j/Unxl4HLWekiAZ0AuPV135jWHXKAnB7c3
	Z0W9a08Gr1DWekynnsRVsVboYSx1gFpjR8HraKLETdMKGTskztIKrFyG
X-Gm-Gg: AYBFou1EVa+cT2HQiT33y+Ap/DuA3NSQKx86eNBDwupSzLWZX5pwoMUTFIWiwbaqCUj
	1nRdIIWpDNHod8APdaD/WBMU1HM1dDRpNsIHd9V5lIuKjbTiWQexiJJ+xMC+gzVOoM+glK0zKBC
	jBBy3qKPAyKdRFFQcyv9R7RvnaX2dWLqt6l7F2ce0etNmOrm1UAX8xiNVBzNHq7dVOW87AkWVWE
	8OXCfmTCR/gXA8/nqeSX7+k6MVgr9tBT0/AJ4EUnfUFTtvdbenQo7wELa1MUnPmyWrOhdHtVP4J
	9gLJXluCP3M8bpzPc+mIzZjCdSq2Zcd7sQvIZ53qVestQ4GkXCiay/g+IwQWHOJ8RUPQNE5/RzL
	cKbZ9raNPTEvoe3/qPPvEFCmXYXrGzDKd+6OTIcHaicKI/5T3Sgn/UzI+G3Ny69XzR4tboEYpQu
	aDcWk8IoKJpJ3R63AjEbiRB9DOMTU0mgjSRvWbcGA2e0v35uJZ3a4geS1aBNfxbA1VwIVpDVCzu
	9NNhaQRNcgJxneu9aBVNznW2l+sXzF0qH5RcJ51zFeTa8OnlGLS6MeRLll/eMPatLt0/QLltgzV
	oggq5PZZ2HrGjV+P3FTvVnB/j64uPK0=
X-Received: by 2002:a05:600c:a013:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4b6e054964cmr57690945e9.33.1793999597217;
        Fri, 06 Nov 2026 13:13:17 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7950206e3sm11271025e9.3.2026.11.06.13.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:12:57 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: E Shattow <e@freeshell.de>,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status power LED on
Date: Fri,  6 Nov 2026 21:12:49 +0000
Message-ID: <20261106211249.73440-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d051c5f2-3df2-4eeb-b324-6e9ce39a6b27@freeshell.de>
References: <20261106184055.3891621-1-oo.hehir@gmail.com> <179fe9e8-322b-4745-8734-d5de5f1e8487@freeshell.de> <20261106195945.4157095-1-oo.hehir@gmail.com> <d051c5f2-3df2-4eeb-b324-6e9ce39a6b27@freeshell.de>
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

Hi E,

Ok, fair point.

Conor, could you please drop this patch? Apologies for the hassle.

Owen
