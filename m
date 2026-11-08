Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131009;
	b=0oiSbpxXLSmMIdMgbFFtmBwMEQXB3qFA86eGSGQD6FSSDPw2uanxNYqtuCc3SIqrhk7f
	 H1xYn5LUZnTGn3W8e3EeBzHnZ/G02AvhSRNLngbp5OtDRJAfd1bTgjUul+mZJOuqhCeHe
	 WaNgeTBgPtY8QkzKU8odjaVZU6TzzrEmXZqMBV9G409J/FA/cT+to40wfMYs+nUDpEww1
	 SOeRydP2qwyEYhVvL8GI0c4AbPe03IRakPCVhPdCub4ULb7JU7LocECrrZeKzZnsu2o0L
	 GBq3KUyG1uDud7RxavhnqRqVgzSPMZynwsMtIqNdtDO3mjXnH8DTmRz/KzVTQgLd9jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g+JNwiCu6bm0rcLmuJWSYeAtStEl9n5lsa7a5i38a1Q=;
	b=S3JL96RKHGvOpgQKxBnIntjRvBMrBzt4dma1RrXXu4pU3ldem3BKpLzvLuTCiVlF4X3c
	 ZaqYGXffqtWR2bJ5ZBzn2gxYOdtEnlXRPFWmtJv9EHrhQetQZwDikm8CtrYCoL2YwoLka
	 EMIAa0AlOPQPE/dgWIp3rKIEe3ai8+o8tIS4lk+equexVYTx6L6M6+kD1IWtK2GkDzAcx
	 IwMHx/8+qEIONik+SI8VHLryqAn7/XodWTmpsFsPLyuKeAu5cxsiO2/kjtwFpmhMhHBsn
	 0fEv82xX9MojuKbIrhPdqlgSZM1prnoS5f07ceYBTZABRi7FNJPLJnw6sFtFOuNo7Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=waq5Jg1J;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16900606A332
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 09:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16900606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=waq5Jg1J
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b587591414so17297a12.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 01:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131007; x=1794735807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+JNwiCu6bm0rcLmuJWSYeAtStEl9n5lsa7a5i38a1Q=;
        b=waq5Jg1JaS41DmS5x9j24tn4y6UrddE8wBQdKIUpsgUBmu8gnbHKLIY4QLb0KcKjMw
         1Dm8+xteo4Kl0L+sJ+l/GIKcpGAC1DXHMzPZwEdOsOR0su+Mn5LOL6D1aEXBshD//TY2
         Y4QsTZSakwnVUOKF0/AwVj8kAZtdSfZ3oHLfDWg5eWdO4gzqH2mUHt+LGK8PSm1T+7r3
         79geyjJJZQuhJkyxUVZ4zOgQMezN3fe5nVYLk0AOcvCfR45wVwnPHKLSKdurO1+6Wkjy
         uPI1dywmmZTwJoYAmr7yIIhnPhAtt4wKs/lO8Q9Nk8gshaov3CBp9IBTd3OoB2cncv6c
         c/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131007; x=1794735807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+JNwiCu6bm0rcLmuJWSYeAtStEl9n5lsa7a5i38a1Q=;
        b=xmIS+ihwKgI046DNxIQ0x3e5Yi0lo7qiXXZEH7LyKs6gB8QYTEL4b89EJPvEh87WUG
         2Iu7hY4JxRVr1+lx3Lm1AsNFcyjjz1vQTo/QtLwaop7zTg1eZgoH7qmXMJXOq6C67Z0k
         f9ttj5RALEu9M4nWpvbr4HBXk8dad2x5uKdFaYvDFQ7iJBeOCSoZ/0ZgPh73qeOdOxCT
         Hv9IUhgYKvHwplVzzOYBzcgs53I7n0eG4zNPxc5FgmLPIhb7ve6n3CU9j5YWtB5HoGVE
         /FXGgKnwVSbfWP4VYk6TyzneSE9bgGRHaBdoGW/IaRRHzOQSnMv/2Jv7rwptrDPjYmD/
         pOWw==
X-Forwarded-Encrypted: i=1; AL+hErH7nfi5Q/GF3uNN5kIeKEcjoHAr3Rn5W5Ts9+E75YrlCerAzZ+LMnkE1Y5N5NEMFYpJUEEyLBMsjWrn@vger.kernel.org
X-Gm-Message-State: APuU4Z8iTtunN3e9EBQMVHjqeSVtb6h5kLjYny+yajLbxYczy8z8D/w8
	98EVJhHVYyGpK9vU1oIpgUBDoV01u0+tn2IegZjWXghiGFP43eUbQfJK
X-Gm-Gg: AYBFou2JOBVX9mWa7uqSMFOQ+BDJ+B6hhC3QFRsCsvmfgVO9NkKGJ96hawgxY3pRzej
	VdguEzmNi/Dk8Ag/zxDYsvl0/vBnC7PVXy7nrY0ZRVtvIDBWzM986/fab07CKyKEDgBxZP75Upj
	TuKiCpdg82ooX6ikm1HkEk6GnAe3ArS2sJDm+YpNiHXqJzyVuBHq0GB2AoQ2U2j01xQzuMf1Evy
	+PvDOHIviZ5qtZ5MIeQDC1qNKbfkTx/07xcR478wfS0+iY8+KczPL2ceZDxCKjHkd9ez10igWBe
	khx5oMVh+ElE3JR/JZkuvn0j5gJeRYbY+It0yohKHqA/1HFnqYo/Z1X07huWREMpqf1/qcH2d2H
	u1apunUt5gThpe14/klixRae4Ueqt9ZwJOk4FSzHO4uFV82ffiHaieJ1ZriIWu+rwUSaMTPeNzJ
	av6AT4orKdzMqHY6FdVAGawQBLjdcSBo4/OGg59W/WtlDUBsjb00UNuGmX3FcuSkYSvWyf5Ass4
	xP16X6vJIFHRFrPMg7O8aO8R4jkQ17SAqk3Wi2SMBIi57iucgJ/v+4baiOsyoHj834YHsN+FyYk
	3Hte0C/irnKjns0E8qZQ9AYH3Ws3gQtAJOPZrE6N7df5u3AxILGI9etJa8GeXFCOomg33LQkGWX
	nQjfx4a/v7A==
X-Received: by 2002:a05:6402:518a:b0:6b6:eefc:ae7a with SMTP id 4fb4d7f45d1cf-6b7223c0e17mr600130a12.4.1794131007486;
        Sun, 08 Nov 2026 01:43:27 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea56f2sm436321a12.8.2026.11.08.01.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:43:25 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: iio: light: ltr501: Document LTR659 proximity sensor
Date: Sun,  8 Nov 2026 11:42:52 +0200
Message-ID: <20261108094253.83899-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108094253.83899-1-clamor95@gmail.com>
References: <20261108094253.83899-1-clamor95@gmail.com>
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

The LTR-659PS-01 is a proximity sensor similar to the LTR-559ALS-01, but
without ambient light sensing support.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
index 20abd7da080d6..85ac3b540c206 100644
--- a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
+++ b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
@@ -17,6 +17,7 @@ properties:
       - liteon,ltr329
       - liteon,ltr501
       - liteon,ltr559
+      - liteon,ltr659
 
   reg:
     maxItems: 1
-- 
2.53.0

