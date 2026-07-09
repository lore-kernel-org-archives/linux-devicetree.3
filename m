Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D4E407583
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587180; cv=none; b=K3CkwTV4uCFORwnyAuExgK95Gh+DetgHMPqUT95SFNR2RlhzZtNUzRutqyRnlFLp/Yx1EnnsdmRPqLuDSR8N5BEOvMwkl0vIX/4NnQ1z/Z6EjYj/vaTPg74FuNb77JDo1JJ273m60sebuU5gKgcyOcifhRtg4Aj0HWXw5jDZg+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587180; c=relaxed/simple;
	bh=uBXqfc4mbtwTmOdfZ2rYPKZ6TJPThoipKevya/9xmEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jn9XpLJzc6zgKI0XY5wT5gGaJiulxAOH6G/WXJnH6EVZA2wFBJ20fMVGlc/AruYNFW79A9qmtfDcMeUkKb3fW3qj8zTehS0OGQJ/5Q0a8PWD/WhkgHJWa9BUYDLkEliMkVL/s8xzJIHxQq3Ou1CUwxN7Gv6Af5lRBFQpZ6VlkIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Es8xX8DG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZobNzBQP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Es8xX8DG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZobNzBQP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66961BdH892252
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 08:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q7C3LES9FKlhz1br8iIOlDOOSpebq/xu1aRezenbPuY=; b=Es8xX8DGbSdw82bC
	cVPQq8CvFgYjvE3JtCRMqRxkSB7RuxScWKd69Z5cwSJ+kjyj3DUJetbfL4b8r0Uc
	1lsWeHISs4gDBFKWftZ1gBG+x7+nxX9GeMTF1QvcOlIxlyiIrCMDCo63Vx4vQjNX
	2R98Zp1uA9pN0oEigFc9TAO7FKD9q+d1Jg64erl5iESBGI8UP01aOWsi3E35ydCZ
	RD5orcEiE+rSTIvJrl5Z9aq2rsUov+NcnmEbRs60pHNqz5bsInIv6ugStqWdISLY
	B2wIuNWBF6H+uASyCDmPHYlSzC1E/hQr7gjpeCfa24E8kO4O/KlYvNCQAB8AeqCP
	/Wn1ng==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvtqny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:52:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38869800848so1488655a91.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587175; x=1784191975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7C3LES9FKlhz1br8iIOlDOOSpebq/xu1aRezenbPuY=;
        b=ZobNzBQP/nc9Mva+FSWR77LtKM1wjJHH+5yZpZ3fIhHb+VNEoaceo+PoWOucRUFP75
         PNbVK6mfEHIQPihWWuEkZVppVhnPh6HT6P7NTyamO12Ylm187wrlFTcUGpCpaQEPoALf
         zM2S3iIM3AS4SWLr9Ol7BcaLJeg3hgtcj16zEjIkOx54HqT3eLSINmjrOfm8IHQmEw4A
         xTBtOiZE1u7GCH0xGlNyquFXOvlrvhrm/ICShsdbJTBvp6Gu4w2/6VBgD3frbhjBYgj5
         ujeMHdvUy6S8cWKy1Zht4NNxN+PCgBK/IEwFTjYMlamvqGtMjXs7FUWnOcu0KZ6v109t
         sXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587175; x=1784191975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q7C3LES9FKlhz1br8iIOlDOOSpebq/xu1aRezenbPuY=;
        b=gUAeojeADEwy5KwzTgCv0wALzZhVUsbQXpweskoFzoh1gOCK6DKNKNfVZ75SZOHawh
         lmrSPYrf57pUG/cjN1e0ncn+xoFJByOUtcNOyPOxSOrohqcgQRroHokUMKKsuTNpq3iP
         lZKVpKdGu5SPTYu8/btVc8kwMMBTPmPFmjvdUYAOleCDLPPZlLKTHpVU22d7Pdfu018X
         aGFfbB9lr5wq+1GzGNUjQF6/zsXMR8i/q5d0YhZkTxusMw9iJ1WqdF9tPu5PpjzRDOz1
         EY/ognUIJDyBZg5XDm47IDpJ0awJm1Ue+xKaiFAePoGCuTaC0H31iLb6qe5oc+UbgiZy
         CARA==
X-Forwarded-Encrypted: i=1; AHgh+RrZNgWlnOFJwgPv7JaLM/Tu1fTPa2F5RGd9inABcCsZ5mNyCrLIUovoeeQGLRqfUwahMkTMlKZ7++td@vger.kernel.org
X-Gm-Message-State: AOJu0YyUHKtww7La9mdnxQKaDetaMpbmw/eZaCfHNsusvfz8LMgvVzcM
	q5+vNDxbbKTcshLCVagg9Y38rFyLfu1sI0swGhcxAsO4OZIeUlOzSrqL3ccgHRaXfAaJJIpwu0K
	LU4tNj6YuAoXlaqBKKJ0/BV6Zi7QbdMxG+79qa9eKpK4trAAP2dvfDBjleH4XcE+W
X-Gm-Gg: AfdE7ckAn+H3cZYhryQ4OmNZdPu8h/v3HAklR24QkwJ51Jk+6R/aW41/13NinozHMhG
	/3hkEjpQikPUcV7OpBikgvoj1PMIsmSQzAoHLdIu480EJZQ0arne3Mfkr2/18+thiYLLDplWN64
	y7UEgvCD6tkTMOxIy8ZC5Qr9eT33GY/kS2AdWZVB3wvgykOG0fu7DV3j7/WJewR/kbtmILTMBoa
	oB2jmw9J9XQcbvKKO7CindAoy1Qx/ABNt89hcSpUzNoAgDRuMjBbRrMZte15Cb/1A+7lCwYioH1
	mD0OiujejZQZEMBoga7HCJ5F0u2zTzCWSExkeKHZV0z4EoTvPCCOEYmD41ZD1fiL0Ujm/Bxpi62
	Z0XQjRI+bScLLcfETxpiZVDg0dra7tsmRdoLHaB2ZYSWKPF11VuYa6KUCPHJ03d1NWLAIoNk3/Q
	PLjeZs
X-Received: by 2002:a17:90b:582d:b0:387:e0bb:57f3 with SMTP id 98e67ed59e1d1-38941bce507mr6673935a91.36.1783587174673;
        Thu, 09 Jul 2026 01:52:54 -0700 (PDT)
X-Received: by 2002:a17:90b:582d:b0:387:e0bb:57f3 with SMTP id 98e67ed59e1d1-38941bce507mr6673906a91.36.1783587174229;
        Thu, 09 Jul 2026 01:52:54 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5574c36dsm822771a91.6.2026.07.09.01.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:52:53 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 14:22:36 +0530
Subject: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
References: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
In-Reply-To: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783587165; l=1037;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=uBXqfc4mbtwTmOdfZ2rYPKZ6TJPThoipKevya/9xmEU=;
 b=R+gYRQbVGrxaHiTRKfJDYrz0XjNuxyCDbx4jW1Lf4CNygeQphMdL7BcC8MG6qG7tH1zGX5Rnu
 Uh0S/vHgvnBD6Uj7HOa/Whj9Ty3kRDnzflTxYBv3a7/IfCgbA2JN7t1
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4NCBTYWx0ZWRfX5+k0GrYQEeP1
 B7VcJumn/YgJa2cYzmkdTz+6/bFoVdCENlcmbaMz7+JuPEUdvfxd6pqUzFUXSvmvpKN4qpFpfPz
 j/dllZTw8CWwu8BOFHcjlq+wZbL1l5E=
X-Proofpoint-GUID: wcpW70CiwhP1nZ8xdWfeXLG4en1_oSFJ
X-Proofpoint-ORIG-GUID: wcpW70CiwhP1nZ8xdWfeXLG4en1_oSFJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4NCBTYWx0ZWRfX+8xJDbmgj/LI
 shFAkr5nXOUvLo6HHuncAhpSQDAsk4957rvsm/R0fL7aDpK+EIypZn9G/DP/9dbt2AsPfoO3fgJ
 17YGfzHO1d/kFTXQvn8H/ENZuNOmCj9SpUe7igzs0cB6VDcXBaOEauBuvqPkyBMGosc5sUFA5Ag
 Y+eU0dZjDDPSLiMKK2S2p4lWgkKJgT+1d+RI9J5MF4d+CfJiopu7J/AHMLez60dtaYMnHV0P3pU
 nBSaSerjiNw8QYD+yYJoVhAS3ii07D6KuTUf7UzClL3voBk2vC4l/MrYxjcCwpjgjMKuuwcO8Zc
 TDCE5GudNWKBTOtB38/tVsgnIt8jvTe2uodI1FKGs3LxE54O6gaGlz0tSu8fHVPHIXlqPo1yoUC
 wSx6eUBOPXeozsgY7vFP9tgvA2UnfsYW8g/Jybv6sH+JDERZqdflQDr+3+Pwbe7t984CFuvEpV0
 13m0hbo9+s5OAtPWCyw==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4f6167 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Q2m6lpKfM9RfMUJwhvMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090084

Add property "qcom,has-eusb2-phy" to indicate whether the SoC has eUSB2 phy
or not. This is used to modify dp/dm interrupts during host mode suspend.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8201656b41ed..0c6a839be82f 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -152,6 +152,13 @@ properties:
       HS/FS/LS modes are supported.
     type: boolean
 
+  qcom,has-eusb2-phy:
+    description:
+      If present, it indicates that the controller is working with eUSB2
+      phy. This property is used to modify dp/dm interrupt configurations
+      while entering suspend.
+    type: boolean
+
   wakeup-source: true
 
 required:

-- 
2.34.1

