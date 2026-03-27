Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADAD2BF006
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 16:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774628338; cv=none; b=st6zsr3J0ERWeLaTpcoAnOs5i6FdfDxGAm/bQqVzbUkoeqhKtIDHqaiEE5nyj4dLw7/WvU9DIB2OiRnBNpkhhCFZQWfq8y5AOQmvRkgSkLXo/99IYiiwGBPTjrhfqOzR41vpmRf1HbbXkIIAl4T/3GBBXBrwDRYgEj2Z+kraNKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774628338; c=relaxed/simple;
	bh=OhWzLg1N7VUw75FT4ySNKXzuT95zElcSAuaBm0lVpVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lZbR2Mpn7sxY04tNHBAYkSc4OJpNq/XdhaPiD+z+klovyZ+JsPGsRm8eWFsBb6AQr5gAdEzQd1GsnbmTOQ16jeT3M2nOUpbBFRISONyxCF/fZm1ddssIQiPZEnAzxYhLnfVLgZSal2KBXtvtCW1r2JSLOv43lULoLgKldSmCA5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJoWHilW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ja4co797; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJoWHilW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ja4co797"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RFLGK9537532
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 16:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ho3xlrBEbvhY8MfpTCeMC8S7S66WXzIKBaHg4DQWXjI=; b=jJoWHilWsVWLf9gP
	NIuWc85VZOtrRRvzQxmZ6STAtYqIkib8JjFlJ8Lo2uVfxOrbxR5RF24QhpdnmtKJ
	BuZAJNgtOd3z34R50rZ2NhLX8Um2lnty9d0+3HWDlh4YrAi7g5NGfYxHkA+nzlUg
	LX13/gPa/HVGh3VBpLaWmp9WMbXQcFB1vqdFrCfNsoMNnhJjoWzYIK49xI4euBdc
	ioOrSB4eAIpisglZ3ITXz/JIGEUY3xuHwyGgOsAbYWgpk6L8PE2Wqd1h35ZrlZMR
	Ke4GjQjyHv3F+lz0tZiytSgKm0A9WGNqskFwEYK7a0CwNbRsvUdrbLgR+vmOMSHJ
	M5dwEA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vf6r65k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 16:18:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b274f94f8so49669841cf.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774628335; x=1775233135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ho3xlrBEbvhY8MfpTCeMC8S7S66WXzIKBaHg4DQWXjI=;
        b=Ja4co7975Ia/aXkRCL9W9kr2jXtG9+YWWulfk6QtCgFQe3LTjJQyrdzClnDBzJuZ4Z
         FZjsiEK7nGhGQ/kMGpjMkfnFpe68JKKLBdpL6WwI8fj6+CA9uyyF4YjIJbEcbmjkPal7
         GuGwEu/7O5aHrZ9vJIMBqv4Dk9Yz4K4gL/pxvUnrLs7o7QpaF5WZy4U2vrPmyRb9J6Gx
         +Qthtja+7AYs40GNct41Pao17pMAj3JaJTUokKYt/5LfsvuYpLx/ogKy97pbdpSwFzJN
         xbL7oeg2u4bNBSnUIn5tnVll9mHqgj0n6pC8VoSbQZsDvxA3rsdzyD9UzXhNXZRNDCPC
         cw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774628335; x=1775233135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ho3xlrBEbvhY8MfpTCeMC8S7S66WXzIKBaHg4DQWXjI=;
        b=fM1xOf2ApF7ZFWLMvK0TM2f9PCTpBlZ6E8XXm8g4Dov4A9nPjjy+7DWFgTVWf2tkgX
         dyBs58f3c7ecAwRX2nmYVWltbbBry0vXN3VAP7mhTs4Ih/854kTHSCPPnH8L+LKQYlYz
         pOVVo16Cc7rNpnDA6a+Wk9jlY5WE2hsy/+dfvJDR+G/ijmMCbfY9eOVDIXUwqsxdHtFF
         5hElqsKFTpGZgnR2T945W13PDGykBu7/se2JgHS1Y1ERZq37W3aubjLsY3q3WktJvUc3
         07XbU7N+F0BfYppcorxeFK7VsVtDCaeZ2zbfzIa01VgbfRvEY0Aw2IBKAKZ2ecPzWn/l
         W0Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVLPWDuAFn8LUGZrjfkoMnHUMIEFWVWAllQlmLOt7KeJ75i1upjrDUGVBCluKsF19TuAcJ2937t1uVJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwvjS2DbCXwWakHguSy6BgBlxG+lGIv9hvK/f5nKamrRQkRsC3b
	zRcMMXxRo4odgpnjpjR8IwgfLXrT0L3xC6IgJVwRwAq/E/ZFFhMda8/hy4VRe/Umx6GKXNwAMS1
	Kkymk0FhyS5OMMT9BX18m5gB2/Qe9Rf0XGB0Gmpj/j/+Y6xGKjhjXtXtXsBHR1sfA
X-Gm-Gg: ATEYQzzN+uaVvFmyfoGC+qqBXRLItVznU3+tcUVJW/HtqYSYNuUIAHMAfZhS+aDH+jc
	+rR4Hi1RuL7Geb+c1JMBJb4jKqsdmKW+vWvzn2ZYDHwy9HQi62/wsC6nExc4X6xjuk3puGVD5TC
	AqtioGcep4KjGFHm+GxnzlLjMJv7p3eRNX9y8knJtzI56Nas3MCPGFKlql96O2chyXzt33Top9x
	GOvsFhVNPJDB2iVZKbzAMu28sv719BVySMIWgngSAHYL0p74M0+qQi3e8SWmwvqtaWc5I88wy9M
	EUSVD1pu4KuxpfapmjXTGFt9oVX9r6yWWPh9rRntkLyFZNXZBIC0MoH1yQCjV2KoFOWtA6i/LAQ
	QMEriNuucT2Ld1CQoxxpecGyANFY=
X-Received: by 2002:ac8:7d05:0:b0:506:baf9:5dd9 with SMTP id d75a77b69052e-50b993e4965mr73261211cf.17.1774628335036;
        Fri, 27 Mar 2026 09:18:55 -0700 (PDT)
X-Received: by 2002:ac8:7d05:0:b0:506:baf9:5dd9 with SMTP id d75a77b69052e-50b993e4965mr73260801cf.17.1774628334502;
        Fri, 27 Mar 2026 09:18:54 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm205955525e9.2.2026.03.27.09.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:18:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 18:18:38 +0200
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,milos-pas: Document
 Eliza ADSP
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-eliza-remoteproc-adsp-v1-1-1c46c5e5f809@oss.qualcomm.com>
References: <20260327-eliza-remoteproc-adsp-v1-0-1c46c5e5f809@oss.qualcomm.com>
In-Reply-To: <20260327-eliza-remoteproc-adsp-v1-0-1c46c5e5f809@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=OhWzLg1N7VUw75FT4ySNKXzuT95zElcSAuaBm0lVpVg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxq3oaZ/QetAeynWbZB3KbmQq4OjLboaqinfN1
 5ZpNgyuXVmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacat6AAKCRAbX0TJAJUV
 Vo1JD/9eV3rwqakfe2vzvi++o7rrdNxvW3QYoN3batkYXXHvbjGYzFw0cuVgOBuRnwyNyZFaW6S
 S13JgZOuhnzAl/GVxH0f1gfdGGcwWLkbgLtSotPJyhDaWgAdWlJOqNjCbJibOdlgDbxzA5gZzPS
 0fqtRfHo+lNojMnkGcKJrmyG99GoneZFNsDuyFkqXGMjsPWI0fjXOkInyRxKMx8frn50WmoWBNc
 SvmWAwFBhWZaCoIdsHAPtyag2tV7VPfDM9znFF78DQ8CHiJObxKT3QF7dSHGA2Vk0UCn71kH2aQ
 bLNr9MbSsflccsWLX9clKBQpXnmVzGXEvMzWlOlKDGMg9Sx3GbyeAtwF0JJP1WIlLL8XCTKEFVC
 Whe0Get9dzHfvYHI1cifE8uHV1JEQQfvH6afwjV/6J6j45JnG5Ib+gkMdS71CBeJVPSktV75Xuq
 +S+vxWhg7XTDb2vb3OFNfMn4yiCc1Qbf1Ln+tYDpwJb9zxQMzktuo7e4GR1xm8Y3hVUyRSomWlS
 bsadWAjjpoe/Oj9VTaCAu0C85VOuE30yyb3b4w1GcEKQoCf2qQ8IpadTiXtZUKJE+7lIqfVh49B
 PLOtaoAPciOz89fGUIG1J384wzpbhlbqdyHEfvutEZ8WI5HvKoM5mN88opRsRLzm87vlciUp3DB
 WiV+HrjRZrU37LA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=X/Zf6WTe c=1 sm=1 tr=0 ts=69c6adef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XKsGtxyC0ZlOnUANqVcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: dphWTW6tlRyg8R0VrEv0hK7vaIIKCGpe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfX5nFnQzoNgC3n
 zXFJ4hQqTrSxVpxCOwhG4joEXOY9+7kZjT5bG/Vzg/PcjrJffOW4Y+VyU/DlBJxEOxYft6OaZw/
 St8dD4frO5xNFm9U9ZS5AUrRj0u2jLcBIPD/knERLBhJ4tf/rwF2ZjCc9PGNLxw2QhLoDAwPSeP
 fENtUcT3rFAxw+NetF8KgZySPEzHIsTwRPH3hO8dUtQ58C5eeWz9bogGsf7AJdQnDv/WieX8CKr
 OUSWm7E8lPYGANGNZI+wretedrqfwpqLGSO+ztOrR3tDbOGqmIRz0WMlA5aMIDM6VvXkk7oAsGp
 IG8wi98NExeMQ4SuNknpMCMVRUbXVe35zHujo0pZ9A/vxuwe73YZ9rm70AvoX4G9M0F5zIhU3oM
 FWsZOMfPOoHDZhOLkh/WOipb5gBtfOBdRnj5F1dHruqiFfNeKmSuXglJlIAoXThacLhyPHUvnjH
 UU2BKoO+29H7VEvi3Xg==
X-Proofpoint-GUID: dphWTW6tlRyg8R0VrEv0hK7vaIIKCGpe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270106

Since the devicetree bindings are exactly the same between Eliza ADSP and
Milos ADSP, reuse the existing Milos schema, just add the Eliza specific
ADSP compatible.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
index c47d97004b33..e5cce0d05fc6 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,eliza-adsp-pas
       - qcom,milos-adsp-pas
       - qcom,milos-cdsp-pas
       - qcom,milos-mpss-pas
@@ -69,6 +70,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,eliza-adsp-pas
             - qcom,milos-adsp-pas
             - qcom,milos-cdsp-pas
     then:
@@ -89,6 +91,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-adsp-pas
               - qcom,milos-adsp-pas
     then:
       properties:

-- 
2.48.1

