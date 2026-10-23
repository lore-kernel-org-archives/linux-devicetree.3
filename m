Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738949;
	b=oXVDVE2kMnoNl77F8dkkAQ6tL6YJ4NN5qu4+5u2ljr5kBfkuJd69g8cEa/jQRdaF9fk6
	 /LBKNZ/DapQWe9tCbQY9dCTXJUE3jG6+TPlwIBY5en2ykkX5DSL9ul4qOgFoED9jHoUJi
	 ktbquOma+bDY67TiZbbt5GudyDIAGwUtjRLbRQ9/qBM/gr3sVn/vQsmp9EGKT3VP+9lyx
	 HCIZITuvZ7mdSV8gH54MJXY6ozEXzcribsLRB/jQ8lZ90INTmTnKkPE0qzzJBiy4d66KP
	 gTmWbZMMsbDN5MZSMaG2r+i/EFxU+L4/D6EE2N1rAIgozVLALzbWFEDTN8rmTFqBqbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LlYuG6WB38gIzmIC/YDa25c8nS2xNNSGEFoJZF8X6UA=;
	b=ag9NBirmaN0sPj3CLW0fmplkkoRgHFnQP0WE4RPfA1HczN4l0N3dfFty5WO4iz4FussH
	 yKRhAInaWX2ObRnYwIvmNDdGDE1+TswEd2iFcMkQZh2OitjQYiDbWSsyb15+pWgBlJIk6
	 EBOyXMuZkHHLvQunYcjxIa1Ta6dC7+STBVnTtKZJjHtO2b4nQi3jkgNqQRM8JxjQXMnPa
	 7pDVYiA9FWvk7GVTjk+D+iPWunokaAoA8c+yzOB9TaRrpagnTyCDqyRuprp8Ura1GV6X6
	 W8EuCXvKJNxUFcZfSpJJxg015mcy8a93wC0kLz8OvQfGBMLBW3Agfpo5Hw9M2LnZ3LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IQYopkuj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uc5DWruR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E811C606BD0C
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E811C606BD0C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IQYopkuj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uc5DWruR
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1GMRo1320013
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LlYuG6WB38gIzmIC/YDa25c8nS2xNNSGEFoJZF8X6UA=; b=IQYopkujZvHpVxHY
	b1d4rQf0efoSQLNWgNV/ZRRuDpKpgm6K4s+f4hyEn5kMwRatTdJ53MDZWlxHus6r
	+mDBbR+VDPpH6wXC/UuSoDKc5NGMFmUNSE9/9EOdsYdRE7q0cIme9Vn66aw23j30
	mhm9h0wVOXKzyn5kxX5XJrHhr6SFGK5vhOWm5CiFWm78tYK/G637mXTeGWVTfS+9
	qdjotwmZURqGLLtlhZn+5kl5/VekGUQp8cR5XtzD+jj2Jo35Jdz7q+4vZz0/wp1Z
	IOy4M5ZV4XQqe8ScrYGf2MusHCqS1unN6My7L9n5JLKDSBHm2DPLXt+XC/WRH8C0
	3EsexQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hftyg9jv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:02:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so594520a91.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738947; x=1793343747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LlYuG6WB38gIzmIC/YDa25c8nS2xNNSGEFoJZF8X6UA=;
        b=Uc5DWruRU2/f3OrTSlCRRWVdCvVedeAeVTV7siI5d+Dnj/Duh49KeLkFqgKkUdh4lz
         dTATIEuvc8cbeCLn6cLusuA+oi38hjkzMC0tqKodJvbEV8OjFxHbD1KPF4Du7w5/42ZA
         NnINFvUejnuobAefKlOhWrRNCBcKYus+6uNwUCyQVUgYg1W2ExhypNTO7jXBPWOaCc+D
         G9esh5xxsZ84sYGuDsWSJEuO6lrpxY7aT3aPwuBnVRX0OUhlcIjQkzOPtZxaWp51uvcm
         4Enir6npudVrT2XEMO3QnvBvXdjZxowgVSdETUV17Qf+FtDyiRo60dkt8f0JgB+TN+ve
         vUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738947; x=1793343747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LlYuG6WB38gIzmIC/YDa25c8nS2xNNSGEFoJZF8X6UA=;
        b=j5LoFdDIp1JJTNPNvAQSPLmTUPV/UNnDYALDhbFG3XUYOZd5198WmYcqDiXAs5oMgG
         0GgF3mxbyhWhRee68lNtFKvinEUmUF4BLNCkcB4I82ogVoCLvT3L89wiYUU/NNQEIx9e
         RD8DiUJIdFYQH4ARcJFIt5AMKAhVDZcEaZquQ4nCEVmsU4CoryGAJu/4eDQFkn2mSMfm
         NbrKF/jZrX/D8XirDydajBekjwVVXRXB9wuEQCXcWC/JBhGgGQWuOtTk+l+GQi1k/bhA
         GFXiGqbMj/oayJu84ESz8A9q0no2CCZG5Zc2qVwG2Nhzzg4ZkGzEkcuqew24ri4PLV30
         IR0g==
X-Forwarded-Encrypted: i=1; AKwUvByKWLvfM4+Xkj/J27X3qcQIxZduHkV8w5geIpUroKjbeIhEi8UgRqQlsrTCNqGw+X4KvS9GbbHMNSdf@vger.kernel.org
X-Gm-Message-State: AFq9FYL1eaOLPLTdO05omY2d/JoIHmUNYdBCAdl2X7AMTH6RKeA6zUqJ
	mNtALRbDo4x4OSxaJFpT8Lzax7ccPhywtGFxqUGjvU0W5JNg/fdcJD72Z4LHJDhpEVrnLWZd/W2
	sF2VkpNuchvK/fkPBzqQcvLZfMnUQHRNpZxKMBpa3BJObQXbR2HY43oYwBXwxCUBJ
X-Gm-Gg: AYBFou0xCdk0yhr2enXNjEqQT0FcgvgEdE99W3bdhO1Srltl1OESnBO9RM2x07xxnyV
	stNwgdNlS/yFMNPrLzSGsLabGUyJlfxzKO+W6FzBSX7sCCIXlUh6jw462B0SQqxCfNmJvXixwQR
	NUjd6qXs8YjESj2/w7s2trlNdrc6A07Oq7G4kPyD1oqgAxcFwvoxETpI05e1fxia4hGwemrR0sL
	Sdy/2gai2c+HFGfgwIKTQ9ciT6r2xCHK2+XJz2bYJDvSW3FeC1tUa1QodRj0no0CtAnFS4Oj+uz
	wbG0w213l4Q29dgeUZT9H/sGaBkt/MNUpUt4a6BBOdAgmt5IGFqpR5Hmby3ncJNRF34LN+CeEO5
	k0alzrDxyKNToofPm08GZrpdSqajCS07w3UcrSaHZmEYa3QhE6ANwe/B4JR3eFuEXz9624kFWOX
	e5NPbNknPqbFFzRfFCPgaFqA==
X-Received: by 2002:a17:90b:2887:b0:3a0:516d:9f87 with SMTP id 98e67ed59e1d1-3adce5ee37dmr1056176a91.13.1792738946678;
        Fri, 23 Oct 2026 00:02:26 -0700 (PDT)
X-Received: by 2002:a17:90b:2887:b0:3a0:516d:9f87 with SMTP id 98e67ed59e1d1-3adce5ee37dmr1056152a91.13.1792738946137;
        Fri, 23 Oct 2026 00:02:26 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:02:25 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:20 +0530
Subject: [PATCH ath-next v3 17/17] wifi: ath12k: Add QCN6432 AHB support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-mpp-bringup-v3-17-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=cZpHPXDM c=1 sm=1 tr=0 ts=6adb0683 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=R6GObu012cZLLkk_EdgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX/Igjad4is+44
 48tnjHsBD6lT3dkgYQkZpiU2BQukIcn1uZ/QRHwSp3jxpPhGnetH6KU+hRf50hUlcAjfmFp+8OZ
 ODWoiGgRx7ONr9NfD1e6ZbN2MNcTpqw=
X-Proofpoint-GUID: JCG16J4XDDguvf-MTOtt_kxjJmEZpNQs
X-Proofpoint-ORIG-GUID: JCG16J4XDDguvf-MTOtt_kxjJmEZpNQs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXwlMMiWyFDxGX
 MaTsCcu1awsekLtSTy1x796h/vZszMgrFc7oRBC4pr1b1EhyM4tdBnSWAF0XjzDSZZkZ/9TwYRc
 mSOOuTkaWPG8IzjXLjIqY1P4su2xOkbEuAtg7NnxalFtYmypIq0YwCGFI5kDNtOddhl5zMi6nPb
 gB2XjVvTiVxWtZcs7aSi5wCY7KqoucxvLdVXI+qI1cggMjulEYALqvEC0maAqR5wZfeD/vP6g2F
 2YIqfD6CQ3Cy5xkoboW14vAfmrfZGEFqIbTIqsiwyHXPYBrXOvIAL+KXJtRdJEi3TDldlqEVVjE
 ngj0l7qxA+LQ/Ba/zjM9FiM56gpQUzK9yd0FlFH7uPKoiDDA5haSie0O3jvLgX/XWWtP83t2DhB
 NfRZ+ak9eNxL94LWsc28r5qbFdj5T9PPE8i36GfndmsNnV4rq2P45+fdbD+20f2i64FV/9USQGJ
 fXbSOfwCVqcXbLCfHvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

Add AHB support for QCN6432 by adding its hardware descriptor and
device-tree compatible entry.

QCN6432 uses a hybrid bus where the CE memory is handled through the
PCI interface. Skip the CE remapping and cleanup in the AHB resource
initialization and deinitialization for hybrid bus devices.

Also add the UserPD mappings required for the QCN6432 devices.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c       |  9 ++++++++-
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c | 11 +++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index cecafc12e8a8..b55590c64a2c 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -1233,6 +1233,9 @@ static int ath12k_ahb_resource_init(struct ath12k_base *ab)
 
 	ab->mem_len = resource_size(mem_res);
 
+	if (ab->hw_params->hybrid_bus_type)
+		return 0;
+
 	if (ab->hw_params->ce_remap) {
 		const struct ce_remap *ce_remap = ab->hw_params->ce_remap;
 		/* CE register space is moved out of WCSS and the space is not
@@ -1289,10 +1292,14 @@ static void ath12k_ahb_resource_deinit(struct ath12k_base *ab)
 	if (ab->mem)
 		devm_iounmap(ab->dev, ab->mem);
 
+	ab->mem = NULL;
+
+	if (ab->hw_params->hybrid_bus_type)
+		return;
+
 	if (ab->mem_ce)
 		iounmap(ab->mem_ce);
 
-	ab->mem = NULL;
 	ab->mem_ce = NULL;
 
 	clk_disable_unprepare(ab_ahb->xo_clk);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index 889361e637af..ae5380eb6f8f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -18,6 +18,8 @@
 
 static const struct ath12k_ahb_userpd_map ath12k_wifi7_ahb_userpd_map[] = {
 	{ .io_start = 0x0c000000, .upd_id = ATH12K_AHB_USERPD_ID_0 },
+	{ .io_start = 0x21e00000, .upd_id = ATH12K_AHB_USERPD_ID_1 },
+	{ .io_start = 0x19e00000, .upd_id = ATH12K_AHB_USERPD_ID_2 },
 };
 
 static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
@@ -33,6 +35,12 @@ static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
 		.ops = &ath12k_ahb_hif_ops,
 		.supports_multipd = false,
 	},
+	[ATH12K_HW_QCN6432_HW10] = {
+		.hw_rev = ATH12K_HW_QCN6432_HW10,
+		.auth_enabled = true,
+		.ops = &ath12k_ahb_hif_ops_qcn6432,
+		.supports_multipd = true,
+	},
 };
 
 static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
@@ -42,6 +50,9 @@ static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
 	{ .compatible = "qcom,ipq5424-wifi",
 	  .data = (void *)&ath12k_wifi7_ahb_desc[ATH12K_HW_IPQ5424_HW10],
 	},
+	{ .compatible = "qcom,qcn6432",
+	  .data = (void *)&ath12k_wifi7_ahb_desc[ATH12K_HW_QCN6432_HW10],
+	},
 	{ }
 };
 

-- 
2.34.1

