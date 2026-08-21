Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC24842AFBF
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 08:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299926; cv=none; b=EKkaJ/1aFtblzIghuQZb+yRQ0tviQUe7dTPsR9sNN3EbUGfnwIF9MN17LuAimBwVQP2fJ3WaNVHpnDTCiXu0ziuegyuGicaosswZwaTSvcV4AXOT4/n98QAeLRduht3oZ2IylntpvDlih8N7pTmrTpVY1rv/GvLNt91HDhnpibI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299926; c=relaxed/simple;
	bh=LO0HNWJQ2iffOvEO/jDwBG49x7KRRSW4adIk00h3Zhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bWw/fMAPhnNz3LlrRuAcs4D3fSzmfKiolCBF2WPQtINvxPfb0NIb51LyJRyV1zIVClDdNZZeKqia5ynLpboVUPYUvxdI2Git87mUmHH8Ikx3WJvh8b1PqruRl+iopc/MtUCuYTSrZk/NfpsTRFvG5VOz4gYwWVSb/4HW6P5gsIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGq/HyY3; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGq/HyY3"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so604291a91.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 01:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787299924; x=1787904724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=MGq/HyY3MnZKxveRrcIzbnWrjqUppqiVVrrKF1KiHvkT+rXFPB7d6zL0V8Tatw2qxk
         kREhUP7ZryQUcZI9NByYfZiL1DqP1Yz1jtS5UBoG0CnerIF1t/nbD3jHW0C+xx/5DcXH
         mnnphyn98jfByy24RH990KdGKAu3Nw64IQV57PEJRY2tRaOFdPrR5eq3qVW2nqnXqjS0
         O0ZA+LJxoOHyAYJqgBR/B1EUNr8wEhsJhII5Bn9+mQDJ5DL6YRoTKFx1E2nu5X2KyeRV
         PNKrvJ3uFWS+gWtM+ST+o46tCdPidN+CzoXU507V4FWOimOjjN59QfjP0rV1lvvCSOD5
         7oRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299924; x=1787904724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=dXPViieBMP904ZTdiHHXhiB3kapRL0E36fopLU7x3MgC6Qg/d/Iadwn+88jPWelo1r
         CSOyfy5M86UxySkBt3ioUx7PZ3mUWOqnTLyhoaa1StH5Ve275qqQz+EwtdvUqNIEs7PF
         +0YDYGhXDUPbnkJXslIiW4M+7/ii8SR8xFoZOv5VvMFGXX9VZV6zjNe7Xac39w9kNZOV
         TSocJNS9LS8KS+7T4R8j1b1QR4LKLLyZO8pjrWydTmlUkctp8tiQxMTv7YDSWekH7gpX
         AJu0Wh71OUEJb9UHF7dn1svaHuBShpoJxZtSDY2nHQIAVUlePNvo9MhzPd3qOA4IstiP
         54IQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1EfSKR6bQZcXXq21vkeJpxShw6yHiSylfnqVqrLnFSjQ0lveuiPsmtTO8I5moesR/3WwwDkMbomBl@vger.kernel.org
X-Gm-Message-State: AFuF++nVi91eWcrU1lmeMTdlMe70TVUyJ4CyngmusMZkReiNPDQBJnxV
	iyUoTlm87UPFEZp6jlHjHiYBo8fVd/tQiQkomYOTfCWUD4ETqKsLED2f
X-Gm-Gg: AR+sD13BAt4FRdTwTgRbYiS15pYaPsqyhjaYfxJUjpkHKE4kCFvtJSt034YlSZTNIvp
	csvVd67thURWcX6kIYikwBpchFWHxNGLL8AR9e7pn+JR6cw2uVn30JAxx8b1tvwas8MNe3Md994
	bXHfqCRVkHyr8bMhDzdPkqgSGtvUSffKDXuYZyIh3rOZonAPez831l7T0gX4UY9LsNfb8SPb15r
	oo1pq/CmGGbRwNjZvCVwoekGsfqOrHrW0XRY34lBzUT1eE2Bo6SsH2QlO2bpocUB3MMGTcIVK7j
	xSTfCX9M3NIS32q4if3LNLvdKvJ6whwSEVvVQYavS+b9ae/C7aDQefw+M0fEHMb7OwzrOwcfogl
	+CXJZ5/K62ZGpB25oVUjDUxbmFAlLuyThL8XCrXtFCVR5Qgn6+ySE4EZYSNuVma4YT5UHqquzLb
	pUN87qNygClk2Kedz9EjX89pB1TEgBJsl3mFyMSJEgY9PZpWtO8aciXE9eQYaTkGlCQU/AVMbtY
	XeOhh4hf64rOv1ZoCKzlf4=
X-Received: by 2002:a17:90b:1b03:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-395c39cb2damr7818751a91.13.1787299923915;
        Fri, 21 Aug 2026 01:12:03 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:12:03 -0700 (PDT)
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
Subject: [PATCH v3 01/13] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Fri, 21 Aug 2026 08:11:13 +0000
Message-ID: <20260821081125.4522-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821081125.4522-1-sreeshankar0910@gmail.com>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
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

