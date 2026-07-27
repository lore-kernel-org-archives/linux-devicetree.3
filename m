Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B54C37F01C
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785164083; cv=none; b=BILsX1TCvaoNgasuc607IfJ9JFQNngUUHVjbbZTLfKWB5sxeeasWSHrzPKXSRYLu0yTLQdU275+vYWejOrolBg3BsGPlQgxgKDf67ax5+rAyBZJwKbQDt3mlv1ZFFOCljY04X/2uC3PKL+An8BIPn+wLdpJQdW4cLKCEuuqTsxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785164083; c=relaxed/simple;
	bh=g/zrKQ160WAN70Bn262Z+bN1bqh0zhUIFpg0ryQ9x6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Akbr9Pvx9I40PaGVhnvB+vhug5+ouM82NMBcw+/mWsTSLgd67KjMnM96oylB5XBUrO7BVT5DM+nZSRZkj0xG1hYHaVN8BhsE5Tg9cijdrMxS4dh6EjA1kcTuA4ioFEZBpHk7hHy80Pq3grxgRNVVJWWk5mHLlS5/EP4GNjCfdVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X/JrSdm6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IkUGdVhd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/JrSdm6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IkUGdVhd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDllO34035373
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8HthprQpSRunL9egCyfFegD4fPnR+j4G6f446WVy6Xs=; b=X/JrSdm602KYjvc+
	L9nVa1fERvz8MBaC8z0gTOMiI+CpTol8c1b+TZQPm24+itLBVZMgNy87NxyEZARv
	BeVQOzcNdAxyOaDDWJuKeBw2BIYFRU1Lm4soNBFTBqg90fznPuigZZ2dgbWKzXHB
	W4anzbJM86e6IxxVBRblwH/cD+cyNYWIeCTd1Md1Ktace2qQP0NFASV1EJsgM9Uh
	/BBCxT4gDB7bQixCitHugN9iLpknssjiZKtju1/6/ksbPiTadanpsunDgj60MITs
	helmat18vZXUTKgJ3odYzNoSaV9hvoSAX2nbPDiCsdjZ7tcRJu1BxeBaqaag7wat
	pX9S7w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp30g1spd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:54:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0e702df8so34326661cf.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785164081; x=1785768881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8HthprQpSRunL9egCyfFegD4fPnR+j4G6f446WVy6Xs=;
        b=IkUGdVhdhKSjvBA8FbiJXiv/cI7cBfEswuDFgioX9Q5klrhX7hf5IxEjO0RiBTguzY
         3mdK6hvTU76wohWQ2vHTb0v9WuJT5Zc4wFmtqNqlt7X0qa8M9jU58xsfQ2z+6dkdkY3T
         vhKm3spyu/qdCDmMo7q0qOpOjLnvR4FaqBpyvZXJXVPe0BqcZ5ZC4rAYSc7XCk/D16gl
         bUZJJgGnwmDnFzT1DJVmCsLV5qPiKccro4vWtdIlKBsg94B6QwHyHk0q2vSRKsG//FX9
         9amwHHNNbVYRU/aUiB3Fr2wFgQM00HxZWuBGDlhNwK11Icc01U//GJUsbje7N19KFils
         L1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785164081; x=1785768881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8HthprQpSRunL9egCyfFegD4fPnR+j4G6f446WVy6Xs=;
        b=l1QZPddyAxIk0anU/kUC5Lm+3N+Z+EgKxHoVFz2n/KZyE+XH4PJ3rBByZ+B/BonAXu
         01G4kGbYPlLzIemaab1fXh/S64QZzlcyilMvn4+QnIjQrwE/l2PGdSIFZrtfeaFDhqYf
         +s8P/34UMVQWyJhmVgfNXLeOyqtRCdxRR2+JaO+szbs0jVOfMDUHSnSGCpbN/r9jrzZ9
         rntahLq9/lQjvuI2yrbKp/ptH6D3X7FbU+IBEf8Bx9rGfEbAz5R/ELzHImnz9oibAmMA
         O6AFtPadbRvH2wFketW8zsn5wUOfPxE5/5JJNFx05P+PRzOdrL5aUQrpUJr9UX8e37fw
         qvbQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKmrFr/eAo9uZLhnKG6ZNqG87YA8a7NFSI7MMoRin5oP6u7nEW1x2rkE6iobaAG5+5jbUKkgjzg672@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Kl3pBmCxkCQKjB5Sq5/2a6K8b84CuhrYZRgFF3iQjMrjkiEQ
	bQPl7IKE4qzf5DF53YZ7Lw2NojgxVqqUncose9dNzcEifii5mYZFwM2QT+2l1pKWA3QMIFzfvBs
	y7MDpz6E74J3lQFKOu0q0ij9FyPG/7wCIymgBvWygEYsFNhUhwPn9BRT3OLVXcpUd
X-Gm-Gg: AR+sD10YlY5vq3G06DbFGQ3WFU8GEvg1ofOZqgBoFY01cBWXedHWgXHUFNkx8HliHrv
	lvJ5QnDS3JyuyX+RGkYhprV2XPIAJUGAEZpcnng+0fYtP4kPbWpXQWNAO1cC+rX73WrApiWuQcN
	yP6KEoHvIg7god8xKCUAK2xpwdS76VjstLG/iuwrn6M6zGvyZ76kL3EdlVmif6A4O4R+Qi7KkH4
	fCuI4l0jkY8OYzAQxmNuQaE5wJg4P545gxQ8DRdf5TWR2KKVcnnl82d012O+bibBZdJejy8ld7f
	TpuRGuGSqsQFu0vCEqGjL5oyz5T79pX11hds8OR8rQAuztk5UaaEbkNWZFLXhrKm+X3pn8TEAg8
	HCNF7pTM41EDql/ojGoXyNvI0VxhWaNcVayJZ09j5ZMjTbdLm7FSEuTPC7DZtAj88xnD+wq4yz4
	U/2Dz02YxxPMjrYiR9PkqtHDHu2ZcnPIDMnR4/lt78fhrKyVhrtxMn
X-Received: by 2002:a05:622a:112:b0:527:7dda:ee5d with SMTP id d75a77b69052e-529a86e7bfcmr85593461cf.57.1785164080598;
        Mon, 27 Jul 2026 07:54:40 -0700 (PDT)
X-Received: by 2002:a05:622a:112:b0:527:7dda:ee5d with SMTP id d75a77b69052e-529a86e7bfcmr85592931cf.57.1785164079935;
        Mon, 27 Jul 2026 07:54:39 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb594622asm3027582a12.26.2026.07.27.07.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:54:39 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:54:34 +0200
Subject: [PATCH v8 2/4] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-monza-leds-v8-2-6e7e93d44dba@oss.qualcomm.com>
References: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
In-Reply-To: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a677131 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=OnDUQqxwl_I-XVlDrPYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0MCBTYWx0ZWRfX/csBskhvkwsF
 FW7B5CYv9+NQEa8/QAhJGQv88CDAVGe+OedJh1i+QeOnEX94tlsw1xKUsTQdnslKbxAAv5cvNkR
 Zn70C102p0oOhNMFUUBFnwHnCD7fb4s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0MCBTYWx0ZWRfX4ZoTW7q3hFcZ
 2GucW9atoy1tOlJo2JuJHyGPufvfi//Z3VE+4rFPD38WbT0OMmrsd3Lwx+WAC2d7AmlVGmgcTgO
 o+MQeqorrq8plGi0GGEzzkbp27WZJvNunHpltVWyCXqaIqBPASwxAzyUCGXhceRW7J3ZfWr/YTr
 EaxnQw5s3BLX6H/fh4h5EZnPy4MhJzwYXXbcvLU9dQ626zo3xiu8gFmzQ1UFXUIZC3Kbnj+RX7+
 YYN9sbuujPbq+IJuy84fX91/KhhFBNX57rYgPm5Bvtq5ljRIapHGHtfba33xv34FXi+YYoytO5h
 fBaTEHNSbb7xN+CZFLoOi18p2BXKsdN6eXGsrDtNzPn0hXuIqnRz8LZcPxQPCttvxps4mDBenVY
 5rOh6IE2i9dkqBANUyVFxmOOKhs0ir2GZksZqdU6FuZTwRBBEivnIYPxhDa8SA2kZ75M30NZqv2
 6R7BERE0CopXMfiqY0A==
X-Proofpoint-GUID: cPyBfsEW0-w2ka6l3XkxiHlZ3HVTvg1D
X-Proofpoint-ORIG-GUID: cPyBfsEW0-w2ka6l3XkxiHlZ3HVTvg1D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270140

Add support for grouping individual PCA963x channels into a multicolor
LED by introducing a multi-led@N node pattern. This follows the
convention established by other multicolor LED drivers such as
kinetic,ktd202x.

This is necessary to support and model hardware setups where multiple
PWM channels drive a single physical RGB LED.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 96 +++++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 4fda602912f7a9443b8a77e46bc015e244f82e08..a16ca11f630b00325a07940d9cd2f8f47cced73b 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -74,6 +74,40 @@ patternProperties:
     required:
       - reg
 
+  "^multi-led@[0-9a-f]$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maximum: 15
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-9a-f]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            maximum: 15
+
+        required:
+          - reg
+          - color
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+
 allOf:
   - if:
       properties:
@@ -84,10 +118,16 @@ allOf:
               - nxp,pca9633
     then:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]$":
           properties:
             reg:
               maximum: 3
+        "^multi-led@[0-9a-f]$":
+          patternProperties:
+            "^led@[0-9a-f]$":
+              properties:
+                reg:
+                  maximum: 3
   - if:
       properties:
         compatible:
@@ -96,10 +136,16 @@ allOf:
               - nxp,pca9634
     then:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]$":
           properties:
             reg:
               maximum: 7
+        "^multi-led@[0-9a-f]$":
+          patternProperties:
+            "^led@[0-9a-f]$":
+              properties:
+                reg:
+                  maximum: 7
 
 additionalProperties: false
 
@@ -143,4 +189,50 @@ examples:
         };
     };
 
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@62 {
+            compatible = "nxp,pca9633";
+            reg = <0x62>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            /* Three channels controlling one RGB LED */
+            multi-led@0 {
+                reg = <0>;
+                color = <LED_COLOR_ID_RGB>;
+                function = LED_FUNCTION_STATUS;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                led@0 {
+                    reg = <0>;
+                    color = <LED_COLOR_ID_RED>;
+                };
+
+                led@1 {
+                    reg = <1>;
+                    color = <LED_COLOR_ID_GREEN>;
+                };
+
+                led@2 {
+                    reg = <2>;
+                    color = <LED_COLOR_ID_BLUE>;
+                };
+            };
+
+            /* Remaining channel used as a plain white LED */
+            led@3 {
+                reg = <3>;
+                color = <LED_COLOR_ID_WHITE>;
+                function = LED_FUNCTION_STATUS;
+            };
+        };
+    };
+
 ...

-- 
2.34.1

