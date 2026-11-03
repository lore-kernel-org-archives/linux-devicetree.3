Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722440;
	b=0c79v8zAKzoY5Zv9jyiozbXjPmgLYopBw2E3IBFn/3BoA/TwvwrL9Zt4KSvKnrXKX8Rn
	 KEJ2cKzxcPNCZRY7sl4qTXiUjd2XQv8dbXVfBolc5xyJNweyqugc2EngpFOxt7XwttLS9
	 MrySDYDr+bfTR55nZm5KoFjdt9JUNjp/OYl+UJEbWPai6K1o/mh0lxz3SrANZZcvhffu8
	 LJfjAMfK0VhvWlERnwd4qzVPePLI6IzxxKHLNbQsbxLsoVudt2wF83AnXwApOvhdTY6Vn
	 L9xUwcqZ99sc2TjiqRu+ic5paXYNhHbpPi+4lIPRUgh3tt3f3IVDOp59hFnVt1XbCsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=RwcH6l6SUH5YEaW+wO0x6nlaiZGCJh24bNQeXxROXqI=;
	b=EMI/82TwJl0h+Yiie4uYhSi8TEvhaafBbAO/ZF1mJTEKTq2wO2xY21yRtcDfwwKnKaMg
	 tiCoQ1hFDP7tt7Nzzs6yhf9vgEcSqzIShR8UxggUOVmphMnrlwozQ5SA6pSDFuIPCpueU
	 HHbeUJEu2R0/VK+rzIXz0BmcxM8zVTsUnYV9is41b73nO7w5IVddDbcXf6sqq5qrXh3PE
	 fV7QqanisurN/EOHvFKYB9oiNx9SBHZYocIdnmWT0jZ2RC/krCGuhyxb5eESZcq1AuBW9
	 9JasA0SnbsMLeq/fcDPSnt5Zz1rVtYnS8fM119B1u+C2j6ePdMd4EL9wfdf7LaUcdVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=beagleboard.org;
	spf=fail smtp.mailfrom=beagleboard.org;
	dkim=pass header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=ifRO9CzZ;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25549606A339
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25549606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=ifRO9CzZ
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-353804b591eso7506831eec.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1793722439; x=1794327239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwcH6l6SUH5YEaW+wO0x6nlaiZGCJh24bNQeXxROXqI=;
        b=ifRO9CzZXOkXaYlanvPiLctzrmcde3AwiSd8EspD/AQPPHtpT+Trce12wQlpwZaXfJ
         xrPlIgzKj2lJgtUnDqsGK5jee2Dyp3fHfP44iUunnfbrhmgo4elPHJPlzxca382HR/SV
         y43cyBlixekBhC/ehAWh933h6lgDw7+N6eGYr0m6DfuWVw1uLhu5G+KKXaapaPhSShZQ
         f6OKaB6Hp5hv+pkbpO7/QU2HNRlJyc0nzvW1HHhtkvFb7wYwCb0s1ZnbKW9ELXDArw7c
         7ZOBBbZh/Y6TEUV7bIMt/vEI9GvpDMiZM2d9aPrNVl6PjlYplVEtYQqvjlMeinDw2A+Y
         OnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722439; x=1794327239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwcH6l6SUH5YEaW+wO0x6nlaiZGCJh24bNQeXxROXqI=;
        b=R5FRQPqgtOVFQgdoHVJIIWe5gZ6cSNZd6L4C6KnqSiTsGLstTABS5Q6vrRzhmYGWQe
         powT2/ZCKo2zZe7XCF414HYlxCIH9NylcwudfdeN8H+25egta7vK1oAhUo9WkEKXZ4/a
         dUUehLccAvIcVXQ+vUzJa1f+lAabidZGQz4phNHFPvUF65n86aqMAoTJHUhVPRmdLHie
         QndtlXVrrH//p4ESiztlWTC0GRcKKfYoIMBmbFxgQ9mFj7O1sIN+XHNmf9h5Ssa1futq
         YyX4bSbtL+7e5VhQ9tg+3ZOqA5jLRBRVwLQoWA7KAsPxDNgq56LNFdZ5cUGyXFyN8Sro
         BcsA==
X-Forwarded-Encrypted: i=1; AKwUvBzVswSUPJwxcaLWh03jOBsPvobC8YRPVxzQvV0M9AauklcWDwbe+8p1+u7mbxL+qYDgYZQG1H+bsB7W@vger.kernel.org
X-Gm-Message-State: APuU4Z849KrzQFLDZzrbhQx5yN2TzkGlIaROMsXBNKuRsqwbSSYFx/zW
	PgaU1z5pfC4x3J9TI4ZCq2YRdpNK7UcYs2aaV+jLdkJuxI0F9XBu82Q/U9u1wQZTfg==
X-Gm-Gg: AYBFou1lyv4/yqQMN1jztWCmn2szNwS218rXRs4SzazJ3C7RIemf2fj96+UD8HRMERm
	6UF3Mfonqv2u3bVRPBjwX8Pbn5+1CRfriIC+3Ohj7T+xmYmCIvxWmdqUoLK3z++yDroX3cGLzxU
	w9rzl58v1vLBRBQrJ+Wnl3SAzuEtinTkzWMy52kETuom0/dNbmX3cHJIIjM3JMxPRXVTtPbq3eW
	631QdGBlvkORQ3hdCgFxyBed50KFntwmigfYUpOUBL5MRCdgNe86sLaFb6PP2jsKTe28Kd1izNv
	ISPKmjV/MNHBd41w6IqS5xi6CL2cFxYHQ8cHcGp0Phxs295L1LNrbAuF0J4cPD/y0KvfZWJcgS+
	LunKcjV+iK+RzlgHqb+DEgONb/BPZfalnOrATJJU7EHcBGvg7LTHsbc+Rh0wQi0S2KEwpso4dcp
	6bAsR8nk7b/JZjrNxYQAwBpwAsdD/4iMEszBdcf0CkIk52nf+XTRcTSKheLvMlHDT+X6rSnLMn5
	LkxKi42XGNGTPNjuyukDZjdPb+VDXdLpkCGChazVacaxI2x8ZxGglZE+lEZatns9l3fKAStjB2u
	6cnnbYYPh/Q1h487wjsCJODPF/6q0dDWTSEcUJue
X-Received: by 2002:a05:693c:69cf:b0:369:daea:812a with SMTP id 5a478bee46e88-36a423fae73mr18470988eec.30.1793722439073;
        Tue, 03 Nov 2026 08:13:59 -0800 (PST)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm47214021eec.6.2026.11.03.08.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:13:58 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 03 Nov 2026 21:41:56 +0530
Subject: [PATCH v5 9/9] greybus: Add Rust UART node driver
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
Message-Id: <20261103-gb-uart-transport-v5-9-f8e326d6561f@beagleboard.org>
References: <20261103-gb-uart-transport-v5-0-f8e326d6561f@beagleboard.org>
In-Reply-To: <20261103-gb-uart-transport-v5-0-f8e326d6561f@beagleboard.org>
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
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Markus Probst <markus.probst@posteo.de>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12433;
 i=ayush@beagleboard.org; h=from:subject:message-id;
 bh=tFOTmp9/1kr1wLjqm5OZDK94tW5bhoEDsqAOswVr9nk=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBq6gfggs88rwtBtmZ2JBoJ5fYPPwVS01v3xrJNt
 hQ7Y4NSgUeJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCauoH4AAKCRAFzvXHieVa
 dFxbD/wKP5M8hF66MmLIphKFKU5qY46GvB6LQyi48hnH5tq/7og4IxBgGNb+U44spMP1GD1hdqx
 c2/3dammxiwOdPK9y6ZlP8TNpuW7n2xxdcuwXFDgRhC5Cva6t8gdSPmNgbtWP5FMvZhfX+jeK/3
 Ce4/txt8Z3I/CQ4MQFWrMIoo+8nK+2KCRDDaWYE2ZkhcrNhkZRx3PQ+ZULL+h10aZ2ZEOZaRwiR
 UzrzDJ4dws0Daimexg1s6P9z8hScSe42XKgIid12+AzJYiHmB4mq0yPQ9eJhGyrtn9hVpKitj6I
 07D21Er589g4tPWqQz0er05usuQNDmuaASQR9KFUyzW3yDPgHaqlCTN0dVBfBngR/AR/H7CZKkN
 FNKhDB9FxIAj2nT4GelRc/093W6JEXKQHZIM+clRs8A3m66vQE1+iBV5v4GWRZZySWQQ8lyTLIX
 wbKHkjYqnNeSDrck7ZM/oSSm+VgKSmih/zzHlNm43msUkc5YiHGErqV/JigjveuPypw8pus96Ml
 F8V44/AWTNoi6lZJTrUsAwpX+CJMdwrMiS+VlWqmHEuqHqI3FL+UA1VgxL269wZCsqQJ1CtV+zk
 WGX8wBBGu5+uly3vQ03AdWyM8RTweAldUz8sSXyUWa/UJXrSveP26O0fMsiOQFlQ8IxgKO12F40
 zRS9Be6KHnNrnPg==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Add a driver for Greybus nodes attached over a plain serial port. The
node is registered with the software SVC (gb-softsvc), which handles the
SVC protocol on behalf of the AP, so no dedicated coprocessor running
SVC firmware is needed.

Greybus messages are carried over HDLC framing on the wire. Each frame
carries a one-byte address (0x01 for Greybus) and control byte, followed
by the 16-bit CPort ID and the Greybus message itself.

Port parameters are taken from the firmware node: "current-speed" if
present, otherwise 115200, with flow control and parity disabled.

Since gb-uart-node imports types from gb-softsvc, Rust to Rust calling
setup from nova-core [0] is being used.

[0]: https://lore.kernel.org/all/20260622-nova-exports-v5-0-6191773fc977@nvidia.com/

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 MAINTAINERS                     |   1 +
 drivers/greybus/.gitignore      |   1 +
 drivers/greybus/Kconfig         |  15 +++
 drivers/greybus/Makefile        |  10 ++
 drivers/greybus/gb_uart_node.rs | 270 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 297 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 521bc6c67979..5bdd500ef63e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11527,6 +11527,7 @@ M:	Ayush Singh <ayush@beagleboard.org>
 L:	greybus-dev@lists.linaro.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
+F:	drivers/greybus/gb_uart_node.rs
 
 GREYBUS SUBSYSTEM
 M:	Johan Hovold <johan@kernel.org>
diff --git a/drivers/greybus/.gitignore b/drivers/greybus/.gitignore
new file mode 100644
index 000000000000..ff9c4a3539b4
--- /dev/null
+++ b/drivers/greybus/.gitignore
@@ -0,0 +1 @@
+exports_gb_softsvc_generated.h
diff --git a/drivers/greybus/Kconfig b/drivers/greybus/Kconfig
index 709563f8c0ad..ce2030161f30 100644
--- a/drivers/greybus/Kconfig
+++ b/drivers/greybus/Kconfig
@@ -61,5 +61,20 @@ config GREYBUS_SOFTSVC
 	  To compile this code as a module, choose M here: the module
 	  will be called gb-softsvc.ko
 
+config GREYBUS_UART_NODE
+	tristate "Greybus UART node transport"
+	depends on GREYBUS_SOFTSVC
+	depends on RUST_SERIAL_DEV_BUS_ABSTRACTIONS
+	depends on RUST_GREYBUS_ABSTRACTIONS
+	select RUST_CRC_CCITT_ABSTRACTIONS
+	help
+	  Select this option if you have a Greybus node connected over a
+	  serial port. The node is registered with the software SVC, which
+	  handles the SVC protocol on behalf of the AP, so no dedicated
+	  coprocessor running SVC firmware is required.
+
+	  To compile this code as a module, choose M here: the module
+	  will be called gb-uart-node.ko
+
 endif	# GREYBUS
 
diff --git a/drivers/greybus/Makefile b/drivers/greybus/Makefile
index 0fa802fdf6ca..023f59c11e65 100644
--- a/drivers/greybus/Makefile
+++ b/drivers/greybus/Makefile
@@ -28,6 +28,12 @@ obj-$(CONFIG_GREYBUS_ES2)	+= gb-es2.o
 obj-$(CONFIG_GREYBUS_SOFTSVC)	+= gb-softsvc.o
 gb-softsvc-y			+= gb_softsvc.o gb_softsvc_exports.o
 
+obj-$(CONFIG_GREYBUS_UART_NODE)	+= gb-uart-node.o
+gb-uart-node-y			+= gb_uart_node.o
+
+# Export Rust symbols from gb-softsvc only if gb-uart-node actually references them.
+gb-softsvc-export-deps := $(if $(CONFIG_GREYBUS_UART_NODE),$(obj)/gb_uart_node.o)
+
 rust_needed_exports = \
 	{ $(if $(strip $(2)),$(NM) -u $(2);,) echo "__DEFINED_RUST_SYMBOLS__"; \
 	  $(NM) -p --defined-only $(1); } | \
@@ -66,3 +72,7 @@ endif
 # Output gb_softsvc's crate metadata for use by gb_uart_node at compile time.
 RUSTFLAGS_gb_softsvc.o += \
 	--emit=metadata=$(objtree)/$(obj)/libgb_softsvc.rmeta
+
+# Allow gb_uart_node to import gb_softsvc's types.
+$(obj)/gb_uart_node.o: $(obj)/gb_softsvc.o
+RUSTFLAGS_gb_uart_node.o := -L $(objtree)/$(obj) --extern gb_softsvc
diff --git a/drivers/greybus/gb_uart_node.rs b/drivers/greybus/gb_uart_node.rs
new file mode 100644
index 000000000000..b38e776c3e85
--- /dev/null
+++ b/drivers/greybus/gb_uart_node.rs
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Greybus UART Node driver
+
+use kernel::{
+    alloc::Flags,
+    crc_ccitt::crc_ccitt,
+    device::{
+        AsBusDevice,
+        Bound,
+        Core, //
+    },
+    error::code,
+    new_spinlock,
+    of, //
+    prelude::*,
+    serdev,
+    sync::{
+        aref::ARef,
+        Arc,
+        SpinLock, //
+    },
+};
+
+use zerocopy::little_endian;
+use zerocopy_derive::{
+    FromBytes,
+    Immutable,
+    KnownLayout, //
+};
+
+/// Most greybus implementations will have a limit on greybus message length. The theoretical limit
+/// is [`u16::MAX`], but the real limits are much more modest. 256 seems to be the limit I use on
+/// most of my peers, but let's use 512 to be on safe side in kernel. The only real big request that
+/// I frequently encounter is manifest_get. However, if camera protocol ends up being supported at
+/// some point, this might need to be increased.
+const HDLC_MAX_FRAME_LEN: usize = 512;
+const HDLC_FRAME_HEADER_LEN: usize =
+    2 * size_of_val(&HDLC_FRAME) + 2 * size_of::<u16>() + 2 * size_of::<u8>();
+const HDLC_MAX_MSG_LEN: usize = HDLC_MAX_FRAME_LEN - HDLC_FRAME_HEADER_LEN;
+
+const HDLC_FRAME: u8 = 0x7E;
+const HDLC_ESC: u8 = 0x7D;
+const HDLC_XOR: u8 = 0x20;
+const HDLC_EXPECTED_CRC: u16 = 0xf0b8;
+
+const ADDRESS_GREYBUS: u8 = 0x01;
+
+#[repr(C, packed)]
+#[derive(FromBytes, Immutable, KnownLayout)]
+struct GreybusFrame {
+    cport: little_endian::U16,
+    msg: [u8],
+}
+
+struct HdlcRx {
+    rx_buf: KVec<u8>,
+    rx_in_esc: bool,
+    rx_overflow: bool,
+    sdev: ARef<serdev::Device>,
+    node: gb_softsvc::Module,
+}
+
+impl HdlcRx {
+    fn new(sdev: ARef<serdev::Device>, node: gb_softsvc::Module) -> Result<Self> {
+        Ok(Self {
+            node,
+            sdev,
+            rx_buf: KVec::with_capacity(HDLC_MAX_FRAME_LEN, GFP_KERNEL)?,
+            rx_in_esc: false,
+            rx_overflow: false,
+        })
+    }
+
+    fn frame_finish(&self) -> Result<()> {
+        if self.rx_buf.len() < 4 {
+            return Err(code::EFAULT);
+        }
+
+        let crc = crc_ccitt(0xffff, &self.rx_buf);
+        if crc != HDLC_EXPECTED_CRC {
+            dev_warn!(self.sdev.as_ref(), "CRC failed {}", crc);
+            return Ok(());
+        }
+
+        let addr = self.rx_buf[0];
+        let _ctrl = self.rx_buf[1];
+        let payload = &self.rx_buf[2..self.rx_buf.len() - size_of::<u16>()];
+
+        match addr {
+            ADDRESS_GREYBUS => {
+                let frame = GreybusFrame::ref_from_bytes(payload).map_err(|_| code::EINVAL)?;
+                self.node.submit_message(0, frame.cport.into(), &frame.msg)
+            }
+            _ => Err(code::EINVAL),
+        }
+    }
+
+    fn rx(&mut self, data: &[u8]) -> usize {
+        for i in data.iter() {
+            match *i {
+                HDLC_FRAME => {
+                    if !self.rx_buf.is_empty() {
+                        if let Err(e) = self.frame_finish() {
+                            dev_warn!(self.sdev.as_ref(), "bad frame: {e:?}\n");
+                        }
+                    }
+
+                    self.rx_buf.clear();
+                    self.rx_in_esc = false;
+                    self.rx_overflow = false;
+                }
+                HDLC_ESC => self.rx_in_esc = true,
+                // Skip data if buffer has overflown.
+                _ if self.rx_overflow => {}
+                _ => {
+                    let c = if self.rx_in_esc { *i ^ HDLC_XOR } else { *i };
+                    self.rx_in_esc = false;
+
+                    if self.rx_buf.push_within_capacity(c).is_err() {
+                        dev_warn!(self.sdev.as_ref(), "buffer overflow. Dropping frame");
+
+                        self.rx_overflow = true;
+                        self.rx_buf.clear();
+                    }
+                }
+            }
+        }
+
+        data.len()
+    }
+}
+
+struct GbNode {
+    sdev: ARef<serdev::Device>,
+}
+
+impl GbNode {
+    const fn new(sdev: ARef<serdev::Device>) -> Self {
+        Self { sdev }
+    }
+
+    fn fill_buf(mut crc: u16, data: &[u8], buf: &mut KVec<u8>) -> Result<u16> {
+        for i in data {
+            crc = crc_ccitt(crc, &[*i]);
+            if *i == HDLC_ESC || *i == HDLC_FRAME {
+                buf.push_within_capacity(HDLC_ESC)
+                    .map_err(|_| code::E2BIG)?;
+                buf.push_within_capacity(i ^ HDLC_XOR)
+                    .map_err(|_| code::E2BIG)?;
+            } else {
+                buf.push_within_capacity(*i).map_err(|_| code::E2BIG)?;
+            }
+        }
+
+        Ok(crc)
+    }
+}
+
+impl gb_softsvc::InterfaceOps for GbNode {
+    fn write(&self, data: &[u8], cport: u16, gfp_mask: Flags) -> Result<()> {
+        // SAFETY: `GbNode` only exists while its serdev driver is bound, so the device is in the
+        // `Bound` state for the duration of this call.
+        let bound: &serdev::Device<Bound> =
+            unsafe { serdev::Device::from_device(self.sdev.as_ref().as_bound()) };
+
+        // Drop messages which are bigger than what is supported.
+        if data.len() > HDLC_MAX_MSG_LEN {
+            return Err(code::E2BIG);
+        }
+
+        let mut buf = KVec::with_capacity(HDLC_MAX_FRAME_LEN, gfp_mask)?;
+
+        let mut crc = 0xffff;
+
+        buf.push_within_capacity(HDLC_FRAME)
+            .map_err(|_| code::E2BIG)?;
+
+        crc = Self::fill_buf(crc, &[ADDRESS_GREYBUS, 0x03], &mut buf)?;
+        crc = Self::fill_buf(crc, &cport.to_le_bytes(), &mut buf)?;
+        crc = Self::fill_buf(crc, data, &mut buf)?;
+
+        crc ^= 0xffff;
+        Self::fill_buf(crc, &crc.to_le_bytes(), &mut buf)?;
+
+        buf.push_within_capacity(HDLC_FRAME)
+            .map_err(|_| code::E2BIG)?;
+
+        // A short count means the wait was interrupted by a signal after part of the frame was
+        // accepted. The rest is never sent; the receiver drops the truncated frame on the next
+        // flag, but the message itself was not sent.
+        if bound.write_all(&buf, 0)? != buf.len() {
+            return Err(code::EINTR);
+        }
+
+        Ok(())
+    }
+}
+
+#[pin_data]
+struct GbUartNode {
+    #[pin]
+    rx: SpinLock<HdlcRx>,
+}
+
+impl GbUartNode {
+    fn init(sdev: &serdev::Device<Core<'_>>) -> Result<HdlcRx> {
+        if sdev
+            .set_baudrate(
+                sdev.as_ref()
+                    .fwnode()
+                    .and_then(|fwnode| fwnode.property_read(c"current-speed").optional())
+                    .unwrap_or(115200),
+            )
+            .is_err()
+        {
+            return Err(EINVAL);
+        }
+        sdev.set_flow_control(false);
+        sdev.set_parity(serdev::Parity::None)?;
+
+        let node = gb_softsvc::Module::new(&[Arc::new(GbNode::new(sdev.into()), GFP_KERNEL)?])?;
+
+        HdlcRx::new(sdev.into(), node)
+    }
+}
+
+kernel::of_device_table!(
+    OF_TABLE,
+    <GbUartNode as serdev::Driver>::IdInfo,
+    [(of::DeviceId::new(c"beagle,beagleconnect-freedom"), ())]
+);
+
+#[vtable]
+impl serdev::Driver for GbUartNode {
+    type IdInfo = ();
+    type Data<'bound> = Self;
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+
+    fn probe<'bound>(
+        sdev: &'bound serdev::Device<Core<'_>>,
+        _info: Option<&'bound Self::IdInfo>,
+    ) -> impl PinInit<Self, Error> + 'bound {
+        dev_dbg!(sdev.as_ref(), "Probe gb_uart_node.\n");
+
+        try_pin_init!(Self {
+            rx <- new_spinlock!(Self::init(sdev)?, "gb_uart_node::rx"),
+        }? Error)
+    }
+
+    fn receive<'bound>(
+        _sdev: &'bound serdev::Device<Bound>,
+        this: Pin<&Self>,
+        data: &[u8],
+    ) -> usize {
+        if let Some(mut guard) = this.rx.try_lock() {
+            return guard.rx(data);
+        }
+
+        0
+    }
+}
+
+kernel::module_serdev_device_driver! {
+    type: GbUartNode,
+    name: "gb_uart_node",
+    authors: ["Ayush Singh <ayush@beagleboard.org>"],
+    description: "Greybus node connected over UART",
+    license: "GPL v2",
+}

-- 
2.56.0

