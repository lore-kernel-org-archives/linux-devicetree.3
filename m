Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4E7428841
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 15:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275244; cv=none; b=nBk+lVVSp7LVjCP1Ws59CI8+2mO6wPUkvMK7IFMifrurCwV/i3ldt29THI12PGCs0jFOGE/PEzegVcJfBaH2CtbRcx56pk+yCD34aeqGnX91Mq9zEP+6LPzK7k0qMvMPRxgvrefvgiCfxlD6NNXOThgsb6kiJcMm1q8lUWAGzMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275244; c=relaxed/simple;
	bh=I/qfdHGcZJO3oZ78BHYS8PUCc8yEpZReKvOSgJYCsWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a9aoWYG1zkBPzG1rVKEEYChrUAdAYj2MUS4Z2vbu2vW6e4rGm8ZyLi4wDFJnm0tuFzYCUpw+bNWgfhNkp6t1wNlU+ybqBPzcWkHru681McZWEHjmJ9gfPQ5FDS3qBXettUonruu7xHC7a4SiF8EGGcGS/zKKcZVOQQmmau8bFJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jd2jl22b; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jd2jl22b"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4472500e25fso2044524fac.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275242; x=1788880042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/qfdHGcZJO3oZ78BHYS8PUCc8yEpZReKvOSgJYCsWs=;
        b=Jd2jl22bdK4Y7wJ+9/c5xLEs7CTaj6NbzRQlV+RKqjlO4QgBof21O3dXh5HCAxkW24
         F1ozbtVKnUrqz8wJZFRDN+z2kNU9W2mAyo/dSyTXOCA/7TrYEuOFEUsMt8ipSPu53mQE
         rnvy2PX2YviGdSUT4/vs+26rVZAiQyI5DvQrGKyIGCKHspA2+loFmV0CtMNH20B+fu+n
         1mSLcd8k3tqlgnj8gw++7ksEVITJTwd2w20ya9Gh+ZV+kAYhY+JBdcmb7Ri9+ajRw11n
         yWpk9rkHuWU2hI9tWvrPbIpMcrwyTWZ/cKzgCHwsBg0hfVOf4QvRtdyyb4MAccZK/IVP
         77Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275242; x=1788880042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/qfdHGcZJO3oZ78BHYS8PUCc8yEpZReKvOSgJYCsWs=;
        b=LNDo2/KognkuCA02Ug7aVxHwUQx77kK+gRMSRH3VeRs6vf8yLqSGwN90sk5Nxh3gMB
         Rrc+0yKDbL3Q4pmENvVsrw8fwFc+kcXA6sQR3bh3Ud8PfHWe9Ff6tSLsoLOr+SgE+mi5
         xAUQ4z0BLy/R69SlUJIvG16pxP++7HROIwaG/t2UxJaa/X9jWDnfEzGNroA+MfhJomZ0
         3MTl4SDp8FZV/AFs2NcnMdrypF5ZmCp6nOeE4fiFJh5VgofIlZ6Sk0E4dsHwsL0CySo/
         2Q1+vPBoTJzS8vl+klW0XwhUn98r48nUPoWigQ+mF8vj0i/W++Fs5SZDeyaYFGZNYt/L
         yUuw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/ppgJfUSnhcuQIcFlGxQVo0pccKLqk5M6B6vSg/9hppAz+hd9cuNC89maB3R2HAItikezzj1WdxP7@vger.kernel.org
X-Gm-Message-State: AFuF++nqrYQjUHBiw9NVUfZNIn7jBk51uuULXc4+m+podVFilwstotzc
	rQP0HXbTThOKoYhIje+4ZjhWTOjjfwauAAi4tbvm3dl+IdtYH2zNP3MV
X-Gm-Gg: AYBFou24b2N2Adh/CIBW559V/muJXYTQbn/tJAz6NjEU9YxTzLcauVDLjClgOyhuBMY
	HkqtHIvU0/jVok67E5KUU+OvnquzlqJx/jT+uOy8Vv0M0jNftcCas5RrvI4MtEgtYzlslGy/MyO
	ykys1J2IHWG5mU7g0AWLBov/d98hIItQeehJPiB0ThWUFw6pfBuoDW79r0Zus0wGqot+1IqipYi
	7+fbUqPLt8Q998kBzbxsLAm0m9/4wnPaLg50E4eC5Rd22PmUuiLLaVvRqWCqTBu3BoBD71tQjGk
	/9ridO/q8F/1J/IcWBC6hCAtOd3cFDccyywkSu1645sk7dyc5/IlkZWG31WhQWSrL/BRW/2PZyF
	XgNIs12TFMFl+Ylc3DkIwRhIoyolA/b0e43NVFMIvhVW2JoBQtooNgPsWZLxxxMda+OiPVytWIJ
	mFFFVF6WpBlrdojPKEH6iY7yseQ4Z6OQAHo/IGOAPxN17QQHDr98VMtsS4ZOCp/GJbhsKF8zRvI
	9sxg7sWfq+D/o4UO8L2WUHzMp4qwPMacX5ACK+n
X-Received: by 2002:a05:6870:698a:b0:456:772f:682d with SMTP id 586e51a60fabf-46837cfc41emr43388545fac.19.1788275242027;
        Tue, 01 Sep 2026 08:07:22 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46a4b7a9f82sm10697162fac.18.2026.09.01.08.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:07:21 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] arm64: dts: allwinner: add A733/Cubie A7S DTS support
Date: Tue,  1 Sep 2026 11:07:20 -0400
Message-ID: <20260901150720.1764626-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826230942.466219-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com> <20260826230942.466219-1-vinicius.eduardo.pedrosa@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Vinicius,

Thanks for the detailed report. I reproduced all three issues and updated
the private v2 candidate.

The Cubie A7S board now defines a correctly named 26 MHz `hosc`. The main
CCU takes `hosc` plus `losc`, `iosc`, and `losc-fanout` from the RTC clock
provider, matching the four-input binding. I also renamed the bus to `soc@0`
and moved the UART0 pins into the DTSI with `allwinner,pinmux = <2>`.

The MMC binding fix is already in mainline, so v2 will contain three patches
instead of four. I will hold v2 until the public CCU and pinctrl prerequisites
are resolved, then rebuild and retest on that public stack.

Assisted-by: Codex:gpt-5
I reviewed this reply and take responsibility for its contents.

Thanks,
Enzo
