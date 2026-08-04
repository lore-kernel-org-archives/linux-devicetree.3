Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20E843F0A2
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 21:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785878866; cv=none; b=W3FwlQzfgnQPRd/BZtlCKakQjHJQ9zfNINlKANUUZ61TEX2tek6u8Sh5bpZ9bZHmbYEZ0+CvXTC9FCafBzWLrLSqwFNkq4todNxq70IzD+u+fUglb+A6ikSntDixzqLAESKTXmvF5Hj6WGM2f1euwAxPBoOrdCINP/ZMOpFnHk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785878866; c=relaxed/simple;
	bh=VGb1jfHkMVxOapYytE16mS2xansj6G9Y/AJehlGO+Js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uG4yS5KuM6LRlKMr4p/h9L3z83em/2XKYSQ+10InF4ME5sLzlSsQRijA0PxF/+h8q9nyvoytkoDX7uZ8cOSFcty9LxnsbP+wt2xIGZBeiQHBCcat1445we77hGM6eI7zPyyd1455FGwQprVB0y1XXc5Ig+eIZ1T75dcxO9QJREU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvtu+t+t; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvtu+t+t"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-497e6956acfso262419b6e.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 14:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785878862; x=1786483662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Elx81wKiFvHIBGMAjiuzWwDTmSw0D6ljnUBG1nDCbuk=;
        b=kvtu+t+tsQ7cgQj+kvLxPTl/mdyHybY/wrU+1zi/IqsR1z0UvAyUeiX29feDMa+42R
         GHbPBYQSG80U6pgSFMhs7SI7gBXHFf7ccxIXyGxHw3T80GlSDr3CPyzd6CV8JIq7uBA1
         NuUwtTaoeGKE0oPe+A1mtNAIgptR5Nxz21JtXSUZzfTdG9gP3A41uSPceD9n5vgKrJ4h
         XACuFSYjXF0ZfSllMP9eM/g11W7Db+fuAaIl8uwd35ihR7Ats3OMsPtxUisPvoB1pvBb
         +ajqznPp38wqFy09PxwoJilwhrRVIw8OKWYH1WFaERT5e6zgfSV9fXiZlyz0Qkk/xAzF
         YR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785878862; x=1786483662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Elx81wKiFvHIBGMAjiuzWwDTmSw0D6ljnUBG1nDCbuk=;
        b=btVLU1Nvr6Xohf6ODjPULsaAiG5Q/1BUq5vEVqOjckdUMCJCCkXTIA6h7WrAmEWfre
         Anj9I3MmwgxHRgCdhZcwElJPz7AsCe8R7guwtcSZvSaqby4KWVtxZ0U9rqM8KkgU0nFU
         z7686N4qEF23j1SKf/zSg9ss6QDHnhavCMzO1T1wR73Sl/3jNCnVv/xNAAbj5Sp+x4v+
         IuVeWOXvJMdMRJss2MB6d3QSytvLlzOAiie1UIEEPAWq0lvrhlRt+ipaBHUdKMlZPsKi
         I3v7PmlgrWH/BQVMzMIOBDBBpohgtw99TkgnLKLvg2wXmaLAV7y4VLrqbX35X+Jx2DYV
         63Jg==
X-Forwarded-Encrypted: i=1; AHgh+RpmMCY0c3C6gcCvalz4hMQtO7AuD447c5jwgpLjOPIqyQSO61tcxX9IDy/YW+I1hOb8dCNI62/Ngmjo@vger.kernel.org
X-Gm-Message-State: AOJu0YzKQJ469JWyCAAwj4luldiag8id125both69ynA/by0EnY/LG3F
	l6hyzGZrAwH5BbifRFIt/Bi0RIhjFhapbNOAkYm36Y0e/cWbvLyljibI
X-Gm-Gg: AR+sD11rx59++hf5OsL7+SWB1ikqbn//1RFHVA2e8qW10EHS+Iz48gDiLm/DvznxT3E
	GSCUL+Lczl1QU9ho2rHGn7/58j5i8mH47qg/1FMdWiRT0OtB7eFQ/KLxGW7c48QHD/GMTyKAfuO
	NxoA8r2ikw8oB5DPTcNao5pt4wos7ikfE01Ug+eGJC24UmX9pYcgv1+hTvMxBTqosUREoye6ByL
	iXB7DX0ykXdaXfG2D9OZ8XqDZ4AOGehDAGXkZsGUzuAkXawoKNWzNyLOg1NhfKdUIqZ7ymGBoFs
	WRcw9OEr/nWzYS2ZN96aOncMyuxYoQoVXGEtLPaHZnsIjW3CSzEfTWfAoJaf93k+wfcCahhNC5E
	eauqGNL2x8jNsO4u5hMIth+5Ae5GqQX8eHUJjSU80umX+dmn8bmgPkt7lFW1Ly3yxnHXvhiIZSo
	FNawepOydON3X6ghjHhSi5+f8rgYB872WfPqDGcM9+KGjIeZ/BTr+1+eEZ1P//1QIP82Kcp5czP
	mBVm99piOP81sOXSskkzC3f4MiXQ4KpPwCiYmPQg+i9mmNlCdCBP3O91ZEZMtmKebQ+GGwDaxe9
	Rw9khKmIeKXppWwosiho+j+MhoWapYm173onMk44rksJ1+im3vb/v4ADhN5tm9vlRguILsr2Ouj
	UBYzZgcqkY7vrtYKqQAIjX1G02KE=
X-Received: by 2002:a05:6808:3510:b0:4a4:989:bb1f with SMTP id 5614622812f47-4af98935a91mr6058342b6e.9.1785878862648;
        Tue, 04 Aug 2026 14:27:42 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae7c50e9sm451659b6e.17.2026.08.04.14.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 14:27:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 15:27:27 -0600
Subject: [PATCH v8 4/4] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM
 driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-h616-pwm-v8-v8-4-db37ab8624ae@gmail.com>
References: <20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com>
In-Reply-To: <20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-clk@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

Add myself as maintainer of Allwinner SUN8I PWM driver.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5114e6db7307..9a778d1242c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -919,6 +919,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
 F:	drivers/hwspinlock/sun6i_hwspinlock.c
 
+ALLWINNER SUN8I PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	drivers/pwm/pwm-sun8i.c
+
 ALLWINNER THERMAL DRIVER
 M:	Vasily Khoruzhick <anarsoul@gmail.com>
 M:	Yangtao Li <tiny.windzz@gmail.com>

-- 
2.53.0

