Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2513E49E6
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 20:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784838230; cv=none; b=ockZug8sVrMjQjhNpxU74oteeAr1pbpKcGDIPm9zaaRnT0BdYWi/Qoch63uMaPj34Vzp9ioyEnt6NgEMVjc7pbSOf+9Hh/iivWZlVOgSwWgrD0X+nS7uwKoz9rvSXToQ7Z7rUbz9UmE923MAGvHd+4SExZdAZlSaz/vNTT3fZ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784838230; c=relaxed/simple;
	bh=M25zQVwRpGXEWMp6rVIQ3MolJpmQWYab/j+2pTvZPxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dT0vHbXGSR5GjeZxDMhA5wjnBJUlZEA68gqNxYM5NT/1qUTrqWX9NC91Cj+EyDf8rozjz+zwjlfM4lmX9Il0gjqGJVAZ2zV/cJTthNIwdV3feJEUqJZg16lyqFPDK3Rs775c2ycPECBAc4/NF3EIkovnLgpJNepRA23V2ygCcmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=MsbiljZt; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="MsbiljZt"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so494723f8f.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784838226; x=1785443026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bsRp+ajnq60cOIr9z3y3rvK7i49Z/Q7M7NmV1U7G5E=;
        b=MsbiljZtR7lj8kFyqyYTmQ7q11umdI9R9neaUWGztpTzahgcWCMIGHifOix9cXiKHs
         QquRdc/oQ1v1d5WPq1gzKV87K2JMbMWFtP66HvGZjEoypR8cNTXYWRwf6cNXw0OMIgJF
         77Jjo9TozNI1f8qKP0ENVC69FByfxE1UdxRoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784838226; x=1785443026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6bsRp+ajnq60cOIr9z3y3rvK7i49Z/Q7M7NmV1U7G5E=;
        b=O2xbyDndtWwTkKcAnQHMSePSuzScAQ9NukC8HBZwQkUXVSyxe1lyypjJRkfvLIMBjs
         t0dBpAy5iJUAWl3sUZ1WRCMWSdgHLHAypNW9vYjVcyN+x2FSlYbPgaMZz8BYqhOyZUGu
         osu8GquhO2TbzUPaeghpcoFmV/VCkfK3lPvsgogqOWDCbkKW+dw+WerZnoid9YKqztpS
         lwaSXGO7earFye5c+ybTxOUW+n+YVTecWp1fNOUnDBvbWjcGNkWeEkot0c7ffkcqaSW4
         P6ZIn/MnRbxOdbLEaSO8JzXN0qbBLU3vEzQFQq3ffEewGpcGvs1bR8ihD4+D4VRwazCm
         AX8g==
X-Forwarded-Encrypted: i=1; AHgh+Rr8sJOMcG5nWsOSnQt6VWq00IGfeavVknIKyotyho1S0Xf1HSOfD3/cxNoqx1eTbt45RSjSMMbjy86u@vger.kernel.org
X-Gm-Message-State: AOJu0YxH9DSchZQ3DUJn9yXp6IFYVpKIV/1ma8fxQ428ljknt7jKEgdZ
	qAD6QXU5+ovV05z/Vg5kSVS6nITwZeZn6gqFqYSl+7+f5HIZGu9PLuIdfC9IrlpnS1A=
X-Gm-Gg: AR+sD125TnhDZDtXay3+1m4YpFKHIy9Lhzm/EMi2FvzyOdyC/+F8eRsqON4nvxvdA77
	fryxBlKcUc0HrzuhkynpZbDSQO599iIC459tNs0Ahe7MqFBfuoBG9FRyFZ5M29nuroLHGSVALRS
	mJxegDVpFe6mAQjIFZw6cjxYt5Q7nH3BYTTjONN11Dm6UpcH6I+Y05EnGtjY7Bi2leNmRV4LPtY
	n2HlrGCYbKLJ+fKli1MfmIEydQLELyWzpRw8rOMll+Fgm8ul+/A4abk5mbcwpatgXMbhbXzq3Ar
	ulWhVYsr7Q1UUQ03eqR99z2BxtElXJNoM6alLPWRa2oN/gg300CbvGkEKjZdHoCAclrl8ezSc9D
	9wlW29ok7pqZeP0hsR2qvBDrz40lbd9ZYlOH0P6iuJrsVcm1ZbbSGc3TFt2tssF9vk00rhF5ntE
	xznblC9abJ+lEBtiK7iuZET0LkzJ58JE6tYq9MH3Azz062Q3opKsQEbQk4kbUYbH8HmDv0Mo68t
	2+BYsZxjOMYtzT3TCAhzPpsOq1MzzKMV2wIFhZ01ojDEc6WcAe3543OlJHpjItZXbpqazRFgIsU
X-Received: by 2002:a05:6000:4a06:b0:47f:5289:d5e2 with SMTP id ffacd0b85a97d-47f8dc9c774mr5891425f8f.40.1784838225881;
        Thu, 23 Jul 2026 13:23:45 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm17516051f8f.28.2026.07.23.13.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 13:23:45 -0700 (PDT)
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
Subject: [PATCH 2/3] ARM: dts: stm32: add missed arm,num-irq-priority-bits for stm32f746
Date: Thu, 23 Jul 2026 22:23:34 +0200
Message-ID: <20260723202339.974529-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723202339.974529-1-dario.binacchi@amarulasolutions.com>
References: <20260723202339.974529-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missed arm,num-irq-priority-bits to fix below CHECK_DTBS warning:

arch/arm/boot/dts/st/stm32f746-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32f746.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f746.dtsi b/arch/arm/boot/dts/st/stm32f746.dtsi
index 208f8c6dfc9d..82912cf9c4e2 100644
--- a/arch/arm/boot/dts/st/stm32f746.dtsi
+++ b/arch/arm/boot/dts/st/stm32f746.dtsi
@@ -721,6 +721,10 @@ usbotg_fs: usb@50000000 {
 	};
 };
 
+&nvic {
+	arm,num-irq-priority-bits = <4>;
+};
+
 &systick {
 	clocks = <&rcc 1 0>;
 	status = "okay";
---
base-commit: d326f83e819c53aa05c40d64f5805d6237b6aa1b
branch: stm32-nvic-irq-priority-bits

-- 
2.43.0

