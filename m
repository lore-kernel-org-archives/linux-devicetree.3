Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201087;
	b=Nq89jsA+inQkzn+NPXM2z1/EszwXeuJkSkOd3z6VXLmotB08vs9vSJnPtGfmZLcuNVdE
	 wMbs+vgwDE838Hpt6qMjd3BbXNRpvaxFZIfXLG8Mp7gETyNaPeoBX+1Vxyc/Z+p7rMTbX
	 HUtLwQAXY7SSL25/xJjaaCYTR4L8+5lBC5cFoEmt1Ntrpm+RuwJ7odF36Wa6G+ncRH1oG
	 fe8Jz8yeI1feKyuU9F300ykuvYEFygmDpDIZysK/r88aD4Dh1h1I1e62+KiQxPkX4XkSG
	 k/0/s7huxNff+WwE9CfK6+FRN+8x1e6+vn/z9s2pWft5bqK8a4k+LLpLRISTVmRLX6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=E5rfszlHLd8JDdF+Yl/0eyAbCVz/g6JSQG6eBITtUcM=;
	b=3WuU9reiZqYOEOfbQc2sA26UB0G1TmrMNDGAz5zNkDM/f7bsUYs0WgoJiO9bQE3i6i5f
	 3IEZoDa1/s7W8q7Kj5xe5Ei2TSAdMp8QYXxwzXGJdtHijW+MafbgcEBaZduQ5zXtjlKGI
	 0o2+WCssfoyuth044fS9Nr0sQwPkOZ2ivmUoJks/chmXIp55DKFLJYLH1EQpwd6qKD17j
	 quK2iK+AQkY81ZbQ8lc6/yImwsB9YTxbvWYQBiBHC8MxyPXC9vXXSxW1pX6jH45UytOI6
	 bs+pcX2feWt50Z/mAKKuk0XQnfVuI8omwGxnpqUBbmqOT5gSJKJBYj8oI7zdf50SiTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jms.id.au;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AjB0wzoH;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85AE606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 05:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D85AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AjB0wzoH
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so235326a91.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 21:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201086; x=1794805886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E5rfszlHLd8JDdF+Yl/0eyAbCVz/g6JSQG6eBITtUcM=;
        b=AjB0wzoHQuccLVFYpc2mPVSSpx63oU2LnEF/uO11gSZdt+/BLL6+BpL9nyYTXixGIR
         mJmfDYfCNbfryTpt9IX69YHcbt2b+ksANMIhBH9QF9/8FvZ+OCGE65d/RWgo6O0fQMtG
         QDk2nPi0GZYV3s+hJmppjsbFpiBeNkiQjPGvIrSpVLbybYJlo/kdsbQk/igVPyyoNFNT
         qIrvacnE8JXyrHusbg5hkjf9aQQYJbsvu1lDdcqnpGXA1uqVEF/3jhcUrxOfVGej4Ljb
         tajqDN57Ju6hm6Y1Ajgjqo/2RIhfjYOTYUcUd57Qt4P0GgtmWO3P4rCp9Qp4Wdgi2ZWR
         y/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201086; x=1794805886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5rfszlHLd8JDdF+Yl/0eyAbCVz/g6JSQG6eBITtUcM=;
        b=DAznuTXFzCl5SBaC0An+p1yvcc1RR9NTCZD9ga6QOPS1nzb8XtFoGh4BEj+zhGVsv/
         uauwD68EULV5+9psZsTev0Gb+dcvWYLibWh+MJi1x4FngF8Qrh9gKOtedA0qE+HdRag5
         pSbyDNxTD4LX6quHywA6mgq9/V7ZnhhwWFqnljS0wGwj1Z4cc/BmsrfnP4c/qiIKbt3j
         NSnqJ6mHeJvUL1yRa9FqQRIoOk5lynS/Bk9wwZeJHw9Ia5o5ekdtuFrGGj17QOLUf4w1
         tmINUkxeZiF3YBpO0PSTpkNwFY7VXrS9rkJswXKOPP5NxiSW3czNfDRnjR+q3hVOAny5
         dMQw==
X-Forwarded-Encrypted: i=1; AL+hErHHy9GyiLTutUzehVYIR5Y3mPCTrCkmz1sMe0YwFyUUQIX6M0q89UFHITETJq0lnMdqDhZ1oLBj2z2V@vger.kernel.org
X-Gm-Message-State: APuU4Z8DjuzCpyO0hGHFEFpp6dlPZJ+UlNtxAe4AgNzQFO6BsoUYXGBC
	wIfrOnN05Jh7b/C+/rI8F4QszPKmI/0dT7HBgNaQi407LJivGEHgODhG
X-Gm-Gg: AYBFou3C7k6RTFZQmsod79bOjDWvv9yr7BG5VGO2vGBJ3B4eo6gEhD5yn0fm83A42gr
	mexQxUWMXxr00LOvN5U5xrNsHBlDlkunDtI9LPl6Uy3UkYlCMwyVcK9BpXVZXw+48EGKNm0TOmp
	U4YyCHuLGfCysWSd2oa84Neo93YvvbSqD79gpwNRF//aeC7OOb7czI11RjoRnSQu9HZ40jUgFv9
	KX0mX2vcywyjgDu4b3Wd4FgNa70YIq0iniJt9OM/X1rL0NJnJgNOXVX1QyGPIiKdWa9ome1rda4
	XzqnCLea3DqTdt3rqR+NuZvaB+2/RCKfHfHUre2kgvEsSzDMOl+Il2E00CQoaspoQgvd5jFVVpm
	lomRAsGIAvb7Z1K6FeDv3yQ1H2Tfo1ucTrvKAGAgCUv8Bnue9YHN6OobEZmAOcF3kFpiFjftUSd
	64nssdl6ezT3TK4L7whPHlyclGBRoVWijWDmcjHa6afaeioTpMCR1QO4MLi4ha9K6gHCem58yHx
	ZolGIOyYRJxcfQR4VFMwgKLTOeifHGWYbz1iNo1uZddwnFFzqX6iA9LiGnjz+Bkk5VjVZYS8Q/5
	admfPzAqadvfuTITENqgtECmT9f3S7x5RcCxY9oR/LfeXZf0rK3daZ9B1jc08dcG9taKSeYoTJ7
	bxnoII9f4CMjrusachdz+xFB8ZP2re3IxuElgmK2/gkBJ8oguGjGiNgJtug==
X-Received: by 2002:a17:90b:4b0f:b0:3b0:9984:18c9 with SMTP id 98e67ed59e1d1-3b12d2cba5cmr2763825a91.11.1794201086140;
        Sun, 08 Nov 2026 21:11:26 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b12790befasm5247652a91.13.2026.11.08.21.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:11:25 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 4/7] dt-bindings: timer: Add RISC-V ACLINT mtimer bindings
Date: Mon,  9 Nov 2026 15:40:44 +1030
Message-ID: <20261109051050.105623-5-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109051050.105623-1-joel@jms.id.au>
References: <20261109051050.105623-1-joel@jms.id.au>
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

Document the RISC-V ACLINT mtimer and mtimecmp hardware, as described
by the riscv-aclint specification, commit 4e570bfd3201f2 [2].

Multiple vendors are shipping silicon with the hardware as described
by the specification, which was abandoned[1] as a standalone spec at
v1.0-rc4.  As we have multiple instances of hardware that implement
the spec, the widespread implementation of the spec is de facto
ratification, providing a stationary target for the bindings to document
and an exception to the policy of not accepting things that are
pre-ratification.

[1] https://lists.riscv.org/g/tech-aia/topic/connections_between_aia_and/107177435
[2] https://github.com/riscvarchive/riscv-aclint/blob/4e570bfd3201f2c09e5afd290b5091526b0f099a/riscv-aclint.adoc

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3:
  - Rework commit message following discussion at LPC
  - Add reg-names, rework description, fix example
---
 MAINTAINERS                                   |  1 +
 .../bindings/timer/riscv,aclint-mtimer.yaml   | 56 +++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..403875d5932e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24185,6 +24185,7 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git
 F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
+F:	Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
 F:	drivers/clk/tenstorrent/
 F:	drivers/reset/reset-tenstorrent-atlantis.c
diff --git a/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
new file mode 100644
index 000000000000..e6f3d08d4f93
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/riscv,aclint-mtimer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Advanced Core Local Interruptor (ACLINT) timer
+
+maintainers:
+  - Joel Stanley <jms@oss.tenstorrent.com>
+
+description:
+  The RISC-V ACLINT specification defines a set of memory mapped devices which
+  provide timer functionality for each hart on a multi-hart RISC-V platform.
+  The mtimer device has a single mtime register and one mtimecmp register per
+  hart. The specification is at https://github.com/riscvarchive/riscv-aclint/
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - tenstorrent,atlantis-aclint-mtimer
+      - const: riscv,aclint-mtimer
+
+  reg:
+    items:
+      - description: mtime register
+      - description: mtimecmp registers
+
+  reg-names:
+    items:
+      - const: mtime
+      - const: mtimecmp
+
+  interrupts-extended:
+    minItems: 1
+    maxItems: 4095
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@a2180000 {
+      compatible = "tenstorrent,atlantis-aclint-mtimer", "riscv,aclint-mtimer";
+      reg = <0xa2180000 0x8000>, <0xa2188000 0x8000>;
+      reg-names = "mtime", "mtimecmp";
+      interrupts-extended = <&cpu1intc 7>,
+                            <&cpu2intc 7>,
+                            <&cpu3intc 7>,
+                            <&cpu4intc 7>;
+    };
+...
-- 
2.47.3

