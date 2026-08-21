Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CBB365A02
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 15:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326867; cv=none; b=B+uHObna/izGCvl2eJo6LKqL+udCp9FipqI68Qj3eXxk80ysdPi78JZRNhTbAFQocdRMygeUrBoeOOanHEUlaJVsT6M04sV0003JOKk+fDyLVC35j81QTHwn29e/8OUT9IHPFEn7EXeUIn+2YbFZ3c/WFfxSdNv0829TYPKzoYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326867; c=relaxed/simple;
	bh=LO0HNWJQ2iffOvEO/jDwBG49x7KRRSW4adIk00h3Zhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qB6HMLzDT46Apt+jDLP2nQZg1mKm2a0t/c6dO9Hyjqg5tW0/rECgFG3Qw5x3772g1yGluwQiTkGNRM5m/na/goTQNVF13Lq7WNnANc+N2/AE4w7qYDun9hfubnSCF2WFHlrPXIE5ZTCKTJ+7zQMsGEqlRK+qiK2Q2QPzsGiRVgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxRjeqEA; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxRjeqEA"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so1170873a12.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 08:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326864; x=1787931664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=KxRjeqEAIkNNnWXENVGWsdPpwY1eVNOWrVI/UkpAoi0wQD/nHcqMvKn1YWRbWAznyF
         TqNoTn9eoQyZWf81m7Ui0+xIbmNrtF2rUsCPDgndEacLiJd10S/ogmqOJHkjTmTJ7oCj
         UsxSW+qPwpy2exzQ4xNeo8B/RT/sdMivLJ66SjX77jDxAiI2ptVxAGx+WjF2ch6etaWF
         UJ4m19Gqhmlm8EEF39bb5l9yqN3Segnq4AT6VRvwdPDRwQoXXnv8UZ/5wei+ESw6FKM5
         IV+HYbDnc+uPuQHcvNHfKj1qShTlKtjkOb4zdGPpcNb2VdJUrQ8nkY9e7HVoyjx0njoR
         zCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326864; x=1787931664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=hMOuUS/c02nXtn8xDTn3tK9LFDeK/ft68mqBSgzYFrN0CvAE/o+LS2XmfY0tVxCf7w
         VKz0do4oWG0qymGqk6MPJ3S0HwK7oBSgaiGhynTHSO5AHP38JItsrkaAl0s7pWOiEpX8
         sa+nfEK17YV5jrRYo4ev0kkaV+nrGp6HK7dCJcU06rwm6Oll7f+7E7rcYaqO6hrJfjF7
         cuIA7febI1urwupVBdTpipFT0lJk7+gmizV7TkZ4atuo30CBg2K5lRLGifSGCGjUBUEn
         UfcdqBmJRuX6g9JIvVE/KoGYxLxTaZggmTVwJt/rNQZFYj07oeJelHyTGnME9IwL8Bpb
         CXxw==
X-Forwarded-Encrypted: i=1; AHgh+RpBc1K1qk0bmj1JACUvxl2ln3FV2MQ4OZxInTxWpYTSJYbjQP+feEjx3E/EDzbWnPRxZaNGNjw+3Edo@vger.kernel.org
X-Gm-Message-State: AFuF++lojpRkFJDvVRL9qk1sNz1WTWYA18ZcEaOBCo7oWg/TxZfS6rve
	FLSv18BRc9Ns7n1w3pX0QTAxlsnR7xdWop6x/odplt0nIXQwyNhVmtDm
X-Gm-Gg: AR+sD11PXcKNJjKdEptjI85Bstg8WYy+FtLN0BWn6QnQ1pTLTizbe10qKSGOzh0r7Nl
	RLU/L36hmQ0W/0k9zn1JfzH6Q1rDXeGpDalrnomk5l/NjGobWWfj43JeIQ7CqhUvVThnxHMY6d0
	k6RoooWwhGeBfcDpSkCBT2YtX+EQQAX6fdEtmfM2yfo/I1Y4V6sf/9BOKhL8Vt6i+75Cmv/Heff
	+W2lFrcMPL0wcFmCt+T5rSNDdbmmyFuxDt9XSY+yzYMtndy2rWD1X79JA4VMSRQckCJ5Due/P6y
	KYLTyIw1tc013P2oJQoIR2qg1mPQYYsBfhoR/VPZuEZttsB8s9W3spbWI7bHQZgvxGHwURqLrMB
	4te6Ncu0sG4qB39NVjarJ+xcEesYKFa+/jdlHce3ScH/TSRAYw3pSxmtT0Ch2F+8rp/RZprCVQL
	5cSOWH5o0G+xgkPEQcL7bmXJ7D3C+XNHcCKqbLvNam6ziVX4FiSm5jJ3Z4+FEUqZ7e13U4NSp4F
	hX9LOzkPm74
X-Received: by 2002:a17:90b:1d49:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-395c3566ba6mr14771965a91.6.1787326863798;
        Fri, 21 Aug 2026 08:41:03 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:41:03 -0700 (PDT)
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
Subject: [PATCH v4 01/13] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Fri, 21 Aug 2026 15:40:18 +0000
Message-ID: <20260821154030.2514-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821154030.2514-1-sreeshankar0910@gmail.com>
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
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

