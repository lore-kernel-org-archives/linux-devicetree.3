Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821003FF1A4
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735812; cv=none; b=IRbLQc2NrxrQNYm6hhEmm95FZIxX8v7FQ0EwLHIHJ2h3k8S6RyOUoPBWPSQUT38p7I22nSoD5NCwIlJStXFSsqyKEmZcSP4Hv6NNbCDAChmwWP2NltaUwym1SL8POc+IkQnf73teLLnvpWgk4YSgVRVRP8dPnrwJuK7/SSYAo5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735812; c=relaxed/simple;
	bh=UbhoOtGLxQ0EEf8erg+sHrzd1q+9MSLWRwQ46sOH3Rg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cC2FGPArsNaSvr6ZmfiR3EVhi5rHtDHEcfEkvSWLC6kR/kloWxAu899elLXc2177+NNXG8fIiMA81QmKgRKbH7iLizT2xBnboOJslBkMmab7NEXv78rxstkXMprOE8whrq2m9Vtbl4xI/vTOCgA4aDa72xhKZAUKx/qwzEKMP3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOojpJAd; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOojpJAd"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c9e89fded0so9704475ad.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782735810; x=1783340610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L6V4gGpbEy0fZNQjjmmHmHR8RvVrPmpP6jHF02hQyRM=;
        b=ZOojpJAdwmtON9GcHedycHwtlKo+f8fepcFsk3A4jBCw6zg2n79hULvMoJjAIgVPlo
         jsh3qvkq8xkUB2J+zI633XaJvrPXKOCFyHxpIU5QJzEHsRos+xf8oMYcjDk/TYA0juCy
         rzyYj6IdZvV8DDQqD/KKeyuu1GASgQDz1GrYl0ks/n1GYmnHb5cdetFZ2qhhOeY1sh+s
         O93OvvkRNGIkU5G7BHPwKrNFVGgDhRviGH+SY63bcEyPEN+jTZl7dJN5foDdonSwu4rd
         5U05UeHTDw18gpB5EPLHNZPEIPuZux0UU0u7apq20zRrWJTqdm32zs/jTQQSaJVHcrck
         FAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735810; x=1783340610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L6V4gGpbEy0fZNQjjmmHmHR8RvVrPmpP6jHF02hQyRM=;
        b=fAAX0Gap7ZEFNvkVEH7m70TKro+BfsvtXhT+9njAnwGw1K5D8enA7arnBta3aO18TK
         t5TMLhwxzzaxdpOvjDnx6hNkIJ0wqCXbH67H5l8Xj2D0QObBQUabApSYlYbW3zip99DZ
         EHZNh6tlUc9Mpyh2BjbMLwN4QtcbtPdweTK1c3ackrOZPykKwwcPabuVHHhxmFI19QRa
         nr2YmDJObkFoIADaIcY8BlOUlN+RIHA1Unbe3pR+JtMPCJhd4xwCX1KWZWMLg+wyzFc3
         Ab48CrdV0o0ulMx9pElSzPB3jDmteYM7ULytLwJ73P7ssrkrObZL7Di8O8gExrF9RjBS
         JjMQ==
X-Gm-Message-State: AOJu0YyzQr3jDAlflAVSTwYR/j1tRSloyr5uLze/jQrvf1VUjrGPSMOA
	TLVbwi9mg1Q8EmLHa8k+LGov6l5oYORj0KEOMfmAhMHtJXv2u/MaxIcc
X-Gm-Gg: AfdE7clqefOm6GvJtSz+mOkis+cTYqlRNNaadQLkM302buLkGy2jz+eJXesc7dpQ2F9
	Dv5ZZOObR6tse1ysdxPWN3tfePfFJzuPFgateY1COjLIdymV2JMBrTvkNBm1PU1+nqIIfMjDl7R
	QZ6sg3LOU0/hGB2FFB0dnKvjFqqPE40NCOP0c2KUXATuiTjZUgqTFry3wPQ1ib332N1ypABg7Sy
	oIpY4r4TDvUEZGxzRtwdaonGM/ZW3Cm7/QUO9OZdznvCXnh7ldHvR2ga2EvKPI+aiGCV1S9jZF9
	RrXJjXVET/UciY4oZPJ1rEO6jVbGZoxZP9/SEENfWjX1SMLXxKimtXortFmalrDAipoqt6k3DEQ
	9zrf18caGeXpHWbR1cImwSiTuBz0XgNxwxW0pCpENuaTPCP0HMRxK2WDmFFVynsGkwn66kS1PLp
	8yK09M9T28nZK+ZUvRVG6JW7urHMMXne4uQRdx4N+W7UGm
X-Received: by 2002:a17:902:ecd1:b0:2c9:fa31:850c with SMTP id d9443c01a7336-2c9fa318680mr27451165ad.39.1782735809679;
        Mon, 29 Jun 2026 05:23:29 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c89d9bdde7sm57104195ad.75.2026.06.29.05.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:23:29 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH] arm: dts: mediatek: mt6589: Fix timer interrupt trigger type
Date: Mon, 29 Jun 2026 21:22:46 +0900
Message-ID: <20260629122246.148696-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MT6589 uses IRQ_TYPE_LEVEL_LOW for arch timer, but I sent a patch using
IRQ_TYPE_LEVEL_HIGH.
The timer worked correctly regardless of whether IRQ_TYPE_LEVEL_LOW or
IRQ_TYPE_LEVEL_HIGH was used in the Device Tree, therefore, there is no
actual impact. However, this is not a correct description of the hardware
so correct it.

Fixes: 2a5d54507c68 ("arm: dts: mediatek: mt6589: Add Arm Generic Timer node")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt6589.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt6589.dtsi b/arch/arm/boot/dts/mediatek/mt6589.dtsi
index 46dea445742b..df3b7bfeac33 100644
--- a/arch/arm/boot/dts/mediatek/mt6589.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6589.dtsi
@@ -45,10 +45,10 @@ cpu@3 {
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupt-parent = <&gic>;
-		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
-			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
-			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
-			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 		clock-frequency = <13000000>;
 		arm,cpu-registers-not-fw-configured;
 	};
-- 
2.54.0

