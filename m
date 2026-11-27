Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760188;
	b=jjHtrzPkfF0pSwnFa23ClSjMw2S5NKDs6f4nqlv2UsRzk+pOCAfpMXG1KVDxjmJQ6jzm
	 P0XtNrUsGSY2gf3w/n3xlfS81C1JpR2rUvDdCYqrlpRVVw4+52zv7cyVigPcMqxtZSUG9
	 2LgUWlE2+YGzXZ1uTHma9p/qh4Po3Dgqy8FIIHDHJd8B1QYVCrz5/+Pi6SkUn+NWWUJzP
	 aB1edX8W2vnV181aRBwzN+5TF4rxCjR39BEjIJhlvo/kA1PswX2V+8bL0bL/b9mkzoH4l
	 sDHNpkngp4hOp9k3H/xnxaD40bYogqM0XWio6Hc5NlFrii7mZ41lzqfJ+lj2dByIt1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=9fy0JbcPZWMZkbJbcUFDlJ6+t0N22Ex22PbKa8LtdUc=;
	b=wVU9jVPO7joEUuQPrbPHfE9/K/+YTxsahVE5AqRQijTeE63c+cwgLdN/manYuLq+F7Ry
	 sCpZiz6n83IpKOv8MYI6ONNXEEYeCB6PgsXk1DKpL19VcUNqZCVKGrCnlXmAJqOQgdVb5
	 VtSp4IerWQtl0KPATLnT+ii4cDHg0Z6hMCnrwQMMl8SLKsUWG/9e4nA2wb1WGhj3zKXPf
	 OZCTaSfZPOIIZhp9MmfKaY5Gjc7Ys2s7kCldul6ZHaOace7XlkeE/sCCQBwno9zbGdIId
	 TZnaMhd0OfzLRVSV/BjLgJvITZQNeiBhyPLWOqH2U3tWV1wMQiAzKBucKFWKM1g+Ddg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jms.id.au;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m46BVYqe;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ED9606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0ED9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m46BVYqe
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f01f296937so57932235ad.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 22:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795760187; x=1796364987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9fy0JbcPZWMZkbJbcUFDlJ6+t0N22Ex22PbKa8LtdUc=;
        b=m46BVYqe++lvFxPefo+FDHplbPmd20vKUoYu/kQnXkICpanJu54ATQuTWys9Xd1xS7
         B8kl3IyuTZ8Sygpaea6Tj4cTM7pkoGAOmDara0dt9juOBJMXuAnFRDpLCEPQCO4uCrKZ
         tZf5U/M0G+c+Oo/pU+UQ9PVrGCMr0qLMZn6nJ1FpJ4uIzRsOvNWgz48U+q+SPczIwR8/
         zXdJ9UlN60aMHKGQtE9FiH+eO42APLOVU6wYnaK3WxZcGEn2iPJ9QEzSmReNKGrb06rw
         4W7ZwKlCe4F3dEzADLcwtQGzwQiKvGOEsUt5CUel1+bApmnvnu/O8vRnXpLnwkMAPQrN
         bcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760187; x=1796364987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9fy0JbcPZWMZkbJbcUFDlJ6+t0N22Ex22PbKa8LtdUc=;
        b=pd/u9cmnzFiKR0TBuIdps7QMzOGf5tSyz5l5tjtXR2KtvVlCo/OjrsULmgp6gC4DlQ
         2Id7gCoj1yuCW8CP0iQ9bTi/7+9KOjH2xn8D5puLkJgdLnQvKminW9RM4QMtyCYPL8fb
         XA4xgq41qld4sw09++deyEqUzZxvuLr0zYBxzgONRh1CTnXa5Gdyz/GAo5gozh6/0HO5
         59lEk9tlsaj4/LbIplQ9/KZX3jzGm0ROgGVPRrJwBJFaB5a5lrOFF4GLy1mrQ9jZoMDL
         eoLGRxGox5WcFzaUCFMjzRyhc6XZpuss6dfEW4GZsUrlt0n7hFLQ8UBidIRsVCOyr2Ct
         vJqw==
X-Forwarded-Encrypted: i=1; AL+hErHSKvXbbwl2iVePoMGG5Q130p/fplcQCKhlHpte/CB03thWZW0Qqs2etU4t8TrnpuHa+o9irapkVJG7@vger.kernel.org
X-Gm-Message-State: APuU4Z+Iurnb9NMu9g4x5RKzsFIrS8u2CcjcX8eOWibAK54M8Y7LwpEY
	9rjkhWk08pnY9H02CzZNSf2Wghpewo5s23/QDoBb2KsYb36XdBbvMX1S
X-Gm-Gg: AZFdTZdAmoUR/vHKpuxHt9Va8NoCvHAQJasWW5/dv5EiZLtUZVfBmJJm8SOf9WOvbUL
	NXeihr0dTheDe/yPfP1en1xiRkNpBPthAF0BAyo9hhx92loph+Dm+DwGRU4cHAl5yQ6z9xA46sg
	1iYO1pYPS9AB8B8DnysvHDq5aBsC4PX8elgk54SDJe2m+dn9hMY3H9BHsKiDgphsF3oA0a8o8K5
	tiwikCY8ZI2eaxTEs3ZVPV3+7RE/wZBBgPbwF9Y11b20Kqf0rS4e82zb7beIOouQRfWDhY3uzpl
	CgpwgMyoKf5cXtNvUvF67xtslLz9nH1+2IUmqJKrm0x1pNGGmvaOekzJ6ysPm2a6DMEuFRjqcb9
	A8hoXW04ysaWX61nKWCr9dHPfEO04U57jGyEbwWYq8YjnatEw8/0ykVNv8JBmF+9w6KUI8eHKm3
	Sv6lvy+aXSmcRcjxN+nM/SKmWpMVDXnBijkieTWbDtptCbxElfzzG+NmLRTovDYI/9yDpfm5RMA
	Qo8azD6newDnDmg6t8f8ou0ubkDTlqPpjasNv5evPli/GNPcrgyXkQnsARJjcU9yADNgq/sfsx7
	SSBWFGl0myLUEoaqQyWX6PGIAmBQR0GaSU0llUMwTju5mgpnZNuF0VroKsKLlXebanlAL3I/JdB
	Okq31D8pGEBLDiRYm4sbhCV3t6SkdgYm8EG3G0dz5LehpPV7IeB9Q7Rze4b9hVlQk
X-Received: by 2002:a17:902:ec8b:b0:2ef:f4c2:d65f with SMTP id d9443c01a7336-2f03f248b82mr216106755ad.33.1795760187062;
        Thu, 26 Nov 2026 22:16:27 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dcbe3sm114829495ad.28.2026.11.26.22.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:16:26 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/6] dt-bindings: imsics: Add Tenstorrent Atlantis compatible
Date: Fri, 27 Nov 2026 16:44:22 +1030
Message-ID: <20261127061432.17306-3-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127061432.17306-1-joel@jms.id.au>
References: <20261127061432.17306-1-joel@jms.id.au>
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

Add compatible for IMSICS in Tenstorrent Atlantis SoC.

Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v4: No changes
v3: No changes, pick up review tags
---
 .../devicetree/bindings/interrupt-controller/riscv,imsics.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
index feec122bddde..442b8870f9c5 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
@@ -49,6 +49,7 @@ properties:
       - enum:
           - qemu,imsics
           - spacemit,k3-imsics
+          - tenstorrent,atlantis-imsics
       - const: riscv,imsics
 
   reg:
-- 
2.47.3

