Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46082E739C
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 01:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784769881; cv=none; b=XVFSjVhJcpG3DwelT9xwv0GInKkFgNQEeI0zQ+ukuV/wrtX4nAXAWjYG8CEtKooLy8zaE6cwIuFRtiWJ32sN3vx9QLtZSxiauMZGniBdFCNezbMWz0YjdkUGUp2kTJH4WxUT6dTl6OIo6qAg+cyF5XtllmIHIn/SnwaIEU6rWh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784769881; c=relaxed/simple;
	bh=wgB4PIrpr1YYgW5ec9JpjdnWXn1cEPDlUN91lmzw3xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RbqjhhqCZQq1xdISGdPE+kb0vsNNoqRqhtofM/AwZ+ySXFeY2+kDpRaGwC0N1xhrrptiowAV3xnBKK4pr+QJAd9KmBr79IXFJV4OUa4eW8fxg60gDQYUAWnH3t7eaXT0cR1l77Fndz866IzMEZxoy/jgLIdByeGIY1Xjrc7jyJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmIRASzk; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmIRASzk"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-668296d0ff3so68923d50.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 18:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784769879; x=1785374679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+JKcIPJqaMAyH6OdXJ30k6mM2iyhDEyD4OzquhdMaNo=;
        b=hmIRASzkNPYlJUbqS6JqLggx3nquS3waVWA1wnAdFZgXPPTki9fvT5hGPA4lTT+mng
         4aOwoTGmOwgfHWeVgSW70kbJs9kNUyZx8RHoCLvq64c48eh/qIsPAe20gLxkNldy3gvF
         3YV/J6dDP+MSCYhvPnRt4qpl1np8N/wJ/uQ59bVZqN+ZO6V+TNLR3Kw5fXILXsdOJT/d
         44pXX89JobjhfQclKKQdGdy6CEpoTx5TjL8mmXKFcKBUG+/58a89P8CAoZf9SXzayZPJ
         +aWBigEQM6kEzGM5W7tR2R0n16DhjBG4PFB0SOuNFist6Ish9ioQd1NcxmSkvsnmJnxI
         S6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784769879; x=1785374679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+JKcIPJqaMAyH6OdXJ30k6mM2iyhDEyD4OzquhdMaNo=;
        b=rv2sWaAl+HgJ0ZRIbfISz9lO1t5WKL++Iav2jM+ZjQ/YQR5zBX2v/Dnw/Uw675OMuO
         svJ4XmJPIzeAdDXoc8MqlwlzgeXCQwp0jE0H2uXX76aRVLtUSRzYCjhbRBZUaIyrSAuM
         mJz3CvKUH5sMLklg7oJeTjbTTgv3lellmrqTvRijJ9OtiOP70wdfbnxDt/UzIhCe7vBu
         Cokuk/BvnM2sYC2zRYE/USBXlw1O9UD+ToG3JIkzrqfTHg/dzLNu1EGyuDxn7Jp2DWoD
         eWwETv4rJkEneLTbDHUE+XtQq203/y/NvVEqtRm2+85eVgkXX+tHY9H2CX8PxKabFqFK
         +Y2g==
X-Forwarded-Encrypted: i=1; AHgh+RrUEiFhDw6sm+vrienj4v1oxxiWce42ficqL3PX7xj4Ua99YOBs0ZhYdsaK0FHDvZLb539MwEDjFpJP@vger.kernel.org
X-Gm-Message-State: AOJu0YzhlnFdudCCC3/WfA+p/8YGK91hKK4iaFR5G7Kp3T2nJh1vrca4
	kpQpkPHmgl8lyQxECSsJ/rDYCSkTApqna3jFPKuECMAc6LSXuUWGA8sK
X-Gm-Gg: AR+sD10eY2yN6+TxaaTKnp/yn7WTKrufKbWDoeZ4pmjun5ZwRLfQtAdKReqHxtHq1IF
	UM+6k7YolSft/iM8mzoqrN074G9u4gU3W0MWZVP6bOTGQfxUCUtrV7b/EHgN9+ZJ4PMoPcVf3AL
	aHs6wEd851WjhXqwSZJksiI2oNCYSREp5bGGMQy80WmNKN9z0kjcvJCD13s1r4l2megkEEKTY1T
	X3TxwyhJ62YoN//i+eQ5TNE6mLuEhqWMwCbAgPpheeyc+aK79QWcb0efy0Tw7fdiTP2Jk1PpsrK
	noBJkAYzGWr9KJSPhDFeYIL7LE2IreEOX+grWGLfR+sMKF05nDzhW82I4T4UDvwrMkIKEAwh3SD
	NTTRxUpVOLB4ZiVPEhrhmUDOES+lY5VzwtozvbDNJQEEkyerWiwiA+83RAIkpzvLOdRCa/youzM
	yQWW/15Sp0lK2JUZMg9GEIKJkU20O6
X-Received: by 2002:a53:df51:0:b0:667:c93a:82e6 with SMTP id 956f58d0204a3-668a4cacafcmr225650d50.44.1784769878921;
        Wed, 22 Jul 2026 18:24:38 -0700 (PDT)
Received: from karli.attlocal.net ([2600:1700:7270:4eb0::19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66890521188sm2310775d50.1.2026.07.22.18.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:24:38 -0700 (PDT)
From: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
X-Google-Original-From: Aneesh Pradhan <aneeshpradhan@acm.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catherine Frederick <serenity@floorchan.org>,
	linux-clk@vger.kernel.org,
	Aneesh Pradhan <aneeshpradhan@acm.org>
Subject: [PATCH 2/3] arm64: dts: qcom: add initial MSM8920 device tree
Date: Wed, 22 Jul 2026 18:24:30 -0700
Message-ID: <20260723012431.48499-3-aneeshpradhan@acm.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723012431.48499-1-aneeshpradhan@acm.org>
References: <20260723012415.48288-1-aneeshpradhan@acm.org>
 <20260723012431.48499-1-aneeshpradhan@acm.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Catherine Frederick (coolguy)" <serenity@floorchan.org>

MSM8920 is MSM8917 with a different RPM clock compatible (IPA clocks
present in rpmcc-msm8920). Start with the minimal SoC dtsi: include
msm8917.dtsi and override &rpmcc. IPA and other 8920-only peripherals
are deferred until their drivers/bindings are upstream.

Depends on the qcom,rpmcc-msm8920 binding/driver series.

Signed-off-by: Catherine Frederick (coolguy) <serenity@floorchan.org>
[aneesh: strip IPA node for initial upstream; rpmcc override only]
Signed-off-by: Aneesh Pradhan <aneeshpradhan@acm.org>
---
 arch/arm64/boot/dts/qcom/msm8920.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8920.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8920.dtsi b/arch/arm64/boot/dts/qcom/msm8920.dtsi
new file mode 100644
index 000000000000..f2747e5133f5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8920.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023, Dang Huynh <danct12@riseup.net>
+ * Copyright (c) 2026, Aneesh Pradhan <aneeshpradhan@acm.org>
+ */
+
+#include "msm8917.dtsi"
+
+/* MSM8920 uses the MSM8917 RPM clock set plus IPA clocks (see rpmcc-msm8920). */
+&rpmcc {
+	compatible = "qcom,rpmcc-msm8920", "qcom,rpmcc";
+};
-- 
2.53.0

