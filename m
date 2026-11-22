Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353547;
	b=lrKITenobE7ABHLU0IeLKrmTEsD2hejViIkRXwB58dau6v3HnrRTfBhIRuPjkaKjlO/G
	 HQonpAcNr1GiQEV9XxdIQEx2R67Uff8TA5PHzbVT81HqiqJuWv9+sPRvgyi8c3OoVIqm+
	 cepIrRdtfD6Dv4lgrODVnhxmigYUDO754nh7Fm40MX2vB7DanVUt4kZeUUNWP7wrPzB3+
	 FtCmOK/N4Q2KWtwUnoRrqRwCwIV5Z+XRB7sXjUWbgUTcueXv8sU8Xu7DkgTT8Sa8GHf18
	 TOftTu8w4hIvMT/BPjmAlaCotVOlAyCcmOqvGW9o/LKWYXUNrW6sWRupyEw/uD1cGYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
	b=YsxRl3iZ4bDfq5GzaXIqstGfNwsrMz8/bOhQJP+keH8yP5LvfttIIW7+uNJPB0Msoa4f
	 EqxpejEonPaY2+mV3R825fB3BaBDAeviFpFYCvdL3giYSX9I71mF7MCRCAoNJqkidRjIB
	 X70GFGBfr7zFOzHNMGfy4ypyAqrTTv9GR9779pz3G3wO6b0/g1Ej84OdJmOjVI/oMfIVo
	 y6EMmI92bakn4479YHsYJqKZS1zIZ35R+07z4QApwujSnAEkGngLV9PYDXY23eNmQt713
	 Mchv2fuqJISCsrhjfbOZqVyQD4GexeVN1Ws8zrnAErtkHZWX+BoAaoUaGm7r6Vw0p1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zNnfJDZX;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EA5606A338
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 13:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66EA5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zNnfJDZX
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ae25d9e2fdso23731671fa.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 05:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795353545; x=1795958345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=zNnfJDZXicFiVo9E1HRD6Wgn97zHNLVg7Nrj2zO2yQK/+VeOM6+DTQoDas/laCrJAW
         khmwgB5guiv3XpWuY+JI2VHXZ2p46zCjMzWGu39MngWb2BqmLBcb/Nw0Tu9hTp0iG2CV
         MTH9BLuAMRV4+NwHNYp1j8bxaFtKoTbme/8i6vg8KOi46LFO++5AEdG3+ckRipbiHRDS
         Th8COKQwDZaerOq96OwJwdUR5kyN2+9sR3G3K2onV2dNJrmSCG4htbBssMuwhP5Lzk6u
         iJHzpYcf6xxzRD1ubSpYD4iS7R0+Zu7ACkYALBN9zDMR4lLFWlMqLcgx29nUwHCIHCAJ
         jW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795353545; x=1795958345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=LfeF1yczbo35yYx6qsjNYd28iBu7OJS6YJot9aZVudekjr/wYO7Lhxm276+pkekM8G
         WhAH96wFUOUoI1Y32+u5f9FK3SkWfc/UTsRZa1AEfyg5SVtFV8pdEBnT4/x8QH0iTF4b
         RF98b1M315shBjnUsSgUVd0q1uK5Hqglh88BVw8IIFK6CK63Czua/AZePO5xpjnOgRCq
         kq65qfWj3eOoFtwbtIPI28NUf0WHh1IStJPqm14sCNQSjls3AVAk9F+m9b6SS1E2vpZF
         sIZB6RYgfNxufc/BsvY3MxM6Tyxqzfow2HrKBmabdOGQ26RGZPh5iKLtlYuYNfHertKQ
         1MuQ==
X-Forwarded-Encrypted: i=1; AL+hErGQqA92mec+RHwO/YFHAKyMb9mBD7KWXitkpkpx+0/WNiyE746+okqPeiLwv9ORmZxbXxIOeUOJmPlU@vger.kernel.org
X-Gm-Message-State: APuU4Z9vWAg6HOynn2Ab0XhttZss7MnhI0mjVa1lAxwmkUw5pbi6sv+a
	5CT7pSNjQuZLKRf7TmPToXFiL3G4x+vss0VY010zkl4SMZNpcMYntCLN
X-Gm-Gg: AZFdTZdY1FNy3CDJGywgsrISi0Ourssd54l5Ndq9UqAEjttMQWOiclHL9hhU6oKslRJ
	g5MD+BdFABOYeQIKl1U5ADFLhKfqIRJQPuNiiQZYEoQrB+g5kV19B2uoy6ud5OoZcv6gYXroYas
	EMJAFQUOWUVWA9KIQqAADoRTjqXNJdkNc1pG39PGM2jIEOsbcbF6uT8rqO6M4I8BvWlTj4HFn4l
	yQ5KwEnCXZauqn89w3EFImvqrPiM6pyb6FHI57Xe2iAWbA3utDPeerLZT7x1wlxv9NKd1reyHsp
	1BYsv7o1jYw5k+5YBYVCc3B6ZDyis6AwsXNKlfHChpo/mpyia+NeRfX/NK86iK8KG1s95br4jt2
	vegDVG1Tm0VIMDOCBSpGlYrZD/ePTpa/Zfte4qajVRLoybereSCMmWuPh7UAgURgGIU/FHLYQ7l
	NKkVXY7nSuOntKKubPcVZ1CXcLATk4Q1SXnhj3gNuNV1Z+sKkoGbw2HTV+pEFikGWFCtSktHif/
	qMJa9UcsgA94d3czfaFbDDlx826/oF1RIC1QTtVv/c+ipCmMl6puCe+N/uBv/U9zUUGeQJFh3ID
	ZFfSVvYrWvdxCOf8bko9cBt2FV0aFw==
X-Received: by 2002:a2e:a10d:0:b0:3ab:f43:a3ca with SMTP id 38308e7fff4ca-3ae7fa19f85mr20640791fa.16.1795353545402;
        Sun, 22 Nov 2026 05:19:05 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ef17dsm26038141fa.12.2026.11.22.05.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:19:04 -0800 (PST)
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
Subject: [PATCH net-next v4 1/3] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Sun, 22 Nov 2026 16:18:54 +0300
Message-ID: <20261122131900.2951586-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
References: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
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

