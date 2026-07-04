Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC22D1E32A2
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 00:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783125865; cv=none; b=G0l74sVdp5iIQmDOPBQBqkcP7qJaZEyhfarTHzWWa6+kRCHlc0VM8Xd69fHTRcFyF3aD3RL01bRhqxzxe1lr6CNq+BV5xrfJrWVVJzl9P4yfGJfPyJM8PmW/Jon/uB/GUwVBt3BejN0xrfNyOrHCZXywx5MaCqDO6GJEQsYzvQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783125865; c=relaxed/simple;
	bh=N7vEJ1clTit00fwCGUvWO2rua7WCCzdrl7Sy7uBSfow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C6X80VXffBS+eEuzFEKSPCAM+C40DBYg06gJREU0LAE2xjItHD35TIaCQfqQTGh81Ipp9gZE1jtsgEMROJ9hEGGu/H40uD7oqSmHdDodOsSCXbVZuwj07AecNos+xsvrXg1CAOnJjp2QwnPjcLCmwY+mtuYQqyK41QEc5Ozx/K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hu/T42Tf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A2Kv6xkE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hu/T42Tf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A2Kv6xkE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPbqv1029436
	for <devicetree@vger.kernel.org>; Sat, 4 Jul 2026 00:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kWLCWIdXV3P7AORzTQrp4L4mpwNnbz+F+wy
	RzganFkw=; b=Hu/T42Tf42mZKimFyHzzcnPbS6U0Rf3moHsb5fboOsUT+be6+RI
	qThvCiukiyCgpCBrUZIq6cyE/7fcIgQ1nnxQt5q+hY1ykRnwX5wd+POx9UcbVefl
	K40mV+pZ+zxp2AKhU9TZ3wMBuTZ5/QRLYwN0DciSuqq1XXFPD73gPH1WKvte8Ek/
	D5u/UlXzWyXmwBfaDyVfIX5cMMDmwOrXe25rLiKW26tDtOtayRx/r3MvWUkmKFfx
	M/P5yf6RxPIzq7aA4sAt7jbtPLm6l3c80vU9BtIg/0E3ZEYZRfXhEHBh3eoRjBaE
	ep5HsFo7/5eCMYPjf4NYa8vljRMrwFuxfDg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qcm3mj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 00:44:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so1393528a91.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 17:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783125858; x=1783730658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kWLCWIdXV3P7AORzTQrp4L4mpwNnbz+F+wyRzganFkw=;
        b=A2Kv6xkE3w9bjDFueYtfroj5+C4aVmEbhDhEmVwGU493gBaOZiwdF/2bRJTHuEmGn4
         Iuj/UQ6ONW/laz1npvXKXX0YwDaFUejjxFV7CsuRVRipUGVJ4C5UIEV4GJKl4FiJwXw1
         yrQkLNzcAmJpeKknSNT/xil2flI1qLDGyb1UXHQdKTsihqXSn8jmkRWiapteBC/X6WVs
         YS2+LKwF+eLcxHsRme9zCiPuEM8SQhKowDQyMTIYHBS0sXCr9jyjrN2vqseWScBrqtIX
         PkSoxYDPbmOXpxRvl3oUBaFzI0GgumiLAZ8Ow4k0Iqw6G2CLkeVw8mbLKBBpINWKEv4Y
         Jjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783125858; x=1783730658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWLCWIdXV3P7AORzTQrp4L4mpwNnbz+F+wyRzganFkw=;
        b=ierVmN1Yf1c5G69D12qph23ucJYaXFplBXW9FxH/knOzC/S+BLAwFhJ4UNhUccpri1
         J686MZOa+NZdzQr/cmRwIHui4u8Eiy7vw/9ualOUzomObZ+T9T8bDz9Z/gOsjT9OXkDZ
         FDKPzG9K7XWUCcxwFqBN+dDavhCSv/0vUlDcxBD2MmfDsZn5XY2dxXcq+zwjTDFzOQgt
         1VP7IoNuPqesj7RiODnk1/Jk55d1lrp6K58uJOyDR8f230fHGbPlSsEwaUDFRG/2k4N9
         W5D6SRBAJc0mKMkhHYJ3tLirj56s9TZE/WsNPLPrFDpQ6bYQKPQOCp+sK6MU0fmtPmq0
         bRMg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9ssHZ5hUGIwpF+rXd0eNDreLlSeyY2GMvpXsnU9fZo/upqKJdZnLHnhRtk0128JRAfr1orcEjy3lf@vger.kernel.org
X-Gm-Message-State: AOJu0YzFZIr6gpzz3knsQ46dJ2WKTRpgdOUERwwhfKFAYQQ3zdds7LGF
	IxeeE02373qF1HZHXQZcPhaIktMGxVj4dFk6mBSDw7CXOSQ7Nwe+QcxMTCLw4DWy7fJ7paJt6k+
	73MMM0btyqshBy0+UGA2QHY0priJJ8utoVCJV/AT9ruGNBUJy8BPBeIVbF8pvQsMK
X-Gm-Gg: AfdE7cnDp70wGIGSE4WzJMjVVpESO2tQVNERdaJ8Q+5Kf0fnMN3q1AZLIXVyJMggEL2
	972YYCEKEfKNrm737r9NLU6sQgDmpoRZ0IpTxsnYYX/Qwf2AOF4QMWyHbufpYQPIIbUWt0TycXM
	/w3MSb0bfuHTG9fqv63ssJLqU+1hk8WfzpeIJb5pkLPkIJ2U6mqUV4k8/Bc70K7CTZiQ48Ld5fw
	kvtI2RkqJapXO+uGrlvZRSty66Cxp6BM6BfL3BXUFyEv7c+FRsXymmqEekSHCrNefLkXcapWbny
	nZGl8Fd+hNRYGGfE9itBfh1gOQNY7ZYPFBdvj9yZcP01XyrrdPtJ1YsKKKHXmeOCaZsMHpN9PLe
	UYmi3+7Vb9wkeKxbG8Zf5YsTXtT+ElkF545KafHmqcYvl6QKEE/njIHGrCgi05jWKUw3kji8=
X-Received: by 2002:a17:90b:1e49:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-381120b2f0fmr7021884a91.6.1783125858191;
        Fri, 03 Jul 2026 17:44:18 -0700 (PDT)
X-Received: by 2002:a17:90b:1e49:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-381120b2f0fmr7021860a91.6.1783125857678;
        Fri, 03 Jul 2026 17:44:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f44fba9a4sm862777eec.10.2026.07.03.17.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:44:17 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [PATCH RESEND] dt-bindings: crypto: qcom,inline-crypto-engine: Document Nord ICE
Date: Sat,  4 Jul 2026 08:44:08 +0800
Message-ID: <20260704004408.2303468-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1y58pJulamBKCcU42SXvtnMXRAm9aSMO
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a485763 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qu0NaVmkdm94GxaCK5wA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 1y58pJulamBKCcU42SXvtnMXRAm9aSMO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwNCBTYWx0ZWRfXy3kQilJWODFw
 Hr0s8WIbJf9KDc6C0PG8j0hJpChipavdyF7ydq5ptzG6wFAyEvfmjmnPWn2MjmPLpO1O7rBw9Ja
 A6zzliq75sQa9ACTDPeJyYYO6NYPGl7Aju9/FvLa/F2WVxGcXepR9qGkya/Z8AWnUqOc3CEpHaI
 FIgQw0kQ8UZgfqpPbcwmfCZCIUDVaswZ6JMIhR/OPpQz4Lnz5QssPNCg0oLtsWsI+2eBSt3Zham
 tibMtfbvNUUUxrDA/bANkystQBWrUl5WDfgl0assbtcBEi8xPoNfi+ID89R+suqXKu5kmPNs5q2
 I/6BJPDTaGS9T/uY2KxLKw5Z6dA70Z2Fv37XtB8ILDC6arRsrdxrQ3PvR6AFZPAmmIUroF42Y2f
 s5QOZE+CIiKqmu2LQLXrFacJ+TcmTPZxMpuXzBZJjSBamx95Zga2tx6hZt85qU9D5yh91bNIEG5
 K1A1VoK10wOuAtZyLlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwNCBTYWx0ZWRfX+1albUD1XLNE
 WZCOr6u0QL6+HJsR2MIBEnJdTBDWuGRLYnd506j5PDCC9SaWWwk+uoeIscPnI0RZyLjU3fHN8eJ
 opaOW4FwEAwEplS4BlyhKacIumBVbk8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040004

Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
It was included in the Nord SA8797P DTS series [1] due to that
the prerequisite changes were picked up by Bjorn for 7.2. Resend it to
Herbert as the dependency is gone now with 7.2-rc1.

[1] https://lore.kernel.org/all/20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com/

 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index db895c50e2d2..d690eff2e86d 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -17,6 +17,7 @@ properties:
           - qcom,hawi-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
+          - qcom,nord-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
@@ -63,6 +64,7 @@ allOf:
             enum:
               - qcom,eliza-inline-crypto-engine
               - qcom,milos-inline-crypto-engine
+              - qcom,nord-inline-crypto-engine
 
     then:
       required:
-- 
2.43.0

