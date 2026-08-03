Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99E0322B9F
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785743682; cv=none; b=tJADoJAEJ9OF7VDlUBdGEtDJvyVwsYdBlJ0xqjs1bRtHjDw42Gr01mc5BZ5rIZJoJetceKHr7TYV4galzDgLNBZsUnoL9qRPD1ocO6YZhCu7vw846e5tfNGW8S3BUUb4aCFzGxmMSupbNeOtFh+Qv586bD7v4o6bTMyDEpo7mk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785743682; c=relaxed/simple;
	bh=ezjD7loiKfXAvzmAHhknu1TF/4jOQzEoXAq4xDAVLOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GBRpsgYnnzO2qIkndTSsVJxXNxSy3wIqr//OK5ncww6eKXziDr9EJ7/GnGu5AHTIjaP9/5ZihaNEnIn4GxQP3Cky4YNrK2n9IuEO+vRE0LRyqzHCdtkoqqZM5HA6xpjjlZ1C7l4BVe+cYlO9Fyjcg8h2FyfItC3o+ZHfrUTwEMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=MhzXdyOC; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="MhzXdyOC"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49557167508so15940875e9.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785743678; x=1786348478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPAaM7bTeu4n3UtyHqOaSRMG+n5s4+9FMWyYRge6VfY=;
        b=MhzXdyOCB71USowHCRxwzRl+ttOG8dnNCNad1C5RxlCe/Q2azr9WHdw2CWPpiNXDjA
         H1iRxc1hZFl5559sz0ULgfYeq9jy2LoGtf8OSrkrkbTdDMNoJ3/XRFQRkSUDa+mUgww7
         xPFUVgyJX9gSYzWEpdkQvnkctSe13r9fVNV2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785743678; x=1786348478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPAaM7bTeu4n3UtyHqOaSRMG+n5s4+9FMWyYRge6VfY=;
        b=AqOu0KXp9dgghz/qkVAl3JF9DCWVThJqjek69AiSNbdndUXlfkqMxkSOgiyjp6BocI
         5shNgHIiUfDU5cqWdglSlZRntOulA2DhLC56kC5W0RKxd3U5oTo64chXgfLG/sndRR6o
         EFZxP2NwMJ4DW+/4B6dJMeguELaVM0QmlmcOKa6MUUdkr1+kaivvfkwCVggSo3ek//xQ
         4O6qsmEq4xNwAwXMz7xnyZEwYA/iSddAA89/4gnZ7W4cM+Ccg5y3jBDbpMNNTvTZpLib
         f5/Rwv/igkVv7UiBzSt+fKGr14XUAxzcdLilRtSuFedvdbCO1eKyAIAIoyB8tm6Mt/zc
         bC5w==
X-Forwarded-Encrypted: i=1; AHgh+RrNuE/aH3X+P33eZ22DxBrhyRp3UPDSD6NJywYCCHBF/8dupp9tKqzg42y7lBN4tc/AjOPYMkYvS9fr@vger.kernel.org
X-Gm-Message-State: AOJu0YzpjPknhhZ/k0x6wAyQCsi+dn+qTuxiWcQ1iYwtffzlKx8x7zEX
	jo2RFIwH8RwAM6c7lOIDZvMcvpVhyhoZ2QFPxO4Ap/DMq6xHC7E/UlXn0SVPfCrijEg=
X-Gm-Gg: AR+sD12E8sgbavCJ3P3Be/nRQ5qRLneB+tm6np1zDm7EilDCttm29XPeLp9TFkdF874
	LXA+4d/Pvp/64YFNAy7fMRXUjqzbbr35zbyvhcOJ2pWWcG9wdVs0jIuZoSkkc//U6RdtUBCERYK
	b49p4gr193rXom9l+PDou9vRRnnziu5hNBcPg1dLraPQtzL6Q/yzINnooO7dBeQgcsTPJJMtp/Y
	pnYEgo1WKf97DAi1yGBaTR+Mbw4jdxLS6ciPuV4fRW6Oq5fAjuT5NYqhtF1wJFIt2S+EQX+MVPS
	WOqgNmilemd0mTjP/Ustw/SVpiUKRHKtnsTs/TswsBo9BDlxmL8Z+NpgnYe068eTl+tdEwz/Ht9
	J4dOvSI5fdlLkh0Yz77XmKgj2EC8IfUT6n2p5kApqeKhVHi3ewyKvav8+FlGy22MC67tAuQR5Qr
	IuFMSN9j62181mnz50CmAKs2GNmDgTuqPakdEvD4abrTtwXkcWBiqlRrPe/lUg3GrZrKh6C81OQ
	MWmzsfTeQu3BgbehuOuWT6MZ4gN137mbT4x+b5YYtNy1Twi651Vmfztux8Rox5M4f/+L6E70XrX
	+eMxdRVS6Lb1JT7YZ841CJ1csQ2MxTrp/Ccr01gVwzgP/nb2hp8OQUyctpfyVkpy8lUNIYFvbpU
	=
X-Received: by 2002:a05:600c:5914:b0:495:5cda:52ec with SMTP id 5b1f17b1804b1-4980c662d03mr165261255e9.16.1785743678048;
        Mon, 03 Aug 2026 00:54:38 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm29411990f8f.34.2026.08.03.00.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:54:37 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH 1/3] ARM: dts: stm32: add missed arm,num-irq-priority-bits for stm32f429
Date: Mon,  3 Aug 2026 09:54:26 +0200
Message-ID: <20260803075435.3825122-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missed arm,num-irq-priority-bits to fix below CHECK_DTBS warning:

arch/arm/boot/dts/st/stm32f429-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32f429.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f429.dtsi b/arch/arm/boot/dts/st/stm32f429.dtsi
index ad91b74ddd0d..f94500cd90cc 100644
--- a/arch/arm/boot/dts/st/stm32f429.dtsi
+++ b/arch/arm/boot/dts/st/stm32f429.dtsi
@@ -794,6 +794,10 @@ rng: rng@50060800 {
 	};
 };
 
+&nvic {
+	arm,num-irq-priority-bits = <4>;
+};
+
 &systick {
 	clocks = <&rcc 1 SYSTICK>;
 	status = "okay";
---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
branch: stm32-nvic-irq-priority-bits

-- 
2.43.0

