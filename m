Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8033B2FF8
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 17:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790528647; cv=none; b=bd5NhbzROQx4Xh8EZIs3tewm6Gr7E1xidbY/XzfxVKgpoxaNclQv1wqKjosgl1pIN9I1i/Osw+u6KcqQH6LoWUXnP/eDEqxI1Sn+wqAPEpJ3kpQySjNAyGYKzU1s05X27CuXHv8Zecjk3bt9W5gzT4Y7whib+SLQix+mZ0ApQUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790528647; c=relaxed/simple;
	bh=YPaVvSzw+i2Y34hdJlJohU7NRT9A3+fbf9np6selyaU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LEmA7eplbJoDSTja3x//HNBnrWkDKc2uVfGHumy53wBS0dfF0BTUq/nz4bMjt2Notq4Fym0OiwtZnEKqvByyRRVLi9EPMKNT0RszhReIh+RfDxeD1jdLaAmx4kteooMidZrTdxpttm7teuegz2Um21S7h9zfjrohGOHiUm7ILhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QMAzyjFG; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QMAzyjFG"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f690df6so1524690f8f.1
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 10:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790528644; x=1791133444; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YPaVvSzw+i2Y34hdJlJohU7NRT9A3+fbf9np6selyaU=;
        b=QMAzyjFGYmH6eBp9DRTy7oT/AGz0zCjmD0Fd7vN5Fj7kyVxUWqiADC+taJnhsnFxke
         i4ZWqwWKbn/JMmmy3yk5EWbnYAJr+hgy71HpWxX2DzRQG76OU5Y5J222/53MyRUioq7p
         S7BtI8WtnBtrL8VSRw0kjpB7RedIEwm/poA5fXgMXGEasPDnLoSFahdXOpNjH28bTfEK
         z33KuvAg5PhLn4QGL00fWijwfbZ6xep4vmygQArOz2uRLy67VBgIE8szc4iEexVGx3zG
         yxEo0v2QSiXkurY2Bgj5FXP3hAyK7yO/WLMEl2ZPcWFY7Yuzi61mjdsNRQKl7F9Mhcp0
         6Zfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790528644; x=1791133444;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YPaVvSzw+i2Y34hdJlJohU7NRT9A3+fbf9np6selyaU=;
        b=sEU/Lf+9mpiWGmO4Rc2eh5IEyvLNLPFqtY1Zcj2ogPZBAx8soLMJpf+NRbaF0efjY0
         8ZHmzfXSrmkaAVL6wDln4psiNu/x48ZVquuactlt/+6UYFTVCDsvSUdy8y212DLPvrrz
         U+KerVEs2jW6Fj9OdtYs41QkT3Em55TRUIVP64MLItZEZA+6XmvsCsazFl9GEZha4Oti
         syRMwYofundQRHN/RRGK9F+2MLlr1o7a8Hp7JcRLjelJB6xkO3JXEqcAJUeHxMTLsZzG
         SjSdU78ZryscvxzfTk7lI3C8z752ojzCEpYXeB9M3B8Osbs/fkbk8GvMrt7R4awOwleB
         N7bQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/CqvLZb27nMhQVs3b/vdr3sHlKpTeM21lnGoDVAjCBe+RuBAg/HR4V0JrBjEELY/j2kqYxwIjoKDj@vger.kernel.org
X-Gm-Message-State: AFuF++lo91SrU4icu5cVPoxbyOMCBhyHRjl1zxX2FwesCph/2EqS+ASG
	aZTjG4PbzScACOBm4tLOlWrJ5QQjZ8HVVxxGHzM0+7axPbgRKYPiHNAL8WHXwvHJPRw=
X-Gm-Gg: AYBFou06PpsfJQOF53SJ/Bzv58u3zNmU7EUJBo8gPaFuQgVHIu3l1qLJZmQstaaEkBN
	Y7jDEdW7rTXNIDR9OSCgAOdeYUtKhcceZjWocFYAFa8VLQVhv4llWzN+EBod5W/0NuUl8ecBK3g
	PucumuEtXQWkQg6EwtckjOWRhlP7gAJvgen5lr/zd2x+2GnqjXAWFiWdlrzr09CvY4OGp+XlHdX
	DHJslur2OSa+XmbcENxhTIGFAeOyJJnr0xLWmMTR6Pv0dPtOnuUyja2UXy1Kl5F1IBFubQa+JjO
	eJN5GicA5XnqACBB4QFUMWV/YZ2so0gRDtH2F+y8FXZ5Bkkw6WvifllDrEYRcnKElmpBRvGPNMI
	06G8SSTlxRkbu7NN4pD0rPcY5uFLLFHeOv83cIghNb1HoYalMFdN6EYPErBRTv5hAv+yznfan0G
	OGT16wYFN0DAPgIDWexWnTEPFV7EA+rua9YhRNgkArMpQUMBEkZrAK6BcijiFBKG96EkcZQWqyc
	zKnRoaM7e5Oo9JBOA==
X-Received: by 2002:a05:600c:3b05:b0:4a0:321:6ddd with SMTP id 5b1f17b1804b1-4a003217170mr23998885e9.34.1790528642770;
        Sun, 27 Sep 2026 10:04:02 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b9aesm19992213f8f.5.2026.09.27.10.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 10:04:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Steam Lin
 <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, Jacky Huang <ychuang570808@gmail.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH v4 4/6] clk: nuvoton: ma35d1: Add missing WDT/WWDT
 parent clocks
In-Reply-To: <20260925-perso-ma35d1-upstream-clk-v4-4-f3697553391f@bootlin.com>
References: <20260925-perso-ma35d1-upstream-clk-v4-0-f3697553391f@bootlin.com>
 <20260925-perso-ma35d1-upstream-clk-v4-4-f3697553391f@bootlin.com>
Date: Sun, 27 Sep 2026 19:04:01 +0200
Message-ID: <1jbj9iaany.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 25 sept. 2026 at 17:10, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> The WDT and WWDT muxes list PCLK3/4096 and PCLK4/4096 among their
> possible parents, but the driver never registers the corresponding
> clocks, so these parents could never be used.
>
> Add pclk3_div4096 and pclk4_div4096 as fixed factor children of pclk3
> and pclk4 and expose them through the clock provider.
>
> Reported-by: Jacky Huang <ychuang570808@gmail.com>
> Closes: https://lore.kernel.org/linux-clk/b8a8a65b-e302-4747-bc90-4920fc48795a@gmail.com/
> Suggested-by: Jacky Huang <ychuang570808@gmail.com>
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
