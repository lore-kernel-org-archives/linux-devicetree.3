Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945241;
	b=pjTWuHqFsevpkEGjfZ3FPuAHTw6jr1zUgn/OgXmr3+/MCOHZvBlgPjPRexyTdnCGZkeH
	 lrjCZ4EXnxlK2CCHpN4hxYPeIm6VC1hrMg8cvZ5Q9E9jpCkiZ+Lgk6ZVRCj19b8yobXGm
	 zaGLw/aaSWb88Oxu6Ju078hsMhINAjihf/3nGPGE3ygtYhkqLY4Kqf+dGsRezx7idTX5F
	 KYhrRipL9/UB31Hkca/KqQteC+l0uJF4/S5mVemZ+AsxI4NKRKEv04H5wggggfLUi2meU
	 LEERuK09Rn03WEXQzIuO7Qas8ZNcsJc3Hs7VXLDBTghQ024MKGr9QmVr86ZlvStI84A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vsjSpshj4HQImP+U7D3TJsFl4xWtzao3mOwb3vIweuU=;
	b=TrniwMFWoneImEzJk8OC4zleuC2LhqYSZQQhbKVZiavrFMcfHmNghFFbiyD9jFN6qPfx
	 FiZYKSZvSXFZmbvdKkDgXiurT9QtILAMTRYwpFCGZ8kUWS0AjDfcTTP68/1TtkuQyM0Zx
	 p20sqwMa+iRtBodiFmGY9ydaDlqUyj9RdOhEcK7EzUt50CdJ2+917rhU7mWYuLQItvjd2
	 HIQ5TM8PfR/jY/L2Fhd97DZV/acA8yhaviDSnf7RUkYYInArMRda9RZPSxDp6pnxPRFWJ
	 3uYkaDfOUhapFnZnJdpClTGG0i0tdC3NJgkm0YXQEumJFstjeYQe2kuhPNPoUlSahhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mSSE8FJv;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E365606A339
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 06:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E365606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mSSE8FJv
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1931ff67a29so1058389c88.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 22:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945240; x=1794550040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vsjSpshj4HQImP+U7D3TJsFl4xWtzao3mOwb3vIweuU=;
        b=mSSE8FJvQ7kNMBFgKYL1MtYMZ8AyNhlmzTnRtJXTr6ApqwOsVs5hC9EL3n8kHDDs3V
         3zUOb5X0dpcHLj/Th9bINvlO8qUycuc7OdafR+qKcHx5AjB0j5Rdfw5DvhFeFnXsb0fx
         1raae1G8nzurXm+kqJIuq/L+Agcdqzv55mQt1AsAFfG4yWXJf+hCEGSGLU94s7b1Q5ue
         g17K1CJxoKyaQ+qNxTqiXEkKGPkgLWOOucfAQT1WRqOvxm57Ak7z7ahl4SB0gZ+ie6K8
         CgRZjRcVwwQ7YplpqlFlslQ2c387LBOEiGhEScKlOQxAW7Os+zeRdWwwFdiZlWYKTyMz
         555g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945240; x=1794550040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vsjSpshj4HQImP+U7D3TJsFl4xWtzao3mOwb3vIweuU=;
        b=2JOPoLbBR5rQJ2TZcZL0+XA7TBlpu+Y6ZPd9Fe6tFl5Fs1cJJVqhWixR9JW+SdtRRp
         Jw4xSZHfKR3M9Zua6rAdIVkUPTT2RmS0SkiY7ekV/XL/h75JiWI+nprS9duK/27Fnss+
         d2KfXQ+mvH4dVmw5ShOoKcdlRgv6z3APJ/RW3bD592oyVlvy6ryaSnOYhHQW2hzTemUu
         24PjIUWJZ2IuqDVFjjhbSnQlM/EUJL/abN0d94z55C1twmPv/Tye0rsdUT7c/8FrvJ17
         7fJSKJrI1Xyl5GKho7MmN9VUPRYJ6Si7L6aUL5RFwm1IYsKGpUc3mdTObTkfX9z9pl32
         L6mw==
X-Forwarded-Encrypted: i=1; AKwUvBzXQTZbUGrfSN4fcVANaxTz28ovmms7GHYhLQwnzRIpr9Rsg3XZ+LJQ9qZPLnGmW+F0r0Q9Kx6z/rm+@vger.kernel.org
X-Gm-Message-State: APuU4Z+q5w8N4qEM0C8S8Hl8slFbUnNthtv/kZ2dVUHXsKO7e+K10QUN
	IDNnGca31voGWqqcP7KkYUn45xhUPEstW1Yrz0sB78Xke4QJGkdlRV7h
X-Gm-Gg: AYBFou2mOMlFFcQ+TobhquvhiRjaQG3J3GmLwivxpJ0Nag+y3ukbETAAlxfpf290IbU
	dM7cxKtpeacR4LXotDIBL2N7Bhll/5gaHb46F0cmcBpI83K28joSiFlFcCtGsO8BE8XjiPToUjZ
	AaJXjA3h+uet7Q0an9RX/ZeMYg8j1YoTDEERkzHVbQn244h2E8nccNZCBRM8HS2uorMMFhv1/p7
	vDP3HP0Cd03PMBVSxnzgTqRdmz07asNytqbopWzmwMTGu6q+b3ZqguSYhXtnLfO5fuV13g1J8F/
	qorYYQ11vofa08oqTue8KUkFFe9xN2A4PXom7wTw3zRbdzKNQL4hyKiMes3bE9ECQgpr1znVSYA
	zW6p5rYO8t4jeXtgqo8tW6TNdvINtZk/T2PHpoHgn77AP62BYUSL6FIWnTrT+TmEc96UV+Yu/HJ
	vL6TPUB9ccl9Mys8h/rGb0VJBTwdn+PSX85VE4iOo9dmD10uFS/6M3ISxwG04CYQEA2el9AHakt
	/421eQUXx1ouNtGOXZjw/PW+g1GkKs7RLZtxN8LWHv2+fePc5UqeiWC+RAG8SJ0ff1MXSTpLSXw
	0+nfLYV77s/IAirPzhOVFlCCMvPb6zunLKEGRxWJWmGV8WQm3UtO
X-Received: by 2002:a05:701b:2302:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b25d336486mr1698470c88.28.1793945239501;
        Thu, 05 Nov 2026 22:07:19 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.220.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm2780992c88.19.2026.11.05.22.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:07:19 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH 3/3] riscv: dts: spacemit: Add K3 eFuse and temperature trim cells
Date: Fri,  6 Nov 2026 14:05:25 +0800
Message-ID: <20261106060525.346873-4-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106060525.346873-1-duge1256@gmail.com>
References: <20261106060525.346873-1-duge1256@gmail.com>
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

Add the K3 eFuse controller with its AES_WTM clock and reset. Describe
fixed-layout cells for the temperature calibration parameters stored in
bank 0 and bank 7, using controller-relative offsets.

Leave the controller disabled for board-level enablement.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e89d2cc5ca8c..51861fdc6a21 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1439,6 +1439,31 @@ saplic: interrupt-controller@e0804000 {
 
 		/* sec_i2c3: 0xf0614000, not available from Linux */
 
+		efuse: efuse@f0702800 {
+			compatible = "spacemit,k3-efuse";
+			reg = <0x0 0xf0702800 0x0 0x400>;
+			clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
+			resets = <&syscon_apmu RESET_APMU_AES_WTM>;
+
+			status = "disabled";
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				soc_rtemp_trim1: temperature-trim@120 {
+					reg = <0x120 0x1>;
+					bits = <0 8>;
+				};
+
+				soc_rtemp_trim: temperature-trim@19a {
+					reg = <0x19a 0x2>;
+					bits = <4 8>;
+				};
+			};
+		};
+
 		mimsic: interrupt-controller@f1000000 {
 			compatible = "spacemit,k3-imsics", "riscv,imsics";
 			reg = <0x0 0xf1000000 0x0 0x10000>;
-- 
2.43.0

