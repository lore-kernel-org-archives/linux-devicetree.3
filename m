Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002363F2113
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218026; cv=none; b=fb0cFKbfWsRjB2ZROMcFORI9+Xvw3AMm3fCOfMxYKEyrStTy7egbzudFsbdJSy15Ig6k6T3lhQKm4ADQdgoBb8DCKkHlkEL2TncFdtab/5+LVbbN7HpqtNyyegKd7m+zp7T5lZgN4ZJFn0GrABqnMs4fDi24V3t0LKzh2Txe3XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218026; c=relaxed/simple;
	bh=w79yUOdI2hQLJL4IbCf3z4kqwz8B5oITUq/IrpAqPBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GMWbdYivEBLvBXmhG8hIPe6KX7nFP/FPTMXVCK12Lhspktxjbwjem1FZrETuMae++8wkNG51Nl3TjavgBSvfobED4CyNkFniBNliu52JxBppffWSZ5XZaMMSNsc4HVZMXCPcIA7mcXlCpe60MgrDn+OElaXnfQZC8hz4MmR2WuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20251104.gappssmtp.com header.i=@beagleboard-org.20251104.gappssmtp.com header.b=vazgPwZ1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20251104.gappssmtp.com header.i=@beagleboard-org.20251104.gappssmtp.com header.b="vazgPwZ1"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cedda2ce6fso11124185ad.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20251104.gappssmtp.com; s=20251104; t=1787218017; x=1787822817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R1AhOQzF6qMwl/x9fl17N+mSr6gwpeCsEPQzUK1y+w4=;
        b=vazgPwZ1tR7UJPV5aWqeYb+rMt4DTIeMonvazbNChyGUIHfJMthoJMtSPZTXZxaHIh
         t3NcD2LWZLMLdJl970JNAbz/yr1nYDvuTKKBi8bGmUqrUtYMGhQTic2eadIxlcghvyNc
         KDF3T9kqiyAwDYOV1g+CPbMz2DDLmcAjgXL4pYx04oR/f+RptKed90ZkV4bf53mcZfDc
         4DF0EIgwIzNi4L0zpATJB7dfFLfr/X16dKuGEB/9ThRgFaq4/r8ZyOJQN/vbhLQ02BIP
         sCoCCoJ6la+8ouBZsUqIU1mOQdPP4XXDpiYum6W0IuPNi3AIgeyYOnjECiZtDoPr3sUS
         Y2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218017; x=1787822817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R1AhOQzF6qMwl/x9fl17N+mSr6gwpeCsEPQzUK1y+w4=;
        b=CbXvap5IFDlAnNqQK+N6hrdxq5XoFRh+q8z5wgEbJKx4b9UbL/9OA90NfhiKV2bSBr
         Du+3K4Xn0nDDVurI81GB3GKnHyvkVscnNCYeaRcXD4yhsZx8Nv+GLmi8TjSyZrTmR497
         o8SgOg8msjE5BFgbnsi3aShgi8OAsROnq14+KHkaxe/v9FtARolRiKuKxqOv2zQR4Ix1
         AIA2KylBTIrMu0lVsxkzs6JqrH6tAcR4RY5h6LUDVcsz84J+2HuuwDRsGu6rpgjsYfoN
         V4QKAwY+WPtmVsFlkBOdoMTX+rUFBHMEbhvkoRpFTcBuFEqEjqlbo+2QKtUtm8/mzO4M
         U39w==
X-Forwarded-Encrypted: i=1; AHgh+RqbN4cnZySvgAvM2HkIWsY9UcqUjpD/y43GTOwMYEg7eGD/+oFIt+V3dCFYVb98UJ05Hh0FVfG3zHAe@vger.kernel.org
X-Gm-Message-State: AFuF++nk7OjkaDMffu+BGhh4hJxrsVLV2v5vhIczZXt0VHkCJGsv1kZc
	GjLoDQwgXlray280lhvZicZUDhefRb4jJp1zH3ZRCadCjiu1QMpnO+gaZWgulnf85Q==
X-Gm-Gg: AR+sD11ucku0Q4kQnJRmx6BOT0iSp65v9pL99yxuPqsxHM8SaYcvNUWm7N4dVgEh3Dr
	ORgO+AGTrEl+UtALTG6fDatj7Um2UINoyBCW0SBL03uDrrStqQSpTUZ0ecnnRl95eq/iNjXTst2
	9ADzbR+HCikh1ZW0fI7scnu4og0PcGhBBq16P90fG3nD9HCvrTw9xmz9T4jlKblNHZ+dChAQVIj
	97kOQFvzP2JQhO/kvAquS7vHqsSO64FK8S09QP3ZsOzsVBRIa5Ysfkborkmpr1AuIy84Pl0G+v2
	5F+7brXfRIbcNGdWpbCXz5fUpgZzMpfKbVBZF/NuFHxDJA5bAhSAyAJ+DBAgJx45Vea5+EAYR3V
	oJ1LCnZZbP5aDwY1jMCoEkrGX1E+8USdXbRY2ePcvdpB9Vizlm6+SXtVUfga8pfzTXPJedLgGQW
	PifwDW/2HUX2+yPeXbyWjlxeUsbuB7SQSIDYapkMd7ynjbRKQ8rH/85ogy+OSaaTvPe7sxyng=
X-Received: by 2002:a17:90a:f94f:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39580840397mr21463129a91.2.1787218016816;
        Thu, 20 Aug 2026 02:26:56 -0700 (PDT)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad6060asm25903254c88.6.2026.08.20.02.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:26:56 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 20 Aug 2026 14:55:49 +0530
Subject: [PATCH 7/7] dt-bindings: beagle: Add BeagleConnect Freedom
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-gb-uart-transport-v1-7-282da14ab7b7@beagleboard.org>
References: <20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org>
In-Reply-To: <20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org>
To: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com, 
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1989; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=w79yUOdI2hQLJL4IbCf3z4kqwz8B5oITUq/IrpAqPBg=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBqhsgdk+2/YoCnAykJc4VseJbyp9e2JuEppqzLM
 dOwze3SfKaJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCaobIHQAKCRAFzvXHieVa
 dIydEACs+TOA7byKJIBq0ZJy9AhQD9KKPx8TPCq3IFCyu+RhFza/NuLVOW/hlxGBt872nBLOmGE
 g29SbEJ+IZPUE2kylIK0T2c42AwlEVuqFcGo3avVQFnuoytZZiLP/pualcCBE0ARsiFsLfTdYLV
 IV34kfl/Xq0hZLPPbjZrfE0VRrNCbZ8MhqHnoC+N4oyyop99U3KVOm6AMAEg3f/x59S0n06wFS5
 R2d+tV0YtGmnlL8mNYdKmFTlkdpN3CHbuSJbiq31XuxD1kAKJ8FqoIOMdWVbsKHP0FkFL7e6iYY
 DHeUcsYgBGrsrJhSbC+pncFA96kf+YxK8+KJN1co9oakx5K6BuX6X0ynOyzVIHY+IKLjHjIn8gI
 i2fOBiqjmH08Om+QiLzT+33bY+MvHpghAie8h19jrJvmkOYzxJNjccqUB2iKXiPUb4MqkLJYuZE
 pmi4CvQ/rY7bLZq3H+HirrPuQNY1I6VE1QNQscJ4vsNjQyJg8DaIJ5mxENKxrIZp2MG3dILDgm7
 Znyzz1+quLi8SmIy0Hc3kOvqCHTNJ5WTNjltYE9ZHdeN9mtue231kIhlz3pBtuclduahHIfa86t
 e23ZAvsQqM3gFUiDR/0m6moQhTPNJx5r6rK5mb4N8JDqAJgtGo2tG0qAhgvZdFC+ZhJ0zfRYOMK
 N68ke+r7bFWexAA==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Add devicetree bindings for the BeagleBoard.org BeagleConnect Freedom,
a wireless-enabled board based on the TI CC1352P7. The board exposes an
MCU that can be attached to a host over USB, UART, SPI or I2C, and is
described as a child node of the corresponding bus.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 .../beagle/beagle,beagleconnect-freedom.yaml       | 30 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml b/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
new file mode 100644
index 000000000000..5a246f81261e
--- /dev/null
+++ b/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/beagle/beagle,beagleconnect-freedom.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BeagleBoard.org BeagleConnect Freedom
+
+description:
+  The BeagleBoard.org BeagleConnect Freedom board connected over USB, UART, SPI or I2C.
+
+maintainers:
+  - Ayush Singh <ayush@beagleboard.org>
+
+properties:
+  compatible:
+    const: beagle,beagleconnect-freedom
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    serial {
+      mcu {
+        compatible = "beagle,beagleconnect-freedom";
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 037a87b74800..49c6dac72748 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11338,6 +11338,7 @@ GREYBUS UART NODE DRIVERS
 M:	Ayush Singh <ayush@beagleboard.com>
 L:	greybus-dev@lists.linaro.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
 F:	drivers/greybus/gb_uart_node.rs
 
 GREYBUS SUBSYSTEM

-- 
2.55.0

