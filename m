Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1089A370D4A
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 12:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217860; cv=none; b=Ew+6w3IBOJOSjO0sQNr1gqN0igYcYq3O0yAhUUvi5ZcISxP8pK65mxNyll45oKz+MICqsHnZ20UJlx2iGDr/a+PXrCaJ+N2OgFIKQH1BVHTh15uCXtc3Exrx3dBnwl0VIJdGQhanKbei131fsONlKPMx7J00RQxgjBdpPkeGmx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217860; c=relaxed/simple;
	bh=++e5FZB0tsvADRX7W3I2ua7//VvtHVnA0IB0LJVNzdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b8hniMTZ2ZGZoOmQUIvHKrNYVfvB4olGPkv0XgqgwppMrM2V0fQZ9kOAJb+syCfFcCR3cxZNx94aIhQqYvur2wq6o5MO2iEDIHxBOCwf5srSkGs4ocR4QNODkWx5KyXry6hfX09gWxbGfQfaTFt7fPHpb5xv0kojxf3Pw9uJeSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ClC5lO+L; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ClC5lO+L"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso18447265e9.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 05:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775217857; x=1775822657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjyHbpSUyn7H1fP6Lf1b6SGYz/5Pq+5nMg5uPxkZH/0=;
        b=ClC5lO+LL61GscOu+clTBtO3Jd3xaQYRiO/p7UBD+4eQXt/0WuFIYsEI/yggZgVPlz
         7a9rwINt3JxoH6UFLxzRTTTHQcRqsFHJdo/ORkQcg7NYnbz5nreeywdObkgY1hNzN8JU
         Ri3B5bQeGfO60vNABMXSqRSatCj4ROGrlqplze7qF+YBVC0sPw/r9qJa8RKA1HzWTbsk
         sqkjVHkzc/oIbecnIlLRt7bcHGlzGDnAuRxBvN6HZVdUMIirOaU+0OiuoT01zDNeRwcs
         S3DjwEItzFKg4n8Onoj7sDZ/0E5PG82e09XSzNvOKnsOsIoh5V7d1Q8oep+kM90OIYfh
         Ofow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775217857; x=1775822657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JjyHbpSUyn7H1fP6Lf1b6SGYz/5Pq+5nMg5uPxkZH/0=;
        b=kGxIIuHmNTt8osCVBCUKECtdm+yMd3+WxAGC8uJCgq5tfeLamd+tZDA5DSJqju2mZV
         6zFUHr5qqcjGZqWpNCOx0T0kNSZ6scTyhObNrTp/gr9CGA1lv7miNvpSInF3dr3wF+3+
         OevoEfC18h8sOxTmTk08E355QO7og/jfs5kf9GEeRabXV3WRJJ3i0tgho0moW6Pxql6j
         ScrKbSPfJhu1N9A9rkp3KJ3Rr8CSTIIBoyYZXOAWFZcA8Y7wuagbENDsQlzrM3AJLLjc
         9gF5R1BlmP0ehC1SJ6kmLmNOz2AKgGYMY2oKXp+ykNeDU1cwdbFJK2qd/xb6ri/UsLFJ
         skEg==
X-Forwarded-Encrypted: i=1; AJvYcCU45LqMpxQWnU3leLFCQNhLVcUW+82Z9nMG8BvBVORmEAIqFmmggUuS1zPnOzYFRxRd7+hMaYEPx6rY@vger.kernel.org
X-Gm-Message-State: AOJu0Yycg/42NSM4nMEdCGJV0UNBZ13TUq4WbzmoUsOT3vqhRem1anMx
	45rS0/6pH8eUjYz9SR8Mj7ubL724W4QqnUzM1CTlS0Sgqida14NSZuiP2h9CJAD3ozA=
X-Gm-Gg: ATEYQzznBV8+7L3XFMwLsk0oV9nbhuY2Te1gNxGm4n66qV+lvITQJRjmlOihNN9Q7It
	lbf6ByoRQVp1oyHdZD7OaNm9tHvD6x3M1Mqod5G9uJMqWRH6Nf10rYypV73D2ijq3zVo/GZAkNq
	ZcqGjwqTJLq8H47GZFj5Z7WNXsaJGc/+mG4Q6sEe7pvWg2Q7gkSEya9etEIvArvPfm3gp44hONg
	r+451m6k1vb5FUgMwP0heJyCwmjpFyfivkF6ZVCiWPcw7353Q1ArCJURbtkrpEY4scHmytuGItF
	LG3f+bKXN0yKCgoCqTDOua6puYzWGmYGCWTwbogsXPkd5Q1w+CqQhf9pmt0EMgM3Evbh4R+qoln
	pOAlQbdiylyNZfKr+JO585KCkCXmCrkRAVqLNQlDf/uOkOOoMDJYSqwoS6AsuUTgGwBQodnOg+/
	VCpL1iWWgzetnEcN7ZOacJxD9xH4N46/4hTg==
X-Received: by 2002:a05:600c:3b18:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-4889970dbc6mr38933115e9.10.1775217857503;
        Fri, 03 Apr 2026 05:04:17 -0700 (PDT)
Received: from [10.157.142.139] ([41.66.99.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm300193995e9.0.2026.04.03.05.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 05:04:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 14:03:48 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: milos: Add GX clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-gxclkctl-v2-3-95eb94a7d0a4@fairphone.com>
References: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
In-Reply-To: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775217850; l=1066;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=++e5FZB0tsvADRX7W3I2ua7//VvtHVnA0IB0LJVNzdk=;
 b=bnsAXx5MnEBVpdQhExbmj5V09OxSu+2XLfAK2X4UgoO2d5cHMVKQ01e3yJrzj0sr4nYMEpqNz
 XwrlaWKUKJFDhodt6a6OQL7sfSb4NWw8SfoTXVYjABt6ohGoGvdxwNb
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the GX clock controller, which provides a power domain to
consumers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..4bd9181ca03e 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1542,6 +1542,16 @@ lpass_ag_noc: interconnect@3c40000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		gxclkctl: clock-controller@3d64000 {
+			compatible = "qcom,milos-gxclkctl";
+			reg = <0x0 0x03d64000 0x0 0x6000>;
+
+			power-domains = <&rpmhpd RPMHPD_GFX>,
+					<&gpucc GPU_CC_CX_GDSC>;
+
+			#power-domain-cells = <1>;
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,milos-gpucc";
 			reg = <0x0 0x03d90000 0x0 0x9800>;

-- 
2.53.0

