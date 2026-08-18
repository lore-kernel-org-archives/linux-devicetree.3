Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6327941D112
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040522; cv=none; b=n6qsgLoK2hzo6wkzHPH/cOCHanpl1cz2ASlMkIwhellzyL+W53OxZBOj03V3/nNg+Mf4YmCTuSMz2x7UE0qhJyH0tzwsGEB7x/r9PJZfvP2Etad1YVcshOuqWNfKZyBNAg3huE3X/ZdDGeVsemrrXr42IhVb1bCUBiiuogvEi7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040522; c=relaxed/simple;
	bh=St8ucU3ojSXInIoaRiplnocZp7Q2Y7UGXGTdomltuLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MpgRmafGmhSgGic3YnHVcCpVDkiQZTdFc9ZnUAiYU+I7rOmHlV9DJ6KytRkYEdBHKkpEkkId1XpPIm5qFK+9ipqE/bUbRUNFZCauGsXGWMFDiPJuJ2HXsD2SPoEZvl7e53BdyTrEZV18q27iy7qT8IbpPK9OxvlXZlNPn/oEaSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bI6XYGs/; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bI6XYGs/"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d049069377so44802275ad.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040520; x=1787645320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/HU2YPUNtFosepQ51+dsKsorbBYkh3zE8nDrxs9nac=;
        b=bI6XYGs/BsTbQPfQw1cFnhLWv7COTDPyZ5g/Pw68p6BAToDUUV/gE6z3R2zuIkwSmX
         PzhEaxzm1omhRunR2Z4KS8nwLmlkqMXOmq5EjAVUeqGRlwSqvLuLsBy8igmNnHLPrAK6
         CqIeJj3iB7/427Z+viTXFzDUlFRGNI2Y0eKbpOrNcxx5OK3f1X3ZKhermACkBXkunqs8
         W2Ecnr1u4L1BBOb8VSLHZRQ6y2Hfe5uMrrhwCr0uzPFYX6+Tz0XfhgYskuD/rp/IPZXk
         TRf5Re2k0RsSxaFZhDp55aWvQVDEw1ndq1zVEgaYxGuIEuL2GsVxyylnCKTDdhie6IjN
         sANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040521; x=1787645321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S/HU2YPUNtFosepQ51+dsKsorbBYkh3zE8nDrxs9nac=;
        b=WNsTbkCQzcJQMV6t4WwSnbegLOHz0pmlbIoIQXMXSdT0l1+DhaV4fRPWcMsmgsn4WB
         1b5zBnnETu2JZn0wI29sON8lDhieY/wSpklSiYN27CGctEHDAhO/I0VFafU/QzsgUk8O
         D4CyhZ0SGsCySL0X7m+4aqSzvq1paDd4HAv61XV25vEimBBdni88yy89MqhJYeowJQOw
         8BkvZgAk6nDI7RUBdvaIz40yU9f7zeGFAtnkdHxvzlhYOda7EZcAShWbM+31m+fp7/sq
         qacpO7IIBXUpaEOMucRvMIQr0xZiJuE4WVmGyGICF/PRRJ9XaUXTlEjJYjHkpguWLIp3
         JuzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+uapZizIJCtAyVJiH07Mr+4LH9XRVZ5R5yDoNY8vijBStDCY0v8C9uHnAW26aSyX1dhfseVofKbNu@vger.kernel.org
X-Gm-Message-State: AOJu0YySwsGSIMiLq3+nZ9wzhSkUNNG54tSkW38cDIz9aUyQ2FrlOPfo
	SXR9iZoifEkGY1ahy/V4xesJF6q6U3UKpW0p7kZi9UIXWqzueM9w0Uck
X-Gm-Gg: AR+sD13OmQS3U8gvvdXdEvXT0epANwrzpwFQ/Oz41x0qXwz38aK5dP2IGRByzVno5ss
	nu1y22d9ZFuKmcws4CzczRo94cD/5QFdArE9W5xQ1JvqXp7Ov+O1DkPM3Jw2iyy68qvTG41Jrp8
	n6lCyiZtuo7uk7S79qEx4XMUcv+yQryUwe3AmtgUNVonHHLN1QDFzldFOymieEj4XCJYO44wkhm
	ch+K34QrG4tG6lcJ/iJI7ZKSiI912MniuFpEiVy7KNJ0YhSTIrSMrqCNQ6JxnXZVY3tIhbJq19K
	cTLNYUBaA4NizVgFPAmWbtJFqB+K/TrHuozrHdeLEEOK2auqAce3J1JU/qdV30FEk7hNxe8TduX
	fKdWJeAK6th8CIKup7UHDhUtrlIha9exSJTcgaVgPERbA5vME8JiRH3WUHTh4htETiOPztSXaoJ
	4LIl2RO8mJiBeNN9WrCTKasIRsmCTJwxG6MQ2QWgl2ByS3tOvCDq/bO4KQ6RcvCeCVabYj4E4SR
	/P610H1teQ=
X-Received: by 2002:a17:902:d592:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2d3b0d5cec9mr386376235ad.14.1787040520521;
        Tue, 18 Aug 2026 01:08:40 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:08:39 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 02/12] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Tue, 18 Aug 2026 08:07:44 +0000
Message-ID: <20260818080754.4362-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC ID for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index af418adad..54b1f8e1b 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -449,6 +449,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ8172) },
 	{ qcom_board_id(IPQ8173) },
 	{ qcom_board_id(IPQ8174) },
+	{ qcom_board_id(SM7250) },
 	{ qcom_board_id(IPQ6018) },
 	{ qcom_board_id(IPQ6028) },
 	{ qcom_board_id(SDM429W) },
-- 
2.43.0

