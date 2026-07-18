Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6899D35AC34
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784376394; cv=none; b=M8L91oaSYgV6pxXitxVPAn1UYpPXEGr1C8jT+CHHb32i4ooQWT67U2WvyaucNpAreYTTf9Wr2jYbx7LtGCMa1JiiglHQB0E+SiDlaObZXfmtP3J5wo3pFhEZGN4zVKmly2LGmA4FZw1c928rKuBwSsxd58SKZpdV0m1fBtN08cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784376394; c=relaxed/simple;
	bh=GyovgjeiGtjjazTDrkdaX+O0ZYLVzvhgyqOlUEIx+38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SQgtUWJKXx3BCsPTiPH+LTofEiAnoetsh/CSP4SLw18m263HPIxkTwjq5cufwCTRp3LB5Ui+sB15dQEVoZQrHUBWHGSpHH6FkMIt5qrJWcNdpnZJVaDUc6+S/d9QFPDEOaxBQmyuUegshO5tVI32QUh1R5MaYF23epnbV20z4Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjS7bEfy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdRuwcp1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjS7bEfy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdRuwcp1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHpxr584767
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z1d5ASmryfqakOzOUAiKWz8PnldG4VbwkzoNa3wZPJc=; b=TjS7bEfyN5w2Knvv
	RGYSB3xxy4jcr9dQ+AbGcaNkCu3I9hdnnEdwgeOvrEWicM14KZihIHRbcLT3B3BQ
	9yuo4vk+cWpaPdLb7ji+/sNwfLXlPJhr3RQnjz4J+cqfis/tbUmGNvYwC6iol3i5
	bwiFxxfl14Nahvpo6S/SUkEjErmVT0yGwCWvmyRJL257Xm/Ay1zg+RKjoL79gc3x
	0aQNN5XLb7EdhHOqLzw+i+xzBl2W0vw2CZq/QELYK8G+nQrAgaby5lzCgGanfFMA
	/MsTPaHtTqRwBfSUa3RhiBXFQTIl4aGrRipo/IlttY0FspP/vU+4SEgx3THAf66Z
	B98k8Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2d90p72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:06:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cea6a46766so124827625ad.0
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 05:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784376390; x=1784981190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1d5ASmryfqakOzOUAiKWz8PnldG4VbwkzoNa3wZPJc=;
        b=PdRuwcp1f37tRQGnxs27d1csOngKoRBv0xjKMsmEXBY51DBN/bAH9IwQGq5eSS/Ezc
         L3ajwXUeYIiQ7Lhk96XEKVJEcmhNs6wmazR4Ls/yTfwGRW1nwfxqdejj5YCCh1bXmRPS
         PG57hzu1lfEC5DNs7ila7zGCnTLNpS4mPULc4o76j84/0zrEp9lMXfRZwAagQFSNt7/y
         0yLWeBHk0RYS/CV+Mu6mvdmGnDKpABkbmBDvYyB5ShhMWfjLKhyL+5lrGdA13bjVUqEb
         gAsIvzN1C5j8pqpQQdxcg9rxGKOwKHYf8ngoDEHWO0pU5BE4aiCy+aXLlpQmx1UMb0yP
         rXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784376390; x=1784981190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1d5ASmryfqakOzOUAiKWz8PnldG4VbwkzoNa3wZPJc=;
        b=NnOiGJjIE9IAdBmoP0+prUH78d1TfgN86eDsoqSDSTfihnUZ24JxiH8NI4b5uPaeV3
         tZFOhApQFCvp6j3cDlLLIaIOOw9M84LUH2hGRH3CLf1OtvAybgZ7tB3zXeOKIMl+BE0P
         vvsqmHTlj6HLe9pPoe48qIQtbLlEfwL5Q9kSJyMCqa9uiwI2pDhN3WV8TspMaudCrb+H
         EMsIXoR10xwQ0yXTjEByiSBU6lv/XKalCdTqNi4RlwUlWE0rtkScwO1Y29t8VNIWsjG7
         /EZ3eRACxooKBuErFYDfpCqc47Pf7hSilpnGfAFTTyCcUBbOgFjvizb/2rIykfc44CCe
         JgKw==
X-Forwarded-Encrypted: i=1; AHgh+Rr6YInkJvwAyOvr/b8j000J1lYB5OpaXKek7GZny0SZ+v5RinHNDapns/X1lXoj44UhS6Q50XG833rB@vger.kernel.org
X-Gm-Message-State: AOJu0YxCV7Ovaleg9y2b91nj51sX9S507mKGwZ2aNcr74Ij/D1cnMOUF
	j3z9xPWMMtExcXEK2OKfMjxWClDXwauZCBo0vpolvcrxiM5YmxOnMb3S8USoSBAld4Jgi/4taYL
	z13czwlOWIUNrPalApj74CAw9dZuGo5tPgwvLzHEnJHUnRqgNy7IalsuuGBTBVJ3g5161mcseP8
	I=
X-Gm-Gg: AfdE7cnxqKSSO3/KphqqMaDLepmnH8hpvGuQ965od8prbyf8K3bHjXI9eqYoo9e+vu5
	xVfYbKHfkwOdtHfHGVVlwGoiC0BlORCOlDpf8L0JjPcJXv5pLApv8Q3BfGQNYhF7R08xxm069gc
	JbNcPTgFzqMZFiAKWLzYyip8BwI1ODRVaggzxpqHAuo8XsuYAg6jjPlg7OaNHuxAqAZbUmlphAz
	C0VGDVDju3jk2QBL5r8ca/5GCqtjf1fXwrJDqezoXCNExMmvSoZVXtcYN0CgaVafuxP15PyO0r7
	GeA/L77ealPfO8192IKgjJGgO5UBTQOVAzWGrPVbLUxsz5+iZ6adTYrHfG8K6D1DW50OR34ALaT
	5sNn9R91KZnziyElPkTiCXMSDSI2wyar890/u+3R5nEcjycnwW+zBuVGYSXw6hY1x
X-Received: by 2002:a17:90b:3b44:b0:38d:e12e:83d9 with SMTP id 98e67ed59e1d1-38e4b57dafcmr6525798a91.40.1784376389574;
        Sat, 18 Jul 2026 05:06:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3b44:b0:38d:e12e:83d9 with SMTP id 98e67ed59e1d1-38e4b57dafcmr6525777a91.40.1784376389177;
        Sat, 18 Jul 2026 05:06:29 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429cf22b3sm17666314eec.0.2026.07.18.05.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:06:28 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 05:06:24 -0700
Subject: [PATCH 4/5] firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-b4-kalambo-crd-v1-4-a1069b5a2757@oss.qualcomm.com>
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
In-Reply-To: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784376384; l=856;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=GyovgjeiGtjjazTDrkdaX+O0ZYLVzvhgyqOlUEIx+38=;
 b=SL20adNnQQ8qI0GzIZhQ5MHG90blwWiwlc9bR9vm5sKNJU4IQ1QDvJ3NNPi6yqdByGcOGn0//
 QAz+EYZdS80As4700DPNafV3NZQV9/n0igh5Tn9BInuYA8fSvpuprxB
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=HpxG3UTS c=1 sm=1 tr=0 ts=6a5b6c46 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4tZXNd9svdI9rUIdDJIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: QZr3IEXMtyo056cZTjwPaNnqC36AqQa4
X-Proofpoint-ORIG-GUID: QZr3IEXMtyo056cZTjwPaNnqC36AqQa4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfX5PRR7g/oYxQe
 6zif8tH/mGnLgbAje9809aRTxITmRm0HvYIfgawAWdZ5QoMbm+yQVwf1xjv3/h5urfSgeMX9BSz
 +eXXhLYdf9sGisZc0r6wo3CMWqp+99hDV9hqE+KFfoEThi4hfcESyEBpxt7zx1juQD2+udGHm7t
 5aod39gUXkgwr1JIBdFHikqlrnBGxsedX4QTWIT6OQho/aBnpK1IGB2DNM6bWKq8ExKetALLSco
 19AyYZgwrY7e6303sHF/xgPyi/jzt0OpNkMUj4nNU3wv0MTOfaoUM4bfoTWw7AHAIReCxUBTbiR
 BlrEJ/023W6lv/YSNgekIzPp5Or9+MPaOwrpBGPkWRyPCKQ6TDcJTnht+nFJATR2UMzwtaleKA3
 S5TZW5qCGO3C8Vg3O+YqZ5Z+RHbO9KlJYQCW9fLGmvaM+9ytbgKP9w8jryKgK1j1e9NuNEWBn2h
 mdplCdDu9LOpQvNDsTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfX7aOoO08Ok7oK
 WGlPxoCc5VsQJ/tJKfBHVBUB2JyQxFqugis6vWoRIfQRqk6WhKfRWGxTMX8WkZnYnnZXXIZHAI6
 lC7UrzsFl6EaLQvut1o/VMlS+amY3KQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180122

Add Kalambo CRD board to the QSEECOM allowlist for enabling access to
efivars.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f35f2ee39130..d1cc6c908daa 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2327,6 +2327,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,glymur-crd" },
 	{ .compatible = "qcom,hamoa-iot-evk" },
+	{ .compatible = "qcom,kalambo-crd" },
 	{ .compatible = "qcom,mahua-crd" },
 	{ .compatible = "qcom,purwa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },

-- 
2.34.1

