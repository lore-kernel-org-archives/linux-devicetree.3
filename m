Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A014BC02C
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321086; cv=none; b=g8jFSI3wl7Vr0cM4v62xNtv3breLsJA1sPEoDQo2txNvnEmSd/+0u7T03+2+F9aLc/LXfQhdg8zc4F9HfJ33bYRiS9EvlV1swb3We+NBwh5SV9BHc7a96uZ4Ua1YkGm3HNxlIgzZS/taUnYo4VLyVi8tqgEI33xo9/ulsJWmNcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321086; c=relaxed/simple;
	bh=9sOfcg28QkOFOvCTYpXJ733Ga75K89IqVNNSN8MNEFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d4+3kQeOO6xCKryWoV3aPHSDeCKpsSebp5wWk1yArg1BECJfBLvXH9SD/1q/eK7AyqTlr7Mb/daFx2V0eCygK62v1gMxRGUfVDC8Sk98xxYFbORl8MhuLWd34n8J5QOMJ/eJ741bBO5+U22qYpVbZ88bwa89KsUbhQq4z59AfU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RMsT02hT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIsyG9OJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RMsT02hT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIsyG9OJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCoW6g2466839
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uP4c33QNsfPEt0lMrWrRe3zqDPCg1mMScbrZjF/2NlA=; b=RMsT02hTmIulO/bc
	tQuxMBtPFAI1uopanNbBcpQIewf41rYwBqSoRZ9Z4jeFffH/ELPdl5qlCHNt23yv
	bHXAZMsxc8KKqpVnq+kn31T3t1KMu6MCgkvo65HSIeAjjCExOk094kMXwY5Zf9o3
	aIXeaUkh5zFbiTP9f/g9H5sK0GHIW0e9WtmYiuO6IlQuq52EOF/maxUJkxcAcCWR
	b4x3EPliMjGVwUSPQqrU8iQDNBGkO5Yt5tc1v8Kzmssb2Vsi2uS4jE6Uf9Qj76+z
	majfHrUQV/PVjirNk/xK3E4T5sBCxLHiVihrAjcGC9KHItHWZVjRB+z3YqivBYW9
	hKAM/A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gddhxfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:04:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so2007768a91.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 07:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787321082; x=1787925882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uP4c33QNsfPEt0lMrWrRe3zqDPCg1mMScbrZjF/2NlA=;
        b=NIsyG9OJlV3HRyZZneUkr2OCFvV/mNGpXvoYiLyUyVxIg968mgwwQho9RU/+R6wpj9
         mlF++jsmmqFzIzQ1Po7tst9mcEJbywbesBp5UT2uRzpojeyprumOkoL+McXG29I2qLRT
         iK2Feg99cSpfw3853Ny655oqnI0ddv71X3Fkgcf+U7ifYUU15bBgpUYuvck75uGcgE9Y
         8G2v42jwuRN5NV148Mcs+QsEKLZ/b6W8vfS+/Qlr4//ubAYnSYXMToBJYdrqUXvTFCju
         lEIIBXPrDjwJWFiAfTyEHd0v3U+sid23cJqqazGVgiXxj+Ish2H7schxQFUyqaoEfVl0
         wgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787321082; x=1787925882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uP4c33QNsfPEt0lMrWrRe3zqDPCg1mMScbrZjF/2NlA=;
        b=PmflmN0hlB0TbYstQPFrJ4rYF82nxrX5YntqlARhF/nJ6vgP+dT0q63daARvWoBV1p
         qGCImTRP9w2U/hMdCFZPqAYMYfaj6D/R23eK1oDZB0TV3N0rZqSZvab42C4X8jW/Ilv6
         K9kXj/d3lNzPtXhmdvFUfCQZ9NZ4KKY5/6nBqIxtPVkTkQpyuCvukiJYGLVoNn7Q7TTs
         gxfqrlyXNjxW6nPIvZsVCJJluZfgGYzlU1rZOvh0EuKwAk9N+/3XKIdaaeMSCZsgASzK
         XRtCeeG/7t4BzWg8LuOnnbvqqxuD2zHNPb7JDlTyYdSRRuvfHnzKYAa/Kp8pvLSkNW59
         bdGw==
X-Forwarded-Encrypted: i=1; AHgh+RpQJHc0rxRUJBs2WXQLGuoaDsVkVIG0yPkm/lWSFdpZBr+AckSxchBguMdnyvEhOKy+cQ5+bfiJn16D@vger.kernel.org
X-Gm-Message-State: AFuF++ni31aD5wc8VcsIE5EBGqq/le2N/S0aV6za6HZTS92NUgBrFj9c
	KePNa3aSxh3c+cxDU6lulxBorzG1NRgJRJ6Aa0IiHKotzm9W3/lw3LLXY5u7kHYTkXT3Ny6FM/C
	daO8KuCAZDua+w9DT+U2tGJff9pJfitJ6hCo7Z0k9ECtIl3G3ogvsO3uN5YKLN3JG
X-Gm-Gg: AR+sD10x2yTFFNXALbkje+erjgesdSUf2asqyYzZIT7dMUT4r/tV8awUG8wKy6Tx3rQ
	jS/X5Awfj0AwwaksMUuUsc8BamW7lgdX2jGPpNf5SlLx1UmxRIKBrqmO9DGgsrOuqYO+/AUfbfC
	n53fQI+B9znEtAE7ZDtof98OxgLKdxV01lUPYAnT/4pU+qPcIeIxUTi1CM4N47T641FgcMYa/XW
	YJsKGkvdnq7joxKVAJsT/v5xgsM+DVAfDRVe0IaUC9J5eWvSYeI5bUUZejDRGp52I8s/ay5RvMh
	zyJfxBZC2+gWbfjN8qk3Y6LkMTyzrDEz9j8KcNnxCQBINVTIgGbTAVeVmz33CBgh2UrXxtHMIIc
	aUzT6oyboWA5DuwQB/Ov+77HfxcHu
X-Received: by 2002:a17:90b:4a89:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-395c33bd6d1mr11943118a91.7.1787321081630;
        Fri, 21 Aug 2026 07:04:41 -0700 (PDT)
X-Received: by 2002:a17:90b:4a89:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-395c33bd6d1mr11943016a91.7.1787321081218;
        Fri, 21 Aug 2026 07:04:41 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c45530absm3331680a91.4.2026.08.21.07.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:04:40 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 19:34:31 +0530
Subject: [PATCH v2 1/3] dt-bindings: usb: Add Cypress cypd6129/cypd6229
 Type-C controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-shikra-usb-dt-v7-apply-v2-1-628885fc1d0e@oss.qualcomm.com>
References: <20260821-shikra-usb-dt-v7-apply-v2-0-628885fc1d0e@oss.qualcomm.com>
In-Reply-To: <20260821-shikra-usb-dt-v7-apply-v2-0-628885fc1d0e@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Akash Kumar <akash.kumar@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEwOCBTYWx0ZWRfX20ICSegRM5Gg
 2Je1F6e22JVMR8JR9RSnd9+Su4I6Zz07WMAO8tvppYNNd8GSI3Zx5xMqzUiekfQ4j+3Txxh8ygy
 xcziTYhaWBSY5y5ex9++AK3z+co4ecM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEwOCBTYWx0ZWRfXyJs8YDq8K1Ta
 BDyJ772+aoXq8W1+ddDBk/wxb+cLnx9aNgLHMMJDtg5ihB/Baj6gKq+bKGs86iOELKQZdc9ipfI
 wyUAC/R9Qam2VNWt/lKetUScSoVXRTe1iXjFa2LxWGDMu2CNvuQPVpRCGEWN6nz4lwPFP4OumUZ
 nME7BhXiREb8by51kXIgcFkwk3HahLFAuWSDi3QjUoFG5nwdLmsfv+Ihe2UQ5rk8ZeRfdQ1GYXB
 RdW1zEp64wp2TRZBR4DiYPpPa4m6GNdXTczth8YAlDcvDjWsi8AA05cvzvCcJEyCrW4EEPHhW6j
 pdxh+2JCtm+DrO4TvFMaMhetdTUb5kWysowLApTakbKc3kPbIGDflP4liHqfugGcUcmLd8HH3qz
 fq6BC8ml0oHuYKIw9r1pXTegnZ9xzC+eGAOOnIYBHHel/ppLhNVZZeHLGCXFix+TUod1tCWcSQA
 skXRpJCrn68XR17kRuQ==
X-Authority-Analysis: v=2.4 cv=ApHeGu9P c=1 sm=1 tr=0 ts=6a885afa cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=PyXS-OjWu00qIW_W-2gA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: TtVbdrLCafEKketSpxdMdT6sXuEM5dQ-
X-Proofpoint-ORIG-GUID: TtVbdrLCafEKketSpxdMdT6sXuEM5dQ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_04,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210108

Add the device-tree binding documentation for the Cypress cypd6129
and cypd6229 dual Type-C PD controllers. These are used on Shikra
CQM/CQS/IQS platforms to handle usb-role-switch for the USB Type-C
ports over an I2C interface, similarly to the existing cypd4226
binding.

cypd6229 is a variant of cypd6129 and is described with a
"cypress,cypd6129" fallback compatible string.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/cypress,cypd6129.yaml  | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd6129.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd6129.yaml
new file mode 100644
index 000000000000..43e2c1902fd1
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd6129.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/cypress,cypd6129.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cypress cypd6129/cypd6229 Type-C Controller
+
+maintainers:
+  - Akash Kumar <akash.kumar@oss.qualcomm.com>
+
+description:
+  The Cypress cypd6129 and cypd6229 are dual Type-C PD controllers that are
+  controlled via an I2C interface.
+
+properties:
+  compatible:
+    oneOf:
+      - const: cypress,cypd6129
+      - items:
+          - const: cypress,cypd6229
+          - const: cypress,cypd6129
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
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
+  wakeup-source:
+    description: enable IRQ remote wakeup, see power/wakeup-source.txt
+    type: boolean
+
+patternProperties:
+  '^connector@[01]$':
+    $ref: /schemas/connector/usb-connector.yaml#
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+anyOf:
+  - required:
+      - connector@0
+  - required:
+      - connector@1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      typec@40 {
+        compatible = "cypress,cypd6129";
+        reg = <0x40>;
+        interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
+        pinctrl-0 = <&usb0_intr_state>;
+        pinctrl-names = "default";
+        wakeup-source;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        connector@0 {
+          compatible = "usb-c-connector";
+          reg = <0>;
+          label = "USB-C";
+          data-role = "dual";
+          power-role = "dual";
+
+          ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+              reg = <0>;
+
+              endpoint {
+                remote-endpoint = <&usb_role_switch0>;
+              };
+            };
+          };
+        };
+      };
+    };

-- 
2.43.0

