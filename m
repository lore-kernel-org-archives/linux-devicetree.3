Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250381;
	b=C0xUTkrFLkNe8NgavlBSL772Pe4Sn2Kp4HeJCiqm0opMYgnBmRaQjpUJ7ZsHtwEQPVDY
	 L1+rjc9+srXdAxMWR9NKiCiu6l/g0lksj3ToVtZJfJLkmBBg9Qo6Nr6IAUMXVwq1bGMO1
	 UWAiSxgmHigkseCRBWEH8zgHo0UE43FWcX4+5ltdYayBZXaN42gKCQXtdgXRSwOgRtRzX
	 jWYs4b0/lf8Q23jiZb/rsKeJAdW7hD2pWgdx0FLvTSQgLqB14Z0+0+khHcv2hdkPqkVlG
	 t9v/t/9nj/VzaUArKL90fPuM5fW5e08C8dLkaQQRX+EzDEnZ9tuZ8GhAOAR/hF8YCMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=4pcGqj7EcqEBhg8rTi3U2rPWxfkoRdeov/It4k+I+Yk=;
	b=Sq5pV67bjnIAH1ucKfmPAHoLBU2y8AXBwFOOL0OJhQyc0iTFVPQasrfrHWVdL8nj7ktl
	 nsZAZIUIPmqQft3HQRlsgRf/BQmbaVjIkZQ9jLuOrULCbsefCSoMQMH4uM+4t4irxs3SK
	 nkOn0K03Epz0CRNOviz4Vp7RRhqg1bDmCoQNMF4XaJIxJ60rQc1cvBRyWLHn0suBsaxwl
	 m9eF64c+9ooA0g+4aiq8qmN7g08mijT8hxmPpo9Vxvie2Dv8O5C+CB6Y8rpjSKVR8A1uh
	 uAlt5gkfBiGggmz+jBokJk9N1xtNsUv5EOghP72ErcP1Jf9O8gfcJ+Ui8vDMlk9nmDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z+O8EIyU;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEEB606A31C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 05:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EEEB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z+O8EIyU
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ea138a3497so9966925ad.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 22:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250380; x=1793855180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pcGqj7EcqEBhg8rTi3U2rPWxfkoRdeov/It4k+I+Yk=;
        b=z+O8EIyUDM3BtcD1Yx+C7oAh11I9nR0MCUlgL3ALaofjFPr87O3qwTHMb0KwOteZ9R
         0cwM3kRXpkcEfO6qrZAvwIAcuKigraV94opIHJDWIKiTMpviMPbYON3NUoFaY+WaQP93
         6PEyAtpOt5C+yA0/Gg/CqAGt4oydFJKCV6/vsqxNYhjRfM6RBgikOTsAIR22StKRpk+x
         Amjxt+VRUPM2Zaz2nCnjzuWiAvSwLW5LyYUB+YrvkWE7Az61qyadK+F9l1psyB+MPrZW
         zdutJqgc+QZFFjS19kim6bzhO5GYFyUkwhFHVTGrPerT+qmNxMQFykUbqErajqkROqvM
         bF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250380; x=1793855180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4pcGqj7EcqEBhg8rTi3U2rPWxfkoRdeov/It4k+I+Yk=;
        b=hjdlMOgmgihY44jdqJGZXSfzyRIj9hcBLgztW1h3/Lty2BKHwKgcAHu5PHgeHjE/Wq
         BlL70zMBJCYjRnBa2dKjCOnORMLfMBOwcI0fRKdGGu7ygahMgFICFyOnjPYv4QJk2cI1
         NmeNBvfvcphVJS4b0jTYmaQXmzWfiqgzE+S1nZHrV+0GJuW0NpFJxwrhQhEeSqGCSUqV
         XmpoAANK2mORVgmkxS4sz9o6bQThT4Oxiyv99cPdB40paI7qZjv+HuMR6W8AjlsLO8B2
         q3097/oDbtpMWecHRDZ91+24Sp6311AHzKmyjbnLVDa0CJ/FEHP1PRAVHmu1UAutgi0S
         G1+Q==
X-Gm-Message-State: AFq9FYKIgU/29+NhJhIl2weJuLTlpizGCCplPi1oa79EVN+cnipRS4v4
	fDYb/CZ6hs/SyDwfsExe2IpcFh3RKSKbycfKyzO4MreVndhKGlPOmxVY
X-Gm-Gg: AYBFou2f7tUU4ju+DBPvSn4O3ss2zYs8Ovj+ehGAQ31u83XhX9Q2J/Sw3xhmaLCEXeo
	Ep2WD99NymFwXW8n9maUxbTIaQ/YwJ/L0hicpyFMS8r0wwUaIU/y/BM8Y0Q9BO1dftHF1fCtzcg
	TvE2I5cw3CY15nwKA5gJ/TH7FDkltBmq1T0+1dxSgaSoj3j/vr4IVtSRtCb09XmH+7dW9AuUift
	+DUDfbqcEySFetI25sme+M1z8Mr7FYZ+CWyt6W6mGhQoqc8a60NsSrpyE/WyNFhuEDARty9aEJF
	MqVOBhNT6k+QsQP/ytcwKan89ReIvJ710Z4fgkYiU8QSDo+FSOHsKwQk+HrTP8qp9j7yFSRYK4f
	gPN72NkGeKOQfo6ryxe3EcCtD3NnNhH1PvrRhIMy48Sfnawgc3z193+bzPwDYJwWzBeaXY9QqGn
	4AKDJVGHAh2Br6sO1zbV4TD4totzSS9+vLWLQO2inS1HdfTuaoRssi2DEu+6qJcJRweYXv7Zs+M
	BpQJGCoBBSRltSiaAtLazqyKxvKtmjysjcWiazuMu9ECcb82ws/snCsKbOUvdZIfJAXHmF1yUYv
	3FO8Gyijy4Q/Yt5V0ne6rS1iF51B
X-Received: by 2002:a17:903:380b:b0:2e9:9c65:1aff with SMTP id d9443c01a7336-2eb0041ee21mr39673785ad.45.1793250380523;
        Wed, 28 Oct 2026 22:06:20 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:06:19 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:44 -0400
Subject: [PATCH RFC 03/12] dt-bindings: timer: Add BL808 CLINT
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
Message-Id: <20261029-rust-bl808-console-v1-3-b736ee920078@gmail.com>
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

The BL808 D0 processor uses the T-HEAD C900 local interruptor. Add its
SoC-specific compatible with the existing thead,c900-clint fallback,
which accounts for the lack of a memory-mapped MTIME register.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index d53f52e80d887b40c0d20049d86867c8a5b6fae2..3934c0842751e02174c1be6074548e3e1e8f11fd 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -49,6 +49,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-clint
+              - bflb,bl808-clint
               - canaan,k230-clint
               - sophgo,cv1800b-clint
               - sophgo,cv1812h-clint

-- 
2.47.3

