Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239AD3A7D63
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558408; cv=none; b=dd2+szPKHgGYZbst5K7Vy5GlJPhBPX5ntRYndGM5uAXoukrF76bSTObTAxOZsZ/HfLR23jyD9OGJV5Az4LSXG4zszcnM06LUAkAGubZBUmiBXBE6pI4KVSB8gB/3b09m6vbbtaQ5EgoBSkx6n+tx8mdtwOCgwzW3mfNHOFJM1n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558408; c=relaxed/simple;
	bh=VTvJrfcXRxhJIcMkkeFx6nrIodiOs5dES2+e3OOA57Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tp5mtd9TfK6BZLfYZYvYWdws4yHZRW5be5uBKWFodK2DTCm/c99TAY+uG8YK1clSc8lzVl3eRffD3+zvklGsp6Ko4Tnx0a+LcA5HgQ8UDPV13ugKthsEnCHVu5JGk+EuWQPTUYpMsGntpkUsGe5QQZFSuLfnXcCFL6t7wiP/fFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKbLtqBD; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKbLtqBD"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2626149a91.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 01:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787558401; x=1788163201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8IuvDoTOF0GSX+Uv0Be9lhsnyNDUYu7WABwGwiy8F4=;
        b=AKbLtqBD4UrX4mqct8aMeB268sePu3gL9GRQyfNWH+SBDIcldIz+Ko59IsYbyRpsK0
         FW06o8j0Q/+2qFLVjN4iB7fWaOEtYyb1iXgUP2S/XmYLHZ9u8jZNM1KH2BXPNiie57Lo
         FTkidyk8oKy8sDi9SDjUmK5gY1GEdxbIwXB3ggggTSD81Eyz9PsNUOoeQONdtIr4lRMb
         AdD1qyAiJFWFbOkfls8eqEL1EQuKM1H28d7AINSknwZ+Haf2lsj9DAVb554CkF8tm85z
         wls8fLyGJxTsgR2v484ZkyqOH0LfqDenqD9t+QZVOA88lbRz9a8lnheBmmpCm6qfvQJr
         vJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558401; x=1788163201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d8IuvDoTOF0GSX+Uv0Be9lhsnyNDUYu7WABwGwiy8F4=;
        b=eTW4kjRIBM5tEIyWFCa4+8gdUefqk7uyjD8KiOTLNeqbseS9Y3/Zq/E1+4R4B6S9r1
         xCMnMDuIusJnN9vQPAktxmM5ZVkwEOS5ykPN1lPLPwwZCCCI+nq1d4cTnARNCkYMaReA
         xk0DUU0Bmit20i5PWplu/ZfMtS5QnJ2sJxJaqvmbUh3S9owDEvQ8WUn8p9vy1FioEhZj
         isdic9cGkRNnzvyCcN70yiyhBZkB0V2WjvjK5RabaeVyQIf2LzphKqONZWuzq+qPvAAD
         d+ZnNmjldVv6NQDXFjS9De7TdSUKe1Ppx3xfoLATxZ50wX5i5bePFwdUwxNKdJBaLufA
         s1LQ==
X-Forwarded-Encrypted: i=1; AHgh+RqrwUTv4NAlwCOcwo37tU0hu1j9z06s51tyuDRZBqQJIzseEf3HPopy7BMwSco1HdbTDAHfOnuZtjgI@vger.kernel.org
X-Gm-Message-State: AFuF++kkNDwYicZsW+qMdK4QAZEnKeRVWzCcNUPMoJQY0jMhEdCmW1O8
	DMUaV7gYqWj7xrVhcgDXR5GFAoGYia9P56yS4YgmHyL44OCrAW9M1yXm
X-Gm-Gg: AR+sD13uP5wdo1FaYegjICnuAr/xdIqJPOHMwheuoXGeTlJWQBRzgF8wg0Ib90Yjvx6
	xEjoIqAyl+5MVhjepTRS7FdJ33j83n8fr5mOHBsQpc3sNUfdWrm84Fq8QXN7El6LK0dNCQjJ8l+
	q/U9yLrx4nt/rCyPJ2z4mXcMy8fNhCrn+MCWcCIIyVmK6luqPf7hGmGTMgTzNThlTMpx4VVm5IR
	JG2ysuktLPrtzQ6xTpmEhOw29Ke13kxeXLLmqQoAe0KpvV/1zxoHHO8sVtd401KmzJ9yLQE7eOA
	B0GgLmhoAkGsRsz+bPnpKvVuyARqMn+9N4pDNFA+N7O+ZANl16po0+Jeag273OTcdiV9ts2uxUP
	VjLfqIrF4Rd/v3g8D5Eu1pZLGefQYxpg8j8CQxlb//J/DQ0DlUKPIDZHz6stTFvassWBpOc1HlJ
	SmwfuTx9L34WLqvcTLYdXvh8lZWBVidDYKvOqanYJX3loYBBDcDVB4zBePIyyg/TfCf6DMjm230
	Vum5p09M9bwklKlYf8qaxkDw91c1NmtvNiOW/EHRd3Z8zGaQ2jJ1Mz20zylFoK8FtUAsQeIWIB6
	+RM74Ds=
X-Received: by 2002:a17:90b:4fc8:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-395c3573cecmr45259413a91.4.1787558401348;
        Mon, 24 Aug 2026 01:00:01 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:194c:fabc:2511:c0a8:be1e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d2d1esm24887994eec.17.2026.08.24.00.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:00:00 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] arm64: dts: renesas: r9a09g087: Add RTC node
Date: Mon, 24 Aug 2026 08:59:35 +0100
Message-ID: <20260824075936.2904336-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add Real Time Clock (RTC) node to SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index fe9003426d70..d5b3eb6c1736 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -1176,6 +1176,19 @@ pinctrl: pinctrl@802c0000 {
 			power-domains = <&cpg>;
 		};
 
+		rtc0: rtc@81009000 {
+			compatible = "renesas,r9a09g087-rtc", "renesas,r9a09g077-rtc";
+			reg = <0 0x81009000 0 0x1000>;
+			interrupts = <GIC_SPI 495 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 497 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 496 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "alarm", "timer", "pps";
+			clocks = <&cpg CPG_MOD 605>, <&cpg CPG_CORE R9A09G087_PCLKRTC>;
+			clock-names = "hclk", "xtal";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@83000000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x83000000 0 0x40000>,
-- 
2.43.0

