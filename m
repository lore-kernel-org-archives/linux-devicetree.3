Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C09F3CFF61
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790049420; cv=none; b=rFd66QIuEIq6eKjWVZbfkFirucR84bTM0e+9IsHjow+uyufVH2RpctgEY1pxxdvQ7j8AEeE/xY+Y1PLxLbZ12sw6yjk0HU+YgTP4MV91g4vA3yH2EhIhzSQuZVNMTyJB+MPXM2QfdnPKZpqwNMWfYgBSpxj8J+D2d/fVf4oFTSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790049420; c=relaxed/simple;
	bh=w5cFDvauDgruD+36S54d4kqkMhyWmgilo8XcvR7nbDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YmG8oyGM5qCVEGiYjLkd+4mzSNTr2DrSit5SxVlHqLWGkp6uR+WSu12moU62BkalJaciSDNgQK3is0tFkk/YoQ1hL77+HBMsXZtHulEuNo2I9foeBW4Ytb5qA5uh4dS+NsacHbsQ/QX0ZyRczY6Bru++8YyOl3Gw9qOUI8TG5IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UmizESbi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MfJxClk0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UmizESbi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MfJxClk0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00HYN2673917
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=; b=UmizESbiP5xlgRfv
	XgVnZdFq88FcF5JxPPOjy6itEIUTgT6chHBRse072+ZNwqytsEM4KpcHC3YDmfxW
	C8dKKLJRvOEGnF3vwDUIFPz5p5D6xO+j0rjcQxXtQhRWauQFxfC0LpRbgZ2Jf7nR
	3rbbG1ZxYb3HU53Xoqbomx9SYsejX3ywDHifR3SVHdbHxWErPDNWVpfu6Pub3TXk
	ZqY0Ct00Rbd07CmJhxcVwgZwR4gtkKjft1i+xl3ctY3rFgwv3zf0lRWOgcWOLzv7
	G65+sw3K2+9bJerkqWhIM4WZjaewsbhjwYue8m1c4pDp59SFWLiWsp5MaNm3npUd
	vKRm1w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8w7a34c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:56:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc44d708055so1345841a12.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 20:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790049417; x=1790654217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=;
        b=MfJxClk0QiCZjL28I+rPyncN5xltnQFG/19WIriqGubidOZTvS8YdCX2QV/zhPjTlD
         h82TpTB+bUbtXgoO/ms84OAkmKonJxycxksNcwRF88Cv7qyASa2QKkyIJvq/4BNSeBPc
         qisZeSvgs3Zad87LKlOnyl6b62L8/mtqnTwSX/MwOKDItYvLaQ5or2WJ7aJ4Z49wcPGC
         FDpJ81btDp/FrveevsdeLESeNHOLjalMzrmvBXmmo+C+CZyf/f6uEW3UugTquRZ81rna
         lyOq8DCbAZWTT0O4OQOA+4ASMUkyDmlU7+NeBG4mz0rL1qRNQSzJwk7uQ5Qi3+/N+kko
         /2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790049417; x=1790654217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=;
        b=NL8mZbSL1988SHLDrF14C43/wQryYRAB4n8yLDWj2iwcSYMZvN/gDfx7UGzw5EgOlg
         cnBVH5Co48ijqVOHKtMio3rrmgpoZSh6jPBJLbp5QMj8VdV3Db5zQeHoFpainSw+Ra9r
         DEC3v/l4KPO97n6xxhCJlITq4OhYzwqbvFsdlRVb7MLSHWvfLAvn9FwX4QObcArSbjdi
         nAbcIHU4CJ7sWJ2SH2J5N/HgnKNqJ1RSyl1D4mF+wxC8BYI+HFHQV0LEOGZQfNk5j7Rc
         iZSuKAmECX0fhjkGsdu+yPCchlXrhfxzQYdbtJ1JYIWdgYFzPCWUNkpxoBO7EoHv7iqg
         9z1g==
X-Forwarded-Encrypted: i=1; AKwUvBxAfnFYkwjmWnXpIGPf5Gcl7XWXLIys1iRlx+VN8PCDAcexFplIu2XZMFNwV9CaS5WJDMAXm7KlOrq/@vger.kernel.org
X-Gm-Message-State: AFuF++k6KcWB0uca+snOefcDvVuhN/YAzjBybjb6sFkadFfeE5PY08+m
	rRp4b9gXZJekMq+9piE3c8KkPa4T/JqouxhIqsjXBllMcU2jS0vUPwMZK4B+a2gKKRgVj6XjkJN
	yEDKCG2qHu5JWuhxV82WwredgPWXTv5PLGhFRLnvCxqZd0loTNTqahoMkaSGaH2RU
X-Gm-Gg: AYBFou3WOagSA/fhE4RBKZZkP+PZY6f1gybrjPYPz6l3v0Zh4pvP8KoTstWM5G7XQ0e
	Us4Z1HnlevnOCC/P5Bn6QXJWJnpw1JOcS3SccxTIqgyrWNVMzztznu3gOcV/5zuA+fss7QA4pc3
	XGFHp4wKB/s7X4SpUZvQgA8nakEnOiVfiZS/c3rgc8ug7X3UUQ2v2iYPMTmVrWAkMpCWxM06PZ0
	F5+LfxM6KxzbmuHcPOspVsNE96MEilhtKlngQICbeblVR7t92oUmkvWrkJMaMOsYQXDv41MW2Kj
	P+/L+qD7gUjH5DE8110qy7jjiYn9wPKGoNat05Nk4tMonfCZuMcrQAQtBzuCoyRAA610TcLpVQk
	C/4bPtqWsHPaE6qy0pE47GWLGE1clI/g=
X-Received: by 2002:a05:6a20:3d95:b0:3d0:7a2e:f827 with SMTP id adf61e73a8af0-3dd8c44d03amr20494638637.16.1790049417410;
        Mon, 21 Sep 2026 20:56:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d95:b0:3d0:7a2e:f827 with SMTP id adf61e73a8af0-3dd8c44d03amr20494599637.16.1790049416930;
        Mon, 21 Sep 2026 20:56:56 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e58fcsm1613139eec.2.2026.09.21.20.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:56:56 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 09:26:37 +0530
Subject: [PATCH v4 1/2] dt-bindings: clock: qcom: Add Maili camera clock
 controllers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-maili_camcc-v4-1-87704b664dde@oss.qualcomm.com>
References: <20260922-maili_camcc-v4-0-87704b664dde@oss.qualcomm.com>
In-Reply-To: <20260922-maili_camcc-v4-0-87704b664dde@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: _kF7Bp00DC67_oJyIyLz7D2iNTIOHt7J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA1MyBTYWx0ZWRfX0M2PZIRM/kx/
 OWzsJMiJdD0D7axasVVWvZJpXb+tmwOCgpMQlIDRSzVHlXjgTNNR23Iw5d46YH2w8t8mCOzYvnt
 vcGgOE1cSTM8y7++qotX0YY7eyt1a3yvkkN2CcSEIgujfgqhI1ChKq2xQoTHMmulYUSUvBKWE4V
 Vkw2m3PSMSbeNMpnhdVXdX1Ysb9zi28xxEbUCImM9H3aQnfhDZ1AdeqDtn+m6MDi5LQWWr5/mJP
 jVM4Mpqpq5niyNYVE86VcBEfJng6c68ONO5AZqEgHxp2f0VFBRBrJB29fuZ51cbMr+8oJGRZjci
 bQc+dq22usypF4GuDc7qz2pdqJnHPxEodGYfOEM2PBlSriy2iPrnBVzOEZZxW9nJihFeDGZ1OmG
 iSZWLkM3YJfIPlBBRyPUhU8PjX/6aIGaBHq0WTIDcL00FLWh6bXRax1JAi8DoeetdQ1GPVzpox3
 N2sfX6j5EJmWRvHaZsg==
X-Proofpoint-ORIG-GUID: _kF7Bp00DC67_oJyIyLz7D2iNTIOHt7J
X-Authority-Analysis: v=2.4 cv=Vqi2kO2n c=1 sm=1 tr=0 ts=6ab1fc8a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=6Q3Ru0MKm2Bx8LS0oh0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA1MyBTYWx0ZWRfXwNNtXCM+CidB
 u34Gm2cQ+VnRxYQmOmwtUXUj09FSUT14ymC2vtCXXEvIzBTTVzDqC6J1WiRP9ZyhAvv48oMV8hj
 n0p5JAsLdJFejsCYlFtFXXuqJqd+S2M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220053

Maili camcc is a derivative of Hawi camcc with minor changes, and
hence reuses the Hawi camcc driver. Maili cambistmclkcc is the same
as Kaanapali cambistmclkcc and falls back to it. Add the compatibles
for the camera clock controllers on the Qualcomm Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index e2a126925e9d50046d1b4ad2506d7921462f5fc0..64f5002931f24003607349aea3ce366f5a8ec369 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,hawi-camcc
           - qcom,kaanapali-cambistmclkcc
           - qcom,kaanapali-camcc
+          - qcom,maili-camcc
           - qcom,nord-camcc
           - qcom,sm8450-camcc
           - qcom,sm8475-camcc
@@ -43,6 +44,7 @@ properties:
       - items:
           - enum:
               - qcom,hawi-cambistmclkcc
+              - qcom,maili-cambistmclkcc
           - const: qcom,kaanapali-cambistmclkcc
 
   clocks:
@@ -95,7 +97,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,hawi-camcc
+            enum:
+              - qcom,hawi-camcc
+              - qcom,maili-camcc
     then:
       required:
         - interconnects

-- 
2.34.1

