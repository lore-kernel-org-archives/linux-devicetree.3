Received: from box.halemmerich.com (box.halemmerich.com [172.104.217.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DBC378D93;
	Tue,  5 May 2026 15:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.104.217.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777994219; cv=none; b=D0jNZAgLzvcmegBILJ5288GgaQjk1LEld03+4KEw6fQ1DvHjxItfhd3vJTQS4Bjs5ZCbT9DevTTX8zql0TCntZ3Yjf3KOQKVqNJKuLgvyO8Nshx49IkQzH+u9ijR26HYsH3lJ06ikVGpuzv4ZVet7w0XbAi9PO5OtoRPH+aL09w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777994219; c=relaxed/simple;
	bh=hpiOQlSFquQKr5gnd92XM526pjpmXHyPi5XnfI2YBtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HI+g8aEPZKOtw1r4zP22Vbur91qP/DF7JIeOJ79GqyhN1F5BZjlcmDy2OtE0lRXt9KYClIv4wBHtQN0WV6TKrois43wUvYIkYk8t2xk8Z17gpYwU7HC17UApRE8V6VRuoEMGrhPWZDWeE+baPEy+QybePtMwfW+hFsa4JuaIgNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=evaemmerich.com; spf=pass smtp.mailfrom=evaemmerich.com; dkim=pass (2048-bit key) header.d=evaemmerich.com header.i=@evaemmerich.com header.b=BLc8j8hm; arc=none smtp.client-ip=172.104.217.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=evaemmerich.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=evaemmerich.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=evaemmerich.com header.i=@evaemmerich.com header.b="BLc8j8hm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=evaemmerich.com;
	s=mail; t=1777993901;
	bh=hpiOQlSFquQKr5gnd92XM526pjpmXHyPi5XnfI2YBtg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BLc8j8hmK+kR7wAYf3kPMiQFa7cZsyAhfDGcVyqV5HlPxYSJwQHgX/TD/kdCnocHo
	 SFdufr3mcqSHS3CQwrKXcf68nK0F7coadS7+Lpm2B0kx63a0i0pAJVSekqLd1d5hlq
	 gJ9pm7mk+mGsxaysQZU+HL/jVLny9MVomhfzQ+0jwO/ONTUH0xvm5lwQqudjR+0WMm
	 AfGSEW7BDp9t13kRgYMBnyztC/lPXfKwFkhd29qzvOjR1oUkSTbAQYeHNaFfu+p2CE
	 Tk0kLvl8k/Uu/q04MEBVSeP+JOjsZPQAFGfATiYniv3cdWe6fJpAKi/SwgEf8Du1xY
	 Geo/GLYTzNjlg==
Received: from authenticated-user (box.halemmerich.com [172.104.217.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.halemmerich.com (Postfix) with ESMTPSA id 6EDEF3EF7A;
	Tue,  5 May 2026 08:11:40 -0700 (PDT)
From: Eva Emmerich <eva@evaemmerich.com>
To: linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Eva Emmerich <eva@evaemmerich.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: rk3588s-roc-pc set hym8563 rtc as wakeup source
Date: Tue,  5 May 2026 17:10:16 +0200
Message-ID: <20260505151015.179413-3-eva@evaemmerich.com>
In-Reply-To: <20260505151015.179413-2-eva@evaemmerich.com>
References: <20260505151015.179413-2-eva@evaemmerich.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Eva Emmerich <eva@evaemmerich.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
index 84ba09528215..d4513f6b154a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
@@ -315,6 +315,7 @@ hym8563: rtc@51 {
 		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&hym8563_int>;
+		wakeup-source;
 	};
 
 	usbc0: fusb302@22 {
-- 
2.51.2

