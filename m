Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764606;
	b=odihWnLrhdPQoZoAIzBKcHVsuzTMQLgnBJuy4343WSU1qW1Ueg+NaGpw1CUtAvbdkcbo
	 Oju8F63IBoBcLWBxOmlzRyzHM2qif0lcWMy2SAfMf/k6k6acDXpRjoXcQieT3vx3QknxX
	 +JRPlivcz1/an3MaQ2Lp54vwPjBh9PvF0MHv0YCC1sOjk4PAHmDejIrJMcGo2opNeMqZR
	 JPG7H7PiBEk1dWHEFfYstzKhAdAfklYmSaCDVAJw8VIOaIzMIoVdJBf+tNUrsTJwOBymL
	 uwy6ien75yqTaQrMjinAEmH+eTxz6RHBBwoGPNlHvb+MOe3cYiQkA5XWE6niKqL0DGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eB3a/6b3wofIV5PVq3fo6B4mlRfJKc3ivia26nSP8Gg=;
	b=3pIwbrcavDeCHnTTsXTApD7q/HLNAGvR+iAhluJUMqTJ9UuWPfwH4vRljiFwTWA2Qdfl
	 7cW+r684MfT68NwSmlz58RDJJs0p4KhaZH4gaifFLrBIWTEAqvRiHft5w/OyNfZWnIi7G
	 Wo+YZRvUPn3RyX00VJ4hTuG3ICJIUQGgKjUgNpcKsUla2JnvRU0BQ2gfHNfZOWI6+PKDK
	 s/wNevt0zsKZJzvw7dV/Fl32v1ImciuME+/Yk/bH2QjgdZ5n9J8YhSQvth+fjxWVEax7s
	 YkuVUZoCfG3qWJS36TnRdmKzeIMVX+dZ0gZbpZWPSmrPjDU3la8zx7MjMDk4lQ0mMQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fBe7A8yb;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC897606A31F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 17:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC897606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fBe7A8yb
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3704d30b84fso3192647eec.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794764605; x=1795369405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eB3a/6b3wofIV5PVq3fo6B4mlRfJKc3ivia26nSP8Gg=;
        b=fBe7A8ybKmjdDCAZUf1AwgF4q44d/nheQLu/32nrMbMxbngZAUVuSOqxpLKUTYn5Oh
         U4cfAd+4MTTOjCcl37kmirwnd2oZvvZSPRKpBA5l+f8LHHOAB+eT6CFzVeZBR1rwjGvQ
         SCX2ed0LFNy8/6yjRAH+yeryFFgztze2AL79p936zIEXvRT258hK1+3bOQrKxOkXVBjN
         Q7rOPdW7gjmNgYKpBFe0uVELjgllFL39L97cOrAyFKrmC5+NceUl4ZHAdw+PwsPuOLcj
         L3B+/tEUw36iVhkWHXiPfY+SQFXOTGQhc3qrp6VCg1NJzZ9Z43pxuZdahJK6z+3PLoja
         cDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794764605; x=1795369405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eB3a/6b3wofIV5PVq3fo6B4mlRfJKc3ivia26nSP8Gg=;
        b=ZUi+q/YtezhwswatvlonkYlomuCRls5lmPutnQ781B4oENYEccn+TpLuQBQGdmw5fL
         ykse1vQHgaXkYv/hi63qYIDA3OUCmFs0ZVZWFklR+lUtGaMNwBDGkxpjxqwqkbeLMNYK
         WIEJnqmtWdSpkJ1nCn1NkKS83s/y5qQmzoBoTddbaSK8xnnCNSBOpGWIBFzZKePaUQKg
         Y7cpi32qHnOsg3XV3AVkKABtBazHKlE7wpphqzUrCxFnzartwMAwvpxyru5Bf5zzRw9x
         vdSY/2v3sGj8agSrpShteiF3Wm8qni01cJ5ZGLJ4VlFJ0tesbbjJLTKXp7l3A6GPztWi
         MB7A==
X-Forwarded-Encrypted: i=1; AL+hErExA56hg3OT02PaYB7uvP4RcfDu7ZrfnVdRlk+PYOAbE8pxEakFfTz5xvIgnedyhqVer8niPp9eUVJp@vger.kernel.org
X-Gm-Message-State: APuU4Z+q/B17oPyJg3I5AeXJowlTCuJAamWr885R+GmWo8j1TJmGs0qo
	nP8Jyfmu4cHcdEEvP3ye63DWh73xCAmZzitIJNj/bd5mniukcPu4+i04
X-Gm-Gg: AYBFou0XNBPrWupYOoA6TiOlQwST+wkzKfwLW22jfGRymTD2xME5/5nkPkZsoz4HE4F
	ieU/wwwtiVAIyNVJjVZ+38y0XyvVelhT/XTS1bfy1uhQ1nIDirCIw8XeIjH5f5UY93iYamuh52d
	rXaScd9YprcVSwFDFxfa6mGwVFbV7R0HIDvw3nhi4qNlFdiMphaAXuB1giRmTnBs89y0iRaGlqi
	RBT6LBeBRb7KX2O9nYjEcfDsD7f1iWy6IoUf+9BAZ9AjluT4j6utN1MGhudAn8GaWT61X8KjbT9
	8Rfz376kbVKIBLNq4gZSgzRyUm4OYN7ttDYxQM6GuLI/WZOABxZeE/JsPDMJr4+VzOd5X33uu4W
	/SwxvOl6t5H/Xmhe14pASZ3NRBZy+ibooAtj+O/rWwhfTsl/UWANFksvjU38r3FrCEu+mmMKMST
	j3ctk4Nw3EDABPxziVyYDYuoYFnauscVLoZQc2bwwF4ORx2qs04Qv2MuVtQHZ7QHpnbf1xCLB4u
	zGsq19oRVZ2IcmmFVgoHBO4b7afEbvGeE2mepOfvIdzNpznhDm2oyUKca/xV75EvfsoudTxpbE7
	GpUFqpYM+K5eD6Y83wzwH96FmiqP6pMS+RvUw0EJCQN1k+mTnUCe76Tm1te6r4QitfwRTJnROlT
	amc6So4sJdKzyJCFx0DdVM0XdT32Kmm7lINQfcky5dFzOwMuuoFdV1Ca3mJOb55QFPrs5APAC/0
	qHq0cr472A2sH10ESnoaNQfO/QpjM=
X-Received: by 2002:a05:7300:e9ce:10b0:368:7c2d:a612 with SMTP id 5a478bee46e88-37966c4738fmr8600534eec.10.1794764604805;
        Sun, 15 Nov 2026 09:43:24 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:9ac3:b274:12a6:a1c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm28204663eec.28.2026.11.15.09.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:43:24 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v2 2/2] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function
Date: Sun, 15 Nov 2026 23:12:37 +0530
Message-Id: <20261115174237.48908-3-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261115174237.48908-1-surajsonawane0215@gmail.com>
References: <20261115174237.48908-1-surajsonawane0215@gmail.com>
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

LPASS LPI gpio5 can mux EXT_MCLK1_C, but that function slot is left
unnamed, so a device tree cannot select it. SC8280XP already names the
same slot ext_mclk1_c.

Name the slot on SC7280 and assign it to gpio5. The third slot stays
empty; on SC8280XP it is qua_mi2s_data.

This file also provides the SM8350 LPASS LPI driver, which uses the
same pin table, so the function becomes available on SM8350 as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
Changes in v2:
- DT binding moved to patch 1.
- No change to this driver diff.

 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index a61df10d4..278d5fac8 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -34,6 +34,7 @@ enum lpass_lpi_functions {
 	LPI_MUX_swr_tx_data,
 	LPI_MUX_wsa_swr_clk,
 	LPI_MUX_wsa_swr_data,
+	LPI_MUX_ext_mclk1_c,
 	LPI_MUX_gpio,
 	LPI_MUX__,
 };
@@ -77,6 +78,7 @@ static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
 static const char * const wsa_swr_clk_groups[] = { "gpio10" };
 static const char * const wsa_swr_data_groups[] = { "gpio11" };
 static const char * const i2s2_data_groups[] = { "gpio12", "gpio13" };
+static const char * const ext_mclk1_c_groups[] = { "gpio5" };
 
 static const struct lpi_pingroup sc7280_groups[] = {
 	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
@@ -84,7 +86,7 @@ static const struct lpi_pingroup sc7280_groups[] = {
 	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
 	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
 	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
-	LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),
+	LPI_PINGROUP(5, 12, swr_rx_data, ext_mclk1_c, _, _),
 	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
 	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
 	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
@@ -118,6 +120,7 @@ static const struct lpi_function sc7280_functions[] = {
 	LPI_FUNCTION(swr_tx_data),
 	LPI_FUNCTION(wsa_swr_clk),
 	LPI_FUNCTION(wsa_swr_data),
+	LPI_FUNCTION(ext_mclk1_c),
 };
 
 static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
-- 
2.34.1

