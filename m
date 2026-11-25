Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608912;
	b=zlC5KSeuHq16J9AEG4ySx991bueHdF90aJxdyk+Cusii9lvQIGtS+fSt+7ok/O8uQSib
	 N1Js8ICB7VbS4xdJD6Td6i0P5EgtkYtHRF2+QXBxC8mnRpyC8H1nKqOyjI/nXkj+4qMX3
	 vhByU+K8MxnOGZTbg+GmfI5egXJBOprBhebNquGN81ABPFSuD2UDSpxX7wInFdTP4M6xG
	 qdUPmpVn/AN1paKIH6ZuLRAIpzHDhQ6sS5d3g8idhjgOFSlLyq2qPR1TLeLuQRKHeIB0W
	 qkWQp3k3XGiqW6GqjSqtYttO0N0NlM58nZjLY/BEuRAFfkq6KE4jRfNcIcMwDJF114w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=TFj1PLZZtoWbVRq955IZXwqJyuyzYFFvoCl1bDOikmw=;
	b=EQ3e/oKOS1rYA7YkKu/ukZUg8Peu6rcvd4iT5gs9rpDqjAr44LEu2SyD7/5sJYK9VDWJ
	 fFKM3B9ftwAa/hJzAimevMj41XpBnI8wGtuCro5+jSV/Hj9zh54csOHvUWDgNeft1uWY/
	 9ELL8D1NfRqqyHFQpOeX2JW2lgCXfk81Y+nrrzGFVS1joBSC0UfwJsE2/qfwSEApi9iYg
	 Z9D14ypuAzc8jweM5d9K7h0w6JMsjE7rME0aLTaDgf5G5eEKRn76dm7dxpgjnoCvv/zU/
	 VL5KFSWj/0jJiVBP93Lv4iwBBpZoUX2D45HlpNGikOGmRiaheJEC85+a3+MwBXk7wFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZUpUXWoC;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7B6606A33E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C7B6606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZUpUXWoC
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so50707685e9.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608910; x=1796213710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFj1PLZZtoWbVRq955IZXwqJyuyzYFFvoCl1bDOikmw=;
        b=ZUpUXWoCPYTM6Grx7JkNR2uPrIqVqbUhQFfyvbv/Gw6iEwIM2sC08bQU0y4P18cd5x
         thnFC12SScFugeE2QXzdoPQivUWSfmCdCCxym/QtQ9ZS9W1vesmDm77kKYSwv+3YKTps
         1/HelArEvMB4FIi//KRuSxpa0Gj0MUWIAGBR/lkNU3PlMgfAty5lGZOx2LQ4EVI0NzHV
         twJxziyxK2OP341/LsWoSKDtGR2ylSjPao2vhRdtzSNZYtR1KI4YukVXrFfxC0SuwSQO
         ujLI73mZFgzZkzACnClcEGmgSpJhhhejgsOZXM6lJbWGEZ4GMLJ3bzVv6hf3yj/Aj/z9
         nBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608910; x=1796213710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TFj1PLZZtoWbVRq955IZXwqJyuyzYFFvoCl1bDOikmw=;
        b=jUgdFoBZDCQUmnQKW+43h7PJmlOz4NcBn/Epy8aNf84iikZI+Nwpgcb3kDvjc5YgeV
         w2UR/nIYzDOc4sceTsE3OR1nAfkB8ckaGoaXQd0FfrrReTklzc0ndbf/pnMPlniK9ePs
         ymfduwyTtMP7JzOWpQAGucL6wKOz8t3BUjIY8puUFHFDaXCX711kTU30Pxoa7az+6BVe
         4/iSWtZdwNerhn8BtZYHAShCa7g4PmkY/0Lo7vlZuBoH6OPId1E6AIC1/XKo1IF+j2uX
         ApxViJgOax0NtP7VEILXC6n/tG3lGg67mmjhErLfAw4lMoAS7/CH82PnjMikrThLaKs+
         02MA==
X-Forwarded-Encrypted: i=1; AL+hErHqHXejg+Racd6ePvUTGJDAabyIcvwp2p/VAMmrs17GA6BP7vtsaH5QyhHPEn0Lh1t5QGIah5AhOusI@vger.kernel.org
X-Gm-Message-State: APuU4Z/T+QzSsAGd/aIwWIhTH7pEoC23yEmiQN4CQB3HpNJfCoU/FIK+
	BsdGekcLpHeWydd2WwDxBCXK3BdXOW5wH7ryubNgnm21Lh94OrMapbxX
X-Gm-Gg: AZFdTZd2qhXGtcNxX+lZ1gB3wW9E9RZ5b1PrgTY7m/0jy0UFbE0ZN6kw3BneAHngMzH
	GwYCA69j1CUPhEcOZLkNfturFZUKeiuBpc1WwPRy0H0NAYouBNULQDg1qZf38bXKrvDlNOHZFQG
	ZZtzjMOQmX6Mqd7sdBNGGpV5ddDLCpGaOhPoAcy5JCA0e4p32Kafb14ULj2CcEP0y8O4hYA/aAp
	JbKhrfQTuRXSvDqE9FWlNNKIhez+Mu4ux6yiPu4x46AeNtoLj41zp2sPlraDEDgzhezlel04Qbv
	D+ViWu8c+wIzaqpBxWDtFHMhxNWdCYSeBM1aId4oV456UBVTgSkjIGhPZ3EO7G9+ardikzgTpJI
	96cuFDGv1xYAY7n3wQfGXzCUtOEQixSGoWEGYyeKnthjeykp/V64rWHHpUyZSvRp0k/OE0RdbXz
	IgWAncciFUsh8YkJO3JEv6RLoSwFVX3uqAPgyYltVMn3G4/LdakJruUHDrj5kYFuFJQwTDn1lbD
	EnI/A6v+NckHMpoehDQkvhIjQRoFG0vnjN9MSgCdDt3Dewiw0QgYZGQ+rucQ+W81C3UHeAdgOFj
	VcM1wQLiPnDBEsmycr/aLBPZ4B+LWedjeQGnl6rsWg1P0m5KeIpmNsGNloUYarg2U/+GsT8/3AR
	qtrHdUoPV4Eri/1Hox3dn9ynmfxmnc+U7BQbIw83/ne0pbuPSWUBjIm4BhQKZQOtuOeCh+aYUVd
	fOw+hAQ3Wf
X-Received: by 2002:a05:600d:18:b0:4bb:9001:1aa with SMTP id 5b1f17b1804b1-4bb900102b8mr243378915e9.10.1795608909690;
        Wed, 25 Nov 2026 04:15:09 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:293b:cca7:e6a9:dea6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm947626355e9.4.2026.11.25.04.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:15:09 -0800 (PST)
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
Subject: [PATCH 1/6] arm64: dts: renesas: r9a09g047: Drop GBETH filter properties
Date: Wed, 25 Nov 2026 12:14:43 +0000
Message-ID: <20261125121448.180847-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The GBETH nodes on RZ/G3E specify 'snps,perfect-filter-entries = <128>',
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
Fixes: 41ffbb1c42d3 ("arm64: dts: renesas: r9a09g047: Add GBETH nodes")
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 737bf1c60451..fdedcfce8e9e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1987,8 +1987,6 @@ eth0: ethernet@15c30000 {
 					  "tx-queue-2", "tx-queue-3";
 			resets = <&cpg 0xb0>;
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <128>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,mixed-burst;
@@ -2092,8 +2090,6 @@ eth1: ethernet@15c40000 {
 					  "tx-queue-2", "tx-queue-3";
 			resets = <&cpg 0xb1>;
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <128>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,mixed-burst;
-- 
2.56.1

