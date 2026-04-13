Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242273932E1
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065123; cv=none; b=Lmai5/lMvAWDyOfM2oQe94KARX67My2AipJx03rVU7igGaYJr5uoC2LRhg9xiovJBDyLNxOWd6ae4ny8/Kdyh8RIB//9J+7WNbCdJcW2iSTF6wKUlXn5KKJfGFb5aqgVSALz4x82UmN60fsOmjbhFqU5qz3wy4eI3a/89V6Ed7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065123; c=relaxed/simple;
	bh=VLqXlHYEYj6QD9rr227aPs6s/WneA13bYBUQMaGOG6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JLijeuWzINDFa439pNdj5H9uriAW2Hx27Vb/ndK/D5DhtyuuTYowo9rdGdLzCjLAKXdAIGCwqKIGSrERzs1XcWW/vvyJdZ8l/ibJXTfz4ydF/9T2A7pP/chZfEAsjge/ycpn03p+ZSedWPa3vFAm9NfAGRH/MRBL/4gUnQCSXrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qUZWHaNz; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qUZWHaNz"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d7645adbdso447186f8f.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 00:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065120; x=1776669920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luHrHS8xuRmiKOe/fYmQbUMhMu1rL/RwOqTb1rEgANA=;
        b=qUZWHaNzOYCo9S3gJJOnPw1JKkCD10LMnQwp20dAy9KClNv9LqKw4kyAg+MQKrlFnd
         gxiEmXLuM9CnLTXwCmJECf6Etu5+YV7zbqIRqB+f7BOjPl9zuv+71Ec8x/nsaUuvU6jg
         WT/7YfemV/GfmCKqhWFFwofM3C0ZzwX+sD7fVBM5M6NGfmH0XvPpczi95KNSMBcf7KRE
         Z038rZ7ymo3s5ddLCQQ1h3n0z5wWQ1v/VloVgTS9wCsK29PYXBJbiqddzA9euKX19y6F
         d0Co/qWqmGsbYu457XRlSSlg8+bxPNwgXdLcSBtkjBz223u9X7OBOoRgobugLrQ4/S7u
         08KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065120; x=1776669920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=luHrHS8xuRmiKOe/fYmQbUMhMu1rL/RwOqTb1rEgANA=;
        b=ljtmDJdciwLmoC0MKEhfhQtEQxC/9zSJXToWdBMW0ZQ+H7D5/HszRQz/biajZgNhak
         NR3K5QLUOfPl8b5t5thfvFSOTTYSdQwNT3yGg2v4DtL+s6CGKK6hWwNbH6WmqNIYY/C1
         +3YFmUnlZD8YlW3DiIJXqMop0gQiAQnLovrMJIusASCQhgF5PNrihVIh/ZLdYBPVodn8
         pYofrEbvS1kml9fMVoTMf12CBvauoNTTcd9FUPCduQLO4TlyHg1I/xrTAn6grRbB5YYp
         Bj0Pc1o0BVnzP0cg+U+jO12cMzAEzqLM4rG86Jzv5pjdxv9yxEbpF0SrKHTqsjCE0djZ
         zT9A==
X-Forwarded-Encrypted: i=1; AFNElJ+eqyMw+2rg1fGUavA09KAFiJzukUFW6vZJYU3Su3LDCxy8X+3JPKlk0MWzY0E7+H43HAoKBdfdAtAx@vger.kernel.org
X-Gm-Message-State: AOJu0YxwTz5FUQ/2LgEWJvmeRkWu1R7i7d2jXR0+o0dUkWQgIUx7QOHU
	aoTJo+VLhv6WWc6smpfvpklOo5SUEpPUeXqrUxku5KhCD8QmO5gibwbu
X-Gm-Gg: AeBDietNAz+Oh72K04oD6U68KCGJl+WqYwY7BERm5A/N+5+wVqRHICWJYVcTa+echOK
	PwBFykJ2o1zYfzNskiEpJQxMiaoimf5D/xwRb8Af3cc32/xUD20BHXO7A/vXDMhHrY7k6Hu9ZkS
	kZIkYrKRZ8UBrSIKU+fQRaoH9G/r8AZ4X2Q0Nc6gLzJRtYno6WN/lSSb98inTV/Jh5Eb/NPsRtO
	0uJ9Gr3HkETqf+Yeh7xqHHeTxc3TxEwuRBUppiur4aNAufK+nUOawsnoU+a9vIVsDtVsEYaf4D0
	ObsPM/kVtmUacWpT67yfs9zJPFJvzFYpXbfUhlSIUCIawMLgY6ZDFVOcI9bsOFWq+QOSnVYTkg2
	KyHUqbS/STdAc+lAKiYUhAyh9W6x8VwAklxnncSkMYePdjEwyyY5n8ELcY+yT6PoxvwFHf7Vk0U
	vmiCSIgN7NSRpMSiOsMcA49Qx41sYV4wWdXrYVPzNwbauMKXtlgaUceHe9LEkgmDN5
X-Received: by 2002:a05:6000:24c3:b0:43d:762e:76c6 with SMTP id ffacd0b85a97d-43d762e7865mr5391556f8f.7.1776065120340;
        Mon, 13 Apr 2026 00:25:20 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7d5812dcsm330441f8f.32.2026.04.13.00.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:25:19 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/9] dt-bindings: mmc: spacemit,sdhci: add pinctrl support for voltage switching
Date: Mon, 13 Apr 2026 09:24:43 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-1-16650f49c022@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
Content-Transfer-Encoding: 8bit

Document pinctrl properties to support voltage-dependent pin
configuration switching for UHS-I SD card modes.

Add optional pinctrl-names property with two states:
- "default": For 3.3V operation with standard drive strength
- "state_uhs": For 1.8V operation with optimized drive strength

These pinctrl states allow the SDHCI driver to coordinate voltage
switching with pin configuration changes, ensuring proper signal
integrity during UHS-I mode transitions.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
index 9a055d963a7f..34d202af909f 100644
--- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
@@ -44,6 +44,18 @@ properties:
       - const: axi
       - const: sdh
 
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: uhs
+
+  pinctrl-0:
+    description: Default pinctrl state for 3.3V operation
+
+  pinctrl-1:
+    description: Optional pinctrl state for 1.8V UHS operation with "uhs" name
+
 required:
   - compatible
   - reg
@@ -62,4 +74,7 @@ examples:
       interrupt-parent = <&plic>;
       clocks = <&clk_apmu 10>, <&clk_apmu 13>;
       clock-names = "core", "io";
+      pinctrl-names = "default", "uhs";
+      pinctrl-0 = <&sdhci_default_cfg>;
+      pinctrl-1 = <&sdhci_uhs_cfg>;
     };

-- 
2.53.0

