Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649516;
	b=SfEfHm9Ptw/1we17Cnm3lxCQ4XfclZxLvbQQQEslyalp+8Ryrcb/eLwm+21SVpGEDY9B
	 kmvcAddliIOPEh1jr0ZaqYfe6Z7caty5idCgMR4ghawTcmxeFfNsc01i37wasSkSm96KF
	 JMgDYWRxNOwGtPchpsQfOiizaZ/u+HWPTJ9K5abgc33DQayuAUEquWuHQ59M0OgJH3m4N
	 UYOG8/wN8EHus2pr1I52eiSetJWFYyo78ZHZ/R/VnQ/P+gXS6lGgBPHD1IYdha9Bf+W+i
	 JShMyTyZZNpiR3xV3M1Sd/0qr87WREbOp3FMqFu5YUhiRQCOeuJ8B9vFt+b5CKyt1Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Np0anZjG5hAkQgXnIrOs9QHgsmNIFocrZSI/L4oANeE=;
	b=tKAnMX7aYD7G/+JEnM6UPm6+5+jG0KglJwC+mBm+uBcDryWKx1HGS9FiT8oSQUj9JiBB
	 ggSIonMqCks/QQrtI4XXPKAQUD/b3P1W0A38NRiyHNh4G9upCApAfx/yzC7caxSIPVwjE
	 DbYe3ID/HQ21+Q5aquM6OQzCOzc78M/dAZKCLTDqITl6duvoQ61KgeWfZ9Pjwz/XKFny8
	 a3HANB28auERzD/KHRddbhV4iiSJAvYur6tYp099xQhqL7u51Qn8FUTE20RMzipCXnVXb
	 lYE3s4Y5YB9cIYO7Aw6jN2rRN/a9uE/T2fNVHVYFBqg/WL4VPO5MceHSXx6nqumQo7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m9EoKzUD;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB45606A337
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBB45606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m9EoKzUD
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so63545615e9.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649514; x=1796254314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Np0anZjG5hAkQgXnIrOs9QHgsmNIFocrZSI/L4oANeE=;
        b=m9EoKzUD0AT1AG5pR0Kw2NKad7wac0+MOmFSd5HkOQki1m5QN0bRx/fwlrIvnsO+Z6
         KAiQpy3t5coxmb+PexU7c1c33hSEuRauizLZTryU6IQFW1MqeBShoGN9oWfCbn93Sb1w
         sgAiF4aYc+NwVM7oG+MUeW3vH5qauSIVp//nEqK9JGkNW2HkMNd+6hYe6qm9lwy1JHzl
         xRJlJyR5bIcNNm9R7yd7WF4OxMx+DFw+3shRkawlpAHyJTbv74c4LGTua15nHkSEVjP+
         gSp76LZ9nUzDxVJRSuAZEMhSEj4lSFKgja1Rh/Pn6KMtTMWUxzmc5xdrZyf0JqTG7nx+
         /65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649514; x=1796254314;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Np0anZjG5hAkQgXnIrOs9QHgsmNIFocrZSI/L4oANeE=;
        b=OVkwFRf8a+OguBPmXYdaDHzcrcYwqUC5UzVET3L2D3/hqyIelRfZVNrmExRy7FgdJ0
         ccAhvoCsLnCNtKSNJYCPRFlUr1drH0NBSmtsmYCcDbsrkybTXxzsJYZQw/sm5EGJdLBk
         k54woYVkQ8TOuqeudNpEnSYrxLGauKZF4U99tOiRB98Ue1PFUUmFl3unlndv1m3ct4Gt
         E1K5G8iqPT0ruScR/M6b1axHjpQRxWgEEEN9XlYblBAORD8wyl9C0PYNSmeiGUlbn/nH
         jZfNOcqCYCPLU515zEhrQWbXkRPK9bjROWgJQlRp6lxviYgZnfrZwekPHGNBPlRp6twY
         83hA==
X-Gm-Message-State: APuU4Z/Dbw7z40jsyRn1raGpuUbCL8fQvGDGGTJhc12bYgtf7FsbwM32
	68xlXP2Kbuev9EceCYJF0UIHKGpajGXzIOy4g+LraKAqpUDuYKDgEfNx
X-Gm-Gg: AZFdTZcnp4jtJGhtTXKjocbjx8M4/IOO3L79pBp+BAug1te4IaRUrIFYBp9ISDfHDoc
	S0vdi66q/jhQMaApuWCQaWKaJIiLBxBf1eGrMNuYHy7/IdcchW/oVJx06BBnw2DOvsAs5y6kpde
	7i+a/btPwaNLea841T/hSol8+02q1TtUMbqImGGX9A9nugUAGTG8tQyT5rdFDxrOIcffvOTXMxS
	v5/JboMvNvFrTtozEFDj1C/S8zOXxCmYU3jRpDsYSVm0UoqPDrDC6kJvi/GkA0/lIHdMTQQWgen
	WSHC0M4rq4YAr60SH9MzyokCEnXtKdXQ5QMhIi+c1PPFeoWhMwHNA2Xcui9X+5gzCtZMnYxR29S
	jVGWchinjuPhYj8XJk8EHS7OM0hC4W/aVixkEBhXUCwvTclHzSPFnIfjJ8dGAWFGWdnoyXVMD7x
	C41GuJ96A4MErEobUT9CO4RoG+Rp8l6Uy1fwd4Amgd80W0wVMeG46GqKSp/7AuE1KNF7hH0W3Yt
	TY2ukd4YRxx2Nn04n2wz5zmiMDSWwKpbnnjm/KMBmZtdF8/gyDf9Dpf6xgaBY50f+5T6Z8EUF92
	O7yvxqoLQyeuxCNRL/UB25iFydvsaUu50dDdsGdxJWy9aIAjxTALCLha/R9tb/PlaP+D5sjptko
	ju0B2pOu9KA==
X-Received: by 2002:a05:600c:3b88:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4bb8880789dmr443306225e9.13.1795649514424;
        Wed, 25 Nov 2026 15:31:54 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm38324142f8f.11.2026.11.25.15.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:31:54 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH RFC 15/19] riscv: Align init data to the ESP32-P4 PMP granularity
Date: Wed, 25 Nov 2026 23:30:16 +0000
Message-ID: <20261125233020.1380594-16-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ESP32-P4 has a PMP granularity of 128 bytes. The RISC-V linker
script can place __init_data_begin at a smaller alignment, so a boot
stage using that symbol to separate executable code from writable
data cannot always encode the boundary exactly.

Align __init_data_begin to 128 bytes on ESP32-P4 so PMP can apply
distinct permissions to the two regions.

Verified the alignment in an RV32 NOMMU kernel that booted to the
UART shell on a Waveshare ESP32-P4-Module-DEV-KIT.

AI assisted with preparing the patch and validating the
linker layout.

Link: https://github.com/espressif/esp-idf/blob/master/components/soc/esp32p4/include/soc/soc_caps.h#L191
Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 arch/riscv/kernel/vmlinux.lds.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 1f4f8496941a..e4498a9fdc6c 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -77,6 +77,10 @@ SECTIONS
 #ifdef CONFIG_EFI
 	. = ALIGN(PECOFF_SECTION_ALIGNMENT);
 	__pecoff_text_end = .;
+#endif
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+	/* Keep init data outside the last executable PMP granule. */
+	. = ALIGN(SZ_128);
 #endif
 	/* Start of init data section */
 	__init_data_begin = .;
-- 
2.56.1

