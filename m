Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705A139D6D4
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 09:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849478; cv=none; b=JLlmzhxZS6PmG+GSqiUs7RdHfgVEGsvGmw4AxNY1pA529xy8FSkY0sD3M281obhZ7rWxbCdzY/Ic0RWdiK+OAHkOoOxvP/E2xdKWogRpiqIAbaW0T5laWQ6B5iU8QpxSRJZraHYTGZixytZgqNHmRj3BX3OzlE8MipVFoEJcI5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849478; c=relaxed/simple;
	bh=7u1MxAF7Cm+8Fvpmgb0ZciAKGCBJ6Tnc1FxGjq6e2jU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JMw3rpbCyZXPXtnv++ZPIuhTkasZ+dpsM99sIAZz5z3T8AkapJ2XD2CEwAifakVC14aE+WlE7FfxpvtwW5G4J08g2tOe3cLIZ9w8hPHUqAB7XlYLVXi9auYxPsxnrVS2llJg5oUiiRu3NVCWqEU2IYsgHnfKm3nXTNCG4WXlycE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JM5zwf8D; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JM5zwf8D"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so1903118a12.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 02:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849477; x=1784454277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsJU27Z561y3XTmKXQzrI5pSnWmaE5x+UzAWrjuTKgQ=;
        b=JM5zwf8Doyq5ovy4eA2lfR8VAieZpGm/t3HvX6YBPqmOofa5zjQpZCicAeTQOF8ZW9
         n/mmE2rdSa30G/0Jz2OdTv78okxMahPsJZmTv6mqxsP/rtvUnTHbygiNoeHLnl+WJ/aJ
         GJJktRu0i61SSVofmCNzcr7C32w3AXzClE4Nf3HalrLY3UNBgFNUMG4neWpMY7r1CHbr
         lG26eicwW1nyrqE30YYXdu/VuUCa+mVDV+ifXpJSCPIziPzbl0JG5CAQT+OQ/rqsZ5rr
         dxELZDJo4TDcqsAnHlWcD6hzvl4ZiWp9NJdWzPhZG/SSk17fHAp9UAlSVLFsqtoKYx8q
         fkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849477; x=1784454277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NsJU27Z561y3XTmKXQzrI5pSnWmaE5x+UzAWrjuTKgQ=;
        b=XjOrYHUpf/h0GISlbKuZtJPD75aXd3GPWp7rcuHmioM090+4nxElBHFAUdNssaj5cI
         8awqD+XAj9jCZZgZGj/7maZ88iZdUiqLfXTRap52au0AaqzR/4NP11tKlvHRnqja1iDo
         vC3GqYGR9bBB+HKeuYxJepBoQvNZMmgeM1cUnh8Suh/cyyLMZ2GGauqPwX6dEKwfuIX0
         3R77xm2TsliCJG9AabK8JySjUclgZyFWS1Be5yrJuu4DHwuX5X6OwkRPtc/vozj1yJ6H
         UdCszDMNU5+dGiDPFn15wsuPfqFG5oZ4ZpvUYBc0FJprGLSksja3B0FYovWYAuowJyR5
         i6CA==
X-Forwarded-Encrypted: i=1; AHgh+RrPQN4AqKEI9jvcw7eCaKlML3vt0mFp3K9fs6bigf6Fc6ETKL2RYu+Rtj3fdCuEg95j7sNqbbMcTKD2@vger.kernel.org
X-Gm-Message-State: AOJu0YwWygNRbfPp2ERYOUCKw4Mteov5YsO1LrcLK3feHppZyA9k/4Ri
	nIhhobYUq1UVdUgTXWolvEgmHvTghPm2n+slAUqG/hEi77AmaeX4vqV77+5tMA==
X-Gm-Gg: AfdE7ckKY51Cm5iebAPvHzHirRC9Yo2n+3h4Gd6iWk+IV+chE+6blwYDMTnROp8Ofje
	btDkaOKP3oFAh+b6bSu/UWcXPiHvd4RV9W5H8OvQ6wDLphPdaGCT06qPZpRv+46gna24tsuJbYJ
	7sY94zRgWfXxAOeP7ZMbFB4drCO8R0YZPoIBZmq3fBVUsKhZxFQM1mbE/2bPQIcSiaMi09zXn3i
	M57FnUX1ZTOup86iZpl3ryjto5hgW9ODIG87yXJlwHMFWIsxbcfnRIrhWn9y6NFrOThFjHfWk3g
	earxsDsKIhZRVUI7bDuIDBjrTrUbVDeuKI2HA6cabgApZB4uhBRYmLLPGkfsJWBBZ+LBhi7SgYj
	Cpudy94V7cwlTXb4/OGQPBJs09kfr3Y1EdYItVWRZMKmAAPdEMfmYR82l4sHd1TFmz0850fGr05
	JJtIbOn6kaNFL0hSXdFsEZLJk2cRfutBqxx4Os6FulfCFfFgh5vuIolquo3CT26VwE5wnxM1fzU
	XaQ3SNJpFnPpsnPoEiDRckDYfZlOvtVQMS+CKkxhhu12apbhrfY9L2uKRWePOYN
X-Received: by 2002:a05:6a21:3991:b0:3bf:6363:11ec with SMTP id adf61e73a8af0-3c1103cf75amr5286669637.34.1783849476910;
        Sun, 12 Jul 2026 02:44:36 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:36 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:25 +1000
Subject: [PATCH 06/12] arm64: dts: apple: t8103: Add common SMC hwmon
 sensors
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-6-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=535;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=7u1MxAF7Cm+8Fvpmgb0ZciAKGCBJ6Tnc1FxGjq6e2jU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU9ucqn7PBXrmNx968SE4F87GWuiFKomiFjozJK/0
 nV/ZsPOjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFRHHWb4Kzfrg2/M32lJtzr3Scty7dX5f63uzFltiROa8y5u2Z5zXY3hn5lN3Z6
 vaX2H1wvwJX7p2tvj++X7loumW6u3nNrzXn3qNG4A
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon sensors common to all SoCs

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 4d6a0411f086..5b68bf0df4e6 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -1250,3 +1250,4 @@ port02: pci@2,0 {
 };
 
 #include "t8103-pmgr.dtsi"
+#include "hwmon-common.dtsi"

-- 
2.55.0

