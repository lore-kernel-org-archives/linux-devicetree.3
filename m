Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7513331EB4
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742968; cv=none; b=VWHMqBqS6w3LShV6IzFOGZtK/72a+IXmb/bcdB3p8MRFUOBqr2jynTtbjQ8TLO6qoFM8MB83MxmpaCq67nY/PnFtlsj/wlrQSSIuS4oXFM83uOxl/RtgC/7/6k2nqoJS0NW0HcJZol4/3KqahjsNoyc5MlOcF3hE4SaJxl7Ea5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742968; c=relaxed/simple;
	bh=SRq4aV3Vv1KtanwaZu/HUbm5QTW8rISjxiq71Wm2JKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dVbU8e4dcXkOYaHJqzCiWaWVV9Ht9ve7gVhyesW5/7OmA3qf4PaSEn+J3fUfUkKr7m3FgeoHUSbmqwXt7144fjTttY6xRKl4pFCOXW471u73hybQ2revc5m8XNhZHWZErVNbYZjTGDzTjZFkLVcxwAznX52tHaUmBWvtfydSeLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=pDHt2nS3; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="pDHt2nS3"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so2764079f8f.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742965; x=1786347765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
        b=pDHt2nS3+aDXlDddwagM2LlKlUWTgJuO2G5f0IAQLjIbovK6GkwuL337HDiiWlqmJs
         djlEEO9fpJmRlTrYT/iDO85pBgQmBaSskdy88kTwPdjM3vlsVscFIEg9+ReQPZbdv9BI
         Uo30AqfaVPuzJo3TyZ+94ZkmcTbbsDG/lFVWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742965; x=1786347765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
        b=Ss8pkOqMDst8N+shk36RNQCFTOPEYuSKgMAuaMu6xeDZdvdcD9EAzeCvPFbViSXXMT
         0cl6S2nr/kBM8uitITbYctwKZOGKUD6TnQiyD2cstYzjhSrngb0p1lihjQc9RVHa708g
         B8IN+9ojDQIXAHuO6Hh7xwZBedATJ7FccL+RZWJtnJFQ+47IH05LI5WGLO7KowspWTJc
         l6wra5/ePyKEE4X1awpbLUxztkPpzfKCQxiaoE5leGSeqJPDy2PwsgxqBPU8QHk7Vlh0
         74MMNrA9dseBbkDEqgeBZrAg0MCcHsRJXWQcVElNGZk8VsjaqjqDk0HX0iEN8OoQlHgB
         HVZg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+PGU/KFqAN5fmXykk8K7qhw9fjgDWxArbs9xlK2nLFZM3STIKvQ6l6/mDAMsrRxuddoMJqDztUkz/@vger.kernel.org
X-Gm-Message-State: AOJu0YztlemyvuWTBX7cmo+HgISefbx5FZdMwpzvin+MhfXrE4CXyD16
	BFMH6vDcFy6oqySOY1t1kHJ4/WXetE467GQmF4IHpQrtL6l/qnKI34KQm5Py64iRhPM=
X-Gm-Gg: AR+sD10jGjQNoD7ToaiunLZv/P/lbx+ib9ZDpruML/n86IgTJFVzhtzj8Lw+DrslYJT
	qtTrNOy74OWijPqs3RlMqJJulM8tAiLdsSMR1F1c7Sybg7iKgcgQTitstD1pF2MNbbq/W2sTq41
	hT7k2lW1ZS84O3NiVuPPiDqq+X8S692dWDXd3bL2NYirPbSBgpT2cPBpLMIHlHn21cLr5PPLM90
	D2yn/oFjGVAwPNjjuknxAyIcr1RX+cFUhzQEvb1le4qclXVs53VlVmuuMsQl7C6xLaxLJE+l6Vx
	UQkl3Om8bMP15PAu87lGcmgCPsS+PtbMEv79+D/T+ACtUbTAVXdgWiFE6ozyUrnnrQMkwooh41z
	DPecMQ0+3EnMv5BKCXHG79jwZKeElVb5eZNImzT9ZvuymE9hHhOrmYcdJ3ssHJi9APEBKKOz7ko
	+tGZ1UwxY+e0qYhOk/LMM0kDyFHydCoYkS+rHftaWo+GYYkj94uT2XXfyqRwAo93xDn4rYEOzi3
	HYvhOgGBuDmWiw/rd/fmbYVqS3SMqc7crfxrpeWjrP+rA8WHvyBt31yUNMghYFMHdrGVxF5QCta
	y1z7SWCf6jBsHhHchjeFm61251SNz4sNspXW85jQxGzwWun4c7zZM54AUQi6JQ0W
X-Received: by 2002:a05:6000:188f:b0:47f:c62e:9cca with SMTP id ffacd0b85a97d-47fd9cfd167mr21692191f8f.22.1785742965078;
        Mon, 03 Aug 2026 00:42:45 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:42:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 03/16] arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
Date: Mon,  3 Aug 2026 09:25:58 +0200
Message-ID: <20260803074224.3821911-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Added in version 5. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885..ae36d703532c 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1664,6 +1664,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 
-- 
2.43.0

