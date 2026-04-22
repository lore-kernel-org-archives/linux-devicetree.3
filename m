Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98E2399013
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 17:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776879831; cv=none; b=gEjngCrIFPThLIrck5sxrjiqzvbN3+oA34Q3I7o5Z0lipb132qHmbi65A0i8i7Ef6UypXA7n8DN1Ii4k1a1gcbyimMYCpM1JXP26Z0RfQd26PqSGkxjQoUAOav2Rcnvea7EThLKbOsOwVREiFUaIMXI6/uKqY4gSveoC15voZGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776879831; c=relaxed/simple;
	bh=dm5uSfZjDOFedpZSNeguOS6u06pJ3ye7oJgRqKLiuCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f45R7h0yfI3me15qsHwAzNM7Z6n5OqbFaTktZn6wdVxzxHEHxOo904DSgZffmryX5QlW5ulAy468m3OwaNZMbf5rUz90SNDV9VWCyd7TC38yr66ZWrtqmGGha5BWcV7txhmC/cTjbuPylv1fleDd5gVQwTSlGNInhTBWDRtRW7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TU01v89I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGiY2FSN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TU01v89I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGiY2FSN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFLvkx664102
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 17:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Fwn1gPn1dWg
	exJELw0pYUIt7mZC6V4jRPi84i0yHT1w=; b=TU01v89IQIabdiSY5iA1uoB9Czk
	tZs1gHp7BPuNH27VG1i95qUUPrmNi5byDdwajUk7Y7gX0Y/DWC9XtGFlQ2w8B6l9
	9FAPzABojzxLEGVACSfNPAY3lNRLQM717cKNkAJS111fYH3Dj/kH/nxJle0rcwoA
	FJV3xP4E7oy65WdxhkCCwEr8CbOf2x6ae58LZoNk+t96T/iCIxmIweZrDHUxffFG
	WyC0MU5UucslyL+EqconSBCeBLoIOxK3rWhTIXIHWMxJW9r/IXNl0EQqUfAXu+uZ
	IpA/azVOeqZ9yc8R0XIK9R5anVm/A1oSs7kcpRjcZXPqgzv6aQXRPye3MqQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgsw2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 17:43:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fbc70cfbdso43689471cf.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776879828; x=1777484628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fwn1gPn1dWgexJELw0pYUIt7mZC6V4jRPi84i0yHT1w=;
        b=XGiY2FSNuIC6E8H0rmVyEL9VkCaAyx0jExDFHT2sKP1WGp4S2P87HEwDNqUEaiGgbz
         z+8Kezcm7oC8j0P0KhHg8CWJyM15jHST0J3W61hXXtEB2bQZ/fNpLxtPxBnD2LxYGtmF
         oVQjwFKO076KPCsBexTQ3JjFQ53jjrvk+/DVDYzXrahl6EMPW7bFpx/XM7lZVzcKvDoZ
         bLnU7GFid9PlUHmuNzwTOSCwcqtULRkC1kyH1iCxp1RKsSr5AGp4kW8nGG1yP+NJBiLF
         uqequShoi2LfzdQtnp8Zn1pNilU/hT5CoMCUu4oquEolkKZDAcNFqH2RTIkLi27ztAWb
         o7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776879828; x=1777484628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fwn1gPn1dWgexJELw0pYUIt7mZC6V4jRPi84i0yHT1w=;
        b=HWqtopkDDW0htfAP0KPBi8QPbkcEp0KrLiLhFp2Zholtp56PHm4h1SlPMpx99htRPE
         wkFkyd5uyOR5j4MLqqjg3Acm7hFnmfLGeZjzUvG+lcMNQn/bg9j0O0dZ/m/wXSXwu/yx
         QwF55ATL7KdMHVGNYi2W8RpORXTeh/bP9P4HFs80xgQBgiB2JYIk/xTGtOnJ8MIukFWh
         b6CzwiypmB+ZPxGU2PfKzaKI3UnvWCxpxB1JENRzeX9qwt2jfaWNbHUhdgR8nshcRYGx
         XcmAo97EsQisGUFe394zjUaOPX6B1VJUb2BTxjwOCf4rdODBRSXY73Vk2RzsVeRZcVBs
         fIjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Qh/UZrUvW1tiBC6VHvXYVFP7lvnzqbe7e5ymsozxg6AXbRaL7Mz97OIYEYsqJtcq0HSq7LG8v+Eu2@vger.kernel.org
X-Gm-Message-State: AOJu0YxtA6tCaBoZ/JzE7OO498yiX3gFzBxFgnsC7kKJJlaIPVpD30jM
	6ukwol5eGciV3Xb8V73k89BjvOfS/ZmrOAiDrH/I0nZfA5rAYCPlMj27nB4HS+W1yIwIaB/cgiK
	S4kf0HRmzgKZ8ufDT8uw0O05G1cVb6MI03Si0drDHA1UJFx1kG6uq4mF7/UopMF5b
X-Gm-Gg: AeBDieuo/AOiq6mRze9btVJfnm+VDgOemRzo0AcyZLC3oIS2einxXGotm87Jmael+CV
	nfi5ebmM80jc7k7V+RW8kXGBbxFGI3x8UkbSIGZFN2FTQ6LY3Lxz+jFNWRX/CPUMrrURAr14nzW
	kPepTBx1OedFSwncavAluKlixMoXospoKqS/rfQVIPvd5W0bdG8t++kqlZFng3WjcU09Dwl0nEr
	lDxWOl9vAYf9qpFWjLj3de49NIATsRU1dZp1GEuesHWZkV0Os7VOUxcGD3N8iOmfynQFzYpsfNH
	DaVUF072/6+Uqy+qAZxJDsFgPVnh7SGxcBqz68Jiy7QoYbYLRSUJYbshl6LrIhqr17cQBf1z7al
	HtGnMx5/qmDSp8L8BDOS7RNIxxpQdvH/jfBX0yUtMR5aUZLDJBTSlmPRarNCl
X-Received: by 2002:ac8:7f4e:0:b0:50f:9c32:509d with SMTP id d75a77b69052e-50f9c3258b7mr167401891cf.60.1776879827694;
        Wed, 22 Apr 2026 10:43:47 -0700 (PDT)
X-Received: by 2002:ac8:7f4e:0:b0:50f:9c32:509d with SMTP id d75a77b69052e-50f9c3258b7mr167401231cf.60.1776879827142;
        Wed, 22 Apr 2026 10:43:47 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7a051dsm142511965e9.18.2026.04.22.10.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 10:43:46 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, daniel.lezcano@kernel.org
Cc: gaurav.kohli@oss.qualcomm.com, Zhang Rui <rui.zhang@intel.com>,
        Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH v2 12/12] dt-bindings: thermal: cooling-devices: Update support for 3 cells cooling device
Date: Wed, 22 Apr 2026 19:43:01 +0200
Message-ID: <20260422174305.2899095-13-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422174305.2899095-1-daniel.lezcano@oss.qualcomm.com>
References: <20260422174305.2899095-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UN75KMsV_aOvWYi63rMMwWrvboJwX5MW
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e908d4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=WTFSsL86A86x8GNmHn4A:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: UN75KMsV_aOvWYi63rMMwWrvboJwX5MW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3MSBTYWx0ZWRfX8/4uwnz97kPs
 Nw92kJzcydhlP4m5ky4p9CAxVliHWRcJws1XnDHERHE4YjGfiufRM8ZwU6/zk8WbD321SCtN37Z
 TGW92+rSoxH72eHBWbtL2+3n0zVI2Ef8VOGc0UoJw4lmNj2K7zsfBmFvNOVADGxViGkaJN766/K
 IL27tWCRnlCtu1gHsrlAEjZ5qLWsgNbsyxWGNpePjweyLk0tsQKxnhdIndYL5zeVzOIRooGsEUI
 cLMANF36sJsRabl9ej+ZPVhwz3qED/q3jo1jI9bKGyQn5pyapFiN4iX/IIOolcr/JiULMe3ORHP
 11ZHmmUgDqSQsOLzjRz7QBmFTNV/vI39n2HAkyET3JZRLcp6q8Gt7FvYmcdNM8YgtV8SJFERnIR
 N1HabjE1ihFkR8/zyg6sQGxVG2bKT+bKHDJFI8rv0ovrXR7GUkiq/y6IpI/DDpNccOsZg6uo2ep
 WRkVssZolhxnzSTBHYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220171

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Extend the thermal cooling device binding to support a 3 cells specifier
along with the 2 cells format.

Update #cooling-cells property to enum to support both 2 and 3 arguments.

Fix pwm-fan.yaml to restrict the number of cells to 'const: 2'

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/hwmon/pwm-fan.yaml      | 3 ++-
 .../bindings/thermal/thermal-cooling-devices.yaml         | 8 ++++++--
 .../devicetree/bindings/thermal/thermal-zones.yaml        | 3 ++-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
index a84cc3a4cfdc..6a24851fd80d 100644
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
@@ -63,7 +63,8 @@ properties:
     description: The PWM that is used to control the fan.
     maxItems: 1
 
-  "#cooling-cells": true
+  "#cooling-cells":
+    const: 2
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml b/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
index b9022f1613d8..28f5818f1e60 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
@@ -44,10 +44,14 @@ select: true
 properties:
   "#cooling-cells":
     description:
-      Must be 2, in order to specify minimum and maximum cooling state used in
+      Must be 2 or 3. If 2, specifies minimum and maximum cooling state used in
       the cooling-maps reference. The first cell is the minimum cooling state
       and the second cell is the maximum cooling state requested.
-    const: 2
+      If 3, the first cell specifies the thermal mitigation device specifier
+      index for devices that support multiple thermal mitigation mechanisms.
+      The two other cells are respectively the minimum cooling state and the
+      maximum cooling state.
+    enum: [2, 3]
 
 additionalProperties: true
 
diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
index 0de0a9757ccc..1261ba0e802e 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
@@ -214,7 +214,8 @@ patternProperties:
                   device. Using the THERMAL_NO_LIMIT (-1UL) constant in the
                   cooling-device phandle limit specifier lets the framework
                   use the minimum and maximum cooling state for that cooling
-                  device automatically.
+                  device automatically. If three arguments are specified,
+                  the first argument is the cooling device specifier.
 
               contribution:
                 $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.43.0

