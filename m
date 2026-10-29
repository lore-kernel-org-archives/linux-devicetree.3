Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250363;
	b=aE7gSIQSMdQGxM8uYjmWw3p1Iyk98PFEJQXRgrBiRZ6yWcQTd8PpnnNRjxGwG//So6e/
	 Lkz7Rw1Y18amS594G5raa5ykI82IvQ9fHk7wLesfQJTbcCKdZcx68rfIrFfVe+qAqFfnm
	 bUKAT8bdFaOYquKMU7gKki4dyr03c3bhYjKXxeaJV4BKRGFlMpE4Gqxr8VzMoZzcKRKe8
	 Yo+5+90njZsxhywXvZocSEcR6XaCUA1MaV78MSJb0IbmE1Gm/XZqRWsAfQDOp3acOrGRV
	 oR5kREaV6xiGmr1ipfVoJ9nfvMaF//3D8srR44YlVDXAHVfJxZd3dDzXIwn8Qg9jE1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=D8F/HdGuSu6Gc0aayMmmYPmWYbhMQ7jikJBXSJ8mNwQ=;
	b=CodE4rDTaHSywXEuSL0431zsE8oQ2HRiuc37Sgtup4h0OIf19/AcmdaUo9qZZm3wp9RL
	 nQEcVjc2sx9WXf+5PkxFntI5TlQHTfNnmqkq47iXuKumxTwTKsb/1DeMmaEk1VoG1/DGY
	 UPGMENtxb9RdO2kU1fVJQOFNCEUJXWoBM1XIXhp6PLYVjIAS9s8roPn5BJCcX/xtaxG02
	 aOVF+SrCmSxAmPYF+HS2qixRH0IE7iQ+Rd5CqCG6gN3jM/AV5dcjepITw7quzcVUaROzH
	 BLgq9kwTm87wYJBJvp9CnYflglHQ0y8Qnz02RVTKHp8ROrdFbkJMfs11RzDwNfpFiuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gl8ey3GB;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E66B606A31F
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 05:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E66B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gl8ey3GB
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2e93d9c7973so13760575ad.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 22:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250362; x=1793855162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D8F/HdGuSu6Gc0aayMmmYPmWYbhMQ7jikJBXSJ8mNwQ=;
        b=Gl8ey3GBmfht7cSiQpmGNQR7xbwxpuuCKBlHrmofBx3tYVS09O2r0+HnIp4+gY7eQb
         wVQTGz8djp2TKsDRr7wy8f938wlJDT0gNIDUcgLF0g7YkAixOl1Y0bJJhi82SYVnn8/M
         TsTd34RjtjMt8hACDdnaHMbxL8GCwep6ZN5HmMiMPTXMqKj/HMx6BDQ9NvDp6qcuiFZ1
         kS3Zd1977XVul4kACm4u0F0kGNRhBP+YsnyhWmWDNlEyhNLn4phCpAWx/hn+7Qxta/6x
         uNMlNzL5Ppj1aNieFMykIoMPwGCx1qS2CNO5TldnIcnGVEWizAOyryoFETmlD+L20m9o
         SYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250362; x=1793855162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D8F/HdGuSu6Gc0aayMmmYPmWYbhMQ7jikJBXSJ8mNwQ=;
        b=LbI8Y/YgLImcLRCXwYiHPit4KhNEubsqqkABl4ZvUWXgnXgYe6Vn0VLO0UgL+aTHyu
         GJ7X9+y/8BfOunNNqg40h/6dfyYsZWL8l79iJZCGbkvh26F1Y1+iNHNxR1MAeSAnfGJY
         XtR2ojrU3zJFgJwTJpWpsp2OoabHPyrsWYWx7p1QV3W5bvTs9B/570ZUHbzhmNziu9gH
         hB6xyqlEbPhgUu5BXdHLRvKw76waI83QXpiNpD+yUHg4ogmWPisXcjQLcv9qJUdWDHJt
         ZVzu+mD1TKcAmqjIl1kkd1iFXcKb2FTn9gmMBFM09/Bch91nrPfOeJo6O+mddXm+HRub
         jq8w==
X-Gm-Message-State: AFq9FYIOAX4oygqpRVaHHadJSUMiVOaMdgtkWGPa3//o4dAGQw+Jp6N5
	eLXnbUkTHjVAVqqKRSjEUIwvTu9N1W7BQMuAMTYMGWMMkdARGYVEHI7O
X-Gm-Gg: AYBFou0FM0JxDz7ghwd7saehnSkufvA9Hw4YhQukNyjUiSOneA/7YTkLRM79+dEViX0
	wV0BfQowvFfbEk8N4mZCXwAaPSq1qUbDNvWrqJHpet0Z+pjjzOFJDD6PyPrG5OWJhZrnKqTns9s
	BSOxjv/eJ24vBkIz8E/USlz3Pi0v4CoiRAuwiRX7foHviFw70ZQjiHVV9Zp6TNoiKab7tlZMMxi
	zDbvPvGDX0wRrE+DMdXY7MbC0wjvRdL/MbV5WQ/Qoa3pFyZcuZppgMed1Pl7J6gnqck/ookow7V
	BxPwHMDleXmQKo0TZ0WzIHGfcjJuGa2zb9TdjsSVC1SQPWCPhP4ASt223w0IyKRNsegqWDCK2yi
	GZjypB1NtfVTYz3iVpcpwrmSwssy7UR7LYxhylNFfnK5n6fV7L5nZ8nd6JO6nf1vUDg3TjJhJqQ
	UfdO9UlGf5uGTsj3Zk0GrtLBAEGvTezAHM+HUO5AspquQzDV23we3tNsQXHD82o9NXJXuenq8eK
	Y4sy8SnUeGlpw5eLRDixWMu5c5CoDSIRAw4vhmLqiZ4ySLQrKcWLddm/b/VnyvsNNIpxAvF5thg
	A+JeieTWEc3MY6rXQbGCwJUGUnn6
X-Received: by 2002:a17:902:e88d:b0:2e9:5714:6081 with SMTP id d9443c01a7336-2eaffcc020bmr39772385ad.0.1793250362514;
        Wed, 28 Oct 2026 22:06:02 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:06:02 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:42 -0400
Subject: [PATCH RFC 01/12] dt-bindings: vendor-prefixes: Add Bouffalo Lab
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
Message-Id: <20261029-rust-bl808-console-v1-1-b736ee920078@gmail.com>
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

Register bflb for Bouffalo Lab Technology (Nanjing) Co., Ltd. Reuse the
prefix already deployed by Zephyr, including its bflb,uart binding.

Link: https://docs.zephyrproject.org/latest/build/dts/api/bindings/serial/bflb,uart.html

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1012f08e26f7f105ad846ab3629ac..24c670ff75b6f482ede1bda3b59c70ed9116042f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -249,6 +249,8 @@ patternProperties:
     description: Shanghai Belling Co., Ltd.
   "^bestar,.*":
     description: Shenzhen Bestar Electronic Technology Co., Ltd.
+  "^bflb,.*":
+    description: Bouffalo Lab Technology (Nanjing) Co., Ltd.
   "^bhf,.*":
     description: Beckhoff Automation GmbH & Co. KG
   "^bigtreetech,.*":

-- 
2.47.3

