Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F9E4334A6
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784896944; cv=none; b=VOLUU4Emj9uNVzKk2VxJN6pS/s/xzFgiivCCroIQxziqXmTI39hKbHj0CQrdED28S1QmVl0nS2gHVxP56e5Wn9bIDjDQveke+HOsvkwIiEpP2HvkfER2QVaVNxioHTXexSyWaGYYCfhU1NNQIS+QPa2Rpkx5qWl+Y8aramVO9J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784896944; c=relaxed/simple;
	bh=Z6cS8aJK/HbBm0d7OT7Xq+/FQXVHHZKwWRt5CJiiGpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EC665/AxP033YRJZB/Aq8aIONAh80BQLTkwUJI778LoAu58pXs2QS4YAawNT4OVzAjpdQuKKbW9WNM4QeJf4FBI03WGCKonOv+mASfNR6582dwQpuTrLOK18FbmiaJAq6HhVwVQY4/X387h2mxQ+rsx25WkUjdpRnqewEoZvf5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jm5PBhZ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B0pMphmr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jm5PBhZ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B0pMphmr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAE0J12917066
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=jm5PBhZ0GDj2IwPS
	RFAL81r20fKzNEh2nr3RWuK78sA643vgkXGu0EO6Ace8Jv6cMX5OPxUmq4QyGWtM
	ydGQlaok0LQ9FqrD3V4DBXc42893bWQaAc7C65ffF6Z/rBfdclIxciZ94fkGUCTj
	ZhuLOnbPq2HGBLNTrPYfn9PPjd+FlzSXi0lOIbSZAgw87KQLiA4NfrwTpnSfjcoe
	UL5ubf97/goRho4QeIV11h4VmB3+X+pbTJnDkVW4SaobjzyQHqbovmLNdEJDbdBE
	jQlC4coSAVhYpUvp4miAywEluRnFQ3dQMx2b0oqz+M2feeMKNkk8uoiWM2f1PIoq
	sG8zxw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vm6mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:42:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bec738909so5527141cf.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 05:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784896940; x=1785501740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=B0pMphmrVkkP0PErOVMecdRwv65XvguNq4ZHSOitTy3S0dAU41OFX02fsuTj/8KeWw
         520EpotXQvgMlYISjMxNAFwV5r7/qJtxRiG6OsB0mbci6jLsnRrQa4FK14PDks4QB4gv
         FuN48xOK2zVcZ0Erj/Xk6nLyhOpXI9B08IRM1H9hPPiqxow3hW0EjfzNU9Orx4oAnHB3
         loHFqVYFiW/9HTZdGMoVsMMD5vNir3bvK2pgoWJV0IZ6kXZc8INGF7MwVDz0CYwc3U5a
         DhEWdoQcN6XhhcYVBc1KzhYXmMnOkVIhBsxOXJe0dLY9qOkLiFOPtmGFYwEJmXHJJXIh
         BpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784896940; x=1785501740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=RZ7B0mxS8Le0tKNz5/wF/ayDjNPRgu2JDVN1iu4Q/frOXzCtbq15mMlF/iyoo32x/g
         fg5DJBEhnhToKgEV+Ay1f0WYZnXRVrf/LOvzaBdl8UA2i/1csAULy3ysmfmRiMFQFqZz
         ay8LooZat0W6UOpg3/9ZdIAQ5Kr4hmkoXbcAyx9nOxPVgE5q3HGWVXKp58M4tDqYM0js
         BkDm5Jqnj4S+s489GWebu6lebJ0XQTLQyh4h4lrKD81fDwk1sosVDCzMkDcyhrhm+tSs
         uhRISx0mULXUyRZG3rKu/v1oakl0gK+EsTiZ9fv0H1WPRwwB/yRMAEMGuk1xfLqhTDGO
         g7jA==
X-Forwarded-Encrypted: i=1; AHgh+Rqo8KP06tiYJ6bKrUsHGUUCB66Ct3beQmGGK9lM5daa5U1ab4qB9Evw8ssoyZmsY/KYt+Bj2MH4cB1N@vger.kernel.org
X-Gm-Message-State: AOJu0YxEhKp0IqS6yrvcTeXNRj9rCZc4ofaCO+SYKxdN7JfJWeiZHZkH
	de4rC1QOS8OawYjVAiT9T0hge1Vf/ecTOkUkS9sU3uB1yahi3uBj5rnNUeuMyeTfmQsIwzM0VhX
	D5THD2DwDd7iQcPcNP63AQt2R84+RSlgiylR0BlXc4caP26TtrV33o6UXCMwFe9Pe
X-Gm-Gg: AR+sD11XsIXRWfFcyNQa7soPIxXpo0rBBjS7A5zerFGtHBvFKsU5HvGtX7Jsvj2A8oC
	2KMfjxy8Hz4GQ+oXbVSWJltdoqFhFRygAHb43IZN/+aR27rD/EoeWs39IPsQKy6QKSK6QvPfOUs
	DXzwZdjLCDZ5iadc85Sv+o6XMyWdKwxrXfyUD+vNvFaP2rshQyAaCWgtkcKLJz6YQOzE+BIgZQ5
	arBnTzqHjWbZSXeSh7f338L4fVGvZ7LuSgh9I0iOrlyHvbjMdLmvYzYbd+6y+V4AofYy9by7U2H
	90Ri6qDDC1yVAaM7gA8HIXVXVqyaJqq/b7GEmVvwIIzVDFopHPxDvSnofKofQ5SIBTfuh1IzhJC
	MBDh9JSpR9yzxNHhjWf1R0c9x+W5hV2yekswAo3jfxFx6diFjOQsaeVR5zX7mQVRaix/4BMylGY
	n40g/l55V5+4vmsTj9Wu553GGizgA6qKccuXdICgkFskB8hx72Ng==
X-Received: by 2002:ac8:5807:0:b0:51c:83ee:e429 with SMTP id d75a77b69052e-5283e0041e9mr62363421cf.78.1784896940181;
        Fri, 24 Jul 2026 05:42:20 -0700 (PDT)
X-Received: by 2002:ac8:5807:0:b0:51c:83ee:e429 with SMTP id d75a77b69052e-5283e0041e9mr62363131cf.78.1784896939715;
        Fri, 24 Jul 2026 05:42:19 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebc828sm352591166b.43.2026.07.24.05.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 05:42:19 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:42:10 +0200
Subject: [PATCH v5 2/5] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-camss-isp-ope-v5-2-e70ad4fa39ce@oss.qualcomm.com>
References: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
In-Reply-To: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExNSBTYWx0ZWRfX5YH58g5rselR
 dIFWg7Jk2qbTAaHzeW0xJ7J8pJyIr0/grTB4YeibArr70NP0nIiTcj25vgrnD9PX5Qpr7A++cTr
 ive6lKnKV2qwo5iVV0D0futIz5p5Jn8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExNSBTYWx0ZWRfX/8AvjypyDahh
 wUJj2FQ9/VMKPWO+smmJFwSj3TAZ1Qua5RZDxWtuiT7FrO4aLbwNxhY3fRn8C4Ejs5dSrNazfWy
 iitiFmTRGnRTnaHBSFH77io1r0oCj66+zSnu2uwaexh3KGRGEM7fgjmModutnbWKVfhaNPCO7K5
 nbazCIwd3a5lYmesQipKVK1vVfUT3EgUzJOeot2GCQY1m/niUf9I5OJdjrV6F9Fek4BuJEmu6Tk
 sbwq+ax2/alZCajpSm2bxUnxm6M4CQWSJN4ZW1WvqDLKfshiPrMBnUqelrgxdtpbGfum6KyyBjS
 P+yq2YjaFMD3v08NmW9xa0H0UeFSEKqYVG+jmQ/jLImRUrEIEWsE69wk2wLc1nT78vf/PS0ql3k
 0x+223VlwUIwYPnXG9GPc+evUH4octh2TYru98wzzP1JeGKYLVh1BskfQbKqLU7t4LciqsJb0ri
 EP1sV7yJeyrsGON3V/A==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a635dac cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: kywxkGVmAtldT9e_UGqIoaKGcfZj5BNI
X-Proofpoint-ORIG-GUID: kywxkGVmAtldT9e_UGqIoaKGcfZj5BNI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240115

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

