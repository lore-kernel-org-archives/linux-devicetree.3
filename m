Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA953126C0
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 01:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787274516; cv=none; b=BGqeU6jem1+6dxWaqwVEBWdVp8X3mSM6Bh/ZfzX5bk6YYwSX4VHDxjeXth9IWcVpqGEHih5AHSzTeELEaACxrTcwBLtFNES48boEHkIPN3AHQh5hEdkE4+uR8tND6U+jN+GPnQF8kjs9oHz/taPnYzzfzQwOcJ0QnIoVZK68Wa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787274516; c=relaxed/simple;
	bh=wY4uadi2HO3HpucjWOKrMcTP3ow9p1AFLbpJ29zEm14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jBrG5N2THI+729hz5W6C6XRaFowfARYr2H9CdGeekOlRgfU5S5UGtaPl6P04xPih4ct7xC6tucbAhGRKyxq/L0ELs9YNfIM0DPkc8DNHwknSxmox+Digu0m4ObWrlsvZLHIq+oBaVfiweYMVwKIy4yTJx85rJ70ThvxADOebQvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VY3HNVo6; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VY3HNVo6"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2022323c37so76742466b.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 18:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787274513; x=1787879313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRGcQvnKLAeLq/zsHD6Ma8Ccz7ec9Urq2bWU0+6yeKw=;
        b=VY3HNVo6scUFMDi9ENP2a5DdkpPIFV1E7yJfaMsi3+I/TuYLiMoDcN3ZsMci5qikXO
         dp9ZQvmpht/ysQq/45bi+x1SGn24wC0Lpo2yMtjil+85an/9muHFTPgBGO3fdZK3KEJ7
         LMQPQKAJi9vkzWesJViqxOfO6Too2aa2YqUCi122jYiMgXValjBeOwn10HcqYUT4luL3
         2eaa7ge9iESgJR1tUo8QHzDFZf5cgM3sxNQTgbZJzjRP77r+5DXCnrupV5sliWBUub/A
         O2ypbALm85ICU/QPG/5Y610gTMChy/pL4aZ5Z6ecRp3xY0CyBOUoROZXMXCqNhO8uYwu
         Sj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787274513; x=1787879313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mRGcQvnKLAeLq/zsHD6Ma8Ccz7ec9Urq2bWU0+6yeKw=;
        b=YE9sSn20yA/LyZfWHZE+BpOp1uq4j9XMIzJ0E7+fLK0RnARYNZpVtHuhq11oj9M2F/
         XJb3lM5wKDJ8TsN7pEntx4ANAf1DofkIYNd+6t52tVQC3YT5Ghp8bPcNj/zTX91d9qaK
         1s732HaYDPelgQtBeVfTufMT6viE+kFHMYGqWqo6yK+yvd5b59QXDGNLmjzsCr5tUefN
         EV+tUIGlrBw9W1jciBM+k76IszS8RCcrXKsJFcujMXRDgVxJ+6Xpjdgs+3kOt+RMi+BU
         YtX0LisbhiGw3TsgaVXEN2po3ClmC5idShf1FXTe5ry+++xoQK8nEYJNtZI8ASxSYwP/
         HYPg==
X-Forwarded-Encrypted: i=1; AHgh+Rqwp0FidgR3D2gdFQLVc2vxEXRrGNmmwq1aosyBClCvWnRsCuN+G88U9NklUjajABH842hDDiGzviKf@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh2qxsf5Gdnewg8wT30GW7QKr+nXLWUGeRuD/OiAH/5SpF8j6k
	Ug5nTuJqifF5XICKQOfmhWeOtyaDglgIo/dHzI8hMaaMAeL4dO7/UytO
X-Gm-Gg: AR+sD119vy8X8ec1SVPs1vLvzAVhg5pptnjylsE6j1vry8S2UVSl4in4BbELQRKoz7S
	4uA/lVVjVEbnlMvIUo4uQNoVPGyD/m2ewjiHR256fO7KGvI8hN+tYiPj1vOsHFd3dXSu0Jd1OQd
	3QzGolfgonNvBU6CTzqm+rmSs3nKYHLfu1Cxy4prC5iKlGFt5UmGSn0YnvaXIgcwR7B8HoQ5Zmu
	TRHbh6hVno8uPb78+vWUjnK6s/3FN6f3+5jd86Cfig7mskcvmz5up/e83RpBpAkuO1PeKGPWFVl
	VSXv0pCODfcEsg88rCiTeWyxqpwuUkNxfjWXPxcJ1RBWjz5Yll0/jTyRpsUJB8DPPaftMdqMeHH
	qEAVrPI7yqoQkIsHDOEfik6Eel7GGK2DiZzpBF/+PlGLZIEutV4mPJdmkdVUU5pyOD7mJ6PB/gQ
	EpaNGHrCDoaJKcduMqNXVkbpSiHcVPEUZ2U1PhI0rM6+NxXPn1gO94H9/aj3y9/Vd6RYs3vWfiH
	27TL63KNmF6lNUv52uMAioNFLxP/sKWSEitzypsGWJBxdSp4OT3cDOocnrRWYfdmg==
X-Received: by 2002:a17:907:3e9b:b0:c21:9870:c4f7 with SMTP id a640c23a62f3a-c246a6799e3mr240994766b.20.1787274512882;
        Thu, 20 Aug 2026 18:08:32 -0700 (PDT)
Received: from localhost.localdomain ([151.251.247.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1563c5sm3913104a12.14.2026.08.20.18.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 18:08:32 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	johannes@sipsolutions.net,
	andrew@lunn.ch,
	krzk+dt@kernel.org
Cc: francesco@dolcini.it,
	johannes.berg@intel.com,
	kees@kernel.org,
	miriam.rachel.korenblit@intel.com,
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
Subject: [PATCH v6 3/3] ARM: dts: armada: WRT3200ACM: add marvell,invalid-reg-hint-in-rom
Date: Fri, 21 Aug 2026 04:07:28 +0300
Message-ID: <20260821010728.45065-3-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821010728.45065-1-gvalkov@gmail.com>
References: <20260821010728.45065-1-gvalkov@gmail.com>
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

Add a flag marvell,invalid-reg-hint-in-rom to the WRT3200ACM device-tree,
which signals mwifiex that its regulatory hint from ROM conflicts with
the platform and should be ignored, so the platform regulatory domain can
be used. This does not allow the user to change the regulatory config of
any radio. It only allows phy0 to start and operate according to its
certified configuration. All radios in WRT3200ACM/WRT32x are locked to
the hard-coded configuration for which they are certified.

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

