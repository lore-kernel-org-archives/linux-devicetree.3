Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608913;
	b=cjGqcwESc/OeyOZFnMM/rBZwJHkA8Ige5CaSIjNvlscORMbxBgfd9mj4XFraHSHh98c3
	 6GOyhvZuAZCnwQ8z2tJZD+z/3C4Kk8+rMj6hahVtqEuV2jWlL9naWAh8pioBfPGcQYgUk
	 mQaNR4HL3Lzsqgnh2j9daWBEXw3/6+gFWLDkkF017l3XmjItEK+8Gy/6wZ4cRrR9G588Z
	 wshSXiHeYaNAH/wmQuDWKgh8eD4qB+PYQRGanYgRHpd7icT81Fegx7Y+cH0rilRFy0glD
	 28DBh0nsHTkZdgH+BHBj12qR0NtsEHwrXqe8tO603tTc+KcU1A+EHUJOluzIKw0l/Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GaAOUY2wWK1rm0Mwk7ZZfEtqH9qud5mJwl67pEKqLpk=;
	b=p+j7SokPyBPvp/QmmgZzcyBW+1XkF3tjg/SjMWXgFx+ZEL1M03E38vFfwQuIO3XYZDMb
	 7WRMajFLlLNhFNCAUn/jkTpzwREmI9EEk4xpBWjX6/QG/bG5qzcidQyG9NKKdVIYomPr7
	 mD+xHRJ+n0pWG8Ys6r7Qxhe3llVcATpD/BDSdWV1kUjcgdOjmLUC/WoyukeiO44qCLCkv
	 escCjptBVSuSUId7W7DsofSILj/sCbkYl7oSyPBLbVPXtr1vjtMFJDbCxly1UCiZf1k4C
	 zQdDMyTmGo2BUQfzsMVhOtl/EvTKoLTG0Cj436vkJ/41346D2YkupoKVcVV4Yibgx2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xCTqckg6;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3568606A330
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3568606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xCTqckg6
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso30781885e9.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608911; x=1796213711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GaAOUY2wWK1rm0Mwk7ZZfEtqH9qud5mJwl67pEKqLpk=;
        b=xCTqckg60QMthaxAJHaUasTbtBPuPSyIl8cOM0jeiyfliXanyx2V7jhs91mYC5KsvE
         Lje6ibWnt8f9RX68YX/sM2w1S+VIt2HYlPMY+mfIJhfKqf3GIb+WDVztWRDLrxhWsN8j
         nZwbcsuESs98lC8WyiEn40wEtv2M2oEmEAs7NnPBC8FKNNynPGoi1ydxvi7U9xHZGgC5
         jz/H2hUWYSE+YynLyfwl5XSSBojZmoEqt4vcltnWsV9wXx+Iu1X6XgRPbfC/VY8aZrEd
         SPtfBtnwvSA2CoEV9ctOWkvEnrCyULSQcDTOIQhRRkkrA0aD9PMP2Ki77/rkQGlf1L/t
         WGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608911; x=1796213711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GaAOUY2wWK1rm0Mwk7ZZfEtqH9qud5mJwl67pEKqLpk=;
        b=D/oTS+BIpojQOcbF9lOLsRPN7+24dyO2sEvYrV31m2bU2i0ANZhiJIFQLU/yErfSeg
         iDFQz4LHzQuKwZj0MRvtmMULjPwr5PhRePXqBKZkLxFMjqfA1S+T04+QobWPa+R7tZ3I
         euPXhd53VTKLyxLCRF4CeL5yQHYI5dSaEpftObetdsjNHACLBAvucCwzvZhoYfdHCWrH
         KQUr9jdSnftI87Hqf5QBFHrVLbVnHaiwXeJVzLbDQwuDly3zGJzkPnW0YvZ26MHyydTO
         +5df69s1+2gv5GD+leWXjOHbOsb4BK3FUzhDwk5twtXpC3znB0oLheY3VZ4VMpT3pJLV
         B9Sw==
X-Forwarded-Encrypted: i=1; AL+hErG8X+9nW/irFLxC5FFQbQtLfCsMOkIyKJurceSvW0dHFESWD94jM6MxuF/vifQh6P+XT/giU5kej73l@vger.kernel.org
X-Gm-Message-State: APuU4Z+CsgI2N/zFfMizcHzDEcaAdyH6Rzts/COjFqWICFzLIRH0b6PE
	zUznRsJp0vqBeqaAtGW2j3kWiUDLjzOTwcJ0FemE6tkWctZtl/DXiLKF
X-Gm-Gg: AZFdTZeyT0LrtlvJmc81xA4VLXV8gxGPKJcE0afRjcwWkG1H42443j5qSsRun6mZCMN
	ii4tP3y0SX0gaXauXoF5FI1kUtQr9M/j1D+BrAikafWHQ5rLGinh2NiMiQLmAevEjgCGzAubVc1
	Hg5+PgDxsUUlaKOLfVHX7FXtbmDRbq/F+ZBdTO1blsUmgdQtG10Y+IdrCYyZYoB2ZofUujaDMhi
	hlUIiNxLaQUIq2yY8GMLRXSb1+rwWXwvdJEkyJIQny81tEXld1CdrR6+daSsLT0+1y3++swkBYi
	nIWB1qQaQHC2FdME378lpiBTvdd0qgUZggzeixtnLuOewUSr1Uw6Z6Fh9Xe7fS4S11+ymNgtac2
	Cgr9LXWneY/SbTMnFWIk7Ui4NU1/xwJrvJ9J0zpa+bf8F6ek1kUrZ6eOH4l3+shUV1rczzZ38nH
	+0UVswd0QOtc8Aucs7ERpd97Vl8iaAVJFK7UFGjnw5jVIFpkI88qnbqtAlIoqE1daja4dLjRXu4
	xikh2aGxNchgdj4bQnVRsUO35/4pC298LbQw+67WU+0RUBUnfvnNJAwzRC54BC6rCYffNLefyPj
	F/3CmiU8uRjTmXJWyhjuJxK+mnuL3e8oZ1Tq0EkRJuUoBT4LWqSC2ZH6FvkkvjLHDsr6WcOseFG
	+xqs9HIgMRJbedkDzqsTZ6on6TJ6CqRJQW3mpstRY6GczyJyx1NvL+H/VIhcIsE42rjLancsRct
	XnJi+epH7rCS+SLDsWTNexzv+FWgQiIb0=
X-Received: by 2002:a05:600c:4e16:b0:4bb:69b2:d3df with SMTP id 5b1f17b1804b1-4bb88813024mr367124605e9.25.1795608911119;
        Wed, 25 Nov 2026 04:15:11 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:293b:cca7:e6a9:dea6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm947626355e9.4.2026.11.25.04.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:15:10 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/6] arm64: dts: renesas: r9a09g056: Drop GBETH filter properties
Date: Wed, 25 Nov 2026 12:14:45 +0000
Message-ID: <20261125121448.180847-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125121448.180847-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261125121448.180847-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The GBETH nodes on RZ/V2N specify 'snps,perfect-filter-entries = <128>',
but the IP provides only 32 perfect filter entries.

Both 'snps,perfect-filter-entries' and 'snps,multicast-filter-bins' are
discoverable from the MAC hardware feature registers. The stmmac driver
does not parse these properties for "snps,dwmac-5.20", and derives the
number of perfect filter entries and hash table bins from the hardware
feature registers instead.

Drop both properties instead of correcting the value. There is no
functional change for Linux.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Since the driver derives them I havent added a fixes tag, in case we need
one below is the tag which needs to be added:
Fixes: c8c8a57c5b40 ("arm64: dts: renesas: r9a09g056: Add GBETH nodes")
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 175e24c98e11..f4bc722d139e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -1534,8 +1534,6 @@ eth0: ethernet@15c30000 {
 				      "tx", "rx", "tx-180", "rx-180";
 			resets = <&cpg 0xb0>;
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <128>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
@@ -1640,8 +1638,6 @@ eth1: ethernet@15c40000 {
 				      "tx", "rx", "tx-180", "rx-180";
 			resets = <&cpg 0xb1>;
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <128>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
-- 
2.56.1

