Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088638;
	b=NlbpNSFA7XXflerxNE/kl/ognqxJhqEHHjUuuTOWeKK4e6dzy/kR+2rOYKh18RblzXOW
	 5PO2azKjDcpnWxb8iXD3RHFsPbWPSN43Wjy1zaS9omm2EUg18sMzD5gfdN+sxbMCKwfrC
	 zPrpriB7pBsfETbuTfDWpx65nVjadk+93GcKpMbqZpecJyZatuE1edDqTmmcce0LU+Upm
	 d+XpazuhgeNdTgwaKprIdl3Oxhh3hGD5ZGL8/d3KNR8bDASo9JUBntdtV2Xi8gk53CtlP
	 EKgCbtXrdNZG/MPQlTE3Ft2dYJ8FVHxrhpOe4h5gzBumkqoQ+pberjdh9RVHrJS3FGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=EJml6LkzSdxjzvcMjCvcsg9ewQeSkDLux3QaJXnvGRU=;
	b=sHH+Xe0rlxXxnjimvAD3jMNAJt3xLkxlnmc5SlesFIDaxROylrvF2NCyIKVJAF3gqQhe
	 mqJPrwVEzjeIFmFPR7XjiWcXPyG+mFJ/zFduQGdd9tjODUraPrlovuST1OhmmnDRIho/r
	 ZuRS3TUcV60uSu5ZQhwxtzHR7vldDEsWQgKz307Te10i5oBKVT+kPVmhmsN/W07Y15ZuA
	 fKsVen6j2Ij2lnEy+h/ad5ZCW4uTHzElFmfdlTyfkXNutwDkM3C3j3d8uVw1/F5NpcOxm
	 JU+zlONrWliMDiSajWS4/2K2QQOyRI16KhJcqd5UCoFzZw4TqHsvlSjKghRso5NuXSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PW8KVOik;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8987F606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8987F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PW8KVOik
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so1283746a91.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793088638; x=1793693438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJml6LkzSdxjzvcMjCvcsg9ewQeSkDLux3QaJXnvGRU=;
        b=PW8KVOikH45cI6r4z/VgBektu+0dGD77T8bLsrxpG+Qmdaa4kIkhHzZJLDZ2FvJxXy
         KB0prV+DIw6UtaFrJjoaDhwOGZ5UngmvoXUQtiyw31PT5v8eofgYFwBrYdI2O5zvdBAW
         3MaCXmROn0ev3EnOVm8kw7Xj57NPaq8qQH3wFkAZeAyGWYZJJ7HByaXmLFznboiCpYzD
         8p+9eyEUHE96pXty3CFycY3a1ZRtmm9b1CJiTS4PTktW9/58rVrKPvabUhsxqtC8AwSv
         8Yug8b/o0wsDJKFpDtEWyeDAI42tGVUsxteQ+Yr9G7LDpIMgN9bQI5tjlzQenkKp7ao9
         +oVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088638; x=1793693438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EJml6LkzSdxjzvcMjCvcsg9ewQeSkDLux3QaJXnvGRU=;
        b=lu+S2hKCz6T2F2XIBGHIL0F/XDmfwTTe55GG3IPtIaXuqaQeYp+NCaogyKVUbCNsM/
         0KwGAzKW1QPkrbkotBgCMpH86jAD86QahBY+UIwmHu0k93KzZVP8zf836cIOPljjIuYX
         LH8++5ttzBAnFsaTwFoABxVRgCXd//0a4LBq6hoE7jz955GMJFF25Oyd8QpoKZB/Cy31
         sL96ZgGv8A4tfeNyVk5WP4ZvVXGJlAzH4eKBMjZdfY9TLH3uFPHiGl2qur0hqfGQhaAx
         a988xJBlGrzNcFrp/jbGpOk/5yNgB/1H2J75YgAqJrOq5YFhxbRevp+c+IijLff47EeO
         AU/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxXNNmFBkzR1hmc0nJYPwUe1HXOjC1n8rmUt4qcgBEZ5LQlR56YyTKhv6G91eVVsr081U2VOYvgmyam@vger.kernel.org
X-Gm-Message-State: AFq9FYKtSjV6Yoczb24YyfN2abMYe2rsUoAvV87LhjwZKLW1ScGG7wsE
	HYNRk8Y/X+770/FGEF+48jTkCNeNVez326o4edDAQas1feaxF/dRgwoz
X-Gm-Gg: AYBFou260d3yY/VZSLW3EKtOSDQZWS6sXWDRT9tfAw4eltHwFbjwY8TmGZmk3T6tPQ8
	LbXhRzNG0o6HjwB0FC71l45i0ZrJrGtTSDmIb5VJJ3Bh1ZwB0Y2kc8azpdL6k5ppB8/qWxcczTx
	WDpLnLjGY6AZY6nIntcR01gpkGiQxwvKcyj6DETNR2x9FnJbuQ1OtDxpoZLg7noEvrWEtIBW9jZ
	XK3rhdwNud2V9sY/y2wS83oB4wOiWHpqJD0CiBoC6ghrLBNDX4oEdlEqwDSjebrjkrEHEQnYOUX
	xMoSavb1caQ3Jrar4dxNwnhkZep3vsYodWrpVJHCZPlY0+onBkxBjFUW9QLMpmmOiTQNr1DTWUO
	My+6oVW5Il8EBQlTPqeuU0147FVMCtEgO+gI36ewzVhCsz+zZnzd5v7xJjR1mg5s9ifeblLdDas
	3/+MEqylUWMcv3OewuetFw4S30wNgOuH9ATtL7mNE4tOlY6NrIw+sGp/3/JF6MTlalVAf1sKz3p
	VxO5RH7I+aNW1X2qIhGQgr/o08aVJsWucl0ZO5ZrgNY+zbHFo89U9KyL2wurK+M2JBzjV6GVA==
X-Received: by 2002:a17:90b:2648:b0:3ad:53a7:62d5 with SMTP id 98e67ed59e1d1-3adeae6d7admr6673934a91.12.1793088637747;
        Tue, 27 Oct 2026 01:10:37 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406361e2sm2592284a91.8.2026.10.27.01.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:10:37 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm8250-hdk: Add PM8150b LEDs
Date: Tue, 27 Oct 2026 16:07:58 +0800
Message-ID: <20261027080758.3990418-7-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027080758.3990418-1-dc_redstone@outlook.com>
References: <20261027080758.3990418-1-dc_redstone@outlook.com>
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

There are 2 LEDs controlled by PM8150b on sm8250-hdk
which are not added in the dts file.
The LED1 is for heartbeat indicator,
the LED2 is for wifi activity.

Enable the LED controller of PM8150b,
add the LED nodes with proper triggers into it.

Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index b32f254bf..11865abd1 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/usb/pd.h>
+#include <dt-bindings/leds/common.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -614,6 +615,24 @@ &pcie2_phy {
 	status = "okay";
 };
 
+&pm8150b_lpg {
+	status = "okay";
+
+	led@1 {
+		reg = <1>;
+		function = LED_FUNCTION_HEARTBEAT;
+		color = <LED_COLOR_ID_GREEN>;
+		linux,default-trigger = "heartbeat";
+	};
+
+	led@2 {
+		reg = <2>;
+		function = LED_FUNCTION_WLAN;
+		color = <LED_COLOR_ID_RED>;
+		linux,default-trigger = "phy0tx";
+	};
+};
+
 &pm8150b_typec {
 	status = "okay";
 
-- 
2.47.3

