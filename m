Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5A53EDE60
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811605; cv=none; b=Rxk0YfR22mlSoVZNSYwRuYQgsfsHAghLOxGffFtP9bLzwENr6A1mg906D2xEMHa6I4lLvXgtC8bgMgPT9wTu1O8gJWZ+fWYplFfYleDThTrKyOA7gBxs82R7cTt2GEP0Oq8rQy3nSRmC6BDQmErSwFmePsHL2XQ/2m9mbHBDmso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811605; c=relaxed/simple;
	bh=SRq4aV3Vv1KtanwaZu/HUbm5QTW8rISjxiq71Wm2JKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFt2StxUYT2+a8gH+2t6wNCM+OxZqJRKdVvwsfe/sx8Te0GzAz95S3z23HP0L4lb6qaE0RC4GphZmmbRwjpgXN+ZKhCCO2Ty3MQZ8bWgLoj3POaUQoB1/nzTbFinAKT/xfQdGQvwegcLu5tTBq1uM07fTU4F8zW7LXpnshfNehU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=l97uTEEw; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="l97uTEEw"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4631679f204so239103f8f.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811602; x=1783416402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
        b=l97uTEEw3jucOO3cAwyBEqTyjzDQzwKK3eVqWMvYJ/y7LHHWHes6PhM5eInh9f8uUj
         RpnvIfYmhW4t6RL/FMtWbpXyZrOAW9LWjQ6BriN3TdN7FRra+jIAuxKb9ZI/4t8P9mA5
         u9IFJa0p6mW8BkN9V6wRXDHdXSvIdCUw2sNx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811602; x=1783416402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
        b=QunMqrSaRyE9zYLgVt98QxmbUC3xw6aIXWj13DsOpYChJXhMTgbpRswM5l6m9a47zv
         XR/9cgqxYQjl1IGE5RxkUA1LRlEdMK9Hb6OJ19Z6scUOKUMQ4AksQ11WYwm0SehpQ9NX
         SZG/b6pjJy/1dufjRbej1oQY9RGYNPbF8lEseAMO2p/LBu3cUyHdb7DSBHHHZwgm0sVp
         8a2Vblof9B0qU6vu7wtZeAsRmm9byH8bUsvipW58pdVfQ55mOsKetULRHMhy7GfF+qwE
         HnKFFAfttUsWBLJvc/GQ5JGvGBP46G8zPMUTUcYKJWYPd2kkYwSeS5ckhq9mpukacpiF
         ZRww==
X-Forwarded-Encrypted: i=1; AHgh+RoAJ2sH0CRaaxiz4dDH6cAWKk9B52KY10M3A40XA9gZDkYTmSiUAqe+ozQ+Av+k0VFvQHndu6/23IzL@vger.kernel.org
X-Gm-Message-State: AOJu0YzuxFYOsaiMHKX2GQOLe/PVRm6Y58NiXvG1tbNqSxIS0mapkR9m
	coMo03VxNLrNtmfpEoRF5MWvWMoRYojh30ApRR0nr/LoseCoXe6JuV2uDhA0ejdT4Co=
X-Gm-Gg: AfdE7cmWpv/84Y4ojQZS63BFeILCM9Utjic7Y+g/CLNu47nbweC5hwD5UnC0DUjRcsW
	0AK/KFgrfxTaD1nQpuKPf3eqj/FzGYxuy99xtjz+PHQg7p9WV/ShJnoZp1aPlISiAfz2zMxhgKC
	Cu4Hvbx5VQSdtZYGyq/RRSpXyhh0eyXHR7f5yZGqksTpvduVY+Dk73ZT/tyXdpg+Pw/VAimXwDY
	VMWdvqFHm6Igj9qpRwFhDFMnY5tCyzyrGZbL+VJnoGh3yTvtNuPNaF5dfQhMzzcrzCrWwIu5Ehy
	0D76w7NqO+b/8WPwt7Bikb0Ju6j0oxbbY/XaZnaT2aojeohkfQYrJQwnt8fPWWpWi7a/BSif/XK
	O4WB4i3direQRdtZfQwfugnyuYE9BrAGJdPoVz0pMaKktbF9HtW0lYSKJxJT41Yj2JyMiSGuduv
	H8QoLIqIfwnEr0pblP9PEZflttVcIYlXQFvuhbY889CjdivOEVlArB1KG9KEO/muse6GE7gKaGI
	+shOpYCrplf6OKsyaYk7P2bzOrjreCqfhv2QDjOreDtDvyo8q14tAm04AmT1oYgrKZIz7q2X7er
	09+KYDX0Cd5xxQ==
X-Received: by 2002:a05:6000:24ca:b0:475:f0c2:75af with SMTP id ffacd0b85a97d-475f7344337mr1343805f8f.26.1782811601977;
        Tue, 30 Jun 2026 02:26:41 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:41 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 03/16] arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
Date: Tue, 30 Jun 2026 11:24:32 +0200
Message-ID: <20260630092628.1695560-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
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

