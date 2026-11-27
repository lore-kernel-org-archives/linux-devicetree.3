Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760202;
	b=kmjVrSJgsG1rgHlPOE2RRbTHCzv+1THUYil/Rv0/3OBPP+ooV69OzcRZq3Z6nf/FOnIf
	 /uCTgtIp/mGIF2A7so9NRpQmV1t2O9uLOO4lRo5bY9Z3cUkwhsa526LA2NZvly0uAc7Bq
	 BcweOfkUEuhNmYuX4jEb5ki55H/+isxWGm84X8uj46tcSWFs9FB7gulI1K3I6NfSHJ/0X
	 b9a+eEZ65aKVLWuD/m25xh5Q4zhp4xcVKP+ybV3sfvBpjgZWTbS1pJwWQUqSBis5xAB1n
	 G9Vbu5ve9RnaeNyatw2XSZ+XLMyAvb8DqdC79yjpdghGJKFe8SSPLPOTD3OY4Gg9P1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=lGhMLPQFKL33MgWxErYC1jx4qA3xULUGaPqxhcEgn94=;
	b=SOP7NDRXZtxVRQQYxGJldWpSGtxbIhnWCrXxYSftLXybL4ZNNmUOCRsG1Y6w4CzQ8hBI
	 bw8mDC2S/0a9K66p7A48QlFgtI5Y8Bodr/ypGJo9vTaHjoqIlmV7Cbz17C2ITsyV/aP+E
	 78246DW5sF5qb1227WQbrISLx4BPqo+BiGu/eu9P0vGb2ASBds1+6ImXACKgSP/kUU+EM
	 ceGxFsVX06UbhQwRQbrROgc5P4ZacxwDrk2v0DiJrIhwqg4ZL3+Tn4CoEr9eJVnnwlIW6
	 QXrxMDWuimetAgSZVpLm/PumvaGjzhnMY9mAcmeTzw7hgw0XbuLZFctghIvowSmnogg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jms.id.au;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iyu16ByN;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2344606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2344606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iyu16ByN
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f0481b35c9so44216565ad.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 22:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795760201; x=1796365001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lGhMLPQFKL33MgWxErYC1jx4qA3xULUGaPqxhcEgn94=;
        b=iyu16ByNfkWTpA5IdYJdj9J08H+y9M001Tlu3Z8DZDeWjz2lkYG7PNgXwIpfMk2TRR
         Bol9C+q8wbdwI0BDW4BlVYRSaglld75VbjUjfnUakfVRjfEIl5/ydAyiLgPFuLkzDqGa
         awBPogDgS/25TFVHrGoVfH6qSTVHRoX5m4mjR8irUJE7R7TomLk77NcXMhooaA04DsdY
         thH9OArs6HfsFt0tRULH5v1xGRomxiQ1klDLX/Q1jBVFB0TyKZEACDDllAh3kfZ0HTt5
         tno1DOt3VgPW+xYo9ORjeG9L32Yh2kYH80bA43468tcY0/sn8AUYEuvdSm+Gu1XQv5xZ
         hNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760201; x=1796365001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lGhMLPQFKL33MgWxErYC1jx4qA3xULUGaPqxhcEgn94=;
        b=ZWAQye2/0mwj8X3oR/7vKQXf5Nx7FIkAgoe5ynPVbgRo+jHNCcKLABhxq9BkAd9dS/
         YXKqqOg8ijztYxiCKs/Q1NecatouJKEzON4IbkL55uqgIYRpKRYbA5iAV5hw0zSMuh5r
         P++OUqDnBrBhpkkTiUOq9xGqxQBkFOGjfSSv1ZfalY+X6RePUy41OYBanQryELcCFEGB
         d4LII70qADun8jslkuhaGcgqXsO4x+8wFyZMt2e1F4DhGepvAncxzkbWsB2BKzfsYMxU
         mZie7/zNE45KAvjT4ps4Zy9LGzw28qi5B5RI7H4L1INZfmX5eLZsnGCdRtMXiPvm9r1G
         t63w==
X-Forwarded-Encrypted: i=1; AL+hErH4gjY4JTHR/NeguZEkWXImLKa+hFIjV1oZKMExnrCGtT4KqbRcd8RnZmw87yjuxK68wWPSTGrQ8p8D@vger.kernel.org
X-Gm-Message-State: APuU4Z+sYa+UH7keym4UogzTUnhmS3U55qLCgh1vs9yLb6v3sT4HDrYK
	D8Qn8iX9GqYvCWUXTSERsyF3dzTirh0Pfb1MCWSAgpTbST1noPs71jR7
X-Gm-Gg: AZFdTZcWfh041r5hBD3CqZzmZXMKrBmenidd1v/5tfD++l7FoCVHsZal/25BJgT2D8y
	/r8f3D3SsEdV/D+6X95S5D32ODCEZWiBTpNs/oMYcwzfEXedvBBnwpByDS4Xj4hXizf5C17uocf
	KlJJfuVKEk5n+Hv02wzwhPZuzpEpcbGkoVPA687vvpHQfswlDgGZn+jQjyTXXPXHjcf/ffVpg6u
	rrhiHF01W4m6wGmdzdwij1n6l/8xjscEr51/WSrlYLKZtyJx63nfdB8V1LoYyvUrh47F33ZYsND
	Ftmf4mHy+YiBaI1jAdkpgYQo426454zKbd3cVcBl2zz3W5SoF3VyoWR0NVFUnmo8UuVmB8ZLdv4
	MGJtWtCby5ZKNIOut3lXWCbhP2IoaIqBVxX4V0oRGPp1VBHcG+wNEwRdnos6DWNp/HwVrzXZtQD
	2XSOpLKS5P4NL6wfidDPJ42mkmey7s+WJ5cchcDB9E+xj3onPd90B0v6LaelZontS3ub40PNWeT
	KZcOML+MpgxlZ/PCd+pxfqLpKR3Ir/uxMB8KTq0IEW/N0zclWUCdTYoD9+vLP5ombhxdF3oEHG+
	0q2QF85fYKcwcFojiBz0aKGYGODUMmj6se4eyYh1NhziYkwio5jnDQPcNlQbs/uTF6z06RsH9BQ
	doA/7yWWJh6JH4uXFVZwU0mQP5yCDAO8OoHrz+YRdXtBnQfAH/2Z9PVUwANM0jns=
X-Received: by 2002:a17:903:acb:b0:2f0:25ea:8fb7 with SMTP id d9443c01a7336-2f03f0c19f1mr213846735ad.3.1795760201296;
        Thu, 26 Nov 2026 22:16:41 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dcbe3sm114829495ad.28.2026.11.26.22.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:16:40 -0800 (PST)
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
Subject: [PATCH v4 5/6] dt-bindings: riscv: Add Tenstorrent Atlantis platform
Date: Fri, 27 Nov 2026 16:44:25 +1030
Message-ID: <20261127061432.17306-6-joel@jms.id.au>
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

Add compatible for the Tenstorrent Atlantis platform.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v4: No changes
v3: No changes, pick up review tags
---
 Documentation/devicetree/bindings/riscv/tenstorrent.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/tenstorrent.yaml b/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
index e15359b2aab6..7fb640e38455 100644
--- a/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
+++ b/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
@@ -22,6 +22,10 @@ properties:
         items:
           - const: tenstorrent,blackhole-card
           - const: tenstorrent,blackhole
+      - description: Tenstorrent Atlantis
+        items:
+          - const: tenstorrent,atlantis-evb
+          - const: tenstorrent,atlantis
 
 additionalProperties: true
 
-- 
2.47.3

