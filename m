Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD5244F552
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 13:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791723796; cv=none; b=AQxm7fX3WZwt/it3TDL5geQti5y7nQU9cs24T6hCl2mUYKpBMjNhdZoFB7thyaPs7nQK1EPLM846S2AwTFDw+ARRCuASPd7eTMkgZnVJSjQcTGDeuqgdMsyLoDZiwkFOTaffAc4L0vSVJOfxak2lLgL1uYPKoFJn9rV3mvccSBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791723796; c=relaxed/simple;
	bh=PeIDZ9ZvLBn2ComBGRH5CSzm2sE8lWrroJLbFwf4FOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N80rCvEVhL993QUXkuhSgXrnNI0YFKr0qbGM2bwjrDX5EJ+2VXmq2KMkLmpkeh5bmYsELZPMMFb5+HO5VKJ37z/rpWQybLudlpbXi7GYW5QZnAcgTB8TyLbuUrkFp7G1qKQtshXe1bjiP8Y2zDudUD6OaC9Uxtqhtfc6G1P29tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJeNe53M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OsGaUa9J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJeNe53M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OsGaUa9J"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B857Zu2381400
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 13:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QrRL4B0nTOu0FNZfqLDv3k7qnligih+VKCyqZVW5V5Y=; b=gJeNe53MlDbh14gJ
	6PN8SivIAS2KMq6tybuvrhX/9UtEMfFlQdlXbjMDDGG1An5W0M+QqWZ6NV4/ke6Q
	hx1PQ1Mq2uCYJjCG9bJl4PgUhfHAurcOrknhUYXwPv4XUJr02AB3ziKxYsVy+6Uh
	9AWQ0c1UF614BILtsBAlCU4JPmzgAvD7eScWwe8uCSYEcwsHH/D26HhGFDGWbXoB
	6IY368soxm78VMKESoaplvN0gYGdXDrmS0iEk18RZHHJ+ntAvTkjOyd8kwxDJw5f
	Lmp8F79rha0FSV5XxjVG0GDLTpQoy15m0/aBhRzKUTeZtF+mfJVszEbwkCX8wgMm
	dvqXDA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4eaw8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 13:03:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so3655797eec.1
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 06:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791723793; x=1792328593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QrRL4B0nTOu0FNZfqLDv3k7qnligih+VKCyqZVW5V5Y=;
        b=OsGaUa9JV+DglH3lB7qVH2NAto8bZnmiNwNBurgVKrEqWPkd19Smve9rGbMJGDAiBd
         9nNlCwoCGW30u+K/iWioHjmqMXiokBrO8rSxpzIOX2rjvpz7oEHrUvglmPk4krvFFCL3
         dLpuQnmY6RTZ5XFCmvMEhW+L/pDP11nfeLJN4y3oIx+7G/4fensyd4q/WfBbxaTA6gcC
         ekcwjIbubIfJOogFtBoDoXkFwda8a6lc2TbRLF5PJbVGdoX88aptq0uqW5v0QAtVonC2
         YlIpEqPCGxHSJfvBt0J9qpqMWLpOySFvKSRULtY0x9lm+cUaQ/UcJEixPpdtEcpepUY9
         ZAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791723793; x=1792328593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QrRL4B0nTOu0FNZfqLDv3k7qnligih+VKCyqZVW5V5Y=;
        b=fPquy4tQZ70BrQcN4y6zgdra52NWs9ZRh6+Q1YQ49WVr9XFIlSdRwVlMKi44ouZWZB
         DWwb02uL8PkqK7ZH3Lwb2hSyNE+nibz/+Jenncu0lu9WHQVA7YWmBf7SURa44nEWOUSz
         IJUDkD6LQpqceWWkUPydZ0bV1ZKXXCMnTUNRUKkOhy9622o3OXT8IRSbFprpbKrZZwe+
         C+I2sDFXuJrN6nnkr4hzi6/JcA1+CKl6D8HWgXVZWjBS5255pcatkJM5TbGMuf16p2p7
         CTqKx/IoEuWIa6Z5fLfqVLHn75va+rtSTDn4/MhFXwTKLQBiLkt5Sll2zl6wH30FIX6/
         1KYg==
X-Forwarded-Encrypted: i=1; AKwUvBw8kYzDbguTzJYqa7cHWpe/rLtgH/JKjixYFKHDwd1Ktw42xyWEaTqFhd6ssUdFO1+XVihajSOGKs4H@vger.kernel.org
X-Gm-Message-State: AFq9FYIU8LNkuW0RxR/yREdQDdWKzL3NVK2BHjpXqJigsyjd6JMHHiYq
	0NjogFCUcInPiMPs+8u2PFlCaoQEONx0WCOzzFFHUuDVgrymah4ibQSEbQqhNkc9H98Q4hLZ7xJ
	+WU6rDuoFi0yDjcKqF6W5XEji/1oiHCkPBMlnfiZUAJTcEO7TqcnxvzlgS7EpTWdWazZ0NFhkP9
	Y=
X-Gm-Gg: AYBFou0HzGgx6PHs3gciRgfr6KvHZHeMisVdMMoyd+ME64qfP7L5mvoRBaPNd0gv0Iu
	mbyHohjhKGxtNgoMK5A8QfX3+mFusaKUWiCBAV21j8TyNLPG3w22YC2iC+QxAj8hqw/Jzi57ogP
	rOa+Oz7DrcVcsC5OxajCkzj6YY8/C8o5LGSrpbstxZ6djbFUsl1g6WZdSoYanACsOBS7EZRajbt
	NrDZhaBfLqyNzD1g4FXCt8vrbvS4dLJTWpk1F9wAI1QkAJzus2ZTnbpD0dNLbYL6Wo5s0FxPFfT
	5lXpS2cBjvgB/r9hAiAqMql5kLCm/kRZOZ+M2oqRIeJJE3WKSCSSs7Xyxju0QZNmRvndQgiDVTC
	mK3zczdjbEsSLdr19I5mDYtME1XA/RsaUD9xoaCJNiUA=
X-Received: by 2002:a05:7300:ce13:b0:35a:3045:3aff with SMTP id 5a478bee46e88-35a3054a74bmr1119313eec.29.1791723792777;
        Sun, 11 Oct 2026 06:03:12 -0700 (PDT)
X-Received: by 2002:a05:7300:ce13:b0:35a:3045:3aff with SMTP id 5a478bee46e88-35a3054a74bmr1119286eec.29.1791723792096;
        Sun, 11 Oct 2026 06:03:12 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm27009074eec.3.2026.10.11.06.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:03:11 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 06:02:13 -0700
Subject: [PATCH net-next v2 07/11] net: ethernet: qualcomm: ppe: Add
 IPQ5424 QM configuration
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-qcom_ipq5424_ppe-v2-7-8c7b057e2c43@oss.qualcomm.com>
References: <20261011-qcom_ipq5424_ppe-v2-0-8c7b057e2c43@oss.qualcomm.com>
In-Reply-To: <20261011-qcom_ipq5424_ppe-v2-0-8c7b057e2c43@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791723782; l=3638;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=PeIDZ9ZvLBn2ComBGRH5CSzm2sE8lWrroJLbFwf4FOU=;
 b=bM/zT2AcQmX617BTGIoNHu/47WPJEbVZcE2X4by9igjYnxLouiT0hpXOtFaOQP/ec2/IHnbOR
 aZ0mf8ux3jsAgPzwl4BrhVhRCG+D3tiTnvkD2vcOvaIixfBJinYzUQG
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfX3siCdIe8LVLP
 W0MdKKPXccotyC3rnGb75CTpDfnFK/RcCcC+OOJn2UqKEptklLYXmog/lYPrq0uW5x+cnO1cx/R
 zw+7QBVJfCBBf8IV3s+CcajY6JTNTJXOam4UWIN85ZQTxWUxpVNMDD0DJ5PgCOvuSuGwHw6WwQC
 yLaFrtVshHFB7kRIXGZmtQuadf5pIhSh6rFf62YukPPWfh2KPfXXClnrAx6nw/VT+qlh70YDiN/
 91FaNuDMneAyt7aJkRC+slplxaDOnLMUaVxMC5W93vffivz99Y3Cg6x0slhSkMDfri2MrDHHWc5
 SmC9Iuf3SCadRllp1QztOQ798q7UMwXbv5PMqppU2va2EW+Tf2WMy/vZUqatSipnz/QkFnLpZGG
 OL40CipQbYLfAsf+1y0Rjf3Oa+HRe/0aWv7c+a9h2I3nU/d0oNEap2hcLUCy3SrUAgVNLfhYu5a
 crWNdXkK6CUYoB8ZSDQ==
X-Proofpoint-ORIG-GUID: V2hPFfTMi69VsTA_d0G2WX6IZn3RUxHg
X-Proofpoint-GUID: V2hPFfTMi69VsTA_d0G2WX6IZn3RUxHg
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acb8911 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=9QRhiHdFDdAkXRKojpMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfXw9GqM8AZSuR6
 lC+JJMBIW8R1iupMZMKN8SLP+/GtTJtXSSCeoDY5ZBQUajE6wWbr8ULGFd3LuXih7NloeoRCPqt
 HKLX1+3/YubakkiBkLapwTDkrGtAVTA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110051

Multicast queues are dedicated per PPE port. IPQ5424 has only 3 physical
PPE ports, versus IPQ9574's 6 PPE ports, so multicast queues 284 to 299 are
not available on IPQ5424, and 2010 buffers are assigned to the shared
group0 buffer pool, instead of IPQ9574's 2000.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 53 ++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index ef46e9b133fe..d2bd78853b98 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -314,6 +314,37 @@ static const struct ppe_qm_queue_config ipq9574_ppe_qm_queue_config[] = {
 	},
 };
 
+/* Multicast queues are dedicated per PPE port. IPQ5424 has only 3 physical
+ * PPE ports, versus IPQ9574's 6 PPE ports, so multicast queues 284 to 299
+ * are not available on IPQ5424, and the buffer pool assigned to the general
+ * 'group0' is larger here, 2010 versus IPQ9574's 2000.
+ */
+static const int ipq5424_ppe_qm_group_config = 2010;
+
+/* Default QM settings for unicast and multicast queues for IPQ5424. */
+static const struct ppe_qm_queue_config ipq5424_ppe_qm_queue_config[] = {
+	{
+		/* QM settings for unicast queues 0 to 255. */
+		.queue_start	= 0,
+		.queue_end	= 255,
+		.prealloc_buf	= 0,
+		.ceil		= 1200,
+		.weight		= 7,
+		.resume_offset	= 36,
+		.dynamic	= true,
+	},
+	{
+		/* QM settings for multicast queues 256 to 283. */
+		.queue_start	= 256,
+		.queue_end	= 283,
+		.prealloc_buf	= 0,
+		.ceil		= 250,
+		.weight		= 0,
+		.resume_offset	= 36,
+		.dynamic	= false,
+	},
+};
+
 /* PPE scheduler configuration for BM includes multiple entries. Each entry
  * indicates the primary port to be assigned the buffers for the ingress or
  * to release the buffers for the egress. Backup port ID will be used when
@@ -1535,12 +1566,28 @@ static int ppe_config_bm(struct ppe_device *ppe_dev)
  */
 static int ppe_config_qm(struct ppe_device *ppe_dev)
 {
+	int ret, i, group_buffer_cfg, queue_id, queue_cfg_count;
 	const struct ppe_qm_queue_config *queue_cfg;
-	int ret, i, queue_id, queue_cfg_count;
 	u32 reg, multicast_queue_cfg[3];
 	u32 unicast_queue_cfg[4];
 	u32 group_cfg[3];
 
+	switch (ppe_dev->type) {
+	case IPQ9574_PPE:
+		group_buffer_cfg = ipq9574_ppe_qm_group_config;
+		queue_cfg = ipq9574_ppe_qm_queue_config;
+		queue_cfg_count = ARRAY_SIZE(ipq9574_ppe_qm_queue_config);
+		break;
+	case IPQ5424_PPE:
+		group_buffer_cfg = ipq5424_ppe_qm_group_config;
+		queue_cfg = ipq5424_ppe_qm_queue_config;
+		queue_cfg_count = ARRAY_SIZE(ipq5424_ppe_qm_queue_config);
+		break;
+	default:
+		dev_err(ppe_dev->dev, "Invalid PPE type %d\n", ppe_dev->type);
+		return -EINVAL;
+	}
+
 	/* Assign the buffer number to the group 0 by default. */
 	reg = PPE_AC_GRP_CFG_TBL_ADDR;
 	ret = regmap_bulk_read(ppe_dev->regmap, reg,
@@ -1548,15 +1595,13 @@ static int ppe_config_qm(struct ppe_device *ppe_dev)
 	if (ret)
 		goto qm_config_fail;
 
-	PPE_AC_GRP_SET_BUF_LIMIT(group_cfg, ipq9574_ppe_qm_group_config);
+	PPE_AC_GRP_SET_BUF_LIMIT(group_cfg, group_buffer_cfg);
 
 	ret = regmap_bulk_write(ppe_dev->regmap, reg,
 				group_cfg, ARRAY_SIZE(group_cfg));
 	if (ret)
 		goto qm_config_fail;
 
-	queue_cfg = ipq9574_ppe_qm_queue_config;
-	queue_cfg_count = ARRAY_SIZE(ipq9574_ppe_qm_queue_config);
 	for (i = 0; i < queue_cfg_count; i++) {
 		queue_id = queue_cfg[i].queue_start;
 

-- 
2.43.0

