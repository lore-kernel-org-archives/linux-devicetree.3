Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631871;
	b=NpcrKMYhPgDM/blwa6wi8MSNijYn/pAEQ2DxCKgQpWzDzqjTH55Euf7Yq3xa+JeoNkjH
	 vHzFZtLsq9Xp/6O5qMHNuKaW8HibKXdNVHN2eAcUzdInYMTOw/1kMVRR0zP2aSUvOz2Ko
	 gIo7zn0uUezIMl1nO7aNMqXnI1JTwWLo1jtNUPKGYHbSDbeCN9clQhmN92GkOAxn43+vO
	 c6rwMQwMEIj9smnKTuy9BaHvY8+L9EUxTVgv4YX15fbKVKMwkrOdXjRIVu+mUmHVm4sXY
	 82qj5fH8TqCotrEi0cHFry4A5If08gTKvKBrpAsWTCU5HUuBfbfCbT3ajUxpQBBQL9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
	b=PDf4A/e/0R9dR912V3lNwIzjNDp/TVCiTZLWkEjZi1pSPZAIgbBBeT+LIbfKwSQf7Kpy
	 LcoiL6rKmlMO+9c/efe6FAZSc13LxWIL0d4n8QYw8bsEGrykNJYjLhUvrZrCXAAIYoXbT
	 7KObrJIjYqEycYsGW4pbJ9LTE0P7QstUMaRN7/nXBQhq6ztMqX5r91VqW5B26fheS+zEW
	 ab6k8yaiEQmESJsp5ftSxDC6ue3+MpneKkO3tVcL6FGZkvqSzAN7weT70r6MbDEUqhTpb
	 98stQ7ymWjpp2/w4XWSI3gq2iOcDPicSCdmNI6dVKiOP07nworhdPVDYXg+VJobbYvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IB9x4XiB;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DB1606A33F
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08DB1606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IB9x4XiB
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c1465bbbdaso5258933e87.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631869; x=1796236669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=IB9x4XiBn42WWx+a0IBFuOzPdoDFdOA9Q77g7vg5kei7js7nO/TgRpsHZWTHGqJDGh
         lqDcuMbNXTNwIpYOPoQT4UpO4L7/bfYHXWwh6CJadd1zKFSOPi2A1B7Jgf63XAun17UU
         d8yPhsGID7+V4GH7ujTExMUsBR/5DbEMAJUSG3ojSiPT4Lwv6tWBubT4BqG/nPqJrbiM
         uhLLg15uderoCOhiArWZKExx/On0zEzZiW/G+hEvORcpjMDWfI1GeKzcutweF9kwZjHy
         uyO1j8XKq/GE2cRDEEJe7kbr6YBH+3hotZH/RzHZ9BG212rd4H+/lZgfAJL9s/tMxC4G
         enzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631869; x=1796236669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=CLTzCJj/qIc1JjhrRSMr5FEj6KY3TFpIqYIuSo3FLLwMRkb+sBrsEnY12hf7TsEyAo
         Muy2pyGuyohTPN162EvGAYAsZiutSphD9SMKpeHi6slGg8cZ5gEZxH8MBpSLCj7aCQAX
         98/qpRuxcUz9tR5BY7wt3AHtKx18W8qSNYJBhEwfGvmaeS3cFCil5tYH0A+WTPq8CVOK
         J6XTiI+6LU+3IYBA3a6Rau/i2G32CGuWFpFWYY3sip7MHc/KqgYQDF5TygPZQwXnB9/C
         e/dAhP4KwGfltpY4/obl5QrjjNPXwVTGTy27V1qjyyC5xLiJ577mUakZWNB7CM18B4sV
         bA5A==
X-Forwarded-Encrypted: i=1; AL+hErFUfGAN/PV0FO7KvFsXLxMKBAZNZeAH8dclkQugtGZtUd8vlfAeeHllEJRmquFsePWDwZouL15IU8xZ@vger.kernel.org
X-Gm-Message-State: APuU4Z9Cnn7KbsCw4J0TGtpRxJem9uUDBBV8Yz39RaU6LJ9oQMfNexbI
	yCJXyaKCxNSKcl3XGPzc3Ok5t90SXS3DM7sXuRvW1twBMKV8roIJEY2i
X-Gm-Gg: AZFdTZdgGE1Evg/jHqebP3QtxAbrl4pyfnrWFJeQ+IS0lBcUrRu6+zQVx8CaP0apFOE
	hnaWdRqoc0gjSGtjyExfIHDKrrHS4FLU4kMJbmJYAYjL8OQ2GbzVMLN5H3VODN9XKEMdf+4wJPm
	u08Vj27DeBGh6Ky4dAR57gccr0D/GVeuHkfzP5+NI3jcrcfSoV4cnRsd/K1z9JMli65eoHXXoEI
	YjtF8ZGUir55jaM3UXFsvai09++fgz4Ltx/FPSFx1nrqGwpPasykAV32NrqyqOKsnzSy6CKuRVf
	4XxBSutc6Ap+coELigQMMzvwmwEWSvTEv+Xmai1dZx775RRuJoydGDV41tcIX9bg+NrcENZuFiG
	nqTZ4nkSjDO4dDPWXZfhIHAjGAvW7PPTFv4wqB0SIjr4n/xgPcnNZtjiyQLrpNzkKmIR+Iw87R9
	PEKP2CtQgwNbCV4WtNZoQTRHmj+i3zVtZ6Po9YC17N0TIgSDWILouHwkXtpQtcg3sYOqCXSIOUb
	fcqUsljasMyWp0TmEhsNO6p5x9/engvq97PZUBHMtKaLfEWdLdDA2mftBmFGLpNyuAwAngpVKpb
	GI382WMvZUaTPLYETvt7wC3ON/KZ5GwQDHkwRqFjVv+XSGKYZbxxoTKqhjUDBtQDQavzhw==
X-Received: by 2002:a05:6512:104d:b0:5c1:5a83:2fd7 with SMTP id 2adb3069b0e04-5c1bc907072mr5651830e87.66.1795631868971;
        Wed, 25 Nov 2026 10:37:48 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd05051bsm4650755e87.62.2026.11.25.10.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:37:48 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v6 1/3] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Wed, 25 Nov 2026 21:37:36 +0300
Message-ID: <20261125183742.3039752-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
References: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
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

The kernel-doc comments for dap8211r_read_ext() and dap8211r_modify_ext()
incorrectly state that the caller must hold the MDIO bus lock.

Remove the misleading sentence from both comments since the functions
lock MDIO internally by themselves.

Fixes: d90265e75584d ("net: phy: add DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY driver")
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/dap8211r.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 0bf770f8ebbb..1fe20efd394d 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -69,7 +69,6 @@ static const int dap8211r_internal_delay[] = {0, 150, 300, 450, 600, 750, 900,
  * @reg: Extended register address
  *
  * Reads a PHY extended register using the indirect access method.
- * The caller must hold the MDIO bus lock.
  *
  * Return: Register value on success, or negative error code
  */
@@ -97,7 +96,6 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
  *
  * Modifies a PHY extended register using the indirect access method.
  * New value = (old value & ~mask) | set.
- * The caller must hold the MDIO bus lock.
  *
  * Return: 0 on success, or negative error code
  */
-- 
2.43.0

