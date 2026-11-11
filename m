Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408276;
	b=5K0MQ3raHy7/uZcJyDHm2X8qULUNd9X1UZQnVFbZsklBph4L6b437eary8y464jE0Z+1
	 ct/qkrhkbPuUZBo2k+6s4R5sX8q0y+7cvQiZL8WljYgMoNGzcopUyCawbUs16Gx0UmiEJ
	 P2Hbaw26tQLgG4VvCRZ29gtIFoZzlWKFUboCR3ppE5hawpSsraltHRReMLt61ucI3W72N
	 EfhgCjc4d0eZX14Hrruk57U6rexHj1aca0HLYdg5SV4PGN/4Li+agmuz0e4K32s+IgJBM
	 5/YbCB8/VMwFyiZQCshj7idkSdh74QOspPNVpGDz3naZSyXKigwR7IZDl/bfVNwUZtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ihkB9FM28RtXDynQhG6sYSquSmbZ93rrnlR0/YF37d0=;
	b=L4bj7uZY4hCgfTDpFGcZus3TrZ5RNdQ5G85ruh6JSkcovAQTfk702+791LJiLkY1phjn
	 magmcJPatdG4M4b0GUWQGlHdmXQWUpAC/o74chS2Z3cJPlGrlgoQ8yNgsWwX4HleaNJqe
	 ekAI3LSXHBSGyy6k1trJSAjuDr2hxaE27G7IKRlHZbKyetn8q8xS2ioyWxCOoNAI3TBD5
	 oxWsO139F2fpNhYnJld4QTmzhavMnY69jWsfu0FDKw+tsfNH3zrWM5FPpVPafUrX30CYI
	 F2ifIly/aozqikYwLj+uIM8YAmvQ3MoTohTqK3y/h8tgvw//trTry6SOzECaPm53V6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lxcv0kJs;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A426606A331
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 14:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A426606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lxcv0kJs
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so19783425e9.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 06:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794408275; x=1795013075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ihkB9FM28RtXDynQhG6sYSquSmbZ93rrnlR0/YF37d0=;
        b=lxcv0kJsZ98NSPjbORZDxEUJ3JH/hNaN0PzRtl1xrSfNWEJrPEKijUUDQY7ltCAScu
         mZv7r77zJ546S+1GlMEsngJNEUXQXf4GXRiw5Dst2XaLAF3uvfJarsL23Qsn77D/IIUW
         jWhwnJrudNp2c9xFcPdXUBsvePpyAUze/rjtOfs8ilbcGgV622BP4EwRqYfJX+OJeBF8
         i0z5MUCdW2cMxbrO+I6MJwmQ3mqN8BceFsGRSbKVYwNDLrUEdkrlrA8bBIibIAxliOG/
         kXJ9ZmLUtEMF9nfKmNXa0WrjruvpgF/gcrlKur9NyZ6URVGYDY8n3zCH32sksdN2n3di
         Emuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408275; x=1795013075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ihkB9FM28RtXDynQhG6sYSquSmbZ93rrnlR0/YF37d0=;
        b=y2a3kLq8Cq4G2gskNOy6TdVUpiHn++HCKl8d3OigOXgAXRYTjxSLKeRuz84klIr86g
         pBz+4tVu/Gz4mGk71AH6uoo6goNNSQqlQcBS7IsZVOdMXnMn2w6Lt4d8DApBNZVZWs9/
         1wbpw0YIAOy0MkQ/zNkw1FYgmVvcf5RC3t+lf12/6UK+Sxnlv+5ps9LdMVTW9LFYFJ4R
         cMivnA8ekMJnFxHm1GqPqhMO2ycRhXpfErEilLvSFirTomcrzC3X4wnXTzkJuIC+OpU+
         O0q6ie0n5ga0XdGCkkvpJ3JlY7pAENWm/L7wyFSPCFNPBMP03g3kPKZQ0SDT8z2Cbvwf
         2CjQ==
X-Forwarded-Encrypted: i=1; AL+hErGVMNgG3Ps4hVzzrHwAUWOCOix/WLZcGzsFdj8ngWiPV79x+N+9eS6eOvcm68RXqgKBUOu2X7ms8AwC@vger.kernel.org
X-Gm-Message-State: APuU4Z/5FnoTO7rzzvouT12/hHXC4BKTZklgDyyGV29KzVuRMaRVZRgI
	pOqGQ4UDeOPsaZwhYlreWKVWalkp8GSOiAI7J5akJ4fZ4pPWvSsJ22gx
X-Gm-Gg: AYBFou2/ZVUDRPGdC8GNk5nfXxC59lYMB9iUy+/H47YX3BMl6KMG+6UbWw36WiFVlpH
	Y44U/Yf14JTgu3YGl5XDDoMnj1a5bRKv7hrkYaBENQWgpwReeoNEW709Sk3SATQhPXfcMQodSRI
	LQMTs1nBCh7+7kXbuZit9680yDzFnNxiWEBivgEQlsIECrn6vgwipn4bjtvT1D+5rDnr8XAHR/y
	lyqrhBmAnT24jQWSJ8qT0HZW+SVZ2qTPDNjtxUirfV2aQC1sc/kVPuJQDdoGUxoRvEdDGp+Bk37
	dmdLtp59YZz2DU+g7cVSKKlJRnKkoqRAxBDnJAHoHwy6COOLSB11H3AiqJivWBxBDCzjAg44K4q
	68B12a89xIIBOIlkrTfPtTjpbRvJDkoR2StWc7s3tzpC6hlouhDQ3+iJKF6+qXUKmcjbSkmw+N4
	110IbFR71V5SmCY22HekANDXtwszslALg68Bn1sbXfU/v7OdTe6roKt6agnjWPovfHR5dsB9plV
	kIVPKkOrALa6ipcRvUWF/dDqBmmBdHbXVetUqPjLEaclqwxd/90lf1DwLASw4Z4c/WUAGDQT8eD
	ZCTIjs06Ldg0O2q4PiTaaQmKOvOy9th4g1I=
X-Received: by 2002:a05:600c:19d0:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4ba093aa687mr48679885e9.15.1794408274601;
        Wed, 11 Nov 2026 06:44:34 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm46656495e9.0.2026.11.11.06.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:44:32 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junyang Han <han.junyang@zte.com.cn>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 2/5] ARM: dts: zte: zx279128s: add the WLAN DMA interrupt
Date: Wed, 11 Nov 2026 15:44:23 +0100
Message-Id: <20261111144426.1321237-3-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
References: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
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

The switch's second DMA engine, the ring pair the vendor firmware uses
for offloaded WLAN flows, has its own interrupt line, GIC SPI 38.  Add
it to the ethernet node as the optional "wlan" interrupt.

Assisted-by: LLM
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 arch/arm/boot/dts/zte/zx279128s.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/zte/zx279128s.dtsi b/arch/arm/boot/dts/zte/zx279128s.dtsi
index 8896a8b06725..9ddc5ee02687 100644
--- a/arch/arm/boot/dts/zte/zx279128s.dtsi
+++ b/arch/arm/boot/dts/zte/zx279128s.dtsi
@@ -201,7 +201,9 @@ pcie1: pcie@f100000 {
 		gmac: ethernet@92000000 {
 			compatible = "zte,zx279128s-gmac";
 			reg = <0x92000000 0x400000>;
-			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tm", "wlan";
 			status = "disabled";
 
 			ethernet-ports {
-- 
2.30.2

