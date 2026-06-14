Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5ED23ABA8
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 04:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781409674; cv=none; b=iEd96y8k5n6kpbzneR08JBu3ialU9waP6OKf09PsvLOnKn15OFzIWAIEtL32DhCKEt4SxN7Efdd3o7z5Z244z7cqRUWEKVCn+0ZE6N5w1eQE+Z/kNkQQPMgDRMic/0DH0UOMCSQ3twh4bjoqYIWc+aSARW3P4/01pdeaZkf0r/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781409674; c=relaxed/simple;
	bh=kVe9FAvNFPj+G4X6bAwAQlGssRU/9ayG2veBdgiq+m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Esh8nJM4Po94+rYF1yGrSXUkpLPP50wc3jKdETT6vImPQH8Ctz0qe01xsS34iBgyvzkm/+kkV3qg10H5pEYlCtcvqRa5uZ8QJJk2Lj9ok8tPAQGhCZtUvsjIB93d83evX711W7T7tOPBui7LUJfR5Eb94S9tWkNM4aZ4bGPoLGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ALbGQxW5; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ALbGQxW5"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c8588ec1b44so1559981a12.1
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 21:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781409672; x=1782014472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Crq5yHDjMfevdls0e5Awy2sd/URrn7kB/WguSFGm/w=;
        b=ALbGQxW53+/BmF4GJhTKWo4NU65U+1wSG6NtHemim0BPrdiJYXL0jbcwHF9KRe0WAc
         gXCtGWubcnrdLDIrjNxbwn4qp+9m1rbxP1T6NxzKkWActUo99dso8LvkeRfpkMLCLnah
         Mp/jlx0PDtKdBhCxawQxGAVHfAnRbiaXmneDB0eczswssTrZviVnUmynYQcLnWAQuBVA
         5i8lEJfR5VqbIVI+pfx+WrnROPKUDLVgYUH6ZcPM/jtyLg5vB6ZrnmoLl3ElWEGjqo7T
         QJUJS9tcQ3UW6osHKE9l3ZXLmms99hDBcOQSK/re9j3I4LuRiJosGP+WYPdqSqG0DPA3
         iX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781409672; x=1782014472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Crq5yHDjMfevdls0e5Awy2sd/URrn7kB/WguSFGm/w=;
        b=DmEYHwggU/DcjCvov4cHxfX9gOwvSJ9mpqjMplYY+14ZSeOs6LlBZfH06I8BfuBkfc
         8Yl8HTblB3ztwbbv0AAUXyNQmReRz1mAa3tvpfuObQGTlOyeek4AAtu0Y0diRnR/g4i0
         H9t0By5H24MlyY7gSF3pwLYhhW9StpavxnOCeGX3t9t4egvTWSiTHumHMjQ0DYUxxD5i
         cvlTCmuEiAL2m+JyP4daBSPhPpGumgcyepvwdOm820K/Bbt2UL90oLER+h9ddbiV9+7+
         jgqjS5MIFLLvSDDPKRM1kW9NoI7SgJSFxyRveQ8RKyniSScxaQOBHBSJ9YwDSxrh6POq
         vOjA==
X-Forwarded-Encrypted: i=1; AFNElJ+8apf6//f1vKzyaRJu5+ZFP9JglLm2jrKq4xcTAIkEeZJQ1FGNaYCD03SkTfsKxpiPUNIQg8sxhivS@vger.kernel.org
X-Gm-Message-State: AOJu0Yxduu7m/RNQ5qWxE4gFqE/ZC6kseMjL4AKbGMyL0tWEJiSLDWqj
	77X133GTirsp4/lfG0SItAKuzcJ8g5E95rRZDVXu9CPQogEirdfKUKiY
X-Gm-Gg: Acq92OFIn119QITRth6A1h51j7M5Xdiu8jJhjTPVqPjG1FuZrLb6GkL7lUEWC73muTT
	vmVn+tWsEC8rLz8bS2VdiIfkTHha0Tyn4lv6IUsEt0T2z9SVgdCP37UgTsgyHwgG6MwuQdgdmQC
	PNs2PXBtd/cJSfJnWpT3+OORw8m9wGrW6zO8r5PTyyYqaO8z81YLjE6Qy7sjeJYSj1c4BEQhi5u
	ofMb7C2QQqDP4ojpsTaT5PMHtMMithAFhgD0kZ1kx9DSvojhSFbWoFYyNFMgu4UoIoIIogzBgNO
	vQb4u3DBUT/SxdkuAz/ezCvngjAGBanEh2mnRDDHchkizQ1k1NjF20dmWsDC/uVL0jQ0e/LvEp2
	iE3EaDq5ylLfxaMH00jm86dt6h5p7DBDG8bqcmBmEA65vqYbay0+nkub90Lq59o09uOZmehhVOj
	xFgIQpo6nL+Tk+laKGBXA=
X-Received: by 2002:a05:6a21:6f17:b0:3b2:8675:4866 with SMTP id adf61e73a8af0-3b78415d3f1mr10802330637.31.1781409672295;
        Sat, 13 Jun 2026 21:01:12 -0700 (PDT)
Received: from mincom1 ([115.4.79.42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661a67603sm5676983a12.0.2026.06.13.21.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 21:01:11 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: netdev@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [RFC PATCH net-next 3/7] arm64: dts: airoha: add EN7581 SOE node
Date: Sun, 14 Jun 2026 13:00:28 +0900
Message-ID: <20260614040032.1567994-4-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614040032.1567994-1-hurryman2212@gmail.com>
References: <20260614040032.1567994-1-hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the EN7581 SOE register window and interrupt so the Ethernet driver can discover and initialize the packet offload engine.

Signed-off-by: Jihong Min <hurryman2212@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index ff6908a76e8e..a3c1033d2437 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -347,6 +347,12 @@ i2c1: i2c@1fbf8100 {
 			status = "disabled";
 		};
 
+		soe: soe@1fbfa000 {
+			compatible = "airoha,en7581-soe";
+			reg = <0x0 0x1fbfa000 0x0 0x268>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		eth: ethernet@1fb50000 {
 			compatible = "airoha,en7581-eth";
 			reg = <0 0x1fb50000 0 0x2600>,
-- 
2.53.0

