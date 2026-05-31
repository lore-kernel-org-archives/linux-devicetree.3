Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D696635DA42
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 11:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780225460; cv=none; b=UYsRHFJQ2bH5r3mrnGxHwvqEavunxOiXp5p21Kr8KyRHNFLvelCA0COEy5v5PU/bRyrSSb/6ODHvl46G71IEX33wBCQCtFwgE4VINuiaROyA4Ev49ar9dIEATSEbaiIzmM+LjJjzJHHMf//+ca5ACp22bwwKDdl58kK3TfFJeDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780225460; c=relaxed/simple;
	bh=5Mkr4K/u2u5UUJotc4Mi6j/DBZJZ/Re3Tlj+Tw1wQEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PKuL+4ajHWY293d3pw48xU6kfO3XDaIJxzwJ2ok1BJ33E431NRzIPBOBXeEsMrio8ovaXHdrt76fNg7FqZx4cFRK1YPvXrt73A5OLkJocdUxa+y1wTLwW5HGdMOyMraf3GHvOnCZnLunoAzlvHd7BgsGqqHtWyUiXZxI/p+4CDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nb4506Za; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gU0R8ICJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nb4506Za";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gU0R8ICJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64V5vgtu746796
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 11:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Wez/Z6LnIGPccg06YNJthmxUqLNKWUhYrW/
	JGzL7EqQ=; b=nb4506ZaiYW0ooKJgqpyah5XtkJe4/8eWAiwKYJ/WNKRIEzCb8C
	f7TuydCZW7Jg9kgZfeFF/QdUTj6CfTCfbrQtxkkbkGMIDRKXps4SMVtM2zDsatLU
	nlbAuZpRuY+Swsg/hpegrrlEV+/xiHw9m2C/jc7h1EqYUSWmGBkfXCB5gKWgFMv4
	dAGb8vP5BhrvJS161X8KZucFikhtMrWkUqU1jAU4aIE4kSFjTckphX1bJis86+rv
	CJBjCKV3RavmO+xcoLZEFYLtwtf5zS9z/8QTA1ztVAjFFEpHZyLHuHhhIHF/DXGC
	kZZzeU4Ysw08YxX3HZepuLMzWuBLaITOa5A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efn8pm0bf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 11:04:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517480bde1cso22710371cf.3
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 04:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780225457; x=1780830257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wez/Z6LnIGPccg06YNJthmxUqLNKWUhYrW/JGzL7EqQ=;
        b=gU0R8ICJ6/N6B7R63YjaLS8985FMqMUFXErzlgDdkLt+jD5/JyGauJaBPwEX1D2Dqt
         4NLpMxcdYtX/MTOHeYyFozqyO5YBOXD0/AO2AyNwRpjJ/e30zDcLaIK8porM1Fp/jm8q
         d+xrmYVaSrjrFMM2XaZTCn1VdNANb9P1JkUgYcdkF/r6HgDpoFWoDzRjOJR3kRAPY+v7
         neGBXZL1UhxPkP0XIfMERKqFujlvl9bMDLME4WZMRlLZx24i5d224JnfHfqSNBc9ZOPa
         CtN6u7/ipUNYZZ0FCTNnrnXKvMIGjpOMCCkqetxPPov85eOMggS7wJGlFNXT8oZcuXu+
         +93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780225457; x=1780830257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wez/Z6LnIGPccg06YNJthmxUqLNKWUhYrW/JGzL7EqQ=;
        b=a1GQPoVUgtH4AxahMJbCYOjqMvogFil5q0suChaHjorVpTvbqY4zIQEJz7gXELjHXY
         BO0MEaBc7KQtN38tIycSG1kpF9PxDyRdb+4oYG3uxoInKkp6M71TVPrGFXUkTofBmp70
         WCkyGAuFl90vZXnmERd3w+NOeEDoP2P7O7j0QJKUEHG19jutL1J0CykAR7azjycQcW2G
         QZlUiDTZEEqDWUcBzNxs/YVPw5V5Os+P0uFScQNTSzZErPbCiEhHIZ54Ip9fPdT+vZ0G
         UeEdvPW930lA5StcbrxndHs7fn6mWH2HbQcoyrNRY57SHLnZGdmvFNbuBd//VUkQWhJW
         weHg==
X-Forwarded-Encrypted: i=1; AFNElJ9rzqo7VCyW/HXrSBzBgqG4E11xfepGXP32ApMUXXbaXxV2PDMDc18QfY3RSjOCRkHgYpCp0LQN9VNV@vger.kernel.org
X-Gm-Message-State: AOJu0YwD7XmOniqEIhZcvQt+kAVHB+aLvAlexlJE6BNl6hwTZhlISnYU
	zXpke82+GFYituJl8BhFA8E+5OqpIJSoMNu+4vx00wmSSASsent1Hrru1h2RS9+YyBjqKRxqj9z
	G0ChvfnszdKkSBrg6GxyKK/FyC4ICLu8ZX+hCqs9pP1N7FYhnQ9CMJRO8giBCRcOF
X-Gm-Gg: Acq92OG/FsHkALBZe6vwhJL53lLdt6OdPuRbtQXQx+ijOkLkI1LJqZPYh9jO83fSGYg
	cxRH+yoMZJKC4nvnzGVG5orBcK3BewPRgwfO23HB8wbuXiCDkue1EHfou79ikpo/VucYsnj6LTf
	4U7w9ks3s3pv3yPfXp20HyUgHuHf8IHs3G4MTt56YFyGrn+dHw2ak4Z2bIci2oXIreqE1jjxL0A
	YZDNV/lH12NcxzdL6Ry5n6ASp2fE69E7kt4zSqjc3Dt+CxWkZpmeqWZZyNfkLmQHZHCVhMUa+cK
	mVR/doKLuzWOE4VEdGiBbgxZOrIJ0XCNBxnIJNpzSZ54wa5/ECHAoLVK0QXKPXOz6HeicD55Rt/
	B/BxXAzMqbZ6Ha1wjlw==
X-Received: by 2002:ac8:5781:0:b0:517:2a6b:d556 with SMTP id d75a77b69052e-5173a6e3f01mr98407491cf.7.1780225457060;
        Sun, 31 May 2026 04:04:17 -0700 (PDT)
X-Received: by 2002:ac8:5781:0:b0:517:2a6b:d556 with SMTP id d75a77b69052e-5173a6e3f01mr98406951cf.7.1780225456590;
        Sun, 31 May 2026 04:04:16 -0700 (PDT)
Received: from quoll ([185.12.129.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef3595ef4sm16512872f8f.37.2026.05.31.04.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 04:04:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: mfd: syscon: Disallow simple-bus with syscon
Date: Sun, 31 May 2026 13:04:05 +0200
Message-ID: <20260531110404.12768-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2496; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=5Mkr4K/u2u5UUJotc4Mi6j/DBZJZ/Re3Tlj+Tw1wQEY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqHBWkrZbXFM9sw9wRl8Q/Zp4ViIZrqqDkuh2bt
 2sXhLuXXLaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCahwVpAAKCRDBN2bmhouD
 164AEACMSkZI/uttseR9/33zhzZzyyZKEmFBGuWWBslSZTKRTUtDYuAYvbwy3KcWj5ph3NSBQRw
 JeZvUSAWIIaVlKSi1AzKd6BhkVTIqdWH1lZXkKTMNKuGo13IwfWB7a9dh8u2pETWo194LKKIgkb
 a8kMPG14GxowP75C43SHwnMS0+kZ4aGF7VUaGn3S8/ZRUZ2Wg0F/4MCSVLYGmrIWhclC7SaHM1R
 wVmhg0rgcZfyqxRWT6mWNYBGyb6ix7D1bxPSH2TIid3scKA3/cETC3tC55YyPJCGNRcJjBEb1VQ
 TdPNZH9jBPmZBfoZz1/XemrJ3AoOL8M8fKulJswxwic1Q7217BfFVuSzHUg0VjfqH1JRlaKWxsC
 aN93vILdOTEKhAd1uG6hnYX9ydjwjehuju3j1QJciJ0tO8Zq2kNOrfT/VUvaeoTdQ0ick/N5MAN
 IsDni6HCoHZuk8F3lcCjOvXO74DSXvtY5fvhOf+NDtspm04KIO+XN+e9StRO3R4iB1epw9+VNkT
 WiC3obwjl5CRLTAm+teskQpaAT11JOYtMekyl03fYSNFjaKNo/b3EfytXXMIJvOoENa/9cXNqx3
 CzUnV+KM6EukW90SPbNievYFoc1aNijPv5AQQN1KtSedq4Si2HPfp3PbXDWDIndK0jfzjKp2qkL bO6Mo04g2QFpOMA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eEgZccXC3-NuDESp5dpK0qySlAXNn8qU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDEyMiBTYWx0ZWRfX45KQMBL5oHaj
 xY16OR7SPad67BJSGHzWM/mjcYUG+nbfqQg6Pp6k3gZcWJ2p2yoVDP1xx7vFFDmpKPGG/1qsgPB
 QLs9R0UB+ymdU5ThBxC3ubJr3bJeOEJfhm2272V+gIff0rqljVFDfT08kO2snpnToWCrJPJFYy8
 1Bns8F6I9rQIbtgrb7uxO5aZRiajV9S6G+gysx5EXT7NAVjf9/5ZTStOw9zjWiMQvN5WF2mVF/3
 mz1Q20hOETqLv1YxHbp+6PKvC4hGsBQqJf4sD90/7hyIZYbRHP1wBVzXXNxZkZUvIk846aMkXS+
 UUUfZsoJVxstpWMFSj58eLFa7dvVF67LmROav264ORuAvOOq/mWgxpW/HZjcdZ3EP6njNjm93Ko
 hYgxAg7r8491dw2g5MVUQvhYh4KsOxnrdEccY/ljn990SYaeeB29rDelQ+5sDiE5yaA/Ukd3ye/
 cWgF9OEZzizv9vjS4Vg==
X-Authority-Analysis: v=2.4 cv=NvvhtcdJ c=1 sm=1 tr=0 ts=6a1c15b1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=3CdwnVXJlszSr5aekAfjag==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=YC08-fj938uaX1hd5_AA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: eEgZccXC3-NuDESp5dpK0qySlAXNn8qU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310122

"syscon" is a system controller with registers having their own
functions, thus not really a trivial MMIO simple bus.  "simple-bus" on
the other hand is just a bus on which multiple devices sit and the
"simple" means no functions are allowed here.

Combination of both "syscon" and "simple-bus" is abuse of DT for easier
instantiating of Linux device drivers so add a schema to disallow that.

Unfortunately there are a few old cases of that patterns, so add
exceptions:

1. "cznic,turris1x-cpld" and "img,pistachio-cr-periph" are already used
   in upstream DTS.

2. TI has several DTSI with a child of SCM device (e.g. "ti,am3-scm")
   using "syscon" and "simple-bus" but without a dedicated compatible
   documented anywhere.  Add new compatibles for such cases.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/mfd/syscon-common.yaml           | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon-common.yaml b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
index 602a511985cc..315357da146e 100644
--- a/Documentation/devicetree/bindings/mfd/syscon-common.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
@@ -63,8 +63,31 @@ allOf:
           contains:
             const: simple-bus
     then:
-      required:
-        - incorrect-usage-of-simple-bus-and-syscon
+      # simple-bus conflicts with syscon - if a device is a system controller
+      # with miscellaneous registers, then it has at least one dedicated
+      # function thus it is not a simple bus. Allow existing exceptions.
+      if:
+        properties:
+          compatible:
+            not:
+              contains:
+                # This list CANNOT grow
+                enum:
+                  - cznic,turris1x-cpld
+                  - img,pistachio-cr-periph
+                  - ti,am3352-scm-conf
+                  - ti,am4372-scm-conf
+                  - ti,dm814-scm-conf
+                  - ti,dm8168-scm-conf
+                  - ti,dra7-scm-conf
+                  - ti,omap2-scm-conf
+                  - ti,omap3-scm-conf
+                  - ti,omap4-sysc-padconf-global
+                  - ti,omap5-scm-conf
+                  - ti,omap5-scm-wkup-conf
+      then:
+        required:
+          - incorrect-usage-of-simple-bus-and-syscon
 
 additionalProperties: true
 
-- 
2.53.0

