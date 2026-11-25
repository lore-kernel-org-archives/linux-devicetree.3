Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614756;
	b=nImL3sDrQvvaAUgbMs4AuDpkpdFPeFkyn40614jJIjrX/u3Q/4yPGZ3e1P2q0lcYb22K
	 ubx3TN01cF1EPVVwvE6E8O30KXACKV19rSOeosg0ujvjOVveaYjO6SAw7lBV+gUU7Ujrm
	 ShIVmpBcEjUWxlc5l/As/S4Cn+MRhHpjbz4/+I+m8XnlP5BZmGtyqBp8mSppOlzhji9xW
	 Xy+yrxSUt34/yV9ATylJzyIIcBXXCj6fC50ODAM7QTURSC9XXvxoZShv8eDi0+rdCsfep
	 +dZvNjTbEJvZb6HIk4cCcbA5/MkW5MmWGbPCbJMa9I9yx0VjftZzsC88Km4WbAZRNNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CvTqFO/9KuL3qNgchwfE4HWhvbAVhX6VqEBAJl1To8c=;
	b=bPgRfCjO5LG7Mczo342pa/G6QeDUnH2PyDTJlHZ4CaBs8Gxd8o2yaAHfba2YlXCkscRs
	 ouPvB+G6MvE/0kLC/STlYee+eihrulGhUtDypMiMt5PhzAvzCzP/OGeJOZepO9Oej98bb
	 70T1+/s7KQogr/Ntg9tBRGSs0a++rAnRBj2auXI/uN0lawZ6cyW3CGwxQa63UCtd+7qFL
	 ARmflsGtuzIsKMR9fysJ9/iOsdyxEfgTlHEz7hOE1gWF2Csrc+CxOSjUDUBLMDYW2mIrz
	 EZQAKoQL1mcYYdTtS1K6ebF3WAFZo/N8ay9aEHhb36c3TFiIJV+rv5jRqVj8NuBB7Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tKeXOprt;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1C7606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE1C7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tKeXOprt
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso5112333f8f.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 05:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795614754; x=1796219554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvTqFO/9KuL3qNgchwfE4HWhvbAVhX6VqEBAJl1To8c=;
        b=tKeXOprtx1Ujd8UMEBf52l6al9otGYsbPqjznhOI+j3/ue+g+XVC/7nZ8tFEEC4Zr9
         HhRroojYXR80WrVwcGEqn7c2VSHArfIfjph8d3g1i0hFcEkAbEhZgV7cfz4vyjbuJIIf
         FrEF1FartKqXLYXjdkQmaQesuPGyvRsOrRPUW2un6brYPuAmJ2xemdNBwdYspKuKysGw
         Q3d4b6jVFJjtcDxL/AstQbZ5vpu85viWt4a0EVCJ2M2pcPy6mKkAAd23Zg7FRNpUKSGf
         16q+ljEG4vCu5YmFIICJW07N7ypoX23TwM0NGIBZZqjRjMb7G9i7Ooe/oijCHnxfM2rq
         H18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614754; x=1796219554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvTqFO/9KuL3qNgchwfE4HWhvbAVhX6VqEBAJl1To8c=;
        b=xEn9+qUcP09F7BiQ5nTQlWAaplWv62mXa0WlbiaC0tnakf9F0rrIoIvOn31jR7/dlC
         7vHRP9wO/HHAtRQbvLJwCL7SBO74jEV12uAqJOSatD9V8xI8I7M0K7Q4zO0tr5Yl2mdo
         J13YRti8Dv41REj8Z3GZUTk3M4fH30a++0KoWnxuSxcI10BHLFlJEV/TuZKLM7AaWuzn
         4eRdXDcSpqcUG+uDPKTB03iUb4pQjae4o5/4swzDdNoYDVXA7x5gM3aXFv4M9B/fdDZb
         e3bEpt9Ms63cabVWMYUPlTUTyPy1/I2v4FsvCO053b9CcM8sjGX6fe9qy+GUtxp2S25w
         h9gQ==
X-Forwarded-Encrypted: i=1; AL+hErHVacAk3/3Jo+oS4/9tQ5CatEbHehpgjnQwP6CRX9p+MUMY9bjF5iouHBbma0U5gqvwkO9XS7PT+4aP@vger.kernel.org
X-Gm-Message-State: APuU4Z9aT4/2KnbDe/PrNQhMy0ERzTlrHwaFGHqHoQdAD2aIRSzVCDio
	K7Js9vPzXoAOu+TFSQOzaswHKu9A/1Z3aFI1h2SoRL3JkC8JAMPxH0JISiAHS3Q7Ggs=
X-Gm-Gg: AZFdTZcrY39NiMiHnV7PneU71+GAwOeGkMn/OFEJaAT3rjinCo06aVW2uFjkjg7byxd
	oa8UJ8gXQnEPYYsll3fmAWpIQL+SxXgJtgUmNBsqLH9jhuk0PU94XXVhjTK9JEbzHRhAtJdwD6K
	zY8F2J+URfpsLtjKKUIngjtGAp+eQ9nTKYr9FYWeRghk4yIT9PbTo7Qy6AXuq61EQMx7TPaNSML
	9iLfJSQgKnR0cdNkl1/CogFMpG9W6/yHyb1uJcR6sUT36sd17FpPs5Z0PQ+wN/hmTTti+cpf7Jp
	Bmf6wuvUzEqnA1cFwA5CBSp+6EMhpw/Og0yc3Hme8G+I41Si8vIJYr+AWhbx7WTcEKbZnB2vvsf
	a6XgrvUmnFtXn60SIZ0t7qd0BCfQUYcRayO0+nv8SpHyb7hyqYspAMi7jY1oJrFDohSitygfwNb
	m5uIs1VE1jV/T3Nq84gptP5OmO+zpyZhL/oiDE/TANpxYpuhRkdgvPXZ4CfD4Wql+jK5DFUo6uf
	IO/GI0nU6PCxs7ngj2ShRsmDsucKolY8MfHwVXwWhTUhRkhqbkVDCWxovGOtooznynUh5wI+01d
	fA0m7Tw6/8gJwEHl6HEuY60I2V4AsB7k7fZTlzWCDMxXN+vnC97DtiobHZpyvVe9nN5ZoYzF4Aq
	8lIDV8XrpDLRI
X-Received: by 2002:a05:600c:4585:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb8882948dmr367951945e9.18.1795614753817;
        Wed, 25 Nov 2026 05:52:33 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm469009105e9.9.2026.11.25.05.52.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 05:52:33 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: hwlock: st,stm32-hwspinlock: add mailbox cells and interrupt
Date: Wed, 25 Nov 2026 14:52:31 +0100
Message-ID: <20261125135231.98914-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
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

Besides locking, releasing a hardware semaphore raises the interrupt of
each core that enabled it for that semaphore. On multi-core parts
without an IPCC, such as the STM32H745/H747/H755/H757 (Cortex-M7 and
Cortex-M4), this is how the cores signal each other, each semaphore
serving as a doorbell.

Allow '#mbox-cells', its cell being the semaphore, and the interrupt of
the semaphores. Each core has an interrupt of its own (HSEM1 for the
Cortex-M7, HSEM2 for the Cortex-M4 on STM32H747), so a description
gives the one of the CPU it is for.

PebbleOS, whose STM32H747 port uses the semaphores as doorbells between
its two cores, describes and uses these.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 .../bindings/hwlock/st,stm32-hwspinlock.yaml       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
index 829d1fdf4c67..3b8d872b7c21 100644
--- a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
@@ -9,16 +9,30 @@ title: STMicroelectronics STM32 Hardware Spinlock
 maintainers:
   - Fabien Dessenne <fabien.dessenne@foss.st.com>
 
+description: |
+  Hardware semaphores, which also ring doorbells between the cores of a
+  multi-core part: releasing a semaphore raises the interrupt of each core
+  that enabled it, and the core taking the doorbell clears it in its
+  interrupt status.
+
 properties:
   "#hwlock-cells":
     const: 1
 
+  "#mbox-cells":
+    const: 1
+    description: The semaphore ringing the doorbell.
+
   compatible:
     const: st,stm32-hwspinlock
 
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+    description: The interrupt of the semaphores for the CPU the description is for.
+
   clocks:
     maxItems: 1
 
-- 
2.45.2

