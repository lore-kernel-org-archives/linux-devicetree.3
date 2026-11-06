Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973332;
	b=gVvkLPyVd2BBQcifVY8hZ5U9Lx4NuyNPg+FkMoWKOYn+4mjMs29td5PFmLowMimZCJiV
	 mOXbz0nhrzAaLnUP6HSJCsp9yDQb44Js1C9CojllZstTwzBzZzks/sn6I2t2W0Y/MOqZk
	 cSzIG65K/7wrinTQDix2ttUqp2YtOhFFT6rFlG/cvuE7IRhc76wHc2Y3QAe52Xgq9c916
	 jASwXuaCjBIqLdYYH9NWNBEFiRDC6Rip5TVpQijERU1GQfzQYBqhTlxXGaXp0CVkGQ56b
	 DuFtTU38UOq1NXE8NuxuTAzAohxpRkFV/Vlb4NLt1W3xXhLZjuNlv3jkHp1uEaxmD7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973332;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
	b=2q9LjpCY4FdlVUsnys+lDg9xxNDQmRTvGmXnlmQa3HW0MCwLY6Sk9jzjJL7u627KZ0sl
	 PGEDVo5tZ3LcpTo3KmX8Y13xqm5HjEwjlwNq0yhCw55ZLT+I9fND5pTxeaU1uhEkI1qF/
	 xaiiGCL4bGyJSNy7eDUWdSwgIyiCcsRFQqlZSBul4zU45qHtM+L/7w0zYjgYJZ0moyOwL
	 PYGNm41m+pOb9YaDZZIl0zNiWPdMN4pVRcqmvDEuKwdjS8q6/pq7Yca3091u6L+4c6Ba2
	 ZHL//6xFGVWThjPJWkJKAxtp5PTCe1ewu0FrQ56abA2B5f2tvAM/S1k92UUBgMdAwZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TyR/YEPk";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kGFcS52A;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C98606EE92
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 13:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92C98606EE92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TyR/YEPk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kGFcS52A
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6DonVh888101
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 13:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=TyR/YEPkABFsBr+u
	aYp+YS+zHOEzOqBrFp4xlfFnX26NdZV+QDRcY37O8XhvmSWSvl7PVp2ZkCHkvFFA
	dTG6galMukQhos82vKXl9KscbZWvr9hrXXE624QMJGBzIYzvWQYQp3929hI7xrdX
	78UKsZmSx6o5uL6km85urCeQpnUPMp21inEyNP9cWyzDmMICwADxPoE4rMz3dPZC
	Z5qeJBuZwA04kdC+PDte4Nd7QJmMcmTEwt2w1nyUvDSMZ9HUcxFv2OY6Ra7TuTgS
	Dp5o5RiukhKvhBU0GIVp0bo0J7gWhBSU2cDMbf8LzXrSaG6fnB0xpU3ydHkdkccN
	1gWkKg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u2qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 13:55:30 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99b8fbf29a9so40170241.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 05:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973330; x=1794578130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=kGFcS52A5/ZURsI0i1bYzDCWqq4AB6l03GptD0yz7HdiSAT+ejj86XUGdePOUM8MGt
         FGXQaYAro48+EwmTPhb2Fci1TAsc7/5VO9YKiQFngfIlcS8Ldf1bV6P0p4xadEb2rwQm
         nqi4rqE1SBz0ncUnUSw2TK4KEKhrev9LiSyHOinbr41dwq0lpIfdjaAPsoxhx7J3z/9x
         yIAXxQl9lDRo6g+liZHmi1XMUoa9TArcQiMy99E/rUn6X16O1qlCejSSdCo+t9JGw6U/
         sRWklFCoFT1MFK0QmiFSyXWL9MHK8kMdxD/qschYlPF8t7E85wExaxPyBHSmEtnSMUgb
         EcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973330; x=1794578130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=UaB7NKaXtBl1U4u5nBW5bqAbvPtJyboSWPH4jBR+VXTh0DQm/SIXr3boIcMZEkn0Kj
         9cTQXzYUz2ZTlT0geVSoIjy9fIGGX2WLXjmp/a8ohSK6gJR2zFia0yOoo9Z9QG2RD5vV
         V4/YmGMBC9JKdxrywKaKv5VQSkICRlTyKamcff3bGZduUpLyv09W6ZnWKZzMuOKcCjnl
         wsSWNaay+BKQwckKdynHFBb+P1BCLLqRZ7zoq4r/Hc21NjwqZ7d221Nf79Gu3U+pvj49
         rtxskqkiTwmrmDUj6UMc12/iDRrGem6v7KDn8ID0HiEjt1Ja0ZDMGUZPB5pm0SnHgDh4
         /8wQ==
X-Forwarded-Encrypted: i=1; AKwUvBx40YW6QU/teJjqyfaiWLDR38RkolwT8TfkuDsptSTdPdcY8t2PHashYHothmA5DHxRjcQ/Jc42yPxR@vger.kernel.org
X-Gm-Message-State: APuU4Z8VIC74ikNd3g23BaWPaqcSWO6z5er00Q2VZDApClHzF8BmojWr
	1VX6V0vCjaZKQuc0VZUfYnpMuzbSSNSLvjLsMobT/PO5TLCUS84NHL71HO1a5ybTr6oxdV1S2iM
	NGpkCgsMW1+QcLqR8jQchoAw6yFSgR4i6Fv+LdosWuZhDM3QsCxWlSrkQZN5biHPm
X-Gm-Gg: AYBFou2evqmb4FkKlyDn9c3LEPXXY2SNS4MVH0pVEoV8O3W4iQWZdNu5gAlX2RwBFsn
	Pb2eGMDEbZpeRrgLQlzPZNw2z+rJtLfj3EE3t2dgIjYTXgt5MBUebvI7tN2XPHFf1N1KjDQg6CO
	dzJD3bUUXJk/AIgnRAWimeWFpAMJOfTi42ZxgTNfDOtOCqe1ZlQl/BuOSavTmuDl8dtPSf6voAJ
	gAAYeDL4HbSgIYZ8BmZsNH6yCGhFerODAxjLRts+KWnDhvzdkR9NrMkCJlhMG2ihvZn41kfJMwU
	7K50bTkfoDvdyTcbO5CmLysD6j+bnX8ZCZYBGDulKK+9HjkjdE9u2PWzlgaRB+SbA2DuJKsuE4D
	rsUB7iM25UOEZhrGZp8G6uHOLqs6WGfYP+QynIjYaJhB7tzzIM/oVn9gAGtdKCYvH7iitayKZe8
	jMWLWoGULY4v5rgQ24tuNWRgdE2/XPLPVHl37dHgwyZ4giNnsy4+gxTWXNMxj8Y+UhQz+mISv/2
	0NV0CPYMjojw7ozLE04j21PLZeC
X-Received: by 2002:a05:6102:390e:b0:7d2:7dcd:7c99 with SMTP id ada2fe7eead31-7d2a152a24cmr1200752137.7.1793973329591;
        Fri, 06 Nov 2026 05:55:29 -0800 (PST)
X-Received: by 2002:a05:6102:390e:b0:7d2:7dcd:7c99 with SMTP id ada2fe7eead31-7d2a152a24cmr1200734137.7.1793973329028;
        Fri, 06 Nov 2026 05:55:29 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:27 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:18 +0100
Subject: [PATCH v14 2/9] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
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
Message-Id: <20261106-camss-isp-ope-v14-2-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
In-Reply-To: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfXx34Vy6U/8Inv
 dk71TWqFH9uoa9V+n1uW3PcuyB/SfK44ARvUb9E4Zg6tP5yZ4UbCFm54OdEljPRo8kZBS4reqNJ
 41SZjJyPYMkOwFkjdlmGAMrr+N0dC4U=
X-Proofpoint-GUID: pltoMwIDqVFSjeFC7cGegAkfl-65Yk48
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfXz6/MJ8VnGEkN
 gLCA9n5bX3ZtGJnU9lUz33gdPzYhm8Qeug9Z5QJFdUOXp9r4lbr+jadC90rSl5l1cQq3QXgQcMf
 yfJo9HHRmI5cB99l93/JHns6p2OVDzI3iPDzgMoSvMOqfJELZslOnDismd0BGp9X8iVg4H6Axdk
 y6kPc7H56KtoXAWlotCoaNy1F+b8vSt6h62/UHibvdbH8buHifhCLc+IjPEflBCBgz9IWHG7kDX
 ByxGZQPIY1A0MgX41XdvZ8l9gdgHA6Uvn+F5ZQ+xW9TErH9T7Sdvb6rvDcHQlnYicREEriQH8KF
 ViMk9hojRSv010EiLnzla32p9SB5LHAbZnvoIwseVE1FSl7gaiJ+aHos0Bmo7MRG3L6s9Rb8Y8n
 QfqR1QlCAioVhU1tb/npoVX21aih8Z2/itLfBTuQltCJsraOSATnHz0G8EwBCFTJbRihsupoSCK
 hpAKEcZbdqT8r+g3gPA==
X-Proofpoint-ORIG-GUID: pltoMwIDqVFSjeFC7cGegAkfl-65Yk48
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aeddc52 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060055

Add Devicetree binding documentation for the Qualcomm Camera Subsystem
Offline Processing Engine (OPE) found on platforms such as Agatti.
The OPE is a memory-to-memory image processing block which operates
on frames read from and written back to system memory.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss-ope.yaml     | 151 +++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f9c31bc88e94b028c241060bbd8e56e0bdc49af5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-camss-ope.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Subsystem Offline Processing Engine
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The Qualcomm Camera Subsystem (CAMSS) Offline Processing Engine (OPE)
+  is a memory-to-memory image processing block. It supports a range of
+  pixel-processing operations such as scaling, cropping, gain adjustments,
+  white-balancing, and various format conversions. The OPE does not
+  interface directly with image sensors, instead, it processes frames
+  sourced from and written back to system memory.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-camss-ope
+
+  reg:
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: cdm
+      - const: top
+      - const: qos
+      - const: pipeline
+      - const: bus_read
+      - const: bus_write
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: axi
+      - const: core
+      - const: iface
+      - const: nrt
+      - const: top
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: config
+      - const: data
+
+  iommus:
+    items:
+      - description: OPE CDM (Configuration DMA) port.
+      - description: OPE read (fetch engine) port.
+      - description: OPE write (write engine) port.
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    items:
+      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
+      - description: CX power domain.
+
+  power-domain-names:
+    items:
+      - const: camss
+      - const: cx
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    camss_ope: isp@5c42000 {
+        compatible = "qcom,qcm2290-camss-ope";
+
+        reg = <0x5c42000 0x400>,
+              <0x5c42400 0x200>,
+              <0x5c42600 0x200>,
+              <0x5c42800 0x4400>,
+              <0x5c46c00 0x190>,
+              <0x5c46d90 0xa00>;
+        reg-names = "cdm", "top", "qos", "pipeline",
+                    "bus_read", "bus_write";
+
+        clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+                 <&gcc GCC_CAMSS_OPE_CLK>,
+                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+                 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+                 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+        clock-names = "axi", "core", "iface", "nrt", "top";
+
+        interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+        interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+                        <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+        interconnect-names = "config", "data";
+
+        iommus = <&apps_smmu 0x800 0x0>,
+                 <&apps_smmu 0x820 0x0>,
+                 <&apps_smmu 0x840 0x0>;
+
+        operating-points-v2 = <&ope_opp_table>;
+        power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+                         <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "camss", "cx";
+
+        ope_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+
+            opp-465000000 {
+                opp-hz = /bits/ 64 <465000000>;
+                required-opps = <&rpmpd_opp_nom>;
+            };
+        };
+    };

-- 
2.34.1

