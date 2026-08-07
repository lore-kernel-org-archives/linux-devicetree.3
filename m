Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044B832695F
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091530; cv=none; b=R8tVMIMJOkqj/j3Pd5yfUVV3RAWM51hfle/CBapQRy3mYma5Od5PCVEya3tR1uNVgJmORAIoPBZjZZ+Pba2ogtzTK3llaOCYMjkyEzTAOoNnUhike61kKSc7ASuI9gywcm/UAl2y86dw7I8byHFKWQ/dyvXDW+XnycQvJsg4vCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091530; c=relaxed/simple;
	bh=RcXftAWRKLRZ0LAHOnOPDcMK4kwkfko7lKDCB6d4ook=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RnlQEWf4BWElw8MJuOF2fMUM2o2HspXck7m5bxe9YLhVBqHUpIx4w0nIKBtVaB3eUS0XQnPBI34oDjm3CAcRNJms/52K520Gt1pMLRtLnrNvqCWk9MijAZgZC4J+rv5AQk1qYnzo+xQmSFuYjeBUM5l9P0ylJYqYELb/FeZ70yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEGoYjEz; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEGoYjEz"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-848761b5897so2217405b3a.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786091522; x=1786696322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6soMHfgqRF4/fxzi3W7/7Wz7EMGwWasAIJftZ/Eo2FA=;
        b=aEGoYjEztLJo4FiGwtl88rMcgSZHJFQgo03M8x1Trptz6X+kxtslTgl7Bo5mRdX19k
         WozTeoMOxIwGdpQeFlF21Z9dQcoMXjjyOsvYTBqc0hTDCbNSnCnoqwAGA5CqC1nOPKYH
         0TT/NYNmmBbvEi/6ZDsPk4nQSggJUo3cl/ljr/ODmNaM+7lW1N/oerD6eEYoSTCKh2WK
         y+4vJHc/ZB/PvXvka3c8TBFOV7Je7ou2DEHjNTvND1yHMcWwwPKq6DaBqnSZ8mKRyKW3
         U710+JHlb8+KsM44aLG/a89oHoCtqy/SBj5HJ//7MCXkmIRrElxrA8muS+jGgf2pJZWd
         ibkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091522; x=1786696322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6soMHfgqRF4/fxzi3W7/7Wz7EMGwWasAIJftZ/Eo2FA=;
        b=GR8b4isrpjNpV1fkjOZ+emblxk4HS9WleXxNu44IxIYmrh8LVaA63+vF6mW+HKMOkN
         qLE2CPfzJocKQlCws4v1XKdWMmfDdPWNONPtUQHefpoUfGpc0dyxIIJVZpTfkTxJZgLs
         SuIYI7bJvWApCw4wvvO6QEVotVJnLNN0pCQjNw9EuGEl9j2Q7IBE0qzuo8T3YC5SO4Hf
         9gLJ60Xp8jHn8brHfe2LP29vGo2bI6XStcxgFGcr9WYrmgl3iED7o419Oexz1WgxFTFv
         v6Jk7zsoui0uKU9dn8MB1qh1OAQO9z2wuDq7yThLN12BwbxlISzGUxDXCtlKQocvQuRl
         chYA==
X-Forwarded-Encrypted: i=1; AHgh+RriyMQ17VP6JQu2bBBgcTlh4zywTir3QDMogV1v7wf+PSoGtKeQxjv0am7t+BerwX768La4elLqhPDI@vger.kernel.org
X-Gm-Message-State: AOJu0YxccJy5r44CYk2KBIuzo3TBwrSpadaEurKR2TuqUySJmiJReO/R
	xPAicbM59BHZdEhcfpPnme+AQG4g2HbCmwehYrkZNUxyFlovA7YgYuQJ
X-Gm-Gg: AR+sD11q3fzfapr66Qn3+WJ9VJcxnbnqHbc09L1+SywAAPVIBZqszc+zlFoRUlBrAOX
	iiVSMYMbWDqWmAQwIJYn05Vu7JBJc1WcC/emyfccnU6rYpYF1Ts+klgp2EXtoVExuomIJkXTkkl
	kco6FBXGI/EyYOvUch8W15qjO5mRjrgLVSkfqyuEm5IenOtsfUH5WFANC2ntdATfgrE150JDvut
	MRto514DaF+/c8BCmAJGFEl8khmHS0DBoH68vf5ARsMGtpUKjz1JQ6y5x0EDTaZqkG3LNFSyBux
	M3MWjkM0+ifk9Piob05DjTK4oCGoSXrHV088Eq5ES1Qt7aRzP8zFtEx0Q5smRwtDJjed5mMamvU
	sdKfq9MM4RNuv/ZVv/TwhIexfn4g1qMu4XH9HVoqiPfG3UJHSBXNW/38uq8j/h+GPoaQjGEPVsh
	Mz66R3NwQkMJ+6OSecoG7j/6mzsCL9nPyuAIydfmoiyE//OMTRktTe0kdgq3YAyL/EFHQgDBTO3
	2Vx7fHqxWQyQceVl+mh2hgHnYazaBy1eC+jj4v1BPleSKZb8A==
X-Received: by 2002:a05:6a00:808:b0:847:973b:3cf6 with SMTP id d2e1a72fcca58-84f2de720c9mr22542758b3a.0.1786091521938;
        Fri, 07 Aug 2026 01:32:01 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a553071sm627409b3a.43.2026.08.07.01.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:32:01 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] ARM: dts: aspeed: santabarbara: Add JTAG GPIO line names
Date: Fri,  7 Aug 2026 16:34:06 +0800
Message-ID: <20260807083415.672008-4-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
References: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Label the GPIO lines used for the CPU JTAG debug interface
(TDI/TCK/TMS/TDO and CPLD DBREQ/TRST). These lines are driven from
userspace via GPIO bit-banging to emulate JTAG signals for CPU
debugging, so naming them lets userspace request the lines by name.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts  | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index 04fa9a5e0d04..9d334a01d407 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -199,7 +199,9 @@ &gpio0 {
 	/*F0-F7*/	"","","","","","","","",
 	/*G0-G7*/	"FM_MUX1_SEL_R","","","","","","","",
 	/*H0-H7*/	"","","","","","","","",
-	/*I0-I7*/	"","","","","","","","",
+	/*I0-I7*/	"","JTAG_1_BMC_TDI",
+			"JTAG_1_BMC_TCK","JTAG_1_BMC_TMS",
+			"JTAG_1_BMC_TDO","","","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
 	/*L0-L7*/	"","","","","","","","",
@@ -1911,8 +1913,8 @@ &sgpiom0 {
 	"FM_IOEXP_U541_INT_N","FM_MODULE_PWR_EN_N_3B",
 	/*H4-H7 line 120-127*/
 	"FM_IOEXP_PDB2_U1003_INT_N","FM_MODULE_PWR_EN_N_4B",
-	"","",
-	"","",
+	"","JTAG_CPLD_DBREQ",
+	"","JTAG_CPLD_TRST",
 	"FM_MAIN_PWREN_RMC_EN_ISO_R","",
 	/*I0-I3 line 128-135*/
 	"","","","",
-- 
2.52.0

