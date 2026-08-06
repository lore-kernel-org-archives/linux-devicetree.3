Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB0741F5DE
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 08:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006608; cv=none; b=SSzRFj8TN9clXXr1mfaKF9dMUkY9dp/xmFQZo0Kp9xTMrtv3JFL04QZUC9NBhrEhHG8xZcK/C2gEQByIYkx6wfWa1W6r+niTkYplNDmTXz9tFqQFtTuPBgvaBdCPOtnjaKd4SA4mJITzcYFox3rda/XJkl/U2tHwHph3qXQKeYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006608; c=relaxed/simple;
	bh=+wdwCRdnJeHhF1zaeA93mid7aVTN7E5hSE1rkcZl2sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PJeSREBFXeEzBX0ykGDQ5pvL/9yo38o541MZ9NEXeVgf92Kj7GTV0gOO/cpfbbPKRgk4fczz9vF4Oo7Zw9Zk8dazSH8NvCfim7aWyQttMI44YgKjURdL2tU/J2gQXMs4E0LvQ/RgVuojeum3DZUjNXqNYYnCvbBLn/mHrpfqUB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OTz8hSjs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SBqVBq6b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OTz8hSjs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SBqVBq6b"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67669OIO1075153
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 08:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+tyD/JK7/asjyuR7NrXrWq4PFgDdRaV7mFipJbTmEL0=; b=OTz8hSjs5zCMIfgm
	rAlqxjgbgKt6d8zW4l16kqMpV7cpYYJ12c+G8joC9JMFMdFimdRxZMiwKGFKVpdv
	9gHS5LsAnxB3d+a+TcG8xv+/CJHoBXvG58ZNJNdmAgG+yBzY/S4fsSnzvzil3Uhv
	q4pbmVWTXOpXRUatN26aMsbqRGzy1sMDF0g/CaZebzV/dSMSnfQv3/BYQOh6D5z3
	4uMejn62eEc0wUAHVXydpcnlb2kSaFvxFOL7ZgB/Wp2ps5b8J6QCPaaIwbwu25is
	IhD8To9GWaGvt6pP2n+8J/oy/akYjVVq1kM7lIRterlmtrERIg3YHKlCMUp9aTfK
	Egc7TA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvmrjgpth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 08:56:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e13b57b2cso2505969b3a.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 01:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786006605; x=1786611405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+tyD/JK7/asjyuR7NrXrWq4PFgDdRaV7mFipJbTmEL0=;
        b=SBqVBq6bcVR0vsFaFyfju3n31yIFWC3apeUsADcyQMglBxqsYX/arYyuSMvj+8anj6
         8NWOEKhuOE/OEmyn5BjvGkQd6LwBI26jiwSPTSln4gJ5PLu1BuDi+FNHF+D2M4hrmlPd
         r+NMOayakALw+FJcWg6gJFrTOApGXptESC4MpCBqJUGEeQSLTY6sKoAurdPIOy2Phkof
         M0i0KZCX5xtloqtBisCOGlrMR/e5+kL2scFMuODSWxjXD7yEPOtzycFNpopdXBZEKh2/
         vX3nhtv9MvqEd4n2kcS+F+ktKhn0Wxrud0J65/78FQudylLDaNK+QPfXnOrsLPr5Fn25
         2aLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006605; x=1786611405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+tyD/JK7/asjyuR7NrXrWq4PFgDdRaV7mFipJbTmEL0=;
        b=SsPhbsPIOLUZzvpOhWunGdnU8/ZIPtcVT9eTJd4TRJihd60Lo6UDrjAWT0fy8G3uB6
         AjZQNP3DUMPsX87PS1KEMJyXa06LJmuN9+B3cmEB1YOFVKdAnk1Z7liBwm1Wt+SV2MwY
         QF6dYfjUT+g0wcDcSp0orYSHKsApnH6QgBK7SiT3Gc5fXLpDOpo1BYJJRdyEfRi606DJ
         htkrEjoy4VPxkNl8TxnTFMwZ6hROCrex9t4aeoAsdmsu14z2mKnxk6m5WJrnIiiPaTAJ
         pOpUjkCME4wbL+c38Wf8n68ypEksp6PYnZwkqb1mqIvbcGzOD2us6J4as8fpGG0rV9zL
         /BPA==
X-Forwarded-Encrypted: i=1; AHgh+RqlYfDd92B5Ildw2yURzo9jIMtADLVXzTkcGIWHhTZa748tK7K2ru09Ki/XJINgykJd/RN0iHjkpRfS@vger.kernel.org
X-Gm-Message-State: AOJu0YzT2EK+adBexQ7K1Iz35yqmp37O4+01ackU6SG4S9EYL+vz0iKz
	jOlCVcy1pkbRn30ynwtOVNLLfo739t5a6DfWk8Av1PClJgwRujvAusdBBo6wuyDW2EeUS3RRvj7
	sF9g6MXHk2aEv1k4DApGDO+G13+LJbkkU29EcUKPz9BO3E7uxHJIkp8DzvwFOUpCgEajkSbo2
X-Gm-Gg: AR+sD105tHL4afJ+67Bg5aLH+hs57NoTT2UdT2jgl5JDGcBtFWzaQmh931zLjQlXqp7
	Q/4RFtMoF3Nncm65SPrY1C9XjGFoNRdFcpm8YOut4UgrSu1gmcq7PInhY6RIa1TruURm4IN270K
	y/GOqQHdtcGk6ZtlUbyWY/7WLCCDsiRXYHs12UxD1j2TMmmRU0Aa3Iv+230sCIBV1Q5TnB5Fr/R
	MwTcvkCjUg0FaqYSgji/1oRZ2GhE96bU02iqpafvVsWQbOi+Raw5Iebi1lBZKsExSxqXEArtA7e
	qe9MqWXj6qRDq/76QoBX7H/q8u9DNbHh9jbfPrMBaOtxxDHVuvcKntxrA3ccWqPPZvJwso296Xt
	BJhYt27bkHEBAWu0+zWNlzSW3w157
X-Received: by 2002:a05:6a00:228e:b0:848:6c1c:17c0 with SMTP id d2e1a72fcca58-84f2e026437mr14537004b3a.19.1786006604724;
        Thu, 06 Aug 2026 01:56:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:228e:b0:848:6c1c:17c0 with SMTP id d2e1a72fcca58-84f2e026437mr14536967b3a.19.1786006604331;
        Thu, 06 Aug 2026 01:56:44 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b7368sm953876b3a.37.2026.08.06.01.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:56:43 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 14:26:27 +0530
Subject: [PATCH v4 1/3] dt-bindings: interrupt-controller: qcom,pdc:
 Document Purwa PDC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-purwa-pdc-v4-1-62467f4b4ddc@oss.qualcomm.com>
References: <20260806-purwa-pdc-v4-0-62467f4b4ddc@oss.qualcomm.com>
In-Reply-To: <20260806-purwa-pdc-v4-0-62467f4b4ddc@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786006595; l=1238;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=+wdwCRdnJeHhF1zaeA93mid7aVTN7E5hSE1rkcZl2sU=;
 b=tUFUVVxdfQxTULfnbFmvmioDbrWm4544ON0t/Io/DThD0gWtktYNxnL4gOz5eCcuWJMZJo2z+
 mwVNDKF8hUuA8vZDLeN2M5semtB4M+T0wZbcDt0D9m/bWXXx+dcAnY5
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=VNPtWdPX c=1 sm=1 tr=0 ts=6a744c4d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vCmKDeXsP24Y5dEMWNIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 1UjmurQ1ymbz3ghOAofXkRu8kcfLSjk-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2OSBTYWx0ZWRfXyxTGaIUUWnt4
 0q1N6JDJT+IP9QlmYEgIyg3h7p4cfQR3QVfu6eZp7JahYpvJ2+AuaubrpXvzDP3Gbh9AK3XrLK+
 XjLioFUKHiKx7u7EfOjOudoZUi9TeGM=
X-Proofpoint-GUID: 1UjmurQ1ymbz3ghOAofXkRu8kcfLSjk-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2OSBTYWx0ZWRfX+4UzrV8C/O26
 WoJ1Vr5RywBbOpEfTcKzw8G35tifEcvAC+WzjqyFIJXalC2UgmBCvI/rvZrI0SnvBhGCRma5hLx
 amWx4yA6wmaYm91OqUjNXh6oK31yC4kNr/dPx0ccexwpKveTGDSEfJMyGJmRjovt1d286S5aP2J
 x9sfZYN88fQR/wgVGuySAMR7wWkZ8JOIM1Xp9WvXxrJCj51EMuJWj8P3M5t6zEST5z8vGuUZGCG
 m1iZx3umafYQPO+ppDjdAFFK+ec/RFj6t8Gs8qOHKJkCH4d5S49RH7ZXlShnkMjUPca4lXkNkdp
 m8FxfvevzDL1cRldgjhT7Am/clIexiFLPb+KmuNSDw5Ki/yf54nxaI7MFimfeRp3cYI3B90eYV6
 /g4EXYsWhyWktOGUFnaxev2Q74PIo+mMZFShmswhmyFoXy1iLQFNcEhZcpzppxJms4nhX8PnpZI
 haZHueT9YlHhsfhrjgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060069

X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
Workaround hardware register bug on X1E80100") is already fixed in
X1P42100 silicon.

X1E80100 compatible forces the software workaround. Add PDC compatible
for purwa as "qcom,x1p42100-pdc" to remove the workaround from Purwa.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d49a6..b3d19c86a240 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -58,6 +58,7 @@ properties:
           - qcom,sm8650-pdc
           - qcom,sm8750-pdc
           - qcom,x1e80100-pdc
+          - qcom,x1p42100-pdc
       - const: qcom,pdc
 
   reg:

-- 
2.43.0

