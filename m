Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793952002;
	b=BVcjpruZG6WMC/33AWZDvmFukvbWA9vIX2vhdBtjYhC1YvTXJCZP7f6sX2BYL5s2SgNJ
	 1oLSCIlSJAJ62/gtI9tg01BYrnnswHyu4zny90UrjhB5xrjNhnpGIK65n80CPi5YjotWz
	 oR4LfkXRwTxmawRBZ4Hy/O7rOZxEssWg2n6YbprL8OgV9IdiF8LuPUsursb3MI+e+jBU4
	 IzV8jiRWqjlA6UaX/BNgkV8XRZmEphtOiB6LxO6rAYFrBXfASMMzRMc8QlYimUN/oJhIT
	 qn3FQ1VDeF9km3ijTEHd8+7PpKBr/ccs4DkfC7D+XjhBd4055niBQY9Cc8p7pxYKujg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
	b=yhTgeQLgBI07RMBWAVy7XxIPAzojZdDHrPZ/gni2QalR6jfyVwkPD9MdsxjAZG80+pS4
	 83Khj0wJb8QVEglFDncQZXDlysl/bleQcLHUYoELjMwx6Fi+LPdF8VnOzGQy55Uxwhghm
	 slvaEV6CUlfnZ9HcYSojcU2C30+saTI62kDOJSLFMIYDmHpnBEqoCok6htchFPHhpzCDz
	 91LqABsACYi78dRsC67qP+8kxVzFHp48fbgBA15wCdBCSIWtSDEofH5BKncZzNYTiwY6M
	 gYfgTpjrCqjqY+cdg0ZxC9MasL1k+iICKQI4bdcj6mAy062PjaZo4yKWNFwj5UY04XQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NZn45ghf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91576083620
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 08:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D91576083620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NZn45ghf
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b56221d361so368836a12.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 00:00:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793952000; cv=none;
        d=google.com; s=arc-20260327;
        b=l9RoPbpIAacCSKuxOICcldLe7fpk++4oT1GgSCiqh+fjJA8DBONKRiIw66olY2OtNJ
         QwIHiqSxuvrs0HfGI/fOyIGIPPIqtYSr9URyiMY+Q1/8b8wzMSmDlSb/mYe/chlE+Pe8
         kciPodd0qNxB2h8ICJOT9LLWrdBu1zLtzciTlG0vT319KgqEgwtqO27GlxnM1EAaTq0+
         U4Gdihjgt065w/eX5ANSVzPBirNVMKHk+ungixpRkC+eddwXKFybObO8AQSRd+A0gBIx
         /9wzgS1cPx97QWBmyTGcOSMZrzeMYfvgSIx07xpxHzbmVWlAMczzeuwztonWNsMrxp5q
         INkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
        fh=QNLEozgeUhDXXPWeWHv+U+E08tcVwERn4Fd7oV76w7U=;
        b=izUSIhJglB79EW3YD8/pWKhqZ/faakxQbO8p3fgBXgtgMUZC1cfmtFLKnoV8SvwwKq
         vwXlcQDGroCrVeiAAUGIwywDX/C111pZaNBB0O+axj6jl7sKiHUVI+FJiXsgAum5KKZV
         Vh5+kajOtTqYvRuTuhXzw5CeHo3ocHza93sda2KNCBuKOxKrNAaE/sCw3OZS7cChxPAR
         hBc5qIguByIKvhsBqPREkM9nC1NOU7uIkV5K93v08DaTZ+BP+kuVvzt4cBqy0MXcH088
         vmsrtOwyKWsI7maCVkD+GgkXNcB5BUmy9n5nQMuT109MneXjaMNWuWx23rPjDMudeDWM
         VUzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793952000; x=1794556800; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
        b=NZn45ghfBG0ZvdDOyynp1nFEfObT1pcptC1zoQJVefkfah5Cvf4KhBdfAtP45zAtAQ
         UULmHj0hEPtCZn15bvzalYNRj9fhdp3uyVdEClRuRLkVnpOfV9ppeglAAdfxPS28qNaw
         O+q0E4sjEMKTMoFNcQUz67xVF3I/KdEzY8yg+Tpd2afhiQuFsmYUaFLtm5Ti/Cv1nQCD
         bntrz8dBI8l+pN19cS/mEKfoLl4E98jrhkuxDF+X3o30Z7L31Q/ieTJQlTrfBLk9dFV/
         5CptV3jFVboDZT6yTQgUn6wxAwHGSAsVVrnPYMvRpyNWRmRF2c+DpLESNG1RwdqVq9wY
         I3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952000; x=1794556800;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
        b=X/nRsBmt8vwgrM8u9DthV2cPaFXTBaMh6ph3LPAvR8NInOyVXK4pVfgR6+4wR1QJx0
         JXvwXu5YrkN7Usl9dITlYDxfRpG0MekxHJ2IVmruv8WAHslBbab691hwjSSdMOKGy/c6
         mu9fzenJiPKgDJtktGmQavcyVt96o2D3TmrOWEu/nl+0JmGphzF1+0/E1UXDAXd3HJd7
         eAttyczl5XhG3MyaRhi0rdNLwMBGaoUYoA88ULR/qPWp1n2PW1f/0myGuy6EPkTNm04D
         kCZl9yEXyF15pLj3Bzdh2r/ACE5uDqs4DKw3biDQOftAt1VGp2362O65Yexg1ml+gNXW
         9dNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLP+A6BpXbTyhP6X9pfr/lLmqJo3i4NOaqBOFFelL5JOZBKuocmmT0eUAILZRUUvubb9e7YBCCvUB7@vger.kernel.org
X-Gm-Message-State: APuU4Z+oILrUDUDA+a59rd+N3CbSCr0yumcwnjU23Fl/h2gwy9p+tVNt
	mZMH2C2KRrvgCnJj1zfwpb+Se/FImtFa41sJn+RQOMiOzUUOlZTnQgNjWlcWc8nnn1ayDo5FqSI
	fkaiN75Dk1D14X5Ot7t0QYpQ1g9GDSFc=
X-Gm-Gg: AYBFou3w3LkDLFrXolF22u5RWBuBGQoUwa4L8Rwdi5NaIA38teDIgEtTCaVh44FQaHm
	PSCa57+p8B94BhRuA+yrCKtV8Tj75qck0m1gJkCgsnIrZl6wJBktH4P9eeLnSgLy/q/H7QvoaTs
	uLrmSU6UJUntEPEDj9LhokyQOwXTL5PFtrulooAMmEbjbpJAH2QSYpsTAOUY88WAPOQ/4BhZpYd
	R/x+RTqnB/e/NNjmj5ETtfNFqK6B2t0m+jgV6extACzslRAS9BI6tun7A3amV+6BeGqkCfF5N8k
	+zX0ApfiVM+EAbZuK79i4aMd6Wvqoqky+QF93Rxmbm7J7aers3NgNlZO5OVZ2cjHgSwE5REvDlq
	f2CQYLq6+fiz1faGhA7ykpXN+UaB9v2rSWHoR3wrvQxDC99Q8faD398B2
X-Received: by 2002:a05:6402:440b:b0:6b5:9849:e335 with SMTP id
 4fb4d7f45d1cf-6b5985927b4mr1117288a12.1.1793952000065; Fri, 06 Nov 2026
 00:00:00 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021105109.199886-1-l.scorcia@gmail.com> <20261103150936.GB792264@google.com>
In-Reply-To: <20261103150936.GB792264@google.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Fri, 6 Nov 2026 08:59:48 +0100
X-Gm-Features: AclHuK_yxwIK0Nk7bFmyEO_n6HuxXT4AJJgazikzKXrXwadabrKuwJfTV_QGR20
Message-ID: <CAORyz2J_J0dYtg2BMKq9cuzo7U0j-cMQoFXn+2pOTztHz8dS-g@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> How many more Acks do you need now?

Still missing acks for the regulator and pinctrl device. Yesterday I
sent v12 of the series [1], rebased on v7.1-rc4.
Thank you

[1] https://lore.kernel.org/linux-mediatek/20261105194426.1113050-1-l.scorcia@gmail.com/
--
Luca Leonardo Scorcia
l.scorcia@gmail.com
