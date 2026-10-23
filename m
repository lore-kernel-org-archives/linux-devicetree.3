Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750334;
	b=BFkL3flrDXxehnsbNGRwdiMbX+phWcW8ew7oaW5jq1LaWMOOICI1rJ2nONNnngQ1tqLL
	 XG0olyw7BLQ9dgeg3tvAegzmWKDk5fmxv1ySgWOi/s3ymXNIXKHO6PkGNL/mHwcUJAhP1
	 bznDSHxojjarWV8vSc45WyOhho2i6ud7c2fiosZ0/6GjlOn1q0VjHji5cLWGXLE/iaExl
	 Yb4z0gZxGigNo9qX96T2zUVGhShlsSP7GZSzgYo3dN47X/O5xKtqCnUL9Jed9+eqPDNo9
	 xrBHTZnRe209/Ll05OxoM49Yt5vU511I0zLkWGdlVjmc+F6gV23dcoZK5RpmO+7hy6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HgzAQ6yNXJm+/JMG+P/joeDeoINHIroQeqY0i4kBEKE=;
	b=zshayVuKe0xO2uVRhcQGwsEVF4E7BrYcXM5kmimGp+2qPNOorNaVY7Tn8KK1hhDxnrmk
	 w6BTgz5xf4IpmgfAA4epAgETw5Fv5jdpYr6SvXBOvS+NUwtLfztr37QTPZKQtiWHXIg6u
	 VuCfdsfVhpzCtg2nWq53K34WQjZAT3CQc2Z6Qq2ffYybPcKSiGFswKqusihzHN8jTRKWy
	 WEy72mbLJpaSqcHE+5YnIrehtKF0vrckNCtDY9SvHrketS2NZAPeW0RtMUG1m96r1p42M
	 mGehCMQkFYrL0cGE7N3gmjivkN+Tj1bk3oPsJ+zxB2PsKH6dv0LUpCFrzUCxgou9cEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LWfiKVqh;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02164606A31F
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02164606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LWfiKVqh
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so8059365e9.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 03:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792750332; x=1793355132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HgzAQ6yNXJm+/JMG+P/joeDeoINHIroQeqY0i4kBEKE=;
        b=LWfiKVqhmmXyEgNLRl+/C9XxyyHrtX3XJxz7QlLPo6BSfYPzmOYZSFeTiheWHrUhzH
         QjhvtYZYrPEWbkjbY1IMhMh/EUH03ooaDaV3y/BfjwI/jvWysK5CqALqSz6cOwpxeEWr
         W3CeY8yYzmhoJrfW4Yut7z3W2vzB7lInKU24/eqK9AovJaotN+/FIGYMN/2pQwAdcX/r
         ZE4qfqyr2DFT3aHmso2MT8v5JN/U7HYinGLz6fDHI4sHG3tCYETxt64aiLX25AyMptsX
         fuWiMcLnxm05tm5nWV8MHm/v8B3IJPIkbF4QtiI/rlx335gwb18RaGxwGHTe5M31cKd5
         6Sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750332; x=1793355132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HgzAQ6yNXJm+/JMG+P/joeDeoINHIroQeqY0i4kBEKE=;
        b=p0q4s3TpYGee/0YB+kr9nhuQvNWO1GuA3hTXi12Hk9wvWblqV/ipm2lagW1sxfG+QE
         Cmh+wYJv4vVB3OgRy+Y2xPTa+LI+6dXgS7SLiKMcMIdIZwcT3uyz8FQOYyxpAOou0GHZ
         LIECUdUiiQLxBRVpQMuNHKpXzYpWZ9FRMMy5I2l294ztPGYGqw+exyHx+ufDng8hkf5u
         DwiTY9HQYnp00Sz3HGFxt4wpiMBcSlZtTVe6Omyl01x1pR9u8ykytw8Vnck5v0JG6+tw
         1qoItiDBw6QLJtvGyCWZX2lhburixunSrYxLgTCHNJ0SkbRq1/zWfUFVRyrQ0osoURW0
         shAw==
X-Forwarded-Encrypted: i=1; AKwUvBxp6HBwC40eskGb8yKzoOsKOGL5JV+OxQVZCA1Rp0vHiFBegnCJO7vIEGSrJHR+/iHSYeenqrCKI3Tv@vger.kernel.org
X-Gm-Message-State: AFq9FYKeuSCRsSlPJFoU5jb1sCKGNEqecAyGqnUFu1klQXmUbSHQrxBF
	4y7UUiNwRNXLURvFEcRUjYmomxN4wByokQx8Q536p+mNTbY9Asf2bRKyWQ/C6XV8hD0=
X-Gm-Gg: AYBFou3zqjqQOPda3fZJPwM/KpJDeQgq5Dfm2SKtY60fEIN4vo90nqNPEq4+y5c+KH9
	y0ENJCdswYlfjFVhPj2Rb0lkwQcpmBLHhZuxWUN7Q3vgs36yXjl94Kf7y1WrNxrP4yjdCNUE1mW
	Grb1bA87qdsOawqfF/2C0eDUjIuFYnQKq4mRbOVtrYNH/roPYJ5De7ZjmVz5s91QtAACADHwtH+
	mS35p/adfbH20EtUiMiiJEu64xC9Jl4tZqbFTeIc4HFm+rJUWfVVezAa7bdALcTj6VleuN8xp6R
	gzZK8FLLNcsDnuWazSixRoeE1Pk5KMb1Rzz9WuE2odHA9wj7doMY8WS2OpLRHZPHCe7nWdqaBMs
	d8jc2ws6je1qEKgQPx1JMNtdw7sJZ4qx+EWzVGn+fnCxSabxxQHQdFDVNu4qxXKlh44f/0EXK3S
	GgVUq977O1+5aiWLWvzmQOiQifFPQuUOHdR/nLO3uErpuq8WH5ijkdF7Gsie62qRg6K2sc6I+8w
	I82oQo0Vg6R6wEeXXKEq3WDiQtzXloyaLx3O3kgA8wbab7gy/MmjiI=
X-Received: by 2002:a05:600c:4e8a:b0:4a1:d675:b031 with SMTP id 5b1f17b1804b1-4a211eeea21mr27725575e9.6.1792750332157;
        Fri, 23 Oct 2026 03:12:12 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21047b2absm62807825e9.13.2026.10.23.03.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:12:11 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH RFC 1/4] pwm: rp1: Export helper to read fan tachometer RPM
Date: Fri, 23 Oct 2026 12:15:54 +0200
Message-ID: <a565aa38de650596daf04f3bc21a724e21c826f9.1792748690.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1792748690.git.andrea.porta@suse.com>
References: <cover.1792748690.git.andrea.porta@suse.com>
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

On the Raspberry Pi RP1 southbridge, the internal PWM controller hardware
block houses a register associated with fan tachometer monitoring. The
tachometer pulses are measured by firmware running on the RP1 Cortex-M
core, which periodically writes the calculated RPM values directly into
dedicated MMIO registers within the PWM block.

Because the Linux PWM framework currently does not provide an abstraction
or API to report hardware-calculated tachometer readings to consumer
drivers, a direct accessor is needed by the companion hwmon fan driver
to read these values.

Add and export rp1_pwm_read_tachometer() to allow consumer drivers to
retrieve the fan speed from the PWM MMIO registers. To prevent polluting
the global kernel symbol namespace and restrict access to intended
consumers, export the function under the 'RP1_PWM' symbol namespace.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/pwm/pwm-rp1.c                     | 27 +++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-pwm-rp1.h | 10 +++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 include/soc/bcm2835/raspberrypi-pwm-rp1.h

diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
index d4b13fba8d236..79d65f332dd30 100644
--- a/drivers/pwm/pwm-rp1.c
+++ b/drivers/pwm/pwm-rp1.c
@@ -49,6 +49,7 @@
 #include <linux/pwm.h>
 #include <linux/units.h>
 #include <linux/spinlock.h>
+#include <soc/bcm2835/raspberrypi-pwm-rp1.h>
 
 #define RP1_PWM_GLB_CTRL			0x000
 #define RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(chan)	BIT(chan)
@@ -286,6 +287,32 @@ static const struct pwm_ops rp1_pwm_ops = {
 	.write_waveform = rp1_pwm_write_waveform,
 };
 
+int rp1_pwm_read_tachometer(struct device *dev)
+{
+	struct pwm_chip *chip;
+	struct rp1_pwm *rp1;
+
+	if (!dev)
+		return -EINVAL;
+
+	if (!of_device_is_compatible(dev_of_node(dev), "raspberrypi,rp1-pwm"))
+		return -EINVAL;
+
+	chip = dev_get_drvdata(dev);
+	if (!chip)
+		return -ENODEV;
+
+	rp1 = pwmchip_get_drvdata(chip);
+	if (!rp1)
+		return -ENODEV;
+
+	if (!rp1->clk_enabled)
+		return -EBUSY;
+
+	return (int)readl(rp1->base + RP1_PWM_PHASE(2));
+}
+EXPORT_SYMBOL_NS_GPL(rp1_pwm_read_tachometer, "RP1_PWM");
+
 static int rp1_pwm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
diff --git a/include/soc/bcm2835/raspberrypi-pwm-rp1.h b/include/soc/bcm2835/raspberrypi-pwm-rp1.h
new file mode 100644
index 0000000000000..3be0892da667e
--- /dev/null
+++ b/include/soc/bcm2835/raspberrypi-pwm-rp1.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __SOC_RASPBERRY_PWM_RP1_H__
+#define __SOC_RASPBERRY_PWM_RP1_H__
+
+#include <linux/device.h>
+
+int rp1_pwm_read_tachometer(struct device *dev);
+
+#endif /* __SOC_RASPBERRY_PWM_RP1_H__ */
-- 
2.35.3

