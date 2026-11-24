Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517726;
	b=yvmw18uD2m72LyCrLeSe3nlijsHctB2v+4+EvZ3zA/CRSVY104ZZ5vSMlI7DqGqiZjcS
	 NRh9M3H9h4SeLIYIE3adJBSxlzuO7jVRTjDOVEvvC2hcmvefRM5Cst5T6zOtjowg4UBSB
	 KwSA750j0pypESYr4g0ZNCJ5oqqAfx6pgxnNynDSSupMyFUg5qBLnrdlbA7krCIOsySiB
	 Rl59DmwsxjoqY2THA8in56DLA9F1t5r7eMAcGoqHkoAW6+gsF3tmbmt/KcRQS7UqthB3R
	 bLftCsUJQbs+T0HZn8jw/L4jpGC08LkU+3wbh8GQB7Jo26gWSwWohjuzveGDjGZs/Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517726;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N0eRXtNM8GKuA4yhRQycWGozRJkP3Y6KyDWRFYaD6z4=;
	b=5TkEe7LurX0M5pf4IYi6lzDKP2pY0EXeei38I2t6mQOv1aRbVEclFji630xAwy+QzARd
	 Rd05KMUfhSMYsycTjlajsJMAA7pSkMOPw/wTIMTVdDvfhAQs9SsjstQ6ChMf4F0+K1ur2
	 MVKOxA1LPgDapHwmYftXSrtnM++8yz0RO3dz0Q/KwQNVAxkQfL0WHuiVHk1eI9eB2U8xu
	 sAI+iwkDU+HXps4hiL7B9Zz1y/EDvU3QS4yHcqcYuNdmFp/tBjHBrS8AuMlQViCW/XDf6
	 Gnr6PJ+0Yq7MH13Bpuj6dP6f4USPoAu2CgmrXefE9h4cQBA7FhQtXCTMFNQBrgMMnTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CroK9pDc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O8svVxjy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAA0606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CAA0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CroK9pDc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O8svVxjy
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8KpxK3225345
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N0eRXtNM8GK
	uA4yhRQycWGozRJkP3Y6KyDWRFYaD6z4=; b=CroK9pDcO8dt14BJKKlzJ0ZnHzc
	s+9BoOdw9hKJJWfeqR6pbkrX8SJ4xve3wLDzhDXNpO5u0+FN80yHc6stMLmLaV47
	cIlE4AdBWmp9EHIqpt230iw9Nq+8VWtkbDmEjx8Ujqusi8cwWg59rqrmomJ41vBI
	aXempHHldje5r6r7MepoifCGHyIb6G0g7H55eXbMZ4ee2mfK6xxhC6tODOdLN73Y
	1Uiegty1CgGZt/Fu5NmWNnHS/XImYz0biKcZWHHif7l1lSbG/K4neWHJTkk5o/rY
	Yc9OdP0IbydQCHEK3cdKunzJCfBQWNcieEZKcT7vnrKrzTe8eMrjArZDxvA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f2nfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:55:25 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14373747468so4282356c88.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517724; x=1796122524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0eRXtNM8GKuA4yhRQycWGozRJkP3Y6KyDWRFYaD6z4=;
        b=O8svVxjyb52ZaKM0NLZReXUFdUVUrZovTMz7bcN0JW3cESkeXs6wre5piyWlFKEh/A
         5LX3jcdJnP9l5jwPGBwsup9NWdBJCP9WT/DRGrSfGMNcnxb4UroL3VKPcf5uVClsuVBC
         Q9xnpejdJk3+y3tdKBU+GO5HJW3BlS8Ue5s0lurzNS2EWlE3mBLKOBRMRIEmtenUH1g4
         vR7Jel95DU+PSVVyJrKNnbMquMZJQnpU1gxALbXSR3tiMUY3RSH49mpRDM54NOayVIe/
         7wz58bl+t8FFUEFKYTVWwJXVRmjHY4HEivd6McPY9T4rcb2yPOEPZiaqko3BNd1O3UL5
         jwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517724; x=1796122524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N0eRXtNM8GKuA4yhRQycWGozRJkP3Y6KyDWRFYaD6z4=;
        b=CA4LzLrfyTt6d8mQ+0EQw67vNjPj/h+61/L+AoA2jX8cmnRa4P202b+8kQtsigySlb
         maIwx23cwJ02ZWK8E7IArRMxD4ZuY2OOpoOxIG6livS8C0uD7QDkzfUXRCD08Zq/ZgMU
         Zm5bq+gIm8JP7KoLsKQwJetOMOKpoX4GjnZh4pNUzuFpNL/jqjtgdyLTIAj0o1h8ItP8
         ayOUe7ZyKPFtSEltd0hzKoJ5OR1yINB0sZS4n/fV1pOBjLwY8BrDalaw35uPyUO+XE2n
         w/IvFv3oug1L44SAE+E7JBbPeUPtbTT7aCAdJT8FJbNW+jQs9a64HHsyJuLHhPnQgJ0f
         9vIg==
X-Forwarded-Encrypted: i=1; AL+hErHzd6DG2EJwOBCvxSiPnIxEaRoWHOEaFstKh0o0j0VNC/EHEfcN8WnAFUmUgFsOQHXCjhxYGptQrsga@vger.kernel.org
X-Gm-Message-State: APuU4Z+7+fF7DVAehNhWxNguwZlKWlwF8l2R7eoZUmE75Pk3aJVRazAG
	zgWtZxIIBwmp5lkIV7+sGWsN8Z5nmV6mXCfPPNDKduy7KRwlxt7I9flicHhenqU4/cWnS4guzPw
	u/rQh2tz8ZstkbveN+SsiiDCgSlc8cyLsTb2KCeP7lLLtfyg5ZMxApCn8m/hrluLU
X-Gm-Gg: AZFdTZfcLrq9VV/5cAN9DM+oWL/ySjqh/EQbE4B+LLScKrfaEDhQXSrzHUPn0yo9fYM
	quStbq9zpjWMaWZF2UwtbgqNM6509YD9nw4GjMP1ViUX/mQZl3hOCll/Nf2OfGHhl/13COhNe6J
	SO/G9Z5WDb8jWL5RCz6AUlR4iytYSY6GuNR3pgeK/JnEaSeObCg/xmvX6AR6nbzV8TfqqcFxR+8
	u+Xj/L3ARfp+Va7XIO+b1cRHt5rZx4tDOswVw4uG0Drg3Hii9yanrYTrer/sS4sjmN7e3N3DlVe
	CDsr59QSdN9qu5Iv8xLUXxjd3T/p0kCdLpFG2wvFHkt86sxS9bt0NUhcgbTft//PTI4hDoVXHLB
	2WTDSLyKXT7tepnnSVNxTYeYZI1cqDVNjMMELj2fVs3Cgbs6Z4pu1i2WUoxs9CxGUiWXKrP8zC0
	kUeNP3NmBHhyfBtqHICv77gApnWsenOyHg0KemqtKHk2W3jVADdQrNWjlP
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr13709693c88.22.1795517724512;
        Tue, 24 Nov 2026 02:55:24 -0800 (PST)
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr13709670c88.22.1795517724031;
        Tue, 24 Nov 2026 02:55:24 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm22616418c88.4.2026.11.24.02.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:55:23 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add Seca Ride board
Date: Tue, 24 Nov 2026 16:25:09 +0530
Message-ID: <845a24c91ea424ff30faa8e1d357c326eda2e5ba.1795517711.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795517711.git.yadu.mg@oss.qualcomm.com>
References: <cover.1795517711.git.yadu.mg@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX+WTBHUnKOMwJ
 scBxkZHagvzJTZhyWWABJTOeNlrxAQ7miNilFXwaXzyRU2BINVcwn1PrKb03ohFgAHX27G84aKk
 JiMHVUnlfXxYZWvNV2WhdULhFFbfQB8=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b056d1d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ZyRZhyG5ClUV-WacA0AA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: AwqAyrQxwBLR3iHUAOP8VQV-brR6iS_J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX1hyVWy3Eh6wK
 YiNIzzOfAXOTc+7SAV1lxW5MJU7wlKuxA221U4JWgnTVTNG2qZOucrAm+8C2+oLykwJZkWUnPWb
 ZO84Bgkmhh3Z2snsFq8I+ORBZJ8OhFZxpxD9y/Gg1nEBQTkiPZ8+dZeAeeqDOEbqjPH75nHDhNC
 i/mM/9rCzu73k8HM1Tk5TPHxA5D3EzP5XU8UTQh39Z+irU3qx5PX2UJ77ZZytNXXUMBPpsAXeYO
 qisajYyxsyOaXYPAINm9QAF20Kz1UKUswo7lMydxxBmfSnZC12sPOTy6Mg8G+pNqHlQ3WaxoINd
 OipDPsfJShBln/881xQ8Pr6TT4/9WI3Vx29xF+ZP0tZ9eLm6/TtoPJXb+Zz+tgSy/vGpAQUi91d
 +RGSmW66XnImyCY1g8hUdJDR/nlvd5jgsoR0/h32CN+aA4totvdQucjAL3px2u8Q0mawouTt4Gf
 g+aJrJa4ZAuyYRfu8xQ==
X-Proofpoint-ORIG-GUID: AwqAyrQxwBLR3iHUAOP8VQV-brR6iS_J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Seca is a Qualcomm automotive SoC. Document the Seca Ride reference
board, which is built on the SecaAU GearVM variant of the SoC where
platform resources are managed by firmware through SCMI. The board
compatible therefore uses the "secaau" prefix, with "qcom,seca" as the
SoC fallback.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index a7157795870c..ba5dea9b0560 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1091,6 +1091,11 @@ properties:
               - qcom,sdx75-idp
           - const: qcom,sdx75
 
+      - items:
+          - enum:
+              - qcom,secaau-ride
+          - const: qcom,seca
+
       - items:
           - enum:
               - oneplus,billie2
-- 
2.43.0

