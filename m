Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783514;
	b=VLOgaDg2LeziPUnS0mbUYwfNAlyA26wCLgMBNXEbp3Km9PGujdukHPZQ4MutpSer/EsE
	 MQQ1sR6x5WYeyPJfEu1iFnEvQJGLmnI3MKdGoMTPK+uQdwiY7JkoD5sCW5CmrZeq2eOxk
	 AAX7FC10zmK5XT85WHGWTZTpGmDE+LI9kqFt44VPlPdsQCUoO/SIZ0gXtNZQOBNHMO7cb
	 g28vZeel0GaqDJnCwHqKhspI7PwIGLegBis7lLTO7ZKYlNK/2bbHknK34c4MHC0yoSlu2
	 BWgy0XM66RFONY0AO8nQET7DkgZ7pECzHwxOE+Oy7CAUVNnxlFY/NWvhEI1oOIGn1Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783514;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6GuykzzLpkH56pQe4JsMmTWSBVarOy+Q20aNwDP3d4s=;
	b=lXP5hOahY3WiQZx8T3i8cjh1QEuJCo5b+UsJYo8XqpPYGg3xXL7LLvePca40XTetTZlz
	 YRn7CGMY+bqICCudRhKF0jWuDkJPW2+sckc++wqGUX5pDds5i7flyX0VwrR4Yt0fhkIho
	 6mO7XvUmcXZOGICn+h1Uz3pRmfjWgNmyJFekdos1b2mktsamNWSfIq9qmYVCsXuhPI+zp
	 eBHcCZknwpxAqh9gdlchBSvVXw/7HoSqwa260DizYFvHC4PyFwKNgIwKcA3ilc25oIfcQ
	 OL9GfDxkpoJKHfDWzWlDtGy7nUqtSGbmuPCSAq2lizYIPwotCNB68PdiwBfz4fq3mWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ly2+CodM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HDCGwwyn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A45606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 09:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38A45606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ly2+CodM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HDCGwwyn
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KZAE2231990
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 09:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6GuykzzLpkH56pQe4JsMmTWSBVarOy+Q20aNwDP3d4s=; b=ly2+CodMQxIjSAiJ
	tyHWVL6T//F0JJuiaYBeQW3qlj6C5Ae1PtXVCSRjupmXQd67VrwccNZPvvmuUcHr
	0hoMVUxykUke5b61mH3JNJSeciZLfBvc6felfvih/zsYtpUI2Cyk566oSGthXciC
	HmkVpkzWhTk0Xz7Im+ihuwO6THW8ix2Fg/+8i7Yaz2hpwsEY7BK1CUmfN8JWIUSH
	kKI9RVIVluLKrGZVwnY4oZYQXZ52WxzN+S4nk9il79uvfcNN5wsfWxlCi2/2Vnpx
	2a2oq7TCPZ9jbDlXjC2NgjqKBEbYdzkLN93souFSGtv2LUMoVFTAmNHd6SuQGrox
	ctl8uQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pkayg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 09:11:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so1006342a91.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 01:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783513; x=1794388313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GuykzzLpkH56pQe4JsMmTWSBVarOy+Q20aNwDP3d4s=;
        b=HDCGwwynk63AQQ48SOxeC1KjVJO8Nee9tGxplLlkZ4slG6rwCFwRWN0JAxlYsmS9PA
         +DdzAn21sMw9QOvP+FnghCowaik6NDc4SxukJWj5UfcxlVvFaNIOTolvuVLBC1ETLQ4d
         fNK9LBj1DiipW5vjzI/s4KBA8M8rHmGBSIqEhIA2HOlPRYf3M+egkug8B603MWcDvrGy
         m4gle2FLAuoJzfoYj7+QIifYvfePJ6zpbgUMdJyzNEoB4o3Lrhw2qT5PELwit2IWrSPH
         ef0CYTQmzRSLyOS7QxqybFQ7FVAZLQmyg7djsoWETZ50nm62Y0KzTfMzpGL9v1yE0ld7
         9TRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783513; x=1794388313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GuykzzLpkH56pQe4JsMmTWSBVarOy+Q20aNwDP3d4s=;
        b=Vlv/pTaJHYGzhlaVHJ3njonptCKpTt9dyE/ZbPcXe848KyOoG4P+ypnSt8bkpLqNZT
         pj2ZNWoBuiWMRXY7LoSIZzY1xZXdEwmJysvs6RmBL6Ah13UWN3EF4n/4Jnjaosw0kFU7
         AiN0rwB3P2BuUKhdPHnNtAoqM0u1EN/ZveO8GME2e1qMvtRuKKn0vjbQRtTVOLiImOfu
         935FTBncs3IN78IGwIkSLqt2SMWzc4O0udZuFk/ryLXKcKYCVSQtv3BFJui9xG0Mwnm3
         9A3gaSVaNsLVlqTcWNzPGnd3axsFJPO9hToZIUBZrW17BoxvAPFwNp3RRPRnwwurc6wz
         +4LA==
X-Forwarded-Encrypted: i=1; AKwUvBwXQFv99rfpBeAPWEz2DNP9bpAzPbPQ99zMHMH8CNibhuWzoCEE+IuAj84x/KO6s1T0XptcWyrtovJV@vger.kernel.org
X-Gm-Message-State: APuU4Z8hGK6lNiAbaJw4aF+Le66dpSrOptOglEa0DAG9vVc3oO052Ue3
	OBI/XcMylXCzve/VFtxBj8X+PAdM9c0AGJjgwCeMp43lLWicgRqwX5lPYcGhlVfuC/DNsrdPyi/
	eewyH0DHmiCil9rXA2YJtfEVHlTor7QKNVYBw0p7OrdeA2d9g1J4eQgXpWp5D2uV/
X-Gm-Gg: AYBFou3huyVF2MM0uQGKuZOQNKOPoKx0eFGsWH4mRJkmaRDZCwDQCMG8HJX0tYX0U6l
	Aj+OuKmvpVRqVt99Rv2CZ+OYZGaCLjNEKY2bw//YSf/kJEp2KJi5RJpTUYECKbaS9hZ0kL2RHyi
	6NzhrU0Dg2hOioFY8Gg7238LSdg/2WoUR35DBu6jhbvz7Wiq98eX2Ab/qK6jJDTCkpMG8rLQnnV
	i4x7m4x65dWATv0q+tFRJ3LjXI7+04ji5KTY2OUGT64IvSawjjMYdsNyYdaiFAEPw7Vrck+HoG8
	s5v2rtudSE3gYn63SzmRseq5iUExGXTyycCWYOsoNyQaeELyfnnculKp216hITqog8gzoJYEty8
	qqV4Qa44aHVSn6qIQ28CA/TdkRxIi4YMvup42Vb9LKRIgxSoBPe4fLwUGT+z8sspUTNt8XyR2Xk
	QaTgFf2TYR
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id 98e67ed59e1d1-3ae8982c1ffmr13983267a91.45.1793783512636;
        Wed, 04 Nov 2026 01:11:52 -0800 (PST)
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id 98e67ed59e1d1-3ae8982c1ffmr13983233a91.45.1793783512186;
        Wed, 04 Nov 2026 01:11:52 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c896cc6sm8253877a91.9.2026.11.04.01.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:11:51 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 14:41:36 +0530
Subject: [PATCH 1/2] dt-bindings: display: panel: Add Novatek NT37802
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-jshekhar-nt37802-v1-1-58e5e7fb2556@oss.qualcomm.com>
References: <20261104-jshekhar-nt37802-v1-0-58e5e7fb2556@oss.qualcomm.com>
In-Reply-To: <20261104-jshekhar-nt37802-v1-0-58e5e7fb2556@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jayant Shekhar <jshekhar@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793783500; l=2222;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=8A0ZKqgwoan8Smk+YA31w0++rT/VvW9+pTsfyOAxJv8=;
 b=7X5FqluwOB8V7OwMt2jW5i8pgUVH300hw1vXITg/Cr3uXrREPTcpNQ4GW0VFYlCaalow7mQVv
 ConL3h9588gCjSGxkOT10ExM5HWosSKPkHE+EN+vc5CKV6Z4XZ52jRD
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX7ITmQbex9qZz
 ff1DKAaMIs52cYuUWZY5askT3rSfZ3SvqFm9www3O90Sxs348+1HohkEFxm/21lbI+v5lcFLaSd
 3cITKzc4LVatJh2aiwTXHCd5nUM3xaQ2mKVmsVUxBCP5CyqVCEcAHXu0jHZIjpExcA2DCX3wGAx
 cRRIw4Q3V+Ms8H4tjelm8J8HwqTvfnIJu6CsruGPOP24KMJ/GkSugyHp4hRn0leI5cISnATvva4
 9emkKiBpGqM90gpanlGrCcstw8CH494vKdHZcMd1tHtRCZpscdf8xRTp310J4f3CNRV0f1x3ZNz
 1abQufnLyypm745yZonUBcpkgj5yTmTgRoxkjaSg54FJT4JHb7+Y3XExdUOQhZfqsO7TSkGb/dj
 Hqukq+zSZVVnnWUjbF27QXJz2DUdkeOrqFmqrFBb+p/xO901uK+6cEBMd8j/Q7CA3rvNDbJ4X+g
 KhuCVQftz5QrAxyOiuQ==
X-Proofpoint-GUID: dn5--emMtwRw8OWJvxmu0bN7hYmoNC0m
X-Proofpoint-ORIG-GUID: dn5--emMtwRw8OWJvxmu0bN7hYmoNC0m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX9W4C37iSEs5o
 1tlnZ26/uHZu8sV/5gjF0ullcGJfZTrA/ADJN+ptdhOUdEk112FnxqwcwZY0wAG3MilmtYll4/Y
 0Vu/FDoEDS1COWsXIGCLlzi4hf22CGY=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aeaf6d9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=RPLscFmMtlOloyN4f_4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040036

Document the Novatek NT37802 AMOLED DSI command-mode panel.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 .../bindings/display/panel/novatek,nt37802.yaml    | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37802.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37802.yaml
new file mode 100644
index 000000000000..14a59a9b0fec
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37802.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt37802.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT37802 AMOLED DSI Command-Mode Panel
+
+maintainers:
+  - Jayant Shekhar <jshekhar@oss.qualcomm.com>
+
+description:
+  The Novatek NT37802 command-mode AMOLED panel described by the Maili/Pebble
+  platform. The downstream panel description identifies the module as CSOT.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: novatek,nt37802
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel number
+
+  exvdd-supply: true
+  vci-supply: true
+  vdd-supply: true
+  vddio-supply: true
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - exvdd-supply
+  - vci-supply
+  - vdd-supply
+  - vddio-supply
+  - reset-gpios
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "novatek,nt37802";
+            reg = <0>;
+            reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+            vddio-supply = <&vreg_l12b_1p8>;
+            vdd-supply = <&vreg_l11b_1p2>;
+            vci-supply = <&vreg_l13b_3p0>;
+            exvdd-supply = <&display_panel_vdd>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };

-- 
2.43.0

