Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9D429DB9A
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 22:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774130815; cv=none; b=gZbdjLgF7kAbLpCCbXsd2hQJxfX6sFTOiIyebGYBpNDyMeYvyu5pgh0zdy0drveOawCQQNSX7V+GszUT1fl1TjLo0Y7fzY+x7fxBxFIM/h59bUpc9LEdXwb/fJlW0opuv6rjH9vCURiUjB21FwL1uqaPAzX6RMZspAY5ovrn8i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774130815; c=relaxed/simple;
	bh=Af3eOZ2o5PhXKSRzIFvJwxgZ/wuT95Wxz/uQTXZmuUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGolkNzCvYZm/Ow/nh0WpLJil/W9Qm1ECBZltte96/tmCztdL8W1Mj7dZ4fI4Yr2iqjCTAQAlTXClaSGzj7/RE1NHhRin1c+bqlbmLlCScy/lk3vckeZttlcJMo2Wpm0n3+8MqGiExlnEH1WqnbcODqVuzIPqLlKhCwhXxVLkRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ci/dBUJF; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ci/dBUJF"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-89c6a711ce9so30691716d6.0
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 15:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774130813; x=1774735613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Af3eOZ2o5PhXKSRzIFvJwxgZ/wuT95Wxz/uQTXZmuUE=;
        b=Ci/dBUJFT052KWQ/r3j/WFNjvZT2960/X6f9QJRXUyGFc2k44923glYi1rMP+tUBjK
         xsEPMpB1y06sD+p4sR4OGke2T6X1Mrm1jEP4WDMZO1YDv5azJLxaa/7h9Tp85U9oBPLw
         ydtl1iUKSgUT+XQQMQ2Sl4JikJFNpA/N1uNVXaK1UyLWp5BYhVS9iJpbO/Nf1GgcGceI
         1MoDLVaSE2pRY1Z6A5NM6yN7OlmY3xzu69+aZXTpTcKMvTGrwp5sUG1kRZl84adm+Ux4
         KHR+IxRxKurrQyqfCngwCTWVeeBrqqDEo5pjFYPT5FF1ErOBokw/EW3HS7y4a0bWcpAU
         +CMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774130813; x=1774735613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Af3eOZ2o5PhXKSRzIFvJwxgZ/wuT95Wxz/uQTXZmuUE=;
        b=KAFPjtazTZ6VcixbfR9ASQFFbXbcLasGcxZQZ9LLpej+RC15RXk2Uk5AbmplviVK2u
         jU3ffa0sbKpaISlzTG5loZ21YdjRZKKXi5tdlx1Cp9TxGXen1eC1XZQrai3jnLMPoAv5
         Nj5xIfrqM82FGdcCNRQn7YFCz69l+t8x4aozPvhDYSC0W6TxOG1COhZTFJkxSf5tlDL9
         s8oRcAyGfpRjH/yxqPOPrv0B3jkWseuYZ2BPENiy4tj05suLdVIoNmLRRcxg2qTxKaoW
         ma0QBFuViK66wuc9IeAGNN6EertqH3dJKT7SenSypgTADLFZQXFcZLAaxBaI7nLmylHh
         ++Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVsWhZjctpqAIyoVa/HnF085gH22u2wTkmo6w+1EW3gM2lhbrtFytnp2TuLPNCT9Oy5gLE2KEhml/b8@vger.kernel.org
X-Gm-Message-State: AOJu0YzuXmMh5dwrk+VT3cEgl0kJHQMYjosl8cpNTzPTe9tpyKFel6+W
	i4FXYRRGYWQ9UlxSC5GBtIGDQxY51zzalGnHJrT+6r1qTt1pZS4oZVjy
X-Gm-Gg: ATEYQzyKlZim0PQbYK8xaf8dyosc62De255VYFDLHEWOJI2YHPmN6hDiphyRR/wtZyd
	ZNxoe/CrAg/fZv6yJgaOjWAdRmgOqF68l1Em1b9yLu5JM6F3zxJkwJ6BsraRZRpSIQEh1RCf8so
	TeZrCw/fNRvtaaxfHyvrVDHw/WIC88qHf6rXuW9EXcJDjl9+K2b6vmkEK+eWJoNJAmN4t4UDok8
	KbgclD2ASccPRLljlJMTtl/taXNqVamT17zQxWP9QlDGI9bYbNQi12MJTXG1Qq2woXJfIBrvt9l
	N25yRbX44jIU2FeYRMv7s3lvDiivFh6QSjG0A8cmYOdOCTEwVdzneKNb/SX00XYd4E23kI/9a2Q
	kQ8TAs/pm/UWrtU8CdVE3gsO9o/fgaNK2okQzb82Kd3VFQFu1b8xQxr3inyKWn6x9VxvL5fjcTg
	VuQQVWkNGggOuBbpIFK8Eh1L5WHvfepwPJVjoGa0/u/pmnvLAUKD46hKBy
X-Received: by 2002:a05:6214:2622:b0:89c:6289:f17d with SMTP id 6a1803df08f44-89c859bee70mr123753836d6.8.1774130813515;
        Sat, 21 Mar 2026 15:06:53 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8536e630sm52425446d6.45.2026.03.21.15.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 15:06:53 -0700 (PDT)
Date: Sat, 21 Mar 2026 18:06:51 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	unicorn_wang@outlook.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com, chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: sophgo: add Milk-V Duo S board
 compatibles
Message-ID: <ab8Wex56TJB46A9Y@sleek>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-2-josh.milas@gmail.com>
 <fdysolp3ogf4ra2kpr565xtkwspk3yqj6ydbkxl67wi7fviabp@x4owynopb6s4>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdysolp3ogf4ra2kpr565xtkwspk3yqj6ydbkxl67wi7fviabp@x4owynopb6s4>

Hi Inochi,

I originally added the board to the cv1812h because I was using that dtsi
on the riscv64 side. I removed it from the list in v3 since I added the
sg2000.dtsi but forgot to add it to the changelog. This is resolved in my
current patchset and notes.

Thanks for the feedback,
- Joshua Milas
