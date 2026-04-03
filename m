Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF26B38229D
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 10:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210701; cv=none; b=uWoSb2xPV3Ld7QlhJvy3pAioormo5kkeos3+F40w2Y+oBbfh4B9wFY5izmSA7x7QDDBb7GrdEvh2kZ9aX3uHorPT2ewJNUPY091QE8YIOOzXCgZWo/Os7LMcmNAVCS+j4nqf87kAhU8hBp8MxyFDsjsoAZ4MADxMphRCJ/BahUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210701; c=relaxed/simple;
	bh=efXyJFthK1RwO1gkoi5S7ZO/n2WE7wmVX+aDcmjL8sM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kULxUHDwTHA0M8cbP/lbRoN2afWlACcDncC3uHmBQkBDPp/uka4mNghpn3jWX9Ino0Ma/sTsB0WKVHIrYd4AK5FhdsPR1W3SbbZiqSFwmO1dYNzIuyiID5b+HaT6DFopn1AT7t37kZQe+bzXxeOlOC2YpFoXmFMIXH4l/2aj4kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nAQunOtI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQOHqqoB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAQunOtI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQOHqqoB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63342Ot43780256
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 10:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1REY2wsCGV3
	HSNoEULDW4QCYFPv7fEIyOOLtPEnxuVA=; b=nAQunOtIERw+X43DYujHFX+kqFn
	VPiVDa3LL9DF889C7g6mghcbtnzgosIG0tKzvJ04Zcq0USi1AOD2XcVXHBPrQdfm
	bGRp7HTPp2yS1atkmyNO8LU8EIpwRMfq4MmrUnWq8GiKTxXxfJU7N2dMLaj+Qq+S
	iqKwUUqX3q1Qr0DPwepPP1gKgnz7+Ht4aiWGUlF1LKGpciOzi66AVRECxnIEncCx
	P/lID1PXEL3yzBf+/1HUBivFYuGlwCc9gl9n7Yx/k1PpNpdfKRzO2mi2GhBzhExf
	l5CskmzW9WkNdpbNr5D6BFbOkviJLLfleBlwZV8qVfhq/h29uG8dPEozJXg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da663h1sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 10:04:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so1948986b3a.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 03:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775210694; x=1775815494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1REY2wsCGV3HSNoEULDW4QCYFPv7fEIyOOLtPEnxuVA=;
        b=IQOHqqoBTmCiLvEellFBSGMlKV+gETbBkZ4xVkvKofPC1AuFXCavgWdSLSmB84a5C2
         owGTw3w+SIPaDl6rzm6SjlS4LsKGix/P4NC5UfyCH+VyNIr7MkFcyReT4XJV9fD9soFu
         LH07oX9mp28TA4nqPvGb1TjZtx+nY3HglWY7IZlK1g71M3pn/O5uKs9s75fydcRaW3EU
         sEoP3yE+XLoTfEyS0M6E2OnPzIyEK/JHSwxljUy88CyWbwq4DTmQH1+tLfh1fpi16H3i
         4fON32JRJoIu+nn8SChaUfkXz/AvYsuNSE2PKirotkOQTZbqT6zqaR7cPsDtkz+H/zC7
         c34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775210694; x=1775815494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1REY2wsCGV3HSNoEULDW4QCYFPv7fEIyOOLtPEnxuVA=;
        b=bQbzos+gkFj9ilsNuzzueEmDu1Vok4NjkR97LZEnTYotmx5HTITxGqzzl22yFy1Ze5
         hAo6qSO0E3wK99U4UFMAIClLnlUhdamR2Ng8bqxaZs/pg4b0DTu4eDf1GAcEH2XsZNS1
         UpvCZwLs+RSO8xcLrgkcCBEYfc7x6wS7j1Dnam1liZO9Z95YCdWgmeyfYmfZHdnIytWo
         tGE0ow6j+e8bT/ML9fer5j/0YlnZBriD3rWlHqJCJWQdBnduEhUT5FIAS2QtUjbOEqXi
         ksmBwriaCIEFX1bRIEsmBm4kehmKYLs3RYCyXxak7pQX7wxTI+pCLPX9na8rSq6BoDy/
         XRDw==
X-Forwarded-Encrypted: i=1; AJvYcCWwk+WTSC1cQa7wm891lsgkdfFBM5nDIRgI0kQKuyLBFOg6uP4tOBWkTMInjjWEMWT8i0JnMYFpE4RW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8A1KwCFLV+Kw9yLuNyhqBW3y5L1nRYZaufZLyckUEq785GvIC
	jvvdNjHRVl/AntQ1YJHGxZa1nLJwj2wzPOX+hyIMeDPsgL/mKUHf8yNOzxj5VhQOEgYlxcBHA65
	0dz5augQMN4aMv5c4M6vMTUQK2uZJ8gV1FvR+F2w8xyMMZwDgvxpZc6HD6HzO6gap
X-Gm-Gg: AeBDiesIg9m7aN7u11GeewKhgjfLjtRYGfICl+9RPLEcg/1YVgVmiTMMXLRzTIXbHNK
	29GH5z1NPmz2EMicqAFmVzeXLbM5TqOgXZ7KGsVhyIxWYbbEqhAmKs8v4XNDC+vsr1aJod6THmy
	0RdoKZgBVJ3mgBCS48k2hbvC4bTDG9z6A+8JEZ8KlsQQVmGwFoO1sC0LorGMnUxX/3C94Ys0zs9
	PnSG+8u/656n+LpNykxBd22gp88TkAxVzPkbFI0TdnUPqhkKnVzT0WqiUqJWXD3I6lg3om3NLe0
	/MwZU9s1RVpEwmF5xRB6OPLwUt0O0Ati2SnKOramUSmgBybMTKVm/w4TkQj5PH0RVceZsmHCsYF
	4qwkFvKnwN2TN/SxJDpMRYn+rZ/TNsDU9gZBM4hGiR9BujlgE1PN2Jxo=
X-Received: by 2002:a05:6a00:1d8c:b0:82a:649d:95e7 with SMTP id d2e1a72fcca58-82d0dbe24a2mr1787182b3a.18.1775210693919;
        Fri, 03 Apr 2026 03:04:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d8c:b0:82a:649d:95e7 with SMTP id d2e1a72fcca58-82d0dbe24a2mr1787167b3a.18.1775210693441;
        Fri, 03 Apr 2026 03:04:53 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm5012644b3a.23.2026.04.03.03.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 03:04:52 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexey Charkov <alchark@flipper.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v7 1/2] dt-bindings: usb: Add Genesys Logic GL3590 hub
Date: Fri,  3 Apr 2026 15:34:34 +0530
Message-Id: <20260403100435.3477729-2-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260403100435.3477729-1-swati.agarwal@oss.qualcomm.com>
References: <20260403100435.3477729-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA4OCBTYWx0ZWRfXw1TiEFQzdIpK
 5kUWpamkXNLcw/MBmUymsKtCTZvEiThhg1aaGThfVpROr184C10sp7Mv9Ep/48zih8aZi/C1jgv
 aesaj/vYKo/rWy/47atW0ag6Y9QMKBPPi23arLE37hYCPoxBW1R7hUmnXkoMOaDoAwK1UaPGCsb
 bm4sbZnXaKwZSnadbpoVFop5evuSUhgcwDhc5ikMQbpG6eQ5HSMYIBSirVDVxTiNG3fDIwwI0ba
 lCS49FBc0WbIg+Q2QKAB7oEP/tqKkQqGs/oXzToI4lFiozLXrudRhxCGC2xT4aLJDelQufQMomi
 wsDXQ9NgHEE02O5s4dTMnW8c049VgodhZLwsUInSaIUeIUbXjrIw3UfQSgEOy4Mv13U+S6RpeAs
 7bPwVD05TjFnLOHJC0TcE7uIqxHWAWeLTccLshTlhYduX8OZy+btfo/R3/suEnsxfIl1fMbFU1q
 ov9rjvI1hNpNZSNlbyg==
X-Proofpoint-GUID: WAGkH9pDcZL24zBK3Baq7OpaTD_Ck_mg
X-Proofpoint-ORIG-GUID: WAGkH9pDcZL24zBK3Baq7OpaTD_Ck_mg
X-Authority-Analysis: v=2.4 cv=Acu83nXG c=1 sm=1 tr=0 ts=69cf90c6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=1mrrX1IwxDsCUTwcy_oA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030088

Add the binding for the USB3.2 Genesys Logic GL3590 hub.
GL3590 hub requires 1.2V and 3.3V supplies for operation.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 .../bindings/usb/genesys,gl850g.yaml           | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index 9a94b2a74a1e..e8b8c03f87a0 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -15,6 +15,7 @@ properties:
       - usb5e3,608
       - usb5e3,610
       - usb5e3,620
+      - usb5e3,625
       - usb5e3,626
 
   reg: true
@@ -26,6 +27,10 @@ properties:
     description:
       The regulator that provides 3.3V or 5.0V core power to the hub.
 
+  vdd12-supply:
+    description:
+      The regulator that provides 1.2V power to the hub.
+
   peer-hub: true
 
   ports:
@@ -56,6 +61,7 @@ allOf:
       properties:
         peer-hub: false
         vdd-supply: false
+        vdd12-supply: false
 
   - if:
       properties:
@@ -68,6 +74,18 @@ allOf:
       properties:
         peer-hub: true
         vdd-supply: true
+        vdd12-supply: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - usb5e3,625
+    then:
+      properties:
+        peer-hub: true
+        vdd-supply: true
 
 unevaluatedProperties: false
 
-- 
2.34.1

