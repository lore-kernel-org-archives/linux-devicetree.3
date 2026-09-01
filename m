Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD6446C4B4
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248504; cv=none; b=aBkOKcTp8djyTWyl8JD4F8MZJbLvD6rSeYQuN8+m9fjw2dHnXA6chiHovL23Zi7pQrY/0g/5ng4wCqFgP4j2J9xEXXy0NNGv2EpOo3kTfnZJy9CXjQ65Myh6IFJ80+IIK69VrOnEqPydB0l9l9Pd7TXzhQ+qTCl+qmSVW+ndsiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248504; c=relaxed/simple;
	bh=ONrmBwAPLKPDlLFjD5hZmt3ziTbYPhrJZcF4w2m5+I4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pDZ63pxW5IAJa7FbiSlLyRzspVJjr+2+YNTk/N7DAeWPMh2AlIKuK8fABqe79Rxirs7QIGDKTMfSH7ez564qs8wSvQx29VTz77plJHasrSipaZDAh7lE5dHkkEdd5bFgWX4neurSFUuqvK0FEoeKWkYYC//HRhCIcz+6AicJlm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YdY5cTsk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dLpGYi10; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YdY5cTsk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dLpGYi10"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Hoo1975447
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 07:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nnUNgIXtKmNalo4SOMUEDy
	v7hRZV28dJ8kqH+HmyC9M=; b=YdY5cTskCMzpW4N4kEBkWYQmFZCo8yibD/YSWY
	agJ7X/9MxI3Opgj6tAP69fWzme5x+3N7sAZ58623qdBmdEIWIDYxm1x5p4ye2ZrO
	/BZ5W5dM0hZsKyknh0c52WEK9NhR1HBqNsGqmfXZKm6dFL99WnIa8f8N5apVI2rj
	cIXeBni4Fim+SBnmvNqzVeYkMmjT4Z+51l1zqgELqrc6B49G/tHNlmFXZ4tccEg6
	2pa/7oGOomg1QShKtdPpZXIaAElHgVQeWH21YnJpQvQ86D+hqcVARTajOw3lYOIx
	HV3qcgVGXUXfMF9KD9eaTQGlRC4dx5HlAO/BrPdO9Lzga/XA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r137t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:41:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso4439305a91.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788248501; x=1788853301; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nnUNgIXtKmNalo4SOMUEDyv7hRZV28dJ8kqH+HmyC9M=;
        b=dLpGYi10ymix9+LhzbUOordnZSM+xGHm6J5wpEwQGk1aG7oaFBKLENttcFb2GE990e
         XmeAFjHGVa36oW6RlBkzVz052ol8+kYzTPrfDL3zt8QoPjiy4ohC0mtb9BFEcdidhUaq
         1raSpI2N91n1gP6Zb15SKFyTmYzcQ9eXu1WIChsLbv8xfI76nnRXS0QpfF7BOqo77Xam
         dgz/PTYtCui4ywd1T33KKaMT39oIvTeym+70s/hA82Pa4w+FGzcOCaZJcHArJrNs9B4j
         EoJ7XFMPtdU0noTN7G2xe1BJ9nLO0AFzPAP6y8gX8OLei12O8IeNkWtfgw9bBqAePKTy
         MOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248501; x=1788853301;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nnUNgIXtKmNalo4SOMUEDyv7hRZV28dJ8kqH+HmyC9M=;
        b=XZ64TbVBW5QAwRDkkiNTr/pCNv+eUp8CoohLzivCGBzaxoa2b4OuCsBUcF/KRhPcIV
         Uv95iheb7mCXjR68JVzsDKJefayFrlg1nCcQzgejaQ03BUgZAATMHO55g9O9aiCh83Qj
         UmEZNwuV4drw2mp3eQqGoRaAdSCE1JDrhRBiWLs80YlVPKByMi1nxTtADrPNgS+f2m5y
         fkfhzGJe5q598WL0ibDtRH3Nd0MlPKTUjIBONw4n+/0TjbtuQpbR5CsxxcO6J4RR0boA
         DeM5KbRKwoU6fqqeYuTDS7kQUA9bSbLkChkIR63EIr3w6+16TQopI/PG29Z1CanX3fuk
         U0Nw==
X-Forwarded-Encrypted: i=1; AKwUvBwbWo8iRDWWA7HQ/17uX8/Gv1fNIlhJ5HVoDQ1oTqhyrtacNK3YpoZKf9BLnwcrvwZHZTc5c5qqJsAJ@vger.kernel.org
X-Gm-Message-State: AFuF++m60d+3zWSemdQthdRCsRIzhFWPAtJ4kheaAGtgeqSjRFoIJgcY
	TXBTr0y0v2mxA1wxkX7G8eaPhCw7uJTdZxgOM0P/tbTBhyhyFMu/v8kUCXJXJdj3uFvDBAX2LFu
	KwbT0jPk1ftMPKwsDL4RTgWzrBVz9rXCjk2GcmfLhVYTk5IHKDEu1T/ZEE862uPJ1
X-Gm-Gg: AYBFou0rWF5qrwDQOBXHE1x59ai0eUq8CTbT6PeAfd+nJmCF49T203pODah3sCmFiJe
	fMsU9NlPqZOCKUcdPqAAaRUVNzOVAI9R9dtAZE9SxVEZtLps5oc0WyGFxGoQXwAWWS6cT1Ucut8
	bLg79o91ZZtcvRVykQreRExfgcGUdrJdPQQJctyh/t/5Xy6+eJQZdPaiOG96wdAVXvqC4y+SGai
	GbM4XA8plU0e9Ey+/eenZiWAiNrGwG+Yk4yJ3uMQA88Gpa2gTHBtXRJC0AtfWHdIiQmUc8Z6zeG
	wun5aal556edmpuap3PDMbeTRLQPhB/U9a6Ve+C9H0cc8KzUrDrd8lGbZgfmfwGHdbw68YkI/Pd
	8gmsYggVbLdz8QM5zg9Rs7hUoek4bNBOzdKQ=
X-Received: by 2002:a17:90a:10c8:b0:399:221d:63c0 with SMTP id 98e67ed59e1d1-399221d655emr2102112a91.25.1788248501271;
        Tue, 01 Sep 2026 00:41:41 -0700 (PDT)
X-Received: by 2002:a17:90a:10c8:b0:399:221d:63c0 with SMTP id 98e67ed59e1d1-399221d655emr2102052a91.25.1788248500815;
        Tue, 01 Sep 2026 00:41:40 -0700 (PDT)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d4f1bb8sm5348784a91.14.2026.09.01.00.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:41:40 -0700 (PDT)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 13:10:59 +0530
Subject: [PATCH v2] dt-bindings: dma: qcom,gpi: Document GPI DMA engine for
 Maili
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-maili_gpi_binding-v2-1-c10dd2324a09@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIqBlmoC/yXMQQqDMBRF0a3IHxuIaa3oVkTExG/6pI2SWBHEv
 Tfq8Azu3SmwBweqkp08rwiYXIRKEzLvzlkW6KNJSfWSpczEt8MHrZ3RargezopHoTOlh5Jz86T
 YzZ4HbNezbm6Hnx7ZLOeIjuMPqAToiHUAAAA=
X-Change-ID: 20260901-maili_gpi_binding-37b12bf9e5c4
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788248496; l=1133;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=ONrmBwAPLKPDlLFjD5hZmt3ziTbYPhrJZcF4w2m5+I4=;
 b=QU1D+HH1NTvIIaP4M6LcF4kHhVq3AN88zrlvq9ubeNwxKCWBZZdTGu4CHHV97vAlhBNi6z4uN
 34Uvq+LKPjjCZ8dSvEV34LyNVfQgGbShuTu9yKQrRfJ/RRyKrTZYxgM
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a9681b6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=THIw8Hy6Aik7p87rLRkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2OCBTYWx0ZWRfXzFpJzrmhXfKL
 mQjhfPaVZHPhR4eIU+c2ABxbcJ5QgXm6tCyYCL4UWRX590F9AATPReMOHH5OLxAU/BXT45QxTYH
 G8hnMlllgXrz271DvAyPINcjOiKo5NL+ENqS76u/8HmqQN4vU/nCbu5gw9n72e7xO6j3SL2deJ/
 t3Pup83uqDzA6OIG6cK4dIjef0IKobGnu3oK3/Z2Kl9f3dCi/hxykeT1Gn423pgxV4qGXUDMDzY
 r+n1lVJ9iWrrqtytz/HG2TUPTJwgiy3GVB5+RXCONMqiE4pAiMpI88nk//+Gm5cF+iKHI8NAgyT
 TQ1T/T0C6v1o3W1OIeU2W5fuw0mPPr3R0fOQtTOmJ/rEJ9+uq85QZsf3bdUwiuMzO15Btemq5t4
 QKxV2EVvIKA7LuyrU3TCcB17IyOSd3X5+cB3lCji3Pse7GHOXERWjlngJjPi/HQIf54nGDUQVxM
 XcAqJe2nzmIS6FEjHzw==
X-Proofpoint-GUID: bqOtFcQDVP6mqFGfbzgDi99-eLSe9KDe
X-Proofpoint-ORIG-GUID: bqOtFcQDVP6mqFGfbzgDi99-eLSe9KDe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2OCBTYWx0ZWRfX7SE3B7GY7n7D
 kZlcsqU/ZXSGIAPNthRmVK79LQumQLdgi82xfQgyqdfq2bUOxpoa7P/lVARpb8W+hz+TnyFo//1
 vdMuyWzMwk5JJgcqH4LShChjLLFR/pI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010068

Document the GPI DMA engine on the Maili platform.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Acked-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 54dca623223d..dfc4a3054b5d 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,glymur-gpi-dma
               - qcom,hawi-gpi-dma
               - qcom,kaanapali-gpi-dma
+              - qcom,maili-gpi-dma
               - qcom,milos-gpi-dma
               - qcom,qcm2290-gpi-dma
               - qcom,qcs8300-gpi-dma

---
base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
change-id: 20260901-maili_gpi_binding-37b12bf9e5c4

Best regards,
--  
Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

