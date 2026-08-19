Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CD247CC8A
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153185; cv=none; b=VFfZu3VNyl8W7yX4s/oeZuQ1saVUVHyFawtxysJ/ejYSF3/nT8Q5Tp5AubtervYC6bOVEgO9OhsUhuaIrVMBj74Wb0bp4PpkYspI6m4M531GbpBpmqpD77F/xa81OvG07Sg16GCqon++PSgIQ3uw9UkbeULlwY+KCKR6Esn/+Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153185; c=relaxed/simple;
	bh=LO0HNWJQ2iffOvEO/jDwBG49x7KRRSW4adIk00h3Zhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PwCc84qoYRRV+rZAE6f0x/pQZSV5V21gR5k9NYKvdCeud07vvnT6nF3IVpgRh9DWkAGLaofX+VRjXE7NtJcbmG+EkfDYq0us5n6hbB0bayLCrqSvKQV7Zgk3tK9o1DAmXb+xgrwRfPJbEMLnvRz8anB4tRzyZmRuhceNHDQPavY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7aY7Iho; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7aY7Iho"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ceb096e675so13847605ad.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153183; x=1787757983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=g7aY7IhoWH17JpUNcjcKs+MCuglJkwbEH9u44EEa8pgZOMoo4BOfUV2doB03JjkRp6
         9EN6qG7KwPXTU59YzCNPUsKbsrIrSTe7XzzGZacRucRoLiqn/mjxoUkjNtoeQ4s6vett
         TcLsbpEWNXOifl1aP+jJzKOWF5Hmp8jeHGC1HVrsDiV1cXv0icXkiab4c/387OmSpT3g
         6pU9pKX1UPG/uucOmb23yS9w6G8xfdudzWvVYOE3dgqCTeOFQL8vlP+/l2eURAaJ1jGO
         vt4lIt6zJN54ILW6inO6PJeUI2gN8dB4GLb+orREpFcIVTwBF43G9tq9nNarg03Qv6G4
         sdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153183; x=1787757983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=XnYS6ZnfvBLTwpnO2jIU0l4oT7xwGV9yiHNCiLFScw3eJ0vynr/a1OwRhcCyqJDxGP
         J1vLSgLoBJLjm4WWlSmVo4Zt5Neod1PoBsJ7AGsCDWgt9hTp4wscNuHFo9nAqU7Y0wSf
         hrtHihnch65VnwbLTFT/USUmPjpsH1rShTcteUGbVs8IuTGnjjTq6EAmxmxKyGl4Htt4
         5gdTZ64p92fIsPiFKXPFvR7hHGQfFYqY7nm5DHnaLtYokbVFzEyZ12zSOKjTE69b2Q6V
         u5EdMNlI2bWuAoQmFqK9DDNiHThKJutYGGNrWmHQ5h/BrTOXylgwpycEm1UVR2DLjmGq
         qH4g==
X-Forwarded-Encrypted: i=1; AHgh+RogC8SHZYyweAgl1TiRcubTBww61jtI6RHsP5CDAWtcfruARF49/+EL+vz9vaiTLCDciTa2FRKhin0F@vger.kernel.org
X-Gm-Message-State: AFuF++lLFieWrMzVR9q+6PABUc3qIFrZxXMWG3u3CwbNKVn7xUOujkbW
	Fcd4mcRnlIXpRCbFZdPdWORA3AJUZdc/yN6wfPsnVxij7oYY7wHhzMkU
X-Gm-Gg: AR+sD13aAzXjXrOSbYK9NSngA2IQUCoqch2QhNC/OewLs/E8/Et2+SeeVynl9oWfVxo
	+upL4ij50WQV8RpofmAfHq2VFSx26xvys663YS+gKwe7eXI/W7jG3bHqSNWWxmtEhUmmLjANANW
	EW7+O9IJUBr61ow2LRPlU3Ty6jys5XuMQFX+eVlRNXrPt9Tcnvg2fahM7Hbeg6Ibrro2OyAGajN
	r3HCRTxWMnSp4Sj68SH9kXiEzXLo4n5IayYkRPd8I+5cHusAjmOeKH+5YznMUc1VizwTC+HoFXd
	sN8zg3DYvaEwtDfhZudkl7mYcHOMpdcVwpC1ueJOlHsc4IpTq1U9JUXFUOqxYoKip4T9DgHeLbU
	1500ctV9hBTCSSHvPBY5TaTnBNdh+jQJxnvBerWN5veYq6pvXtMCnVuQm9IZypZrRBAF2uPQplb
	V1+yL48AY1S7zmQK7hQttf99FvlDa6PHDV6VvVOntPbiHkLVzl536C+AvWMLSLp6b0RgL4LLSFF
	52eqCnbw8M=
X-Received: by 2002:a17:902:ccc9:b0:2cf:82e6:a5 with SMTP id d9443c01a7336-2d601665047mr110683615ad.13.1787153183240;
        Wed, 19 Aug 2026 08:26:23 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:26:22 -0700 (PDT)
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
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 01/13] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Wed, 19 Aug 2026 15:25:30 +0000
Message-ID: <20260819152545.3934-2-sreeshankar0910@gmail.com>
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

Add the ID for the Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 2cf433f61..b63e4a0b8 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -209,6 +209,7 @@
 #define QCOM_ID_IPQ8172			397
 #define QCOM_ID_IPQ8173			398
 #define QCOM_ID_IPQ8174			399
+#define QCOM_ID_SM7250			400
 #define QCOM_ID_IPQ6018			402
 #define QCOM_ID_IPQ6028			403
 #define QCOM_ID_SDM429W			416
-- 
2.43.0

