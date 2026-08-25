Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E60389105
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787634527; cv=none; b=tsknascjfx4u5AFGiCoikEIswUTwmHVR0V5yGBm8W2ftuQ6CtthY7dfBF8EpphKka1pQ9SunKKdhzFBiBw1YITzIz3kYwo8XYiVxVNlV5Ki2lDraRuUi/oEFp6LAaIN8mLDbtkBTy340pcBLKASf1NkZ0r7voEOvKxAARwk48Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787634527; c=relaxed/simple;
	bh=j9GCy5pRGl/uns+WL0RTOovCU2uQImMf1lq+Ag4xpSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7STHCU97hTUCn+HQp7XQDPZeVvVIWwjI1k4uBuoSMY/07Lo9TgVeHdDN3docmrbxEtBJBWP0B7NAUuZcwqp3LTTkVJA4xzHlrnrCnf6CHH6oUL7Arhn8tcrcF+4D73KSFdKzJhZHnVfEQEEc85M9eh5wkYn4vmCY3WP7III/vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZT0GMHre; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=esJDfCa9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZT0GMHre";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="esJDfCa9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P4Lp9c3987915
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrKc2bVD8GE4ERXNiuSEUM3//V7Y7fiU4nzBcMeO0Jw=; b=ZT0GMHreeoni+Gr/
	IPlswrBvNqZMCrnBXDmHlJFit53D6bWY3Fimwf8+8JGksCRintS8YHpFQFoIkGRu
	EOpoOl0DCekWHdY3cp9s0jcaAmhOofxx3jKxVXoTJvO/3H73vFk9G77IxSBq9dOi
	vQnRSo9KDDrBS8JygAA5ZznCgTSy7EyyXQjIw+Y7AToyP64OylG68Brj2ckLUV+z
	WwwFhDB1MzYmHO1hldwPj5cx2ze9Wu/Jt/2SchxBQOJymkLBsX7YHCjyUi8pIXPu
	Ao4WQ2528/+zLEF5mNNT+I6nkO8801Bz9Op3SPPJ72usJcdCj2/ch0HZNwwGAgdP
	yM+VIA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93xxr456-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:08:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so5738497a91.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 22:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787634525; x=1788239325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrKc2bVD8GE4ERXNiuSEUM3//V7Y7fiU4nzBcMeO0Jw=;
        b=esJDfCa9V4qbLwwMrSch8IpJFJPIWS3wY0YcPIgJCu5kub8oZTuU5MqnpkgCXURVla
         h+tkbMEurZLC9LyWSrPcK+FA1TY+JYlrU6vWp4xEc1Yp02PRmoLTRL/ZFjlKwSl897ta
         zs5TYZwuQaVrrgmqcQk8qWwFhwSNwYHQuNQV27PEiPAuvQqH6LjU7o+mV/mR5KXxfblw
         6EF/D6mlMbTxAm8v6qO+MdkZaJ7KkPWrYGwBuG7/XXOnv2YY44HEnbftJgoCiooCg0XJ
         3WeHFxiREnM6ECMxkYh/++pWamXWja0xQr9eHpNMMfQETByFFg7WHDcs60AQY+mgbadu
         rCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787634525; x=1788239325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrKc2bVD8GE4ERXNiuSEUM3//V7Y7fiU4nzBcMeO0Jw=;
        b=oLbH2zKAF+980DUa4rgcBOpcb5y9CX7j6DNIUJtT0eBcXP6qqdvVrjR5wQVUXVIJdX
         XmyDAtx85nyRycKIKw1y/5UJxdGzItG/22Kqclw7RdzR1Jnf2PRofFmXJTJ354lRxSAk
         rEl6Vs/XBuhm2sBNfCTKBy5fdc2llPiBWsBwcUroDWCEgNrtf0C3sFwGp07Bkozs9FHk
         NsgSKIjxeSYASwsGpw3+geSDowWvfdAisZQHdGxcFeCJSHYe7zuKTx2z8AQPg0Ss0vDF
         ZMDCebN7ZOqNuX8m7sl2XSQNcYlGskdyZTkTbY0v+XDZJd1eU72pjNtGTVu9DUttw1ZI
         62UQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+/qurqzbJV2GbMWTbHWNDwsVf83PyMm56S2glyx6sDOquI6L66ajcSWbQdr9/UxU6JXAWgSOdspeL@vger.kernel.org
X-Gm-Message-State: AFuF++kE4RUhRW0zOP5efFIfuZxwHVmksfAw9VImhYbbk2dju4cihera
	+q4a4nyVCV8xlyq5tKElDCRcmqvPHNr6YBzfsRsogzGWtjNxCsTi4y1cAiSWPzRcmIUJxdPDSYl
	N193QJTE0kWRI69KUhtG3XmQJY7LR48aj6HtQaYDQSFVkb8nlRTTloFtaRlQL98u6
X-Gm-Gg: AR+sD13dzQCtrsGuY6qDw0xM0J9LA0M/kzwHyztFNK7INOy3Pt35I2MDcbrHzlXg6PS
	fB0PI+Zu5ppfrBX+ZUYLvM0V23W49poi7J9KT58lkfzil8EzEOhB3mCxwNX11z7NlorpmOTaTAO
	El1idMP6f7HxlBLMxyrf/4Oh2nAVXw7+HR41YJni8bpU+jqArgYeGUh/gPYrJWhAY2JfRlBvgUQ
	AwWA2Mgd4BtIwqGNEjNHU4obGFNoMQrxgwv7S4lu+N8CWRop5YZpisV94Qs2m8uKOT1Y3j0751b
	kO9KeuqVMRd3Dpm5EqDFEQOenPaC4A+eGL9CT1s0L5UDe7jd6vyXiSmcfNoVzjotlTjG436y5Z4
	eM3ZFD4TUOVV5T2t2JNXC7YerRUMUVvBxIjgzH3M9oWNOj57bk3w9KAqVISe2DlKVYu7JnX3+Yr
	mQBcPTiC2cmkIPyvABdtee4JcFLYjs2Q==
X-Received: by 2002:a17:90b:5867:b0:395:4de4:92c8 with SMTP id 98e67ed59e1d1-395df4dcdbcmr48361147a91.15.1787634524682;
        Mon, 24 Aug 2026 22:08:44 -0700 (PDT)
X-Received: by 2002:a17:90b:5867:b0:395:4de4:92c8 with SMTP id 98e67ed59e1d1-395df4dcdbcmr48361061a91.15.1787634524239;
        Mon, 24 Aug 2026 22:08:44 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860ec7f7sm32335970c88.6.2026.08.24.22.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 22:08:43 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:38:32 +0530
Subject: [PATCH 1/2] dt-bindings: usb: qcom,snps-dwc3: Add IPQ9650
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ctrl-v1-1-609e2291814d@oss.qualcomm.com>
References: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
In-Reply-To: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA0MSBTYWx0ZWRfX9diufoiA2nU9
 NYDTElDsr89htsWsCcsICwjhEtCFIeCjr+AVMArnbi2EC1qkEw5tG0Wl3rl3xX8+xoNnFROwGHF
 p4ILb1/0S/bA+ciktoAwI0PSzxxM3Ik=
X-Authority-Analysis: v=2.4 cv=EOg2FVZC c=1 sm=1 tr=0 ts=6a8d235d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VKQxD5uzQ55vUxsvsp4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 5hfmCXh_zmIEZ_ZJckbLhz1RVXXgUcNd
X-Proofpoint-ORIG-GUID: 5hfmCXh_zmIEZ_ZJckbLhz1RVXXgUcNd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA0MSBTYWx0ZWRfX2hg+OqCtpAe7
 4ascL0JAgSEKjLqXzLHymG9Q5IMdj6xY6oERflz2gwpQo4hB+7xGQerI8PHJA1TPfBua/yPUzAn
 eh4cqMuNaSZ7vvocDFgqfa5HZw5oNo8IV3Y5MUDrNx5udSYlYtVyWaUYo1/tZfcGsNiJSU6AQly
 +x2cYzRFDMEnKBNFD5C9IcWCcoFHKgKLFjFYWXItVtjSWjyjiAcg3p8+2BdDSPmODgKd3rHMtca
 lD53TB5bWE57eN0NIGvrfakLR7sEum8FELBYkHjPFgdsdR9LqJPUqJu7yB1W0wSzFzjSLtXdfn7
 B673jss34WYR1vJSgMiSJ68tGLd+FOhpRrjC2ScdiG3TcKQAWJWvsH67F5eEdEwDuaHxQk1d5Um
 hS/J++oc7M46CuJ9TBrF07XKJbdL/IqGiWUpAoYiUphoWGCZ62i26RrLNzcdAe5r5iofBw7vIHY
 WyxLekJVOvv3YT6z1XQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250041

Add the qcom,ipq9650-dwc3 compatible for the two DWC3 USB controllers found
on IPQ9650, using qcom,snps-dwc3 as the fallback compatible.

One controller is connected to a High-Speed PHY, while the other is
connected to both High-Speed and SuperSpeed PHYs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index ea60f7220afe..603d509a6ba1 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -36,6 +36,7 @@ properties:
           - qcom,ipq8064-dwc3
           - qcom,ipq8074-dwc3
           - qcom,ipq9574-dwc3
+          - qcom,ipq9650-dwc3
           - qcom,kaanapali-dwc3
           - qcom,maili-dwc3
           - qcom,milos-dwc3
@@ -387,6 +388,26 @@ allOf:
             - const: mock_utmi
             - const: xo
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq9650-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clock-names:
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+            - const: ref_clk
+
   - if:
       properties:
         compatible:
@@ -506,6 +527,7 @@ allOf:
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
+              - qcom,ipq9650-dwc3
     then:
       properties:
         interrupts:

-- 
2.34.1

