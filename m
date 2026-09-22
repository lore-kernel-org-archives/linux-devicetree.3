Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94581531610
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790118395; cv=none; b=FN+2w4u32tKRUcz/4FwZsLre0j0key7DE3WKvEnp4QQShUHJwLRGyMRBHOaabh/G2yiOZNKU8urcKZxX3/1m1Jsy7F7PC5RN5xJV+WZMBBZ4G6alx3xwMjKWqdXIwqoXog7W9KyQuTgkjWuUGqourC7UX9bhA0WTF4UJ06EZaLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790118395; c=relaxed/simple;
	bh=xHwgCpYLu0si4Pfes3zqvjcu+Ip84iYvwtsZMW4bY3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lvmMnvXj7ZJHq6ApJkV0tNVRr0THOH76+maWjHKJE20M69/o0G0yvWOoyZHzlM5wilSKrtW0v0hMmbzlwOVshDS9Wo2tRzavav8PXDiJ+3rByMxiszcl9ASNrC6gUzQqt+tqrMozD7RdhRqGlS3k1VD/1KCsYgtOzqZ1GMxNvok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/z//zjE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ea7c2PNW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/z//zjE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ea7c2PNW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJD8ga1166859
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vjll4+6S3K7UaA5Jfvs9SMPlp+iGGexPGe5YOA6lo2M=; b=P/z//zjENHGpZJfu
	4HWAIomuYvEbYpl9VuWVfsy3PIpAPZ+Q28VfAbPjeTkljfHIC1I0vogDQWxANei2
	u70KF8/3sOvr6DkcxyWRZf4E+dtUCf/JK1JKUE35jMh7GwHX7T2JZJNufr7rHiEp
	GIdypWwj0YyLmOBz26y3/G2eOVJ2Cz+/DJeoC6Ej6BCPqqsV5aZJ++4j4f5iBSix
	ohwCoYX5r/4bFljov1A1JiMbY0A2K0QSq2MKBinSpsnAO9RwxfdHBbNXD/VJkUjt
	gG88OoWg68yB1lFoyUjdsiNGcjj6HQQKLAEP78na/JbVIdTSpNLUlhxO6GhJfqrV
	bO1Z4g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw10nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:06:31 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-32850005b6bso362626eec.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790118391; x=1790723191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vjll4+6S3K7UaA5Jfvs9SMPlp+iGGexPGe5YOA6lo2M=;
        b=ea7c2PNWEscWFMLfcwBQlHuv6h+HLRvp1ZnDanzyAZYq3C8HfXE2gYCEnTa5K7yzFW
         fXRufmgwMipW87UOeiHH8Xt8aU5rzT9x7uNEdoOgFS2g++R6/UdAhQxfX68ORTCSer+7
         OrcKR5RJSJanteZwuGN8LpxnKbPNZqzQZRv+V6dVYkzbOFBFQZY91yTvOq5MJFrujvT6
         k4FcG6zGz8sSwXsDwrEfPjKucI9Mf224vS0hkFWbZiK5ENLmvyIr0Bv4bXXfUBCpRCyY
         KVKr8QC5P33PI8oGpfJIfBYl0jHz58ijpZb/5kKDFrjYvFq06CSeo4lMFM9MbBF/c2Hp
         Fyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790118391; x=1790723191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vjll4+6S3K7UaA5Jfvs9SMPlp+iGGexPGe5YOA6lo2M=;
        b=CsTp5vh5iLyzz+LjueJFrlR4icuzm+Rb63m0Q9+PbY8Par4k0k9AQ/K7yvlKec1bxI
         VNOINq/JIU5024x5l0uddD+3Ts17VMdw36g2iCzHTCJLUsMUOdfR4SU6hVXQodtIhlGf
         hqAdcW8MoVRzQI4j6b0yfwglypdobG+zM7cmMK+2K/EOA5C+gQ+NzVBUSDB7VZ2H4QpK
         4AQZ7QKohiHEfe41tu77OgcweGBaF4MyGaiDDQJdYGeOCMGVGxy0QT9xeGwSRjyZgYT4
         YOuFh7RgqhTPiJvYleLSkOShdBYeBO6UVCVtgu2RC2vTxjRIy53dP9mvfw6SYBzXpLJ/
         nU4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzgSFDYY1kVQKJX5yLqTOFhnYZluen+e+FxWiqQr8vZ1NBaWAhtAQPDMYyLsZzVmWepJzrYj67B4ySu@vger.kernel.org
X-Gm-Message-State: AFuF++mWi2NmWRzEDOQ1q8UwYLTtj9NQiVfaR/DW+4R9OJDyvQfkukgv
	P2UkQ2nRl0qD3oL/4DyhCSSSe9NfMx6urT2NkQvlaHwRDtRzNQj4lM+QbnaMP9pDZ23uEYnXvJz
	UQhb+HBOX1bdaTT2loWQjYSg6Ddb2R4sV4o2ThWYyRE60Za7GS0gNL9CcHBW+5Mdq
X-Gm-Gg: AYBFou3aOCgJZkRg0qxEG0gAbQvOcNE/5cXG7rdEjruGxzMyqOK4B9ewzSj92im7E00
	/q8dVfvtY8iNPxBtIHPUJBWolClwN0RQtA6dPeOlX9EZ6RYJRaaduQ5diJ3o1h/ALGlLPqC0X5G
	VCZtIDtCxB2IcwE9Vcf9QnOKPbPrHhKzC+Q/ZE5GSIZDByVEQI5UySzKFj+ElkCt5mi9W6fxbqU
	JDhqQ2MAKHAobuRGY1JHawQDNvoRQ0VvCPYWrj1Hmh2X2Qgz+aG/KyYPV5YArXFpirkrNAm2eGA
	QzqmrW+HEYL1XgZA4Z2Rk+FXs0/I7kvP1M1k01l6uUcKJQDRuN7DDP8IL/vlWK1NIhrK3sdo+Ka
	VqpAmnvXIMgrdBweI1+epUeEaGEEKpp0xVr5/GuZYsDl7whA2Ow==
X-Received: by 2002:a05:7022:1582:b0:144:dfc1:9aa with SMTP id a92af1059eb24-144f91372a3mr1164194c88.10.1790118391052;
        Tue, 22 Sep 2026 16:06:31 -0700 (PDT)
X-Received: by 2002:a05:7022:1582:b0:144:dfc1:9aa with SMTP id a92af1059eb24-144f91372a3mr1164160c88.10.1790118390509;
        Tue, 22 Sep 2026 16:06:30 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983c5a1sm1737515c88.7.2026.09.22.16.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:06:29 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:06:20 -0700
Subject: [PATCH 2/2] soc: qcom: socinfo: Add SM8950 SoC ID
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-maili-socinfo-v1-2-a82bd7d4ca77@oss.qualcomm.com>
References: <20260922-maili-socinfo-v1-0-a82bd7d4ca77@oss.qualcomm.com>
In-Reply-To: <20260922-maili-socinfo-v1-0-a82bd7d4ca77@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790118387; l=676;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=xHwgCpYLu0si4Pfes3zqvjcu+Ip84iYvwtsZMW4bY3I=;
 b=D4uXkpGQkgOT5eWB5mIWevK+4RcKk7vmgeixxpTyUIo0QQZhveu2Gubmq2+OnOvyV3TVdQWNi
 /7jHPaX6wegA3/7i1qxcnwZrTOI0Jcj4RJcmYk3fXud2h2sHKHY7JcQ
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfX7dQPcs4wAk5o
 TUC5pm6y944fWaWtpHdbJDp1wUJ9F5j4QEwpN2OUN+Ha3aDegUj0DCVHvjtwDUESfATmZzbA0/T
 tDNZ3q0r4yDr7nVIwMTul6PbAitbgFwVMQKxsVNMk7nFyCM2aogJh5QU38NsibCgAG7htSHDYYv
 AF0ptVw33FAp5ES6MBiB4ikmc25OzsJ98ma2BDRck3jlcrp8vTfw6ffQqMfhKjnwyfmZrTJFI/Z
 IhtUUeSbKbPLWyh93qOZQs+P22XvDw+JaYurNyI1nLHPMLVF5l8CfkPwg5Sz5gZknI8nd36ej9Y
 2SCpFvtkjJ5d866+xKojHlUQ26rqgQCd8tT3ot8JQi/ibLjspszUx9+G7ARpG+gc2CbzpMK4xHZ
 9LpOv4gIBEPXlmfpCvQcHwEwBiV+p11X1Hb6INO8GjAXq5kTtp5z12mU7Tz4pYqAT+erw8ZqjG9
 9TIvFIugSjeFgTNHQVA==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab309f7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fbO9nyDmYvn0aybkFicA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: r1xfIDcR7JRddEbVWTf2G73YORBZLrIC
X-Proofpoint-ORIG-GUID: r1xfIDcR7JRddEbVWTf2G73YORBZLrIC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfX7zxunMyYeLlX
 SvkNc6T1PpM84o03UX14Iifm4D7Hmwri3crA1tzfKt4TxIVyfJGv8KUPY65DyklpqEUkm8DxR7H
 87KoVeLccjUJC5jUb0Nm8gKYKLMX1S0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220304

Add SoC ID for Qualcomm SM8950 which represents the Maili platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 63ee5cd561a2..2b4282863e72 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -544,6 +544,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SA8797P) },
 	{ qcom_board_id(CQ7790M) },
 	{ qcom_board_id(CQ7790S) },
+	{ qcom_board_id(SM8950) },
 	{ qcom_board_id(CQ2390M) },
 	{ qcom_board_id(CQ2390S) },
 	{ qcom_board_id(IQ2390S) },

-- 
2.34.1

