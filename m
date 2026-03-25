Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BAB3F7E82
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 14:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774449911; cv=none; b=lO3j1gtBTGqhJh1DIh4g9StGPXJVLtLEaGTp1LACFHnFlElqs0SkA+IBMcg9m/mMbR6HuGZ51x0Dxqg+0G7AWX4aHslaJeyqvCff4zmiIOoDUk43g6nL7mnI3/3wUFqbW1ZQ+6fxFO25iSNVicvmSFcK3xmCMlGldj4V9YAkOWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774449911; c=relaxed/simple;
	bh=1+sUisyTJ49gU8OtBjhBTlfurA+6jOUyU8B1CY9c9GY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jJ6kcUU3Wl/8+heq0RhcxCVimz9FdLEz/JCk8o5O1nmEz6mZCdnBRl0yL0HpcnoRdrmFuRDPlBYg80Uuu60LYZHRTBUR1ajAcPRlfUK2NPxIWjYAPQzf9SxC5YlY/r6yodMt6rMcVVTpzLsxphTvZsqLfw5x38oxXNnT8HY6RvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1AO2ZL6; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1AO2ZL6"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35c05d7e0e9so1739477a91.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774449906; x=1775054706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VgK1oXGIFU+z5TbG7yMMSeCHzb44q+Uk133wfccpYEM=;
        b=B1AO2ZL6GUXSmzxTPh+BwES8pRjQIn47Y6oAouHugcBrfAEcXG17tvyMVHVFuEcw3K
         7V19DK/DJ7OfuunE+7YOPVCuJH7WY1xa0AQxKnkWLHH1eVXQANP8awS1W6cMA+bV+2yP
         xRoIlVFszWNuBxUJRa+cHNjN4KWNxePGCdqR+n1RZ15HdtWfTkFgwBcfkVYSY7EOlBGM
         K/70B0wKJ0ZOnILZWlyEaBiR45Lykif0DVI8Jk+qyP/urgm3liucGVS7SWRaLRbxHlzd
         tYMJdbTaECK+DyZbHNypV617W0P+t9xCOY3ZUqfIpHuqiwFUj402PEwrpF/gU8ur8vq5
         BUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774449906; x=1775054706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgK1oXGIFU+z5TbG7yMMSeCHzb44q+Uk133wfccpYEM=;
        b=Vug9WhKRKgiR7HmBaslMfcZdNxl4ARjPaRR7r45JM9hUSxVl3FsqBXUArXIBMeWNYx
         k+SRXQjn2V8LLUMloEudZAI4O0HJVlmVNATZb7M0cu4yY7Tl0JRljTmMFnZatSBv/MjM
         jss+ZNvaXuaKYTkAPjiqoLDd3h3PPoTzYtSoyrNHhhsEEzqrWHF7+MoF8LjxtoYzReZ6
         ZtN4prnHMQxj/Ppr9Ne48HhVoa1DfgTJj50m0E5alxkbzGSVPLq4e6eCJl+23MgHYrSr
         zcsFpGp0mf1Ro9qI63if9h1rXqx9+yJLk8TuD8ENtg7ErSPSHRdzAba+UknIBhew5lSK
         T63Q==
X-Gm-Message-State: AOJu0YwOgdujnVnB2WJ+Qx5vgHn+kq0zeIq26US6Tk+ZdoTEVqDrzgbz
	Q+YDLV7yU/AjfmujJCBrmB8PwMZFNMPWPKO7Xshmku1ciq1lKCHiJDQo
X-Gm-Gg: ATEYQzykRo9PZuxpfmcT8fTMSPWzvJdCR4huhqmLsDY0I6FYAQQXNLNh3qaUfx0qi/e
	HuSqWwU9rMZ+rYsrFzjYb/139xXemifbgXwoXifrsAyaxXbRRBpqKZKRDYiz3/6YpC5wMjOeF69
	WRQDHAINxKIaELp3cIv9Q3zkjBpt3ET9HIQVy3cw19AsJHp4O086EOGFUU+OMPrqp6EvLowNAkw
	uvIf5kllxDPY4XvtvV4dIycPB5DVW1SdAuJ5krTYmMXz9K0iDh0JjxBXrupVakKTyVm8KxhFh/U
	mPzlQXDwHz01er4gEEIZ11xCqOgJmCEOzqe46jbvId4PiYhWJrK0sLQCCJ5uQkEy+l5leN1RmF7
	BWmkfdh5FrdVO4Yp1rnQG77vhrBbrp2UE8+3ZSM7sOX5BwKFW3vagwxCR4yoKZLj4yKvWJnoi2p
	MO8nX2067PiqyWDxsXJcT9Z+cp0Kla5oJ7BmYUAvi+DVpSZ6/Nl9wdNQhWvpot/7jZ9v6sQ0BQ5
	GaxdLQ=
X-Received: by 2002:a17:90a:d605:b0:359:9014:99e7 with SMTP id 98e67ed59e1d1-35c0dd817admr3310324a91.29.1774449906239;
        Wed, 25 Mar 2026 07:45:06 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0dc6287csm1223227a91.2.2026.03.25.07.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:45:05 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH] arm: dts: mediatek: mt6589: Add Arm Generic Timer node
Date: Wed, 25 Mar 2026 23:45:00 +0900
Message-ID: <20260325144500.667385-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Arm Generic Timer node to the MT6589 SoC.
"arm,cpu-registers-not-fw-configured;" is required
because the bootloader does not initialize the Arm Generic Timer.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt6589.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6589.dtsi b/arch/arm/boot/dts/mediatek/mt6589.dtsi
index c6babc8ad2ba..46dea445742b 100644
--- a/arch/arm/boot/dts/mediatek/mt6589.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6589.dtsi
@@ -42,6 +42,17 @@ cpu@3 {
 
 	};
 
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+		clock-frequency = <13000000>;
+		arm,cpu-registers-not-fw-configured;
+	};
+
 	clocks {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.53.0

