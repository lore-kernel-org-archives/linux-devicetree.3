Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250390;
	b=nyD5iXMsl3CVsxbpbKSGS3K2PdwWHnes6VP0C8CvYmsBTsXPwhyI32V1DnhRVoxJKvhf
	 v4MDOiwgZ9MShfWhRmg+umKvhwg5VrcVfpHU3fkYX15WR9vTGozCoED6BvgiSS+ITq34e
	 uGkDF0RbZcbOIOShGPpGuZVdDYP2ef2MiqaycAm8DJ+qxeCp8tsCKwzdmAc3Hu26+rc+9
	 hLJb6tLapt/pf+IX5hw1EsAJo5gwo5GW1Tli8P7lly8FWhQtEYd61pG77zZ76os+llEOf
	 bKDJAyjx4XUE/Iuwj2M+GZHWy+7BWcb3a7OYD/0EQfApcOuqyxObfMgNgQsHssSXq6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=CovTA5I7uRtS+rK/MoAKpr4q/R4ofKrh6kdcg3ZjsRk=;
	b=wylCAVkJp1HShLvN4G45+FuZxbByhKRxQ0OC/wM9Q4Um0ONsST+82bYufjGq/4d7iqBz
	 H9+xDB7JLuQcWtooDE4AkmzE46jLt01hXzbNw5wjTzZ44iVKJZq1obTwanJ27eocUXzqV
	 fUjhp11DCziU5U5gHMrh11btsq0sOtGZRm692oqVR856scNf7p3pcwfj2HhjcRujKNWgr
	 Cbkjne7YY8S1zaZYikP8wbo3lpWCmyvulKjb35fVQDFn2VWXA1WD6Cxgn1qA+sf28culS
	 cNKhpE1W35byqBMB2X0cquc3Y3wNir5TK+d5FUzhS1LXho5/ADQlfwuucAc6QlICRiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iwxsLAlm;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4712E606A31F
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 05:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4712E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iwxsLAlm
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2e7c8213b09so5359305ad.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 22:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250389; x=1793855189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CovTA5I7uRtS+rK/MoAKpr4q/R4ofKrh6kdcg3ZjsRk=;
        b=iwxsLAlminzYvBptDnBRm5gwKSr6xNCJXMFvGuDNq0B6sxOcBReZ34X15VYNkogTLq
         BCsstjXwc94FjXK/lY/5Fw2+rM0edRohKTYo8s9Trd3WGF0eMK0GFUxCrw5yDELYHMk9
         hwMJIh1iNO2j0n3YzTWCHRizeFEpMoCD8Tqoa2k0BXdriokc3guSNz9e9UYwqB5oGwLH
         L/DcmDcwMTXWm50BtOe+zbUtX4f0y0yP8mNAEveiEDaL0xuzoP/IAhmvy6/u2tDm98mH
         10LnEZGfAFpQaU9stluVmRqJQvLJMZAnbUf3c8x9DWNqYQbq/R35LQVUnFG4XQoTvmlo
         +2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250389; x=1793855189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CovTA5I7uRtS+rK/MoAKpr4q/R4ofKrh6kdcg3ZjsRk=;
        b=hFCJDP9N6dzTB91Du0HPMQpbTsSkA8neXqXrrf/w9DOyGchPOHgxCXl1sROeqt3Qq2
         vXJ5P7Eknz9K+BpUK7KlOMEM/nACEIorvTOucEfjLSYRRynP+G6VYw0G4UUINkcrPwCY
         rN8ZEQS5PgBa0iOHmu8+r0SR1ntIsNlj+6OcmQK91WfXYezosdHPO9dqpLWi70UcCslb
         D2paKcfHShlCLPVIk78/tx8lebvr//uchiRkNo27GBqBs5PmNyebebQTqNCMNB3PEiZm
         OVAGn9/Wi1CZNeKSYYcWg7ugLVkQ1fMLCozdVKZbrsUZwRnQR2mWIjy2Whm7bLbQIWMF
         +b9A==
X-Gm-Message-State: AFq9FYIFHg1RvLz3BOTWr94FJOBstQDf2KtsNfUOfGOJGj+bcp9zbs82
	i1N7s9MogqybU1+v2bzkogSe2NaVfhnEZM5Re8CwqYLP56al70MSY2Bs
X-Gm-Gg: AYBFou2PZ+fw46JNgxEx+kzvnO4vHmKxXKkIwmXG1DiiAgmwUXWzTywKqJqb2meQDCi
	/GbNbP/pjasCXZSbkHM6ug6OEBDEA2iZP4it4PgWBgeMZZyX9FXtJWlOF/+M53m6P/fWNKXUyqk
	QpMDzqBxHOxjIBNzyXHi2PM6PKHh/XkDVd7acm2DAjvl+SfvziKylOoy1rEOJhUf3eUEHBxZ3GN
	TY9pkNO2CCKUSHFpEt5eHtcaTnIuhfp3TTNANK4wU7EeVmeQotHa/B+hluEBrdeR0WJvsak9SKC
	7HllEzGu3xhjdJPPkE++cFcMHGq4vdV3+lnKQDfPRnIJHeN2cJitqmhc1lDh0WjBc0bLIjfAB1D
	dd0Kd6bg7QHMJuQd88vrvetBFyfN+thtBttRXvdDFUW4UPBB4tl6nZkNK83bqLAgMK3Jq9DBlYU
	/K3qxRecQEs1vrCSlGNixnPMiiGsJVY2C3png5Ksp0To1b1QWqTqAacshLFB0DMkygNSU8ts4Zr
	oHxml6wX4nzNO/cXk+p/DoE+t967Sz5nYSxJ4E7V/B1DXdm06tzWX/e1dhkhEzmUOIlDQ6TorHK
	OkaHb6O3zddOAIaY5OxNRnznZuv4
X-Received: by 2002:a17:902:cf4c:b0:2e5:467a:7a6b with SMTP id d9443c01a7336-2eb004f2a79mr39853755ad.10.1793250388648;
        Wed, 28 Oct 2026 22:06:28 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:06:28 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:45 -0400
Subject: [PATCH RFC 04/12] dt-bindings: riscv: Add Bouffalo Lab BL808
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
Message-Id: <20261029-rust-bl808-console-v1-4-b736ee920078@gmail.com>
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

Describe the Sipeed M1s Dock carrier, M1s system-on-module and BL808 SoC
compatible chain. Initial Linux support targets the 64-bit D0 processor.

Use the bflb vendor prefix shared with Zephyr.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 Documentation/devicetree/bindings/riscv/bflb.yaml | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/bflb.yaml b/Documentation/devicetree/bindings/riscv/bflb.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a3c14fcc6c2e9fd6297cc2556c1525f4bf8e90c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/bflb.yaml
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/bflb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bouffalo Lab RISC-V boards
+
+maintainers:
+  - Kwanghoon Son <asdfkwang@gmail.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    items:
+      - const: sipeed,m1s-dock
+      - const: sipeed,m1s
+      - const: bflb,bl808
+
+additionalProperties: true

-- 
2.47.3

