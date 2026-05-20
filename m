Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D793DA5B6
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779279752; cv=none; b=c33hxFz632btMHSC28fPt3CVDEiLWNwzf854Ib8jNvqvkjWufkUARDqHKg/shiojV5p/j221FsRG+T9ljZxIk54HQTOQBQtNWwPMhJ+FA8YPbv393DR5eHCAmIxPkLV8A+Boad7R101xKue8wT+nNzelwPtvMnufyN0YQ+Qcm5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779279752; c=relaxed/simple;
	bh=4ILdF662z2u6x2IY2rjqWvc/s2+Zi9YDhI++XcZArq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oovf/elsu1LGQIVghzmnaEplAP/D7UmxetVLiXminhvATty20K6JfbK86Z0udbJ0Rsko/PJ1+al4Tq6YLpLxJvStf7Ggqzryn+HQRTns+8ltvYd7eK5ItGBC22uU7aII/0cemBPw9YfJ4a6JY5mxhc+lkH8I7AV0X3WC9Ir7xGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ngsrVX75; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ai32asCf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ngsrVX75";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ai32asCf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KBZSpr3084910
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=k1f28/6KDyN2fSvJNAc29VeIyWKxYNJaMtC
	E1CrdHJo=; b=ngsrVX75KKlPefKTNPr/cXO6wNNGOfVEP5eM40bSh1toILoUhE4
	pzxaIARg6YxixmxUBMNTM7ItgEiTaWqIWAkBhO+e7uQ80ajBiLfah+lgNiqeTPHo
	+HjUftsKGlUQsaTdxO8eLb8VOO6wzsFkHeyOaiuXbdTtk25cCSsdUK1gs/WrzNod
	6s9rwM4hysfaRHRAs8eG/pWk9tL33JIF0W8K14BFsIZnd0OoDf4xRsKZzblnThlb
	PE6KfDAGs+kkbRk8HeIF+3gceTVB586Vqm8vEjyfAI34sQC2pm6p+W2dhOUGaUVV
	fOA+w1rwmWcwsw1Ky3WZEKM4HQSOGuwgQzA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f05eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:22:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-368ac44b26dso3998928a91.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 05:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779279747; x=1779884547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k1f28/6KDyN2fSvJNAc29VeIyWKxYNJaMtCE1CrdHJo=;
        b=ai32asCfzNZRQ/caE79CGP1JtuZMEeZvuwqy+PdBZwQxCWzz5NPdbjWcf8phRX/ySg
         A6hnl+wk42ZAOsqRXL4m+ttbeDIpcRgXrmiMHefj+Sg57RUA1pJ1suzSA4cQQRahKiQ4
         EPiabCpTk8govdtwFARcPkYKiwX5A9hok8vjzKrvxLvTybpFwiiMKrqlmEL1oiPa8ZMl
         0B943KYc7pLSzdEn4pMVO9ORAh74BLPh5bmCc6drrCeI32b32DAJFc9IHrE+jDiGJV0v
         KZmZTJrfpQyjsK4qLEkOREg9PoTNEl9CI10DQkhGb4Q+B4rn3mweZPmP7Gqc5+mx765u
         B8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779279747; x=1779884547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1f28/6KDyN2fSvJNAc29VeIyWKxYNJaMtCE1CrdHJo=;
        b=dKu7h7WmP0JwXhOXPXrMiznbonkRmfcDn4VfgI7qkHOQZ8A1OPqMaoIQEYjLxMfyxl
         JGgsBWJ0sSApfNBT9Xgq4EAjBgJonF1rlfDU8O4I9JxMbbmFeuiFdpF7/kklXGliVk0J
         AQI+/9HfVMZDaENHXhMzvXTufLXz4JAfiQ0Skyu040AzkCg9+7/Yf1YXpHopcyoGv43P
         X7H47LSwt21sQEq4c2FVXRN9/xWp/ef6jJI5HeaJNv3znWhl4qOrw4QECJmknSbNhrr1
         jp7zLJwDyx7Z5e03k7W2pfwqHXWZrCfN2pjVlHYATsNlXsSPfVSCIK1CkpBhcjkBsZis
         mUvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8IRMs6ukbvYud1crsFRETaLqjPFuSDojz7ALkJd66yatJgB6s4SMjIWl4uUg+RUlEdfvZFN8bqMWVU@vger.kernel.org
X-Gm-Message-State: AOJu0YzdDLFd/XaDaHtaGexQXMPobbgoxqDIrmVMS2zteTGBLrR3t+3v
	lXQ00krGWIXoLAOVws4wug9mbrzGn00tLadx9JPv/LdL/mIuRzWCdKc/PtZljUgobfb3V4SS7FU
	j90c0oH9u3jE1UX4LIlgy1sIEsOmtgLI7XjJB+Pv6AuOLiAyvqY5iZIXZAPdNsPhi
X-Gm-Gg: Acq92OFGfKOydf2EetAZf/YflHfHtEWhc8zIlSGKUCbEIoFTDUWpMnJtNmYI5v8qWEh
	nO1O6rxgDZJorj2E+IRxJjqkOIQte7buL4auJSxlAMoAiVJ5lPmuoFaB5ZPkigUa5f1ZoxsLSlm
	yEzkqKAveTMtjvpD6jC/emJO5hf59DnyLBsZWou/xnvHzQC2sJ601qDS5d0ht1wA9FM95QbI06N
	IYWPsUspqjXJP1e9bp/hbKQkGq0PpEVSvfHkuKZZpkj+RlSPSSyH+FvdsM2Bt5010HpBjJZXDEq
	CPwiXkBJkvlrN2snB2B09IYTUI0Kua4YSpoSHoZ8ltzEQp8pk0iUEGS0S1HKQCTU1HxvAtV3nHJ
	0eLlpa7nZfHLKv7/sHHkoVou7XeielDJrbkp84HsupFcHL8hM
X-Received: by 2002:a17:90b:1dc9:b0:369:e4d4:79c6 with SMTP id 98e67ed59e1d1-369e4d47b5emr9699307a91.20.1779279746794;
        Wed, 20 May 2026 05:22:26 -0700 (PDT)
X-Received: by 2002:a17:90b:1dc9:b0:369:e4d4:79c6 with SMTP id 98e67ed59e1d1-369e4d47b5emr9699257a91.20.1779279746209;
        Wed, 20 May 2026 05:22:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695126f9eesm21888793a91.5.2026.05.20.05.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:22:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: interconnect: qcom-bwmon: Add Hawi llcc-bwmon compatible
Date: Wed, 20 May 2026 17:52:19 +0530
Message-ID: <20260520122219.2372694-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0da783 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=QoF2PQS7ko8hjqv0A8kA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: s8-JprJ7o8Qmm1Rxv82jGp-Wmlhnv-O5
X-Proofpoint-ORIG-GUID: s8-JprJ7o8Qmm1Rxv82jGp-Wmlhnv-O5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMCBTYWx0ZWRfXxmeqE2TzGpEf
 ZzGZvcffdJRz3V+NUovnZgpzv0Pge1emJIm407pB/nwgK/8pV1gVMPuDjvyy1rwL7P3+4F/RgQy
 pThU1JRE5MZFX8T0lrdKFF35cEOvyatc6yWcJGN6HTwRVYyUfhRtKNkGDw3VYOh9inCFjfE238p
 p9xDqFGluzykQfo3NX1YWlGuhMVIz/MleOjmiBbCtziZCtTd9Doi5gPk0KUG8S4d9Ahp8IRu9AB
 Sq/ACIs8/zgxzcaJ2dsPBHliGSmmTg/86Okm9YGmNpmxFr38uoAoaWCuFE6VlYOt8/Ojvnz8lK5
 37+XmzIN3qXFcCxZy8raY0siW9BGv9JkqXivf5O8XLd5SgMPKuInIwOt48XHju1Sl010BmPXWoP
 XKq3wqmS4VNMySGYDUNOT7vA7hOgW4/nL3hW71PEa3xoXkQeju5CK3Bn7n0xqVGLRdROKGqwAq8
 FIyLsnN/K/uAiyrSgLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200120

Document BWMONv5 instance present on Hawi SoC for monitoring bandwidth
LLCC to DDR.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index 82b1d94d3010..ff64225e8281 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -46,6 +46,7 @@ properties:
           - const: qcom,sdm845-bwmon    # BWMON v4, unified register space
       - items:
           - enum:
+              - qcom,hawi-llcc-bwmon
               - qcom,qcs615-llcc-bwmon
               - qcom,qcs8300-llcc-bwmon
               - qcom,sa8775p-llcc-bwmon
-- 
2.53.0

