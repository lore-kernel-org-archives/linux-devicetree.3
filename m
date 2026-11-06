Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953837;
	b=4L9fwsxgPO6UtpoYVIJ6nr0pxjEOgevlxhU2bGIx+XeQxUJxOx+exreIIJUx15ADLO1t
	 nYIdweuwJw+Iqo0ABu3obUJGPUpHcYKzpkmjk0fke8QRrB2Ohx/gmUcUXfW8oEqFikipc
	 z7tF4AyD9kiPulL1zD4Tp4z4ssvvTGck0JFg9YdiiWUbFzv4S+5EHAVcIZBrJJn8lLe8d
	 uxDqu96HaOsfkVdYMxLjQoXueuMDUiereLS/YdAB+el274JGk1lJVRaTm7ZKxTiL3gWO3
	 SXx8752AcxLjNMW/w/ps5v9S9zBq5/qNXzfxyT5TCcenl/7bP4D9JvOCcnRQmf/LH3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=VLpvOWiOg/0agPCz0eeaXl9nhZwnrqFnecxOWRAu+hE=;
	b=KAkgZU6y5vfpS0SIF0tOcbybgEe0jq2+dg1GrgwoKWn4MXOXJol6Rzb+ZZq6vlcjbdMS
	 t5e7SIoYnGp3r5Bkh7o7r3mcZAtRfIQ0Pz/FgNZO7W3jGJbdHjFSA6igwyUnJOKY1L84a
	 NTvtQjsmmxnHsr87YRdvvExRj4+wmwS6ujAA1oni9bAIJoLIShOKrsSudTSTCu1uB5rWk
	 ogpQyrzZqtNSqlZ+5D5BEHbfEOQk3S8CQUi5/HP+Hn9bYHotQwntqKhR+Q9REONC7Aw9b
	 HfVRUF0nYZbERurOWrjqwjjdrYku8N5QJ/ehX6E2YHQgx2uMuhQ4WkIIOgSnJnQdAiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Y1eY3KP3;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBBE606D806
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 08:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CBBE606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Y1eY3KP3
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49134c8509fso309670f8f.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 00:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953835; x=1794558635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VLpvOWiOg/0agPCz0eeaXl9nhZwnrqFnecxOWRAu+hE=;
        b=Y1eY3KP3gUC2WREteGQ5tKEYe5s3n0BGTbCtGv1+dyHdwaZ0qcXwHLBXys/2W8YHU8
         mMvi7yD9IXYTcxzl7tbSF8l1dcHpigt/dVkgwwENE+ZOlOi4YGsesxOuYcTqT3z5N7qj
         IZZEIYMeLTiaa+PUjI6Bd3QrS/8Ss26PVTAc6TKY8TibOS/HEP7TABU3kI+4ZjU84I39
         7YTLxMctNVlZsWII+ulLTV9dhdGBauvzZSdBbSt/rZ9QfMsmhHDVCFNnWO1iUQ4WFDYJ
         450Hxqyu7Yne3NPJ+Z8hr4+EnNiZyDYYr+L3Z9K1zv8rhjlWpXi3VPsTBoQPwq7bcqU0
         ooQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953835; x=1794558635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VLpvOWiOg/0agPCz0eeaXl9nhZwnrqFnecxOWRAu+hE=;
        b=vjBYhBuRvXgh0Bzs3Cdx5ywkPEn01aXISqQcyTYQd11vTIaj8FE2nXi7YqKiWabtWT
         dIYu4owLHUKp2ZD2H9HlpBoGm63A+/qc37tjV0T1c6KE3ZcroOLaMjSxYu4Cq/0hCCNu
         420fL55i63nvrQTSh+fW4unUtpU4wVV8lLSOlsKbf379Ffo7VwV+bCqzVkQFJ8v7tXPK
         C6oQstQZudjhaqln9hZojSQ3v7Bu5+oe72AIJt+4ZyzgIMYf0jSePsyg1rmtb8bMczsp
         xNTEvYjoZlqOJGCgPzRoG9YllUjtYIotolqljIhwzbKSxwGYnAAIQBpDRRtiGuUX+ZNC
         lMiA==
X-Forwarded-Encrypted: i=1; AL+hErHxV17rLkqvFdKhTFhqPLTtDTv+Leh6ldMTaG1BpY3jwlZUwIkBhDEY1+bYMLPCIpFANBF1gibkrb+F@vger.kernel.org
X-Gm-Message-State: APuU4Z9N0CnPAWtz2LMClw/LiussxmzSDy5hPyKEmDO0GRfXHZDEDiFI
	llHpZ6R5tOSmG5Ak63rk4i63c37brrJSb+tgfDiqei2salvZ1zw4pGe/mqKz/B+iDy0=
X-Gm-Gg: AYBFou0qxKkjrkStem+kGRblE5T9i5b9iAD8ugUceVeGWIaNi63hSjuWtHO6U9835oV
	tdNMfvnwO3x5q2OiX+EFkaqCVfzQTw+364TIVnRZIIy7pcFd40cMrpPn4HAYtnIMisGppskzjip
	twZaXpGmNSiCbhLGGJvDpUMDrrtF34/UUF3bfCh+fCphARMdVQvy6IS/SqDBnhRnXNNWv4VVH3A
	4E/bRJbqqu8eKXWbsfMoqfEzGp7zW0cD/7GMUmzkNwYa54VlALQd6vhu1yfIApNkVTk8cKBaFQ6
	L2xsRqpmV9ssXecXUy2FLQ/8VYwulNff2xgsrMXNwDYO3eYg+FhrW16hT5MtbbzqOfGvCGxckf1
	VmGZtS19R947KBiyFHsa+Q8ehFU3D509C3kycS/8iMKUkWFPY3+VmMxDl3yZU4a3loctKW8noHR
	R+nQUWgcf3kaahfZKxyH+EgPuYNzOMNUCtM9MWfO6G1ZZE3gONwTIpzAwer/3LURnP911KsP/mV
	wj0/3sCuFtt3wHo1W12UrMynqJpmdz2gGzMmIMOOW6FaY0i5dO9NB636qqn6uDofhg2Ji3NdUfc
	Al1PZq2P3Y7PCIS9+G4/LEMv/nsFH3x5ObhOlZotx0DPBifq2qcSapdO8TkXOdzbp7rmd7nicOl
	vC9lvtgpsDgpNXS7RCkj/UAWud7j8vfkbKKmlFLr5tswnjA==
X-Received: by 2002:a05:6000:2384:b0:492:b880:53a7 with SMTP id ffacd0b85a97d-492b8805664mr3030579f8f.5.1793953834697;
        Fri, 06 Nov 2026 00:30:34 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:34 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:25 +0100
Subject: [PATCH 2/7] clk: meson: pll: Support PLLs without a pre-divider
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
Message-Id: <20261106-upstream-s7-clk-v1-2-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
In-Reply-To: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
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
2.56.0

