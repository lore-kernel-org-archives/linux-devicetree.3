Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505375;
	b=iN5cFO8DMEHCvyQsITjnCgdZdAir3ZAE2Jfb2HZObzbTEXjafSkkAxqPC2zbVasb3OkK
	 rEpJeajCEfqWNtNd3lfdSG5RkxVKRACmnxetUqQ4E7xlIJ6c1OxQTRdMKI5a452p55bPS
	 ccbdL9JG/jn7ajH9HLImx5dklf89ICxWU/qBQzaKV2JLtfHqxzHIgCSBcQrG3vBififzO
	 /jEnamCBKj1rUhBjVbbmUrXDOIoiz9vtbK4EV1JZi4b+gLkDTBlgBlJZFbOCduXUFwjOl
	 aTT1p5Tw1iNfaFbvUEd5x84/6d30Wq01SDFlVZc4zwK2tZVYJLZclXOF0PiZr0c2yVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+ZuDPiNOEfTjl2w559867HRmVev7pbLSM2ATwOtUNZA=;
	b=mT+ipL7533jdo8IqHVvtyjO922ekMGaCcHXXRRX1nMvb0qtMtiC9c8jA/O1OU2FcPP2x
	 HmnIz0HXNHNfpnT///G16dEue9AEGKaWDuRDv9ovlQUR0o1jYX9QQ5jzYtL4eG/urcT4K
	 QkBtd/Osx8DfHMP2Vf6oCvOFFxQhiT470voxdixz9Cf0m8VdV+k8xRimUEccPnX3GPz74
	 KnTF70nGVe7u6kq9qzf9xlSqbxNJ8ZYXF60gwu1Y01mXzHR0dGFPZ0DMkfhFuF9xNa+6b
	 Yn/1PESlkmo0V1VEu22hoR30BLvMNhDISxDou8nEJrJ1mKiXAUw1QQ8nDs5tW32XayA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EmJH+tlV;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE0E606A331
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 07:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CE0E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EmJH+tlV
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso1930109a91.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 23:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505374; x=1796110174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZuDPiNOEfTjl2w559867HRmVev7pbLSM2ATwOtUNZA=;
        b=EmJH+tlVZK1LsNPWfFtvfDQRHW9875Cvy2+LpAGhSKF/UW5Ul7DVuQGke9zI2N0EL/
         xCpTUDfa2rLqSClt+IhND/C5kpdRpxd+HEFK5HF8Im5vabKUIs+ewpNc/fkBulTj3uN7
         orQFCQvdETNvxubYS2GSKxDRlg19aVA6BwzAOT5UM58Y3bdymlQJKYmKkmKXATlmv4io
         bd0ayc5DHPdNT8Lgc+YMp4a34wBqS1onoYJEBtvNIlklOFlABTiEL05CvSi8slaC/NI6
         XD5UfaLI6kNx2p2xvdwuWGv8k+QorqBc0sXxcalYQei8NkbQC+pg+AfQapNiS4VbaQck
         QOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505374; x=1796110174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZuDPiNOEfTjl2w559867HRmVev7pbLSM2ATwOtUNZA=;
        b=kszqIqcLDz9QI2DfgBNPWU9XiNo3Ja+hQmf7seduCrsiQSfZnkGi6jtR2/5gTPYaol
         nxX46shMR26+/N0rhf44xGuXfoAljYKMUe2Asat6uTZYjFAzDTSXAbch4m3fAzSCU2LV
         8mge6whz78TASqTz0gWsDNNfIS3xzPd2NaFGQUfkOF/Ibf6lpt9LRmFxsqyI/vK37X9T
         5MoB/cepvkd3Dii6jKfISnD/DXbFmkt2RoaK9RGL4/HPSA6ShhR/B1B2G9RpsY/wn/lx
         I2TFwCmUPHgQblV2KrrzSNqvJ42jJn+xp+VVnRRcXiA9Sg1EhyKjlQtcEG1Q1X1AvmQj
         idHg==
X-Gm-Message-State: APuU4Z+B5wonBZ+cBBbIdFjJ+scsqA5dktXBPw9C6Wz/sqhRhZG76XAZ
	X6bfpfmbJBlxKj6pNMlDvP3AbDacowZQtYUOHRNAiUKWbBLwG08L86Sl
X-Gm-Gg: AZFdTZeR8n2qtpqrpKt6Pb8qhY48nXGK0HBZDHnCYn1s08zfZ5ied0RTApFEyJKDvNv
	iHc0lnE6PIWszO2hIa4AFtm9ubck21dVhM3BnTAT3BHxfXtlvA8hJetLBVEe4vfg7BPzNnlT2gL
	1rYrUvQjy5yuYV6ApvmtFRlTfE3W8PQ0oTgtaTtl9ED+bMmcYfJ5uvT2++/faTF8yIWmdRLhKXf
	MN6SGum8bZLPP8gKuKbsfOBPDkFAgOLrkTf+/Kb1Q1/HEX7FRf4tR8u9Qv/ZfkwbUnCwEbCzgwp
	9lptzZUql0Hju/d3ZoUcOnlx+9U7fRuyYfks9pE+9ihK96ybyA1AqFHrbvs6mGU4Xs8/9GHRQqJ
	pyZnn5Hta7v77e3jgzjT7kb27drTnO6wtvdUR6Kbn+14/9hCQ47LD3ncvXCFMPYn6KgXG1UFuoq
	HBqhTGXPOaF8AOZJs3rd3rz7I+THZuWBNIwFVAkdatgJAUOR6av/591XOyLlKJ9EY8czN2jgqvE
	EbhbkZrRvJ6neK+C14pUe8W3JIrsJSnNj7/tdllTwroX+xLdPPIFf3Xok6z7HxPz7Ret0BAESzj
	wkIksHdUe1SOGcfGqWomKQEPvbY=
X-Received: by 2002:a17:90b:3f8e:b0:3aa:412f:b0a7 with SMTP id 98e67ed59e1d1-3b41c7bc85emr8885243a91.5.1795505374392;
        Mon, 23 Nov 2026 23:29:34 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm8759683a91.0.2026.11.23.23.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:29:34 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>,
	Hangfan Li <lihangfan@iscas.ac.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: nvmem: Add SG2044 eFuse controller
Date: Tue, 24 Nov 2026 15:29:21 +0800
Message-ID: <20261124072924.556678-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124072924.556678-1-inochiama@gmail.com>
References: <20261124072924.556678-1-inochiama@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sophgo SG2044 uses eFuses used to store factory-programmed data
such as ROM patch, public keys and other factory information.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/nvmem/sophgo,sg2044-efuse.yaml   | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,sg2044-efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/sophgo,sg2044-efuse.yaml b/Documentation/devicetree/bindings/nvmem/sophgo,sg2044-efuse.yaml
new file mode 100644
index 000000000000..c87e028dc557
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/sophgo,sg2044-efuse.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/sophgo,sg2044-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2044 SoC eFuse-based NVMEM
+
+description:
+  Sophgo SoCs contain factory-programmed eFuses used to store ROM patch,
+  public key and other factory information.
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    enum:
+      - sophgo,sg2044-efuse
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Core clock
+      - description: APB clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: apb
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    efuse@40000000 {
+        compatible = "sophgo,sg2044-efuse";
+        reg = <0x40000000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        clocks = <&clk 0>,
+                 <&clk 1>;
+        clock-names = "core", "apb";
+    };
+
+...
-- 
2.56.1

