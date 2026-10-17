Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4816F480338
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 14:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792248793; cv=none; b=gGW3lPhkNcCLofH8n1uMYlBlKt3fiIs3rIY3bNt2Vn4aZVgi2t3iYzluswk+aHdHw3U9d518+o7WwBuBDK1WqmjFfspkbPApAcvRqxvZplE0hi4oPSNOAJ1z5E39ItMbePbwjOj6VDSKZ9I0vc/SPseftPhsIMzJNp815lPRwYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792248793; c=relaxed/simple;
	bh=Fvka/I8Qk9HOFH62SbLDTdQOv+/n4Lr6xbNErwQYZ88=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=S3/rX6XUIZLNUhddkUI78dis751BiihQvNtkYRI+Uy8YPDDbY+p+WhWPmklzPZ0UoqKiYjaS0xeBoAEHS/jL1RaApakro2UXf25wkTIsYUfaFvmXEviYTMkb0NwhdwIgtvupc1xDZf+9IGxrQQoLhgChcblvAqVU2fbCdh9p8XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LKTrxCby; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LKTrxCby"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso4091765e9.2
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 07:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792248789; x=1792853589; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+66VnjPF/YyVU7Vru1kQeXTRwhm4W1VNOEJvI0QSylg=;
        b=LKTrxCbyQzl6s1iUh6Y5UJVUGypWfe8jSLIOvmCXW+afA76N0Q4LeyuwBoTeh9Crq5
         j3r5Y8EBs1aSOhx+e5EJiyRsOHY1T6Uqm2HLKRZVwuVKZ5szX7d0RhooxYnioqemF63S
         3SBRrnDSIYBA7Acaa5wO0YzdoDHpWPm7JDR+XvSVUbkmwi5GDWi6Zm094ywLp6pohv9d
         15BVnsLlvE7AHXGWZzsaZ1HbjZEqGLZxWN+QRzqddxswQdfkwN7rowpaz6DRiivkkl8L
         n93+jYF7ujqteng/2hIiulMnYjxjN+AvUCB9lpj3WvtfvdSSjPeuCbPFD1qQIK63/7J1
         VxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792248789; x=1792853589;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+66VnjPF/YyVU7Vru1kQeXTRwhm4W1VNOEJvI0QSylg=;
        b=KzIaXEWOYejcL3dympeseFmf1iPlZx7XefEDVRqzX0BZOeHkVAmixSJgMIWKTSjPJT
         3tWQ9pQSJkm//FQwJh+M9cQ3ICRQL9pGKd9Z6NXJ+zDTcef+4SWibljJ9Q+liSnYiJF3
         jZ5EdCVNh8hDkjr3k6t275YjCNTaGyreiV6pEkSKFWkkKIqpAa5Xku4J6Vf1KNAozDYa
         6VWhBgXMRuc4aJoQ3+QuPizlaAebjTdT3UAvAOejVRYbkHMA3kZJTbeNBh/yqYWLBivZ
         5ugg5eNeEctlKQNU0m+wshyRLnviWwz6sL0EdQUcbzFuI/2vovTc8TsqHaOGVJJRdXXO
         qPIA==
X-Forwarded-Encrypted: i=1; AKwUvByiaHnSQclbON4dfmnGvWl8bHDS5MgUsdUpD3jCZMtItXbeyY9YFYETOpPPmImO/YdwTR+qvMJ7bEll@vger.kernel.org
X-Gm-Message-State: AFq9FYLlrM1gn8XLJfehEE+1Ik6xltie6MQwlRud3fzTGk6Gf6gwL0ZU
	/8TntzgOJwv2wSI+9tltgb/G52Avh5uzPuw3KyCkhJI3YfE3Q5brRqEV28meFKM7PEU=
X-Gm-Gg: AYBFou0IbsXIRyre1D4933XWKk3ZJGr0pEx4NXuL8ndT/D04+KCfa95Ddnfw2eYPZUu
	GiKG9FnPtKndFSJqXJmFnr0vMJZH85Y0ApF6nmIO/H65/3TOLf3QGfNrN0mrIZ2DK1QqjMNDXxm
	rfnzYKJOVytl0Y1R0CYiuNgoZ9z7pjoAqfTCwUpMbirBXBCUxoXA9it1FmLl+n7Nomj4DalAr6M
	w6HHkONEcKgx9o9ISo9R6qulInq1CtNQbAeGoBY2LqfIeHLcwQ4JXFA71Qf4LIaFstexWvgnM58
	KY/2u+joe/m6HpeQzxs17LSz5K3E67trI9ffLCIpeAD+CtO3OWS1xVM3SQx8ZrlCjGplxLy5S6J
	IgloDsKir5u1QZnwSKv/qAwcfQ/wFcgQ7JN84Hx4kglEMYNLAdKRfNrxLsOJPXmOY8CJoL3T1hq
	vo2lOOsFrL0QJ55fenuwD0NbM12GucoCWm6Le5bJKelnUp6snPdrJNAowuyfU99pXdrmmM7KTel
	jh8AMcwAqjVFlV2Sg==
X-Received: by 2002:a05:600c:81c8:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4a1d7616576mr55179145e9.29.1792248789113;
        Sat, 17 Oct 2026 07:53:09 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cbedb6f7sm148500265e9.2.2026.10.17.07.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:53:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 04/10] clk: nuvoton: ma35d1: Reparent the gates
 correctly
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
 conor+dt@kernel.org
In-Reply-To: <877bjivrf5.fsf@bootlin.com>
References: <20261015-perso-ma35d1-upstream-clk-v10-0-47c97b54a809@bootlin.com>
 <20261015-perso-ma35d1-upstream-clk-v10-4-47c97b54a809@bootlin.com>
 <sashiko-outbox-173157@kernel.org> <877bjivrf5.fsf@bootlin.com>
Date: Sat, 17 Oct 2026 16:53:07 +0200
Message-Id: <179224878757.859276.836775392883899374.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=909; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Fvka/I8Qk9HOFH62SbLDTdQOv+/n4Lr6xbNErwQYZ88=;
 b=kA0DAAoWrRk/eyua5RcByyZiAGrTi9PIr3jXzkL3hPmoR9xxFK/1/LlW3qSqHNJrkRmkyxJ0Q
 4h1BAAWCgAdFiEEfAt7F+4ZKvSalyzbrRk/eyua5RcFAmrTi9MACgkQrRk/eyua5RdugwD/XtK0
 ki15jlcgtzwga2FiiBGlGPxqB3vuFhbG5OxU+zMA/27a5Sk09wWvbJM3JiKm9WZLUwkc6mDyoYu
 dFvDeCKsB
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-10-15 18:50:54+02:00, Miquel Raynal wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] clk: nuvoton: CCAP muxes registered with 1-bit width but 4
> > parents
> 
> This is a pre-existing issue. I will wait for the maintainers to comment
> on the rest of the series. If they ask for other changes, I'll include
> this to the next revision. If not, I will send a dedicated patch for it.

It is too late for cycle for this cycle and I'll wait for rc1.

Best would be sent the next versions without the DT stuff, so we can apply
the series using the cover as merge description . It makes it easier for
us to then provide an immutable branch, should you need it for the DT side.

You can fold pre-existing issue fixups in your series if you want to,
or you can send follow-ups later. Fine with me either way.

-- 
Jerome

