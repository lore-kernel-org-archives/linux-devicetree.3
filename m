Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B29D3DA7D0
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179990; cv=none; b=HszR2YEsuQUxMUo2fhlwHn9MDpzFS36ke+6f97YsPr5Rbc4OIELfHJuDGBR2QZujS/C0aBHjMh8cuQHfyYPs4qoEllWQA4MgCZ7sWJO7wXzrx6oNeWjYzGf9M/pJFFQOSgFLxtd+DqUXQL9kyAyZu6UkRi7h58CgcZH3y52ut6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179990; c=relaxed/simple;
	bh=CJDci3kCWF5oWJGaDDgQWfq3fOzgIhglmVIAqT8r+mk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hnJ1hMv9blCcuQI6hvnCwLC8+SuidON6Eh+7xzymBx+VmhFqijG4mT/HIERbRGWwBXU7opEYI0MMCI4V7e73qlYt8bNJiEUCgjBZb7NyQVgZdssFEaB+KkJXs2SK9kgzXAQBfmIZ2OpXqeONcAvoQ+muSsPqj4z/bE2VVc4/8rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hndoyb6F; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hndoyb6F"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45e7c636e74so1347387f8f.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779179988; x=1779784788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hRuibsHH1d7GyXfjAXknzKcztEOx8udVevL3jmrUcbo=;
        b=Hndoyb6F518U2JJVH/g+VYGotNKiB6lrWBzGlRdldeGTlrw610rp5HavDpcAFl/l5J
         Ir9DhCNzH2V5d5OZeYJZyvDkbkMY9Udz+ACtvDMIqwpf1jr8a8o9Luj3TnwTZodoTD07
         eCBlzx9oLsEh06ip558kwTnf5ocEgrG5Q7RgbBQEQ7MofO99e/7mfou4QCd/UJz6d2Gi
         h6AZKEm0fj13MQ77gmcZFBCZEkRfsMmRVoHfBWMiqpoblkVkr9c186PnyP7a4NAkr9v5
         URnQYEQtFYcF48RWp4EbTsIBIWMGJnUd8ZvgrSaz4VTRuEAEbDwRqb7Et5XucOyDYX9S
         EhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779179988; x=1779784788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRuibsHH1d7GyXfjAXknzKcztEOx8udVevL3jmrUcbo=;
        b=bKn60K7q661+F9Bc9WSIA4c6F1b1T6cd8SaKxFwhN6CbNe7Uh5SMC6SGw+SnqH58qy
         xo6BgEp/c7eEzShhie2kIfbln35Yyw5LdqpLfS2z5pmhFFo/zugC4+oDok+oPjz9jlZF
         1cCqB/npmzQmXmBvWJxSmuuhRld6+jw7p8DK20sI0BxYBX85MaeMiAtaouI7QuW5RBwZ
         ysjO86ZM1TK2S5F9VzZzsO0uTq2i7E4XkDY5zqyU4aUwBpT9UAnRUKaNBCQHnPMTGKJC
         BjMnjMdcpTl+UGTyOlfyHcNfVM3MD+ZF0RtG2zkZCqyRbX7DjpRLlLsV++/16kLcrSny
         Tuqw==
X-Forwarded-Encrypted: i=1; AFNElJ/K44CC3xz0avGsPOnxa8naKZGtHEXdqdfH9ARNIoXmJbM4v6kMOLyzMdfZj9e6T30Zdbl04btp6DVL@vger.kernel.org
X-Gm-Message-State: AOJu0YzamUfaGFPy3OUV57wJj2VnU5ublaOWaITcuiU6ZGI/w2TfG3x3
	8F7cdlIJOkoDUOOXjxVyc3kK+aYhaKazlj9aoP8ZucrXXiJY7gPi11Vs
X-Gm-Gg: Acq92OHRjXX+d8iRBzaGuRYN2ObYq36w44NEgoxV8WtCXum5EVTxZ7ESm9uxZcB99I9
	Mn/Bm2hD5quUUON/8k7dch1PkWnUKy71XJ9TBgIcGjYd2inseop9jGwIApqAfmqI3dYnsHYWePP
	2dWAhA2nU6XLblIK+ma/8O/IekFbsKra8vs/R0dXpbrqQEGLoA451WgCxvseJ/MOiLtC0eKFcqC
	vlbYAKdHZTYmX1+qe+DjqfWTt6kCcJERVT4fLqgKbyZ75MvChvxWdJhwaSBIUjP4agD/78kLRFO
	Wl2xmjFk18/n7Pv5LOSd1VVy2JsXG2npT5hBDlx9seIhNWM8oTTZyY+VkjrF+pFwShHWJGfU5Qy
	35yizMdGtI9LeqqYdINEFigeJC2D400YhAz2C8hAu5WGdBYYxffW6GO3JGdF/YYEHbsdVAvC9SF
	08nRNkLwzGHAQk/bCgQPo=
X-Received: by 2002:a05:6000:400f:b0:448:8db5:410b with SMTP id ffacd0b85a97d-45e5c5e3064mr30844672f8f.20.1779179987735;
        Tue, 19 May 2026 01:39:47 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767d0bsm42061177f8f.3.2026.05.19.01.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:39:47 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt8516: remove cpu3 armpll clock-name
Date: Tue, 19 May 2026 09:39:05 +0100
Message-ID: <20260519083921.5023-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The armpll clock in cpu3 clock-names property comes from MediaTek sources,
but it's unused in the kernel and not populated in the clocks property.
Let's remove it and align the node with other cpu nodes of the same SoC.

Fixes: 5236347bde42 ("arm64: dts: mediatek: add dtsi for MT8516")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index 42712ac2b88d..21882ac4fadb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -99,7 +99,7 @@ cpu3: cpu@3 {
 				<&CPU_SLEEP_0_0 &CPU_SLEEP_0_0 &CPU_SLEEP_0_0>;
 			clocks = <&infracfg CLK_IFR_MUX1_SEL>,
 				 <&topckgen CLK_TOP_MAINPLL_D2>;
-			clock-names = "cpu", "intermediate", "armpll";
+			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 		};
-- 
2.43.0

