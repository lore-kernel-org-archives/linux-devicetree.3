Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180287;
	b=I1DFEZEOwIe78Cw2apqRcT2V9zSP5v4yokSs8x8oQLVg1/xuZ9Ssh5O4mCJcB3QAJogo
	 f7/b8YEOCBN2k+nQqyO8U05Y8fsJ0rCAPZuhiVvto0XMFcByes4iRM8nCdFo4X0PtMSKv
	 lI5t/hpyVUQ5T8xTDlSarCJqsQUXmWcigSFYQAHjzYZFR29T8OFBW4uDiK6PfClQq4uGn
	 7iAYYVmcxbYeR2pkTL2AozgBXVOhplDiQQE6rBm6ZifelEqu+xHYsGtvW2AmPCIlRDjZg
	 6bA6pRewScVkbM89GMEm7gek0Ld4H8JVJqrYPFH7T3l+urLb2/NjZxnq/+RJwFKIQfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AiiquoDpQ0fORfLwcpAgt6hsMks+0p+aM+8XYir1U8M=;
	b=VlRlAgvwqIu7QUYRcrtOLzYwVM76JX1ZG5BLiFUsSGG5/CfGT90rb1ukdp0EYwLiKEEY
	 BJvWJD0cBIotSaqymt6ia+Nl8hYQsHmj8ARIxcCFqlZgVSJQJrQMOvJvT2BN96yqWE+7A
	 knb+9XtXZMwGSfdbMeSImXAPu+FSU0ZlQFMA3opmgMOmk+PvYmclMD9K0veqyodVWlMHZ
	 sfEJcaEuMHq4eQqh2e1M/8jjqvRZ4r9pU+kCfKUGelOQknVYGik7vcta8ARNkp888KqkE
	 6B1G5jc10zX/qvDuOBGJfK1xT7mZ0rmy9sGoWgaARPFDZ+eHpifEO9Kvnb0ZMWC4fSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZR8gSfVt;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F2660A3807
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43F2660A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZR8gSfVt
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so8564195e9.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795180286; x=1795785086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AiiquoDpQ0fORfLwcpAgt6hsMks+0p+aM+8XYir1U8M=;
        b=ZR8gSfVteoRFAS2zgu38I6kuI9bdzjDec0HgAjSyhrrIWdGtcPQVCw8qkUI0dAmeiJ
         q+9HHMlb0gRL0kePtGr9pueePzlT/XzaQWHFUbxGJoH1pq+ToU8pFI/vhcByFZj0Cvhq
         3JGZ456eeYkp0RD+D/T1eRKOEEUYphctlng/6tRxO/pDdLEcHY4UGrWjmpHcnLBZba65
         aubsIHhoh07iAD4eeR3Rqb5cTJHVG8Aav84pS54ijzwCiziyX2QZOGMwDgqVPQ2eV3nG
         bzlYWXJtp51hR3oDKi3LqnbKJjfg677KvDiC7/MOlgPC1zO8Z/EBm+ogO1o3XL3ZDKwg
         SdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180286; x=1795785086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AiiquoDpQ0fORfLwcpAgt6hsMks+0p+aM+8XYir1U8M=;
        b=FuVCX/aK/gUP2J/LFAkFrcThuBPEzccn5fg6OvN6u8ntnjSLtY30EJwBYHoE71Clyo
         Up0SiRT4jrVMFvnnLtiSDEiXoBuX5XmO7ezoCWkZwROISsYIiUSVz+EcE9Snyd13s3AP
         JRNzwb+s/oHUmKW4HDtjWHEcbwDep5uB6XXaDCHBWd0pIb8S/N+BtbIKy63EtVXoij+k
         UsKVOYdArOY+daLchNPH/AYG5ypxkO6WS37rqLOy1SGfhlhi8ZUQu4hPhLdM+Ze9atG8
         PbRSsf39u1gEam6vBR4YsjcvESSqckNDjsIKDWL4oGx9sFLjAd7j6jY15BIxkIIqnuBM
         TMsw==
X-Forwarded-Encrypted: i=1; AL+hErGitjL5erBmetP8ka/j+kbeSFcBFDLqUQJoGJiuR0aaKsmzVreg2UiL9k8bcn1Xa0T3j6wh9Y/G76o3@vger.kernel.org
X-Gm-Message-State: APuU4Z8cZtXxr+EEt1pxaS/IWEtUncngkRJvDtcCvbnM8Uur7YeEOuUS
	y7Rf9V1wSyoYo/uAXlhrXsy8ydHKYtVb9q5aHwGHeX3dRSAivfeoZtAHznLD78ub/mg=
X-Gm-Gg: AYBFou1VQBJtayV0A+h/YTznGU9Q8iC//8ynirB/37wIaItx42lNJcBGynbzSsKSSmc
	QNPvd1nI/tzTY7FziDTfwVNngQS0AVKjUV4lTVgM6XeAclXrQiZI/KUXBDHSSyClHZSFjrL7qpW
	I1YFXg9TH6xFekVCFBCwFtnQmwi447BYYz8k9+Z+TKJN+boZhGEdTP8vRF2d+81OoXZbv1bV1r3
	Hm2MNRu0VFybc+AwDwSyUprDCbvRjbNtN9C/zVhLluhdThnTAl2G3FCD2WsJ6pCFDXm4tJkjQIR
	3BRP2J7L/W9mDi7Trg/vzqoAZfsAYtz+pRqdFERKl+MUKf1bwUf3ZWgVwmUF0o7XbyCKJdFkIik
	jdalmWMwTPK0JfO9mAhs3EQ503wTzc/URtJ5/0CJ29s5t/XdHRUHTMshbW7hAueoZvm1aIK9ypm
	KuovuKTEWzrDbSt/aqTCKsmwlSSReZWEg0tTSJ+4lhhnMuI7kwyeNPlTk4ysha9JOMyWnTQPqxb
	7DM0SUvVX11ydaLpFq/HF/PLJYGQbgekwB/2R4hgQrbpQL71pQjOSvIfslWLOMe1XTgnR7t+RgG
	W89OSODv+oFDo96hIVCbWNxRKfHZlZDcPPFWD8c3fRSQHescK711UfK93X1aV3mFuJ0iV+1maIa
	jtsTA0iqXygosw9v89vZ4DDtcgxbGz/EYggzof0CR/t3uWk4ReSrJ2Oc1w+L9R742k9id
X-Received: by 2002:a05:600c:4e0d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4bb88922a67mr67265015e9.31.1795180285567;
        Fri, 20 Nov 2026 05:11:25 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960110fsm43497995e9.0.2026.11.20.05.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:11:25 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 20 Nov 2026 14:11:04 +0100
Subject: [PATCH v2 1/6] clk: meson: pll: Support PLLs without a pre-divider
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
Message-Id: <20261120-upstream-s7-clk-v2-1-856cece3b9f2@baylibre.com>
References: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
In-Reply-To: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0

The common PLL code assumes that every PLL has a pre-divider. This
does not hold for the S7 HDMI PLL, and the S7 GP0 and HIFI PLLs are
meant to run with theirs set to 1.

Make the pre-divider optional so these PLLs can use the common
implementation.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 1ea6579a760f..44b33051405f 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -76,7 +76,9 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 	unsigned int m, n, frac;
 
-	n = meson_parm_read(clk->map, &pll->n);
+	n = MESON_PARM_APPLICABLE(&pll->n) ?
+		meson_parm_read(clk->map, &pll->n) :
+		1;
 
 	/*
 	 * On some HW, N is set to zero on init. This value is invalid as
@@ -174,7 +176,7 @@ static int meson_clk_get_pll_range_index(unsigned long rate,
 	*n = index + 1;
 
 	/* Check the predivider range */
-	if (*n >= (1 << pll->n.width))
+	if (*n >= (MESON_PARM_APPLICABLE(&pll->n) ? 1 << pll->n.width : 2))
 		return -EINVAL;
 
 	if (*n == 1) {
@@ -437,7 +439,8 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (enabled)
 		meson_clk_pll_disable(hw);
 
-	meson_parm_write(clk->map, &pll->n, n);
+	if (MESON_PARM_APPLICABLE(&pll->n))
+		meson_parm_write(clk->map, &pll->n, n);
 	meson_parm_write(clk->map, &pll->m, m);
 
 	if (MESON_PARM_APPLICABLE(&pll->frac)) {

-- 
2.56.1

