Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792856529;
	b=2cK0xfOhXvdf1rfYjua0h7Fa4uU1rZpregNq4HcLrp8ELVu4idKZayGA8Po7TF9fj4Ep
	 W0oNySZjIzIAHpCVUCl5M32Vu5AvpojYHqHosK3OD2qn3s6TPBb15qmn30HJp+9ViiKq7
	 NHK0hssKiaJnwYHA2kb4t0qT7WrB+Xnw89fksab1Tvu8K2xUqhWVnJXDIbRxYsdOmDndo
	 uMs6/dySMs5XA9b7JCm6knOqtJhB7tCdCGV9WXmZAzojmFZW1MsSl7guMzp6TV9utogvn
	 MC+Ra9DyO4Vdi+us7KGpNV4E/lwFBQryDdsSFWgxIz9L79e4SmkSSO3XK5eNIR8058g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792856529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y0Zlmu99I73712v7dio42Q8sSfQByYjnANjrYzCm+Jk=;
	b=WUAyMxicF9UitnjlXhhpzfpKe6KcjYOPfbS8+PpX2wU0lIRDAi73c9T49yXFj7LgfqZy
	 CUzAPBsByFRFcj4hmenzs24JFsSJ6mhNdUCx1bTzZGhUUrCUz3gNyPhIDs2LF0Wo+jBfV
	 MA/Bmp0Gn2E6xBfpdW0GFT05alp+zxnmneB0QG7fvfh6pF8Hkow6q4L6jljFXYNQHr3kj
	 Bv6i/4vzh/eShUgRKN9KDyLWxGsYU8/oK8I3/52J3sQWbzxqLbKtR35WZoRDZ1ElpeGTz
	 83D/JIDKxMdxHZVBmOD5rWJIsSll+Uw4uOzExbA8OWQDNeKkRAndwHAC3v621Y/aGIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qz41Bwqy;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A658606A31B
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 15:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A658606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qz41Bwqy
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3550c917fd3so2679226eec.0
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 08:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792856529; x=1793461329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0Zlmu99I73712v7dio42Q8sSfQByYjnANjrYzCm+Jk=;
        b=qz41BwqyyY/FmwudE5RNN6xkRdWr7oi9Arxs3n1P7QJxIqvkOF/V4a/GtFbbVr2I5X
         7LrjYuZ51P+zQ3SQ54qtmKVb+nzsDnS1o+00bLzbAeYhQuYkjQM4g3axy3SGvKAgPSWo
         bvWu9kBrGxYUJ5wszVBlDWC90U0uJATwRiniaX4bMe994yBt5dYBaCHx6NnjOai8/7fJ
         V90Xx/N1FnysApb9zYe+oMBuphsJ3UI/BlLvZeNTbGDqhziGShxzOvaDeja9kXxfJBMe
         6cWI4gpIRNzmbYU8/9qwNOuQ66C3gYn2Co/zwoqdsYWOFbdFam3ktXl5hvaphfcy5mid
         zzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792856529; x=1793461329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0Zlmu99I73712v7dio42Q8sSfQByYjnANjrYzCm+Jk=;
        b=p9mIfPheO6LtkQ4VqQnxCpWKECD5+QmfwZeuGEH/QHlZTqtgbmn76R3IciZeKvRElB
         RqNHHWQFseYkzhkfO1fQ6a4j7Clzt/h0a0J09VVNZ+cxKR6xidRqxBSg+nxb8xi6Jzbv
         roDcqX6ET0op2tmoNQAmL9SSJAcmW5apxlfq5OJiKvF6d+dTwUnLf2fFjZb1C++uAD8S
         GmQR2/JLii9kh3IaH6brK4Dni+2YI0n8a3BbXluo63EaBEeYKsdtSSK7Papi9WXN0aNv
         wBmTVUIGtkMN7GanhBjgXYKdeQZlJ6U6S3qwblxNNzgGTxQRYeUw00HNxlDYTHvAm0yC
         PWsA==
X-Forwarded-Encrypted: i=1; AKwUvBxKu1UPtSpTw0QFDbKBdsiMq0SwjBFMTFVo5T5YQW015/WVSfJboRONhU+XtiSJCMei/ZR4uVsnXq4R@vger.kernel.org
X-Gm-Message-State: AFq9FYJRq3XKbBi3tazJIRg7la7+0oHJr6YF/IyzZfYzTaS13B8kGLPt
	3ix3j7+5IoZJ6p6mHqB/dEkuyn6BwpqP67SkxmYOnQTMlRVhnzeVDrP7
X-Gm-Gg: AYBFou1wbh0IOGqvkE5gCo2RPbPLwoR6py0mE5bh3tU8+Pc2spUz/0Z9HouFYs5OooT
	9fp+EwNlHPZg2J8cnTksACcmsodM7NSB4E/GqSjEZxh3MeKPTdypJ3E5EeysopN832kWWzOQpop
	YyHJ5mhM9RnIXrikQ8SzymIgAUlgk92ENBJ3zgTI0ZXgtuUf3kp/ATLSIKeutRrmQJfs43TQpPo
	/UXYelYejRcComYANNyeHCRbdUiXAuX7TEpRjD13EGHYexwZLKw592N9yGydCfUTJIzuMpgf6NE
	itnsrx9vZA7O1IiZQSdEzhobMYRN0/JFLPefBikps4lfRd7PkhYUg1LQ3ifxzWlPXLsVrP/O1ln
	DWZDumyrnDxzl1/OsgcBGyCVkGVIKWRKvpwxEpkKaNY3PbhdgzMju5NklWQbqCqCW337uFJ6/Lz
	mhCsF8CcBPUlmh+P5i1Sv7XbnCWKOqPr5Hz7cew2/kvpLcqS7GkybeaQm6C68QI590OZ8AShwfn
	fTj1LUnIM5liUOtiwLkLMRLZK+QCJwseCFmNUtni4nJJSZhJTvw3Em6iw==
X-Received: by 2002:a05:693c:80cd:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-369e842cbf2mr3808651eec.7.1792856528662;
        Sat, 24 Oct 2026 08:42:08 -0700 (PDT)
Received: from plex ([2406:6d00:a27c:4200:aab8:e0ff:fe02:33c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm7766450eec.18.2026.10.24.08.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 08:42:08 -0700 (PDT)
From: Chris Scott <gilroyscott1970@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	pawlik.dan@gmail.com,
	zhengping.zhang@airoha.com,
	Chris Scott <gilroyscott1970@gmail.com>
Subject: [RFC net-next 1/3] dt-bindings: net: airoha: npu: add DMA pool memory region
Date: Sun, 25 Oct 2026 01:41:48 +1000
Message-ID: <20261024154150.45733-2-gilroyscott1970@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024154150.45733-1-gilroyscott1970@gmail.com>
References: <20261024154150.45733-1-gilroyscott1970@gmail.com>
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

From: Daniel Pawlik <pawlik.dan@gmail.com>

The EN7581 NPU can only address host DRAM at 0x80000000-0xbfffffff;
higher addresses alias the lower 1 GiB. Allow an optional shared DMA
pool, after the firmware region or after the WLAN regions, so coherent
buffers shared with the NPU can be kept inside that window. The
firmware region stays first for existing users.

The original version of this patch was written with Codex; it was
rebased onto net-next and its commit message rewritten with Claude
(Anthropic).

Link: https://lore.kernel.org/r/atCRsquzA1UxSpCc@mediatek.com
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
Signed-off-by: Chris Scott <gilroyscott1970@gmail.com>
---
 .../bindings/net/airoha,en7581-npu.yaml       | 40 ++++++++++++-------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
index aefa19c5b4..21a1a27500 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
@@ -42,22 +42,34 @@ properties:
       - description: wlan irq line5
 
   memory-region:
-    items:
-      - description: NPU firmware binary region
-      - description: NPU wlan offload RX buffers region
-      - description: NPU wlan offload TX buffers region
-      - description: NPU wlan offload TX packet identifiers region
-      - description: NPU wlan Block Ack buffers region
-    minItems: 1
+    oneOf:
+      - items:
+          - description: NPU firmware binary region
+          - description: Coherent DMA pool for buffers shared with the NPU
+        minItems: 1
+      - items:
+          - description: NPU firmware binary region
+          - description: NPU wlan offload RX buffers region
+          - description: NPU wlan offload TX buffers region
+          - description: NPU wlan offload TX packet identifiers region
+          - description: NPU wlan Block Ack buffers region
+          - description: Coherent DMA pool for buffers shared with the NPU
+        minItems: 4
 
   memory-region-names:
-    items:
-      - const: firmware
-      - const: pkt
-      - const: tx-pkt
-      - const: tx-bufid
-      - const: ba
-    minItems: 1
+    oneOf:
+      - items:
+          - const: firmware
+          - const: dma
+        minItems: 1
+      - items:
+          - const: firmware
+          - const: pkt
+          - const: tx-pkt
+          - const: tx-bufid
+          - const: ba
+          - const: dma
+        minItems: 4
 
   firmware-name:
     items:
-- 
2.53.0

