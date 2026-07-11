Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CE03191D6
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 18:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783792992; cv=none; b=QQj/lw4DSbmYLJmZjTcd7jvMsgxzTgjou3AfIbmgZ7zt0uxOlpR2kmtP2yPWzfZPc14zCO1RPERLTEIW/1UtfTCt05ecver6AppimQ9flNtlYUhn0l+2o0+TZAv6sANNdQ1J8T9FxaRJHT2XzkaHsN1gF3Eh+JrnOXx2Dwv5LcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783792992; c=relaxed/simple;
	bh=PnJa/8aPWps3IziQFeNseLoRZq8hhlEt7fyfzASDAqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ib/pfpWxVlC24bLT/JDAWK+REZIbd6HUnDE1L0UI5Bxb+UmgiadhhWEZeWcqfzwrw6JwI3mZcHB7vpUiM0FU3OyR2iLBqqjz9QrnSVCiV7qZQ8RqmDeUdDFPbd7emH3v49zxOdx8XH3zg9ZLwkoS74fQ35GdqGzGiADceqltfOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jhwd8Xgt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LerPtl6j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jhwd8Xgt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LerPtl6j"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BHnnY9344118
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 18:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z/6guOJLUSR0wBXlgjCmVq
	x6d332CBtCzhg7geAi8aE=; b=Jhwd8XgtITUxv0oUaeO9bAQtQ1lEpRnX053vLZ
	imDVqFUGrAuoGTK/qhMVTfkKcCsi3vu1mIJCkN0GQ81Vpye6TciwoWPlkQelhdq+
	JYbKdzNYXr4W9vHwgy8pzd2ERj4tHJ2KiXz3R4PrL6Myd6TwAQRjk+XWc68tLcne
	6CqDnxAxonYKa/P52xRM/NBa7+iQMvPMqgo4TtKT299mWDE9I/huhPRTv0Q2qfJj
	hIuu/8YHj+TNn/vBAjRti6nWWxIW0jtBdZ3+3g9x+W28K49BH7KUpTBeVynJp/ni
	/WY/pPy2vbEjpGHKhmA7R6A9wyT7+pSZgAXFmays0zuUrliA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe9hhbtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 18:03:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37e24235ce1so3427811a91.0
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 11:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783792988; x=1784397788; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z/6guOJLUSR0wBXlgjCmVqx6d332CBtCzhg7geAi8aE=;
        b=LerPtl6jMVn1tx9F/4Xy8kIdnHbv3+ELA/jaXh8LJEvFsFE3mPHc2U1PpWgnrLKVtm
         +kcoi6lpLSZuIIEi5WevO+0kSs/1CVgQZ8RTIHtpXW5PhsDYoeoGU6CbCX6ZCwEXwcvg
         wnSX5lILVnLILT9sQDroRcHUJ9UZtfMRlG+wo6u10E3GX0aQqcoq0rtRwVPvUw07u9S1
         KN3b4rJo0K9twby0mtsHYQxDtRay5ed4VR4Vp6qzExbmDZbdMAALvgy3hDfrv0qqqh9o
         Sc7O2AfAUdY5XBrBxDXiSLsPvCD5t6WpvFnrhEijpFbPmF4gIQB431/pt/V2EsZoSgaH
         g3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783792988; x=1784397788;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Z/6guOJLUSR0wBXlgjCmVqx6d332CBtCzhg7geAi8aE=;
        b=qeFQ/5nTZleG0aItRAoKuDKAtgLNF/I3Nl3b/6J33WUet5+5RkFN5dzE55wq5edrDW
         5Ej8NEHuI0TqFh+TnkmBa6t4neAZSxw/r44xAML9B/PHK3V2/UdM5TQFh3+3GF92cpNr
         2mJeAILbYR4cEaudCyXYO+ALtiDd+g5ut/kKW48klC3sSs1ljewajfgjJp9MiabPFl2Y
         p/kNViZtccYK7Upljz2CpPzrDZaNkz5XKpcQF8Dg62h2lmNe3StfZHnGBciXTFycdQ6M
         VvipGfQHko5o47xA+A35dGRX9x3EM/+CQMIxD8bZR+SmvUq8uz6UvFnG0EVzm0bOwLNu
         qTZg==
X-Forwarded-Encrypted: i=1; AHgh+RoieIFxIKx1dvx810eNawdxnGLeRQKTudX5XclzPu+Av46w45OWYDVqU/xSsyFYs16/Dt+U+cvtj/vB@vger.kernel.org
X-Gm-Message-State: AOJu0YyPPK6QJdnP46F+syuqStzwvl52dQj4H0d94eJJISoBPP1Fh8wY
	57dVEkLmxuMikfoDu1CFTMCenhVOlscTRCZt2XymKriAItMjWCk6sSCsHV0R0iCO+AnJWq04kJs
	86QiUBgPDM7PHFsCB/d1ugeUEdnW3NwtrhjMXoXw9Eg/vgLb49+RLA1UdanL2s7BT
X-Gm-Gg: AfdE7cmQWfQvpKjqnqUlev67anExwO+IHZC6P0pLMwlgQelk9raCoYblvErzQY7Hk/J
	Wv64R3RrwOh8vFvDaSJLhaiYwMpPMW6czTy4KUEcb2X1/H8wi7pWppP1UrEanDvv1XykpySZFDi
	/Er1sQ3SIoTzBFS0OQXw8o2sKn9Ddjko8o72v6w1tkKZqDKtHFrVX+5vKGKB6khTmQ04MBy28kX
	lp3bmWNbMEwXWuUwFcI4udyDIXQOZZJnLvj/aAAJc/37TZaWBb9oSRmsSESm6dKgDlHUZmYlVLg
	ubQRB9XDgRIwI3yxruEmitIDroxlKzfzZAawg+l0YpTncYh2ZChDuq51R1HoHNHBt0XheSp4aI9
	Sry8iL57yYDbpMlTmf9R8v6vkn5CSPr2vGNbubEPCiXd1B4CcoCOZMu69QTmqsurNCKWCnp0tFI
	lxLJbd
X-Received: by 2002:a17:90b:2e08:b0:381:c500:b0d1 with SMTP id 98e67ed59e1d1-38dc7769958mr3609814a91.20.1783792988459;
        Sat, 11 Jul 2026 11:03:08 -0700 (PDT)
X-Received: by 2002:a17:90b:2e08:b0:381:c500:b0d1 with SMTP id 98e67ed59e1d1-38dc7769958mr3609786a91.20.1783792988036;
        Sat, 11 Jul 2026 11:03:08 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm26407486eec.6.2026.07.11.11.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 11:03:07 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 23:33:01 +0530
Subject: [PATCH v4] dt-bindings: usb: qcom,snps-dwc3: Add Shikra compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-usb-shikra-v4-v4-1-9d59b9d9aff7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFSFUmoC/yXMQQ5AMBBA0avIrE3SUiSuIhbFYEiQDiJp3F2xf
 Iv/PQg5JoEy8uDoZOF1CTBxBO1ol4GQu2BIVJKrQms8pEEZeXYWT4MmtalVSndFlkNoNkc9X9+
 vqn/L0UzU7u8E7vsBG93vV3EAAAA=
X-Change-ID: 20260711-usb-shikra-v4-43a3a001d756
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783792984; l=2191;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=PnJa/8aPWps3IziQFeNseLoRZq8hhlEt7fyfzASDAqo=;
 b=ONpfRxQhrhydyR1lYo6ZWILKLgioeNJ3yeih6kTernj5CS59U4NDkgG3d0wgEC6dm7bA2RbMY
 I2OlQh4pFrGAUIyF8Zlb+DQcC/c5iOTBtrBOIrKpyMH/QMIxRp35HtN
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: l3Wo1kgXV3Ln0aIdWavf77oVSWGu96a3
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a52855d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VKXdlmgkaoilbm1G0MEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: l3Wo1kgXV3Ln0aIdWavf77oVSWGu96a3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE4MyBTYWx0ZWRfX0XOcrHwSBD0v
 YlGugKnpB7Wht9lXnBDVG29tc7nrJLeR653FZ7D8h5szcA0FxBEEXe0gw1aJwY/WQxP9+HzJCHA
 1vU/dJ3wjyAE2zWSo2gxUAjvjyjl1bTwj0KnF6g3qBzZpMQ7MMdE8pYOlFa0uzct0nJooJZuf6P
 HlGL5Kd1ktTNf7Lt10NoyeGx6hnoWBbhV6HywT7lsGAO/u8xcll+g7hLVoXCl8BE9vz6Ec+ZpHE
 WjiJZe0HdlE9QsmFWeoZ6s5u2Cge+PdEYPuXLlsFAUxzz3KCLqtB4e8ZaAlqXFqbKN4yb8JI2Jh
 eYpbeBGn/vJeEsQOu91j/vWfS29oELIWYWHwS/ms1GuyBuGluWgQI2HxpMXYdT190qDiBmrB0iT
 ib23xUvim5JBDeEcgENep2Mw29K+a1meXFVFOjEJUhTrjSegmEinPq0MzwVh8g6zDtvffGKy6u1
 DZFZ1edj3FJshaWzLuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE4MyBTYWx0ZWRfX8oSbSjnaCFSs
 lm2ZZ0F8Hs6UYRSICW8JcKchNDOdnDUwVqdfDN5HlBq07v6rQgUF/0BIdhG5PN51seSKYQJIbt7
 PJPeiGGc+Yo7aaaxbGHjSF5CWJrxHu0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110183

Introduce the compatible definition for Shikra QCOM SNPS DWC3. Shikra SoC
has two usb controllers and the secondary controller is high-speed only
capable.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Link to v3:
https://patchwork.kernel.org/project/linux-arm-msm/patch/20260701162745.4043106-1-krishna.kurapati@oss.qualcomm.com/

Changes in v4:
- Moved shikra to list having 5 clocks since xo is not mandatory here.

Link to v2:
https://lore.kernel.org/all/20260504145710.257211-1-krishna.kurapati@oss.qualcomm.com/

Changes in v3:
- Moved to using dp/dm interrupts instead of qusb2phy interrupt.

Link to v1:
https://lore.kernel.org/all/20260430-shikra-usb-v1-1-c9c108536fdc@oss.qualcomm.com/

Changes in v2:
- Updated commit text.
- Separated this patch out from phy patches.
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 932d7aea43c5..8298d1515c7d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -61,6 +61,7 @@ properties:
           - qcom,sdx55-dwc3
           - qcom,sdx65-dwc3
           - qcom,sdx75-dwc3
+          - qcom,shikra-dwc3
           - qcom,sm4250-dwc3
           - qcom,sm6115-dwc3
           - qcom,sm6125-dwc3
@@ -220,6 +221,7 @@ allOf:
               - qcom,sdx55-dwc3
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
+              - qcom,shikra-dwc3
               - qcom,sm6350-dwc3
               - qcom,sm8750-dwc3
     then:
@@ -559,6 +561,7 @@ allOf:
               - qcom,sdx55-dwc3
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
+              - qcom,shikra-dwc3
               - qcom,sm6350-dwc3
               - qcom,sm6375-dwc3
               - qcom,sm8150-dwc3

---
base-commit: 1db5c6b0b9834aee2f14e39764becfcc29d09ccf
change-id: 20260711-usb-shikra-v4-43a3a001d756

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

