Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795879014;
	b=uVgKT9RTVXir76hD/0NJkkhZrPdmRUXjQtguvrrjgQ26+dIu31vKhIQDw+CNEQzV9bwg
	 pU0t9EztO10CrVOaNYWoM6cCNy23IjDCQbEFbh1f5cFIbUvYdIMto0oCurEQfSNAmQAXF
	 5cOi6ZHL7v0JdEoyyBElUPV/93kkZcDLi6+cE9tAb+mTVfB0M0xNyMZ+FwwhjBjRHn61w
	 4/TOfGe3uji4jJqXyqGavqctHCrNMWVGlMs3hk+WskqOMtg/ZyFeYvXadI+BpuHraBkom
	 aUUwje/0gVol/MwbLilcITKoRjXqzQkfnNJy7nvpsdXT2bM/bG2Oq5JpUoeWyurKk3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795879014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1FB6N3ZVeS2iXSTJX9cZqix9YwUql7fjHknIhnBZeO8=;
	b=zmyl5QwURFIaRW3jcJAKmBHa6SYhHeHoLKcs0fMMyZRaF7jqZUqQKf6alGB1SdYuDvKM
	 pUE+RJ0zV1XgJ0ZAn524KeedYbBbX2ljxx56l3Mrx77QfkQSsMN6vep7PipYnCD2CTida
	 l/ardyBmlSBDPU44BeIVBvLdu6free/ONi4pQqLbjoo/h6g0pdCirEIEJUp0VzcIlsbql
	 YWAJRgwLxjhp82atW4kjx93uGe76mw26AeKf8shhkCoSTl4we84Lylum3Fzrbk4seUrwW
	 iTO0I7v1kGZBW7sTd9OeDoU88i4wRWEqI7CmjLtuG7gTyoOOvVj2R8GRPfg8qRwq81A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RTAI1v6I;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26475606A321
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 15:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26475606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RTAI1v6I
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cde1479f76fso4771541a12.0
        for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 07:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795879013; x=1796483813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1FB6N3ZVeS2iXSTJX9cZqix9YwUql7fjHknIhnBZeO8=;
        b=RTAI1v6ImNiBmtc0EHCMI2++E9uOOU+pBNG6woahNXDhDoMnfErZMYgNztUondWek0
         AwpeWg6bsv1gOOfotB0jSMBXVHjY1DFOWs4nx+fb/yQC3QYon2t/gnr5pwB5YEvgdpLn
         u825zw1vrc3i48yzo6iw/rv1KGGumukpnTjurYf19nL/8hqAXdJm3dhLa4pdDx4UBTZo
         5JByY+srjJCAqLGGawigeXsRILq+HMPpp4didpeRkjrGGoXW9RTkIaYG2B3Bvrjbw3sK
         wWihN7Gp4dIUZLzpyDPtY3Ex9VeY12YeC2drR4oiVSp+nY+vxaifP6eAxFlBmTkLuzBL
         jk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795879013; x=1796483813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1FB6N3ZVeS2iXSTJX9cZqix9YwUql7fjHknIhnBZeO8=;
        b=cWdDaS4Haytgqra43yu586pHcn9i7YgBtcEbNRst2AZRx19OPelnzvNmk6le0uZPxZ
         NHvGd4wI7EGGAiSuPYvE9c+HOgDyPZKpiAIvpaC3nLgKYHVrjwdipcj1k8RYXA4OGlP7
         Yw9ydEiDxEXw/vbLamn+HlvJEdhsBQt3BIA2El9KIunWQRt6WkWJYHQC/0N0R0bLgo2u
         guabZ1VyhKBVnILIzqsvhaw01NO7mOEu0jPa/1Z6/2CkB3vQ3yYx5oelpYieRGfFlD0Z
         812cYnYe8ob1V+JXF1EhiSFuM5/DJDb1kg2Tfo3o17zAt+PtXqbuOQLRx+FIlwQGrxYD
         XgmQ==
X-Forwarded-Encrypted: i=1; AL+hErFRSvAeWvFy4m2icV/fpOxkY8zkuuNTmNfFJwaNoGtuxWmb8ZoKWsDSv8fBSMarmWlkYsvwsPEOyaSg@vger.kernel.org
X-Gm-Message-State: APuU4Z8Tj2u1jLXQYPwM9kit/xqGJStZ8QjOOXFnZd1HlrNK6LLzL/bH
	lQhT8OMVa5y2bCfmQ9HpoIO2M+iROFY0R2yiq/CCaATISsuG9le5d0Hr
X-Gm-Gg: AZFdTZdHZYh4gg6DAJ2b1vCIzsy3s9YyzHo+BSByliPJndqfKpbyxtkkM507OXfQ+b4
	C6zt4PPrF4Oo3kb4DlbM0cwg9y/Cp+gb4RCll7ybuc/yd8OSH7/Jy6ZVMOhdVk0yPjvuQ6EOUAC
	sKYUYB+qOyvxARfEOn478WUiWF2NWc3bpF+QtN7Kxr3XjSCd/dSTZTC7/rGGTps135ld8aCgtJh
	C1gl7YgMPfwb+FvN4acXtfw0hkadZrQF7gdtASgfzgFiwc/VlmxoPp2PmmIuLA7E58No1xtsQDK
	3qgNYgASYC6L5sXyvlatbUpZOGm4y9nJsWK4n4oBAp+I1Xg96ckIi/JLLKKk4/YpI9Aqm3Cpr3r
	G5KPp2Mp20sXIHSldUa6gwk7pBKVbJj+4BbuSifgurJvmGWwpvVI1uCdo9bsIwwWLArtEBpYQdv
	N0NcDTzWzTk6Wxv1CBKo9d49wWUsV3T47nvtpbLtoEmA+pghC9RDhgc91sdibMrBNgM2awo4HCo
	F1PHD0vASIFOCa8RIqEFwBlVDWjAqyqpTYQGF+z2mPd9iop0r9gD34YiAido0JOxQBGQpzuhBXP
	zr/9hhMhC4QGssO1fL3/4PaMlDQs38cCOMMHSThyxgHZ5Rql6+FdeLqXffyLpZ2waFN4xlBgqPB
	RQGiFgofY+IZyh0lkWM4IOmjFPff/
X-Received: by 2002:a17:90b:268f:b0:3b0:d0c5:c110 with SMTP id 98e67ed59e1d1-3b41c95ce7fmr27156870a91.56.1795879013360;
        Sat, 28 Nov 2026 07:16:53 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7a8c64sm19769280a91.3.2026.11.28.07.16.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 07:16:52 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Leilk Liu <leilk.liu@mediatek.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH v2] spi: dt-bindings: mediatek,spi-mt65xx: Add MT8189
Date: Sat, 28 Nov 2026 20:46:41 +0530
Message-ID: <20261128151643.16934-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
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

The SPI controllers on MT8189 use the same IPM design as MT6991. Add the
MT8189 compatible with mediatek,mt6991-spi as the fallback.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
Changes in v2:
- Sent on its own so it applies to the SPI tree, the rest of the
  series depends on unmerged MT8189 patches (Mark)
- Fixed the subject prefix (Mark)
- Link to v1: https://lore.kernel.org/r/20261128141443.13065-2-sinha.aryan03@gmail.com

 Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
index 3bf3eb1f8..34e833745 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
@@ -41,6 +41,7 @@ properties:
           - const: mediatek,spi-ipm
       - items:
           - enum:
+              - mediatek,mt8189-spi
               - mediatek,mt8196-spi
           - const: mediatek,mt6991-spi
       - items:

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.46.0

