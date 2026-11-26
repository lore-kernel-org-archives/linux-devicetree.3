Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679461;
	b=Uj66bfVBRqe0xo8yGNzEQ3NOsTdseZwqfLRbcPnrd7aUNqT7H0sGGSlFL6+g/rcDTKJy
	 kBNaiemUU1sGZvYs9zDteWYKfEZilaqhmdpHZM5/SwaVdK0Mxo2OEdG/nTDjEWx4Yy3Hi
	 3CpdvW5sNLnrHLDmrt9y2OSViwbN5kTfBrV6AMXBAZkO3Y8tsKtY+lp9bXI4nqIa9JM8J
	 w7Q+ATI80WDi+ZuiabZl8yUMqT5u0nLe1mNeC0T39uESzEYac1NBVXUHlUUr661arHDh/
	 5cbCahIKxkfr0acEf1GXW+wWQZy/icD+MJrYrKupZfFiciUrj/Pwh2lcFAEFs5DS0cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679461;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6HRhdUoyZbzGkLk2F3JpCB31n0oAXufUVBdSRNlFGfU=;
	b=EdDQCNRRTOUWsZej6AMwi/djz8JQKUUP98BUgUZyQ6ObRLj2Sji/FvoiKSHz5wK0fKFO
	 aLSht1O3ozkzqNz04+uqIlX2nD4ZVYx6y/LFJ+Q65lemcnZ8ZSLI4ZU+TpMyl1RRCIhNp
	 nuwQwzFFFrDCeAdl578Ya1ATABPzvBo5kIjojFPrsJ2RarWQCGqVkF0gDCzF1ANIK5Tnh
	 QEgC2n49Y+c3Y/Q0c2tx28nOqV9VZDOPUUQQ07BkCCPbrvYKPN3msDchwfVvN03KxrKZM
	 69xvmcLynJ0RZyCFa2+lT5OHeF7l0vbh57mppR8n4UAjEMayagvJZq9WA6dtu3LOiog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4cHjUXm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAE8606A680;
	Thu, 26 Nov 2026 07:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAAE8606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4cHjUXm
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B42l2175787;
	Thu, 26 Nov 2026 07:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6HRhdUoyZbzGkLk2F3JpCB31n0oAXufUVBdSRNlFGfU=; b=D4cHjUXmqw3FrCGh
	XYsU0Z/Cs89j+5EIXPIGcXGXU+aPiix24DVNRLwigXbAxnCygwSgSu4djvbf+bnX
	Ne/Dz4SvlSh4qSPaUitYvX4QmzoOV5qHMGcemMjNKx375qkcBPoIaHVRu7qUJlpo
	9xIE8ySKyEPa1rN0fCxmiEjJakJO/AxCMu0RWwQLYytXv12V347r2xQinVyChc6J
	v0OQZ/+et8IiIiKVnYq0WIXoX/zNn+Qh+0/JGwXKnwHklBJxoC8xl6UTMxeTcQom
	syBMcLVHNZlZaMfVC3EaF25HGMgnD+suUCqRWYuKFllVDuRkQoKh1qYsKMU5d+ZD
	3ZbHYQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahubn6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 07:50:46 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7oh7j2051594;
	Thu, 26 Nov 2026 07:50:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AQ7ogCG2051576
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 07:50:43 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id D616BA76; Thu, 26 Nov 2026 13:20:41 +0530 (+0530)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:20:37 +0530
Subject: [PATCH v2 4/7] arm64: defconfig: Enable PCA9685 PWM controller
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
Message-Id: <20261126-draco-evk-display-v2-4-95395c5ee387@oss.qualcomm.com>
References: <20261126-draco-evk-display-v2-0-95395c5ee387@oss.qualcomm.com>
In-Reply-To: <20261126-draco-evk-display-v2-0-95395c5ee387@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795679441; l=769;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=SNHHJIV+tMKguYCj7SpMkqYZwY1KQSq8CiQDCXHJY8A=;
 b=IFx7jF0C03vhbZk8WRa9VS70OslzeneiOLZRX+nFc7ZUPNXl2LgsfE83BCIdqdoE0WNKvAbGq
 fm6aA2NaHoFBDxm1uluvIu65yIfO/bbywVogrFhP4D4Tuc91P/Gb3cZ
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: qS0ymWrRnDMXZNqK5GA0XHPbPT-qzDmx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX+niuEfRVgpPY
 F1FmRzmhOVsdTaTHaVihPKL1cKtm06KLRjC/A41RA57BHZ3CiwXAsBczvWaRBDcgyZ4ydiQo1M3
 3VzFL8gEEPDRLqhWu/lE4TyJ8MgRdeM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfXyt5ypvSrR+bm
 EKPA02ckuDWRqBTpWu5PZs1WtkndIwriSbwEoUk97pKSvkI1h7h3WZZFKwOClt+1AawIgtK0FDI
 nmf9Mmc82shCDo+1u+40JvRUVoe6cjqcqCPp722kP/ud+EE3zBgVjxhOQKLTa/esuIGGRmZdHTh
 uR3Qo0OHBin68eGXpbbHqZe5VO63LKKzwJQjKiSwO79Fe6bjUogj1jH892U+h600CSw0VyMO7AY
 U0LiAYTm2QlNQiLxmt8YKPMAjcVrmgEWsBtNNWE2i8RYnG/iXZfQ4mcJc2LLnzv8yN/rFcb3PWe
 +3MKZFpo4cuaKKW+muVnruD7CpJWtE5PJbPT/A8xGmjoVpy4kgcpvJPyLiVZASC5jZg20OFwYzn
 M+c7Xlrwgjsf14kyCS/ecdQMtKM5IYojBr37Sjfm/9rdw4e4vkoIjh3OqZZDaZ4F9NPnCDDq4x7
 Z2ZN/D6UAvc4BciAOkQ==
X-Proofpoint-ORIG-GUID: qS0ymWrRnDMXZNqK5GA0XHPbPT-qzDmx
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07e4d6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=qI7vs_IE5eraBV8M_hMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260029

Enable CONFIG_PWM_PCA9685 as a module to support the NXP PCA9685
16-channel PWM controller used for PWM backlight control on the
Qualcomm Lemans Draco EVK board, as added in
the lemans-draco-evk-lvds-auo,g133han01.dtso overlay.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dfc52e32802e..7e381899f3c6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -614,6 +614,7 @@ CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MUX=y
 CONFIG_I2C_MUX_PCA954x=y
+CONFIG_PWM_PCA9685=m
 CONFIG_I2C_MUX_PINCTRL=m
 CONFIG_I2C_BCM2835=m
 CONFIG_I2C_CADENCE=m

-- 
2.34.1

