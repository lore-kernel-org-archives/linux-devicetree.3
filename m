Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3C23F4109
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875121; cv=none; b=ZDCRToTCnEiHuilhnafRjbBuYbb8kmCkuj09SR9YZbHSz5d5RrvFbvpD06sjg3bOSBMaMhwP3y5k8JKq+Bf8H+WRCGnkUSqadEN5S19PWqYbSjU4M6DSxgfnbwxL+K3fm5FvZFlZM31+iRFgmcVVkaXJV1IkY8oAco4FOzz2QrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875121; c=relaxed/simple;
	bh=rJAWNGsUae+RFQAefT6e/WJHv3vndCiQ0/pIsj28NOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ObDONyQZ7K4B117GNUtd1LKaNln6skXnaLnFWfUxSWpmQXQ28cBderUT2608uz793mqfxQ2u8N4j7ZMfyd7wYSQkNbOwqzV32jb6fP/oMe/6U5nlhfA4g5IslhW9fLB5OqkXz0GEzBAmkQLH/BURx4PR2/bOI9ZnNLe+O3FHpGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dgA8xXz6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O4I4NjLX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dgA8xXz6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O4I4NjLX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mbrn051300
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FxhIsXPR5LW
	ktLKRm5hy7oEi9MsprBwCA3a46iFjFrM=; b=dgA8xXz6AEC6S8SXuM+U3MxMHHU
	LNsslGIwXh1yEAvF+ItIPFO8s+C+iP2EO2v+owGCaJXQSk5q8JO6+f28eYR7m0Kh
	MLRf7SeW7tXbifczxlW6VdIcm81kTbYE40dmR98L62IhzdN3A84XLEGsQtaVNDUy
	u7ZOukt4hMeGUaLTQP8eHuPq+8y948ckBPLS/SyAFZ1AiW5Phsdf7xeDCrx4jN/R
	MLUM4guvLNlxQxod3HVm41GNGRkGrEzOkK/TI2yqdD5n/1bcsGAOWsIcdobXIx2s
	t/aUDiAiBYF2wk8fvcoUkx7twjUnFr1oWUbDnhUiH9qCDY/ETnQzNeO7MOQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edg5paxj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:45:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2be9e0905a9so81600545ad.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875118; x=1780479918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxhIsXPR5LWktLKRm5hy7oEi9MsprBwCA3a46iFjFrM=;
        b=O4I4NjLXefPRQuH4ZoOu5Ew6DSafHNa9pt6WfghOvijQ3fXuQnXh4gR+IntdEZkJDM
         Wjkm4RIKs9rlI0kbD3RST6fauZ0Qukmgq41egmIFtmtD4/5TBdkREMJ8Z/4sxvJAqMCx
         /Z+8pzUKpqy69mJ6/xGi06Y/fk7lE95oz7yybP/yctMRLIFah8QHoaOARbT5qj0OyvY5
         p3BvskvTz28XOjgrU3pZGbDqVhsERkEuQwRa7TLKZflIvhc8LvmArGC8//ZMMNPJM2q8
         7cAvIE2yOuUFMCQILBWsmTRRvWcrP7OcY5NVLks5FYUQsSWty4acL1hBLO+ZCW19HQwO
         imAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875118; x=1780479918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FxhIsXPR5LWktLKRm5hy7oEi9MsprBwCA3a46iFjFrM=;
        b=EbTEbfdCyF6uMmskJzAxl/t0qfWKxpC7up3L1IxwBjmAmKs+7P+WXCbjyICwHHIA62
         +XjZc4i1qgPCd7Otn3hdncsHMe2kG9vqVsoRUMxFZsqhheIvTxh08QrlXwQg1tmh2qSi
         iK7yscSq1zhvunCrYHTObr+TKbUDQlWcuYtu0U0YtWiNphoqML0bLPggW6ePryYy6+LL
         TeJ629R1NEhvAzAyrf/HFAxTgSoZVOmwwwbn9dyhL5hygkGxCmoUGbI9xFWesr/oOykG
         30zyX5Iway9LRntf+j0wMAnNTs/bvc49ZJItOq6/m1fCg4+bAiwJAcrnS1NjRDHjXvUZ
         30kQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1SBYo2FWLsS1NzafR0vSD5eAGJKYB41BKaMzMFfQhM3qC0nKBc8razFdiETM+FZhfLLkNei+3uKk3@vger.kernel.org
X-Gm-Message-State: AOJu0YzDiDvdImVKgo8R0KlY6q98o/9Y+WePflB1JuJnTXJyPOadppoh
	CY1Wayh4mGC/BTcD801vz9gJokd+UWxvpWIG5/TP8HdJXHrouxbJPZDADSKT/yX2y7aJUTYaBYi
	Wlfo+ezXAdPBfTI+jeczE5xlpxPQ3w50TLqw7XNd7mEbFS1a2NCGwZlnx1AZOaCNf
X-Gm-Gg: Acq92OE26sE8LyWa8LgrzPYOsJ+FxwJNsckD6vPjfpcy07lc4QFSTFhqglC0LMXtJb6
	ch1K9wI75f677qX5a6ldaFuEPGs1JCZobLwHqFqWnDsv45BHbNWqeseaDjQlkPIc1rtaxF18hPe
	8eo+7mE+5ViE+BKGUtO1vWSTXP1rbyd2VEC6YDg7mjMrA/NoE28NC1xuuvUFI58YZZArTjFAuaA
	6xBYHVbHdkGaTsQFjLJePyqR9nAlpSyGuKJsI+FPONsj/fFN+84pL4O7+J+HTtprNHg7lwpC06T
	VnH7xYDJo3PZT5wZkL4eGMTomxX4BMufjW3PLyaETZFUkJQbPlJBRK2h0nkyQNIqzprZE6NKJgb
	JV+an29smjZ5+ebHH3LvPPxCxlR4H0qkpfcuhjTr842B4vQbvXlfN/huMdlM=
X-Received: by 2002:a17:902:f544:b0:2be:bb7f:ae2f with SMTP id d9443c01a7336-2bebb7faed9mr209221035ad.27.1779875118396;
        Wed, 27 May 2026 02:45:18 -0700 (PDT)
X-Received: by 2002:a17:902:f544:b0:2be:bb7f:ae2f with SMTP id d9443c01a7336-2bebb7faed9mr209220725ad.27.1779875117882;
        Wed, 27 May 2026 02:45:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:45:17 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 24/24] arm64: dts: qcom: eliza: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:29 +0530
Message-ID: <20260527094333.2311731-25-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZBPu3kNadCMUjnkKGMZTrM3RRT_QTWd2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX2VKujnT/quHh
 CaI4ZuoonkJG2AU83w4Wz6LioH9l/mPJ8ci1X1br/8WUa2PX7hmavwUEnMuo5lcN/NoHyBqqhBX
 8JhNkZk+XeVwFANMGhVHrFaAHV9CikvAnhJuIvz+usrlH8do1ERqlAjogo6gqtlYh9WeasdWzIA
 KFdMe9ANqUCQk7aq/eypC3x7J8KcoBXegmYv3BTBJ+rhFQS8OlkreCy39P3PJgdiXh++t6mbsD1
 KBnRxmcRe4FmboFeFx9KsTs8sPlLjjKTcmoDdaXyWN7UsYPJFjWvDkgQ2KBh4vwGRsZZUgAaX2X
 wjUr1e57Ns2zmHO120QGkfDLOHe1/wcmo+iqAu9nPuQ1+uMR5vgn5tDqMlEltg7hJOvZTJvj/5+
 QLJAHMkkaaeHp7Gu8cTyS+ttYJj1mvdl+805+6unXzNeoGHYyB5Yf4eXcledk3Sx7oCZRuuZClW
 UR5W4vt6keDN693WqYw==
X-Authority-Analysis: v=2.4 cv=I95Vgtgg c=1 sm=1 tr=0 ts=6a16bd2f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=RnlY3zcTJ2gksRAPNgQA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ZBPu3kNadCMUjnkKGMZTrM3RRT_QTWd2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093

The OS PDC DRV register window on eliza spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x40000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 24c680795481..190728d3e752 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -917,7 +917,7 @@ lpass_lpicx_noc: interconnect@7420000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,eliza-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x40000>,
+			reg = <0x0 0x0b220000 0x0 0x10000>,
 			      <0x0 0x174000f0 0x0 0x64>;
 
 			qcom,pdc-ranges = <0 480 8>, <8 719 1>, <9 718 1>,
-- 
2.53.0

