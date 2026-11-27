Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774802;
	b=oBD2t9SyQDhmL91oD8sefbjzwvG2KyvacUU4aaz1SKOQJ853Mo261ijQi2nS52xrJcE5
	 EEUgHymXlgBfLAhc3SnEeK+rWVxbIy1T+UPDdQ2kw78BRjHt+Em74kEGbXQIgKsr8wcN3
	 TmFLyjrzOgCwM6CWJxjPx5/Nh0bDXwOnTnLnQKdXPMe0w5Zg4seQaiM28gMmSmCqJwFYE
	 G+APjWxnTSBfQuUUewq4ZIBB3GVWNW6jISkrMecqa8Y8sVbP8U9coG6UV+7PKOuXi/Cix
	 W/cS18AMGmBnucvxB7FkpO23dyKFPCJO7QVErdBv/Kd5dYcfgCWw9EbvRh7+ahtLKSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/bHweB9XpIg9EvyhzZ3UJfVy04pQWUV+S2jVq/Gs88c=;
	b=4zIUwG+ddVwkuC7rAC5C5cSqyskOWFo6NTWXpAdg3iPA2DCE0np2HuDX79YIQTMOCG93
	 cub7AYhPO0eyKei+8/FiFSdN7nqSVLxZpDy4g3wXb9eCjPLlIjGIdjXHShP7Rbk2Zr1uu
	 icn5o66CaQiFrXJgxpIFZk1yMjaJ7D7xAwO4g/90mf8WYOzVDjgmrfzRrXITMoXjtmwCA
	 rMHo+4A1sotS4L42xwd3jdP3ntqYVVTT5rFRzHcTlQ1NxROs1pIix52e3R+BsApnTKGSw
	 F07wInQ42fQzq13JduN5UmN4M2tNhAUzEyZxi/s1HIOAahV7BK8znrO8yHTgvLH7vbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YhSuQFZ5;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91C0606A32A
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 10:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D91C0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YhSuQFZ5
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-89ecfdbe443so703190b3a.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 02:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774801; x=1796379601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/bHweB9XpIg9EvyhzZ3UJfVy04pQWUV+S2jVq/Gs88c=;
        b=YhSuQFZ5wL5U02luVQex6Tyq3yiRwcM2RtvzWkbV0juM+6PjzAZAaWUzUqYVxuszq5
         3859mEm8DyZgbOd8DeOxjGzRqMsyjUIWIigE61bp8+FSuw+7lJp2WuproO7gLQZNcQp7
         PjKnK32nk3F2PRPSQI1RJ+mqWJgcGYFYn//SaZhGl9k3lNvPIb2xjOO6rfxm53Ib/i1l
         iqaZGstNFh6QXQ9PqcyPhDD8NkjNEPx3IKXTJTzloh971Ic4qVWnZngk9AC1Ar/NiFc4
         88M7DB7pbqkkOdqk2YEwDZnIHGNh00SMfkQUWFeAO4u5DtmF2Cmo94CZMj8THvXkNgeS
         yx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774801; x=1796379601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/bHweB9XpIg9EvyhzZ3UJfVy04pQWUV+S2jVq/Gs88c=;
        b=yfSpSAs805Uw3/lRrqXxT4J+hIsIL0xenWCL63d9HmI1LnZ30nkpthqwX1QG/JA3Lp
         GFllv5y6o/TXS1BmBBFe8KZ11cPKNirdTWfk3SjC+kL/8sq/kTGSHZQnfSpH5xDY95lB
         wflGwJALQVPzVJWJ/i0wpROcaTMkkJ06YHLFiTyFcJWwdA7wgfWoqaXXjkkE2yI0nBsO
         nF9gyAqHp79NyeKqu4SLulpLpDZK8t+i167IqTYR+5vRGVa4S7hWF9XjXS4HLtS++LJr
         +tCexbE3S07EbK7LqwvdU2JgcobZqADWMk9eu4KxRvD5nYx99K2ZerknyMiCMsL9IyRI
         Cgaw==
X-Gm-Message-State: APuU4Z/MYkrOMqVNHy0ND0uh9PZZ77SI4oGybR3B4EwEEYjOGm++skG1
	vxefFGLnybbSBdNyMB/FI/Dd+XeWR+R3c7aM7mlL4PG+1KOE4fwGDVdQBJJRoA==
X-Gm-Gg: AZFdTZeidzjiF7m8+JFJNjkSyk/jWh2BRZxoTvtm+F+PVp1MDj84GhoNrH8U7nd6EVF
	ohmLybOurnYl3DyDHLw3It7iZDj0XlnrnlMbFoSoEMRnMxRCKVFMUiPQyHdQtILIFA6/1+kQmBZ
	5RYIggONcvcIp1jhzPB59jG7QyoLvCgjIN0GPXucbzLz61sgAb36twj3tImUjLnLX09IELKpa1N
	d+9tuBUf+L5gj4UIPp4oZJaI66RLM0qOJ3Z6mhWT8lcjXklk+JSp5569V0VQRndElMPS/8Oc8V1
	xWvQ1X0p/ejcG8bMho/qDr1Fi2IvCvoLC4p16XiIAB99z4/M1xtoLAXNeMxoTfUwjAHZ/weMbiK
	mwzV44q07q2LzXWyZAL6jfz1JisUnVnyOqy4QFgszy7Pbv6LhuW/EgRob3elYHMomrO6uu0yZUL
	XWQXfWTwA3cn1JWAdJrndNF7bUkoC+RRk4wdT0F/o0D2W34ZCmqxYXJFCCFSFjKjhfZlec8NRDs
	dzHpYOpJVcWy/bvCVPRL/Sui0NuJo++5eKHFuJMze12A32u4KwumUWD4i+ZqtTALLMBL+wOhwRq
	L/txAruU3L+B2kl4OFk4pusN8MwiKlLVYXSYSvL21ERTnU1QCeVFKQ==
X-Received: by 2002:a17:902:eccf:b0:2e9:9263:a58 with SMTP id d9443c01a7336-2f03f0c2295mr388038615ad.1.1795774801250;
        Fri, 27 Nov 2026 02:20:01 -0800 (PST)
Received: from localhost.localdomain ([240e:36d:b08:5b40::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm107807105ad.39.2026.11.27.02.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:20:00 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: devicetree@vger.kernel.org
Cc: Jianhua Lu <lujianhua000@gmail.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm8250-xiaomi-elish: Distinguish display panel variants
Date: Fri, 27 Nov 2026 18:19:20 +0800
Message-ID: <20261127101942.3215633-3-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127101942.3215633-1-liujianfeng1994@gmail.com>
References: <20261127101942.3215633-1-liujianfeng1994@gmail.com>
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

The BOE and CSOT variants of the Xiaomi Mi Pad 5 Pro have separate device
trees, but both advertise the same root compatible list. Firmware using
that list to select a DTB, such as Stubble, cannot distinguish them and
may select the device tree for the wrong panel.

Prepend a panel-specific board compatible to each variant's root node.
Retain xiaomi,elish and qcom,sm8250 as fallbacks for existing users of the
generic board and SoC compatibles.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>

---

Changes in v2:
- Use sm8250-xiaomi-elish in the commit subject, as requested by
  Jianhua Lu.

 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts  | 2 +-
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
index de6101ddebe7d..4838f3950124c 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "Xiaomi Mi Pad 5 Pro (BOE)";
-	compatible = "xiaomi,elish", "qcom,sm8250";
+	compatible = "xiaomi,elish-boe", "xiaomi,elish", "qcom,sm8250";
 };
 
 &display_panel {
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts
index 4cffe9c703df8..0ad0a76ee9d04 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "Xiaomi Mi Pad 5 Pro (CSOT)";
-	compatible = "xiaomi,elish", "qcom,sm8250";
+	compatible = "xiaomi,elish-csot", "xiaomi,elish", "qcom,sm8250";
 };
 
 &display_panel {
-- 
2.47.3

