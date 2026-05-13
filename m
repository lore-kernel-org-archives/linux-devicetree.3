Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3558A3AEF43
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 21:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707567; cv=none; b=tLR8zYzMnR/vj/hJLsmcE2fwJ0L+Mo6YqtYuyuevmak1ttiRKW2w4ogod/ZD3H0Q6GCiLJHTLz3C8bFmPEVErVXMZxdbUAIXHWyDPPCTcMraTybKSxFP+xivQVqJA+fhgZi8FXT+d34EY2FcG6/Uk1vLAzS6IPFAsKqsXaItsOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707567; c=relaxed/simple;
	bh=16AoPtmHTYpJSipw80SylHAI5EPglqbbZ9EkozbD51k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZEb5a01lMXSf4qlmOWJTsmDVwSvldc7y/GC8MGRVR5jfL0FaZAcw/1TGKZ1yLYEhjXjpbhTKjxDEzHbvrI8LZ22/iDZrSEwEz7VKX3Fjw7G63POb86tdcn0RA4FY02iyulat4A82a6PfOani2jhMX34wEgfR6ROHktNwTjRHpYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4WszTQa; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4WszTQa"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-65d071aac6eso7190116d50.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707565; x=1779312365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=Y4WszTQaYDwELOKahunWqnk39rKIg/Sdm5s/WIdSjwVq4GFlHNqtIrfIrjYX62aW18
         ZovOi/8GLTSnNnOrpxy2pcQjHZJZ1CnWVSGcv2YgiQbBMTq/UollEjKb16LzXVC8Zj0l
         qWnuHNNLLYReHRMj1nwijKi09wykRZQJ9nPK6A3H1jIYk+nQbG3IMhdXxJCobOtRp7o8
         WT7Z1GLYsaf93Q7t9WbQ20ITlPc/rirf8xCz36UjKnUWIsraavEQYRnyVtVw8VtYK5V3
         WpZ0jTBN+H3V+FM/sBERnEDrimmAFC1ebVP/J7oZpJ3Bffj+WIZhLXvryQ4OgBBGyooc
         8bxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707565; x=1779312365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=ewsrildsVQmw+20atgi4amUgL8ux6X0LrNMnzfPEBjTNO9TfRf998dhxJPfrySZhd0
         jvRFYWCqSZUKXZOHxoaqqNdxxBFEuOFi823FCvztdRNDoytAj3yMGWJfTB161FPKtyeX
         12ox7c8UTGcEDuhYycZst9iayH4QqjLxjB6EUO/sRqcG6EHydcdpyIbiuWuNH/V6vFNS
         3iuHZMhifqFJbOB7eziE7RU/8n/4I0gNRDxUSp5kAMUnTWaCjg/40xBNR2643fCZB7rD
         KEuF1+V3+1P+ZfHZ/LUpfI3ajzZEOxODKA2FXjhjlv7XmfMNF2GAYbzYo4ou+GEtLfhc
         gWkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ZFpuSJqRok68+IjuVU84GbAKKPBAPcyUbOjeC3zo+S3CWnyr2AQF0stHSs3zUhLkv+iv4dIpwkdv1@vger.kernel.org
X-Gm-Message-State: AOJu0YzJf6DriOCNMNjyx5ufmsQ2WgCFOC5ATkw35zhFpth9qTsbO34E
	TK6jdw7x8kOzOB5wfAz7C/tGjrxbNZextezugkRegyttWE/SB/6V4oVj
X-Gm-Gg: Acq92OFI9Hmz7aBr0plGQjJyshXXN347TUvtWOMdRciM0gwXelytM4BfDB7kcZXXhc3
	JILUT6qadXsoBAqAmuOjcqh7LJn/kvY4y+3aGvflCYl2Q2YNnXIJ6VUAFMZo/GSEN84a7eOc8yc
	DeDJhb73Hw8+ujOqOKSKNQ+jqqHPe3wjPGpjIFLJMMsYSgSvmtH7ZMIC79d2LXPID2hiIaP9GpO
	wOUb+nHIf43PpPrILxuvO82hn5M2aRm0C2VIMemxEELYrDFgwmAX9wlIQ0VJrve/0VeoXfniZQz
	mT5KEyVDNzIFqNCc+IgklWgnmxdK5RFzYdKRF+TrhgMn05InE75Ai/Gbtm5dSFGgY08Azz4ySKO
	aZWaQr4Bbkl3o+TzaC2EDhrvpOnIuElbHdECWSCris60bTo66GtW3ic/jaaAX5Tw6Am8EEZS3ZF
	pWmHSbCCtVYKoq5xToCN0TpbbLwg==
X-Received: by 2002:a05:690c:ed3:b0:7c0:e1ab:87fb with SMTP id 00721157ae682-7c6da11a9e5mr45927147b3.12.1778707560454;
        Wed, 13 May 2026 14:26:00 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:00 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:32 +0300
Subject: [PATCH v7 3/8] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-msm8939-venus-rfc-v7-3-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
In-Reply-To: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
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

