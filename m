Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778373;
	b=L9Aw0HZITe8QUeY7eqwJPcAsqqvdEExXNGy0Dvw6ZyfUAFN81nUlfouHOYNOnyTQ7Iye
	 xlqMMCb+ZTEWTtDgypBRqwaAbiBldmWrdGZff3eZ1b4GKrFdqnEzj1ZrOeDI6dhjLyneS
	 M9pauVwi4ulHah7MOyhmCn69zqRWPjekPO7CNTHyToDJzTe+BBp2hcCj6xsfG3ZBq0yMu
	 w0PPSEfqaQT6CnePu+hoOpmYCs8BIsmgyd7xe203XSupl4t3lM/SoP6Fc6bpHDTtsS436
	 37w1v0RA98obILtjQri4O3dL5mOwLZy9h3On1FDQ0EryIMzXjYkJ8NLKtz8mv0bY5Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=2YMg5NPi7NvaRXzD5WHLcrPWeRT8sqhBxohUakTspaw=;
	b=jrzwj8Q3kWXARGdK7pSu3+MMCsedFPHN22Yy2I53KUTJI/Gy+62oeppUwWc7l3hVhywt
	 NIZukX417MvLPnZTs++JJ16pyacmx8sXLKE6WMCCxZGmPqFQYVn48vFrKXEOai+xVpU+N
	 YnMDDnUykRwE94FVfMu9aPXZ0dsvmVdJdPDJwgpTLIxccWr/hbf4bfgIkR1b1MmMUVs8Z
	 NQFGfwUOa/7Cnfp7DoS/tEqTrz+3nzYqxtl7E4Xt5IPmRO8zDTJMbmXZkyiupSc7A/Bzk
	 sLptwo/FS1g3aQfd+FLjTTjrJAMPuIa4MLjef2I7YbD4/NjsV3FCsI3ODqvM/f0nUYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="jH/5CyJx";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7910460A2603
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7910460A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jH/5CyJx
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a208d93758so12330605e9.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778372; x=1793383172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YMg5NPi7NvaRXzD5WHLcrPWeRT8sqhBxohUakTspaw=;
        b=jH/5CyJxasgvY+0HhkFIIm2P0gmCd6I7Z8tSrHqM2RBWOyvZtww24dtS7KOA51Ut4N
         KaMcTeRuN5SCws1rkHUNAR38QfSLU95B5dSwlw0gxbtXVyW9brsPeEgitDa1uCzyRdsh
         cKX/O8m+QaDZt5xDYBrSJIk3kbOFB9+mVQBJYabTGfvEEb0k7QoKTdXhm1LLC1TOb0SF
         +CvNSLxZxDI2WbqiERTyVu0iPklbrkUApbFf+h93/ynY9z4Ee7J4hTFgmlCnwcA8wNjV
         KZVbRaKp56L9klE+sl0egFwENzL1scaYTKFtwumDEqh+aAIsAUU5p0a7gftDDSuX3B0s
         TpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778372; x=1793383172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YMg5NPi7NvaRXzD5WHLcrPWeRT8sqhBxohUakTspaw=;
        b=XNOpkXuEyrqjf/VFuuG0DmXbCt2plwuotRv/oxuB79OUHi/iTicTgwA2wDQHEu6UVt
         9EkWK2WV7QoEF9NIHNxaPSXNkZq3facCqVRexxtYMQ9NOud09PGvB1VzwSQdWHMioo0f
         vbfbVCvL+9kqA7KWgjWu0W546+75/WsnAA71zV4fiFDrmmW8/WvV+4AUW6jP46LINyp4
         sqEMhjgH/XSWUo/IoaUxJDzDXs4SX3QEsu7GVvRJWEe8MaTjc/dSLZn80Tr0PUNrIYwC
         Kwcndxa88m8YRnJsrhZQZRJIopnmKUYJKwwsyKEUgc23h9GRRrt2bD9A171M9UK9d4/H
         Lbog==
X-Forwarded-Encrypted: i=1; AKwUvBwdgNWTo88wDuFRf/MdD0kkXxSsqkbQ47+BX1JBZddhHXwUWRhxCJ0GyOE9NrhSuozNzsGqbHwAe5aH@vger.kernel.org
X-Gm-Message-State: AFq9FYKUELOIRc7M8jikR4goW34qPEFFV4M7knFAI+miIXshm8C5pRb0
	HkeOzp6U5TTyu45O7xdSwFhu8xEcH+K7d20BI1YKzJTEpc74fRckPqcU
X-Gm-Gg: AYBFou2MpDGt95D9jN1Ca3F8h92eZpZd/JF5uJl28J3/hlwyBCp/pPy41UTFamYYeq+
	z+ItSatHZxUSfpIScv8KM84CLYTv32H35NYw1iWE9uQjbbToNNxqlxTjdU/LZOD9QO6073ctxr9
	CfTYiivIF6f5Dy9TfWUxx/0++mspWiITi9jcJoaPtBg3KzvvLSmZ8OcgBJAvFlXs7V//q1paRFO
	4yfkkILz/SmJDVbn0dmAJGij/02VD3EbUl2Rmr9XjB6HstOf59ks/RjktA4ZGLBW6xAgc2P4Pgg
	dIkcmy58gBVRWbhRvtbJzyK3rweUF3zqiXEvct3xjpBOazBCEIsO1t46EEO6PJehId2KUEQRNM3
	sVLK/ROzQCXnJbYqaJPs5QbQ8pUYsbVLgjjxUnJRIaSYs3lMARl/FisyzcEDxp8AIyfzz7VZzaM
	IILViiIA9lpPVNhLXkVFfgN8tcNeUcYCUBw9pWg+TedFObPCu+6aJ88e74DYi5bnEX8YCpBL2gz
	2gLEzHhYZeG9VM7ZUC+tFFOGOvynW16+K+vr1h1bicjNWAw4+NRgKJLW5e8Whad+P8Uwz8jz9Dk
	ZSRLP6NBD+PTeKajp+33+uwwwg7TjLkc7WgYGbN0taWlf0nJKRBojwK3EMxT7spB6+yaHWC4+9H
	wG5VxU/fKEsPstlI7uF6Pn2ITy/1N8xia7SqwhgdnZpbr
X-Received: by 2002:a05:600c:4715:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4a211eff69dmr54002725e9.29.1792778371771;
        Fri, 23 Oct 2026 10:59:31 -0700 (PDT)
Received: from iku.example.org (host86-133-9-17.range86-133.btcentralplus.com. [86.133.9.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm1342800f8f.8.2026.10.23.10.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:59:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 7/8] iio: adc: rzt2h: Use scan type for ADC scale
Date: Fri, 23 Oct 2026 18:59:18 +0100
Message-ID: <20261023175919.160103-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare the driver for RZ/V2H(P) support, where the ADC supports both
12-bit and 8-bit conversion resolutions.

Use the current IIO scan type to determine the ADC resolution when
reporting the scale instead of assuming a fixed 12-bit resolution.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change

v1->v2:
- Renamed RZT2H_ADC_VREF_MV to RZT2H_ADC_VREF_mV
---
 drivers/iio/adc/rzt2h_adc.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index dbe82939acc2..debd5873ed2a 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -60,6 +60,8 @@
 					 RZT2H_ADC_DMA_PERIOD_SAMPLES)
 #define RZT2H_ADC_STOP_CYCLES		2
 
+#define RZT2H_ADC_VREF_mV		1800
+
 #define RZT2H_ADC_FEATURE_CALIBRATION	BIT(0)
 #define RZT2H_ADC_FEATURE_SAMPLE_STATE	BIT(1)
 
@@ -532,10 +534,18 @@ static int rzt2h_adc_read_raw(struct iio_dev *indio_dev,
 
 		return rzt2h_adc_read_single(adc, chan->channel, val);
 	}
-	case IIO_CHAN_INFO_SCALE:
-		*val = 1800;
-		*val2 = 12;
+	case IIO_CHAN_INFO_SCALE: {
+		const struct iio_scan_type *scan_type;
+
+		scan_type = iio_get_current_scan_type(indio_dev, chan);
+		if (IS_ERR(scan_type))
+			return PTR_ERR(scan_type);
+
+		*val = RZT2H_ADC_VREF_mV;
+		*val2 = scan_type->realbits;
+
 		return IIO_VAL_FRACTIONAL_LOG2;
+	}
 	case IIO_CHAN_INFO_SAMP_FREQ:
 		*val = adc->chip_info->sst_to_freq(adc, adc->sst[chan->channel]);
 		return IIO_VAL_INT;
-- 
2.55.0

