Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649478;
	b=L89IIPc9T46egkWyuTR0+i/re//+Tuo1cwd+HsaIfckC+Fn/Sbh0ugRY5GC3ACBVnIGk
	 W6eClBKg7KWgANsHVYLINltbcZ+9jp7pS0BNPm6XGf3+wtw2MsC4tG3dU3cLq4oFbQRtv
	 hvtkQok1u4ooaabmgJ86Z/zzI+egwSkEpMGeC2hSByD/rErC94i640UMUoZ8kMisn1Zm2
	 edDgxUVCW04jSK4Qq1YZBOLoYRfWw47R/rLtxZeFupDcdSfz/9hztL7EsqT2YqifbFbVX
	 hO0cqj9xtnLtGZNTtPjn7xwtsAZlvwF689oAts38nlfgnrzZJqYHlwQnnmtgq0/Bm1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=9We/x/kFtavsjCZuqwAHil7LDT45RYjQGWVveqfhXeM=;
	b=ntQbqip1PVBTXd3C6rifKA1AMyCFg/hT5SB1sJT2czddiwSYV9Ts23Ag663SKsXsx6Sy
	 4xbKKRKTypb40MUI+12gtmg6rjR605bEgbk8KlOvNpq0EtvQYB/RWiwVnLSXlexXrzcvE
	 aisWdIJ/E1bKdunLlEvA/hyZyqfXY61R0Fhxuq12vgXUq57mKFCKMvp7+Gw/JKsBTlmzw
	 RbHpQGx4marrywAsxaY2NT6mVQh8XLKhoPf0D3wZqRs62e4AimuW3VVxW3cuILaG7estP
	 GE9WmCvxKz+kPcnStHqavuAfvTUOC0X+d5bxfA9LpyBAuP6ARazuHopjYGiaP6xgADA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKlyKc7+;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAA5606A327
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAAA5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKlyKc7+
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so57313425e9.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649476; x=1796254276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9We/x/kFtavsjCZuqwAHil7LDT45RYjQGWVveqfhXeM=;
        b=xKlyKc7+DA/Gf8K7PbnxNgL9otqdu9NBuqKjIMuC+eKAToV5EA5k+wBTtFX27DSMGh
         x3xiT+NHDGEorXMZHmS7kH5z+vwQJEzOk58ANkMGoGZYX9R+RtqiqMJxytw5R0+/gCbr
         wu1VK5rC+mmr2acaBYictwCrCRK7TBZH38gEYfsnYCDEJuQFksepcc3xQNP4YNKAZASe
         CEoqeNyXrW/odj+KpBHG72dY4PE+DlCWzNadyx8EJ3pZisrxEtG09M0AKI+fG4JYA+yx
         FwcgdaPnC41cmaXhI9wB/GGqS0w9WtaJ3ZYY4BC2j/mtIadv0L8EFYhq/F3ALoAAXbxA
         P/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649476; x=1796254276;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9We/x/kFtavsjCZuqwAHil7LDT45RYjQGWVveqfhXeM=;
        b=vl2qLML7imvSj1SCZNVQIKygNijrm/OeGO/uedbCiWImAFdAKDDBEdalvHR8vv2OVt
         jHYgjQQUU+ihDUHWk2KhNvn21vqc7zwkDYn2NiFXAQHj45zbd6JBImnOoyahNuZhUgpI
         7RQnvmKJ81bIEevqEus1NODJ8rAX5mOtE3oXXLxEoaa3vZnIUPFOB4ML8r4PXGf6pS84
         Koeha9CD/eLGHZPbIfFxfkxLPE/AP3hxBF3t2kWBbm/mTZ4juIknCEPN7EELKBHGjmsT
         7ZG51yq8xIRjprBOPsjD7bcI9EQ/d8MpJfnom/L6nFtvcjUbQybMQFDbcRuPsES+7Q/K
         IAEw==
X-Gm-Message-State: APuU4Z9pjBRWjsUFcvlE+BM4p7x6/GB8L9zLxqhMC05oVrepJzTnkL1P
	LKAWogkl4WhM0uDP343OQpNA036eIja08dT93p7LvcoCVsNS7w6/Va28
X-Gm-Gg: AZFdTZeRqUEwdeP7j6bXKyvM/UgF0pMhL6eNxgj0ovghA6pxryP0v3PTocnFi4O0BRd
	6U6BgjJ6UVG9JMtvIePbHHSoEkNOWy7NlmZ7UfTyJUyc9DWSpAFoym3Zb0R/+jjU3q27Mr7dd2L
	A3lH+5Sd34TQ4XwDFLbzKg/BILkJzjnOHzvxQ+BZ5rSRX+mFba2dC5OYBmvq51a0V3Oi24sgG1t
	kz9J4G1claB8gUkb6hEmBGqvCeyh6/v0MG1fktwsuzopJMzb3R+m6C5EfDNtNcwbE6deCpAVw6d
	3n1ZUwjdP0YoGr+VSjrENhh0wG5mpmYZEa3PY16fz2hxoSEqS9v+axckMlJnhqI7Qi+H1zqbLVH
	C5ip1ao0erqshEFhdgu+7IgX365jy8V+YfWQQl+gPnwv7TdJv1g17cH5un7Qo8G5JaoaoxOQWiT
	Pf72ZKdcSWYYqMxRWCJmk/XczTPmt7Mq8mpxXdIjitvgI+NJdh6DjCXH28tYPTSo1ggkdjXRFFo
	QS3PQYhFB2+bfwnWvxlAI3W4P6VZgKJveBBfYGcywnZ7Pk5Bs+g4n7lNpOcSm9ji9AXHa6QvvR/
	4LiiICeR7CeZ39F/TRNnJJKYpAYlE31iNyzQg1cclPRAok0sEu/FqGmky1zYdzH3DFwxUEiCH9c
	VyjFp668BAA==
X-Received: by 2002:a05:600c:638e:b0:4bb:6c5e:b006 with SMTP id 5b1f17b1804b1-4bb887e265fmr363197555e9.3.1795649476302;
        Wed, 25 Nov 2026 15:31:16 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm506528425e9.2.2026.11.25.15.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:31:16 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Subject: [PATCH RFC 09/19] dt-bindings: serial: Add Espressif ESP32-P4 UART
Date: Wed, 25 Nov 2026 23:30:10 +0000
Message-ID: <20261125233020.1380594-10-vitorhg20080@gmail.com>
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

Document the ESP32-P4 UART compatible using the existing binding
properties for the register range, interrupt and input clock.

AI assisted with drafting the binding.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 Documentation/devicetree/bindings/serial/esp,esp32-uart.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/esp,esp32-uart.yaml b/Documentation/devicetree/bindings/serial/esp,esp32-uart.yaml
index 2a80ca997a0c..bf141db5e2e5 100644
--- a/Documentation/devicetree/bindings/serial/esp,esp32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/esp,esp32-uart.yaml
@@ -13,7 +13,8 @@ maintainers:
 description:
   ESP32 UART controller is a part of the ESP32 SoC.
   ESP32S3 UART controller is a part of the ESP32S3 SoC.
-  Both SoCs are produced by Espressif Systems Co. Ltd.
+  ESP32-P4 UART controller is a part of the ESP32-P4 SoC.
+  These SoCs are produced by Espressif Systems Co. Ltd.
 
 allOf:
   - $ref: serial.yaml#
@@ -22,6 +23,7 @@ properties:
   compatible:
     enum:
       - esp,esp32-uart
+      - esp,esp32p4-uart
       - esp,esp32s3-uart
 
   reg:
-- 
2.56.1

