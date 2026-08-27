Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E81377A83
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 13:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835851; cv=none; b=KMpl5pGQfGvCveUBRqyeh+JrNsp/UXKYhuUgaQ4wpNvaKcehNEkynB+rAK8C/iHLRzLpZEwzrVS4sUFgLImgWN0HW07zkN0TrTbnVl5EDVfOtxyzHkvEG24S8io6U1/JivH1Rkv7VAh8XD3zVDxoLbnSCrwvYW325QCoX158pV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835851; c=relaxed/simple;
	bh=sarQEdrSbBSoaCcKumeb7DKx9O4YVpY+WCIk3ge9e4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ms2IDxg44cWCBuG2uopX5gh6lR+KHrKAy2e8846B/ShA55bLBHHwZ1rHOzAIE6oR1OIP+eGXiV3diC+Qp4vuXpvBEgp3wOPJvQxkotlvPraAuntlMZnrLyKujYsIIzBZTPQDd+/+MUK5T/o5ZAyGixSO8Ek4P3O427K1jueOGF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNPf7GGm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNPf7GGm"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so13082265e9.3
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 06:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787835839; x=1788440639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QF2zBpTs1xbQ8vVeDBrFP8mtx1WkUete3RSSn/zfKZ4=;
        b=bNPf7GGmSpoJPktSQVABQMu9LCAv6xK5GX133qC5CGLnd3z+AT2DgV/JkxWpUoRJna
         wlordsXPLq58Gd3FZgjC+fOQkKVpyvpVCZDVGxudjOgElTYPfZvau0mNra0SFK7SNuLn
         o27Q+CRBeauJJ2NoDSN3pSW0El/GEEGijkkGGQ2Q79jJ77V3x8HQ45DDejPelIjwmu5K
         oAGiK+dJlICwQiL4O+oFdrx+eg5qks/8p4lNNygI+o8M07MwTiR5ICFKjYBTxrQq4Ty9
         4gRNzTeW9nj+Xec2OoAhA2KNIjZ6s0XaTdkEroXNdnx1j7DJgbE7kozY98uOh9KYsJ0s
         91Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787835839; x=1788440639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QF2zBpTs1xbQ8vVeDBrFP8mtx1WkUete3RSSn/zfKZ4=;
        b=PhzDisqtdq3IFMV7+cUVOfaSbA7bP7Vp8no2FCM4XBnxgX/udIDaZnpNOsThwd61Yo
         HdxZM6eVsaLs266a3Hum7Ljjqc59s3PCvQBtAGKJ+FgQ5qy2fKvi8uNF7LGJGuHEKKld
         gOuj/b+EG4L5mhZtPYoEcLiwlija3i11Fkg3rULiWPAVADraZlIU25SLs9qLN8mbABWk
         JS0/KVkbOOHdU97fAbRZpFwAgvlqC0aFeIdNlhcNd17dVZLnZZyUsiamQyNMvLcouo3q
         ONDfq56O07PsX87AT+NR4tUmanHzJ1pPWRMD2l3BTKCgl4MqcIrHqZm/YyovOvyWRH1s
         NiTw==
X-Forwarded-Encrypted: i=1; AHgh+RpAiK7jLvCCMbg2kRbQ2NqU3mj37P0XAb+ANeIVuErmFJSmSHDwVnlZnIsh78kxuUELscihN0/BRw8j@vger.kernel.org
X-Gm-Message-State: AFuF++knVWOSBA91jLLouU+JIiDMtBvbb4/ryhjzHOrBge9FDApO2YgG
	nUUHAzNvkqJL2PitSBlAWYT29ZqEjg+tG2sJB2PjUpHZzE9U+oHLX+XJ
X-Gm-Gg: AR+sD10ccB3Wb6iFh5MIGZEUSKe9+eG4GT/r7O6C66U6f+0S06mxeVNtXpuztqwWvV3
	TpIbrQRcdIqRp1fXcGw5fk7t769v9BcyWVuCkAGNHoAtZ68vsWZ9WciefnFDe5g3NHwV0aikNyk
	E9+m2etgsuAgYZw7BUyxZ34sHaaqr2mbwItiwLMA+pmcTbDqP9M7BiQp0TK8qq8qzuDzUwQO+dI
	tmciopc6lJDewSNZJ7Z6uficQUI6Zov/masb0EVediRHx04mTR4NsGWVxY9rFAcqRjaDNzB00zX
	ueD6speS0vS/aQSPr9eGYi7AZp+N09yVWi9vJQtSHcop0oX+5ITrU0ElwVZgB0V+fU+cCXKYht2
	4KWIMPSPQm+L2T3WJm74OWBSXWJUOeM9E8TdGx8JVnPhWWAmQ7pXa7q1eB2Yk8evUM6F1TX2VKk
	xaSMLyGLBQA+Kf8pwb4qEV4tuJrh2WS7StRBL75HUMQBamYKAeL8CsfoteO1+aeXvCrPDbe8q21
	q6W6R5DkVmwNyvVhxvfypBfc+pajVIHwuZTu9TWdTnKZHOjc5r96l+hbpmJUuoHOX/dXXJIJZQ=
X-Received: by 2002:a05:600c:4505:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-499dc6e9935mr159659955e9.1.1787835839294;
        Thu, 27 Aug 2026 06:03:59 -0700 (PDT)
Received: from localhost.localdomain ([2a01:5a8:737:d4a7:e53b:30a6:3c0f:1dad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49610170sm116081285e9.6.2026.08.27.06.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:03:58 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	johannes@sipsolutions.net,
	andrew@lunn.ch,
	krzk+dt@kernel.org
Cc: francesco@dolcini.it,
	johannes.berg@intel.com,
	kees@kernel.org,
	miriam.rachel.korenblit@intel.com,
	rongqianfeng@vivo.com,
	wenst@chromium.org,
	rafael.beims@toradex.com,
	avraham.stern@intel.com,
	error27@gmail.com,
	s.kerkmann@pengutronix.de,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	chunfan.chen@gmail.com,
	arend.vanspriel@broadcom.com,
	peddolla.reddy@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org,
	gvalkov@gmail.com
Subject: [PATCH v7 3/3] ARM: dts: armada: WRT3200ACM: add marvell,invalid-reg-hint-in-rom
Date: Thu, 27 Aug 2026 16:03:35 +0300
Message-ID: <20260827130335.6606-3-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827130335.6606-1-gvalkov@gmail.com>
References: <20260827130335.6606-1-gvalkov@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
from the mwifiex ROM, which conflicts with the platform regulatory
configuration on units sold outside the US market. For example:
- phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
- phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
- phy2 mwifiex 2.4 and 5 GHz, hard-coded region US

When the system boots, it detects a conflict between the user selected
region and the radios, e.g. BG FR US, and applies extreme restrictions,
preventing phy0 from starting on any DFS channel. phy2 works.

Add node wifi@1 with a flag marvell,invalid-reg-hint-in-rom to the
WRT3200ACM device-tree, which signals mwifiex that its regulatory
hint from ROM conflicts with the platform and should be ignored, so the
platform regulatory domain can be used. This does not allow the user to
change the regulatory config of any radio. It only allows phy0 to start
and operate according to its certified configuration. All radios in
WRT3200ACM/WRT32x are locked to the hard-coded configuration for which
they are certified.

On WRT3200ACM, the platform configuration is stored on the devinfo mtd3
partition, which is read-only: cert_region=EU modelNumber=WRT3200ACM-EU

The Linux kernel sources do not have support for WRT32x. An equivalent
patch for these routers has to be sent to OpenWrt.

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Cc: stable@vger.kernel.org
Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
index 4ab45f294de2..2bf29981a031 100644
--- a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
@@ -165,6 +165,15 @@ &sdhci {
 	wp-inverted;
 	bus-width = <8>;
 	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wifi@1 {
+		compatible = "marvell,sd8897";
+		reg = <1>;
+		marvell,invalid-reg-hint-in-rom;
+	};
 };
 
 &usb3_1_vbus {
-- 
2.55.0

