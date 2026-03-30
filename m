Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C319A39EF24
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 20:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774903171; cv=none; b=lIYQ+GES5XEFn0dd2qBgfdvdaRs5tHcyASjagFDNp1NFI2R2vYfNTZkRvIRJAPIkFOTgkq0A3cmY/x+59TApCogAyAYig9l//Lw7ytQ4ERNtYfzJ0wmpW6VTZb+x08bRZxkYmtSXmNnk5wl/eENI6f0O5gYjHV5ufm1gjn6SjnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774903171; c=relaxed/simple;
	bh=4qfqDIpl9+i1jdlyMFnMeF5YaTgLpAL85qTp0ms9CR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mbCmqf4mKoKTFglJlqklXumeXLaIwUvZrMJp843gSCCVSfjTLOYiLqI1KFgVOkPWP+lmjHMEZYKjY+1Oac+gHRaVknf3QlEtesYjIk3xsnkeKMk9wfTLDPNHmkRnT0yf8h1GpFX4h+fHiTuuH4f2QRI903iWID4jDhqV9R/BTqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnC6omH7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xga4U1I/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnC6omH7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xga4U1I/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UIKksO703491
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 20:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0IyBeCS0RIC8L0kumGdv7nrT1SM/aWdVx2fCYERunk=; b=nnC6omH7DK8rffr4
	JJvweljcHOHD8MqehQadaB9avOrHpGUe88uyhfDs5RgN9P85k6WIQpKjNhXqU2iQ
	OxmJwXuzGpe7dtMz7qyfpPrZvRU2MAMnSVeJWy7fF3V2LYumyZs8WtSbVc18hgee
	NV9p7VPiKmzCVh8o+VK3ts5p5mGToGMbeoD5JV9G8zI2QBlDEkMdo3j5Y2MUOhax
	wsd6tcz8nEQbaAmFvZo0cNXKL1P7c8zTQQNsmqWjcO13TLXsah7HEl7QSxREE+Pf
	XcrXJ/FI1tZfl/2M1N9czU5Rl/v026/k8aotYP7/TlbNjLEn2/o7YsrTsd0DqVjJ
	0u4rPA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7sansv7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 20:39:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24305cb3cso27762505ad.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774903168; x=1775507968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0IyBeCS0RIC8L0kumGdv7nrT1SM/aWdVx2fCYERunk=;
        b=Xga4U1I/xczo5kpHOduPLudX1Qp/xbqtVzPF/XpWdTcLhPIAOzj///fPA+mUCKj/4J
         QhFUlEimTYsBilDyX0tKggOxD69F2oi7nRiyg/gXb0HkxxzQimi0ExDrYgTObOnNFgA6
         EiVyJLV9OhnNtyR/i8Zrti4DnMh8Mg8o4QzPNVgzNhip25hNLn1zzdGlLg/u2YgJRW97
         llrV5OvBNPF5X/5NRDr+b//bTHTfbrx1K1Jm/9SQXGfo8ULJ/r+jDR/9pdxr1UkAaoW1
         +WZ2UTX/LWaEaRFFDAXZN0UBdsBx6SESkiRFwyw6MQkqkrqHgKSqeBHdzjoy6wCO+bMN
         aw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774903168; x=1775507968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h0IyBeCS0RIC8L0kumGdv7nrT1SM/aWdVx2fCYERunk=;
        b=Mx6hSW+ZX5mRcD9V86+7nhxNBkvJDZX/GDLlD122U+z39lV0OYjKx6B6gdcMK4uzG4
         LnYtFNzFL1RlFiKPKqYHIB3OnGoF9keH4su7shb+KP+/TmtD6ixBANunTj7X/ibTSiU4
         GgvQNZ8okD3Wlh0bjF4ZpTJjbyeIZkFwhEw2g9W6Ru0tOoWCATI9MUPQoIFXqylwxKVU
         EMkFR67LekW4ob/CKyCbf8oeT9xOtpALgkl4+0aQE4smPKWghfjS2f9J7SUmhy0re1iT
         zK2Xqih5Vlm2ASfc+2eld/bcaOjJgbPvIlVQz/Mf/Gn2lIzZFoyvYlVcGPRsxjZzlhe4
         uLDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9SA1tXzR160fyckiq3tbClMimF/3SKmllne+hrChRvoiYtBK0sAw1DImAwfhZ6sX978P3aejeorWB@vger.kernel.org
X-Gm-Message-State: AOJu0YzqQGo4EjTCcQuZfNqoXXFpBM2xPutgfIDm5jE3oNFboSChFvYm
	o0TPKrG/on6RvfKRCfg7ONwtIcZ9HEgtylgw2zGt/CsvGTnA9/qewE8o58JymavqEQWmGlJ/Gla
	+To5XLnfPtQ9QZ0/6XSH2KFDg1+u09wX/8XrwMw4AL5l/01Ep2lbYMyEw6eIW06yT
X-Gm-Gg: ATEYQzyKZeKO4lufB4GQodHNhX3CP3WN0o0sQEkhuySFwzuB5rMzv58kiiS4Pxzq7OT
	Lk3t9ssKPWoD4EPjFbM7McEP7HZlgVmPSrpYLyQf/2ll/62t+/di5pXI6QQloBblMCMJaZU/GF9
	LcJ4VKrMm3Z7zFOcrgC3UBJcJKMZPmfdGmymKJ5J4U0+HJa9lT72JIn87U4Dxt9nDFQH7l66Wy6
	0muEm+pgQn9qu6v3HbBTF4HkbVCSfeQ2X81A0P4ZcgWFDVSYwDJmwP+nIEuN6e6bgCzyVF82e8U
	cajwFgswDHo9xlANhD7rjDtaR/JxKKnhEioWSX/0vFfZGyazVpGw24hlAYTqeNjPniItJ+OSX2x
	EPyX4a1XEikUiHRnzJsEbepaNsDoDClZW7lq55E94YyJdV+gOj3T1vwXgBQSM20VZHOkUfG/fTh
	dJPkGvPu+97YhGw2uvnE6zlxYDQcf8sFwo6QK2ClM=
X-Received: by 2002:a17:902:e541:b0:2b0:5795:9ead with SMTP id d9443c01a7336-2b0cd9eee9amr146049785ad.0.1774903167699;
        Mon, 30 Mar 2026 13:39:27 -0700 (PDT)
X-Received: by 2002:a17:902:e541:b0:2b0:5795:9ead with SMTP id d9443c01a7336-2b0cd9eee9amr146049495ad.0.1774903167179;
        Mon, 30 Mar 2026 13:39:27 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c3a4esm113517195ad.78.2026.03.30.13.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:39:26 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 02:09:08 +0530
Subject: [PATCH ath-next v3 3/6] wifi: ath12k: add ath12k_hw_version_map
 entry for IPQ5424
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-ath12k-ipq5424-v3-3-1455b9cae29c@oss.qualcomm.com>
References: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
In-Reply-To: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-GUID: M_J8Z-5XtV1X2m5DWKzaTafjy78kjyRM
X-Proofpoint-ORIG-GUID: M_J8Z-5XtV1X2m5DWKzaTafjy78kjyRM
X-Authority-Analysis: v=2.4 cv=NofcssdJ c=1 sm=1 tr=0 ts=69cadf80 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=V2VgLR5doq-8DBhT5hEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE3NCBTYWx0ZWRfX1dpTIkiTVME0
 BUxAbKokALyVHfp5vj3StriHFFPIre5OP4jscPOmLIvTtFJNdBqm/F62n+/MT3PPQugupydgzt4
 DhsjuEfDjKD6XIbiUn+LrHJabp+9UqRmsQapkYYJWilb2HTrQMVrt4mXaQfYjhoRGugXYdk8uYo
 bubMfwr8c1buFKrCmgIiwSlclibBSFOsDZ/4upsCRDc3HTH4NhdpUK5AB2TiYWvXq0YoLPX1TOf
 nI7H+G1DICvcHi7tGsFPtH4hupoJlSbCTf2lgdMtbiEEn2v/QlfeLbH2B2+nSMj9HydNvy8z31k
 L+8ExJoiHbUlce0KraHB/PUsHZ6pnsXaaIUFKZoIsuPkk6URepCC7jiV1irJxs6/1vl2reeTQK0
 HmvfflaVK6h+gIgnPFclCcp/HcKzaZbeLMn7OLzfk/NEUPE6YeJYT80te/A2KQIfZFOqj1+pL1+
 kMCOjfVTcH3firx40qQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300174

Add a new ath12k_hw_version_map entry for the AHB based WiFi 7 device
IPQ5424.

Reuse most of the ath12k_hw_version_map fields such as hal_ops,
hal_desc_sz, tcl_to_wbm_rbm_map, and hal_params from IPQ5332. The
register addresses differ on IPQ5424, hence set hw_regs temporarily
to NULL and populated it in a subsequent patch.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/hal.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.c b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
index bd1753ca0db6..c2cc99a83f09 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
@@ -50,6 +50,13 @@ static const struct ath12k_hw_version_map ath12k_wifi7_hw_ver_map[] = {
 		.hal_params = &ath12k_hw_hal_params_wcn7850,
 		.hw_regs = &qcc2072_regs,
 	},
+	[ATH12K_HW_IPQ5424_HW10] = {
+		.hal_ops = &hal_qcn9274_ops,
+		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9274_compact),
+		.tcl_to_wbm_rbm_map = ath12k_hal_tcl_to_wbm_rbm_map_qcn9274,
+		.hal_params = &ath12k_hw_hal_params_ipq5332,
+		.hw_regs = NULL,
+	},
 };
 
 int ath12k_wifi7_hal_init(struct ath12k_base *ab)

-- 
2.34.1

