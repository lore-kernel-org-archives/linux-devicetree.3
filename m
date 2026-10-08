Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945E24D9554
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471119; cv=none; b=R25QxkfUvk/SQI3z0H6v376W7l8aOwE44WtqyhqRpygL0eaFVVISeHSqnz0WAhg8lXEU1zdgoRxVQwOe3x2jmNIei6n6n16p2VIsKISjwBqXki7vv5a1E6NdsXaIJeb4akAWAwSKhfGrxGMHICxpuhR8zwF6S3Z4C95McR2AlJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471119; c=relaxed/simple;
	bh=xAlGA9ZWS04KIS+benLm+w2ukxp8v4ZDhslbugqb1fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=obRoiXMbcW1UKtCcpaUsRcPWPQve43YzKiC7EfSzQgQSkcyWtO0UEjV7noHaPnBdrVZjDdx0k71iN7jOI98STF60URgUnHXLenweKp7BtA7KY58q305j9NfArfS8WAplQ9uYm1+vbXJyTjjeJdVL/gfaJBSYxWoy+JYjVDc4COk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M9eKl15O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lo2LkrxG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M9eKl15O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lo2LkrxG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVDbA3145539
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 14:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YlDcZg0BQE5duZulU+ElFFqS4rkCwqS++//cDsA6uqk=; b=M9eKl15ODcR90CcJ
	jF+S5h2v85vXLm2S7D78vA3hvC3ETJl58ZW/dwTQxCsXPPl/TPzpYx8Cs/rxbBOh
	cVUMBpM+GYAmMFDxVAhViBtAXRrNqQBQOr2A55WR7EJyDEAlSSHBH7mNp4lOO8O1
	tRc/ZdzkDZf+kvjilkaVteDQBgufcwdvjpzSrgRWNE2UNzXLlAxAyOc3etnLQfCk
	h05VUUXW7ue5+J/3KZ8A3Ex8i+XeZLqw22a9M0dFp8WvQlaUHnM1+wxhgMgQKrpe
	9C9Kx7aBJvhonehMyyB071bZ9z0y+h+av0ru00/nvBIrTzlWTfiio3Az/fEeZcTY
	9XCFdQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj0fyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 14:51:43 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8ab43f7f5faso80582467b3.2
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 07:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791471102; x=1792075902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YlDcZg0BQE5duZulU+ElFFqS4rkCwqS++//cDsA6uqk=;
        b=Lo2LkrxGzmQUm80LF6Ow7bhUuAPJ1gXhYeAdejv/14qhOC/IBKVZ47cYpDSUZHpbDr
         7aLMBi84+G2U0H63iMQd8PwhFt6q7WVTsSsaj8yslOUpVPSp/a5Zqpqu1w8crXX3GoeJ
         /17Q/+8FhbLHLv/HfNncJZU0LnCgfZIUDIYNyYCbLBMJhXj01w9Tqko1ZGYVVfGnvUIt
         U+KiI2TCEqRV9AaoX3YRallL+fz82ojpOcq+g6x4FbSLY+ar9DV4UHaDxhElM/CSNZ7n
         QrSudZxEiXGXl2t7fqreDKH82Dinaj9qcjeO6GjHF+f0j+g35sC+3yZRwC2BILxdkc5P
         OiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471102; x=1792075902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YlDcZg0BQE5duZulU+ElFFqS4rkCwqS++//cDsA6uqk=;
        b=222FX3JkUVpA/LqnDbN976Zj1mMEZZ1qKgbRJ+PgL0tlZwCcIw+jfxbAp0S6IzywsV
         6Swd8ofqXKPiII2m0tngZpdn0/fbFhFJcvr+mMdw5LMYsnXL+Xa0SwiJbowfl5rN4ZTS
         1FlZI9m5/+2Fn4rnLNB8JBkdwcLu4JLQnZ8Wa9icC6P0koKHJH4SpV8QPWp0uKHCoSKo
         UsIRrEBDdA/raEOruJ0O0sodfUB0iwYoOywfKi/NZvxEd52HRjDroHkn24Ij0C6XpAx9
         JyE+Mt1ayv9o+ovGvH2yqFRp5TwUgZGq8BMmq7b5+nA8L74EUyWyYoWENQBqGfVLcNPn
         SLtw==
X-Forwarded-Encrypted: i=1; AKwUvByp7XXxL2nHegB6slsTz1bGeqlXPOCcHLbf1TWdYQgGMHebrW43P9mtx2aECwipgW2OMkpmxovhT4g1@vger.kernel.org
X-Gm-Message-State: AFq9FYKwcxcdTuScAZxdWskBFgKR4S22Mc3Xw8DqJrPZOa4X7V51ENJn
	IlcJw1ab6M/7V8zc/AC1/UN+h9uMVeS6YHlzFhjSPo1r8HolwDi0IHAAvUt22arx+ZkgaiRMiP3
	48aE1lH+jTVWXlJ60v3QyF7/4wFvwG4FsUciFz/QUEDZFvb0hY1/43QNkcRXSPdle
X-Gm-Gg: AYBFou0Q0W7G4aRYeLVtLOhTSUdPHh6eVmrCdv797P0tJi3ASZe/wqHulUJ0WT11MVQ
	/mTwNmOWil18W2P0p+4fbBOUIA9sm6HWxL04MtT9XEEyNy33HaXdEGAXwgN99CGYJxcoPprt4bQ
	l6CBGCqCfbpMTBdwoOSg3im8et8Tbma/rViByudOSLUI4hJ9NsgV4JJsGnOIPoLuJ/nxHBgCWzP
	9p3PI/yOO4+rYx6NJYGPOpZ9ARPfBeqb7jToBoY9wYH88+L/ko0lAqc4yx1bY+kE9C4dSwoBnLd
	lnsCUAtKJ8D2KnTc4r+FqlJU/P5euAb9XQHYsdvFDhVmFUU1hShl/2st5/b38N4eL0+R1JSidNW
	huo3kwKo6bpcMJ5g7f+Ev9YO/rhTsLWumllRRBT2kNKY=
X-Received: by 2002:a05:690c:4990:b0:8af:1cb6:30ac with SMTP id 00721157ae682-8b05b11f8bfmr27029277b3.67.1791471102395;
        Thu, 08 Oct 2026 07:51:42 -0700 (PDT)
X-Received: by 2002:a05:690c:4990:b0:8af:1cb6:30ac with SMTP id 00721157ae682-8b05b11f8bfmr27029047b3.67.1791471101695;
        Thu, 08 Oct 2026 07:51:41 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05ab62607sm20903407b3.22.2026.10.08.07.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:51:41 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 07:51:34 -0700
Subject: [PATCH net-next 02/11] net: ethernet: qualcomm: ppe: Fix multicast
 queue config table index
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-qcom_ipq5424_ppe-v1-2-16caf43e44ee@oss.qualcomm.com>
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
In-Reply-To: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791471094; l=1654;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=xAlGA9ZWS04KIS+benLm+w2ukxp8v4ZDhslbugqb1fc=;
 b=WicTMr9iqzpLFpADMxM3B1i1JoCHa5f6Q4Jv7FB5145K/jZ6oRw1Ol3h1kdvkkJDLfq+Xmdzs
 s+fAOlPbvx1CvSYzhB9uZbBCa4NJR7YNVBPbBSCBqH8VUgtY93rdtM2
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX4zshBOPsMM6h
 OKF+T4bVz4lbnzDFiKdPAf4qbuAr2DHsGo8gH1LltgKf5FKGa/2WHdbgcJPRppVsb/13pi8TT7u
 KFt/IrXaebAzJyqlxEurHij0+7s3RQtN2ofmVbMijbVFkyHDWakjmQI/vTJyCngLltevcdU+UCL
 qUELBaPay8N4MGccRAH7/jjpdcg1ShIgd9StN/CZg/K1oPnfor2k70/leGZckJhn2mrGrrpiflM
 gu1nnsTHDY/eU5JHA8ENUSRQYJM8pflKiMLFvZjcKGxajOR+BLgcyxDhEIS3Zelof3+TT3s2Un6
 03NWfs1cWDoAD3JkGjgTyYKKMmD1Td1Jcr63qUFZacGhDRIuwhHQofL/Z5HP0Bzy54A8RuAC+6y
 6D8sZh0ZkDgR+UUj6HR2mPsXIiGUj+MXwUNm67PLKzh355jX2bunO0MtF1gh5Y3+gmpJXBIxSS9
 kyy5zp1DIVHThx6aKZg==
X-Proofpoint-GUID: JfVyY07JDkfoxzrxYyw9ahraa_EWzz1a
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac7adff cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mx8D-BtPiHKBULbPJ0MA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: JfVyY07JDkfoxzrxYyw9ahraa_EWzz1a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX8SFq0Or3Ab8o
 XvVYIzYF8R15VXWtHXlhvxfkaaaHBVQSnSnPkf790JPZ8n1klzqJ/WtzStZMMpmQHejBOL0B8BY
 rmC3TJEX3iA8qBTwswOo29o9EIxV170=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080059

PPE queues 0-255 are unicast queues and queues from 256 onwards are
multicast queues. The multicast queue configuration table has its own
index, starting from 0 for the first multicast queue.

The driver uses the absolute queue ID as the index of this table, which
is out of range for every multicast queue. As a result, the multicast
queue thresholds are never configured, and unrelated QM registers are
written instead.

Fix it by converting the queue ID to the index of the multicast queue
configuration table.

Fixes: 806268dc7efd ("net: ethernet: qualcomm: Initialize PPE queue management for IPQ9574")
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index 125b73be92b1..8a553902ffad 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -1530,8 +1530,13 @@ static int ppe_config_qm(struct ppe_device *ppe_dev)
 				if (ret)
 					goto qm_config_fail;
 			} else {
+				/* The multicast queue table is indexed from 0 for
+				 * the first multicast queue, which follows the
+				 * unicast queues.
+				 */
 				reg = PPE_AC_MULTICAST_QUEUE_CFG_TBL_ADDR +
-				      PPE_AC_MULTICAST_QUEUE_CFG_TBL_INC * queue_id;
+				      PPE_AC_MULTICAST_QUEUE_CFG_TBL_INC *
+				      (queue_id - PPE_AC_UNICAST_QUEUE_CFG_TBL_ENTRIES);
 
 				ret = regmap_bulk_read(ppe_dev->regmap, reg,
 						       multicast_queue_cfg,

-- 
2.43.0

