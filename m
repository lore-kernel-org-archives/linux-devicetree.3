Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783A437C0F3
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 09:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780823095; cv=none; b=Hb34P/oWqq9SQN17aMv8WWvV6J3GkxodcfpOeCD1cTgZgQ/BLszKXnTGpBcKFY0wFHtUydLp/oVDyZxk+0zEpPZBabT2jtkzvIj3XQ3AoEYyGCh08cmxk+/AQPzZGfv1xfma+m0WgUaa25FuFxHHdXFuUAawTyklgpJkMk9EqAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780823095; c=relaxed/simple;
	bh=mDBJnLc05sn+0RioJQg35cC9HBk0a63nVy1XdD7llqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rUrvux5IQqNB7ccwWEw33prQDVXNUBTMYtLkQVh4ej1Vxf3JtETbv8r4YTuE5xqmuajmXKo8oyM1x9trQEqM8pcEI6nt6qZpWNodSFd1TNfJK848Mr6thdsiBPeSAuMopPVBXVu82JU0hFqAH/U+q4KtDbI67PStjjlA4M6M4cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghhWBhfl; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghhWBhfl"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c8532ba6c95so1066718a12.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 02:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780823094; x=1781427894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDBJnLc05sn+0RioJQg35cC9HBk0a63nVy1XdD7llqk=;
        b=ghhWBhflMznCXXvl5cUujj7EihgsntEePjFOKVwRvBzbbWHZ/ctpQgVPBPiP785rAq
         W8FXMVLNq1bdsx3sSod2Jui8gIINKF7XNtMxkb7AlJNYNgfJgJMFoPktEk6oXv61wnIY
         tqx3ubRQHY2FPDv5EMOESkbAqvXokWkHn+sPl19nBHcClv/M0w7MkLWHeOiEoKzKrrDN
         je1xx63ecCuUuZjazkDMauKEiTQOTJZ7QI0DnnAlzJmeX1pwmESdeucjf6KFam8JWEzV
         Qnf+tptARVkTPC7ppsnjXgCTkxTyqHGmmk8Q6PyHBM/TGKNqa6Zq7/Y6nIfNv92nKdNU
         3rzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780823094; x=1781427894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mDBJnLc05sn+0RioJQg35cC9HBk0a63nVy1XdD7llqk=;
        b=XFtZOGT1B/sZzgHdymZoqFfq0DjAzgFd62uBQ2lxEbHNQiVECQ5dqTCFhNjD5x8+Ol
         MwyicpUtev6IHYizatCq80fINlSR2sAo7jUj8MBKBQrPOn+4rRCZ6k3LqYA2MbB9zDMF
         38XUHpNleQFOBM6qWtUMCCVUPj8s6OFCSdpe7gO0MG8ECkNraGV0oxVP2UjznDlJkKlc
         xYOmNMDGzM7VEbJ2VPHdXgWzr9YBo1msezHY53VNdgi+t03EkcbFWUysWQcYUfraL9ZC
         2CTs3lDYrpTOxYcWNxQ4Hnu5BjCxTgk7bdOtMxsjXTJLjETBFq7azhX2dwvxzu5AmCrI
         EAnw==
X-Forwarded-Encrypted: i=1; AFNElJ+oWhG/PU6obkoA+EJ96mDoBIMgVy/ycNsewWSDxZ0zafORpDUdvzzkBAfP87Z98kGFW2P6jgDPGMLK@vger.kernel.org
X-Gm-Message-State: AOJu0YxLqwgGilr5w1rQ93DfsGRaEcPGaKWW3ev7oVROxkPpuxe1hjer
	+f7m2DB8ej5KM+TZCum/9e+z2t67vfWHPAV/iowG4KUAGEQmA3yIC1fF7e80ww==
X-Gm-Gg: Acq92OFhrrUIqXiI0h8Hg/5AzS1zijAZ87U76Q6bCkXypKnqFfHa9lUhzwUHThLMTMX
	r5jIqNKjTAixLtsukfVC+cWFuYB06oa6pLTYvitn5bUQKg6znDjKatxbKj4nKFTivbsL6tdl0dK
	as73MHGSXSO+cLtadq+RKrS5CcNrLWEdyY6lHe+pC0OdXeJfm0KcTOQ0aifpWAosFABBKqAAHhb
	7DYLYOVNloG+/oNTCmn0AuPlCZxHHB6JDGWmdS6zlb3FJhU43JXRPSD5aE9Dm7KAbybohIlG3jv
	5h0dhEp/xA1TRIu8bhAbS3PJrwV6SK8LTSt6C7Nq4K84wpSVl1wRU9HcCXOOdqPrqB643B65+A5
	rD71bP+RcMlaMV7D9ZbgTH+jYZNTVrHwhYJd9CW2ptf3WypN3VtY44kbB3DDoB7fxx5Gn3s/N/p
	LXrjG7U7lfBI9XCI1XGJf+0MERRVdSfxeifJwEmBj7fUxbD58o4A1xcwH1sPfR0M//aZHjRQ==
X-Received: by 2002:a17:90b:2e45:b0:36a:95c:7613 with SMTP id 98e67ed59e1d1-370ef3e8fe0mr10945156a91.10.1780823093707;
        Sun, 07 Jun 2026 02:04:53 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:88b6:5847:963:c0bb:262b:6764])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf82fecsm12179851a91.3.2026.06.07.02.04.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 07 Jun 2026 02:04:53 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: Add Vicharak Axon Mini
Date: Sun,  7 Jun 2026 14:34:46 +0530
Message-ID: <20260607090446.22637-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260519125655.23796-1-blfizzyy@gmail.com>
References: <20260519125655.23796-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Gentle ping for this v3 series.

The binding patches have Acked-by tags, and I am not aware of any
remaining review comments on the DTS patch.

Thanks,
Ajit
