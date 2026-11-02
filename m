Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649218;
	b=jUvGN2t6IXALsOuogba02/tFM1fbI9qTh5t6RZZEMO+v4ZPs2iX6hsdsoAIJck4FPVJp
	 o6gWzO5Ckger3Fy8BmsFl6rRDwZudI38tWQPqvrw11yo+/QGBP6L58Qf5CAwEFHWyTs4n
	 TXXEvj8zUDh+vbYHsVR+dI8R5m6/J0H8WHjz1mJ40w9yfD4jzLUhKuE//4hPhGD04VJdX
	 ECF8qMjJJlShWQi7CzEqAxqZtjc9pV65VgDlUOmgte7DTBYoiIduBcZAc//ACa+/iOL4Z
	 Y5a5lW4fNq3syx8rCrGVa8gu16nTnmomyOK+nmoXMjW0cPb0sl429cj1c8tsAyitF9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xImj77wxU1JiPHrCn+RpkXX1bCUiT+eJFmt0+GqsKlk=;
	b=2CkLQ1FtDNksV8LytNRq35H29oQo1VDeNwDd7+FnLahcox0cKerNrEqttr35j7+h4/71
	 VtszxKliCvzcX8YoqiVIyml7PbrUEa2AFOnQevCR6w2doOSYkiIhYUVgtzJ+jrEAQ/Bco
	 nt4Baq+nH8+BQg3biB3OpGkma/Pw5qbRlb6PFCtB6KThJwseUoj/5ZgrMXJABsP8rOmdy
	 lkzm1MVSIyXTsIDJpzicxZgP2Q0wMdFklFbdu/TIhskt0oodnWGI4Ctm0LC4xk1ktWaP2
	 FYpdqoc8YoynfI0c8vERoLbtO51PuPvlb1iSkZVmuujDdY5bHNQKvQWlre2KLv3vXWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wr0ze8ZS;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28709606D837
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28709606D837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wr0ze8ZS
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso15625755e9.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649216; x=1794254016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xImj77wxU1JiPHrCn+RpkXX1bCUiT+eJFmt0+GqsKlk=;
        b=wr0ze8ZSw+SH4GDQWPNXanLZXkEVtyzUNtWcuEqD8bYpY12rL9ZY5uuFcMkEUTpI74
         WYivSYlbwK5MRgpoylmFHd+y3FJyeAUqoqKqpZgtTyiYaAbTvrV9vF+HALxpMorTpF+2
         PwEaniNrv1K6NhtElM/05sy4sXLZB0nR1nQ36RGpD1hww+VGIlgAxQSTlv1GPgY53F0Y
         7cRo2jc5SG1Aj/9v4LyY9F7qwcei6Tm1CiEmkMcsZWAVuSmEGwvTjmgDt17mc9T3BYYo
         dKjDdz+z3q37d0LNbGGIV4luI4c0cpdBmnHc7HzmWCSCh1BQt59W6Xbj6G70VUVATBPA
         0RqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649216; x=1794254016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xImj77wxU1JiPHrCn+RpkXX1bCUiT+eJFmt0+GqsKlk=;
        b=eKWLYhoTSb1CLNH+m0PqWvYUrvis1/v2d4hnaX7DQIrV3818RFK6vZS0tjkCTca2Ll
         olScFHD7yJKcAEfxGV8ByECDui+7wbfq0P/1WA+uNVAiv1l1FZ3VYvghBbzFJjg8ynoz
         F791TYCv473nmK/DV16JMHKITeuml151La4UcmpzsUqviZZgUT3wcW+q6uIduakcfdCy
         qEiDVUS8I4WOtfaL4EUVvKikIAHH8HZj+DfP4l2NMSI6oWQ96ukUlMaCa05akrkLvLr1
         Jzpbkz0dv6sftWBtcPZxxdNyD2v+2tpFJgg+0Zc/sgxAJY6/9GZGygSHZAN3JenqOs/R
         fLyg==
X-Forwarded-Encrypted: i=1; AKwUvBxJUl6cGRNpGZjXy8dQstHzaSbYgz0nAviIc8yb/OK2I32YpM2z2fZ9O2Kv8w7zYv5O9FTSBhLC2zoF@vger.kernel.org
X-Gm-Message-State: AFq9FYLrzJcewTxazp1lEZun8Co7W+hvGtvLhrUxWxRjETqls4SwUPY0
	K2+ERMvrJ2brgYwd8DsyMBuy6V+tMQIHNtfWSgsLAow81mJAXqJvkQhzV0+cwu+NoPA=
X-Gm-Gg: AYBFou2YkzUCaVcbsFYmevmcUFhNkFM1X30jzo/5Txk1HAZInyGsaVBtum0YOn42bsY
	EPYrbeD+oGdgflvVaxjy6km82T69q61FyWpv37v42CQSXkZ8kvTfcaJZC+cI/LoAr/ZDqgPlRJo
	SBflpDmycta+rHaaNSvrt70D+JG7EirvGkfulpdvJnviZaqjEOdq2UW6o4tVhZqWmTPmxH/t3Cu
	lVwRmFy+eziGaT8Nd/hzbDRbjLA+IuQLAUHzdYyuiFk5bJc0xymB5cqUfCYVv2sjLYTtcBkvdEd
	rl7mlHK3GVjr1mXPUzQwCDuB2fv2Xl4sHqq9WPtubXc9bp5uDVaKDmxbjFBLtLERVkPGc9+VQSm
	LLZEi+BrrHfZzNGN1oWQ9MTm9uVAT4QoKorcId80uotwpxOXp/1zntjklVBmMuDbXfsjwQvBLL7
	1NIigMrAILiTYw8A/qruEPv3FNLXQTNlxPOyjA6j5lcCNaMbqzdn+Ra2kCE4SNRdnaN6JsTWvhL
	1xkVXHQIVAk1bgMw5QDTmDH7zempqtsXfj/IWMiuPFYNyo77nj31VWU0C8jDE+ZWiT1HoYJU8Fh
	te94NDqb7m0f53tQLxTLpvQzgKIj4fedn432T38S89BFtCRA5H+snXXInko+zoge7CNpU4EZDlu
	JBilKJcJl+JtVEf04RrVXpclmLno=
X-Received: by 2002:a05:600c:6989:b0:4a7:6425:c274 with SMTP id 5b1f17b1804b1-4ac150b38d0mr253158745e9.2.1793649215549;
        Mon, 02 Nov 2026 11:53:35 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:35 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:51 +0100
Subject: [PATCH v3 5/9] ARM: OMAP2+: ti816x: Remove mmc1 hwmod
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
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-5-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=1739;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=G9T2NjG2BfNSixK5sZS2CvW8OhbMENFuouCNl2SV0jo=;
 b=ZZLDjvHR6I7hIyGPauR2LYro//dURZ3tYARcVpY+gDOy8N4xYf/mLi6AHVlxgrzjl5I3lL6xr
 RBe+pYKXStnD6Fv6kqtmFRpBrzXmGw/RgUYx9gVc6FQ7jEsPfEUs7ud
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

Removing TI Sitara DM816x deprecated hwmod for mmc1 in favour of
ti-sysc implementation. Tested on DM8168-EVM.

Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
index 9b5c728fb7da..bdd04fed8034 100644
--- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
@@ -989,30 +989,6 @@ static struct omap_hwmod_ocp_if dm814x_alwon_l3_med__mmc3 = {
 	.user		= OCP_USER_MPU,
 };
 
-static struct omap_hwmod dm816x_mmc1_hwmod = {
-	.name		= "mmc1",
-	.clkdm_name	= "alwon_l3s_clkdm",
-	.opt_clks	= dm81xx_mmc_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(dm81xx_mmc_opt_clks),
-	.main_clk	= "sysclk10_ck",
-	.prcm		= {
-		.omap4 = {
-			.clkctrl_offs = DM816X_CM_ALWON_SDIO_CLKCTRL,
-			.modulemode = MODULEMODE_SWCTRL,
-		},
-	},
-	.dev_attr	= &mmc_dev_attr,
-	.class		= &dm81xx_mmc_class,
-};
-
-static struct omap_hwmod_ocp_if dm816x_l4_ls__mmc1 = {
-	.master		= &dm81xx_l4_ls_hwmod,
-	.slave		= &dm816x_mmc1_hwmod,
-	.clk		= "sysclk6_ck",
-	.user		= OCP_USER_MPU,
-	.flags		= OMAP_FIREWALL_L4
-};
-
 static struct omap_hwmod_class_sysconfig dm816x_mcspi_sysc = {
 	.rev_offs	= 0x0,
 	.sysc_offs	= 0x110,
@@ -1236,7 +1212,6 @@ static struct omap_hwmod_ocp_if *dm816x_hwmod_ocp_ifs[] __initdata = {
 	&dm81xx_l4_ls__gpio2,
 	&dm81xx_l4_ls__elm,
 	&ti81xx_l4_ls__rtc,
-	&dm816x_l4_ls__mmc1,
 	&dm816x_l4_ls__timer3,
 	&dm816x_l4_ls__timer4,
 	&dm816x_l4_ls__timer5,

-- 
2.56.0

