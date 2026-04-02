Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA81C36074B
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 03:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775102070; cv=none; b=Dwqu0LkiKQJ9MF748xTuC+VYZ16xDhn+FhL1R69bD2amRNxvQc7R0HyEbYFnkvbJremkIN62V3lvY4IhGvdEKg7M0zjO1a00YwpZZCugdE3luhpAf8IBl6TXqw9HErR2jhVqS8K4hmkACWfNSjlKbcfj+QT+3mUBLsj0apJFdDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775102070; c=relaxed/simple;
	bh=4qfqDIpl9+i1jdlyMFnMeF5YaTgLpAL85qTp0ms9CR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PdIqdR1a5Npbe/xRl0tQGWyHv2PlTWr+LR75M+jGlwtFeB3KMwXwU8H/FrysErnS4lZKg1HqLQ2QUtEQMpxVf2/YIAV+vwtRXwVTLzMBTlN91v6WjXlw92oOETkwaYwBUnMPgf/06W574TF5xV3BZZqAGMujO1p1EOcCYTsDdzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MUez0uUu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3NADu1G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MUez0uUu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3NADu1G"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M43L13955886
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 03:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0IyBeCS0RIC8L0kumGdv7nrT1SM/aWdVx2fCYERunk=; b=MUez0uUuB71PII6S
	zoqOYG4dVhkR/hcIbNeOxzJZrPY0DwkSJNnNcKTnsQJsc5lHRxO/b5eOyOdRTCsl
	7xCOgvDPDJpfCu6mrtk/EewnYWAz9KRtseShRPrP3n/1nTBB18t7K6U+fvv0qhGI
	6KFYjjnv+X0cUqKoo2fQAZr1eVH8efIeEwQn+dLDDMQnpHLui3P2zVllHOaNLWlv
	riKvo87XfISwlPOhC7Kq2QMQ99uBiiJnXQGwd2SZnT747i+MFObEdmF275Pd99Se
	CTIYEX4hY1akI2JfWYg1/SXjd/P1L0Bp0Kyo2akmQXHLuOeN7sx3wgrgUJ4sXKe/
	t41Vfg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9aw5h64t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 03:54:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c613194caso258448b3a.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 20:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775102067; x=1775706867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0IyBeCS0RIC8L0kumGdv7nrT1SM/aWdVx2fCYERunk=;
        b=B3NADu1GKDOh/VAaxmShGlNBdityPdCpIds1I9Z82aMSSCdXUGsNg/NVI+WNT7gLjA
         AzFxpHVLpUj6BY4dnfn9mn9lFYvkAhr0eZ1l0Gex8CCHWU0A+57qworrIiSjM9FNkF/0
         wy6LfB7rpMEkx+hrioC8H6jLkoDNKvvfiB48Nm6SBV+1wWlBC7lPWjO1yAR6EEo00MUD
         jK99KADeAdUqS16Fgf/rx2x+jhM4on5lMFnuFhEZSgRuNDYVD1ALgJcE4Q9JqY6WMMxM
         XoUoqm8SPatI9xuUXja+Pq+Q+5r+U4L2tKzq1Q9abAAA4oDVsHWw882+faA/fW5jYtPY
         TefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775102067; x=1775706867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h0IyBeCS0RIC8L0kumGdv7nrT1SM/aWdVx2fCYERunk=;
        b=pFBOhjgzm2NLYsz8TRlxSZCnrB/zWXYr+NAGILUNMOF1r7/Dr12fhY6fOEQzJGveBq
         gc1Gu2rNmNZjgvT6L05Ct4s5UhsxvqeSBT4VfgnJkHFwLKBhIVjHVU5SlAl1X1ATRUFi
         EDUaIetS7ZXJq7J2E3D+zgOL6OR78ydHQ4RiNASYau1GMrYSTXqjtVrYyQPBRDw+u+fQ
         qnPV+60dLN06mbcW8U0itAX0/0q/hXwajrvwqTPJBJA56idGGHJKUEBreGJZlb12r8bs
         jd0EAaFwa5pHfsoUjzJQtseRfaL/lx9tedegM8DnyJ7zZVAqen6I3rhXKPXesSnHF4hb
         dyxg==
X-Forwarded-Encrypted: i=1; AJvYcCVA0Mg/RoTwyT8+2H4FswErryLodPYmV85dOHHJt/lHLOhXk1C9lymOnAduNCut5umK7lSKHfgwee6o@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8lOJUJpZiAdAZk0iZWHNu/eIBY0s3WC81SzijRSBlWAr69TKw
	dJH5CJNOeA6vmCFHE248QuJ+JRsQS0yKPPHkMGn719JzCtDBCm9E22ikb0NvFoqe3weXHXdLeNR
	gO6Oly6ruLfvSjWP8JXuWyws6ZRi2SDcYzEDwrSoA3G5TYsonKe/7gUc5OH3odJZC
X-Gm-Gg: ATEYQzy3eRfMn/li88oc8sQ+NkOYlQYHvi0E1IggWC6VhAiYO8DZD6Ch1PzKCN5YLa3
	jCJUysL6Rssw1Qg+JTIuM8UtBtCdMGXAmQd8GXXJn91LZWiyVlmf9r7q/rdprIjq/vTHEQj7owF
	cxHroLIfxVmQxwyQcRHXGtaRQR191M57b08UewNjMz4ITDSV93Nx+anYTQrkwbamwy1UYNG43Ah
	Ngs3FAMdCNunBtcv+EsQgV8ydoT15hs04ngc8BlRrUbYrht3Mao1xPuuUaSi0pYAWMt4oWbfxjl
	IiM2sUR82OVzKlrYe7UfUQomoIQ6tmeFBqOnjznsazgKa513UKn2recSxJbscotd/VGuH3UX+Oe
	PWPtzVnq/ZJHe0ZOavGt/tyJFTADeeyxyz22WB5tSfIaoPQZpERADovAz6eANjFEDb4W3wm2laJ
	efj1n8sF3R7y58OW0ewKYdqzn6d0DXac0POxyvvtc=
X-Received: by 2002:aa7:88ca:0:b0:81f:ac81:d597 with SMTP id d2e1a72fcca58-82ce86be17dmr7041554b3a.0.1775102067563;
        Wed, 01 Apr 2026 20:54:27 -0700 (PDT)
X-Received: by 2002:aa7:88ca:0:b0:81f:ac81:d597 with SMTP id d2e1a72fcca58-82ce86be17dmr7041527b3a.0.1775102067106;
        Wed, 01 Apr 2026 20:54:27 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b272bdsm1456189b3a.12.2026.04.01.20.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:54:26 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 09:24:01 +0530
Subject: [PATCH ath-next v4 3/6] wifi: ath12k: add ath12k_hw_version_map
 entry for IPQ5424
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-ath12k-ipq5424-v4-3-cd1e0f0a6c88@oss.qualcomm.com>
References: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
In-Reply-To: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Q9jfIo2a c=1 sm=1 tr=0 ts=69cde874 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=V2VgLR5doq-8DBhT5hEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: syrYABla0gBVK5PUw-jz2d9Hw7gurleI
X-Proofpoint-ORIG-GUID: syrYABla0gBVK5PUw-jz2d9Hw7gurleI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAzMSBTYWx0ZWRfXwYdvstUlSDFU
 wq3+s/u6uOCTG80y7QDfpHEWmJvSGt2PSgmGIYWWfxep/dq7bLsVxO5XYtHexx6HNYR4YqwocBh
 L9HfUHl8VZWkCOr0Qejp7yll96R9IKjmmKD5xlZbzZPoXnYQ+F25wG8o0EReDl0fJdnZvin2wSZ
 Iwi47PESIyqYywDgSwA2OEG+VRDcYTjaGR3e3gUudPJJTPRrEsKw7vue/A429XWjrnZVh9Kkr5G
 lbeWUvetq5KUo8mP278sG4RCaKfJ4m3dIOyjg5qCu1+IjyGBvUd58nSRUe1xlwbp5CR47amW4Ts
 DHwBO5Ey4hRtT+bOX+1fQ3zuG3dCrTcgX0SsydKzOjgQiZLzq0dhWMZxBWbX50gL5nbto1+uJXt
 fvGd+C6gKiSeZgnIpTxDc5S9f/WVULQ2Nxot6Xiy8kFIjVcsmispX55y9wcg2nM1P4nIb+HCl4I
 dxQPpUODPN0xk69nctQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020031

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

