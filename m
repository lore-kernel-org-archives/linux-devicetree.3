Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491A139E177
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 06:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791268985; cv=none; b=IA5PV1LrniAAm2htHeONFU5xXtav82Bpt7tULMIkW9ZslL8xf65uHcJeoFPUQJiB+Wb64RUT5JZH4iP5W4AeuV5H+Jf2sZQAo5AAvv6qY9BhEjOZQnGpyilj8DY6fuQQXV7K02G8B5WTqCf1K6N+VZ0uenW+tEn+OebLgueMtKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791268985; c=relaxed/simple;
	bh=LPA4AM/vfcSgBS/S0JOUdZBplbpkl3iyy1X111JdKXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7T25/ZDgryA/sEh2u6gD8h7WBiZPaa04drogeKjS+dqi0IRWzmXCa/yYjQBl8dDJ/k7l+wEZVxJKyV+fZCePiX8P/XZdtDLbW9hyXgbmrAeW3GHpPZIBwj8rHg9CVjMzzc+stCmnrHcr0KTZzPuErF24MRJ8z0GaOnAioZrZnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcU7Shu3; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcU7Shu3"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so7825754eec.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 23:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791268983; x=1791873783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HcianPOZJYcBmieDb1o4dWGCk/aX34XvMBlFCiEYCc4=;
        b=DcU7Shu3YMzQvz60HJZoeh0S3B7cQZDcYRR6NhQKWaux3nmQ7SfQ20Ilz920CJvgDt
         Zz5ESqDIUklR6U3B0HN6ArWK29x/wNLKWbPOeEcQsRohrOQ+B/rOTkxqyCQvQM9KQyfL
         cScUg+hKd/QWsCmXBcbfcbh400AsgFxjD/7aQIVhi41/6hnN0CcYBR3oydMqF7J/GgCy
         lmlljRVsV0DmLDgqLbiokYVsAD9Z6chFFjeoXdZe2zXRsck53uAiEveuCfh80HqYMcRL
         W9bJVvCyutAQUCU45q3wQzRxb20i2SPQHvMwencQqun84u5lS07Ig3o2LKSrEzVPNmP0
         5hzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791268983; x=1791873783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HcianPOZJYcBmieDb1o4dWGCk/aX34XvMBlFCiEYCc4=;
        b=CSAgcfkjLpTGu1dYpMvVGRolxWhCpl49vsSuZbGFFwaAM5Ujd2E5bWb2fYynV6mGFQ
         OjLq3P/jhANt4+t+BKiV8mSNvu95Adc7Juv/biPSDmJz5l2eYQVtpfmLOTw8MbZWwxXO
         qMmePV5AIufk8fjC1/MrEc/F6UJyKSbkt1WUIrKHhL0e3CKPnqNAeXxMKdYDHnY/uSxF
         gOjO0zQTZFvQMPKrKW/8YZSZvCKhAj4K8WMy40MrEq1WnPkzBxDNfTPxg83+6DmzAaGc
         N6y5zn/PJDwM4SOWXiXxpcBkv3U6DqV9u6C1Gt7zt7mAyIaB7zMiAQyWF5NXeF+VgWij
         S1Og==
X-Forwarded-Encrypted: i=1; AKwUvBzXvk+V9xtMWouM+2paFP7jAgScMFKBkpUZboWxjYi7Juxxu8L2h9KWjuzC9CmVn6pBG94zWSTf94KY@vger.kernel.org
X-Gm-Message-State: AFq9FYL2wy0WtAKS7FEAtPfx1RtZzCMh5a8h5LQJoX6PAmBKAeCTn79w
	VmSQrgMHz+gki++BkMCDLZD7tYC0LVXXIu6GzamGuy+s8TV4Bjbq8Dtw
X-Gm-Gg: AYBFou39gNkUmDgZ7YvX3btIX8OtrqVfBTPkxztBfERPKczCuWB0e50ZyFsKVS8mV36
	ra7taAWsRfd9B14Ii66oL/6/852Tm+56iPVum7HsjjcJsujOsXRAZBDGvs1SzF2Ly8PzPDBnk7/
	1MYmY5WoP9Xmair8ROf+vc0/syv9KBeWTff1gcr54v8xuajliiMwsqg7NNFZJsspUGVeJ1P7/lO
	Gs8UIPmhOWIkBW5bOBIYyqT4gB1SN4EYjbznIwBxaU+CduZpw6DuoTXkHw/XAm31WS8BR71QHta
	Ibsd/4hmaIVxd6RVacdykXAF9IOFYCLmD5jeuwCJbcehhLtXfwCEVi5KQKozENbjxI3BtvDUsJG
	IJQp/j7hYcMowG3EtqQeEAuxREPiuqd/cQHVnpKeudocSBkAKmG87ToBzU0l5gw7Bn/popbee/+
	eOqtFceDovdG8pwt9Bif+dnxIRGtCdUP+kOZ/oroUra6n61FA/Mvh1oOHHq10w4AcOfamLbuqY7
	qR71Qb+
X-Received: by 2002:a05:7301:18a3:b0:34e:67d0:bbb9 with SMTP id 5a478bee46e88-351116caa62mr11416936eec.29.1791268983110;
        Mon, 05 Oct 2026 23:43:03 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:55f5:25c3::3c3:b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a2c991sm4617347eec.14.2026.10.05.23.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:43:02 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Tue, 06 Oct 2026 14:42:24 +0800
Subject: [PATCH 2/2] clk: mediatek: mt7629: add RTC clock selection
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-mt7629-rtc-v1-2-e556386df816@gmail.com>
References: <20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com>
In-Reply-To: <20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

CLK_MODE bits 3:2 select the RTC clock source. Selector 0 uses the
40 MHz crystal divided by 1024, while selector 3 divides it by 1221
to provide approximately 32.76 kHz. The integrated Wi-Fi needs this
/1221 source.

Add the /1221 fixed-factor clock and the RTC mux so device trees can
select this source through assigned-clock-parents. Keep CLK_TOP_RTC
for the existing /1024 source.

Selector 1 is reserved. Selector 2 is documented as an approximately
25 kHz PMU bandgap clock, but its source and control are not sufficiently
described to model it here. Leave these entries unmodelled while
preserving the hardware selector values.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/clk/mediatek/clk-mt7629.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index e154771b1b8b..6336f8c4167b 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -285,6 +285,10 @@ static const char * const infra_mux1_parents[] = {
 	"armpll"
 };
 
+static const char * const rtc_parents[] = {
+	"rtc", "clk_null", "clk_null", "rtc_32k"
+};
+
 static const struct mtk_gate_regs apmixed_cg_regs = {
 	.set_ofs = 0x8,
 	.clr_ofs = 0x8,
@@ -367,6 +371,7 @@ static const struct mtk_fixed_factor top_divs[] = {
 	FACTOR(CLK_TOP_ETH_500M, "eth_500m", "eth1pll", 1, 1),
 	FACTOR(CLK_TOP_TXCLK_SRC_PRE, "txclk_src_pre", "sgmiipll_d2", 1, 1),
 	FACTOR(CLK_TOP_RTC, "rtc", "clkxtal", 1, 1024),
+	FACTOR(CLK_TOP_RTC_32K, "rtc_32k", "clkxtal", 1, 1221),
 	FACTOR(CLK_TOP_PWM_QTR_26M, "pwm_qtr_26m", "clkxtal", 1, 1),
 	FACTOR(CLK_TOP_CPUM_TCK_IN, "cpum_tck_in", "cpum_tck", 1, 1),
 	FACTOR(CLK_TOP_TO_USB3_DA_TOP, "to_usb3_da_top", "clkxtal", 1, 1),
@@ -458,6 +463,8 @@ static struct mtk_composite infra_muxes[] = {
 };
 
 static struct mtk_composite top_muxes[] = {
+	/* CLK_MODE */
+	MUX(CLK_TOP_RTC_SEL, "rtc_sel", rtc_parents, 0x000, 2, 2),
 	/* CLK_CFG_0 */
 	MUX_GATE(CLK_TOP_AXI_SEL, "axi_sel", axi_parents,
 		 0x040, 0, 3, 7),

-- 
2.55.0

