Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811BE3EFFC2
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217990; cv=none; b=ItU/iRPAaDGydU432O0wxrXYAT1ZPAfboibUVieZuVvdqz+j8QEx6opKkg0WD0fkM5ZXUPGQkGYtsOkoJTFgffECc8Nh5PvNfFsRegC0q1a9qrg2Po5I1QSh2bPUWKs6x52B7H+jYg73zRUN/x+THbwndgoxSZ9QvRaCS6YvIM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217990; c=relaxed/simple;
	bh=qF6QJG+x2F3MFGOzlWWgsKKJxbY3kfRztIUvB4yU9lY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YdkW4rFIOBE3NVjETz6EAGtX1hVCVJAASRs8GY2LhQ0cf4o4VAzeSt7S0RoYLPvm29khjMbHIytMgtgbQewfNm9W+tzxH5jj7H1Q4od2XIxAJBDkFrm5epA6u2lIQhAW/i0tDXvUlvStUYg8p0Q5ZFHxw5JYgq0gdxUq4jCTyas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20251104.gappssmtp.com header.i=@beagleboard-org.20251104.gappssmtp.com header.b=VFcGkKUR; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20251104.gappssmtp.com header.i=@beagleboard-org.20251104.gappssmtp.com header.b="VFcGkKUR"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e347638adso2160173a91.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20251104.gappssmtp.com; s=20251104; t=1787217983; x=1787822783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2rVwkPkMhDUTtHvPL9LuODXAGIutmblUUDkUxchgbg=;
        b=VFcGkKUR7iyL/G91pR0sHWIY6EJpSUuwYVyZNLMn46Zib0km0Iz8tSYYB+87/g/EA8
         4glxbcoIsfhYfgKJz1LVGwLgd0coOxpapYIbEklxtbiPpdEWWBjLJhvH3/8FZsLs58fL
         iw+iRT2A5yd57xTHnSRsBogCcLxHWQzi1243P6kN1PVDTJrV+ge8dsz0S2v/rVknwqPG
         cfU31WXRTP3DUwl9iGeWlxP2wfWDT8aIyJq1C3qkUJ/YwkS5G7PPplXc/eGoaQuBU7qB
         JrKIEPcsR4sFSE9KgTZyeWF3uqwi1uIgad57gWqTdasleKkAH49Znxn9tih9Ym7v9HU/
         jJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217983; x=1787822783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P2rVwkPkMhDUTtHvPL9LuODXAGIutmblUUDkUxchgbg=;
        b=QQ1inQn4ufJOEEuSVbQVyqMgtvl/wFiOd+1/EP+zf/bYlX/vKCcPw5714Exp02Gqte
         RU+tcLIed2K7LMB5lOo9GJ1RwerKs6ASBOy9gK5joN8DRjLPyCCC6Vchd6AknGVE1Xks
         l7zRGop7GBQ6eX887crZDxFUIrFqLiEOtt25SgvuKqrNj+P8yPNkruCKB7BoJ+w60k6T
         5YDXFnvDvjlLi1n6/CKyXjgYQnK9yAGd5UkZrGOcZXVzoj35/WVy6my5woCXx6vZi//5
         Ib3rd+r0uSdExDBMdyJ8gv51g5HRG4+jj0FC+dppm/6gYU2QNcI9xeK/fvAwzuFWWK2S
         UXXg==
X-Forwarded-Encrypted: i=1; AHgh+RoOC1GuGRBH5hIeGk3NgA2yjOwFCKN+cZKaijrBvSfdAsEpKk1XDnZyUwCjf5CJGVuD/NtlY47QAoWy@vger.kernel.org
X-Gm-Message-State: AFuF++l2YFrc1uyiI784VvbrzQYYMjY3tGAQz0c+IWyllURof4fSpreo
	AJF1sgMcQx6t9L5IxUuWelWfQS+RJAHuyRaBvmVCJ1D8Q31tD325M1p3lqBqTxcfIg==
X-Gm-Gg: AR+sD136ZbPTKZF9LUwQmQcbz1INOTal9hUZL5oPyQgNJPso/UhCZFYKepcAoZOYelM
	2PVx4kmehdr0g+xbcOSJ6mSlW++07YxyqtmLA3qPANCA9FoFJqN2Dx6nlSqz/XfAOFQEjJYKk61
	14IyjlHOX3LnrFp+ztZ+7dj2ewsyQ3vWjRXLRS+HW8g4gM5BMx9holwUTYk0xpwfvwFt753suRB
	by6buA6zDyNJcVwRcF6eiVdcuYUpbA78wH3/EGlEUbPew3rtA1S5RzSYquo0GKbnf4v0P/rsDmr
	x+gDDB+60Ek1XtgfXLuViVetsMAfjkcIv6LGWSNfGA2qK+a4iNBXKcBaFCj/2vGr1o8hctoNnwm
	OT94up6m2K0FwWwxNK83EZn10AeFZbiYos7PDpgZYclLuhljcoHqqBMd4fFpX86y12oHwDAS8hv
	AqMtQS5RZg7jPfAs/raVGRGBDvwF8yv2QsiC1ZV1Sz+Zcn6f+I2O0VHadEjR4RKclc6vmaV1U21
	bDkHF/C5Q==
X-Received: by 2002:a17:90b:1804:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-395810b5a15mr20049832a91.12.1787217982703;
        Thu, 20 Aug 2026 02:26:22 -0700 (PDT)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad6060asm25903254c88.6.2026.08.20.02.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:26:22 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 20 Aug 2026 14:55:45 +0530
Subject: [PATCH 3/7] rust: crc_ccitt: add CRC-CCITT abstraction
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-gb-uart-transport-v1-3-282da14ab7b7@beagleboard.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3258; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=qF6QJG+x2F3MFGOzlWWgsKKJxbY3kfRztIUvB4yU9lY=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBqhsgchxLFdpTnYyMaodyuVmlWP5VEW1HbtK7r+
 aozb3AJ27+JAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCaobIHAAKCRAFzvXHieVa
 dGDrEACNRLj/fVXbdFOzhvcCj5oDgnno9GNFaye97zITV/IOHQGamlMtDEckqKlkH6+C587HS6R
 JrvOZ1Luf28bdEiksiaa4rYqDrp9/HJrWn9S75xlmxFYIFXJ1I+4hU0rfDXvLOSebHNrP6zgv4j
 4HeePF08GOAUlGaO6vwUOIldAaQGywTxnJz5fsUj0TD+UT/YOJpC9j26sSmJSlsGGwD6Srfbyuu
 trBi45RVB8iQ2l4rLu17hU1DnzCEMHRhc+AmF3FyZ9T4sfI3aWUUaAiZVTpS6L83zxZfBqxluIb
 MclGV9hRSeceZpk6MxwPH2AZIGkz3nm/q4J77CP8mB4NFLIpvyhxXiwpbWB7+RZ2KpwvC1VIbUr
 aIlUFLQtnH6ZUWmjivWJHkhLD8MWQYJx6A1RjfvM88U3AcZVHBi97DF46NhoVkca+Kh6lXn7gSX
 LOOHHowCO4FV3KRbqGwuY0f1exuvYdFiUtA/qHC4CsbMiPk6ioaktdqAlAkEACfBz7jogglWRkN
 nglkdxmKNypeEdO23ptVuM2IoZM1GMi/qVUVD8vSWIs5Mk8LOl5MXE+c7us27aHTvAAVh0K4joz
 mbpK/o1TY/iS9yiOrT6IRG/yLEVmtmQP0WT926HXgEMx9NRpSKNcB4WjhMtNYPJuDcCCu5fdPpA
 BEgc1WyoP8oiHDQ==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

The module is gated behind the new RUST_CRC_CCITT_ABSTRACTIONS Kconfig
symbol, which selects CRC_CCITT, so the C library is only built when a
Rust user actually needs it.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 MAINTAINERS                     |  1 +
 lib/crc/Kconfig                 |  7 +++++++
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/crc_ccitt.rs        | 26 ++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  2 ++
 5 files changed, 37 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6008f16ae2ca..1e3b42eff741 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6921,6 +6921,7 @@ T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-ne
 F:	Documentation/staging/crc*
 F:	include/linux/crc*
 F:	lib/crc/
+F:	rust/kernel/crc*
 F:	scripts/gen-crc-consts.py
 
 CREATIVE SB0540
diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index 927fc6a6b2b9..aceb8fe8f0ed 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -32,6 +32,13 @@ config CRC_CCITT
 	  The CRC-CCITT library functions.  Select this if your module uses any
 	  of the functions from <linux/crc-ccitt.h>.
 
+config RUST_CRC_CCITT_ABSTRACTIONS
+	bool "Rust CRC-CCITT abstractions"
+	depends on RUST
+	select CRC_CCITT
+	help
+	  This enables the Rust abstraction for the CRC-CCITT API.
+
 config CRC_ITU_T
 	tristate
 	help
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 24d659a87c1d..6eb3caaee497 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -49,6 +49,7 @@
 #include <linux/cpu.h>
 #include <linux/cpufreq.h>
 #include <linux/cpumask.h>
+#include <linux/crc-ccitt.h>
 #include <linux/cred.h>
 #include <linux/debugfs.h>
 #include <linux/device/faux.h>
diff --git a/rust/kernel/crc_ccitt.rs b/rust/kernel/crc_ccitt.rs
new file mode 100644
index 000000000000..6042ada16967
--- /dev/null
+++ b/rust/kernel/crc_ccitt.rs
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! CRC-CCITT computation.
+//!
+//! C header: [`include/linux/crc-ccitt.h`](srctree/include/linux/crc-ccitt.h)
+
+/// Computes the CRC-CCITT of `data`, starting from the seed value `crc`.
+///
+/// Pass the result back in as `crc` to compute the checksum of a buffer
+/// incrementally.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::crc_ccitt::crc_ccitt;
+///
+/// let one_shot = crc_ccitt(0xffff, b"hello world");
+/// let split = crc_ccitt(crc_ccitt(0xffff, b"hello "), b"world");
+/// assert_eq!(one_shot, split);
+/// ```
+#[inline]
+pub fn crc_ccitt(crc: u16, data: &[u8]) -> u16 {
+    // SAFETY: `data.as_ptr()` is valid for reads of `data.len()` bytes for the
+    // duration of the call, since it is derived from a live shared slice.
+    unsafe { bindings::crc_ccitt(crc, data.as_ptr(), data.len()) }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3edc343caba5..45c4f4db51d2 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -61,6 +61,8 @@
 #[cfg(CONFIG_CPU_FREQ)]
 pub mod cpufreq;
 pub mod cpumask;
+#[cfg(CONFIG_RUST_CRC_CCITT_ABSTRACTIONS)]
+pub mod crc_ccitt;
 pub mod cred;
 pub mod debugfs;
 pub mod device;

-- 
2.55.0

