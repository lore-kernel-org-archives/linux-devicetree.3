Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792668986;
	b=APN9/VeDN8lcqOIjsZ1RPyAajqgat9MjafWzyr1l9J/MURRuH+iQi5vAakvWtrfeKK8U
	 7lWEoZCuJEx3lSTevq7WEP99cr1byxDBVV6LpKEdrnNgD4mgMv6AAxmtsi0xv44sXGXXS
	 5LyGDpWpwZNd/CyoUYPJCb1k49QiPHyYuWbeD2QqxiOUI/czv3Br/hpc4h5YZa9Q9q+mu
	 dCwnpQ+vG7Gty3n7wj8mkLZ3Pp5KoUm33LeYX6nu4agmEvjHxEOLr1NQ6WRx3zZP9Oyr9
	 DgzUNDmVwbxqDjYRUHtGt09znl7sJQ14NG86jRwwY4tgCTy/NT9l8OOlifu0DtF3aTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=yV/zmmEJwq4vtEwn6ex+r18U2+3GRtp17gkWW7wfd10=;
	b=zt0qZc9idSk4mZusLza5ov2fSBBFTdAV68/Abya5eUF5Pwitcjlz4gqFZo1QXpdHPy/J
	 dkjhFeBOrjy9XwXq8bMG58WseaSRxSl8gLUuHQR9X+MHVkSlzb3bipmrNkKuQALZTXBYX
	 nAr0KJ2GBvQUpcNjrjbie5+UTLuAUfUWY4iSoDN7UoZdetz8V2axXW6M7jf/BPVZb/d98
	 yd7jpI9xByENM32BsPs6rgG1OGcniClmZGUsuLC8aooeCP7toIK6G80QQ28hGJxTUonx9
	 74xw/x+gqNz6e560mZnf+gnNm0lYwpHdQ28y0l9yl8juC1yG7Z7sbi5bGfTpLfoIiGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MmCte4xa;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AF9606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11AF9606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MmCte4xa
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso969898a12.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 04:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792668985; x=1793273785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yV/zmmEJwq4vtEwn6ex+r18U2+3GRtp17gkWW7wfd10=;
        b=MmCte4xa2xHtjhMNMZ1MKy38Wy/mSYhv6OUk7HlfW4NB9ylifhGdFwRoTvXJFfLHLB
         8keaUIZ9+PtLQctAaN/YcisjapTgSuzy+TiQ6EzwFetWDo3j4vvLqg2sgqEziQSbY81B
         xqqhqiQ9rQCjMx1qXFKxaqoI3hXIticovMcJ3+/fVzkkIvzOZur7SngOBAD8zQ0jlhpf
         mXBzqto/8/LkqLPEfinoZuATeltfLuSGcexDxYB7d2oGt8xULv3D41DuWTvGk3b8l6MM
         AIMZxeCIFRYakj1kH2ecTchh3ido+5KQcQQZ9JqfULK9ULO5B9frP4gBune15u4ahZL2
         IAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792668985; x=1793273785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yV/zmmEJwq4vtEwn6ex+r18U2+3GRtp17gkWW7wfd10=;
        b=ohMtkk6JnHucZFVZRrtn4x3P+V2qq69hNbGdmPYdaS9zg2JTCpQHEIUJuqdeZxqt4y
         sK+FPTorHpnXcZEQohUsl7ho1GqG+9bNyEh5HUqiU36DrA37xtPOmlh6bo0fWVNxnTwY
         eRdVe8knI6X93qbIc1KUILRcp46P1syM/DxEV3HBivQdIalaUDGT0Eb9DqZSngiX3VW6
         PZ3+aBtQXqU82/uUON2ue/mgktah86KkCVW3uazDa3aqcs3r5YGgBTyz5yj1qs8EBPSz
         nL0xFke+6oZiGLd5t6xJR+wPY2TPj3bxc9oJoG+XXZeK5yXv5MzIUUMnSVmBjljQW7l/
         URVg==
X-Forwarded-Encrypted: i=1; AKwUvBwj9ZvDomSiaGjQUvt+ct31AjXJ26mGq9lzAX8ZCkSayeg8rXHbknjKPWfQzYchXKZNn4hIyj1ba0Dn@vger.kernel.org
X-Gm-Message-State: AFq9FYIlZ1NL/PmQAvs6/2EQSR2009hT8ec/oosZ6zjFjBiu5Z4ljYm0
	Yl2UU31dLBslMr34TgV1+6j13BOLGTg8/eDs15Q7GIdG5QI9o83V5UHD
X-Gm-Gg: AYBFou1d9MQ/AwnftR1kCD+3OU+PD7d6TYfBJjT2e9ZgUhIQkCtOFdRimcwuyubE8RA
	r47GPfBZD9c9GqZlJonF99e0ToxZB9vgtqxOd3aONlcEaR7W/ncCsQqb4BMNH4f27ez1+uWl7DJ
	3xo9BcrLms+mkoOyugylYoH0gVMbwCBMa7WDvIwBfb1QcXpDbTzl5QDeENK3rERLDXdN5KWr+OU
	VcuzG+djdcUQscXbA/VgrWrWY0y7mbE1jgNHtLVB2rVH05dXPqPKKyYVT0Mlj1+DSt1aDfYFjry
	0ow/BuDy6+SvG7UjZC3cYDyzHZbj0Y2Aun3CA8Y54+UcCh+aZtU6sc4pOx4mY9N2iSf//0QoiT1
	2evdwAYUx+6yt8rC6EHZ7oyrYUPuoBTzJ8ULctLHWeUnfuaA4/NqAv0O43IxubNgH0HGxyf+sVn
	QHFTsPjbJvTebGuQoKLV29kqKo6I5k22X4KRma6MKHju6SepZye8N+Z8BM3pgOPycK10GoauCjv
	W4TNYKGkm7bdeQaEOd1YNrz0HnigYkVNcPTKJJZhxlkLROsuDM9OKsRd68WyPUydwZow37ADg==
X-Received: by 2002:a17:90b:2805:b0:3ac:97bc:4c7b with SMTP id 98e67ed59e1d1-3ad86f44843mr4190640a91.14.1792668985330;
        Thu, 22 Oct 2026 04:36:25 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490e5edsm3997668a91.8.2026.10.22.04.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:36:24 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	redstonee <1516235445@qq.com>,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH 6/6] arm64: dts: qcom: sm8250-hdk: Add the 2 LEDs of PM8150b
Date: Thu, 22 Oct 2026 19:36:01 +0800
Message-ID: <20261022113601.2320940-6-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022113601.2320940-1-dc_redstone@outlook.com>
References: <20261022113601.2320940-1-dc_redstone@outlook.com>
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

From: redstonee <1516235445@qq.com>

Enable the LED controller of PM8150b, add the LED nodes into it.

Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index eb899c92f..d15e75a4a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/usb/pd.h>
+#include <dt-bindings/leds/common.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -157,6 +158,25 @@ vreg_pmu_pcie_1p8: ldo9 {
 	};
 };
 
+&pm8150b_lpg {
+	status = "okay";
+
+	led@1 {
+		reg = <1>;
+		label = "led-heartbeat";
+		linux,default-trigger = "heartbeat";
+		color = <LED_COLOR_ID_GREEN>;
+	};
+
+	led@2 {
+		reg = <2>;
+		label = "led-wlan";
+		linux,default-trigger = "none";
+		default-state = "off";
+		color = <LED_COLOR_ID_RED>;
+	};
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm8150-rpmh-regulators";
-- 
2.47.3

