Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608915;
	b=IQ0J45N8pmE7PbO4UVnlGS6nWL7J1sAqRgq/R1Yc1KUxzPyYdgor1duwIXtBlUWJNBpu
	 jlCGDbSwpx5v0rels3Tm2kVCVglqwOErg2WS/WXXBx/3iLK6MbGdHNHUZGMbThxDmHvuz
	 bimA096bOKzHbSpsAdbtSo5yqUej9OjavJ6gm7s50bdj5XjmsPNkotwF67kpA7xqHDFKs
	 nfDINCpQqBq+i1JQlF8IOL6R5xkGhFv8V2LnvGFsR4buSD5UnAb3jfjv6FoZm6oWaO84Y
	 sSIfg9aZwSI7WYUCMVCdBNBmvS42O7KW+ndrE5rdRV3RhgC4KlLSFrjsw3sGvaZ89aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=gnAyztqeUe/q2s/7Qp3n11tSLiy4Es8dTJJvQH+qV7E=;
	b=tG0EEA79c/QgiywjB1bi8DkD2zI+nUSwPfFqklToLms2Q0ZRQ+2Dahg0fMZt+XcFT9AK
	 vQbMvg6PacBvIlo4v9zuO2DDcSU+DKyRARQVxpemUjDxbSy1aSlh/wRO5AOe/dq+bXyvW
	 eMiLcKnrr+qoG1S2wOQpTwpCvat7/s4LPFpU6GdcJ2/6CHmdY8RP73zaZY34xKTAhF8p1
	 ih4nJNikXKa0cyHKNrOYRe8XdRNKE3WUiQXdgVZBMwLyo703TFRbjN/ZM/2v7OtRyCIxU
	 iN39gLb/2Y1Zba5mmbdkh3mkAvKNMEwonVpVJr4Pp8vBf9Vyo36LrGsskUZ//zB+aGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGa7dvPE;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F7F606A33D
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F7F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGa7dvPE
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so73242955e9.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608913; x=1796213713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnAyztqeUe/q2s/7Qp3n11tSLiy4Es8dTJJvQH+qV7E=;
        b=OGa7dvPEcUwsHNXtYUoGb5csdZNba1XA4zumnNZh06ibecuGQsUiPrVaTNcYau341P
         8kiTizoQMMjG4uULZ2ITIH9P+avli2cb6RMjd9ISrSh3aoTTRZ95AUep94FmjgI6MX+v
         uuxj97fF8UoDueuXcFER3U0meCugoKJWPa89KKtGjR0jqFFCNqq/W/zNSYsMjs+C7Uuk
         odIdVKwhKxIBnNBxS1Rl3lZZllUpRaSMaM+AuNxxJYuUI3dAgM5hGCMAKrhHzKlX9ax2
         KRq1hJqBzAYXACMELDoYwfYZQMjYHm14hw6TaLxwxtHzKW5+x7hLmP46Z+rI1eKilNzH
         F/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608913; x=1796213713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gnAyztqeUe/q2s/7Qp3n11tSLiy4Es8dTJJvQH+qV7E=;
        b=cLW4q0RwaoPiY1flHJ8EkNrJntM1PgYmtklhe3BXoiGl0uptkGkFr8Vc4CM+jNnue3
         kj2PghW0GIjeekGRufGC9d80wa62mwVOEFYmc6JzvryJhGXhaRLToHyqZn5r+0zKyG7x
         +OSyfPVr+WbqmhbLEh898F0wVTzLgwy5F61O5X7BVsmrUxALDFa9vcosACv08F//6Kmt
         2VxyDLIm2AH6GU4k+rIssgIyYKYANLSYys8Yx2/OwpQfHl7P/yl7xR0JGZW+rs6y5+uk
         zqVx5+SDn0xkUOB5yHE3MHMVRpnwNDAC9SvROwXTLCDj8pTrERBgIjbrGMckiuCmvhuI
         oS6Q==
X-Forwarded-Encrypted: i=1; AL+hErGL4FaieBo5y4hD6H5CD0BHbk840mTkWLMGlQTJLoBcIOC4GsVmVILAHhLj+j5c1L0C2gtTPZs8PLLm@vger.kernel.org
X-Gm-Message-State: APuU4Z/E9D9RC2B8vvKh+YXYqoPKkGgRoHQJDpyO2B5y4Pkgxu+CS8ay
	xHvZpJ0MMfuogR2RBIuQd98Qh6hJOMIH4no0KD0mJFO4XjOq5Lp52Fd0
X-Gm-Gg: AZFdTZfNTBa9z7lo057KsqrK9i2DtZmmd/IRGszz/hvB2MXEbzJoBCOywWPu9BaScOV
	UUo7+W5atGIihlUVYZL96l62E2NP7GUtbfFYkSW/7PGVAR5lZX0B+LS8XvFK/zmnL64AHKtOgVR
	+GCSCLZzOgxadbc50TcZb4asoUupFNdZ87n8DnJl+OpIIRauQ44V38IR2yMri8JBmsUb2bSyAk1
	dYmN1yf+9dhWI2Lok55Xdvi/HBBEepu0maWLbtywqyHQ7PM4ZUVpL9gBzJiu9gHtvyChHguZJb9
	IjJcNoBYV8Z8iScc1Zs3OvQnw79gBNsmArAkw22q9gBm78610jHeQhraqIR2b8m5YaY+boCsBXY
	3z/BOD5pkos9u5fcamATIr3pwVE2Aga4y30DwbXo8Cs4GjzfpyhAWUAX7Fn8jStCjsZxVAALAvU
	RsZzNeeW4uoJ7sCC1A5ZN92isCPbAnYO2LCsfI+vtiE3iYzjfXx70NtQnI0sGQI4ZDMhh2MsZp6
	sg3gkVUWEYG0YEeGAfSIGLNk3CvXnFzx3RthTlDjJ6Jubg2DWPPtnENp81TV+apqAegJ/0Fq2Pd
	HFkpRzvZHm3AD3T8OJL3SG0f3Pap27z77D4yaaCQXtaObJPY3ajr6H5QkHSZYR9JbUXu+r+bw3H
	22n3nrB0z4IRxGl8JS4iyQ4iEyAN1WGLf0BkU6GLIWGeyKCpYebxtkGw5z/snDZ/o7Nwt/HY0jD
	CrmZ3YNJtzg/J2GIQo6NTeV2d8rHQw1Q==
X-Received: by 2002:a05:600c:37c6:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4bb88812a84mr355620345e9.13.1795608912826;
        Wed, 25 Nov 2026 04:15:12 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:293b:cca7:e6a9:dea6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm947626355e9.4.2026.11.25.04.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:15:12 -0800 (PST)
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
Subject: [PATCH 5/6] arm64: dts: renesas: r9a09g077: Drop GBETH filter properties
Date: Wed, 25 Nov 2026 12:14:47 +0000
Message-ID: <20261125121448.180847-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
RZ/T2H. The stmmac driver does not parse these properties for
"snps,dwmac-5.20", and derives the number of perfect filter entries and
hash table bins from the hardware feature registers instead.

Drop the redundant properties. No functional change.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 674e35e4f242..1be6a7ff08aa 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -567,8 +567,6 @@ gmac0: ethernet@80100000 {
 			resets = <&cpg 400>, <&cpg 401>;
 			reset-names = "stmmaceth", "ahb";
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <32>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
@@ -722,8 +720,6 @@ gmac1: ethernet@92000000 {
 			resets = <&cpg 416>, <&cpg 417>;
 			reset-names = "stmmaceth", "ahb";
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <32>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
@@ -877,8 +873,6 @@ gmac2: ethernet@92010000 {
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

