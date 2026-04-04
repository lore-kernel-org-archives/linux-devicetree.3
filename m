Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4A0346FB0
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 21:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336635; cv=none; b=e3lUyg477f3b+9De4t6CZefvuE2p05x0a36BzBw6NYd3zZNLjLhtgFDULIpN/jBKFXcsFFTtQm1S91jUuiho7R0oAWqOt5UpI9r3+9l114qxy40i2/2YQdNMsIM+/qsfVyGUZrHag6q0zDOMcEZvkH5vdT9gZ64J4u2tbb+ejcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336635; c=relaxed/simple;
	bh=0pQSsN6kLJu1c2xkW18nAfQbObgvnTex0L4qjOiJnLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cRABFR/I4HeeRVzKFfsFbryD+OtFpBK8ir2V4Ch2iDGSj4xw+FwmmQLFGHLefOh5p/9ZLC5ynRftfaxe0VFiP1NPkRF3FC4L1LirZ2J43MGGZZccb0EDjsJ4EIQo9h5Wb+36Ml5cANzaAXFESp9PZ4bk/YRRYbj2pC3N1WPDyl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GbaJtrYY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6Z4jNmS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GbaJtrYY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6Z4jNmS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6343ZThI1872452
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 21:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ZvknanM1whbSfSnmntGaD5fuOzBhb0C116UCQrdDbM=; b=GbaJtrYYT2VYoTPO
	xucIKCOw7N3I/frjr2jwpUzP23uYQDXP/hpHT7k/XAXmxe8d1Vqal1H6W/XSecJL
	EZ00fOZmx0AncMCJr+JN6fm6ZzZ1qEjYC/50RI1UoTO4k2iXJXEMUX0yEy0Q0rPd
	2ttDM8qgze8m3b4se8r3a3ZowknA1qiO/GtSRWZApBsXOVLS+UNG6AYWueAP8CgD
	WrMyHNtyCHb9rHkp5XPh2tL295Eju5OoC7jYSLc3anM8JoY0HzVr175EkxSqwG51
	WXnAz770zYVWHqtmzTzUQ6o0IRVb7YRM9piFAz9DE8jL7ZPfabQ0jvIh3duDKlTR
	ec6Nng==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datv19fr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 21:03:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35dacc40f92so2270765a91.2
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 14:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336631; x=1775941431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZvknanM1whbSfSnmntGaD5fuOzBhb0C116UCQrdDbM=;
        b=F6Z4jNmSqdPR78wOsrYIZvtISLHMthTmeiDSSXuDjGt0shdm9o41eJ2ryYlvEGAybc
         LvWemiMv7/99pgGJ9PWiThpoi3AnAxxP8rV4pjQ+AG3+P9uQm/TjFkBw/rPDunu9JDPb
         WTWG7ZGae9ueAyF7fSgTz6TXMFauZDtiQOcfrHItsR2DqLqwsv+pTUW13RAbfpDkT2XN
         jv2jW90PgU1Az0WEXmjHOaUYOIARh7XBA+EphogoCV9ua9tjDWAkD2RHw53VfP1p+svF
         wp48OQegmbJCBPUxrWutMcI8cgrK8HerBBPg/hz73webKnO6W/fJ87WIdk0pYgCodzVh
         0NCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336631; x=1775941431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ZvknanM1whbSfSnmntGaD5fuOzBhb0C116UCQrdDbM=;
        b=cJLRdQwkO7ZgQGzfPvEIVjO24zcoW3h7wphhuWsReu9ihfPE+L3WEX8hw0kESbedFr
         fsS+hMa80Ck/vq1bVJHyxFtXS1p+PIiyuA570xBW0aXjihWrgHTSxpEO1oGLmKnxfGVe
         iR3Q68SPUbHXrqa0rdgZUO2IabKG/84SDCttHIjt6Uy0DCh49a4oaUEZSHEPjMB9RJ7Y
         wb5cpZLJLtuOcTaq3cMP9nbGF54vTWzksxHEldB83Ua9KSEBUEqKiKkoNvKARtbatQDe
         z0P+tct+KvzYMLVn57mfE7cQqfjDOSk2wVWU8yrEZw0XWLUx83bb3gF7c4o2IV6g0wVz
         +zOA==
X-Forwarded-Encrypted: i=1; AJvYcCWw0yp8b5BO4TzyZAnAiZnB88HSjVvRBkU5MpG25kIE83m1O8jE3JeXJrZFDc6PJlxijZZHADlxs5Tg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1sNqT0yPG4DhIu2d+n/rHQWChZA/qRFkHqYZHTYUlR3RPrWsa
	R6Wr4pot7wTb6yP7nS90dIQxlUS6kIppEGev5M0OIwjV7F4NWCxuqwW6fyLEw30okXU8TxTUsBK
	nrMHCmPcfyqH/TSXD3bnig3BgE7GTGlm6naQsORqkWiGwJQN3/9hCMNIZFCUydjMV
X-Gm-Gg: AeBDieuh4j/FNLmz5Ch0xPdvZrnWMxPZd7nPwb9tOsh0tmQS4B0occf+CECOvo2A9xI
	EW+ycx+WXVfjOj9dIV83xO6KIO+NI7jbhwMf65vKxHYHfEVICfC6TuLrqh5hTCrDcNl61Ljp5iW
	x8AofanoWhilvIy0TPw3uWik3xOiZSwAYPURSmaeriBo9JgCsM2Jwl8dvlhyWe4I8lXkmetPnH1
	NN+eYuAUE3ix9dKzYwViK2hF5cIQ3Lp/hieMGuFjrq12Bmts13GZRmvyg+9IvQ/j2wfGNR2+7Wz
	FjE3+qjKf2noV0zlWCrRAJk9xw4GWB0oxhTW7e7u8EbZ7cciby71gxwtN5tYtT649KCkbCGUQIH
	m66JbsVjg4Bcwgl9eVlysq1vCIMuZAcIRmipnbtYPW+ndqA==
X-Received: by 2002:a17:90b:5348:b0:35b:e690:c5ad with SMTP id 98e67ed59e1d1-35de69d2217mr6357517a91.25.1775336631554;
        Sat, 04 Apr 2026 14:03:51 -0700 (PDT)
X-Received: by 2002:a17:90b:5348:b0:35b:e690:c5ad with SMTP id 98e67ed59e1d1-35de69d2217mr6357507a91.25.1775336631067;
        Sat, 04 Apr 2026 14:03:51 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de677e2dbsm2675545a91.4.2026.04.04.14.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:03:50 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 02:33:14 +0530
Subject: [PATCH RFC 1/4] dt-bindings: display/msm: gpu: Document Adreno
 X2-185
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-glymur-gpu-dt-v1-1-2135eb11c562@oss.qualcomm.com>
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
In-Reply-To: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775336617; l=1131;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=0pQSsN6kLJu1c2xkW18nAfQbObgvnTex0L4qjOiJnLo=;
 b=dJ/h64bEjXn8ZnjZvjsw4sHJmN2WtDg+m6rdoAEo4S5G0u10X+zOL2wkA+YLSFvUAsGfiy2ey
 ucRKe6Jog0bBSHgPCySYtwm2uQ2uaTtcB/DSPhOzoW72YZ1wpc8YH5t
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: mz2qdDa0l3vEg5Kr1etY3knOEDhnveiT
X-Authority-Analysis: v=2.4 cv=GLEF0+NK c=1 sm=1 tr=0 ts=69d17cb8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=aapufVXKjK5bSyzaIfAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: mz2qdDa0l3vEg5Kr1etY3knOEDhnveiT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfXz0LN+oRDOXLG
 mf35UX9qL36+ThkQD7njikOuLokRT7btd3KqDIsB1tKrW35drXlSTtVyltJ/iEVj1Fu0PFJWErI
 5GHpHoq8CH40X3GOyWP2zOaWqTX/RTye89iV1fl79BHOlJfsrunYgQHRV1k+2bI/WNMumrgXVX6
 tvkdmliMEe0DySeTcY5+nN/GslSJuuxAHVZBE2CuBDey0WiU7sMOtGnkH/Q+xuT+/AdnyIgltvA
 2UlSEYEqIfTPr+HEi79UkYfpQ9QsZ50jucHbudJ12lo2RIUbOAcBBb4VY4LZvzFI5LOfE2ST57J
 DzxmIwZSC6/awvsWY8p48uYhSWdk6TgR2BG4tjviEswJuJDP8h7Y5PYN8YlflZwJKR12d4GeDOL
 pIzbNEW745her1ubvZRJC5751OVvhpsawHJ6P4+krYf5mDeKD4tLm6xn5Ei5m4ftbgu1AUaPSi7
 KeXw22WJSIIHhPYzb/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040200

Adreno X2-185 GPU found in Glymur chipsets belongs to the A8x family.
It features a new slice architecture with 4 slices, significantly higher
bandwidth throughput compared to mobile counterparts, raytracing support,
and the highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among
other improvements. Update the dt bindings documentation to describe this
GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 04b2328903ca..bdc8e6fa5359 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -434,6 +434,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node
       properties:

-- 
2.51.0

