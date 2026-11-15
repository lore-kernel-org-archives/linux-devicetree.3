Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764589;
	b=Uh93EEgaIS3mxyIp+R7iT88jGsteitkV24uzjijJTMdsBImnbXcCD3B17vAjBEHU4YMm
	 rAOtmP17t/PMr0+Q6Q1EdRyZQDCviqy6ax15wLStmhlgkLqPgUEVnyw+YsPBlp09dES0m
	 cvUnmnKmLK+s2QKEai/Ut85rWk9pPHMZLHhVgJYJPlwe5TcgoFTE9Yhu8d9VCOtKOsC4E
	 HTPLMbu04f2T/DR8gBxTjN62Te5vdwi86sp7CwAIg4n3SUUTY58VwLjF1q4/Y6BIt+w4o
	 NNYYyLAwgE6y+VW0r8+BViAbgdLbgw3PmRvBoDfB28/qMN4LZ6/Wo8+5BiaJXOioZQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nEj//Ut3LvAdBYHkruCpeRqw/TE1nQ9XZ0jccIaxI0M=;
	b=HgesHfPvWTyKhbL89JugyBryXpiAwhHRKOxVHdAcYdAMqKWa/MpHN2K/CZA7TU10z6QQ
	 UYCWbHkJXVjHXvPXf6pavoV+I4lTTQ1zhQvSa148siC5dPPgwD9uNcLnGJGkNCuqMjvm1
	 QeCSv8GN7x/rd6bUNkudHeqsheF/eKoKMlGZvpusOhij8pSkaOo56rawQy51lOnZBT7aq
	 YZGEewPrZzszBY3oqejjap2/cYhloZxmpu0wlKzuM+BSgzAlClSe3VbMbX27Bg2ldNYeL
	 x3/He64z3WjuG7suuQnGDgOcdYiPR+tlLkoT9S9bG+awWl0RiX+qhgF55EKbxR5AB2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcvgdI2h;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06015606A31E
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 17:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06015606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcvgdI2h
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso3282655eec.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794764588; x=1795369388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nEj//Ut3LvAdBYHkruCpeRqw/TE1nQ9XZ0jccIaxI0M=;
        b=PcvgdI2hMpvMdiW1+HQUyQPn73hNMwjQBCwx2gkXPzGcBD40Rm7sqewFwAMwQCrvSt
         dujQtw5KC39VuO4ARpPHiz3Iu+zKcCuXu8Lq0tBgOi9SUEdX/QGMVciLkHTJEwOvAjfM
         Z9hMoL2L90bxWRmAxOxqdqU1DyiRABaDLILrtFT50DBkiGTsLzDOE48d/UAbjKMf1AwG
         feu6Fha2eouQLYBnnvCedkwY0fj4ZGKC4bXCNatK44fRWUVlJWVfupyap9ckJWUErR+0
         eUl3RMiNb7nhdmEhxuhtFwZ7jvv7hluUuX6DMiuvI+kXR41QKL7swfA8LdDJotG8cZfc
         2f0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794764588; x=1795369388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nEj//Ut3LvAdBYHkruCpeRqw/TE1nQ9XZ0jccIaxI0M=;
        b=cubtAmBTyJoX9JnSNY5q9iImQD2mGj+GZgYk6VjZkFNM3dTrm46RMXiMkTu0e79eN+
         cP/0c+ck1JNEug2FQ+rNm18HE7m4ppXoF0UwMI0UIkLAyEbVWr4xqCSWxmNLfMrIlqWl
         AwwffR1jqOM6s6tBcyQjIye/g8tE54CKRwIWolrPEyq4JpDSyAD5C6KOdprSaNaEJ0rD
         gIdqsMSRPXVcmXmoMDuxIAFLb8YLGGzRFeDJpn9Tq4WdVlWrGJ6XKE9AHiesEy3M+Akp
         K4VPdqXZ/craEPrJlgRs/Z+vjKZJ5qKZdnFuuBRcORV7lioJTKpmQBXojESmoWDHAxEh
         nmVQ==
X-Forwarded-Encrypted: i=1; AL+hErHiWZBl/jO0ar1a3lmkwfzCEkpsu2y6RHK6jDH6kiVaOwBZMDnfs1UfvjT+SgerDeOWXKTHu9LNlUTZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+khdBOkBBfCVr3RnQZDxkoEglCJaZD2hAjm6bR+gTlU1oMeZSb
	0iPv4F9iDExnLOZIL6O8fcM1MVv24nER18jeQwfyQc+LIbHnl8nBDyD8
X-Gm-Gg: AYBFou0rE+VyqDZBeegACdh8nruepQvuo6gb6WjuNI92R482wG/csFFgI5vqLFa7959
	lzlIDUEg3G2IashiVP1vzEWDAIQD7BwKWrVdnCCNyviE4iJPOG4wn3vMHF23VCVjCTJAeY0TOCv
	tCazOj6a5alFmPyztptATtYLfXG6pKMlThf4TqcQRslFdAlbzKZVagzJgXOuCzY9p4c8ZBNv3KN
	kQfd9y+0h13mkPGEZvG4P1L0EOrIS12Dywdl+dBuEAltZD0iD/0vVW/MFJR1kf6agap1/ocensw
	iNA4EQ9RogzouFmIfPmwOllRLwRNcGm9dRTot36Z1eu6Xt1qQ6gg8AWBejw3LP1JV3+1yUHrbvt
	onZGNXwk4v1kw/lr01JUDKYaV7cZneB6rTOGD+QbCcQfua9WtnGi85o9j37nSzwDyjlNnA1uLUS
	5uEO23xR8xbp7op7tPkSY0lTogzjHODrs0XDxi9sxJ9LkOHw7gt0Jss2jgRuWxQBeLphAGwSo3E
	KQDkJr75hd4ohJDIkSD7+0NiFO/NxdRkHZXSSPISu6KGMKEKyTfeQucSw8TTqj6fZsOKfNDKF/y
	NGHD1DRAUv4lFAQ6Dzup0hQYpaHAgiLIWXRdaop+HZoj7Yq+LSPv775rz6mzoeVa7zuzi51wOky
	vqhyKza2zvsC0qFoHK073n2jnt1zBLGzr+pj6fk+rKUgPwCn7QQhxAoazzfpHEPpcaAMRiZ4o/I
	uKC5ahbk2VQLG3ebS9e56CzUoIiuUDc5B84YBUzzsYcqEEIMg=
X-Received: by 2002:a05:693c:87d5:10b0:379:f7aa:1013 with SMTP id 5a478bee46e88-379f7aa1638mr6773932eec.15.1794764588005;
        Sun, 15 Nov 2026 09:43:08 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:9ac3:b274:12a6:a1c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm28204663eec.28.2026.11.15.09.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:43:07 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c
Date: Sun, 15 Nov 2026 23:12:35 +0530
Message-Id: <20261115174237.48908-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
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

SC7280 LPASS LPI gpio5 can mux EXT_MCLK1_C, but the function slot was
unnamed and the binding did not allow it. Name the slot and allow
ext_mclk1_c in the DT schema.

Changes in v2:
- Add the DT binding as patch 1, as requested by Linus Walleij and
  Konrad Dybcio.
- No functional change to the driver patch.

Suraj Sonawane (2):
  dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add ext_mclk1_c
  pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function

 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml      | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c              | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.34.1

