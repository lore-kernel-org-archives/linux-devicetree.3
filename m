Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3586B40313F
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587153; cv=none; b=Mi25vxdwlJHOYE2Ocypd0dcyXn4aa3kumTpwP8tCErpq7hYrQB8qJGfZ5/VmUfRFXFPwO6nEMagp6cORbrJ6feIDH1AFDebwhNdAqgg+jZseazfDPfoqJ8c2PvWw905OFRyZx/nGxA8L3IThGvfNS1GKRKrSbPLTEadcWYqnz+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587153; c=relaxed/simple;
	bh=WvHbqwZ2lRODAE5+DdTi23lJSw5LzBm+wBkh9BZfEdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJX+vvbkUFZ5Z4f0Wy+Vzd2+3vGaENgwUBaNvEUM0caszXttNNR5UGXC0jP71wvqgfpGVdOhr4tWvKG+LjhP4Xz78YF0xwn8FGs5aJxTa0skz3vKXP42anM6SdJ3I5cLYUUSy0CWJtwHDwpzoaJyrVFHk9PQLnIA+TwyT2lyjUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JU/0lVtc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9s+sE00; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JU/0lVtc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C9s+sE00"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960GCd887939
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 08:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fYwk8uIYjWB
	nFdb07czllCar5lvRm5VO1Cep6JxlikQ=; b=JU/0lVtcp6d7dLLzJT4yLY6GuG2
	+OUjV/TTzx9J1hOHFs3qkHuCQl4u912YF3vsyQ/PAmkXtF62vl6QLrZbHHf6FXxh
	BxyKEQ3tOYWTwecebVzGzO3sUt6rZO1fssY4vGBqmFStf+6O/C/z2C59wK5BzXB2
	MckipeoH3jRlAIu5NDtj/y+Giu58cbEWZLi9ckkuYC3F88dd1ulUFK/SbQ7FIYYG
	CnWAwoaLYITE3Vq3HWpFLkEVBcERFhZNFCtn2WSoDvrCbDZ3vlfUnLB0wtuEmUWV
	ffo6ERuvHMH7surogU8g6mlew03K6w+y03AFQdgNcuUSpoS1+e87LEpVMhQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq33nfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:52:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso2598981a12.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587150; x=1784191950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fYwk8uIYjWBnFdb07czllCar5lvRm5VO1Cep6JxlikQ=;
        b=C9s+sE00OXKMVRIVgnu1hy46MOBwhHi36O+vpiks2+x5pQMlvPjwiJ/hKB05ONr4PE
         31kB+dRXJ5/aRFdx6OixQZMElz3/TE+11sy71FSjC6qgL7OLJbMiL1iNeKUywhATRTKp
         hMiqYQWgdTy3gYO9UrIjXuMvOCeCHvp1PEte6UPbRx4ROZQkV1jRoiet2FeAuXb0EjrM
         unVywrvSYtA2sLDEJ78QHzj7kaY+vcvh2j59UIE6+wumtHuOevjZzDoFjrD3DuLM7QFi
         uxt1gonMYq+nQXJZ2ZloKzrgu3xWJPY8SC6vZfZ+/4Tjy/63zvMvQo6ebf/OYma4IWWl
         vpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587150; x=1784191950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fYwk8uIYjWBnFdb07czllCar5lvRm5VO1Cep6JxlikQ=;
        b=CjxtJxHgNP3eR3elOes3Ao5a/YFl4gRZyyzkT6gWkMC1cVnz7GE0qWx9FKV3Z3T4jl
         LUnkNFs0ZZ2Ph2gCEjhSTctxbkRmDQ9sbcDBRU3/cY/HVR1G1NnSpPyeNOUL6g10ue+U
         kpSAkXRIEyUFyajWeuPm5krYJXl+1E+deo2Eh5hGqSTfoXKsbqZ+OlscmUeOKEJMOJDZ
         NJhHqb4LvD2/6Fs1GEiZ/V3gvpVCDe69Y2O/3OzDsYW4e0zYPUK7nkHpjWcpA+CjvEGP
         CP32p/aRL39rGNSkWDf7h0jrC/avP2DE79sPzTmyfiuOLANTplB/3jgWFQXneBancMoK
         NZiA==
X-Forwarded-Encrypted: i=1; AHgh+RqFog9whzNnNqwCZFnn0G6qSJtBd4vXO7qLV9gWRCkTQ0D5m5d42LfSwAP2qt4bmm5pTsJuu+Xx5VXa@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ1MEuhzmPc2BDN60f4eKxU7b73k5yH5TNw2RhM3RaCYu2W9pZ
	TnGOZnRV3KXY29g/DyIDaRAm0Tyin9AT3wycZEqkerFL+y+3bCCaJR6bGYrbhLQrfRNQAC4zFdk
	yRMPcpkw/lC3BlxkWty5rWoAxMnPOCeHJJw8breodPzqzZsWfbu28AupPsLx2BO7j
X-Gm-Gg: AfdE7cn4lZEcIOLhPxvLxqGLBdF5GQ9EY0SJiwCp+kEEEygGhurTWgtFlodffe3z7KP
	ItQQtIcxF2c+fmelfVfFumyNhSvclkzTfzMwTAn7g9U8QbUv5HT/bRt9GytoGOoKPCIpVIrgfCD
	pbyFGwdSCBL+/eQ6h/Jet5B+4bs6wCEQQlj2tsHLkPsz5p2nUcmUc7IAtiRPwQPFmQDNpmjreMD
	r1VF7K+OFgbuwYQ/i/BpCZ5BTg8sfbpo836xlfPX46uhQXQAJhO7ldrO1Xm3WntxEJcEGBrzYN6
	dkh9F70LrOMvQwlKT2vIKiyHMgvQKfrSJFdVOpNkbSpzHVHwKujWTmt03x2Vu0eixDjlc/f+hKi
	CRrq4MVYeCXHrNVwPn8FCMeoZbIdVvvWFxL4WmScEkpxltUmtA7nkpCciGp9/f0+KbCAEwMA=
X-Received: by 2002:a05:6a21:a96:b0:3bf:99fb:db96 with SMTP id adf61e73a8af0-3c0bcbbfabamr7635611637.49.1783587149922;
        Thu, 09 Jul 2026 01:52:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:a96:b0:3bf:99fb:db96 with SMTP id adf61e73a8af0-3c0bcbbfabamr7635578637.49.1783587149489;
        Thu, 09 Jul 2026 01:52:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3b25204sm3460027a12.28.2026.07.09.01.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:52:29 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: Document Nord ADSP
Date: Thu,  9 Jul 2026 16:51:48 +0800
Message-ID: <20260709085149.4072181-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
References: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UWnS7bYlMKaw6zBDH3KN8xXP4o4G35Mk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX6p4meZu2s+ze
 BxacoJ6QhXZj6lbQ6FSHAtVwGni6I7zlVyj3BlYTJc5jeZToQo79aBw7o6o5zN2QferxJwX4BF/
 FVcTVnSmVuq547AJVGOA8YcDKs9HsSwQzxr8qAMF7RJKFBndaZiMrz4FS1yue9/+GM/kTzfHcrN
 1tsX9ZTczsZ5GY6KIc/J5dPCoyHkH8L5SwfAq6JRWUwiA7IRSpAkT0yoKXol4pSjcXIS1MCgT9B
 ourNloYHOyS9CkoKxdUQ8pCzKWqODqsV5hJr3iaV0pGziFhqw6MVWG5vGPfq9yLO08UZNTH3aBw
 ndEGkAkUZ+wzDW1GiDtAlf4zm7MvN0uXDJUoc4N10cwWo22+9hZX6aI0pKxKTu+p0fox0JFHYCd
 sCs+PBKFWa/UQWrWxRshal1jjvadduXXb03Wo+GS9fCz100GWmqRzgsiB5dSaQhftnRboE4CGQF
 /b7ioyK+cV3hx2dfLDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX42MFgZJJeFJi
 wFzr6kn/ZNZn5XyR/5eebBQX7p88T0Y5a9NJ7vyTUdr/QvH/FVYpKD+x7q/oLI9iinWWAdCEWde
 620iYP1idcP89cC4X/6dhmfpw/juhhs=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f614e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=aBsbI-zWOsqIVKrz_5QA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: UWnS7bYlMKaw6zBDH3KN8xXP4o4G35Mk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090083

Document ADSP (HPASS DSP) for Nord SoC.

The Nord ADSP use CX and MX power domains, so add a new conditional
block to enforce the correct power-domain-names for it.

It also uses IPCC-based GLINK signalling (shared with Glymur, Kaanapali
and SM8750), so add it to the existing IPCC interrupt-names constraint.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index faf7b2890de8..1a8539d6b788 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,nord-adsp-pas
           - qcom,sdx75-mpss-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
@@ -138,6 +139,7 @@ allOf:
               - qcom,hawi-cdsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
+              - qcom,nord-adsp-pas
               - qcom,sm8750-adsp-pas
     then:
       properties:
@@ -242,6 +244,23 @@ allOf:
             - const: lcx
             - const: lmx
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,nord-adsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MX power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mx
+
   - if:
       properties:
         compatible:
-- 
2.43.0

