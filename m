Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794414571;
	b=vkgWcboK1GRzyXz0/gpG3roQ1bQcekqgfScbndGWl9mAZI8/wnDGeG00n+LvcqUrypQo
	 +sEAlW+RErsLSWZrmclPagNSRIgrAj9X5HUZBpgy5W55wx8BP0TACBEi+veE7MxtDxL4q
	 ttlEv4YBeukOiekCqiV9ruXoNqOvfzG5ZkjctvYyWMHTHyTwpghNz9mRE/kjz0BPR9+wB
	 WaAglkhEDicC9FJv6lx/ZRuReCO9YLzfuOK6msKo2HwezoeEniJODYKquxl5Ok2rilO9P
	 uKzB124flRfWHLWIOaOtv5Roydhg6+/vn00ci9IRdzqO27sgcw4VwlKL6rvHi3s6v+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kIIpUdcYbCc97fJ/nZL3tfOeMSipetiHJ2bLLYEWKuY=;
	b=YTXGLb9bzbFU5IT5GJnU/9prpqUjanUkFB4+O3N2lvUSrxTeM1x+8uT5tiNYx4/MroAb
	 7IROmJ6ECaGyAnLHsfzMnvhmQxf9nXd/Kt53q5n4QzhKP4DkRCWe02t6pHXc+q1LWD8Y4
	 ZsUYl/NARHyuAM+kc0c7Jz7dyuwQrsyqcupgIQ8H4ISCgjtdZrDTfK6ARFzWaZ4cy7FzE
	 qGnx0fn9brB9KRS7eb8I69dy+u891zxhTjQmcm0HRNR+Z6Mi6BcoEShkHfWKc4FgVdzkp
	 rE7KcSIFfvFVkjlx3zZrYc1jPH3/BJQe0jvUrWWVD4PPkZOw4EBOY7fEQRy/n6KKn8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zaqrsZYE;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AD860A260E
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 16:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42AD860A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zaqrsZYE
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so1679191eec.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 08:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794414570; x=1795019370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIIpUdcYbCc97fJ/nZL3tfOeMSipetiHJ2bLLYEWKuY=;
        b=zaqrsZYEn/rR2d/zkRH+W1WF/RIN9/OXs84kC7LtYU1JK9QVHG3kiLcxLfYv2Gkvks
         zXOCdozil/FXUXkRhobZhfmSEhL8Sw5MmdLvjOtcceVQaS2xZq/G8lZwkJdLsREZwjcI
         EOD3xxOvOlbAmRIehezHeeR4QmaxbhpYdIKZ5uO4qJW/0nBzQ+AUBKvpHyTs6b4JoFRL
         ONYcdXspL2tON9/OneK+F1bGTtJ02qWmfxbB+lFvKJ9cO4OFlR4Imxftx/enYevQC9BJ
         LxZdwCZrckAHHsdPKaRJJDZFl4wtlUVcOqWR1vdqUQTLAPjsXS0lHfUvp1r7n4jMTwv+
         FfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794414570; x=1795019370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kIIpUdcYbCc97fJ/nZL3tfOeMSipetiHJ2bLLYEWKuY=;
        b=1DTTmaRSFQlCDfmavjVPfnNhh6wI4VqLTnS58HaQ8fEVB2ZmEvPpieEJJHlGW5ra9j
         6rXrc1Q7tZxc/ybPk0nqh+02QhUOIJOOO/SIlXahqI/fna704L9edgW75ahNfQXyRIzB
         MHLwB1ZFB16fKNLHVfrEUvzZ93ZADs7LD5Q4rzAXNx5xJDd48R2LdxftaSuTfzPuHh60
         AakYqMnYfA54LgqqwhdTcsot5EAU5zWULYVml0qP6gAf3r1mGE5tsGzTIDnqrPhuGd4p
         w+jcyXlYrUMVWI7s+fEBtMC6v1eKBeuDcfUv6JUaqNz6KYre1mnxu0sUPZ96XCENgZiJ
         UdnA==
X-Gm-Message-State: APuU4Z8HSZW7gRLNPRW7RJ63DBAET2HQ2oQ+E1pjUOdNivLDMMG7gcsW
	pRHumWq39oXFd+YBMUNE67O/dEnGqD7VG14KkW1bD0nXZ7zkFqpQJJiT
X-Gm-Gg: AYBFou2DTXKHLqlZ5QHJyHQ2G+KOgY8okJ+PoXLZe0XhYGxEP4IVAG4E5hvCcLTTm1k
	bE7at4c17xokh1bGUh6FMEvH0nmNBonCrVLXJnFeO6uok7NvFyQpqL0K1PdyEZcYI2S/f37euwX
	YdSfVAFEpdrZD4PLy/HV8TuuT9Fiu+A5iwEQTOxaJvJ6xHvnvkqvomkxrHz7SgfRsdomFj7kLc1
	zZOjK/+2ZhzFPeIHewDATUTFfTLI4ghl34n9xaGBzmXgBt3qRain+PXlogFMDKD89vB50XlDJZy
	4w0E0AGYJjTmPhLIbsF4vOkUBLqxqCTiw2JXoJ+Az5Uupb60MUrzrY6oaKS3GCAizUsoZuCL4or
	vp75kn/zSWtCj146wCmdVNS1U1hkMpJJ/LLJhH154GPPbvbK9UBQ4R52Vw3OffXhVf54wHKsYrF
	9770MXIpR6h7KTXxy9spWTLLxP8qi5M9NKLVnp8A/qcIyIGlLujNXVEcCH2QslqWqlLH7Qy4ilN
	gxbjtBwDdDLvR0slEfeZvROsBDslxJIeN9Z0FSXC3u9NyBRfeoU/KSbgwo44W5+3/Z4qN8UnaYE
	RCvc1cbLUpY85Q8v22lLd7+xdw0TuBtnpVgAKkwY9ZOdRYnaFg==
X-Received: by 2002:a05:7301:428d:b0:375:c5e1:931d with SMTP id 5a478bee46e88-37686171ed4mr3330492eec.25.1794414569971;
        Wed, 11 Nov 2026 08:29:29 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm34892599eec.16.2026.11.11.08.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:29:29 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 1/2] dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
Date: Wed, 11 Nov 2026 11:29:16 -0500
Message-ID: <20261111162917.97532-2-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111162917.97532-1-cyan2254650260@gmail.com>
References: <20261111162917.97532-1-cyan2254650260@gmail.com>
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

Document the ALINX AX7Z020B development board, built around the ALINX
AC7Z020 system on module.

Link: https://www.alinx.com/
Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df2..e3bd3d7660 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -34,6 +34,11 @@ properties:
               - xlnx,zynq-zc770-xm013
           - const: xlnx,zynq-7000
 
+      - items:
+          - const: alinx,ax7z020b
+          - const: alinx,ac7z020
+          - const: xlnx,zynq-7000
+
       - items:
           - const: avnet,zynq-microzed
           - const: xlnx,zynq-microzed
-- 
2.56.0

