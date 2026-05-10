Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091F537BE65
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 09:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406484; cv=none; b=gWdW5IWyn0OYJ15zMqvVUXMIJWlgbYvGBx1Hop0XuVYIdrdZcg3pbQES6OA1GeWLcjjYQlNXfTCDjIYhDZUT3OQ9xSG3aYYM2ycrTwSNBeL8Wey1jdyPlZ7yfkJzzdhqmWKBV4v2V17KJQhpNWq6oYhcXGg51OwlXQDW94stfq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406484; c=relaxed/simple;
	bh=16AoPtmHTYpJSipw80SylHAI5EPglqbbZ9EkozbD51k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NM/ccRJWSnJ3es+eZWVUvutW3/ocJL/U4k65j+NnqyUq1e/mRvOvW/pKhy+axstYRM9tmc6RQzFHyN1Ui9Yf71BymBSxIlwC1iSsq3HrBe84mTJ64/AM966QE19jme96dmB5RE95pqj0wZQlYsppTXCOQC2/eGtt0XBvRKyo4SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pgf7kvMm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pgf7kvMm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso31709145e9.2
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 02:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406481; x=1779011281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=pgf7kvMmVkYJnmNLJoIUPvxtNlJMODYv2qv9olqLxTA9xJ34iJzlzS3ckObW5BmLA8
         9KYGhGj7JH4bHoo1ELMBamLipuaOrrc//AbOesrCHKw6rK3wroS/8Au3IFyj4F/ut4wh
         kvJPZTQmDF0FiGuL2ZUWB2UCCRRuaAK7a13iqSx4O266oQH4FbK9TBjaTIppQkpysCtV
         hc+/7vwyovW9HkAdM46eaTF7UHAdamEyTHgqontHzvzTUC2tEWi11vuKijxJED9445u8
         YrtkjCkyGbrMuIcMJBf0tqa9pD9Sc3B3s4oWQfUfoIKemXWsGIq6cRmZHeZC2soIZzyO
         mElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406481; x=1779011281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=Rzva3hqQYzkLxYDCgLbnoD3j1L4kWUOUum8vLq9/yIpvBPYX3IPyMUdA1Qpuw7VwJc
         k0fA+Zsrl6dBsHymoatN8v+frebdxmkBYIHfPwogyTA6jkwsrQ7qcbEt0vc6u9mVVuON
         FEnGTsb9yrFvqa0+pL8D2oGFAf5v4lNoQzOqU7PiVIq+bI2TiJFHNuflRhRaSxI6waTW
         agLD1208hOEXoRo/KacqVm7ZaVwpDNfFFZrO+aTf/0utEfFjfSsKfHRcsyT3+d6KRkhM
         Ysehrm4WfppoQG+vxLtGbt4UH1brTJMeYtbe9+zAKc6z0e39WuYwLCLVwFKkGs27K2N/
         k1tg==
X-Forwarded-Encrypted: i=1; AFNElJ+LnjHdk7Dthdu6J0kTatawWA2a9UipIzciIkCLoIj/wU8zCGVo34uRkN4ul/XLd2A7cjdW6AzgBNVr@vger.kernel.org
X-Gm-Message-State: AOJu0YxkkbO0UbowpeKfD8d0EjIwRCZgrl16mg71rBzp0mGuNmVkuMLn
	AiW0xVR9igD5t19gFD8gCz3tKL66RMEW9kwjZqDK70btVvzn6xE0Nbrn
X-Gm-Gg: Acq92OGjdsL6bJ6t7u28f0xllNyviByKdd3AS0ZuQS2HkSzwHVNRrgZmkisswma65Ub
	eNgB+WWnRzfxI8CtlUPB4kBtwTNRhc7IW0CcqHGaXi//roHXgfkJq/TgknATrDIaLqFLeLe7//K
	MYweOyfeP+Ypmct+GvFOOday+4EEPFwJUCbkh4Fx/uzGC89UylMwfQrblo7s2ZUsTUmzMTHyody
	C5+KA+UohHqZ1Y1a4h/poEgmm9yl96PE2IsRTnKj5c1ofXCGsk93C6HgRFNrQQDztMegfkh+pO+
	f6boDSUc38xno/1xL4JlSbGX6OlB2UAruB0t9khM+so4QXm2YgzQ/w3IthaoV8W9tVHwxhxjngH
	HzR4r7WNTFQo5/F5U3MR6oFood6cP7EOj6WsefnhBQ3MNneOuzoxv5quFyiX8MS3v2eafXBbo8T
	iym3VVKXZwftU5y70K7HCYc7X0p++Qt6jfwOjm5ok=
X-Received: by 2002:a05:600c:4710:b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-48e7854162fmr52680165e9.25.1778406481389;
        Sun, 10 May 2026 02:48:01 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:01 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:41 +0300
Subject: [PATCH v6 3/8] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260510-msm8939-venus-rfc-v6-3-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Default paths for firmware work on BQ Aquaris M5, which means
firmware-name property can be left out.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index 13422a19c26a..48514c3df718 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -314,6 +314,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.54.0

