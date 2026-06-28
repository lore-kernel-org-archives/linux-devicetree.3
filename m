Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01B43AF66E
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782657560; cv=none; b=ljigCiLcSNMZ90WzfX3WOlNYi6Kbc7FfmTTwnNVd+shfSu75rdWPH1ioda1Rfl19aLDDw0GMFpYtVHuf468pBtxxqgapi8xuHYvoxbpYIir0/jlJM6RtdFhoNv62pUcccHoSJR72AINb86VqM3fWAvduFpVN3lmYzZKkB53YT7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782657560; c=relaxed/simple;
	bh=/v+PDglwAWogEv7/BGamWY/QIHQ7rIYNCl7qxiSG32Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SUhLuGGDOTFNWvAs8q0EHGrn0BVZ9c1zrnl+LdHCm9gzn6HEE2+cUGg7IJC+aNg3FM6U4arjXQBF5i7UOGLpMu/Xygylx6M7h1OMt++tQ4aEWCsq2HcliqXzgXAcLKzoaN1T1xapjP9bQCQ+F97KDrYbQ1dHznuG7nG40B067b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SpfhDQwx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIn7/jpS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SpfhDQwx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIn7/jpS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SERvr0045042
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 14:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mLIO6kTkqkHe3ZnPDJEPPRXfk2XJq416JBKIIcB/SGI=; b=SpfhDQwxQ+BChiiL
	Nr5hB8DSzigw8z32Qeu4zFrGSXDbZRvo/rOsw6RA4i57IfEJIoIF+dd1kmv6gPfG
	KRkqRUV0+Cqd6XXwxDW1Zyl67f5m/8IQuYATdIggYwtiDVWYebESdeTyKQWX7tjA
	7+CMVhc/OmSzpTbQ2NretOX3o6LAlzGxvBNiysp5w7yz2kMtOlPb/WsNdBtFoPTX
	Hy8JgtsK1cMdjQwt0sovBFlFWUAh2IVAO3i5vCMRBFDtpFzcWOl3h/ipWaOa0IWG
	otIc2Bx2gAK0/ZFxApayQOVzJAdKZ3CzY+cQnZwYECnSH+WHEy3aVR27w7uFmiJq
	Bwgakw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tuk1tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 14:39:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c011c7cb9so5558918eec.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 07:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782657557; x=1783262357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLIO6kTkqkHe3ZnPDJEPPRXfk2XJq416JBKIIcB/SGI=;
        b=NIn7/jpSlZvhX6+EKTbbkj5fGQKpiXTYi8Lyyls8eP6iJk+wFfhV67vMPC1Dh9koSA
         dNRKN2Ulph6s3FHMbhsL4giRzDX7cG/3UpnarzvR3CLSegiOMm8VLrrPV4goWAv8IW46
         6CSD2aU7eReXJuMZ6vmUNGm8cKQn3+49VDif3B57CPQMab9DCd7412LX+bYONxvWoTI8
         GN9T61QHdvohuHLYrdFmNFRmcJpNbP8REcwqB+bQCoNN9U6LUXI3iN1uk6JnCp+7HKcH
         m219oQH8L7S6p/7WbcmxsuCAt4kAfS0p7GxIrb5WtnAIIeHah0BnMM/hEg0GHsSmOWtd
         J2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782657557; x=1783262357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mLIO6kTkqkHe3ZnPDJEPPRXfk2XJq416JBKIIcB/SGI=;
        b=g7JzCok2HVuRAgC05o/PPZxJXQ1tKHaGfdt1o4rT+a+bJnuu9x/Moct6ue1VzH02gG
         TuWnPtESHyaPl8ybLODAXAzcIAzJFPdh5zQU+AbFr7By6LJP1Hdt/U+JWERey7bnVv6r
         BGHWpXrMNdgtOml/o9E6/W0wT6Yx7hTNHeIAP3dulCnkrvW8SPau+F5wnYVHMGwWpONo
         LcgY038T0gWPGO7sRkqBuOJsyWbjI7FAnQ1Qdv+LAjszeufQ6eRsTC7Gh9qNCvveQW6S
         iKNIHTqp8LIkRxiAykfCj218kN5SiwvFpqffv0RXYPet8PliRiQO54yCaoEh81YxMRCQ
         Zr4w==
X-Forwarded-Encrypted: i=1; AHgh+RpFARj6E2Aaxk91E7pTXbzvPeL/VdbdYMk+Gl2AfYPpUHDWPoYCn7n/C1IJIWj26VXGeP7u22lcueUW@vger.kernel.org
X-Gm-Message-State: AOJu0YxGmo+0bW/OD/kkaHs7yn/6+wYGcRoNFhOoGMiFb5gGMW3x8cob
	uPsbFToel46oYVHGcl/2QqBImVyBfGmEEtaLUbv2p/CgzINIjgtHBdX+/kXbL4UNKFhJuIHzLVO
	vm+fxWaGStUzx4ABwx5GFLLIKVn21PleRbiz8j0GrLZv1oRWJyIAj7BNBu24XNs5j
X-Gm-Gg: AfdE7cl6daJAN2SoKZBsOLPX/ZDgQhmWgt/ucf+canW9bncP7DRz7hfb3qTxSQWugUB
	NG0Tvn8I8KVvvTD9V1RtQ+WH/yEWqWnxfXlMv0kUqzsSE71b1w0O9idJr3DO+XL2sOleVh8HZJ4
	tvyAGK6jFmGbU8TRVK8qg0pjFCDbosnjcDnlGDNpJm6cwgG4u+QbDxa0LqVb1r7+uA/8kNUA/6a
	7vbQBuI3L2eZcPstL3B+4Xqrp+hqJyMHyhSFZcFoGA4ZzFeXK+kOQ+TBl1+f0/l0OBwwJnlcnSf
	0ReijHkqdV9NdCESAEK+Gw1rqs6pQ6Sp7BgnHgEQ3mnq2fk8U1SNF7u1rqlHFHhRjalqAllq7Uz
	pn65+ilKc0AkAsvypPdxOLN+EFZhyn/iVinE8k0oklNwXFN4=
X-Received: by 2002:a05:7300:80cf:b0:30c:52c5:6e3f with SMTP id 5a478bee46e88-30c84fa60aemr14135211eec.18.1782657557418;
        Sun, 28 Jun 2026 07:39:17 -0700 (PDT)
X-Received: by 2002:a05:7300:80cf:b0:30c:52c5:6e3f with SMTP id 5a478bee46e88-30c84fa60aemr14135188eec.18.1782657556897;
        Sun, 28 Jun 2026 07:39:16 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm39300591eec.4.2026.06.28.07.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 07:39:16 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 20:09:04 +0530
Subject: [PATCH v1 1/3] dt-bindings: i2c: Add Qualcomm I2C slave controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-i2c-qcom-slave-v1-1-8b0a5c01f9f6@oss.qualcomm.com>
References: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
In-Reply-To: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782657549; l=3692;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=/v+PDglwAWogEv7/BGamWY/QIHQ7rIYNCl7qxiSG32Y=;
 b=0KdbLPFWs/JtY5tAzNsjCui5D/PmhNBdM5/j+HzgDIk0kMvFSA/dLiTPxpW6/Xv95G3aCIVsj
 ECBUTIGv7v6C/MVw5EkzPxXlDEsInMibiYRksXLKqCSCWBGDkaoW7jh
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: Fm4KokySkEKguchX6vCA0on20PVTqu3t
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a413216 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=3KSaKwb-5OmLBe0Aoe8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: Fm4KokySkEKguchX6vCA0on20PVTqu3t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDEzMCBTYWx0ZWRfX+12VgJvFZoDt
 7oihMd81J/KylRJODF6gZENYdK14JCqukSGc+AEBF1w6vMc7drYebOiduJiR0T6JNfq+4/cajI8
 V6/wfIsb5esxn8sBeGUEu9azLPq1QbK6YkdK80u9qpMI7l8SJbaRW8biBmn9wfCrd7GzYnfti6X
 QO8OJvDI04uS9geKM9Dt2AP+H219wqVYJd59A4KCWfTCCaLKv2V+T9sCQquAYdNi/dc/paNCizF
 FsldHzmWMlFVrmOAPPSeZDoqIB4sZxQlBIDnlkPdUBYK4nv2bVX/ZutlN7zfhm7f6oEOq5Q1L4j
 XFw4fBa+zhNQz0wUCypdKi6gzsEOQVJFfCoCtdglD2NW24qnXjneM7fHYh9aY2WmloEiQOY+OZ6
 UQq6+yeu5B9v5bAawRSlVQ0Q0DL8YYlbIChqpbXaxyBsBN+iVkmcjA9XOdpKu7f43Kfg3WbY7c2
 VxrBuc7V4dJNdSZzHqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDEzMCBTYWx0ZWRfX1Sp26h4Y++XC
 4bnkSOt/rm+Kpa09/Tz/7DTbA+OPI/N2Wetla+X8O8mEdLXZINhXkTasfdAvJzo/OyLbq6nWHSO
 YxR23+yfomAZWvYuwXNdFL7FGAep7AI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280130

Add a binding for the Qualcomm I2C slave controller found on QDU1000. The
block operates only as an I2C slave and supports FIFO/PIO transfers, so it
needs a binding separate from Qualcomm I2C master controllers.

Document the MMIO region, interrupt, XO and AHB clocks, interconnect path,
and the 7-bit slave address needed to describe the controller in device
tree.

Use the 'qcom,slave-addr' property for the slave address because 'reg'
describes the controller MMIO range, and this slave-only controller has no
child node where an I2C address can be encoded.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 .../devicetree/bindings/i2c/qcom,i2c-slave.yaml    | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-slave.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-slave.yaml
new file mode 100644
index 000000000000..3096ff2e62d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-slave.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/qcom,i2c-slave.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm I2C Slave Controller
+
+maintainers:
+  - Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
+  - Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
+
+description:
+  The Qualcomm I2C slave controller is a dedicated hardware IP found on
+  Qualcomm SoCs that operates exclusively as an I2C slave device on the bus.
+  It supports FIFO (PIO) mode for data transfer and does not function as an
+  I2C master.
+
+properties:
+  compatible:
+    const: qcom,i2c-slave
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO clock for I2C slave
+      - description: AHB clock for I2C slave
+
+  clock-names:
+    items:
+      - const: sm_bus_xo_clk
+      - const: sm_bus_ahb_clk
+
+  qcom,slave-addr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The 7-bit I2C slave address programmed into the controller's device
+      address register. This controller operates exclusively as an I2C slave
+      and has no child nodes, so the standard 'reg' property cannot be used
+      to convey the I2C address (it is already used for the MMIO register
+      range). The address is configurable at runtime via a hardware register.
+    minimum: 0x08
+    maximum: 0x77
+
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    const: i2c-slave-config
+
+  pinctrl-0: true
+  pinctrl-1: true
+
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: sleep
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - qcom,slave-addr
+  - interconnects
+  - interconnect-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,qdu1000-gcc.h>
+    #include <dt-bindings/interconnect/qcom,qdu1000-rpmh.h>
+
+    i2c-slave@88ca000 {
+        compatible = "qcom,i2c-slave";
+        reg = <0x88ca000 0x64>;
+        clocks = <&gcc GCC_SM_BUS_XO_CLK>, <&gcc GCC_SM_BUS_AHB_CLK>;
+        clock-names = "sm_bus_xo_clk", "sm_bus_ahb_clk";
+        interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+        qcom,slave-addr = <0x30>;
+
+        interconnect-names = "i2c-slave-config";
+        interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SMBUS_CFG 0>;
+    };
+...

-- 
2.34.1

