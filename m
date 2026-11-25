Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627131;
	b=TcOC7e/U5yRSqnLsIbNtkvANK++k5RxXn6hSOBSD/r67R4VKv53cqNcrVc97fNVsuuyp
	 An2q4RXBn6al+h7IxL46WKTHvwZyYulDGqdBX7wTqunFnSxyLP1KaXdx2owqtDIDj2/FM
	 jZ+Zi1izO8PUv4gVTmC4JZWYxAeDzl44Y5UGgfLJuosuPUV5VjeEZNSrIshDEAE5A/mAq
	 VU5D3Y5zbt7hBlK/YC7bBWEmUlcKew7K0K0QJ61HfkwxmHKHukNRedvdcB70Z0+EEbR+Z
	 ZBKPxTe0+8eAJX04Vtc1HKDk5riVJjlq8BoDRLqADR0EPQrkRjU7vvZW0wROb1ADsGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627131;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kI6WO7B1bFoCDY489fGVqBNmwCW+vKG4+l+43lYDWrg=;
	b=zKD030epLsu1PHVyn+TXUKYeqMcOm5IxOaSmvNarHvd+++eqkXE1iaCp+F04PS+w6oe0
	 x12buLJIMES7JZgRgwsr7ST6sUqCEKhxrljku/6Ws+ZrBUy0R3iCWboNufSVmbvrrlj51
	 JB62Uk0bZdX9ujm+1efrBaZIubWaV1BnfYBZf7k5wLYvoW11cYD3ijT2GBRqsJe/JqZof
	 yLGRqq2CBB9BELFlXu5OI/PtufAMeHI4n71Sk6oFUSXdHVvZErhQ9p1jN4QYNJeG/fsXl
	 nXbRnqxaVX0hj3RVxSO5MgQRV2bYRXAfxrISV+16cd5GDRoi3rwsBF6C9FqRHUOj0ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G1iJMuxO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Uve/tlz+";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77A7606A68B
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 17:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E77A7606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G1iJMuxO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uve/tlz+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQOR11434413
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 17:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kI6WO7B1bFo
	CDY489fGVqBNmwCW+vKG4+l+43lYDWrg=; b=G1iJMuxOVFwU03Cd0CtyNTtNVIH
	GTRSRWyKNl7IuxT2OK5K5n+6jgXAwFvdP9RT9duVZzFY7YFprSmMftEhjxWl1D0e
	bHK3RorB64CYeKdbV/d78QfLQcwMbwveuniTzA/5V2k2qHrjX4WJLmGKvtRBUpTK
	VCDliT2afRvLZdutIO+pqY20p0gZ4H/vG9sPagFmBWMZo6hOT8RFXp0ukcHUcVOE
	xXshzDI9Tvxg0RCS+HS5o04rSskTiHwyv5wgI+D9fRv4lgZEjK26KBYiAFWGqn/U
	1KYkRS9pTFbNfZLVWRInA1NEjZRKUsl9w6pXeUIP1/WQ3d1fx75Jd8Pz6MA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnsxyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 17:18:49 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-836caf085e0so79294017b3.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795627129; x=1796231929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kI6WO7B1bFoCDY489fGVqBNmwCW+vKG4+l+43lYDWrg=;
        b=Uve/tlz+e7/Akj6PafDIkIHMQMKEIvPJhbU8onSy7EXqgLO5cSRMDA1LT3jutHFVZB
         VwyakCw7D+cq/UzIciz8xEb644HEZ4h6b2HMgwffitTHq3USpdzejhc/5fQsleRH93Of
         qiaZHboixACMtuOi/Kq4r2ux6ND9uoBRc9Pj3A/mK+m4O24+zzcCcT3Fb8x8ZkUqNdbd
         wqXpOyX/zm0yTcGntOwk8BBveEAy0CABIht01DvdKCr3nWTtvDZfKszza8UYFWif4Jd9
         OUiwF5Asg6HFsUkrA94Ste2O84eSClrQ9bJNKX4VlJi7xLa/+ScFYZ2l8UzbKA+6Mxos
         pI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627129; x=1796231929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kI6WO7B1bFoCDY489fGVqBNmwCW+vKG4+l+43lYDWrg=;
        b=D+nDIvA7gK5FFg4lbVTWSWv1hX2UtBYieBkfQfrTCPzAnyKwJZCNKW86QEHjFi70EI
         VdWrLlahUGWQqT6+qCb29vupB30b81gAo/dTSRsQ6AGUgwKE2vZc/QWJLh2wSvjZ6xIi
         IVUjOuEPDDNSL1+1/yuj4qrJYKqKd71pfiAJqlOBVQ+8x2hg2li0P0HFHowSF6bXc0eT
         RsPp15YX66yURrRhPNoLEYzsKpVHdNDknY3mkDLSt5XSWAnVib8IgfVcr/KVWzSKnKMt
         Kn6+IhUkuRMN93rxoIo3lCb69oMXlb7OhlldgL7ozFofN0F1h9KTL3/78wybVKzPGDzV
         xMuA==
X-Forwarded-Encrypted: i=1; AL+hErHGdGLTz36Qazi/aQ4cPo4MOuiCoEbT/LvxJ9duJRxMiAeYTNnKro/af8LZ4pnF0/6iAnNG1jFNx6YI@vger.kernel.org
X-Gm-Message-State: APuU4Z+LDLqEYqxEwz+oGdJHpiTKIOM1qHt4PGYEl5qrWNz5T31ZmUxt
	8NxSZOrVsqUJdasnL3j5V083CqGnkWs707gIVH3F39Y/WYuKkHIn9GAPgs1/qzqKb8Gj3651lIY
	pNRLqzbIwL1hH/vCSjtLPqqSfRqYJPehmhmYihtszOQmIZeZUobOPusFStMOc5OGA
X-Gm-Gg: AZFdTZebGXTFDTKBsmZYYImxIJDfELxs8mdmr7fk3WV17SLoPyQNUuKJzsQv3V1FogM
	r+KEhjUOc6z5q+Ym3OQnAlIkc2bWixSDYjpRXHMRdKToD2F266aJak81NaygAa1JkiP6zJSPesM
	t4pj3Wjb6Iqx9eAyBbka0/5hP5g+L0Yf9D3lbL6fmJDUqP793BwQKdWzhD/8MBT8vxEPUgF0FN8
	Ej2+5G0bhlu75VzPdhZJUZY6iKamHw5YfDy1Mavbu9PjfhCDwU4sxe3/AINwmcNqyjr0KqR1TnY
	EXT1e4oktadP5uWJPlfCq4oaoWzyuQPYsFadsfqxkqORcFGBPR01T8bJ0ODMS27qG4jLouCg1d+
	5IteS086lBgnhvgQAK8gWNZ//LjIFe1y9SoZuyyfJafwxlOLwMRpOngN71cZSZ2aT
X-Received: by 2002:a05:690c:4d47:b0:8b3:22c:b420 with SMTP id 00721157ae682-8b520329516mr80938967b3.5.1795627129552;
        Wed, 25 Nov 2026 09:18:49 -0800 (PST)
X-Received: by 2002:a05:690c:4d47:b0:8b3:22c:b420 with SMTP id 00721157ae682-8b520329516mr80938827b3.5.1795627129010;
        Wed, 25 Nov 2026 09:18:49 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm42096548f8f.21.2026.11.25.09.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:18:47 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/2] ASoC: dt-bindings: qcom: Add Glymur LPASS macro codecs
Date: Wed, 25 Nov 2026 17:18:31 +0000
Message-ID: <20261125171831.1458954-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfX8uIMmbRqKyYj
 GWpRkPca5es6b+6GT+TzF9Bl8Du9PI8JOCpgOJek/RKdq+9GEz6OJhs99wgQTQ4cWeu+lmSf3DE
 9cuKP+p+8K+6ufIuGTqEytQapSmvUuBNxsMPHcz332e9Y33iDRgSrwMle14+S7CyRCtykSmwR25
 D+7tOykj07wymhd3XXVGCAbgN57Tj1tNU+nbOJTcUKAvQJKgmVVrbJlixDrRJTb0wM8hynZBoXT
 QLYIFusDDOXbZ2NKfWaHFtT66IOQyRNVcYrZobswjQc7fbOOsdQ1wxdpNArcnGAQKpWynx+dpjF
 3D0Ame+eC1eJ3y2U2Vexmu8IHauYU8+m5R6iVeY0NeCFTfkpHiJS1efcbCNEay/Ymxvcy9KiqYR
 Lfre2MqvElUf5IiIJGyh8U9SPFsJ7Yu2A9VQAOaPWnAhJHv/t7Cm2c3sPy6qEfSSyKn83rAJYjT
 YZAgizq+x3TrEnAqngg==
X-Proofpoint-ORIG-GUID: a51_VF11JMK7lnBQP1zn2vfE8NRXqw04
X-Proofpoint-GUID: a51_VF11JMK7lnBQP1zn2vfE8NRXqw04
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfX47Fg2P+xWQJs
 ZIhJrO8sdvEQIYQgd6Y38MmL4xAuQ56/JBXj7Bup5cYyczTwePVkGh+GJyBOqFa6CGpWtE1muo/
 PHC/bHswDuRvco5YQAKVn0CQZX368FU=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b07187a cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=FrxuNgF20hPgSuSYAXgA:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250068

Add qcom,glymur-lpass-rx-macro and qcom,glymur-lpass-tx-macro to the
compatible enums for lpass-rx-macro and lpass-tx-macro bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 1 +
 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 67a4a9536d06..5e1940fc3e9f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-lpass-rx-macro
+              - qcom,glymur-lpass-rx-macro
               - qcom,kaanapali-lpass-rx-macro
               - qcom,sm8650-lpass-rx-macro
               - qcom,sm8750-lpass-rx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index f9702a11ef82..6f5648a973cd 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-lpass-tx-macro
+              - qcom,glymur-lpass-tx-macro
               - qcom,kaanapali-lpass-tx-macro
               - qcom,sm8650-lpass-tx-macro
               - qcom,sm8750-lpass-tx-macro
-- 
2.53.0

