Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649518;
	b=uEfV8VoxuhR7Ns8oPR1aKnGEitY7Epw093O/rw8uBcY58TBlQhQLKTIDTtdL0+yBvcce
	 6RJJ5i1HzxhtUCqVnTgECmN7kQvxxhv8cl2N7TpZskWwQnRJAgPLPWDHt9PIrC/8SW+ts
	 jql0dASEbfHKCl63VzXl8RI2smMA+FBf0U1M3ZdQ6TyKP9m6ieHMpu7O7twnHIgI6d/59
	 vvzuHtunJeLfk5FjsUtmgT6XO/FmM36kxY3ceEugZI04cGd6mDGQSoBVyomPB6Z9fgm4S
	 1HG1vKWwSYKGoVgBZelJyrNE9bvF0rmZjn5zq9xPv0FFyA0XXJ3iEK0nkuli7nzWS+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=eoTtAD1OqVBDFgxHKsrJhCe4WsEnyH1NTYB4QO/bzrM=;
	b=FtkSFDSel+xhp2Ip8jIJdkyOAq/2Sl0LL+Erjqiiaws9Ec3OeQnb87qtYXgp/usLwMiE
	 UPyD1eJqZhVzyKObB5y0T2iuM4xEb0aOgg0FdyElqIRbnYV2mlVUqaVBZapSuHXLLNwzQ
	 /MsPYjXSP3xOLA1d7UuhMVuWgvAZ3pIAQ5Tq+wtD1SsH2iHo0KDtlsZhx622ON+2HFrm/
	 9XVo/C3LfN8UZwNfoQCR30GCkfF/oEaIDFe6I1z6/ZmcvmzFo/55eANF/9alDRzZcUHuZ
	 I7WXncC4yw1wCBcLoo6PYf7F/uYRc7Evgjf1ehcdty1SeWRmKJf74LV41ztbVcEfBbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O0pIAYnk;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B66660A2606
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B66660A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O0pIAYnk
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so59626655e9.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649516; x=1796254316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eoTtAD1OqVBDFgxHKsrJhCe4WsEnyH1NTYB4QO/bzrM=;
        b=O0pIAYnkN3M9nAbcjAGHtTMBTv/k+CVwigewPhhHARHhQ6SqZx7k5ZaCwDezhoh9F/
         9pB0ThakEdYc8HBabkypvh8pnbtOwtBbYV3CG5qGPUGha1JWe8RVcnhcrPRWPmiJ6QTT
         AB7PzDDiM5wlpJuX/i3+NwdXhHIN7AF6P9nkCJudREkUnNnL2bnLn/zHffzcLUXTjd7g
         wBubR0I/t9p/L+mmwjaZSg0SM+4DOq1zP7hKHiIao6MOqb5Zcu8AiP5dS/ZOaGfjFQnu
         YzWFF/Ri6vV2fNNHBtpUcvhjusKMv5GwjgX11BhnrPb4dDs5nbq+SFqAGqyIjgY+syFI
         P0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649516; x=1796254316;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eoTtAD1OqVBDFgxHKsrJhCe4WsEnyH1NTYB4QO/bzrM=;
        b=NVMRr9AXn/wht7AU0xeQ76fs09+nZUo7XjC5MC2hsRmHBIHSDPobpDp9gcz+SnMxfO
         J0tB25wyG65OK2l/eXw+c72+oLoCa6tgfdcRROXufeRch2p2iplVZyjZaIeXDsxsjYD4
         24ec/l3qsLHwLP4sYOpupl1TPnoJ994GV3PWJ9E53Uzrw68KobIGf6g9OVGB9yhy4kP/
         /LxSgedRgZnbexasdoxyImSIDpcSVZ856IeuNbRZKWGu1NWFLmx71/WlAMBGVo0xcBFR
         hKUgRRJsBBmQPFExfrdk19GxajrUrCpwqpgRKhK3fqEFG3MJTNHV8EPxoG46tGtdtpv0
         J3Iw==
X-Gm-Message-State: APuU4Z9wPMRJ2zvtlxM1BbtPhUhNVR7YYeZkZAeKIw/DOiGy3GMyPffX
	PRNtP35pRLCuiG7YOKpzool01aUMiZ9r3JYannauAcn5QMPC/dVt3R5A
X-Gm-Gg: AZFdTZfGwkt+4UIDykUp9Tuea1QqJ+0MD+nZNMt+J1tCm+DFdY6X77wZRySR1EZ8NDV
	rDmXO3cRS2nh8/hPfUo5sI8OJoSY4bUIEBPMC9OrH15Vf7vL0Yl+hPrGgOZZD0oWOBM9mUhFeko
	A8CLBJsLIfGL9qOZdFKCPIzXGB3z0zW0qNxPQnN7w8Z7UAVe4luGrgK667h7IRf+yvFJsvWo2Uj
	G+BvHcAgclxk87WxtMGZ6aSufroRZHsPVGHEgzXOoPA7F2Bq1kYxv78YiY7YIA2paedJC+J1mD4
	0HbytH3UH8Mrn/t7ceNKWLlRoZabMAPD8k6bIdS8phwnWA7E3qcQogMQx6TJEKN2WtvGmAgEtut
	Xev0UhB414bUTKFTvEG68qOvCbpxEJ//QoTlD/Mj9HsAq/2j3ftY8Aw6mXOaQaVBz/otG0xJyvi
	MOeHkZMDWHk7ZoSIQjV0tTYmw4US1Ruj33+524bZtC8GGlM2yufRNNuMhF30nBAsJGdSD0F9go+
	GOLM/Cudcuw2yXSVzcUrpogFoR1OlVOCpgm+xg2VFxRcIKooLaRludlxr2yNZKaVCRdtkVv5zEZ
	hqnKm8vfRNTv3oKqGXSvL6Ki5OU2TocHTJGma8/HW/YvsyMpXIpXM/wr+dr95R2nZMeUZliY5T6
	h3Dx25oWcAA==
X-Received: by 2002:a05:600c:8906:b0:4bb:a60e:a316 with SMTP id 5b1f17b1804b1-4bba60ea355mr53876185e9.12.1795649516228;
        Wed, 25 Nov 2026 15:31:56 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm33573217f8f.17.2026.11.25.15.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:31:56 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH RFC 16/19] dt-bindings: riscv: Add Waveshare ESP32-P4-Module-DEV-KIT
Date: Wed, 25 Nov 2026 23:30:17 +0000
Message-ID: <20261125233020.1380594-17-vitorhg20080@gmail.com>
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

Document the root compatible for the Waveshare ESP32-P4-Module-DEV-KIT
with the Espressif ESP32-P4 SoC compatible as its fallback.

AI assisted with writing and validating the schema.

Link: https://docs.waveshare.com/ESP32-P4-Module-DEV-KIT
Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 .../devicetree/bindings/riscv/espressif.yaml  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/espressif.yaml

diff --git a/Documentation/devicetree/bindings/riscv/espressif.yaml b/Documentation/devicetree/bindings/riscv/espressif.yaml
new file mode 100644
index 000000000000..564e93cd5f30
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/espressif.yaml
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/espressif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Espressif ESP32-P4-based boards
+
+maintainers:
+  - Vítor Hugo Silva <vitorhg20080@gmail.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    items:
+      - const: waveshare,esp32-p4-module-dev-kit
+      - const: esp,esp32p4
+
+additionalProperties: true
+
+...
-- 
2.56.1

