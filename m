Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190864;
	b=MHrXnTMNiHZIb02vAFRaVFAMrQJNTSdckrlYo6A1iryYTYRPjs82hqxaxO6H61oE30Ow
	 DoAkwCrYjLcdnrDYMGGSdiAls7LU1mTg/ShB2cgvdyp/bM3kagLN/u4DJctKuqhd+MPb/
	 J1BHLPWdUmng9k4cEN30mKLSH+TAtW37RLB1uKbVFPZ2lZFt1G7AyMVvxbT0X0j263wD9
	 BJHs9aV/vdGbdA7XO8xibnnDUlJByvZOmdeCi94+MnMEQk2aIEX/bWfEGRIhTheYePWVR
	 ytTNVetiAFu9Tqb2gRhPIN/JY9AlYTcNbMWF+kvyZ7uXheuHhuMCCJa9YKPNu8QHdDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TBs7LOLsqlBa2l118zldqdkz8VqMZk4EmM0/z3WSl0g=;
	b=rf+f0YU7NIOl8U4W0PUIneGj36M3R3EuTBaNcLA99MMLAejqyqAlDm/BbhUJNfccc+xa
	 xDOblwQ8Ued42j0UBMjPV3/6yLbygts+UfieIIzBpAT89s1axvKliMSWaZkSn6+xZv3z2
	 +5Qm3ZIduK4gnJiZVpBfybDsjvLW3l/euH30TyXH+Fb9MeaKKOJoXupjS3TFrtLvUYvu8
	 DKlNCD9qiWYUFIF9by648kgx50VHaKrkG4w+vl3XaPit90wkS0vHxeaJOgJmh/jK4hOAD
	 uIJ1K98F1hlhv2YTMHuS0vRgKiWVWDSbnlRqAfuly3S+1wJ+khy5uvX7ukygnNjUENA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=U9FPy3z1;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5959D606A32A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5959D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=U9FPy3z1
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490f38e9688so812518f8f.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795190862; x=1795795662; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TBs7LOLsqlBa2l118zldqdkz8VqMZk4EmM0/z3WSl0g=;
        b=U9FPy3z1Ah3rO6PnmTG40mdUh7F5mJijJd3VXPUjTGEt1xQ2naZTeJv+4C9hwXa7UZ
         uiC3GVH5RBjmD9ahmLwJeQywXC3Nb0m64W/8dm40AMURypJBfKbLVWj5tCeiUo1WKDjZ
         4eDylj1/GVP6vZzNa3sc2/AR2TWqNavKKt+bOQ20MZF7UZTKdOJiHeBlMw+1s4Bpxsbn
         Wqxdj7AVIXwWXeYuNXsLXlmTX8rmJyGknlahNzCqIqtLJ30H7CXSdj865u5MhmNItPn1
         tVwT46hEkmW+YOBbKvyv47E1gpnzj7h4jp3y/wN2ozQychqk4ftTQ9n2iBmerZAlVUs9
         lXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190862; x=1795795662;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBs7LOLsqlBa2l118zldqdkz8VqMZk4EmM0/z3WSl0g=;
        b=2VXhuJKf5+zZJW8fuY0fBLpo7XbuVlZWrHBClkX2WfKC9o9NmVq1XHMmBxlcfwwS3b
         pEVQ6flkVlMbl3TMXMG2TBLZiEPOXT3jjI7PRzHE0mzrA3FhdKBpWvO2eTeN2chRJyr7
         azgiIfGVdGIFisnKwnofuaWidUGF2VM/So/TYbU358ZzknA3Mbx97PqYljTXaROzIGSD
         aYHOxHBSOxMWlr3bBLsYzzZv2D2pm6j23qTX01a8pGEPfpC+5CjQfOYXI787J2PLeQiq
         bYt72Ewoy9LQHd8DgNi9Y/B9uUxrjoW6w8MlHpfNQunr4/zDtJ3nJJZBgnM4R1vXIOnm
         ONNw==
X-Forwarded-Encrypted: i=1; AL+hErGPWtmyYSK3xfbwZMw1e1nOtqpyHO1vkQQBaPCYq2idyJGol5tkyuz8drljj2CrmySS4Qxh9485FPZ0@vger.kernel.org
X-Gm-Message-State: APuU4Z9Aa4UxW9LJPHb6pPkSOOfPfisjNrHRJ779Jmtr1q4qt8uA2zSn
	wxW0VvWkhF4gUrMHKOe8F0ZUx7U4NsAlaT4m+uI5UDOil7iqOFZXdfp4I2XWoL7+HVg=
X-Gm-Gg: AZFdTZdm6CmLv3wZePfNdFFDNQ8NcuIuSu8b4mRSIF8rCvQMviS/MRdUm3LuKB6+7RO
	mQPHojKX29qcyYVJNmuwQlGPiE+GdYsgbVpxk9qW67dJPzFtFKj5texs/su2Vjg30ULL2fo7+ZA
	BEunTz0k9RQTIbiBlDAKd065XsoERKo4Bom7mvbel90Bnv7OUljpd9UekIO0cfqqXlj6iGmoEHV
	jlkvQcU7SW2uAUpT2szQynK5zgYyT8lOrqzhKLYqowwTnr6Tliu4g2u9D/Kl1PNWvJg3dK3k4bs
	QsRb/q4BULASLlOsRvO4Y568EXc+l5JJsgw47XRte9paAjCfnbpzQA6psd6SePnjY1aqBtvEW0d
	x4skS0ip3T8QdQo6bjMFdxtkFM7Lxeqwejie6al0FfNu8EGqbvpWnqGqWJgA5LGYPj0zqev+gb0
	H3mn5b3TKwRcWV1xP3HPttNRxIAPnt5Y5LPaD17KFsx005pqmV0TsVCaLa9nCuh2UBbN/VGrBnv
	eev/hHHVQz1nCwF0W/xSLY8aNTb9N2w+17S5ycvKbL5rE9KB/3cd/eTGFg0JqDUowoD15E9i0W6
	Nw0xwhFmHwHEoXwa+OGsWA4hpAvBK2go2vRq0cMiG+YxdElJ
X-Received: by 2002:adf:fc8e:0:b0:4a6:4ac6:d94f with SMTP id ffacd0b85a97d-4abb3956acamr6142453f8f.19.1795190861753;
        Fri, 20 Nov 2026 08:07:41 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf629dsm5958324f8f.9.2026.11.20.08.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:07:41 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 1/2] dt-bindings: gpio-enabled-clock: Add a new
 binding
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261015-feature-clock-guard-v9-1-c1c05a498d9a@bruker.com>
References: <20261015-feature-clock-guard-v9-0-c1c05a498d9a@bruker.com>
 <20261015-feature-clock-guard-v9-1-c1c05a498d9a@bruker.com>
Date: Fri, 20 Nov 2026 17:07:29 +0100
Message-Id: <179519084920.3795820.18319787881002052092.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=582; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=cWouKw16O3+lMqOqcbR6ybi2hZFly8D7u1jUz0/iQqs=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMBU7J3bfZTBRXpzy88kisbUduVYB+t07Y+pUvNj+1l
 7wmklrRUcrCIMbFICumyFLDXS3+TlLry6zpOrdh5rAygQxh4OIUgIncDmf4yfh5kavm45xVa+p6
 na0fbhU7+9PgYLrlwZln+ubMOvSxUo+RYeLPCS7BxxnqJbuDn/SfkXrA175ufp7y+xuRJnnzd1o
 68QAA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Add the binding for gpio-enabled-clock. A GPIO-enabled clock provider
> exposes a clock (can be any type of clock) whose availability depends on
> a GPIO status signal.
> 
> Some hardware designs provide fixed-frequency clocks generated outside
> software control, such as by FPGA-resident PLLs. While the clock rate is
> fixed, a separate GPIO signal indicates whether the clock source is enabled
> and producing a valid output.

On v5 I pointed out that the input is not fixed in general. It might be your
specific use-case but it does not generalize.

-- 
Jerome

