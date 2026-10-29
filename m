Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250440;
	b=tiXY0G5khBdncilgdgGb1CIfERMq6MynJTZgz7r52l6L4iAZYlqY4JG/Slyu4xpspO+/
	 D0cMSTZrUjQK2cKH381jsMuZvBnOANQwYbzbAwAY4Ji7FqQZj+ZpARDuEcsebeEWMcV8D
	 2JfaK2eT0jcowwf4HMfSwRp4hF9SWY9dVbTcAv8LNiE8pmWXAGKhOce9y66TI3yeDEkG7
	 kxjRVxTxC5T8dBQGNujI9srm9VAIPLQ5ejYrCBfNVNRTGhYEejJxhKwMgdFmjkp3Xyix+
	 UhCL7YGFv2PkKjX4T1NbUbmk8w8JGcHtb9a6LZ/fJcs0wHjZXQ97QOcLiZoxkVKawLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=zGV4hq0i8RZtAPVqoljw/C8+Ety28xxbkClqaDK3k9U=;
	b=mRIfpi8+FIUZS2t2mATifN7h2LJk4tRiV+CjBPheDeCVusoXW9hnbiXZMOs5dpF5KkX/
	 C+SdJDOB8m/BHjJ+4rhPT2gjm6whivZXDsQAdD9DCr9axPjD7muYmQhShhmOfrCflJUuS
	 q92JpXBA+L3paXk2x4NhO5gywJquJuKtdp4mH+h4dMI41EW81uBs00x3wbM0Z3CT8mek1
	 wSdopbHY39qy3ILRjhiLuKg0BCt6ZFshdB+mTOD2Ehz5Ia8SpMu5DVr67uiWw0C+yz4P7
	 +kfsMxnph1PiiMsvDroNSz2EqANnU/1+5mI/4h+X3jZCal6vsQSEjsxc4bHcbJoG/Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhB6xBKV;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118CD606A31C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 05:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 118CD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhB6xBKV
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e985106c0cso14958135ad.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 22:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250439; x=1793855239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zGV4hq0i8RZtAPVqoljw/C8+Ety28xxbkClqaDK3k9U=;
        b=EhB6xBKVd8era6ux3/LVclIs7SKXgBN68W0ZZxrCBjQ0dGTX2HkS91euvItz1VGzt0
         MpXWwxp00nvVOBAMLdVa+1d5fRvYIL3B5/2yQBd4YZYyICj2XuplDz7sFlMs+Sa8sfND
         phbZETaoYJtpXb9Z3nGC50NJsGfOLSLZBuojKXxhIOO1UJ64wHfAbXBRCXOX+Y5gh4/M
         uxMyZV+k/gpy8xevIGYJpgTXtNRLlavO1+A7ipbV1tfoFjhTE7WBOKI/qKcCM5SJymko
         m43lpO8xVMInTm/nrIMZIkkbd0v0YdizalBby4Gc0xAFQgEOWBLw3qP5dao/stPJsClA
         SSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250439; x=1793855239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zGV4hq0i8RZtAPVqoljw/C8+Ety28xxbkClqaDK3k9U=;
        b=bd85kmeIyC6NgxKsDBwYaHIOjS2LiRUT6393MTKJsj3YuNzfeaBHE0OKlLJT9Kk9Z/
         QoArj+k3KPAKLMIleIg30PA2P7q1LeM2DLt2EceSmnCRMGq7JTLWbi6+huham4POqV0N
         ijpaUq/g5mFnujCOD07zaMvn7GxaIit6TSU/iwRs76TFpndaqpuhTqHpUceWEE9Yb1P1
         MQ8yCXnvFlIWnBSliGkAwfH9maZU+ANEbnlxEdNzll11Wv/X9xMJ2JAZ7TZ/qJ2RyOG2
         Pg7Z/9/964r1OOG7CmR48ArRBHhxNAiqaLeK4BjnPpzN2pdjv7NEtkKhBpNEHv02m8GQ
         v6+Q==
X-Gm-Message-State: AFq9FYJlfSYQpOGhkL0ByodeK3Y//OEMIVAul0cPO+gqv6DWWx55fF08
	+CKF+Vdw2VrZQuctOAPC2sB8Q4eG2tJxf7W9x8ZiNTjcpu/Hz2v8LWei
X-Gm-Gg: AYBFou0qG39gRCdZAFF9FcnKVnglFVtNmyw5JRmijdtT75AAKxGRGEfdZoFEdqSMsIn
	YXncSxoHl+C/a751EuefzQQjB0t6IsHrjjIGKf8ZIYw3Cl0UNmqNE/xMFCtbgA1sn3Pv7lKoMN6
	vroVYPkB81Liv89ITAgP2IDBl+NKccQ0N/CqJiZSM3GaIeH1Xan9mhw8RwoO9ZdCOkA/U5JAbec
	uFgHFIeaq6NiKolMfmyZHBBsoXK8Y22DJy3zA7y8SBbRDwUbG5nLGO6a272T4Z+E/GWt02BmH8H
	Ca5bZNK+ky5ieAY3dHaTQT9B8NObn8k6ymJWrCx4DVuITJ0kHO1db4m4tEd7A5RAy5fNtWHN5k0
	AUUo1NUauajZ2fLitCsGGG/NR2mRu5VJbkuEHnX1HpjUvi6OCkLWxaD1sBc07oibGlDHxkKzVzv
	SU2FWGEH/I3yV+72frO+VfK5J33yN5jyc+9bbKUmoY/N1LiSwkLuKWUa1b7q2JtQmjTdqKMg3PZ
	IKaBJZLuxv+k4QBYEJsbWUk/GArDeQPNPeifjQajQW9a0RT4OJAVKPaEi/Vru3EZhGFAaZyCpB2
	tItBJZKG2dHfQWhRMGqVnQyFfdBIWA==
X-Received: by 2002:a17:902:da8d:b0:2e9:69b1:1b9b with SMTP id d9443c01a7336-2eb0012c7f1mr38007225ad.8.1793250439420;
        Wed, 28 Oct 2026 22:07:19 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:07:18 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:51 -0400
Subject: [PATCH RFC 10/12] riscv: dts: bouffalolab: Add Sipeed M1s Dock
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-rust-bl808-console-v1-10-b736ee920078@gmail.com>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
In-Reply-To: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Kwanghoon Son <asdfkwang@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2

Add the M1s SoM memory and 40 MHz crystal, and enable UART3 on the Dock
with a direct stdout path and 115200 8N1 settings.

Boot firmware initializes PSRAM, UART pads and shared PLLs. The tested
firmware configures D0 TIME at 320 MHz / 380, represented as 842105 Hz.
Firmware using another timer configuration must fix up timebase-
frequency. The declared 64 MiB PSRAM range must retain firmware
reservations or be narrowed by firmware when memory is assigned to
another core.

The stdout path selects the native polling printk console; userspace TTY
I/O is deferred.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 arch/riscv/boot/dts/Makefile                          |  1 +
 arch/riscv/boot/dts/bouffalolab/Makefile              |  2 ++
 .../boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts    | 18 ++++++++++++++++++
 arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi | 19 +++++++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 69d8751fb17c803f0efb8003e111ee24144c222b..294f9c119f8f1d608c878ca1f95891843301f07e 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -2,6 +2,7 @@
 subdir-y += allwinner
 subdir-y += andes
 subdir-y += anlogic
+subdir-y += bouffalolab
 subdir-y += canaan
 subdir-y += eswin
 subdir-y += microchip
diff --git a/arch/riscv/boot/dts/bouffalolab/Makefile b/arch/riscv/boot/dts/bouffalolab/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..4d63365edc095fbe9df31c4b12e29c4b624cbd1f
--- /dev/null
+++ b/arch/riscv/boot/dts/bouffalolab/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_BOUFFALOLAB) += bl808-sipeed-m1s-dock.dtb
diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
new file mode 100644
index 0000000000000000000000000000000000000000..c719a53c6e2de45f3718b48ba2116e99c70e559b
--- /dev/null
+++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "bl808-sipeed-m1s.dtsi"
+
+/ {
+	model = "Sipeed M1s Dock";
+	compatible = "sipeed,m1s-dock", "sipeed,m1s", "bflb,bl808";
+
+	chosen {
+		stdout-path = "/soc/serial@30002000:115200n8";
+	};
+};
+
+&uart3 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..ae54e6e301ed2c5a1448d52c530c5074515ee38c
--- /dev/null
+++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+#include "bl808.dtsi"
+
+/ {
+	compatible = "sipeed,m1s", "bflb,bl808";
+	memory@50000000 {
+		device_type = "memory";
+		reg = <0x50000000 0x04000000>;
+	};
+
+	cpus {
+		timebase-frequency = <842105>;
+	};
+};
+
+&xtal {
+	clock-frequency = <40000000>;
+};

-- 
2.47.3

