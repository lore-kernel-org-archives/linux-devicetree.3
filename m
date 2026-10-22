Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690485;
	b=32+J2EkNnQT7JKk8Ft55yBdHJqQqOH9hMenBPGowj6+2Kgh5eL0x1ErX0IEzZ0/WMFKG
	 rO1mZsvJrYYHHbQPYc5ppfVKLC2fNqsaYcTxrjOfW3FxT7RvBBLCvQUeB4WmQPiVevgfo
	 zfZ0qElQ3iddoLudGb6OR5KIaWQugQ2GQ9cydAeSuqsmIugahmmFCCD61FHxkF+L6tI89
	 if85XpzInJcaqt0BlvxzFnvv0mbjMb4GKoiYqh7QbEvn763F3kRK6SHRE/G6RqYU8Fb/O
	 sbk1VcOmAZ3F9oEc060z+5k/d0xxqe0WNgR1aQlIBbx5Z7eUsSsVLO/fcIqMyn79U3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=djTWxpT1ovKkbA0vbSvCTa6GvH4LLAvCDTO8fermq8s=;
	b=U9drvBJtAKi9z/XwSIxxAUJ8k5c49y560if4NW8sKzYjbhWC4HjsNRHsgeZEkqJuqywW
	 TkYuanTBH1+FWBllNt+ab/FN1tro0QdSBXLs6cRLs8qmGqq0LAi4Q7ZVDLbVxBkFp1uDA
	 jobpavZwINdjf80MZD9ehk4cKFEzy6ooyUIdxoYLuiAb24mAR9d/T8dxaEf6JW5SAY0dF
	 fXNdY5EvMpquXyH9whl2n6YmomEbDUDUJ3c6X6Xl4QIsram+DFJeqV40cULQXP32WmCUk
	 nIWv/22gTlYO9GSVHcXUco6s19j7NxoDeF1QG3rT+h8zFF1x0uceDNhopZN20kPpZlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=oZKn81O0;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6979060A5BE0
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6979060A5BE0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=oZKn81O0
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b0584ad71so53500f8f.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690483; x=1793295283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djTWxpT1ovKkbA0vbSvCTa6GvH4LLAvCDTO8fermq8s=;
        b=oZKn81O0a11SpkUNeq2NAxJwSgzjpEfa7Rt7URUvcUigkeVeR6y+gSwCWzHGJgosfg
         oEye/GszlPOD7YktNmWOjC+tXfVrMfi+810862/ttdzsqpjrDR/hYxTLwWLFDQNDbFTI
         2Q19Cq/w9jF2bSRVq5iqWbmSQnIN7SrfdoWM4dbmajBGEenGW2voPdZRNER6A6/DvhkN
         9rRb1OAuGH5cZkrUzLX/1G0YjPYWfMuk/1Zj0u8rvoWNEnuNQrosVWs5+WoKwS0E8SM1
         QIo7unWbf6ybwQHolfuEmMJLUYGidpR/fkjyyeN98xbiTZAtS3U1PsulMvI34hdjzDcc
         6wKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690483; x=1793295283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djTWxpT1ovKkbA0vbSvCTa6GvH4LLAvCDTO8fermq8s=;
        b=T851RaP89aYUCBJtYYrQRclwmLRE8CAiTOB0GpawVszZRppPkDnkBzSlw48aWhzSgA
         cYyEWh0x+l26cetNt+ln0pR4qeZYlD/4voxoURHMbUm8JDZiEQynQiySa+xqZkqEprs6
         e4etNj8Wh3KXE/YR1k6igW5By9k7IDjheJoD2KUbn44ccsrygOXv8I5bZBMdOQZsdvY4
         O/7F+05G3gQSpTvoPVSTjiEUavFA7KiOtlOtDTEznL0qHFCn3LqAW3OjdfyN9AWaeOVI
         OFxHeHwB8ooo4FjhxPwkm0ljl0chkM7oDqhOYG6UJM3fjpTpxythEAXTjpKxyc5FWCsL
         ZEQw==
X-Forwarded-Encrypted: i=1; AKwUvBy3OsqceauqK2vg4Yk2e8p8On5CBuWZZI49v1M7FUOIDOmGKgeHhLsW2KBPD9t98qUOJoLn2K8IrBlI@vger.kernel.org
X-Gm-Message-State: AFq9FYIkgCl4veUb0wCjc6wjyg4F/ce6NjJzAP02VKoNckO8qdUeyZ8g
	LeYowsFxkiVGD3waYCwU3mOgaUj5yCQ4/0LegTg5FIWTp0lNGBKKdbv/uAkBmU7r18uMdlcBu+Y
	nkJKiJWc=
X-Gm-Gg: AYBFou3hHLoVVyVw7xjnsnyIoDm1LCdRo8bqjwPdSLuZbR79ZkhUeiOAMAlJ4zrSYsT
	4kF4X4Au6gU2ovqBCqyRx8U6YVNvu+L/hSK23NT2uyGpUxwH/G1WluT+jsNDtAiwzhp7LaqSY3z
	d6nWCha/Rc1jzSWYvAoOvv/W38vo9b1TaxGVOwJ0XHMBxLjfgQ89L0jJ7elzxDxH0gYTofJJc8Y
	hyfb63NH9nYfowkxJ7gjhyzFTfZ7jD+Xlsw3njtEpfuJP8Sd0+lUXZVVcWEPuV1uBqSMvIqR/tQ
	PAmpNCLnQQJKf4wYfOQUVaAtKJ2CXV/iJFq6IZWSnP9+yCa6bAWP2t/NTAkcsCHtXp3TH56cg9V
	KYB2PROGjRTWvjwAEZoPx1XdDsxsSQnfIW+SaaEu7cCOuwUJsPc8Eb4KzJKN/1YqLLBe5hRxas3
	nZqHyB94q9FHrqHZsBaFnJPDRml3zGX6JMo2GeJOC7xFGSKCvLcBqEps0gsH1JPKQLllcoY/t2r
	13RK1ckB1SKUs+eCB0HlfuXUrzJHZnTaOkBPuIavr4Q4rLSqzqLrx2ZP20Kj00Dmn07p9LuTfX+
	futcpzQYhC1KGKxHV72xXS9A0gqMd7M=
X-Received: by 2002:a05:6000:29c9:b0:48e:203e:84f0 with SMTP id ffacd0b85a97d-48e264a7cc6mr8368922f8f.24.1792690482821;
        Thu, 22 Oct 2026 10:34:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:42 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:07 +0100
Subject: [PATCH v6 14/18] media: sony-starvis2: Only update bits for window
 mode
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
Message-Id: <20261022-media-starvis2-v6-14-374343f55fd3@raspberrypi.com>
References: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
In-Reply-To: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

IMX585 requires bit 4 of the WINMODE register (0x3018) to be
set, whilst the bottom nibble selects between all-pixel and
window mode.

Switch to using cci_update_bits so that only the bottom nibble
is updated, thereby working on all supported Starvis2 sensors.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 645417cc08fb..e64d943369b1 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -89,6 +89,7 @@
 
 /* Crop */
 #define STARVIS2_REG_WINMODE		CCI_REG8(0x3018)
+#define STARVIS2_REG_WINMODE_MASK	0x0f
 #define STARVIS2_REG_PIX_HST		CCI_REG16_LE(0x303c)
 #define STARVIS2_REG_PIX_HWIDTH		CCI_REG16_LE(0x303e)
 #define STARVIS2_REG_PIX_VST		CCI_REG16_LE(0x3044)
@@ -1460,7 +1461,8 @@ static int starvis2_program_window(struct starvis2 *starvis2,
 	int ret = 0;
 
 	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
+	cci_update_bits(starvis2->cci, STARVIS2_REG_WINMODE,
+			STARVIS2_REG_WINMODE_MASK, 0x04, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
 		  crop->left - starvis2->variant->active_area.left, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);

-- 
2.34.1

