Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E11305691
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 01:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771198; cv=none; b=CPmHxeGVea2Lk+pSuuArTCSn0flSHTZLnvdSi37HRdwWFF8b8Y41vvD5XISr1Be2OWsoMtDm03D1JupOwmPoh1CQsXiBCWxwUsJRPytVeonuQra4DRW0JO+KgPKbMKdfwpTFkEJ5HU8bYONe2nC3svKs987ku834wd3nKjgEsLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771198; c=relaxed/simple;
	bh=wgB4PIrpr1YYgW5ec9JpjdnWXn1cEPDlUN91lmzw3xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sV6LTKMavGjIWdTyA53bbL7jPapYEvrSfnVKOn63Y4nbfyIqbhHEgBAzjb/xzOBAFKnHua0v1B5P3nXYTGjVQmew+3zc52hOeWjUf9CADhm+PWeX35fRiTyHnBPWeLJQCkRaqvu6mY9K7TKeq4ygLpPTW30iddcTAxlngRO0Vzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oa/D86CB; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oa/D86CB"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7ff05e5d009so986527b3.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 18:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784771194; x=1785375994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+JKcIPJqaMAyH6OdXJ30k6mM2iyhDEyD4OzquhdMaNo=;
        b=oa/D86CB9+pJpks4qRYo1YV/GyId2jzZfPJbOTRC1teikO5Okr4L6pyDaEQd2G87Nz
         u0Bfy43RbI6mdJcx3jIy6RoTo5Od5+MDSHWrWuyaQP/14FyBF3Jqun2lmVITJrxq8HaE
         j9yqNlejFXlf40qb97/ju5sVLaizIC0aww/rWX85XfVaFAsShCMT+/fHgoNsqlBpxAek
         iE7EwbEr+evE8uNXF3eZD1txjb/lDKnd0mo093WT9H55D8jX2ZFkmW5SQ5KgPziuBboL
         Mv10kkEHyw28Y5RBLsw9kBvHE/LgfnPrUDV19H+qXooV9k8FkQtdz6pubd3iqRF3xx3W
         P3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784771194; x=1785375994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+JKcIPJqaMAyH6OdXJ30k6mM2iyhDEyD4OzquhdMaNo=;
        b=NftObTPiNv/aciIbjTEdERA59+Thwr2tIduE5K6UvQQi1OIone1gRdZZgg1m4wIEEL
         IpOPf0FzfLv+BcDVZ/5fAWgIEjLvNMGdGFK74tIN8vdmY+5o+ZuPVYKcXgZ/p07bpX2H
         YYRD+TpwOlPZDiwmNDo0gan6XihmmWSxf8ddB17jNIfJP2WXZ/i6i6bwxdZFp+/v56jx
         4H4iIuw4XqnU1T2pIwKqinl3oopC58tUPmlw4iB3MBwRttzO+bwOQl/BN5nZoHQZxw/E
         gcJ1GdW1BI3mBZ09F/AQXOlTAH8Tjrozhy0ejVhn8AovarZAzUliWpkfpXmR2vU4Z9l0
         eZpw==
X-Forwarded-Encrypted: i=1; AHgh+RoELW6zxaT3ei4GuSkSqhQN9DdeNcKwBHpXrW0MVsoWFFXSP+UKOezhGmpIvr1KgjWFYzKAE9Lbzo22@vger.kernel.org
X-Gm-Message-State: AOJu0YzkIR+cTDcXQzbPscQ5JWXyApNn2FECQr/TQwvf+gopiuioOgd8
	Pg5OX2wh62tlBOJ+Ehn8Xt8xtBM/HqG4a68vbVZQtqZi/rhKG0+LWtNj
X-Gm-Gg: AR+sD125xdpvU/I9Rq7hmnnFdYwM/v/3oVMbYO3AwYuSeF3Yszw44fCD+TSY5H8SjtG
	eH9Mzffs3EVZ/95ir3XvhqqQxVuvGdMt5r+dVV45VWy69sfioOVJqQaCeGCZ6F5h8sD4eC+MDjb
	ZuPWgQkQ3WNXN3P1GE4bPTtdcucSd3E9VgWM/OTv0IhXP9hoV0r1Oun+pC98y0aDhjSCkC3Lv0t
	eFOGwuoVGR9Gi0eXkxuI3jlrrmspA9uSVSjeEaO/tP2SqW97nG6pZFb59n9PM2BLjEYAamEWpbf
	nR4fWyUQY3ZxVoBrF6DyhqinKGKremOgo+BNIEDIilfqkGFK5id+05JPoCj0dPW0JC0jcnNB/HX
	QYEsIzg+YhP152Yi8OPZ558gPPYySp9UxAVhE1eKUBNtPY6tAttvuDX3n+NldsGXz/8rPe6ZHq3
	hEOdaZMYPeL/T7fL4bjAasW8giEB87
X-Received: by 2002:a05:690c:c4e7:b0:81e:8f17:a943 with SMTP id 00721157ae682-81f4c1c1dc5mr3385497b3.29.1784771194053;
        Wed, 22 Jul 2026 18:46:34 -0700 (PDT)
Received: from karli.attlocal.net ([2600:1700:7270:4eb0::19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33bf2e50sm22038487b3.10.2026.07.22.18.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:46:33 -0700 (PDT)
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
Subject: [PATCH v2 2/3] arm64: dts: qcom: add initial MSM8920 device tree
Date: Wed, 22 Jul 2026 18:46:26 -0700
Message-ID: <20260723014627.63310-3-aneeshpradhan@acm.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723014627.63310-1-aneeshpradhan@acm.org>
References: <20260723012431.48499-1-aneeshpradhan@acm.org>
 <20260723014627.63310-1-aneeshpradhan@acm.org>
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

