Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED3A2D061C
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 19:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787080331; cv=none; b=ufdQuzIq7NLVigMBpd4VcuXOF2kdLr1HsaJ5Hm0tc88+vPi5SzGdXuTkUWF89iZKCQFMWCJUuK7FZCl/CW9W9JtSOFnmq73fnpexAif6YMGJf2R1CqJIQVmKAG9Q0ADc69mNDBWnweG2QlxKiif9IeC3KkhnuFPGSx7dNPSULW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787080331; c=relaxed/simple;
	bh=HO0+RPkmv/54G5SUNBvVRzpPmMsibWjHar2qhfMCDh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SRVg8Cq5+CTszvcvzuzv6bs0xX2ADnIecfWlRaezVXLRLZxGWFfcIh8XJXqK4FYaZkBkP022FakwWgJT6trp8QRUPrRHR5EE/WQSWv3nwfiERA64HPfzqly4Td3zvRPRv4nTJnyFm2gtjuW3mNDuUBwnKI1+t+Enu+pjlY1CdAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954dff6536so1703035e9.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787080328; x=1787685128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CMPOR156M0mqts600G+VeeVQ2Hm+QQSFhaSBmB76XDc=;
        b=Ad/h9GfhetZqQ21y9oZQbG7ZUDqXEY+BmobCXU89k/11xK7wTVWhLHU4r+wfkVtX3e
         dmbhRbqz+RfJWvhwWb3uIlincOxayMmIwOIgUthaopEb8ROoPklb+MlCUmU9uJfJc9fg
         P2n3Q1GC5Azcwv27f5LijXdNoV2UMO6ILxqLhbihtiCPwqCCIyO9nhS42x/siz72bKfy
         TiWXbt8gUeWqd983aLhzEvMeYddD/1vE28lKPZsiWqgYAWMYOcqlPhACVTqgMtzk32Md
         4q/YrqaIs3anocPF35vsXY9XiXqNp2FFwJHdp0oS9zj8il/CUb8X5CEabRQ5gIeFmCzq
         gIeA==
X-Forwarded-Encrypted: i=1; AHgh+RoP329ig1Mi2dO29f/KqUCyNfvqX/ta5HP2fqrbiKF9gQSvaI/3EVf1bUIHBTbw3YIwXuS5np8/CZ9m@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkrs8imBFbA5oXKJqPTb6073s9n3aRdKgKRjOdd1h0x1b91j5G
	kHu9ud11dTK76P6sax2vNwdpgeYgRvkIkgJY9Wa/xgFBBJ+iZv++9dYG
X-Gm-Gg: AR+sD133WiI92+dIpS/u4CPYMSO10R7NtsH5q0ziLBgQ/3NqT/pqgyVNN8lF6oFX03i
	Dz9Yh0Y/4v0KhOiauHYWrvkomFo/C+qiax/CvNFRNQzrS0pfeh23RT4mlKbOUoZ35aCsp9YZ9mJ
	/SQKJ8AxOY4qDLPINIgAwMIn3fopLnRc6k4Jiu0rr+bqq+scrAnYZ54JDD8UVRsbcgz8QDm9eQ4
	5JFOPXNrnl6NRn+ix5yiPi6hgrEDX5Kk19Y6jag6qauxsXgJj1mHesvCg8MPtkzGqjjCsYaQUKI
	cFSDWbOIKldib9k4QBIOy6ajuaZZcpJat6MbpS/ydMPVaD9Ed02oLSPYiLuLhupY1yPF6r3lr0s
	pKnQ2UGcScTcTHl5ASxlz8mZ3ktPPLgiivdN01yfO2E9WMNAaTsbqABXIts9KprfoJs4jfsYR0L
	vj8O2GH2YRblcoySGM57IPTRMRs3TfkV7ZkzTo1MXaxEQFMylVrinccC4lPmnxItpGaS+NOgzKM
	3OUiYbVa9Xrr1ERlkk3vv2Yjzg=
X-Received: by 2002:a05:600c:5253:b0:499:8ae1:b900 with SMTP id 5b1f17b1804b1-499a8fc25eamr3729925e9.12.1787080328303;
        Tue, 18 Aug 2026 12:12:08 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b783c6sm14673154f8f.31.2026.08.18.12.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 12:12:07 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: amlogic: t7: khadas-vim4: allow the SD card to be power cycled
Date: Tue, 18 Aug 2026 20:11:59 +0100
Message-ID: <20260818191159.11523-3-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818191159.11523-1-tanure@linux.com>
References: <20260818191159.11523-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SD cards start at 3.3V and switch to 1.8V to reach UHS-I speeds. Some
cards refuse that switch, and the SD specification says the only way
to recover is to power the card off and start again.

SD_3V3 is marked regulator-always-on, so the supply never goes off,
the card stays stuck half way through the switch, and the MMC core
retries forever:

  mmc1: error -95 whilst initialising SD card

Drop regulator-always-on. regulator-boot-on still turns the supply on
at boot, and a card that refuses the switch now falls back to high
speed instead of failing to initialise.

Fixes: 8c45bf9ae4ef ("arm64: dts: amlogic: t7: khadas-vim4: Add power regulators")
Signed-off-by: Lucas Tanure <tanure@linux.com>
Assisted-by: Claude:claude-fable-5
---
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 677069e58f30..3f53630e107f 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -71,7 +71,6 @@ sd_3v3: regulator-sdcard-3v3 {
 		vin-supply = <&vddao_3v3>;
 		gpio = <&gpio GPIOD_11 GPIO_ACTIVE_LOW>;
 		regulator-boot-on;
-		regulator-always-on;
 	};
 
 	sdio_pwrseq: sdio-pwrseq {
-- 
2.55.0

