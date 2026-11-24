Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557111;
	b=3JumXYAVIWM3Hr0jx3+vXH2FEBCZRfj7iMoHHGhV4QMiWY8cg9bqZWW7NhBI37/G0MFL
	 NquMs9SPYwgRTeiCq3PeicwrChjva5fs8oPHGUY6gNLWC1eea3S0kvdeLzl0gDUVuWwG8
	 4NvOeqGdx4BzwOsCnlBjo/SsYLQYVqx58N8Sdr6ZQ+YTCedY7FrvMH31sTN2Gd1O5Qxvd
	 Dji6ogEWwLkAwvtFCczmwnVW/hROnsOouqEILGn9+YOCqmzKLJt88/QCFitEdsbd4PrSv
	 q9Whb6uhoC/7/IcE7lqgM+j76GR2s3PDhOCeBQPABqBYnYMCX0w8pu0ozosCGUqkZJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rzUxS4DZKD6Oufxn59fxSi6iyKfyUkYi9vxneZjQx4E=;
	b=18+/my1R34seO+bjgIVmkp4zlDorEaYks/V/cgPowRmZDoggHHdpa7CMNADRxvgtCRAu
	 somluSHAbGbBTPTCtU4so5eIHY1okVz3pXLk83ALgh+vyDX41xGq1PZO6+WehgXypdp7j
	 XHc1p6GIUWobxM1a4n1/AKLUOEHVoMVPqeAqK2RAn6xgd7oybxNUHlsc+NXiqKrgpz3lY
	 YY15zCLfTfV6mrV/CrEl2Vq3tpRChTNqDqPf2TytYyhuC0kQdHxheChF+18qga+GNIz4B
	 0gwaCbwvpkI96mS0Fxeh5LVvJTmysI0oC3NokFg/RCr9llao2hjMBBXLn1rffqrPSJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LsaQeZao;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0377C606A338
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 21:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0377C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LsaQeZao
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb606491faso27678085e9.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 13:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557108; x=1796161908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzUxS4DZKD6Oufxn59fxSi6iyKfyUkYi9vxneZjQx4E=;
        b=LsaQeZaovUAXRW39vA/JGAdIQWl5I5WWNLqPMSwzxVuRzAzD/nuys9GKhvU55letBk
         /+gIAf9ukZwI98D4jzztbOoAqx/z3r2pU51BW08szNhy7F3Pbd6Gitfb4M/PAvh1jGDb
         4emED6wCxKus0E+UDVxnn3EDPyWuxmAYKsb6zJB4wPvLr76XSwTqSn8RvwBIWPa3DNjm
         VuAIxvW7Z6NQogcnIdaHYAdYHMtX2zmh3PCdNVaCbzkmjkXODM1Rmod/CgDW1FN06xQF
         KabgebSHl4VlAGq1DPNmDIqY9yUeY+Xu0we8w2jqX1gkLveGYSA5hdFCE5NEuvIEgz3H
         thDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557108; x=1796161908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rzUxS4DZKD6Oufxn59fxSi6iyKfyUkYi9vxneZjQx4E=;
        b=gqXbgG7+xQjEJcipUBiAmX9rCEa+uo/jCUb8lUQ2t1Q3Lb8f3OaMQQbrVjtYkHjzws
         7KNc+2705hG/3nxZFICH1DPIoyozr+IO3qEXLCPG6UYlhWcIs5It7dOBF6xobpV8K7cV
         H8U27BwA0SX4lvu8cymxgYx3jYMuA/NQzCxtZbvde4HIGSfqUAZRYAZgr6EyI5jrOTx9
         GAoI5tbyTJbzpTS9EtwFtQaNvbtUJ2wJD84Buxo1Z+DRoGiNAmatKvNo69uHYz/jqO7v
         Sd2hQeSyJL/WQchgt/0QTTdAq/x5IhkzGqZe155bbLjTT99GlC6ZPcGY9JjVuzbiD4sp
         cKfQ==
X-Forwarded-Encrypted: i=1; AL+hErG0fL+/4Rnw69jMZP/5cOvXv1hHV6aXQz316x5SIGmRGIVnfXG2IzOPkRrEtZZ9ujhEALJbzCCV4s5l@vger.kernel.org
X-Gm-Message-State: APuU4Z+rOc9mxHNFQMZwG3yzgxV/61aGqrBT5RZXe8ksvjevF5Eq0eDT
	WfDsAJWNy8BuAs+xUG/JEk1jSM770TrdGdekN2/nTpujMQtLaUxfLoym
X-Gm-Gg: AZFdTZfuU6QqCpp19s1AQLPWbEgxuiwivbI2ZeTBGq1tHIa34f5Gz4Iixa2uTcQHagq
	UdGnYvLqGPgaiyU/gTZjJ1uHu7i8eusuiYf1rX2cr8HU8Sx05VHbszniL/v+2sL27v/w27kS2wc
	tHH7Y1lw1kZEkM5VSJ3OIL2AKey1O5CAAOmuSW9bigLTYdrdRxxrrr+NvlNvU5vImU3OyU3wnlg
	HgtcyEicaG8sXtH1WVXunnNwyC1C14sbmLWGj0ayt6FkfoKla21+mgg8l64bNNGLt8EWd+YGckE
	SH5E47akyzx+YKnTw/O9IuC1vAXqc7Q0ZtJ5Rsrb72gJ7Z6srHK7/qebq72dNRklIawuSez+d4z
	fKyd6hpXGz9weyzIbPtfxAxmiIMlbqC8DIMY/zCOD0tC0PFhyjSHlC4fjnocjescYTU+19B1AgH
	yo0pe5Zs50dff4Cjv4PcsD0bTLq1o5K2l3zJ2qD5Dlk2v3HNYzJ9oDFUPCRbcNx85P+ZCOo9bkw
	eMMPrajAYZC/0fFyncowe/Eafk02J8EzsLwxhWBQ3GP2GcXn37EnJLLUWKoCBd/odjZJTthZGlG
	Go4L0EQ4cWXPbwrQ/y0U
X-Received: by 2002:a05:600c:1384:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4bb88816c44mr333032905e9.15.1795557108451;
        Tue, 24 Nov 2026 13:51:48 -0800 (PST)
Received: from debian ([185.57.100.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm29194685f8f.0.2026.11.24.13.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:51:47 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH RESEND v3 3/3] arm64: dts: allwinner: a523: drop the PA GPIO interrupt
Date: Tue, 24 Nov 2026 21:50:48 +0000
Message-ID: <20261124215048.42074-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124215048.42074-1-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com>
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

The PA IRQ bank is not implemented, and the driver now numbers the IRQ
banks from PB. Drop its interrupt.

This reverts commit 6b81aa0c8a4f ("arm64: dts: allwinner: a523: Add
missing GPIO interrupt").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..fc4d714a96ea 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -129,8 +129,7 @@ gpu: gpu@1800000 {
 		pio: pinctrl@2000000 {
 			compatible = "allwinner,sun55i-a523-pinctrl";
 			reg = <0x2000000 0x800>;
-			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.52.1

