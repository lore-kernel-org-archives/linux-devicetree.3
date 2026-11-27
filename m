Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780911;
	b=y5yxW9TOUlMgHjtrByLGGh2aKfJVcTS+Qo68qHoL4SyZ1fAUujqKi/cWE8tHUfCFDe3q
	 4J80S7zKryNu14meAHR131Huzv3hfhjIXaUNY53I0PJE6ODsAoZEMwPf6QinAAqSK3eDR
	 A/c7f6ocpaRZri7GaiXLmAY7YT3c4cYTJWtH9CTm0yt5iWJ3lzxZivKFMWbtVewo93sgv
	 I/jupR/ciPisAvSuXHGrQnbnyRjWc8elWXGCSYtEpqtOcKoIRJ+Ceag0527iRVJGt5k4g
	 exXd5ZUhg6ro+XxwuA9g8kQ1nXjHQBlHQ4nUAydmWL2JIKCS6UZ4Gqp1MB0zGPtkaNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MZ3xsoglCFbUSUZhb0QwwHkubepyifev4aez9qIahDI=;
	b=PPeuiNg3yFy2R2cr8GolnHZiEpe6bq/gjEc5FgKAoEAm0RCefEGSimU9VHyHj1tVA4kw
	 0Wmkht/j4zXWikzyj71UbqrdFljo962eHP4vfxMS0vS5iezH9BcZzliwmDfVav5tNYNBl
	 ntcUAgdViDgifYVLVB0R+G1EtfMK3FfnLEGzcHbfp6qZlxjrDq9nCPj4TmgZIGzNn+BB1
	 va+5+9PaPn3C8+tEMvysQLWkFFcizTqbTESIwhMKllYO9wy7faONu8ZDQwrb9QS7sDvy9
	 ybsQFUNzA0FnZF8B5TVfnO9D+Hu5+iEDPJqcWte7nMus9xIxCvtMOqrGu7DUTDWVa/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jOOiZExH;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7A1606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B7A1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jOOiZExH
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so5022560f8f.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780909; x=1796385709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZ3xsoglCFbUSUZhb0QwwHkubepyifev4aez9qIahDI=;
        b=jOOiZExHbjznA/ln2UnOPrG76s5InV93s3oDYf745lKBTCT4nvUENnUqLIWgIxddca
         A+xR/kiaWkkgcz9R9wjf2c2jK5P4CQRYe5RFSn5mD4TlSEO3XH1Yo3g3+b7G4n5AOMlx
         +DckmDpgH3YbPGxSdQNUvrzrR3OkrhamVDh5j+K/GyTOQMJAJ9EL94pGjoId8fHoKyzI
         1j5ofmLU37Ha0mfDuVtnoCP5a8/PHwsGOSxea/BS7wPxAdVeNzTVDe3k59NrPaN3kZzR
         aZd1SEpYOr5AXU+HqeoL3TU8R/ICnDm73dPmQDxaPm9ohxrCZ7H9LKa7r7pzTYJqyYpC
         /pAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780909; x=1796385709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZ3xsoglCFbUSUZhb0QwwHkubepyifev4aez9qIahDI=;
        b=A5hIIHnvNby4LQdXr13Lpt8tdXfxqer5u/Oi4lv3Z6QfgQMNFD2NPDd//ZPq96nwWW
         E1qBTwR6ii2PNKNRCvkT/0EdTcZQsGaG3dt7ojl9n9C4pNjPZQKidNPcmeonsqyloyWZ
         nJffcV1ZJXzdGmW7FkuQg431XIvNsorXNxa6knfnht3ZthKLxPkVFtkV8E+ijlHjXr2p
         zgq3PaCGWd2FvgHSsqZJptQIkyqTRdoUH6tSp9yhV/GIEZ1+x70Fbw3QbQRqgMWCOF/O
         IaIyA78yN1BiYzT5VebtVlIGvlu+zSsRGjFrmaN1E5j3CYhj5yau0bBRDkMZnTo/3JLi
         +q1g==
X-Forwarded-Encrypted: i=1; AL+hErEqWHvx2KiGb+9f+09vpNjx6weD52ofxn4wtJEqUdnu/k5cYHnTq0y9e4uwsE1TWkAs5d/C9RcuLrvH@vger.kernel.org
X-Gm-Message-State: APuU4Z+taqsHl2kF6OI8nlJaute7mkUHGsl4rZr1Dla8R6Vd2e+MBTaU
	imdzwWcV6GnZg2nAbGi8LlXeMr73G1Cs+chYtunaYPkxX9PLTCHjACWW
X-Gm-Gg: AZFdTZfVCAVfWp1d6ivFRHozbdIaoRywcSRbhNArA+QkycqF/GvuREgHgjZifhOyuV+
	YMXJVQW+QyUb+ZsFnIfAHClBrfDO9e5nFFqtXlWolua89akemLXN2+rs4cGdeCTYcoLmJhj6SCK
	ky3T2jKoKTMS6VhBvi5HRBDRUp5gG+ahsqFRgfj7aJWx8GKljb+dcJhFzsj/amTcslpCiifnlkN
	ltslB8NLxDkSVGgEnUp4jpu1CNJSDNbt3VtYm33igr3n5NU4UBeiY+vs45H+mZhjuxDPGQZVEyk
	tdKE8ZFXjHVMk7A8v6APQvd1XfG/Nk8Mn9UAAOkgIn5b86OjxVmbiDy++nw47P6JeKdSuaZuyWv
	dXNTlNBmcRVHQYvAXzaw4b/0E87N3HwCqpmEoAuen15D4igopRumtp7QTvW6fUgmXZZKzR7H9qH
	Q5yYOwMoRTnqdCWVOxvc9K3YaA+8dRpwH8uJRW86sJ1E/8bj3kfa0g0d0OZkxuctl5fCT/6b18n
	WHXvjD3LbbHhCDElNdbOpcrayMQyDV5/LYUHDTaqmHWPR09NItalahEQcwyn7ucLDXOL8Jj8eb6
	6nDphOhUjL8Z5iM/YIGGJhOMri+kNJPGp8DnczhaTwXenl8=
X-Received: by 2002:a05:600d:18:b0:4bb:9001:1aa with SMTP id 5b1f17b1804b1-4bb900102b8mr353975225e9.10.1795780901984;
        Fri, 27 Nov 2026 04:01:41 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:41 -0800 (PST)
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
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v14 16/30] crypto: amlogic - Add support for AXG-series
Date: Fri, 27 Nov 2026 13:00:49 +0100
Message-ID: <20261127120103.1532882-17-jnieto.alaber@gmail.com>
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

From: Alexey Romanov <romanov.alexey2000@gmail.com>

Tested via tcrypt module and with custom tests.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 0fb0da20e06b..08d89db14788 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -290,6 +290,14 @@ static const struct meson_pdata meson_g12a_pdata = {
 	.support_192bit_key = false,
 };
 
+static const struct meson_pdata meson_axg_pdata = {
+	.descs_reg = 0x0,
+	.status_reg = 0x8,
+	.setup_desc_cnt = 3,
+	.hasher_supported = true,
+	.support_192bit_key = true,
+};
+
 static const struct of_device_id meson_crypto_of_match_table[] = {
 	{
 		.compatible = "amlogic,gxl-crypto",
@@ -299,6 +307,10 @@ static const struct of_device_id meson_crypto_of_match_table[] = {
 		.compatible = "amlogic,g12a-crypto",
 		.data = &meson_g12a_pdata,
 	},
+	{
+		.compatible = "amlogic,axg-crypto",
+		.data = &meson_axg_pdata,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
-- 
2.47.3

