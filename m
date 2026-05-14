Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DFE3D170E
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778741107; cv=none; b=JV2a/3NUsiT2Tazv4tSD3v/nFdUz731dyB0yu7xzyXqIWyel+MVEycM+hgSAoK9go6Qu5nSCa/mDHrxgvA1KL98C64j/tPe4/vie0Svh6gLrnV2cZKJO27ebSE7iBOsLfZ6/juyFyaprP/na5+2Gt9mNx/zNOxdtQZ0YVOOECao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778741107; c=relaxed/simple;
	bh=akD7B8qHkM/QVOT7Clxj7QGOt2N/MAuvm0wj1PPKeoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ked4xo3NVtteiURzm++ZvOhNfRp2pgf7eMj3MYa/9FFJFYLDZcA2+S4q7B5vXC4cqEuqIP3nzCVvnrH0Zc/4LWEjq3BpWVd0k9iogfWO89euHLCQARnb4zyqsu4gbpsE6nq3I7H60JDMtIO9x4O+Zo3/5yF0ik5f5qD6r/2KIXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pcc.me.uk; spf=pass smtp.mailfrom=pcc.me.uk; dkim=pass (2048-bit key) header.d=pcc-me-uk.20251104.gappssmtp.com header.i=@pcc-me-uk.20251104.gappssmtp.com header.b=kIqOyY3W; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pcc.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pcc.me.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pcc-me-uk.20251104.gappssmtp.com header.i=@pcc-me-uk.20251104.gappssmtp.com header.b="kIqOyY3W"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c156c4a9efso10495798eec.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 23:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pcc-me-uk.20251104.gappssmtp.com; s=20251104; t=1778741105; x=1779345905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w02SH6PIRFOFu6YnjfK7owcWnXxBUkNw8szwIzUQj54=;
        b=kIqOyY3WnC9iZedUrYMUTWt2wSoQ9C4HrXH8z4iBhNdsQEpismXCzaGMxWNL/5q/S0
         5Bt9E+lPsx4el00UuMRY826oaW8Hqkx2VjubMC2eB/EbUaIWN9sms0DbIJxhKFw3KK3B
         yjLBjuqTpbWZ/hUURTubh+2xfHFcJrmgfUz5pmdI0Zxo5aPMZyjVS8PRlB2Ouoy7FnDo
         oBEDc/DETVlT7hkogO5UQ7LtQdAs8FF0i2yeyaQT1zBGK8UPAKBXRDJygmhM+2W9gpdM
         Hb5qIq2Z8thhywKYuNoiBPhA1nk8B9m6c7IsfrE8uuFmu+Xn1eoaFnNE3SNJouw4781Q
         JZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778741105; x=1779345905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w02SH6PIRFOFu6YnjfK7owcWnXxBUkNw8szwIzUQj54=;
        b=gj9iGi6eCehIUzHz0qKZJXzJeJjm6OMfHuOoOuszpQckhreXEXfHMwv+5HAeBZHLb/
         EIXlKZgZEN8rpmWIC5FSGVh1/Hl2YorhH2xoHVnEACx62BddKy4sL0x1tDdNl+aPpuC7
         YrUAdR+U+ylZ/1jOovj65MLAyGb36e2zaTe4pAIYblGMLgXzne/cJLQ++WVrs3xoLXWY
         EH58UA0hzN1gWyhZrIDPElWYu9DrGlfZdxZ7SVqW9axFtQhtyPbk73B+xTVZjJTUMf6p
         TUq9YnQ4SuI1ugfMEHKKkcXLfNtsWysdsS0zGPwpTQVHuRiCclGNfbRSivO9ymy1AFND
         LbgA==
X-Forwarded-Encrypted: i=1; AFNElJ+eCCJf4dZqTCAmT0tL/JpWy5ktMFB8Od95EqAGucnAhMkjOa5uLFXghpkbAbIwdgcAzcKehsdct9tV@vger.kernel.org
X-Gm-Message-State: AOJu0YzgslfmjQ7sMLXiSpZkBV5YZHRMeQZvy6lDTSzzz2B1P1br1695
	6ghYQc46XyFtRR4R3WAnhSWdi58e/5WTORbO/PfHJvIO/dW9LCvyrkitSC8+NMtR5n8=
X-Gm-Gg: Acq92OHJRlnlDfpGb/BZ6YpI9xr7FhMS7bZVu7OT9fYHvu/nh2OqyjlteSEaEf8sdqF
	HSgRod4X/qD1KL5Pk0K4kpLtmCqkTP8p0jHZGzKvOcC5PUvw+E/SH0lC1OsWfNw8IuxatYMWJeu
	eigZmR42gotj+2pcCEV9COGuNtuqNTfYuY096GAsu90A9eeupb62qbihrutvXsFyeLYOEkdqfG+
	ZdY0+idm2u6t7Txa1NBXrqOoKrP2M1CIk6C0NTJ4qrrUWot2M6Qf0gXysdEDmcYDynyCEAHPuXq
	PJSXPbeI5BdYpSLpCnf6pe/DLFTEOHA/hLWd+KsImuHmPXR0jWpi6HdyGklJs7KM0RlyUJEF8GW
	vikAy23TtGb1QcaRgNhqfU5FZDHqLZumMbk4stOgwWQSgKE4fahCrwwJwhQB6ACNwHd2fxKBf7N
	uhCPmnf8QiofUA94sch8GMIVWuMUbB+WZxo1n1fKUqFQ2Vo8FwIjYQww8=
X-Received: by 2002:a05:7301:3d0f:b0:2e6:ffa8:ef85 with SMTP id 5a478bee46e88-301512632c6mr3381953eec.0.1778741104665;
        Wed, 13 May 2026 23:45:04 -0700 (PDT)
Received: from localhost (c-67-180-161-137.hsd1.ca.comcast.net. [67.180.161.137])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-302973bc8ddsm1807663eec.21.2026.05.13.23.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 23:45:03 -0700 (PDT)
From: Peter Collingbourne <peter@pcc.me.uk>
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Peter Collingbourne <peter@pcc.me.uk>
Subject: [PATCH v2] arm64: dts: mediatek: mt7981b: Add PMU
Date: Wed, 13 May 2026 23:44:45 -0700
Message-ID: <20260514064445.83487-1-peter@pcc.me.uk>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt number was taken from a downstream DTS of the similar MT7987
[1] and verified on my OpenWrt One.

Signed-off-by: Peter Collingbourne <peter@pcc.me.uk>
Link: [1] https://github.com/openwrt/openwrt/blob/e4b3d5c799aef3be20b7f6079e8e5a14b215c116/target/linux/mediatek/dts/mt7987.dtsi#L246
---
v2:
* Remove interrupt-parent

 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 1bbe219380f9..ba6720031908 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -38,6 +38,11 @@ oscillator-40m {
 		#clock-cells = <0>;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
-- 
2.54.0

