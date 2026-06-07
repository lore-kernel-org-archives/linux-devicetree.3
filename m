Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6550C2F8EBB
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 16:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780851371; cv=none; b=E5s+vP3Gn5IW+bsEgJnUhonIMvznVbXVsTGYV7XNf4HJW+AyVkLo+RJiVv+7BRuBfhGBDWvTYeyOMFaKzvZ74GTwl1SrP4x0W4CFm1UTRBXE9JQACTs1z93qeipmWvpRsH2wRR2FwNmuKN4WWMx8C6bUKbZnXHH6fFlmwcFVtek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780851371; c=relaxed/simple;
	bh=RKgDcDPNfLY94yo6BB9eMCgx4LrUtIzIBcqu+7gcGaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CHUlNwI1/eUyfqfJiXMoOyVThvbTuRN5/K7NtQW4o14sxNmIrKFKdhkvNYIyhiIoDC/6cihhI5TsgU2CQ+xtyOoB03W1OtJtigTrmlJM80VnfwN25fa90i6QrMKGr5HmIDL2B3ai/GwipmdnAdGP/JQvAQfvJpy6gVhrWyM+79E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=usK1+uiL; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="usK1+uiL"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so2684598f8f.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 09:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1780851369; x=1781456169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jb6+zlsavv1nSrFH8SGOlJzElOa9/FGNdN9bgvlBisE=;
        b=usK1+uiLqh+3OoBXej03mryHh4bxi/A243MUnxN3g9yXxPYCG0axgIMXnJZoL9msaS
         htbhHuudE+AbiC1UlErX9d9Vn4xzC5qQMDwvpsXsG1nwXl6CRU4NnF1klMJ3P7h/Qxrq
         dJwxgSlqxbyRlGejO6O+HjHvujn261mSacy8kb+OtF7SNhwkQ72vaOdcBEewG9MonMPR
         we2Aki1GxYr0BJvVGBCP6Q7FIEbu69AN4Ux/SoBz/RxIyIuK5NPSONqjM80yrfG21Zom
         AA2yuTnuLGmJciWpsTTQ22XzEN0pCqPpUm2+JxUyfG3lo3veH7remfBtxvzG5c32NxGg
         ZKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780851369; x=1781456169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jb6+zlsavv1nSrFH8SGOlJzElOa9/FGNdN9bgvlBisE=;
        b=ZmdinQrjSTjso1LBDuY4NiRJY6zzCyl7hWym9o0ymwsduy2FQkmwMFKiSH17I2aL1Y
         TQ8K0jYeUBqJZ55gYS7UlHTnIIBDgGBmj2Q+Vpo2qRPSgBaT3xmJtdHa26sIF1xIL/+V
         DXVfmSCyjjl6NgyfE0UOVoQNHGJAs6NeA35U/pw9/BfQjuoVZFQPwODpbt50zHtZQEKm
         PLXDXyZ63PWJr+WRVPMH1kOrzkQA2rgWlgNhJ1A0CncCiu6pENxk+DxS3Wtz+gJZfJSZ
         qbo3GN/bH5Q5sWN6zPmBYLxPXrmOtFbdtk0z0XdBPTBY60OYvU7jfBtl0fPaX0kAB/xk
         FCyA==
X-Forwarded-Encrypted: i=1; AFNElJ/WS8seiaCBfAtlQmL88eiUuznwEybNF6VnaEk2yDc9DlpZOVBZmzeTf90aHPYG/yXRY+OZ+8vfxwPW@vger.kernel.org
X-Gm-Message-State: AOJu0YwAjZXHLzbfo6vFMvVSlBTc/c3DfNMvoaJddZvYFw3OKzKX/tf7
	0HQN4phCBr99nBVI8ZDhZchMbZjGuONVLMXOidEZX6Mdcua6nFB7k8b//ryfZc5ImmE=
X-Gm-Gg: Acq92OHZypeqMkLiR2jZfV6btCdRmIkBHiggLTZIj8072d3ISq+Iea7CvM9y8zxiytG
	zQXPWLNRoQ5L29XhFuT4NvJ92zAJ+fUUjU2MMxO0QVMUPmgvti8z8toD3eJXBn9zYn5xhZP+XMW
	z8JQR7HCvqDkS57QCo2cjRa3BP5GSLDKpPYY7LPZq9i05tSuGSZ+NeIhi7zI/jqRYspTRzpHfn3
	fxoqAW6GGs2z7IZftd7FmGziJQMUHG9mLS5DE2nqPhf8jDFCz/6u/wLnG9fVtIKu5CIxaPe2IZC
	x39JVJQCEB+lwO4FZgiNr1uVaJjLb4kvl8cP87mhjnZ8rSYYpmKr+TYnExXed3VEBG+JgAyQrJM
	qlIUfx05JftxJrQd7wDYAIlv4KZ1mBSfojD2YBP2iL8alzbJBfBQ5RSQVPMZXclIubztpeXnWA3
	E2aQiF3KXurlDHSga1MOXuT0EKtU/11+KolaZN9ntxJsuESPZHXUxxOMUVEVsqqeEvY9aiD6VwA
	bD6vWV08Nqh0PRAwiZyLCr3pLvPXO3kk0UkQu20Mh66H2oLaKGys3MeBYbjJHZue5MzoqdzQUS1
	XjsGPg==
X-Received: by 2002:a05:600c:4f90:b0:490:3890:605b with SMTP id 5b1f17b1804b1-490c260f448mr210709255e9.31.1780851368991;
        Sun, 07 Jun 2026 09:56:08 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-253.globalnet.hr. [213.149.37.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c1149sm283230325e9.4.2026.06.07.09.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 09:56:08 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: o.rempel@pengutronix.de,
	kory.maincent@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next v3 2/2] net: pse-pd: pd692x0: support disabling disable ports GPIO
Date: Sun,  7 Jun 2026 18:55:36 +0200
Message-ID: <20260607165600.1260210-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607165600.1260210-1-robert.marko@sartura.hr>
References: <20260607165600.1260210-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Microchip PSE controllers have a dedicated disable ports input that like it
name says disables PoE on all ports.

So lets support parsing that GPIO and using the GPIO flags to set it low
by default and enable PoE on all ports during probe.

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
* Update commit message to reflect the logic level change, and make Sashiko
happy
* Pick up Acked-by from Oleksij

Changes in v2:
* Use GPIOD_OUT_LOW by default so that DTS reflects the real active state

 drivers/net/pse-pd/pd692x0.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/pse-pd/pd692x0.c b/drivers/net/pse-pd/pd692x0.c
index 49b1527829ad..cb377d5ba7af 100644
--- a/drivers/net/pse-pd/pd692x0.c
+++ b/drivers/net/pse-pd/pd692x0.c
@@ -7,6 +7,7 @@
 
 #include <linux/delay.h>
 #include <linux/firmware.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -1757,6 +1758,7 @@ static int pd692x0_i2c_probe(struct i2c_client *client)
 	static const char * const regulators[] = { "vdd", "vdda" };
 	struct pd692x0_msg msg, buf = {0}, zero = {0};
 	struct device *dev = &client->dev;
+	struct gpio_desc *disable_ports;
 	struct pd692x0_msg_ver ver;
 	struct pd692x0_priv *priv;
 	struct fw_upload *fwl;
@@ -1780,6 +1782,11 @@ static int pd692x0_i2c_probe(struct i2c_client *client)
 	priv->client = client;
 	i2c_set_clientdata(client, priv);
 
+	disable_ports = devm_gpiod_get_optional(dev, "disable-ports", GPIOD_OUT_LOW);
+	if (IS_ERR(disable_ports))
+		return dev_err_probe(&client->dev, PTR_ERR(disable_ports),
+				     "Failed to get disable ports GPIO\n");
+
 	ret = i2c_master_recv(client, (u8 *)&buf, sizeof(buf));
 	if (ret != sizeof(buf)) {
 		dev_err(dev, "Failed to get device status\n");
-- 
2.54.0

