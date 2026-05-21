Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2BB34D38B
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377297; cv=none; b=g8ZYLeasp7vFNfq0TgwaKwIotVPKO4h1gzkxItxDtZH2zan6ALaWk9ehiiOG4IfqaESD1G0mDUru9Xpfxx6/akRnj+nPYhbulbo2Dq3hWJUnVl1umopO67qiL4vbUAd8b0dF5aNoGa99t1+3XQdBxINYr3PxwTFpItUSxYsxceM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377297; c=relaxed/simple;
	bh=d1y1aHRjslu84N45+iPQKmW6OS1b2i2WBZc7cYszPaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GAMWI79r2nGvYqWSv8ZE/q7EwMZnPOzQdXc1aQrmvo3osSmbJztcFbsCQoqtCm/D1T5NvAL38D6w2budP3v0+iJ0XmKOa3xwVuUExnTyHbhaWqYcC5AHLduPf1Ucr37lEhk6j336SEb7gi+o4v/ABQJL2E2TeoGDiwHSUwLRv3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klbmfG2C; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klbmfG2C"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7dcdaf06498so4218519a34.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779377295; x=1779982095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1y1aHRjslu84N45+iPQKmW6OS1b2i2WBZc7cYszPaU=;
        b=klbmfG2C7JhFh4QOSEecVBCiqWT9i2bNQ9pDGBf7d2Lu+x1U50oW5m6HcAIkI9T5H9
         DMCJ8MnXs4FGsOhsBZ+1m7onjo9yftY3EXQQ3pK7urx9c4rqDme3XsMWXHx8jmEACGOI
         FvlhU/CLK4vRkexaCVza4QUAjS6tmXNgvCGR30NXkqv3feTrMZaFIK9ZVhP14T6Z25zh
         35U7VBgjPNMp/uOu3BpMACA/hiEYIGN5S6/HLtVlqzFeiatiblm3dDtA8Mfoy+A9Atlh
         tbnSpZDICg5n4npSiK9vJDD8ljyC9ke4yMVNWtOz9PP3yzzF8fqvi6fwFvsLH53yJbya
         Ektg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377295; x=1779982095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d1y1aHRjslu84N45+iPQKmW6OS1b2i2WBZc7cYszPaU=;
        b=mUnhVPv8ItERghHch68JMZu+CMXZS4IoMAPVH55/RYP+VjeSpiXIpV/X8hLA6PrUBy
         fJVPMUVyvVhSso7K8hkTVKz4M2vD8aJ7cM9/P1GGzzXrWQoOI/9bPQuLSVMA2wC5EyKc
         83kjKWvgCAXnRwrd60JiryaBL3PWgJCfvSYx1LbswO1qwL3PPAb1aBwJ2wY4/ZcE6t9S
         n1fKjyuqHO7yb1x6gRsYUo82STW5Repv9va5+gRughIMjHhXfehd2g0nCaGk/GFmCSwF
         uaChgis3DibvQxbnYsy5sLoWK8Zt0mYSsvlWZYQF9lgqR8jRAjUNFnsw+1ZzgX1OC//6
         SbLQ==
X-Forwarded-Encrypted: i=1; AFNElJ+VdHHs2iDnPPL1W8f1xXKx5WpIYqQ2FKn6t0mu9F3LR1B8fRNlG7JAgOZHZcO8q6skIArYMEnetemb@vger.kernel.org
X-Gm-Message-State: AOJu0YxUxnMSW32lXrmTnF+2d9u4fm2DBOsokWlU67wC162WzmaDAIqM
	09OI6bOJuhfgbMTaezch17nQg7e6NOgmBcdMcDb/V6w9kYRBNYQtu184
X-Gm-Gg: Acq92OHCzFEAT5S2IaaQSumB2ARvS3/YYZM9MGaqOb63gswuiHnUfSOaNH1esA+jNvx
	R4PV+5/a2IqApBZ7NHeAYY3ReD4gqV0QWVALx/4LuXMRtHjle8U88h+rL+JjTSLlsGWK+vy4jLy
	MwP7UXxk3bYzHD/MoF/QqFQQ7AdFmNb5ZbKRQ5xV4STEC6zUCj2JgZuZRzCBvxYg0Y6RTCGO3Jw
	FxZLpsthe0PYjYT9X7sbWYK6cWxzV0ZxeocSFKpKRhAaiMLe/Cq1y1kTm44IgDln5RVLPB6P9dR
	8XS77TANE+oHReLEnPDwk2qx4kD7FsbkZLm+TlEhB2EsazyxUYsWpVhNzY8SstRhflJSUs5z+w2
	wx1B7V+Y41/RbBZlKGPvnuZsCXgRl2/3v3kx4dVgaQTMNr0NS6PgmEGoKSdKC0e1gP2E85WKlO4
	C2f3tdItN44QDnqwqQhOMKYR35+fZ6ZHLlx1lbnYo=
X-Received: by 2002:a05:6830:d04:b0:7e4:10:c994 with SMTP id 46e09a7af769-7e5ec2a646dmr1826783a34.11.1779377295191;
        Thu, 21 May 2026 08:28:15 -0700 (PDT)
Received: from Dell.attlocal.net ([108.243.219.47])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e5f6e73425sm617527a34.17.2026.05.21.08.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:28:14 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: sashiko-bot@kernel.org
Cc: akash.sukhavasi@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: serial: rs485: remove deprecated .txt binding stub
Date: Thu, 21 May 2026 10:28:13 -0500
Message-ID: <20260521152813.28851-1-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521151305.186201F000E9@smtp.kernel.org>
References: <20260521151305.186201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for catching them. Had my regex incorrect.
Will send a v2 with the references updated.

Thanks,
Akash
