Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F9B367B87
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 06:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780988098; cv=none; b=Dg2eUp1+AhzQSJRQK9CUOMTcwzusCHxJ1rbkgFViJTRKbK0usvKpfH6nD9bt4DnZa6rUfyYbGZ/3bLZID5njj4ee0hpmkA0RIb1I97q7RZNA9C1mBm26rhv4PJ09Q9PWas9e9BaIZsmJYOvwxuVXYHRmoSmWiXd8EurSc7DmM18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780988098; c=relaxed/simple;
	bh=P0Rvy7ba8na9OOAKgVTrVcNkZDLvIMoxbJGmhR9MCic=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Kwt2LYGKXhaqM6NH8tyG5SwJg8d2msMDHhPFynitfJfGMzWznAe3SQAJU70lisjj1PhQI2vJkuTrzG0i5oIez2wSn+aw/bgAM0nxjPBxkis39Bv/HY1EoWlgEnZh2nX4/543MeYyuoW2hDUt52HkVvyyTtDgqzrg+REm2MGoOh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cccoHyIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Haesl7O2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cccoHyIf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Haesl7O2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wkXq994368
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 06:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JjS4922Wi791YeO2uSYBt3QldN53otSS5AL
	ybDv890E=; b=cccoHyIf40ir2AIAkPBP0bGxzMWaLzlOWLrM9NlKUdgirVWi2q/
	yUbJyx7XIxoftX1VRtds7/JNL6Fjqvi8q/DBrWxSPRt72H2ep7y6pv5/shk4CbHC
	89SzIzxBIe5wQfrWW93p6yS0cksBeTwvDE3L/g22BC25St2PEl7FEmXTorqW93dR
	3Fe4ReUX0Gbf8id0yESlmFkYvJlgCwKitrjb4U8u2Kb7MjrShlfk+GOV22Il2JB+
	VLVABIbb7j86CNMo14BF3FC/u//sMdmYpKVIl0JqaycGMY2ydiQckktbieCFlm+P
	TlxUsSH0XpkxgU0H6u/ts149edNG48b+DxA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkw5qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:54:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso9259316a91.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 23:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780988096; x=1781592896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JjS4922Wi791YeO2uSYBt3QldN53otSS5ALybDv890E=;
        b=Haesl7O2JZa3JLOZxDrtQphnTYlb8Qs6wDjYSRiAcCGzSMK/B2YG+YL3iKT8p50IQH
         v7rfn/eJJ2sEv3bePZ+mJEVifzRPWR1jKKHcgXxt6ThNBhq2LJ/dxAIq1AQMTJZN1shD
         qT7GF/nkP0qv1m01oAPossJIlKlLMiJeE/xbOF1TF99RxPED9wakQwFPC3hcWIf+sVYu
         5JLMhY4eNXJ0GKPj2c6ehFrnUz56xYJ+degKmhSZE7Az+SY49PyPFgNAEuuMeUQVwGgR
         WPm/zG1FGD/zQlTq3U0xPBpOAXWJqnMHNv+epAhgVAvNNhYV6NVBnEtdVj4iDjS/QJBo
         YuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780988096; x=1781592896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjS4922Wi791YeO2uSYBt3QldN53otSS5ALybDv890E=;
        b=Rhyoos+fznMrmtSWZV4pahrrtNVaWOIcnhQJQUIepOQr/vZM3fdXrRDRaIDPf7wX3m
         ms4AIRrwOyEJULMfYik7gmuHWaP19xtGr1RRwubcCRxEnpmaDHgkZ4fDViZ941VEvP/l
         Wxrs4beenGQ+++gpzmkaI+RLUeBLMRDazaiQGRp/1MgzhiJxU1+6BeRt9bIpX9IWVr8U
         ZdDT+Ho2IwNNQkvX2RnectmoxEqpT2Q+Mq18h4EiS4XmGNEfCW8Qms+I6avzpKhrX0NI
         8GiVD3mKJx/DdAi3ereJOm7X9V4VHcdFkk5TFsn3Hy7JK/rCxQRDEBocK9FjifCCnoHr
         PRsg==
X-Forwarded-Encrypted: i=1; AFNElJ+qd1fWIkkWELTw8Rw491yNd1dTOTVv0tf/HJmNRMSh11nQrA3G/2hZ/SVFWkIDbp+W2lV+WCMrYjkF@vger.kernel.org
X-Gm-Message-State: AOJu0YxCX1PDdvnfph9s8xbxg1k7sICesJw/siM5m5jNMt5YdLTseJj4
	9w6SnInjr9B2dRLZhG6t6LJAJvFOMvxddl4OLEEUErEFg6So0IG3PWg9LeYOAxyJAoMDyf3Wlv0
	Y8m3buid6aVdcCqYn5FKcBrID2uAxoj4cNYRxaoTbJzsK69PoqUptu0PrpeDQ6HaHsNvtTmuM
X-Gm-Gg: Acq92OFCU8mvAswCBDGEvLbzMfPXODR2xgYRA/wanO5t1ARMaJj2xh9zdwWulemD4Ml
	ACRDvTMP8MnATtHTQSGgAuAJCXN4KnfCDAuiKMzCsttuSlKngrytD0DbnexnxKLRvuDSgORCh+R
	2P+FhZH+7nLmt852ihsJeqge2bCjisFhwkkyjauIWIlGF/F5M/FpAbZThZ/APXWNde1WDzJtGCa
	7ba+5CYvnLYnaZW1x2VJqgT0Q8WzpBlw3kMaB7oi9UiGRJZgVvnnvOo6WRsCA+Vlbnrar62yWTA
	M/JJ+dlrcJid4lvxGrBbD/D+8qhKf2Fx+33LSknr8uxigjkfm3IuiIXiVsJrFR5ym9VR5PIxiba
	GGWW9rJt4bxq28UE0qvsNPB60ZatIfQ0f7t6frqQglRObNXOumHWO59vNI+VVYJduj+vU1jgbzA
	IU7Ibli48rVq9R8X6nVZnPOVpnNyIA2TFK2sBOxKHGRo8oN2q82jJreCbevifpmA==
X-Received: by 2002:a17:90b:5906:b0:36a:5d1f:7ac with SMTP id 98e67ed59e1d1-370ee344dc4mr19888003a91.3.1780988095708;
        Mon, 08 Jun 2026 23:54:55 -0700 (PDT)
X-Received: by 2002:a17:90b:5906:b0:36a:5d1f:7ac with SMTP id 98e67ed59e1d1-370ee344dc4mr19887989a91.3.1780988095328;
        Mon, 08 Jun 2026 23:54:55 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3712fcb3a9fsm8607926a91.0.2026.06.08.23.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:54:54 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH PREVIEW v2 0/2] Add support tsens in ipq5210 & ipq9650
Date: Tue,  9 Jun 2026 12:24:45 +0530
Message-Id: <20260609065447.4024695-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: W70_Yo_9SckEYEvurz2oJ0Zw7JGzLuT5
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a27b8c0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=O98__aPPj8GWcYWuEFUA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: W70_Yo_9SckEYEvurz2oJ0Zw7JGzLuT5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2MyBTYWx0ZWRfX9wJu79flE/UJ
 Nj7xAVgHrYx7Kuee1jJqwrd7hsylKAuOVK6JJ0RyqQ608J1ArciCXZpMlNr+Px9lNpoIlBauJNs
 inXvI6EwtpD921qMhsf7B0L+JPoEp/RDgZMKyJ3OP+hKnDkHjTVb3ytDV+idGGOv2uLEmIoMT0T
 YTx8KBNscfQFGgUaUFQ5TVwp3tOOjzKQv6F+XNSc6b6kpV0+seavTroePoTGI5fjHkxtU+TYBF3
 pzYAK30MhtOzbBr2ZyCoS9BC+HgY3sSfVsdNY19C/ipUX2AGy0XPKEBzCr9KZvW4gV0RZA7bOpx
 j86e7ddBAgMaAdEesW96w3BeU9zF5qWue9EGtZF9MLwc7Ro7Cg+hfTzB2WKTUy5ifFgEyLMTUl0
 9mnSBdbR6Ntcne41L0ZARtk9nktVm+hEqAd1ycJw6tgEudPrE8VfviT1AMo3JWhSFTPyW5SdNXk
 oxUmAZ8Q97QJcVJWCkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090063

ipq5210 and ipq9560 have the Qualcomm tsens-v2 IP. The tsens framework
in these two SoCs are similar to the one found in ipq5332. This series
adds the sensor data to the tsens-v2 driver.

v2: Combine bindings and driver patches
    Use fallback for ipq5210 and dropped the driver changes

v1: bindings - https://lore.kernel.org/linux-arm-msm/20260515-tsens-yaml-v1-1-8039c62cc249@oss.qualcomm.com/
    driver - https://lore.kernel.org/linux-arm-msm/20260515-tsens-driver-v1-0-015ca76f1418@oss.qualcomm.com/

Varadarajan Narayanan (2):
  dt-bindings: thermal: tsens: add ipq5210 & ipq9650 compatible
  thermal/drivers/qcom/tsens: Add support for ipq9650 tsens

 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 7 +++++++
 drivers/thermal/qcom/tsens-v2.c                           | 8 ++++++++
 drivers/thermal/qcom/tsens.c                              | 3 +++
 drivers/thermal/qcom/tsens.h                              | 2 +-
 4 files changed, 19 insertions(+), 1 deletion(-)

-- 
2.34.1

