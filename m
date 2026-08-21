Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7A71A262D
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326876; cv=none; b=t240yJvs+YSO2c9uG+6cRoisgntkCpmWSdCw9CU6vEZC0HXFXUYau9aAFqPaAmGTAtLcLAAbwZVVbfe5WLtKxRyW4eZSsFQgX4C4+eJpKCzynkVx02z5CxnkFAleJO65ljGSDFeDEHt66dU5husZPBh+UUicQNGMPxE6qaSAY8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326876; c=relaxed/simple;
	bh=HpzD8eE93G0QF+A2LkG7W4+8iO6y5XPc4Rl8E5Fjv8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j5FFCBYxrEAk6Ll9/pAJnhTr2/Y9Aho3RwjN9hbiTiGmfTz5eG2xU758TDy5+HwXM8YV9AIvbA+VvA2TmQyLuH0vVky4/mbd54SW7V/KOf82NxWkZ6dlorMlbfGtoRBxF4tcIu9uy2DN10hQH2mf8azXJOXwq8jPrKrMxooDAUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5wmzQ6H; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5wmzQ6H"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-395cf2535acso688977a91.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 08:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326874; x=1787931674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=B5wmzQ6H3qCVvb/kiwpVCc3GorS+NW2Zul14/aoQqZsgbRooEgmliA7t83ZK9QdaP3
         azNf1qIoB3/1Iuw1dHVJHqeb6mj5Trn9aYLwdHTAyxetxXR9euD6uQEvotKStzp1DBzN
         y66mMCumE1+NIiCyhQb2J8QDiPQYAC7DU3TvL9mT6JdYDrdqf/aa58lGYfzPWq7Okc/k
         pLRyGUo1bb12DoePiz7kOjyB1UCPcGRXEur+U1qwHsG7NhwV1d0NerBfHYOZ+AFToVAb
         ouJGEp+JddRzLWXtWNTSaGFDOgfz0rhDx1kswGF5bqTBK0sv61HQcM63wnCqzp+DGfdD
         GsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326874; x=1787931674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=QqpUCQKGubiCDDX/WLgfn5tllYLSwyC9iwQkrj/qv61+JcJ/GelO9AyYiru0Updqgf
         FA4aNDP2w0rFs9Uc+LmBQlsl+CdDqc2eDDmfw/RdoeF98auO+81gt/l2u861a3KL/tay
         rr8GbW6omp3BRvJnwKJNzqWPGsrD5ontQNY+Zby51BRsPwVOfpkDuQ9E62Wsqb2mDJei
         IPsvXdMWY6dL4BdwSBEqgd4FX1vsq4roIwTHQ3lpWef47lAv4xnQ2KWkRuSx3MDiShku
         JBreasZPYu92OBUOtDInN9F/S3caTmvpbI2Pv83R3BTeOxC2dWFO80DUj5zI8Xuryy57
         EANQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNmO+WoLsYfwPgJjs0wEoR66ESDIz9BItFmQWgE0VeFWSSQujR3EU7FTW73ewS6YIcgJe2lmGMZDql@vger.kernel.org
X-Gm-Message-State: AFuF++lcY0l3sJp69UUqP8XzwKkSxm6LpyXzbnHDYis7U/FNTXmDrYVu
	AW8ngAeP0CH6w1++OQXKqfRAYtceqPHQg7DrO5GdTEVEpnrHmvuUD06W
X-Gm-Gg: AR+sD12JMq/68a9e1KrIumRJTIEZqfS4KxLq9W3/LUYOkIkzqAfcnI6etdOgacXoeTx
	qj1dfhsGcnjVdXLqu/bNmXPv4J6OPSCo1rgCMdTX2T8u3ZLJJzYsHSEFLRbecL7mqGeYk0OWWni
	w6lGM3FcIoKaiiQco6aaYsNnS/uJPFOfiQKzwE8KKyKYkeZnOGZ5MXbCPwLZLuoOJs5gdV/mCIk
	0XlovCPVzQyOYh77YucXbngRr9t1wovBP7/DzhiRniVoLeLqMJuglZUTsM0tUeUscsra2tdVEMt
	sT2iUvlUEockAroQaz2kerQ8LRE5pKt9gmZzYGrJdJmKkHhhT//Me22zbhmc1cJJWciacgzf417
	el9Y0x1sDmDfSClNGRn6aiEHuY4HHgCJXb147otau1BoRFcenIlcr8agGxDU1y7aoZ7clK18yNl
	ua3gkff00mmjfqkOQnBApFPN/7SH1FT9Iq0t6ESDv7U4Uq+IlyYsS2HXfzqNMyIDbwozV3RtQ1m
	psoMbB6bE4F
X-Received: by 2002:a17:90b:388d:b0:387:d9cc:7dc3 with SMTP id 98e67ed59e1d1-395a074a348mr20056250a91.21.1787326873816;
        Fri, 21 Aug 2026 08:41:13 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:41:13 -0700 (PDT)
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
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 02/13] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Fri, 21 Aug 2026 15:40:19 +0000
Message-ID: <20260821154030.2514-3-sreeshankar0910@gmail.com>
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

Add SoC ID for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 1836e226a..63ee5cd56 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -450,6 +450,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ8172) },
 	{ qcom_board_id(IPQ8173) },
 	{ qcom_board_id(IPQ8174) },
+	{ qcom_board_id(SM7250) },
 	{ qcom_board_id(IPQ6018) },
 	{ qcom_board_id(IPQ6028) },
 	{ qcom_board_id(SDM429W) },
-- 
2.43.0

