Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD41313283
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 20:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783802575; cv=none; b=nmfs3B+Om0lTPwHJNAh94PMKpjNpuGXzUBwzlRjkgjc9lSKBb1bFQ13xX3SONjUVK3cTWsuTIPpYGTTsELVU6dY++ITHzArhZi2LQABXOXbvB3zGgFhYkjgJ3571ASSp1HJHbH2YndTQ9HzzZTTiEpgNQXKauIcj1zr++9+WFN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783802575; c=relaxed/simple;
	bh=8gu660Q0u7C0W8t7xo2+vLeynZsPh27OtCchUb5pAFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zdy18KMvlcvloPVPARSW04zjlkEyEpEG7MPmh0WlZxKX3+R/DAI59ewj/23tlfsJgtUdcSCqCB5GLslYyHBC+ML6yU5pyPw2/OaFH7V9w040ax9j5JtUzkHJWx1Kb2tuEz80FXjU/zgudZCqmihk/DeYTDd6woUxnXnwZb3z1zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iS96HQZy; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iS96HQZy"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso6972625e9.1
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 13:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783802570; x=1784407370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhreuQjpg77ctdkAec2a78pglE74GvXVMC9BSorqz4I=;
        b=iS96HQZyK9MD0DIMczLE88UgFLmh8RFub/m6jV8+7uQ17og/euMZEFinDx9d4tHl2P
         BtB2XQ1TBcSxf1oNIEvHR80BIE2fS4/YkIx0G9jA5ExGqGkDnq50I20j+mspbnI5Zro5
         KlKdaNAxFtCC6fhtgLfK+VGlQaHeJBWvmSF65wKo0/+t7mQb03nP3YCaGd8qtfkvB18S
         F19W+bDYQa6FI+/TzuXKwR9bOIdBuv3CRfB5Ut2s5sWnzdtHJmUgpMVOqjT3GOrRKaoH
         qXBCfcbMcZkYj1OknkknyEreOaFPKM8iOksbeklfuqG659LNDedp46y59hP462LF5905
         7SLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783802570; x=1784407370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PhreuQjpg77ctdkAec2a78pglE74GvXVMC9BSorqz4I=;
        b=obW5vGhLa7P6dWWCaRXt1mDfEMQzAtJY+sLDDmPKuEvcrlnFnOE4K/HrboahiK4cW5
         aOR4VUWwHG2MacBeLER2O7fE9W5cVTQVc54Z2/B7IqTbC7Rd8v+rkoXvIVUOfP3rdOKi
         cl+RjT8rkwINIrcEX0rJia7i2okyFGdErHtzWsN4Y3NzZMP1LwMOIr2weE5ARnyKM2cC
         EvVfKpNkU/HBBwFwIo/DxSAboJPt2p9dQA2uG7aLa4pJTMDgrrFmPkz28cNY20USRzzA
         u0yzemB9ugmPDxWbuGFE1ScWyJiv9/2tAAmlG1Hqrdp/6X27gxgK/kBT5W95VaI/ZWot
         1VOg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8Amo7GYQeZcny7CgqHI7By0IpSs4O8B3bFsaJl85qeJR8W55SOIDHMHitXRWBB5w0mEscO8E2rA5y@vger.kernel.org
X-Gm-Message-State: AOJu0YzVomAnAvi/lFW0G6y0LxSJwddkxVKQox8eEVzUODRmQmTgluIy
	gq0H4hRlx+4UhtD4wx2JGjiPXUpGFaez9AYjwnmukQlIEBY43kP1k2Pq
X-Gm-Gg: AfdE7cm4+mrKTsUrVYzerwerJpWQqmALfCViZ100hc4rFEdvgp8N4e2TArdpqht+gwG
	VPWozXWL73rdnVB/Bgcvkjn2dXE4zNlocWWFDlPX9Zy0mg9CpKSnpYllGsXqS2OVcmQ6MXleGiB
	OiRE8AQ+1EHYzTFXNgA61xzpwj1RJpve5HiEpG9WZPUKkb/rGcB0fYsrlzeFW8YA6KhAuCsrkay
	tAa74bnOBpYZGIgsgjaPkVl6MXhnHOOlHRUkPe1WEhRC3sIVlSxRa3eOtF5Yom0k2Pw53HA0X46
	vvCdGAPqOq/0J3WeaDOET8MtiCWwuHv4vv27sLTGaGB7ZIc5Vc7376eaY8SxlfAdgVmDrMZFy33
	qh4cPq616Wo6dErZMusecFHUnkHWVPUMtQvsO04xjFpAn+k3i8GDcRtHZNQbOi/au2VWunNrD8o
	WpSMSHWlOVW0ZagpGNcrF/ay3/iIZFVyecJg==
X-Received: by 2002:a05:600c:8b05:b0:493:e4cd:def1 with SMTP id 5b1f17b1804b1-493f87e9ba7mr41987295e9.11.1783802569796;
        Sat, 11 Jul 2026 13:42:49 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm172704725e9.2.2026.07.11.13.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 13:42:49 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	--cc=linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v5 6/7] ARM: dts: ti: cpcap-mapphone: add charger detection interrupt for CPCAP USB PHY
Date: Sat, 11 Jul 2026 23:42:09 +0300
Message-Id: <20260711204210.197144-7-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260711204210.197144-1-ivo.g.dimitrov.75@gmail.com>
References: <20260711204210.197144-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the CPCAP USB PHY interrupt mapping to use the charger
detection interrupt and corresponding "chrg_det" interrupt name.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
index 6b1195c2a768..51a858021541 100644
--- a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
@@ -125,11 +125,13 @@ cpcap_usb2_phy: phy {
 			interrupts-extended =
 				<&cpcap 15 0>, <&cpcap 14 0>, <&cpcap 28 0>,
 				<&cpcap 19 0>, <&cpcap 18 0>, <&cpcap 17 0>,
-				<&cpcap 16 0>, <&cpcap 49 0>, <&cpcap 48 0>;
+				<&cpcap 16 0>, <&cpcap 49 0>, <&cpcap 48 0>,
+				<&cpcap 13 0>;
 			interrupt-names =
 				"id_ground", "id_float", "se0conn",
 				"vbusvld", "sessvld", "sessend",
-				"se1", "dm", "dp";
+				"se1", "dm", "dp",
+				"chrg_det";
 			mode-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>,
 				     <&gpio1 0 GPIO_ACTIVE_HIGH>;
 			io-channels = <&cpcap_adc 2>, <&cpcap_adc 7>;
-- 
2.39.5

