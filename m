Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA6F3CE4B6
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 17:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783789810; cv=none; b=CwOGXzurMWy24GgZFl0Ph5ArhdBTS+JceAHZD92bkZ1JFoyjRt6ney0P84fVcM/P6Ne6TE9IYlBIXT4nPiqkFNrRt+4EFtf9OLO2z0ehsH11rXQeE/Si42ssbiIKGwJk7t7f/Lj74QTyyk7dghC0xbLLmUUj2U2kUP5HguQte64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783789810; c=relaxed/simple;
	bh=n32F+WQzySrIX5iVbHz5HeXrQoNod4+w3vtYMUcs8Ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rBwA8fCOFxhR/ZPAj9RpLmrEGnv3cxLzl4Y3xROGijVIQn5t7wqLzPYbxQ4K0XfwR+IqaDUkmGGT9N/Pa0AEtzs77MXK6O4q6grv8Stx1UqDwNudzism2Ki95ETQPmh/8CNGAJd9tN5nmPaUBt1QpivJFFvhWrQY5WnGULJHguA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/aFvggT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z5jbkUH7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/aFvggT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z5jbkUH7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BEOQN54043625
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 17:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6oYYmVHCEVxwHI677IftGmw1eu5lSQkq+tVMrat0xLs=; b=A/aFvggTPSyZZ+sY
	oKtxRYS+2+QAdwfkjNMHkuLwy7CQY++nvZIutK7Tc876rdu7M4pV8vseCgEudYPo
	B3iXGMUCfeWzbzXDiRyovVKYJIyv/winF17BVK3i8Bw0kDteSNz7em7fMZv5WDCd
	TMeJDG4NK1D09vB6Yax612Nm5rlPQNkfEs6bUSyPGjOY/ygnYLnCckKL1cPEZUHa
	8Kg2+DVW5Byw4aI34pL+2i/N1Zs+q8ent0HClJGGt0qNSB7wFBif0brQOCvxMv6M
	IvkuJG0uZejAY6YydYn8V1GkxiTuazk1tQrN+p8wB7BswwENZ2FP0m6msW55uLPp
	8zzGkw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeehh8w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 17:10:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso237071a91.3
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 10:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783789803; x=1784394603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6oYYmVHCEVxwHI677IftGmw1eu5lSQkq+tVMrat0xLs=;
        b=Z5jbkUH7yv4eUFhhm2kF7strykUpOjIkeC23pFRtB9P+hVkUvBD4Wt+1UHB1S5ESOv
         SwNmoeyF380g6GFuzFJ7kxgFT4NqZRR9ZtuCTOK/TwHTH6QrTgBdf/GAtjFTpTyHn2ZH
         fA/58+ZbAanVbzNPRMJSezeIaJjj85tpgtX1w+8sAbIAPs4u20mZ4bG+NOmUsPG3eko/
         4yRsc8+/4sDelfT1FCGQ8um722/DIAFdjlk5KmO9zmH4NtywednGFrHH9nyPbQAG2N7L
         ablMJVsycTXHNHZc3jH3LRPZ18Hxaq9UFAT3NbMhTbK+vDFEfAC4kOPEVGVVPdVgx62h
         1FNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783789803; x=1784394603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6oYYmVHCEVxwHI677IftGmw1eu5lSQkq+tVMrat0xLs=;
        b=C7Vf/IrL/P91bN8qnizYa4ejbAN+eSAaiK3jpMt/lfF4AgF4DISmhEDtfH+05lG1YC
         bPGaAY3wpxScahv2S9T6rnm1TqzkqXcGx40/DJW4+JbYfimoIsd7N1TPDaWT4txzCoFy
         lutG/eCaoYCFaWDV9jvNSEmk3AKnx7rboZvPtgdbJZbA78UodYpNRV0a4Bgf6qVchNFl
         qSGD4ToSdOUCOmsSxi5nVAcBeeL9SsOqqj3lvM2WFWOIFd08agtJ/vbHyozyIrV1KWCK
         mUgMZPQboJ6gOfv6mHBaWmfE3JMPwBvGcDltZAi01HI+YQsZvdOvnyuctJbnOss2GF5e
         SkSQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNJFsi4B+LjuDpPFacZUf5TQDZ8j+u4QlBCnnla/gOwNwj/9qmzMbc/606KHFigFsYEVhl2XcqJ7nS@vger.kernel.org
X-Gm-Message-State: AOJu0YzrTaJ0L1TU8UJ7R90577ajJFwD3p5sVrDIVH1kBJGGL/mOsWh1
	4AbqJQEKVUDGUBJfW0bRt2WznzrZU8oCqhHeTJiHbLZpqzhfTN8s/QyFdOR43vzaFZhB6zGV/EZ
	qdvFmjXq7TvrwatmLWs2tRk2ba0YCf/NjrqzJkUlWdjSXE4UFnFg2RvrGqxSfE/8CWrb0xNGI
X-Gm-Gg: AfdE7cnyhlpqyybnpYqImV3bENNYE4e+wH9zTXKcVhM6HfmH8NGjO55dc9dciVQjp7e
	Th5srfmQgSCDoVoqXi+bB+SipK+17EzNC/sMGorkPlykZOnQDUm3mQJI23vOygYlFTk09e4j+6k
	DBGFloECkc4PcuopCMXArKSrZeGX3wsGWEsEs+AUWV0Y+m6f+JbpRcwspKXCvx3Pn5VcGn60FNF
	Qkgj1tkiaL68zs9tLXU+OQ4ODdCEuwfsdf5HVQ9w7xpP2eIO3ZwEf6gn4RfsxWvO3zTDzse3mo6
	ILLbJuCHaV5OdG3pN8QedN4h9HiY65ZqoDZSs/rYg857s0IBP7oOSPN9PilVFep0ngyg/yPBOCO
	8/10uFIWM55y0ZWAst+o08g8qTuDlnoPPeijhjAZ2J52bsWYUvGj8mr/A7aiIDbKJGo3Xmm7zHh
	gdeUgS
X-Received: by 2002:a17:90b:3bd0:b0:37f:9cdf:f0ac with SMTP id 98e67ed59e1d1-38dc77f1987mr3410726a91.27.1783789803131;
        Sat, 11 Jul 2026 10:10:03 -0700 (PDT)
X-Received: by 2002:a17:90b:3bd0:b0:37f:9cdf:f0ac with SMTP id 98e67ed59e1d1-38dc77f1987mr3410701a91.27.1783789802710;
        Sat, 11 Jul 2026 10:10:02 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm12943635eec.23.2026.07.11.10.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 10:10:02 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 22:39:50 +0530
Subject: [PATCH v5 1/4] dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy
 for Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-shikra-usbphy-v5-v5-1-229ba3602737@oss.qualcomm.com>
References: <20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com>
In-Reply-To: <20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783789793; l=953;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=n32F+WQzySrIX5iVbHz5HeXrQoNod4+w3vtYMUcs8Ls=;
 b=07VqDUcV/spGZceZHaIll7lGdggV4+6c7o9rA4r2mRUlCFjAV72hmp3YJR7KCOFTBBAQM81y6
 A+69tU4wMQiBdK/WMLQChZZ0ata3wDYUuWRYPpk2jjqm7/2595C6kVh
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE3MyBTYWx0ZWRfX4hTEc/MSsWP6
 DIANL9xbsDEMov/8/GqwlvL4rOcEvdBWoqe8MCbs7DiCFrogiVEBIE1NtprxBRfa9dCk1w0fGqu
 DAkIiMPIwf4EEZI/vjpURYDBtf7Mp48=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE3MyBTYWx0ZWRfX8hRz/C1o7pCQ
 aL4lZhHV28pj91sRyiAS/U2GFhMza82F9a9dgoNBHEXYuFKOf9GBTd69wE9Oe12Gcpudcw8KqTY
 VzSQISpnpAkD2PSqM7IYgyv4bHvz11fT0pxUPuI3sko9JONM62wTIHrGs+MQT18M1XXy3giNiG2
 KWTKwcQAcO7ZbJ6y4hQemr16UYNqswLifBGkv2FRu6uHgxpkajOP+tEwZsbG8GwwcfF+nctts1D
 dTiakPTSgrpjfEArBmHj6UNfbH4EE9fUtZhwmIhinJ/fFsduN5ds5ZjT88twrLmmn28OmyMXmoo
 X/50qt97UXVj5BoyASOGF7wJUBkogoHM8NryqeXEqVzi595uBCG5qehMm6UD3vEErsFRfTLSx8Z
 mLKUEM6NF9T/TnCjLIiCoOwEKYQ5R4jsHkT5APl5wNyjFk3QzJShEWfi/BgS2etlY8Gn3+fiuAV
 SQs3Bq4VpyaCNX23Tkw==
X-Proofpoint-GUID: lo6-xKk-eL6QvZieMCBchvKlidQS5Mf2
X-Proofpoint-ORIG-GUID: lo6-xKk-eL6QvZieMCBchvKlidQS5Mf2
X-Authority-Analysis: v=2.4 cv=aPvAb79m c=1 sm=1 tr=0 ts=6a5278ec cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ybcDLLt5cEg1GZjoCqQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110173

Update dt-bindings to add Shikra to QUSB2 Phy list. Shikra SoC
has two High Speed QUSB2 Phys.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 449c2a7e5fec..001fd0ccc985 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,qcm2290-qusb2-phy
               - qcom,qcs615-qusb2-phy
               - qcom,sdm660-qusb2-phy
+              - qcom,shikra-qusb2-phy
               - qcom,sm4250-qusb2-phy
               - qcom,sm6115-qusb2-phy
       - items:

-- 
2.34.1

