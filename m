Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D809E47D444
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 16:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787070608; cv=none; b=gWOVEycUW8OaorOSZpLrKqkpWnHGumpvHYiwXSNEIm4E9ynjT8OXiyDKMTsOtgM3WY5oErpNAydoHOlAs/28HHgKL1SF9hJLb4ZOw14DNcjqbo3OFByUFYhv4dd1p0SoyxAsdgr/nNaF+xrz0P4O0k2GZWodDb6KVIUchx8nxOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787070608; c=relaxed/simple;
	bh=g4k2aXYIo36Ew7H+TbCS3tO4JFkwuDU+c0fAj98kaJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VzvqAL9E/OuvUvU4ATlTmDiQxybAglOdm1gVUbmtQSbn/IgBxB/KypW9Zs1tTQp1BfPch6vMWLuPlxWOSPntcxr2X6kVLO67/gh2ykR9q5UM8eJIRSCEr0wg1/k07h57rsntzxEJpI0jh30UhazkrRMP3tu/j7OskGMSUt7joDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SaQ7yg6j; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SaQ7yg6j"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-381f03d7be0so15868a91.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787070606; x=1787675406; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YvzMbI7ll7PZPIXTGV6gvIp3oWnAUf7XykW0gyPpQS4=;
        b=SaQ7yg6j2UFtOih+VfesyyPuegnxgXN//1NGXl1fPYYjRP/7BazgXFWY017s47+7+f
         E2t87xnoL3d07zocDpxK+XHpsJmDh1SXnZ/vfRtmjUZYpOKRpTkD/zMkF7vgeuvYnX8K
         Ar9qTT7MkYpoyRuxFjB38+h8MsIjyQXR1kR2MZ7jwYS7uAXpH+x5LF1iE9g9vZhdwWf+
         iy+FVlNTnHRyctxzVBfdbupPqeSKj0Arhd4Xdw/DX5asbzJWZ4fpjK5HAjjhC9lBbIoD
         pn6Nkqp6hMX332Rkt3Dc/S7KAGKpSrSuWZ6xOWRebGgpUCCm2h2iEs8/EEAIvirnOxT0
         aYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787070606; x=1787675406;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YvzMbI7ll7PZPIXTGV6gvIp3oWnAUf7XykW0gyPpQS4=;
        b=FRdPOIViQsdNVSNI2+BdDzDwoPXwg8VteYGOuUeR9ZQu6VUiLWFH1ZHM67X9QyHFp6
         7VBFxuBZzI4IXDfaLVteZyAksaPZ2ALDvXdo1aNhMeENjbvZmjqVclwUJXd+oDFz3dB+
         FFeyPRl+ua1B5Q5PBdFAIYiQHli+qxop3tVMilVYrKi1Lea5iVt2RMbhvLBAywjHv5+v
         Q2FzplA3QDMAy/tMw0+MVVMIEOciDMA91rg1dBnTRzJGwVACGLnY+QLniXVAwuBJx3ym
         kc3gufujvvrbDpXcUlNP6csoskbqd+nQHAD6ZAO7QBf3BMi9WZAcV8AXTnzmk4aVFy8C
         poYQ==
X-Gm-Message-State: AOJu0YzknzADoH1Vgg+9iGcv+MvbxCdJ+W3jATybC8c0LEs1GScE45+q
	0shHHbn60TAFcidG2LjPBB31wJOfzaYMrxUOiGnI+NQ9ksxzP5XtYovm
X-Gm-Gg: AR+sD12oplsahe7rtOcOOw5jSDUgeBkHbMtvIv/SlL81VICPTX/1SPzPp7XWMAHJd+w
	IKzFzVBzpGY2ikt78z3fsJ4Iccmtf/CpgBFwNAGU0jxRubQa5tiUVpTIYKXbCeyJ4yv5fifhHA8
	N3jdjooITBN0mko8mjYOUeoCXaq0gqCyqjmP+1ODOhFTdKQBlmKu+1YwYVGZmvNsD24PZjrxbpw
	VV4Ilw0PaaE6SelptGWCKxSe+c7o/LyWjOc3tjgpMkecwv9ZPpxxUqH43X4VeMfqb0hvuvKLFQd
	S3P6CYfKwqrXANNqc+nt1UpSWxzx4YjJemimhHXdfB2GZwc9QTrgzVxhJvtbCd2OPtYJ2z71oH+
	nFVannIT5qJFg7aBYeKGRfL8ag43DKQ21FXcFeSVHL7504GJ9yS3y5lV7cp7QTnlIC/Lz0rK1ak
	efXbLmm0+9mxJKenhPfFaHTIDI99TQipJYCtPKnMrHvjob32oKDg/ksRHxzLe/YnZhKfK+/OhNc
	N6Akw==
X-Received: by 2002:a17:90b:33c2:b0:381:77cd:38ca with SMTP id 98e67ed59e1d1-3933b93d7e1mr24719543a91.4.1787070605952;
        Tue, 18 Aug 2026 09:30:05 -0700 (PDT)
Received: from [10.90.163.252] ([2409:40c2:501a:6e15:dc3f:c23f:e55e:d03d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1415315900csm18371147c88.11.2026.08.18.09.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 09:30:05 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 21:59:49 +0530
Subject: [PATCH] dt-bindings: bus: ti,omap-ocp2scp: Convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-ti-ocp2scp-v1-1-9d2885011cda@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0ML3ZJM3fzkAqPi5AJdS8NkS3NzU/MkE2MjJaCGgqLUtMwKsGHRsbW
 1AF0iTuZcAAAA
X-Change-ID: 20260818-ti-ocp2scp-91c97757b432
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787070596; l=3975;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=g4k2aXYIo36Ew7H+TbCS3tO4JFkwuDU+c0fAj98kaJA=;
 b=mJwfFyhMg+o/Fsw6yGOkg6Xs+hEYivYwjW4w6BWXFxJ1vE9pT5ZaF1V7cYeQumqsmv6pdeI/K
 BfST8/Pt9bCDDIia9pTwXEknpWOXojCl+/9wc6vWIvj/23kTAeqvMM5
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI OCP2SCP bridge device tree bindings to DT schema.
Changes during conversion:
- Add list #address-cells and #size-cells as required properties.
- Drop ranges from the required properties as it is omitted in some
  existing DTS.
- Mark reg is not required for compatible ti,am437x-ocp2scp, driver skips
  fetching memory resources for this, existing DTS also omit it.
- Mark the ti,hwmods property as deprecated.
- Set additionalProperties to type: object rather than using
  patternProperties`. Since OCP2SCP acts as a generic bridge/bus, its
  child nodes represent various PHY devices.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/bus/omap-ocp2scp.txt       | 29 ---------
 .../devicetree/bindings/bus/ti,omap-ocp2scp.yaml   | 74 ++++++++++++++++++++++
 2 files changed, 74 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/omap-ocp2scp.txt b/Documentation/devicetree/bindings/bus/omap-ocp2scp.txt
deleted file mode 100644
index 18729f6fe1e5..000000000000
--- a/Documentation/devicetree/bindings/bus/omap-ocp2scp.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-* OMAP OCP2SCP - ocp interface to scp interface
-
-properties:
-- compatible : Should be "ti,am437x-ocp2scp" for AM437x processor
-	       Should be "ti,omap-ocp2scp" for all others
-- reg : Address and length of the register set for the device
-- #address-cells, #size-cells : Must be present if the device has sub-nodes
-- ranges : the child address space are mapped 1:1 onto the parent address space
-- ti,hwmods : must be "ocp2scp_usb_phy"
-
-Sub-nodes:
-All the devices connected to ocp2scp are described using sub-node to ocp2scp
-
-ocp2scp@4a0ad000 {
-	compatible = "ti,omap-ocp2scp";
-	reg = <0x4a0ad000 0x1f>;
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges;
-	ti,hwmods = "ocp2scp_usb_phy";
-
-	subnode1 {
-	...
-	};
-
-	subnode2 {
-	...
-	};
-};
diff --git a/Documentation/devicetree/bindings/bus/ti,omap-ocp2scp.yaml b/Documentation/devicetree/bindings/bus/ti,omap-ocp2scp.yaml
new file mode 100644
index 000000000000..a8852185144d
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/ti,omap-ocp2scp.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/ti,omap-ocp2scp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI OMAP OCP to SCP bus bridge
+
+maintainers:
+  - Kishon Vijay Abraham I <kishon@ti.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: ti,am437x-ocp2scp
+          - const: ti,omap-ocp2scp
+      - const: ti,omap-ocp2scp
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+  ti,hwmods:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Name of the hwmod associated with the device.
+    deprecated: true
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,am437x-ocp2scp
+    then:
+      properties:
+        reg: false
+    else:
+      required:
+        - reg
+
+additionalProperties:
+  type: object
+
+examples:
+  - |
+    ocp2scp@4a0ad000 {
+        compatible = "ti,omap-ocp2scp";
+        reg = <0x4a0ad000 0x1f>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        phy@80 {
+            compatible = "ti,omap-usb2";
+            reg = <0x80 0x58>;
+            ctrl-module = <&omap_control_usb2phy>;
+            clocks = <&usb_phy_cm_clk32k>;
+            clock-names = "wkupclk";
+            #phy-cells = <0>;
+        };
+    };

---
base-commit: 0f23d56f17fdfc7db69d51f64c8b91bbab947aa9
change-id: 20260818-ti-ocp2scp-91c97757b432

Best regards,
-- 
Bhargav

