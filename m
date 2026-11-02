Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609471;
	b=UqebcLfMd/DWPJvtbUexpwd3XoZ1dpIonVBDb3AKFTKXP3c7QVAcylGStzlUAeyzzQ40
	 QHhxYhVKOmmXqGrAJa2z04xMdDOgZiMf9tA5RDo23gmc+cavlTJPNE7/77GMKPsSNzltF
	 6f3YWxa9nn6EUaDWvQhLoqQSfrVCH0Zt/BoNAJUZ4rmGKGtiWsCWOtpW2e0Zj4SuBaHrn
	 dpvbLrKq5X01IcKrHvoIkcdwvIctLt2EREkZOQfeJ40hn5bcSB7LyfDUEMHHc/ijwbwG2
	 QhvmCEuVq//V+ObrPr5wrVOdGf0Fk0mRow0IFbtFbAO81Y1e9y2nb6BSKRkfqvMnagA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X4PS1yaxCigoXQ7XkcSedOsdav1BqUR/eLBu7I8AoWc=;
	b=qnszt8eCim2t/LtjriHla2L5V9pWy/s809LK3Mvb/HctRyo4gHPXztGO/u6KrOa+cYg7
	 QZH8nPr+BLY5fLin3KGJGAcB+xPfpweFLAGu3zOl/SWAF0tnXclaFlFnCA8LNpWLwiZKc
	 ArKTry8ADdF7RNpjyDvMIxkOPzWuLEUOOcs2JphsHPwyErClvPP0LUtoizu+raIy5ANuw
	 cKpOs6Ct0BtYbyl3St/5IahHcJ5x/nHMsuDeEXSI1UgOI02hIXSkqX0LVF004M41Ceabw
	 9QcWY3j2oMAIT/SCgWEdEFIYZQYysJtHBWJf8MdVsh0hDwUyUpT0dKKgg6YuSWt4CXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1eG3YBe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OTiaX0Az;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC7F606A33B
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 08:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBC7F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1eG3YBe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OTiaX0Az
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vIPQ3324667
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 08:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X4PS1yaxCigoXQ7XkcSedOsdav1BqUR/eLBu7I8AoWc=; b=D1eG3YBepu9GuT4B
	g/Lr126+Oh+BM/btJeMgekD28b1ipXi5ghJauTZ+/k3buKWNXdF29UbiIQ2dDSxx
	xgfEXItVUUcVdJ2RL0jTnLznQgPW9bi9Y0j/y8H0eXM0uRPpsDcqtjTJbmQNCswo
	HkQu97o4NPz3+IPkl7tB6VhZG7xcGbQ0UweNIBDbKGlXxIVaMUsyMQluB3p2DXg+
	6oHAz1KjFXGyQx2G71QpAchSfRcQrlBXumgm3YamOSCE+N1vXH98lei9tylKMBze
	T0broC7HzPpat9ODS3vsNgONgbZnDaaVTXiqtqV8Cn9eTaj7jyoZZBPa0n1Tuslw
	dVKw9w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6p5m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 08:51:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a086ed8980so2091260b3a.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 00:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793609469; x=1794214269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X4PS1yaxCigoXQ7XkcSedOsdav1BqUR/eLBu7I8AoWc=;
        b=OTiaX0AzpxUg6T6v/Q5I4zEDbAdW4ZMYJp19jzvq6qWZyOcAtcRzLrSeoh8pZ/QveI
         fCr9INo7OfcTJKvOYe6u5V8bzA+0gkzUV6Bv+3hWuwkQChOmJWpt5Y2q3vZX7RQJYd1W
         6Ca0QvJZ2XBrC4TDuTZZr5zIoYxtQeMma2rqjjPuROb7SsPOEib6/jXp6E7NcfVn5o0v
         T9wq0RIJyYNRDwSgDLjtjtv5b5FLXCmY3ki4qwt0GpF0maA5i16OHNI/zv/71pY4cSs9
         LVpKUG90nKfYXCUqaKqKUY84fvLJBChNpT4Eyz8zvi2xFl5z5hv7cVEnhUk7xw+TA3EG
         KCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609469; x=1794214269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X4PS1yaxCigoXQ7XkcSedOsdav1BqUR/eLBu7I8AoWc=;
        b=BEqGNEMShtRp8NZKUL/3ak7qNxaQYLFTF7wDh7AROm11BdfQr+o50Reqhe9JndSY3w
         L6wTkdd5SGiGecnOVRy8xERzZG9CBpPHXJev3ntXrz6TgGLEi6MVgKV6WTrffT4/9A5f
         BhTWtenWV7hQZHpok6cBqvTd+RYk8i/SnIMzgfruAL0yVkalTA0Of8RPlTncQ+8zVX5M
         6mbb9uGdC1g7CYMtMd/t43RiAmxOwJ/gB/cuAl89BP2+1BJ0oFIXV0gA5bcvu7M4bnPU
         C6C1DPDQO2hbSBtJBKRdpNAGisfz/3AFIUo2QNeCcZ33EAecX0vuRNQLYp9YDTMkxO4P
         vBhg==
X-Forwarded-Encrypted: i=1; AKwUvByPgvfZhEY05vStjZdBjKfE2ZQIMFwGf0pQKaWB3W6tJb0W5SVlTrDAwPqZAAHw5Hpus/XFr8gHD5Pm@vger.kernel.org
X-Gm-Message-State: APuU4Z9tyv/QYsYVYy3J0Qku/1mf1IyJO4s3v59sYx2RMLvWltQ9bYvY
	tLMo/EeBtFACGnQv6cIYx+VNNmnPIUMTuYftPNv+HixWz4z3aHhCbqi7QqD6Mqkwt32Dom0ThuR
	L95zcxkRtV+rWAlkHoHF18m83kau59/42Nb09vRp7nZv6KMK/s2FhfH/+gBkNtFQN5cl+cEDO
X-Gm-Gg: AYBFou2v6AWQgeUr/g0+/kVHjmbOODME88Pu/r9ivCXWB8vU54zK50klxXW14mkFBSO
	3lk4JZhpm0dHBo2c0ikf62dA50nIQfUJUM1OmjUuJ8cQjLI02t02B3dRvaATshd65XxaCLRjHZO
	J2cmZcUkUv6yENmPAC+e4rTV7p8/7yjs63W5rHedg1t70XHGhFS0XbgwsIndakzHCjXFLQ39enz
	Whvq0uWW3p8SWu0ufdO0ldIgM2RRTmNTPLflwXpna4pG9oDWIbZlIhkgIlVqoZdI8wygpdgASAp
	Sy859/9QAnNm4GDYddTz62xZxCBr2lu5qAt2g4R3oASkdDV73jdtUBKaiaCCN8sEC+XakfyGU0o
	qL1dP+Wh/J0HvzUlbeqgomFS3NThxFbOfuW3AEK7W2+E1iZOBgQZa2PANdo0jecGfRG43fKw2Ex
	ga+ac=
X-Received: by 2002:a05:6a00:1f11:b0:8a6:8f27:d4d0 with SMTP id d2e1a72fcca58-8a9ba60c801mr5632552b3a.3.1793609468895;
        Mon, 02 Nov 2026 00:51:08 -0800 (PST)
X-Received: by 2002:a05:6a00:1f11:b0:8a6:8f27:d4d0 with SMTP id d2e1a72fcca58-8a9ba60c801mr5632541b3a.3.1793609468428;
        Mon, 02 Nov 2026 00:51:08 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963cfccsm1748329b3a.9.2026.11.02.00.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:51:08 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:20:57 +0530
Subject: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
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
Message-Id: <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
In-Reply-To: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793609458; l=1468;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=PVBskeWsn2aBW+z13AhEQSc8ykpvKqmkxJeX0F/rLbM=;
 b=bvyZ9DEICXEEEClHl6as+NYWVk3DjPBGziT1v5yO+W+9NMPFMFJzgMOCperfl56zVrTBKMFdA
 E2GFnYiBQInBNWBoCpPad0r50Ga4BAV/X2Pq9fZEcj5B2WcGMNqx+1j
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: SgJqDaIJyQjD0hFaSntGHyr8WBj64Kyy
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae84efd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3Q3I_TTnfSvQyUT7B4wA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: SgJqDaIJyQjD0hFaSntGHyr8WBj64Kyy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX9g2JoExWXh56
 7OqOuQfOf6/dT4qbXh5cNuUFx7N2xU7Nze8AaAViSmXOPCFwyUuv7zr5NYHJ87Tn9FKnHfAuNRC
 YaIRDGwL2XJim+DNRT4Al1kFHVivWXU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX8HnAYfvLRrKc
 BZUVNZQ0nLHWN6DuLY9fwBIsEKxGCt1bFvz3dNUw0NevKA4DJJyD4MGREcNme3gtN0DfxnqqLQR
 SnWqvU8WVdgwbpL5qD+rI5z//4X+errrkbWUpOK2vM6mZLJxnMCTJbyVjcObTDovZMqHO90S9nD
 XbEE9sVj3Onuka0lE5ANzdhVF/MFg3BfGSV5lZCx/b3+YeDQM9I1lnker05xkrvlUBtjSTLyK9l
 zu1GLmgmQVf4zykzXehX6+wNFY2VKtKfmCc/B0Y9k6OUKEmZrX14h3F1dlZ/MlqunGzr83qGePV
 l49ddoFZq8PAHcxUuiNClfTUL3y8LYzKfS3alKrPNGO0rdTVbjrdUwP23Q6vKn3Jbiy8gYZJULy
 eXOcvyYtrF9MaxogpBd6z1eaA44IikKOJRQ9ahkOc05hqNdvP57edP6oSpSVUHBI2vuv/VDXONe
 zMDkszqwtwkMaUN6GkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020035

Glymur describes CSI2 PHYs as standalone nodes, but the CAMSS binding
still models CSIPHY4 as port@3 from the X1E80100 csiphy_res[] layout,
where entry 3 carried CSIPHY id 4.

Describe the hardware connection directly by allowing ports 0, 1 and 4,
and using port@4 for CSIPHY4.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
index a0b77edc212319fad69113f3d55ca24f184d4b23..e23f43dfa4b51c1e44e57f31dc22b4312476365c 100644
--- a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
@@ -109,7 +109,7 @@ properties:
       CSI input ports.
 
     patternProperties:
-      "^port@[0-3]$":
+      "^port@[014]$":
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
 
@@ -288,8 +288,8 @@ examples:
                     };
                 };
 
-                port@3 {
-                    reg = <3>;
+                port@4 {
+                    reg = <4>;
                     camss_csiphy4_ep: endpoint {
                         data-lanes = <1 2 3 4>;
                         remote-endpoint = <&csiphy4_out>;

-- 
2.34.1

