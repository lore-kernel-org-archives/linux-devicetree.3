Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0754779B9
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153247; cv=none; b=V59gyLe1fuuQNJEI6PBH03bMVxTgMslNyywvKdn/Dj/K+J2RhdOr+G/8v7Un3jbf9lMnm5YpYuUcoJVtoKp/7aIweBb4YdGncZwlEZx2YVGROEr9H4g3OxugNex+R9l23XCD/uk0n1+h0HlkzOSo4JlvEhf//T9YbEj/BrXBq+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153247; c=relaxed/simple;
	bh=WQnQ6/awaqesyO4FuxnwtkQQVd/qID9Itar1frdoCTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fv0zzZhwpRlJV06QxpSXHlGOYJ3OKw47OLwzk+kMyH/9yVSY6Kw3luOm74+0eMQAz34Yjw/x8QEs33LYfLtgc535NI2xnENcTe3X7GZ6NdMYTr2nYWVoDNUy7afyUfYqxSbH4tFzkn5yFZ28lYROgh704eHkykSzp8T79RFl2j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PY071722; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PY071722"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cacf197759so15181645ad.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153245; x=1787758045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iuOxCh9qY6VsPX+/asBmCdWifj8i9okEwYPqtY8odhc=;
        b=PY071722DAq2R/vNddLOemYNOfK6indS4JwbOCoDFBQa5278hSsishsukW+voyv4Q/
         gaj35dCk+/iEz3u8Cm5G7JcSeO4rqK09dibdU6f5PBezd8q4FUgFdz0wfHfvFLWSbtMq
         bnIe6Ze40JDJzox0bSkI/osq1Hm704FG68s8Syf00sTLlnRXOknKv+mbGwLTt+EzSaSX
         dSZza0u2orVT0RUPKkQ5MbUz3SCT+lCvaJhHo3Pa9Wr2PevM2NpaDwUCcnRdTigQYwRW
         o+972Tr/Ay+1312K66Q6yKWlz689OAatzOcF0SJ1NdDuhSXHKTSY5T6gvtzXs4R+oXsh
         ysVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153245; x=1787758045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iuOxCh9qY6VsPX+/asBmCdWifj8i9okEwYPqtY8odhc=;
        b=JnPEiqnaJPeuCWxnu2QuCTTx34Ggwp9wMysc/LpYLHHt55Oho31vuGIAZaV/j+JBj7
         Imz0KfHfm9xolq7dJvdaiAQTwnZ12B2e4PE1/tC7cCAGGEbtwl8Y34hEkB/z6IPBMXyY
         WG/HSvr1ZJBNJ0AXN+zf/g+EX6MAOasoXhIc7BTTdjE2ig6ga2V1neJIShzOS8e34nro
         k4iHcd5t8c9BlQRi36wNuidRq4xzULppnGIerNU7FHwCR+k2+qnlz/Qzu0A/tHVdc42G
         wEuqweSua4cA6NVUTFDbuDr6FGG7HajxdtxTteaIQFJ2TDkN1dhO4v5KlHOeJAbuetVx
         aqOQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWvOCBpNaOJwZ1NX1HyJbYUqQzifYxrRTmj2yBG8Z7v4lTYkMXL7XMhMOWgDQptEdvnQMp/0zKnEXe@vger.kernel.org
X-Gm-Message-State: AFuF++n4/zlhIoT0nOdiNRnDI2TVo+fw3F76NOLyO/rkTXnm739xrxtQ
	HmUc78hyxzP0N3Pe77ATcQcuZvvzDvvXiqUvSpKfifwaxjRWMhgG4w0U
X-Gm-Gg: AR+sD13u/T2G16NVF+Kls9AZbsBt7LANdKenKrPtw9va0hntig3yyyWJ8xAFWxGxWFw
	9HzWHevkRzMGPmcdcCzoABJWEbkN0u5ZncjA+oUUO4b06dUCIXZBGxhz9C++4SJX+hwPqKb0voJ
	loWkjvu7JYzM3J/aaMEZiEvUYFRgW0vZQceBThSEidaSj3LGC53zVlXUkwLB4wmAtSNBjHbeN7k
	MYMmC5Q3LyalZTovEDqG9dfyFe61TIC2gqHc7ZsEfnBNftH0aknKGg/8qXigtk60OPzvG29hMYR
	s8MfakAtk9vBpGxpxACN7s5LIb60pxnM/8n6h51DhPpeMCdhoO4uhTzkoemwwURy7OdO3y28OnC
	WHR/V5zEwiPDB/vInJ2VhqhKcOT0+YC5nS8wKgbNmuTLEZJM2/lYgXfExFhBXLeTgrIiiafpGSD
	7BQsnup6QXuwLwTJvpQE/U+u+Ol3jNenmmK2203saTb/IzvyY6xpmqC5LuNwGlg2BbfRcTS0LDf
	89+jiSXarGGN9pFQmFDMg==
X-Received: by 2002:a17:903:3d0f:b0:2d3:14c6:2372 with SMTP id d9443c01a7336-2d5fd684c16mr107853805ad.1.1787153244901;
        Wed, 19 Aug 2026 08:27:24 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:27:24 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 07/13] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Wed, 19 Aug 2026 15:25:36 +0000
Message-ID: <20260819152545.3934-8-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819152545.3934-1-sreeshankar0910@gmail.com>
References: <20260819152545.3934-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the RPMh power domain for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0744a867c..427953913 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -63,6 +63,7 @@ properties:
           - qcom,sm6350-rpmhpd
           - qcom,sm6375-rpmpd
           - qcom,sm7150-rpmhpd
+          - qcom,sm7250-rpmhpd
           - qcom,sm8150-rpmhpd
           - qcom,sm8250-rpmhpd
           - qcom,sm8350-rpmhpd
-- 
2.43.0

