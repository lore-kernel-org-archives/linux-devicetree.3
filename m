Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201093;
	b=WP4aD8HUZf489Vy2cexqwqC6wyYzpvyqkQf3q2D1BJfOeFSCbRTXeZmj5FSAJr3GqRgx
	 DwKxALDkZxXhuIrQ3i0wGCiICWZALM/l2X8D9kRbjhdovuQBvtK8iaH2Z7lGwnbQOwdwr
	 dzxMHL2z5iY5gK7aA2FbYX939TItzcQhrj0wWmURZRrUUu3ipeP/HvJS4LRXODnxz1IyV
	 J/KRKu4ZAffdhe/8XFjbIrXpI+c4JWkwIAgt1y2tCuZyFAeOyou0qOtgaDl0mxrH6TAVW
	 5sOHg8RQbGqP6EPNfvkGppA2/aJ03iS8deU21j+dzNQzsPo/nzlyIufdtXBUFr/qoeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=qLBVynAnMVn6ipdjcgOcOiimigVGkoS4o0LHfR73ptY=;
	b=tqIsql3pcZWICUaPkVbdzLi5wWDdujhNrW2WoPPgz5yq3yIPn/djxdrgVAAQt6EDyEFU
	 w1wjQwIwL7cgyQ2cGxmRXECDu5+Weo5R2VpAAGXYfw6GZIB3aRkHVuS9/S4ohMFn2cF1I
	 ij983i8/zA6pyoQN+sRRZqNd8a/wpiMi3gAoi6NNtYH6GMHcEf1FkxUMCLNMQidVbvRC6
	 SsRmIv6okPPZwLQzycJsSjQk2l6u4xwAXF/JCYelCHl7QraN3LcI9QY5vDxeP+DW+fsCg
	 kBQ88dLpiek8cckeEVwlE6l6936gvfZnYlxOTE/VqLEELnDRFf4YJCbk7BQ//Vy2LQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jms.id.au;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uexjiWEk;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901EF606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 05:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 901EF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uexjiWEk
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb684859cbso267542a12.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 21:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201092; x=1794805892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qLBVynAnMVn6ipdjcgOcOiimigVGkoS4o0LHfR73ptY=;
        b=uexjiWEk7XfIWDFIP0NFQPjGkFjko/ec4LEziAyPOTJ53w6GJRHKGyewdghgCX6RaM
         BV29gHcdpQrt7tDKguetRCOfRfQ3TN/MnLmGVqGk3u0GY4xocnvfQZPlwvou0H/+NaTj
         vEzX1767VFXrIYRBzlKxin1KSNmQl6C2VIWZiMFJIns5RJ7Aqvlf/3x/u9X/5uKV4ZSf
         knKq0q26ZeYXdRuOOy2CB4fSHB78wmItDmdQNQO/2qaRH2nryyJwCQ3MX3Dly81eu8tC
         UwytYJidmh1Ke0ztvpT0w90rWGFOyLnui+LYTMfuDnLV+57JUnB7wwbG7TG3Ubixcs2p
         EJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201092; x=1794805892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qLBVynAnMVn6ipdjcgOcOiimigVGkoS4o0LHfR73ptY=;
        b=eiPd+ymHa4IBO30J9th61ux7q/8dJAYcZkODWoiUps5HOP5FKh5d4IIOFmyWKFEKC6
         Yp7lvWWHQ9+TDGdwIEMGiDRa19ioIuJRAKTDb2gooRbM2qEKxlwLrF0vN94J3FXRknwZ
         tYhc66zSuAWXxAQI76SZYZRMHlVstfbdNRH+UYE/e5A3+Ky7Ez6WgSseqkK0hnPo/iy4
         9hGmeFzspNucMz8lwpySHHuz4r6MM9HGooTdZU1qXcJ3sSTSi7yL7u20XoTjNI4uaHe2
         Gkg6jIEKdQRvg6+w/ZXFdwTtUkUiFcwr9lei8okVs2LfkviZZyaYDUKveu322WLdF2Ld
         ei+w==
X-Forwarded-Encrypted: i=1; AL+hErG6KPiK+QbixCfJCJaVrsbTM3xVloYs/ln2fyi/2aeip9wOADGT12VgXVG4+JrEV3lIFu4S28zbPxO1@vger.kernel.org
X-Gm-Message-State: APuU4Z8fiDXLMy9KJKMhBhi0D5R2LqsdxHPU5trIOf8hoSzQfXJaViXf
	MYTcpdqQsIoRTJ9MvDi+LhRfTrKjjbBfvzbOXxhOSSLDH3iEe1b1f6iC
X-Gm-Gg: AYBFou1Kp9bDnuvv6KgLSkMjSat9VyBznNVMvc/OdT32QKDLw5J0fza1isj0O3Hlg9W
	rcpEj3QkRGiZ9837Qr3ifGjpZI5VTpZYwInirCpOieOR4qfd1qt0rsUwQwkhbI0x3asjHa+1sLh
	ifnZBBpQZgRsUA/uF5GXRgLF1MkmWpcFwJoh9yI8i9vjSPS2Av/eoh+mGdEUuwrYvvVSrXubOP9
	2Pywo2PtL230kWIM+GWwgh3LSA3h4EzHRFg+5+6EJkz5Pj1V3jNBkfgDBGU6FT96oiFJbe/HH07
	XAlYaui3b9sxhW7jAT1C6bzCUeSX07JtNSSSQLbIYf7dJiYCqjuLUKAeb8q3POo+4p6mhBrpwk6
	rfJgRnz765RCyh+yu9YiJt8PeQprVPAGcT13NotrkFlhYbU5pzh7WtDw8ctTBgJNBwPSzFZF3Ml
	l5s8qzNo6JVrZkzVPdUwa2SSqt/s6IDIjscdpbZRVv6csDTo4XjMzE5K8om2+aFY5Y09mjBNLaM
	OsQQkIbj2taY0iIyDmNxomiL9HHTNSKtWI8CvZf6DFD+hJSSbv09AWXX3L30i/hlaJrOJ8FSxh8
	uokzJTF6Fwfc732D4rDHNE9RBoJFxiATlzAH4nicLGYfBxXiDMLbmZDLb+pW1NDHKr0oH40qbpD
	yJbITOr2cOwPp21fy+JLZgBfwyawVl/QHTcKrvtUulhkJKuCiVyPKCfb1WQ==
X-Received: by 2002:a17:90b:5545:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3b12d4b10dfmr2980482a91.58.1794201091869;
        Sun, 08 Nov 2026 21:11:31 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b12790befasm5247652a91.13.2026.11.08.21.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:11:31 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Drew Fustini <fustini@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 5/7] dt-bindings: riscv: add Smrnmi extension description
Date: Mon,  9 Nov 2026 15:40:45 +1030
Message-ID: <20261109051050.105623-6-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109051050.105623-1-joel@jms.id.au>
References: <20261109051050.105623-1-joel@jms.id.au>
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

From: Drew Fustini <fustini@kernel.org>

Add description for the Smrnmi extension (Resumable Non-Maskable
Interrupts) as ratified in 35eb3948bf0b ("Merge pull request #1492 from
riscv/smrnmi-ratified") of the riscv-isa-manual.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3: No changes
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 79491ef8f86a..7f5d85c64f83 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -214,6 +214,12 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: smrnmi
+          description: |
+            The standard Smrnmi extension for Resumable Non-Maskable Interrupts
+            as ratified in commit 35eb3948bf0b ("Merge pull request #1492 from
+            riscv/smrnmi-ratified") of the riscv-isa-manual.
+
         - const: smstateen
           description: |
             The standard Smstateen extension for controlling access to CSRs
-- 
2.47.3

