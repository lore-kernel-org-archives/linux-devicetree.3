Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE59D412283
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 08:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981487; cv=none; b=M2y2CwVCMLT8qppSFKk3C46U8PljI51GAKLJ7w0j6u5XpagTmTjMdSJSk5OnioDWp1Ra8zvwb2VoLIc7J5yX2bDdg9Cj5jJTB39TOYyCg/O11m2Jel9YdXLnF0E2VVaYYbsvCmzMSxFNItAORIYpaQGRUTtNCtsmHJbA5K21SJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981487; c=relaxed/simple;
	bh=RNtI2/jRUlabJQ8lhN3oHnmlaSKKIRopicBAyQw1MjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NYrDvxLQK2CWfOsGv9IV2fEqAOl/yYw83p53rUT2vDYW/BJtmZyUfZg/ZLhw2nCu4yvANqvs0bRNfchl1PjzVS/QMRaZ8cJbV+bToHJS0Tkg/ky52wFYqPTYlyXxYKHfcTQgw57UO7WRwGYsF7EYkP9Q0/n4GjKyob7arowDQNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WTGp57Ui; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WTGp57Ui"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8475eca3a66so1674206b3a.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 01:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782981485; x=1783586285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g5kQpHF1ScJKcmqA356iXRPEORmUpwJQqKtBuIMk5xw=;
        b=WTGp57UiKbonYhb9+nEEBede9PnaqPHtN3jDkQ1jPeWmfR5Kr+F3uMCNn/SNDmBPD4
         V+QYhoPRGwkV/a+s74YSVSnZadotnxPHg/CNLTJUGu/HyDfE9YQJv1qf08jhOh9pIgpa
         /TvrWby2vnVBpnxNC+urI89l5xrtc4f6nTVnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981485; x=1783586285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5kQpHF1ScJKcmqA356iXRPEORmUpwJQqKtBuIMk5xw=;
        b=gW0CHQbJwbgTW/UplhggoKyRhQ1TE8BF7hi0YgRl6WRoNjIST8EvSozDFOJ6CMQQ2o
         FnxjRfBY2BaH4kOijKsl5FT8ufLknZetX555vOKDzcYCBI7l5hdGO3rVxpkaXwoELCQB
         GSSpUoGacNCQgJ5HSomwvJnStJVbe2kmmyCYPUCqirk2Qh3kflvsmGIPaUaZLmyuakCh
         23wmMuBUHJLhZucTtPQTInsVjIqQ+tS8B+xYUqc1wCzG0x9hcgMN98qaxZX/fgUT5Q8B
         PQ2Hr3Z0KXAzlOhuru99rN2CWmGg/RebFWN9Tw4Q2tBOw72y4dLdrSlsoapxuSu7W/w+
         9Ivw==
X-Forwarded-Encrypted: i=1; AHgh+RrRA28cak1BqN/SgoeNp50Oa4OPE3X+T43UG3oLWrjw33sREem5dJf8HOSeWo3UQyjwgwhr9oiLduFv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7NxQDfNsYpExyeU/71R9ds7k+MbcTwjl75mhMZ/feGHV3bqGX
	mA3tpGbsHfV3qb9E8EC1mTGzJFADfPxegzdYUfBCqPrPhjIPROc+nUBWvrAtWRI4Pg==
X-Gm-Gg: AfdE7cmMmTg12WYpvP+nlu8kUFaO0pjTpcQ1MThb0nJtqqxq3j8DFZi+bk1H51MM3tb
	9c5gskjFD7sU4VpJqUCLcL1FQJsbaVInNWnXTvJXkfoVNel8vqtddEaT5H6ZaGYWwQoGeFuOebv
	qielMy8sLZYS4niiOvDiJJTlQTKoTvCWZob7KrRHWfxlS8hqbghc3xLqPSOIN90IkHLbBjIrBw7
	RqWtZND3PnNyosrqcHNSCKng6AxSw8ijzQVnfckZsM+nEapW/sJ1XISErHVrwCCU3fD0f1kQPDd
	UgO8RfcpNHbNYhp09Pl1JPtX7hkvmZgSyfCTeNBZTSgkkCwV7PGQrqBZQbpZ4VdzP1KRqrO5Toh
	ogV/CJKw60KFy0GW8MWhFJCfi8Yxg9LK2NN1Q7N8RcKF8Z/6oJ5kguDvF1N5KQGvdshlsLl5/Rb
	MAj7r8yRh7hraSQxQQXEIWVrLD/1d2L+iYnmLFAzhakqTos2f13NG0Et8QWAZATi37KvX9kw==
X-Received: by 2002:a05:6a00:9298:b0:845:cd11:37e8 with SMTP id d2e1a72fcca58-847c5034e00mr4105619b3a.24.1782981484770;
        Thu, 02 Jul 2026 01:38:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7869:7870:7da3:7288])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb6dc1afsm1045521b3a.6.2026.07.02.01.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:38:04 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8188-geralt: Add supply for SPI NOR flash
Date: Thu,  2 Jul 2026 16:37:58 +0800
Message-ID: <20260702083800.578581-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SPI NOR flash is powered the "always on" 1.8V LDO regulated power
rail.

Add the supply for the SPI NOR flash.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 4cb23595d17b..f382f90c48f5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -645,6 +645,7 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <52000000>;
+		vcc-supply = <&pp1800_ldo_z1>;
 	};
 };
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog

