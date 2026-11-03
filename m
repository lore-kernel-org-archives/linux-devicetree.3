Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722399;
	b=nNwdgs76WCaQPd8eN8KsdaZUnzLq7/07GIm2uGHNkolH65EJxoFc8mMmc7eNJhrKh9yk
	 Ij0+oQ+eHLOd+tNlRul7sXP7dZ50hz5AT6GK7qPjzQJzszqc20DvXAnIROJzR+Y+1Vq6h
	 wWf2l5XZSdnab5orGqEqMe9QtFtVCnfDPrMkaT74gDrdoMv4Jly2XAOPqhQN428ScnSzj
	 /8oi3RAut9lEY7UGCAEqVzNkEU3qTkLLNRU+Ixmi8EoXvV2b7taKWMWv7KqNzx+cTI7+H
	 WXfQ8XU+DLt20a0l7aB9OLTq3P58j0f5h+OSTw5h+l+jZBe+bJkU3bPiXLDO5SW2dAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wWz643dbsj/ZlYo+epLXd9Iw2Mt+qid7bAcxch49zgs=;
	b=e9yNSIWd3MMu71iQafcxVCaaNdFlJP0aNyxCu0ucX29RzIL5IcVP7YsGy25ISSYPQzxA
	 LHn3xfrgL7y2VuSDFZhLqMUC3POVJk9d/05w6p69w6LguILvv3US26nplILqdRBytYjQi
	 U3wpZxaRwGJMDYiANmWQku70gA1J/Zw1ehbU2lHWq9VVZw2V9Wnqid5AZ5g7V+GW3MNLc
	 b1xZuTOwmIEUu0Bqmz+JRhU6ocM9YkB75i//FTZaYTl6ZEqSzRKHMnOB6RB/06vhwM7/G
	 Y5feGurP80smXA804B2KPrH6k6FEbDvpfB7z73Op05jz8wmLRkfztzQScSNFyyohctQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=beagleboard.org;
	spf=fail smtp.mailfrom=beagleboard.org;
	dkim=pass header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=StUgSqvG;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFE6606D83B
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AFE6606D83B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=StUgSqvG
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a3c08d6928so5545121c88.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1793722398; x=1794327198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWz643dbsj/ZlYo+epLXd9Iw2Mt+qid7bAcxch49zgs=;
        b=StUgSqvGx+PN4GWlGASt0ZFhCnxPkfU/ta7LXI8aXfwBZyp8ApPK+MS3lOZgL71gj0
         rGDSW1EDnQOsu0HtCIB0TS3cLcvJOa0jHLxigPEC8Z26WaSlw4uX7eLoW352EyAtT+s7
         vzsAexLLzZ3oqbAzqfAZU3Rwepu/az3RtD5b0aqNKr/XuGvJrDKZRszWWdwRL4IQ7Q/x
         6hmQtpQbce8zK3mtUTlmRHW4xqIvomsIObsZ92FY/DR+H8M6BSJG75e34X9rsQngvdI8
         CRZ6yF9Y2OyyVl2L8Ty8QG3xsJ30/gAidtlRTtPRIKJlFSTyZNT6n9//XIAsiO72D6sO
         c9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722398; x=1794327198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWz643dbsj/ZlYo+epLXd9Iw2Mt+qid7bAcxch49zgs=;
        b=T38M/TyRHVTAV+ht7knkaLOFummRAmtVcZYrbi7bhz9o9fVlnTe9TcqMHAo9s2z2lc
         gL+qPYqef8Ri51s0jUTi89Iatos4LFfRB4quqUGRIbFVmWi2XwCIVwMc11bibeFUla++
         smvr6N4MQ72iHS9NX1nRNCnrRST2qXlXwiofvE+mltVWMFOwbO+KKKZAZFRqfj7cd05+
         30hWRGX9lMwXeL53EaTA4ngHQ0iAzxleMMT1OnDYcvyZjMnWSsKn+FE91i61SRYR/dDw
         voOyjFvSMKFnvspzrxU9JqX/qKFVcUKsR6ttyxlHkfyh5G/twTZFr7fwQ7PtZQBjSD1C
         pNNw==
X-Forwarded-Encrypted: i=1; AKwUvBzGKpb1vFSabzqXV4OWVA+oc+AnF169IFn4fKc0HCrZYCnOYMfGnXe9AfO7HF5qBnhLlBEeEA+L7KqU@vger.kernel.org
X-Gm-Message-State: APuU4Z+vd9tm9Qy8kjA42ZExjn89cw4jA4ihX+3jhD0BLnioeU/61JAt
	fRS0UNlWocS4wnDhAArCkukUtW2bXJFJuYcC1jgc1ujocrb63Lz+ZM4aH4RUezMNZA==
X-Gm-Gg: AYBFou3gMwxlg5U2q5P+FvO9QALvTRcgvXmykaYdK2x/DKCXwQajzchTOaP5rOu1PdO
	IiUqwfxGJvMwQvXpme08Ow2NkCU8SUUK+wG7K8WTxFLmjVE8/hWOvxmEO6FEQ2ITPPqtryuI8/L
	aOu8Y36eVolWazEotXKb1ocu6KiDLKigIzWK0Pelbp5yISlzGDaw1Tdgmj7LGBtJy3VzCuTystH
	gJFuGykiZdJ0ULjohecCAVqDWqRbQaj6FQrnnxhDeFEslv1U0fzRhJeAGUt42GlRNIr3VH1Bckk
	PXLuRJAh1O80Z2Ut0w+k0HiwHZ11GTZ0h0omj+joWrbNdCW0s32Ysqbpz+eW16792aU5/8iJs7i
	jMcuJAevN82QtPoXTyCw8Q/bLt+HE47P0RdPeoiQz7vcz+iIhhI78yU5qTUgu0M8YXHc4Ii53Sk
	sfj2XGAYTsYMpIKFEJPgePTEmasDsD6tWWCvxjv0KlmO+ahJlZu29GRJSArRzGrbtiMUZqR2wl2
	ziISKKAyr9u7zlTMQyBi5vCez7xh379CnIqZtdhe2p3zAZxNrVRFZHzd42Sf31Y2rYJidGx2YtW
	PUIJRHKrmIVA+LxkvMcy2pip1Du//lQ24Ud278Dl
X-Received: by 2002:a05:701b:4248:20b0:191:3c:aae7 with SMTP id a92af1059eb24-1ac5c64cb0emr21210142c88.26.1793722398223;
        Tue, 03 Nov 2026 08:13:18 -0800 (PST)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm47214021eec.6.2026.11.03.08.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:13:17 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 03 Nov 2026 21:41:52 +0530
Subject: [PATCH v5 5/9] rust: crc_ccitt: add CRC-CCITT abstraction
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
Message-Id: <20261103-gb-uart-transport-v5-5-f8e326d6561f@beagleboard.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3228; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=0tQbZbHo8xI21dpA2bFknxB1c/WDEfciyAdGxnoZAag=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBq6gfgEajv6qnlQO0MwzBfWGAC30/mhzQRLpa0N
 zjhW++byS+JAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCauoH4AAKCRAFzvXHieVa
 dKIUEADO4HBzwBbsfV/fxA0i8rusLIV/+aq0NlWSzoEl/NaNe78WxtSXrEu57bIZA3qG+9L4krL
 eRgFmWxtelmCEF9EwphJm1GCGN1pPFs/tvt6xlPs9fqNdvb2/WSX2D/WJmVv+N+TwQVnmXo1X71
 k61RUFTVGdt/XnNmJfoKMJPkxknBspV21QUY7CPWM9x9m0PG22RmD4J95ouP8asAyByug5BoU4e
 Cg1FLF45CYPPMti5u0DvGX3m8Fpn6cC+BbwruTqnMm5f6Zhnrtd94uaQQVjs/Kmrwg2nVxPPC+d
 C6kR+c5hZ9wNFMnbO8p2DF74EnHMZXkMsq0ZbLkpU/A8yoWPiA0mrmkcgMnAl9mX74Fj7P1a69i
 DYLtg3gOJmNCV9RSDrlrV4Kdj9L34ZRsiAJWp4mVXMk3QmPFmMaefAdDmtRD3AkOIj3CJLYvSel
 tNR5qZmbJBxawtyqq3dfW8P037cBMc66HY3rnQLYTE8/SGZru9KR3t1uTBW9Nfs2BIEzomLvzT/
 5DzsGQD+pFXaUQZszqQWGUh0Cex7t2QUgR8lkEqK6ANZBAwvUdAa9Pb9Dyo6IXYMzC4mXJXsFaP
 cOGB/eYDXSYjiqT2KvyWRaRk7oL/DeaM5sdgFDK2pvw8LMgRrG9OAUvNmMo7D/qG0XNj25nucjX
 lVWK0yZhEskc6Gg==
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
index 252b6d7ee163..772023e0e5a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7036,6 +7036,7 @@ T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-ne
 F:	Documentation/staging/crc*
 F:	include/linux/crc*
 F:	lib/crc/
+F:	rust/kernel/crc*
 F:	scripts/gen-crc-consts.py
 
 CREATIVE SB0540
diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index 927fc6a6b2b9..628da2d30fc8 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -32,6 +32,13 @@ config CRC_CCITT
 	  The CRC-CCITT library functions.  Select this if your module uses any
 	  of the functions from <linux/crc-ccitt.h>.
 
+config RUST_CRC_CCITT_ABSTRACTIONS
+	bool
+	depends on RUST
+	select CRC_CCITT
+	help
+	  This enables the Rust abstraction for the CRC-CCITT API.
+
 config CRC_ITU_T
 	tristate
 	help
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 3791af0aadc7..55d1a2d7655a 100644
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
index f9ef36217bb5..637442761d34 100644
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
2.56.0

