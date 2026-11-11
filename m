Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421205;
	b=F0281WTpt36NGRUsqV47cpU2nZR6dXKhnlP4to06ClbZoOEi5n90u7NBO2aZl/M2SL70
	 iN8RykyOCHaDWnv/nALXU++Jw9VLq+fhP5KVshVy2+TudxJWhyiFNh+UO2gl/CWUvHVDs
	 S7YEcWdk7VGmlNFFC25pVTuLekLjk/afgaWxkbvtMMMIyuOiYNvmY1hwBlSCZsCXXFkxh
	 0n4Kfi6DwwjkgEiMNMg/tgBDEj8mvr/VYMhOFi+aXIVRdKsJbZTmp+vISlSpjc53BBz8q
	 Oy4Mhv1uXtdvz8ejZoTivHwc6godfTNdwFoVHnIZYY0Bzrc2JX2fEHQ06qG8LiDya5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=3p1f8Yec85jLXGY1wQELmw04hKpnMA5OmY/Vm2aQaMI=;
	b=l8S83CSdT99kEShcFh724QR2M0FKFdDY3jnCmctLCvGGsqG6fPtefOkE4k95HVpjKOrH
	 sr4o3dxTpEjpLOGYh9/jxh8bImvlkjnXaSRIn3kC6Ny+lq/LlFBIwUDWHPvvPPV9wuQsC
	 5J5MwvbZzDj26WU0MXLQagXQMse2O7diMZyj5Bcr68wlJYIyt5fhqQ1v68MPpIcTr37Wk
	 e3UHm3jLmDcNROg/T6N2cErIpjfQMplyfKIie7d+dRLpfwvwstMWkiTN8vMbgCS2FKs0M
	 a+5YRjYqYxt+85gBMm0OmktNZKRsyKDP2H4eqLa3cbZfN/3FpsXkKes3BxC3EFAtVPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pix8f1qb;
	arc=none smtp.remote-ip=74.125.231.133
Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020E6606C15C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 020E6606C15C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pix8f1qb
Received: by mail-oo2-f5.google.com with SMTP id 46e09a7af769-8458555b6a8so1059203a34.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421204; x=1795026004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3p1f8Yec85jLXGY1wQELmw04hKpnMA5OmY/Vm2aQaMI=;
        b=Pix8f1qbwM4odqVPh22+IBi8P0/bg8p0HWzN9ngTW7/fa0cPZuU7TcMr5NcLNh2ucP
         TdTnOLyCctT5ZiFPssL+m0b3TptJDy0qEEdedoBe9upfVDjecl2JnxzU6NjZ3cGPOFrO
         jP3Xyl+p2mzw6plZ0wLQaqOSkwmzpap4yNnXQoGf+w5NGM8C32JFpLKZlZ3+DvwzNJ0I
         BigvxufIdhyXRyUNOYIxEPilPGzKCpEu3ktizeu2YbU4LTz3t7PTxwawUzDlwsR5XbE/
         tlMl6bnFvrrDV9KW/eT3+B0KTOHTvzkvBl6zfYvrkE2TVYDOdZb5BuSq9YYpFugEsqOa
         I+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421204; x=1795026004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3p1f8Yec85jLXGY1wQELmw04hKpnMA5OmY/Vm2aQaMI=;
        b=C+Zr009AcYJlEBbMlHmorjgpJ+fj+HXVDLX0Us65KEy2Od+pOuRDmVGFT0NGjAoj3i
         ffOhrg1jJ+5dNEJlghJV8ZVDTt0yaFdfULz4V1dv/wFShyoo1WlBBBj736VKKbqbPq07
         L6YIq7IznGohs+ToGAG357+L9hOr2/fX2LDuDj1Y3YsUJYp1Q2aZQLicYQ8e9Wv/bfhn
         wQYpLdhEpP8Sh4ma381NMTKt4w4AFDacoAV3T5a4vcNU4idHeSbm8nxNppVfP3meHkQO
         nk9JcAgOUZsgUgIdSDMg59ymi2gyT95xYZSpvCg7Yos8mkrHeb84C5D62mH2rbpVoany
         Xq0Q==
X-Gm-Message-State: APuU4Z8jwrF3S4xLNhQP495yVRnB3gQdaevkXeDYFJRi3UZVibq+nEf2
	/nEZNnxN1VwgaXIu/l2RdvLdnDxxh2pT+Y/HJ6wSH2rvvX9lXAsFZCTB
X-Gm-Gg: AYBFou0TqprXDHPzVkvlCmhuIw3xTkyvnxkTuS/rINZcI3M5JLhR9rC5W22Xk2R6AUK
	MZyVQ4z3o7JgFSUDI1QX29rZNq41tdzqaFopunA2rVvnf/Kg9tAAcJ9TCmGrmP8igoVKO/3OFFZ
	f7VzIF6R0LTOnem5IKYPYghnTCbiP0W2B0tLaet+RndUfBktS9zpqbkdYkR85fQDxrllytha98H
	BT2d/K9k8bEju4LEdBOFQlX/76XCV0IdhOJFzcrv6wH5Z2ZcikBrxmVi+R1InRAFzdziacEgYc+
	sSsI9x40uv1gArgaaNlvbUjZ+adrg5pmlX7nLlI8w1B/B0Nm0zja60cDS1q6Up83aEBZHcYxlIC
	Txt7S/eCJqBJX7okgp9wYLQHkM6t3yXoyB2ykRVG6X8TPDZQqdhG28GPDHXw/XLQfXtLguyaiIa
	7LpmzmAKJ5t6nVL0fRQ8OScy6s5oSU2zB2hBhwQ8CM6CuIGGlTU/XCyh1FtLMAHP7HNWP6N73H7
	oV82Jufv3P1nDN3uH4TjxXLXr3VXJcg/WT2DABs/pvVTt5/SV+I4kEs0MhPIRvmkGLPANkTTE1J
	LW2M7DVsIagHFF1mBg0YSQRN/e9R2q95qutoSD/D5rRQiziegr4n99lqNJC/cx5G9CESWnFWF7n
	b8LGWzPvgfYOpg6ky3jo=
X-Received: by 2002:a05:6830:2e07:b0:81b:864b:7f02 with SMTP id 46e09a7af769-860f25e9047mr4277570a34.2.1794421203737;
        Wed, 11 Nov 2026 10:20:03 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:20:03 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 11 Nov 2026 12:19:52 -0600
Subject: [PATCH 3/5] arm64: dts: mediatek: mt8173: Add the keypad
 controller
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-3-77b47cdea702@gmail.com>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=1040;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=XWTgqrmP7rORvhppkX5O4ecuuFFQiKCRGXT4o7Blnls=;
 b=3naZYMrXC7w2FeYZunhhVF3fjUGhFJRhyC1EwGqndsw2Uvt/Vy4tRBxmpspeKTjgLQIaHzQBL
 G+jVqjThFk8AXAHg/aysmbransIpv4bPfqEkl6CtjrE6Nmuidatej3H
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The MT8173's keypad controller is register-compatible with the MT6779's.
Describe it, disabled, for boards to enable with their key map.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 2ecdea33672e..61261fe643ab 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -555,6 +555,16 @@ pwrap: pwrap@1000d000 {
 			clock-names = "spi", "wrap";
 		};
 
+		keyboard: keyboard@10010000 {
+			compatible = "mediatek,mt8173-keypad",
+				     "mediatek,mt6779-keypad";
+			reg = <0 0x10010000 0 0x1000>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_EDGE_FALLING>;
+			clocks = <&infracfg CLK_INFRA_KP>;
+			clock-names = "kpd";
+			status = "disabled";
+		};
+
 		cec: cec@10013000 {
 			compatible = "mediatek,mt8173-cec";
 			reg = <0 0x10013000 0 0xbc>;

-- 
2.56.0

