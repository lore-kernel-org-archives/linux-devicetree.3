Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780914;
	b=u4cbOVlW5ISe8oVTrloas4Q+Yyq4ampkyULzxowcpBey/hGsmWRqXTduDY5jNf7oQ7Oz
	 GuAEcsaoYfx5hVKaXXRrzo7W2bi46Xv6djPGqkJzDSgGGiO2v7MDp1WA1JcLaNmOg1hWq
	 2zByl0mwfmJMDXPctv4tQXpDryVkiDfsY4Sd5LlfV88pXuxCx/heFM6RHt9FGp8TfJJu4
	 T01AhlDD5U0gipTfnvgfzys4YfsG7UwfU75vurtnh3SWbIXJdLaOfFu1MK3ocNIFvwAWp
	 tvUJCOSXzS2O043XRXbhlgTQkfYRN6uLkiCh2CYwnRS/yH8QjtRx9rh7tTONu5qvSGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6o5PkBcDr5mo9vn6AHRcwo7DgEVc20BXfKxW4pDcM60=;
	b=3lyZ6cP9/AHOYvOKT3MQRGpbj7BN/w5/vmsVI7gu/YqG/zaCDwoJqgTKhAokmfCaJrRb
	 YJvDIvit2OMRlqXtjauE/nbtFIICYupJSa62ioqE/O2F3nv+BQtcFM/E7+7d51M/EwW/o
	 df67rhOs07heJEuYANJZrJ4MBgV7f4IZ9d8MSTYhrmsdlYKFLYLvRFe0i4tw2uGNSeVvK
	 Jb2oP/p4URzlXiuQIBZ8/mSk8BtTDjvBW6/QmVUk0CG8fLOh24L3UOYStnmQ+foVV27h2
	 8nY23hcB+NZkfHz9fhXqn2IlaUMR1lT7mWLARNJlir7MmuHruq75RxbH5EbU0W1Nkog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gpj0Umx2;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE06606A323
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE06606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gpj0Umx2
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so73192645e9.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780912; x=1796385712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6o5PkBcDr5mo9vn6AHRcwo7DgEVc20BXfKxW4pDcM60=;
        b=Gpj0Umx2YLwWJkWNmDrHGQXxLwihpUYAsiMnavVczRdVnVoXqYnAH0EBh8kWODq2Jx
         LfDg/lh8AkQNSIP35Sc02EXjPZhW8zAEh97dUpLh8nrSTblEiw22ixL+pteUPl2Obtui
         FIYUEEqJCqq4b5CJYUJ5mNKP2ewnvmXXbVpaUO9M64QT1nUy0Dtv6b2kBOu8pMFTpGrR
         2HXmgYMv9T/4OqtzRsqQ9Yc4zJ2AIZ/6hzpj2O8Xn4WIwNQJbKkvt8Jnnwqu0JE7uvag
         sQOuawLqCymS3YySXf4lrA8t1ALfBR6Fubgz0/JG8r8ZYfRNtA1y0TL+TemtrNCBthNv
         G64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780912; x=1796385712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6o5PkBcDr5mo9vn6AHRcwo7DgEVc20BXfKxW4pDcM60=;
        b=TBV+kWz2c98VG3Z9Y9JCXzJzmLM6c3IjvN4zuhItZBGowWQzPzr4L/oYeeMgpRDO6z
         k1aDt+jK3z6YXGnorIlnUGg8bn8hkT/OUxwlZ5ZkIgH65IkhWge81a+bKn6zceXrTmZV
         Krt/H9kCsyU1MfkJ7q3kml1PlEp8vCnmCVO5m9t5oa3HwUskGkru8vmrukgUyqTST15l
         u9MYf6v5hgcuMmHlBTK48KmusCgd2I1GyF+qBENkaWyCAajSq1HkR86phIKkF6VnMf9s
         8jwpMPtqQbvLiIPuydarHJ+nood+Qn22thkAa9IJtGJbnnyYaB6vKPCWU/bSO42+dtBY
         1DBA==
X-Forwarded-Encrypted: i=1; AL+hErG921o/OegOiDg1orWIcxUIdDqt4QWxMeBsttC3RwtpvNJonmwZOHu6KK5NZ1rejo4ZgHaFY1f1ysit@vger.kernel.org
X-Gm-Message-State: APuU4Z/EqJcdD1cRwOYk/XEyj5TtTBtiIgaKtFOjYDGDmZqdsYOUP6Pi
	S0YraoSpC9HP6akMAAu1fiiYI05Xur9SIbO8fFzex4n6JjAB20OHKMGe
X-Gm-Gg: AZFdTZfbSvYM99asDFFtZ82OC0SDT/XbRud3/n/k4WYpIZLFhyYjxBglhtBfyc71f8Z
	yDM8z/uQN3Yc/kYWfCA/4mEijDNorgp/Gb5XFx7lxeuI8YFYBElC3+2iUcClN5+3x4t5RB9hb3t
	bAejxVbejRlCX/qhqY0BBprOSBkj0fsExfzElvwou7TmScHi3Kd7oh/fZviL5CqF7OUz1FNcZUV
	c9/4gghjudIpItyUpOupVaplc8C46NxX5lFHOSS9hnzVfE4U/vOq9lYJj9WHLtTg4MjxfeSIeph
	dZImf1+Uo0+zd2Cq9OPycs8ta8anjAYe/7EJRvBPBYfIXRZq2uBroYYe0vy24072TD6K2dMwX1o
	AM97/Z+XSMUdG+TgeyfjqmavPqKnT0ekXzaTFUTeMY/+G6IdwxNuK/iRlr4o8a3KdkYqYo8P+03
	AJ80dhfGZyIfKnusenVZC5gy3hsyqD1L6Jo8TustTOkT5XrZwhiENaAMqI28JF2JXAa1s6r1ybz
	Vv5/97WcOoLQqQ496N9os5CnCCnkiQrr3ExjWZS5xXZLseRVUKLczCWqEOheawsV9UjcFlMgPyf
	YDcNs9nC5c1mvV3RC1XrOD35Tpafiof8Fc1nC4gS7i+nnsX8
X-Received: by 2002:a05:600c:a0b:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4bb8882432bmr483859845e9.25.1795780911905;
        Fri, 27 Nov 2026 04:01:51 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:51 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v14 18/30] crypto: amlogic: g12: drop CRYPTO_ALG_ALLOCATES_MEMORY
Date: Fri, 27 Nov 2026 13:00:51 +0100
Message-ID: <20261127120103.1532882-19-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
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

The driver queues requests to a crypto_engine kthread and does not
allocate memory per request, so CRYPTO_ALG_ALLOCATES_MEMORY is stale.

dm-crypt allocates its skcipher with a mask that excludes
implementations carrying CRYPTO_ALG_ALLOCATES_MEMORY, which prevented
the hardware cipher from being selected.  Dropping the flag lets
dm-crypt bind to the engine.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 6070ee6b488e..72892fdcd55d 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -498,7 +498,7 @@ static struct meson_alg_template algs[] = {
 			.cra_priority = 400,
 			.cra_blocksize = AES_BLOCK_SIZE,
 			.cra_flags = CRYPTO_ALG_TYPE_SKCIPHER |
-				CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY |
+				CRYPTO_ALG_ASYNC |
 				CRYPTO_ALG_NEED_FALLBACK,
 			.cra_module = THIS_MODULE,
 			.cra_alignmask = 0xf,
@@ -526,7 +526,7 @@ static struct meson_alg_template algs[] = {
 			.cra_priority = 400,
 			.cra_blocksize = AES_BLOCK_SIZE,
 			.cra_flags = CRYPTO_ALG_TYPE_SKCIPHER |
-				CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY |
+				CRYPTO_ALG_ASYNC |
 				CRYPTO_ALG_NEED_FALLBACK,
 			.cra_module = THIS_MODULE,
 			.cra_alignmask = 0xf,
-- 
2.47.3

