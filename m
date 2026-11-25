Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608915;
	b=KClp2YpFkyGfOs+hcXiy3s60PtmgN1Gq93WqCsRXhe/HZwAypE1pgWbSNTummctO/O7Q
	 4iKdqidsFjKvwivc0DasPW9wX+JUBCUObF7U5oCYvu3bLg8LGpMr5w6wh+O2rIY8qQhuY
	 dfxOUJ2r2qow+o2ITNeGvt/do7rWapL25XsRR5ZJbKwIF4zQ2GfzvJUoOGTUUHjBPh8uU
	 HM/VnwussXgCjUsieyUflqh0rqcrloFgyfAldKW+sq3Y9S4jw3ZvQYGidtgFbDn/HVCv7
	 kT4fSlf67tm9gfYI+bimRK6EZKdxCV+YwDKW43Y9It9oTH7pUTw53R6VVZfOFjU+EJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Mob0X1OYukGGK2WuupxgDLKnjU2HYcGtn9Q8YPfS6mo=;
	b=c4t1pf/bSVm7toZxyGTH1b9blIC4ew48B9V8qZMJoOFneSps3jsxpI596+JSg/8p8nZ/
	 eO0kdb8pGTx/dqXMtVESa9/LoJO0trMPsRlNjtIp5EZVjwiNhwJvK3PXNk0KkGoTdm1Me
	 GtXs/4ISc93UDObPNl8oohmC2LpCz2JcBiCoARY0TD+Hvla9fRSMmOWcl5Rk3Rp7cFU4y
	 fu431i0g6flI4b78Zc6YZYX5C2SJUEdqWsfgObsiP4pLpc8bu8iCGxu0QrXu4n0Nml4jl
	 qo8Db0UQpNBKGTqjvrdUF3Diq2HiKPEQl/44Pqk2TjFe+/8o/ZTvT3pL9TtaDWaHeig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDcukgQP;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34504606A32E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34504606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDcukgQP
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so49843405e9.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608914; x=1796213714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mob0X1OYukGGK2WuupxgDLKnjU2HYcGtn9Q8YPfS6mo=;
        b=EDcukgQPPjyacoKhZp1PXt2no10yFLFOY8j/KIZ1FWPVWzsbTzd2WJkiQdARnF/esJ
         gQ2qAq2etSRWIN6DVAaJ9OXtmhNASlqcOjEcq7tp7TYKvkMKKFdeTAmU0HbuEAK+TPx/
         HULZfOGIllVPTt08qD9nfiPv3EmJAhnsNfRC67px2vuzVbpm7opZ/4qw4W9L3ZD7wKlQ
         YViyWhv5WLw/yNUJg8bjDbRS59b1fXy+JMIY8BA5t19j3zFVljZhXl25ZNjgiyw0L06i
         /JtNF3M4iW6hi1sJwX8bOih+jBnRa3fb9z4wwpUzuNmS25c1DfdN/R+LV5tesQPftKXQ
         NAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608914; x=1796213714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mob0X1OYukGGK2WuupxgDLKnjU2HYcGtn9Q8YPfS6mo=;
        b=JRzC4KVwl6DMxTXOBQpls4gZSglZa75r7/Q/We7KQ+Zj4PyFGhzj0qJ5IcPDpZFymN
         zWRtUqbLTZFK4+v1OWBY4Fz7aPZZfr1WlK4Wf4I97KgxlyWKcz7HnMO8vZL+ieICU3dq
         5IDff9IzcZgDth4aMua7SVq668Q0iclFC+j9Soum8v3PGIed4beWl7N1iaI36A6nZ+3d
         BBEKHmab4XoqZILGqWEHx9+EqCC5+TSS0x0mKNiE/KUk0uXUiVfGWNGnJyajvgxj43Zr
         cGOTZMeG0QYqYHHd67/c+r13PSRU2nVLHTXHunzIAM/Ybfu10bHWRkpZUAmEFn2tCvH0
         o76w==
X-Forwarded-Encrypted: i=1; AL+hErEtKjtHkvasFWqsJzcHpQg51SkVsi2waD9fkwFDT1XY4jkaYfk0fQkmUmUBG1gFnr/QEU3/Mg5ArrbU@vger.kernel.org
X-Gm-Message-State: APuU4Z/MVl2IrymyvQtqk0GdCIf3vT+s6in9yuTdXjzrUJB77myRQ/o0
	7b2BtCgsLRYPjad/uKhzzNQNDP3l41C1xkmeMGELYY2jKEDgz4k060oD
X-Gm-Gg: AZFdTZdEvz44BcF+017oO5TPVL2PYVytosvHGWt+gveAy+zSnWrtEPkM1p9c8/RMUWH
	bLWekilAb7trIb5j0k0csE/wCYPhmqQ+TaN7uRQFxps+GB9Zoxv/6iXbWsd5ZdM/LdEJ3Cl7Rkq
	H+RR/iZU6pL32w+hZMgBnfFYmZG7XKQuQmeo/ruf+tbMaCgH/xxsNlRdNzF7YDW44hNvi7UC5c0
	Z9/icIp3WP6IwJpy4ZnOZYyPy/Vnnyfobo2Mqez0GaOh9ulkexdc1Fu/G7/yrVkQ2VVeCHYQj17
	EWcN3VJl/NUOGgyesUexwom0Tq9aa7iClWxuyd1/e7tbvoDm8VKJczk3ZhBsLeNbUE8FKbEflJ1
	JwzBgKXPno3NKA9vN9H1G2Uuo2k4PSNw4KAuxSUuctOjhtJdKw6sxeugGzqxEmzAZO5VYmXdON7
	Z174QAMNgSDnUPlwC+qQpR1z/D4vjnAPE6FNk5dfxfFvWick8iuxN6DSRlySCMfpc7WxUIeW7v9
	StAHA1rzcCBn5tI8tRBk96khefnVZs4vAd8ePpW3qNlbJfQc1Ks0k5t56Y1C07ItguaGeeZDgkx
	K8PACAnbnx+wDZl2BD1OG+noXAEpcGunH/4mIXci6/4qPDA4plbyHBMf9aUmJbS09CRVM1iju9p
	Z5btQ/DcIULbPOui1XQGkg9XExDIZjWPMsrEEuyaT7VmtRfdXskTjYzJj87VuE4n+CzU3xeUE1P
	nAf64mjRe7
X-Received: by 2002:a05:600d:82d0:b0:4bb:818d:8d8f with SMTP id 5b1f17b1804b1-4bb88818955mr430512255e9.23.1795608913596;
        Wed, 25 Nov 2026 04:15:13 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:293b:cca7:e6a9:dea6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm947626355e9.4.2026.11.25.04.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:15:13 -0800 (PST)
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
Subject: [PATCH 6/6] arm64: dts: renesas: r9a09g087: Drop GBETH filter properties
Date: Wed, 25 Nov 2026 12:14:48 +0000
Message-ID: <20261125121448.180847-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Both 'snps,perfect-filter-entries' and 'snps,multicast-filter-bins' are
discoverable from the MAC hardware feature registers of the GMAC IPs on
RZ/N2H. The stmmac driver does not parse these properties for
"snps,dwmac-5.20", and derives the number of perfect filter entries and
hash table bins from the hardware feature registers instead.

Drop the redundant properties. No functional change.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 68c8daed557b..0e8ad031e14d 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -568,8 +568,6 @@ gmac0: ethernet@80100000 {
 			resets = <&cpg 400>, <&cpg 401>;
 			reset-names = "stmmaceth", "ahb";
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <32>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
@@ -724,8 +722,6 @@ gmac1: ethernet@92000000 {
 			resets = <&cpg 416>, <&cpg 417>;
 			reset-names = "stmmaceth", "ahb";
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <32>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
@@ -880,8 +876,6 @@ gmac2: ethernet@92010000 {
 			resets = <&cpg 418>, <&cpg 419>;
 			reset-names = "stmmaceth", "ahb";
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <32>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
-- 
2.56.1

