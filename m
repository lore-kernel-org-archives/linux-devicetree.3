Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463389;
	b=sWvC06ekjdf/Hm2Xd2rDd95ilrsFaZ9qmJfSZkQuYPYlycRNiLotNDGhwbl9smAz2n6e
	 JejGcQXwPSYYUnNlFXRewRYMqTRaVCe4McYOJZ2x24OJt7FVcrW0FmLpINShhg3EKIJqS
	 rzyTByS6EInFgJtb+bOPJ6uAOCQRbG42mcdB8Z/CzyqZYuBOcvdEbBOra4vKMreg0qS63
	 /vTaJFZ11DxDwJCJWWOdLgu0DX2nyeucueT0deeL4nYXC569LDkP7QEqluprhjxqZdqwK
	 c+5m9v7GnzI7hzS2jnj1nBEb56IVtsuCNI8aIjEXtFiwSYkfL4j3ueleXZd+z+KK0nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RqmWJ7RMrhg2L/ifDvxPzp+3Jv7BCZkcuD44+ncjgs0=;
	b=y8agx5ZTTprPzlAPxzKoeaYL44vAbpvw5EQLYwBR73nG8mFa0Wr7rz10n9VAkLto0VZs
	 8Uak2GHkU+KVZZSkT06tc/uqD2Go3smWQ4llZWJgoOSOjKzfQH+nku/eXY2sd2iA9yunq
	 cSZxwEIKALaYAC1s9RdhbSyaYXJGG5Z/PuMMshA4s0V3q7cWR294ajpOUQkYRk9TgcstX
	 836Gt3wgxoYqxmsrP8VvoMeedZDVyqX+4uI4mBt9hpuSpmzoK1Rb0RM9t+lQM/n4thRRa
	 aGMQ4hUdBYFaayd5SWa9UvS+rBTI0SFT6qxJbxDzs6LuibtRfn3gsgvNbwRJVbpvRKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Fs748zbE;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FBD606A685
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3FBD606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Fs748zbE
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso36743465e9.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795463387; x=1796068187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqmWJ7RMrhg2L/ifDvxPzp+3Jv7BCZkcuD44+ncjgs0=;
        b=Fs748zbET1THbOfoMjkEdSA5V7vC/RvF8EUIZhgsRjporPgwNnL/aD1TxSXU1pPmx/
         yH7vZ0bgisW6qAkhp4Qu13rjKYcbVRFLr+YTZJe7PQ1Ly2oJ27XiO0wAhs697KIfsox0
         SQzndo3SGVN4T3/oqz4S67pIusuUMQWtAXUmcZwNA8wI4fSQyI4QRM6OYwEy+zpe7ABp
         ZKhKVT3uWAac6O7dVE3iDndYOfdYO0wkIP0az311xwhokidN19OFvV8uogeiGyJLtqXo
         2CyZlzvxaoBYkmgZZ0Z4Wo5/RGuerL4PFAWpjor38w+zIM1v1wjKx/gJ970AcNHEIvsJ
         h/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463387; x=1796068187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RqmWJ7RMrhg2L/ifDvxPzp+3Jv7BCZkcuD44+ncjgs0=;
        b=mfKZYKHv3Mr+xb1yun3AUDh5J95GKdcUxGb3iL9jlUpGBBCVmMVrQd9+hDdXEW0vNR
         Go9AHFHYYzgW3lswnxztGWQ5xCWuJVpo7tt8mhz0eqlNTB3C9vwa7tctgARaSCj7Ug67
         XNNqqpCJ1e/BhgSAyV46S1rYrfc2F0Scs0aqks1WtHC/5JYuYUrT9201+wceFXYq2ntu
         6zHuePpVS7v4ZWNKxR/Rh1T9ehfMyGqD/mGm774O3LaRLeoyv4aUaljICHE9UcK6H+iu
         Xa/v3K3wH29tH17eJtyWWQoSA9YaaU6DAVU1rWL7cjusFbIq/o/u4bJ0C8huhttrKgt+
         7/GA==
X-Forwarded-Encrypted: i=1; AL+hErG1MzYcNe3HuLHhsnzk0QcbAL303TL3nmXuiNbF6HK3DHmRYpCerqH7TyuLhMUQJ/Zn7fdaw5Kenve5@vger.kernel.org
X-Gm-Message-State: APuU4Z95LZP1vYt6jRbmlxOG6asXhevwdfCee/THvhiqxf703RumwQG6
	EkqIzb1jbdwjeMflMhvQoKJKehHicF+tObSaI+xfxWF1gIaVS4xWoHmU7ME0c6bEcSs=
X-Gm-Gg: AZFdTZeITR0yHM8LhXwny+GrDiHQogBZUvHKd3NA42oPdcc+Auhkwv6SBBwfKx3VfYC
	vMyvz3Sost2PCtSVvt+7P5m66yNhyXgrdZ69tc4TuUtOy2yNaPM1USSAvcmqVuM7tKMKWY3UQIO
	98tqSXapyMG3Yy0b4UQrGZwUA20qRWLLDochVzoyPKEKXh0v/6EpvRRWmq5YF4OqYpfL0BNZ50V
	j1kZrZ0hRFYEuZCv4OT6nbMpuQcqiaLp9kO93nYUeRImOjoi93wagmdZ3aMnssLgEytkG1YvMYh
	8hrHNIQqpr0z9bv9arr04y22y03nnE9sD/lMf8ePBeKfsqBfeaibnaNbXUYiFEZAuMxR8xvK1WG
	za3RMwsBHW3PXDP04DUD9jntvrzHsOfO3K0o0ikXrIAgiCCPJjZr80mibRbhss8KuKq7yDgH571
	Sa7J/jDbMkWBqTcq7CtNiUXz+PPVY/G4++m45jumsry2suseCL77sKmdvkb8g50I16m3Z1hUdt2
	y13yXox/5rg02eSWknMitSSgrPwLMM1U5byReif9Bc50qB2mRUmMXIuhGPQwDq9mf2z3S2GLgar
	WQxPpnW+fAaswGn+p4qFi4qHxyvcqxWZIufq8TmRHUJ/A4XI9dbxYbCRD3hhN8GYD0A1TugiKos
	7y3aSMP+vlng=
X-Received: by 2002:a05:600c:8210:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb88786c81mr256282695e9.0.1795463387295;
        Mon, 23 Nov 2026 11:49:47 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm300924125e9.2.2026.11.23.11.49.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 11:49:47 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] iio: magnetometer: mmc5633: Reference the datasheet for the SET/RESET wait
Date: Mon, 23 Nov 2026 20:49:41 +0100
Message-ID: <20261123194943.57601-3-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261123194943.57601-1-gerard@teslabs.com>
References: <20261123194943.57601-1-gerard@teslabs.com>
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

Name the datasheet parameter the 1 ms wait after a SET or RESET comes
from, tSR in the Operating Timing Diagram table.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 drivers/iio/magnetometer/mmc5633.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/magnetometer/mmc5633.c b/drivers/iio/magnetometer/mmc5633.c
index b651f01e1b5d..5871007eeba6 100644
--- a/drivers/iio/magnetometer/mmc5633.c
+++ b/drivers/iio/magnetometer/mmc5633.c
@@ -63,6 +63,7 @@
 
 #define MMC5633_CTRL1_BW_MASK		GENMASK(1, 0)
 
+/* tSR: minimum time between SET or RESET and other operations */
 #define MMC5633_WAIT_SET_RESET_US	(1 * USEC_PER_MSEC)
 
 #define MMC5633_HDR_CTRL0_MEAS_M	0x01
-- 
2.45.2

