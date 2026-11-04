Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806043;
	b=je5pX2ETjo/lwU1F+5dovvQvzihQkxSshhXxfAfk7+vQmEjyVxKM4h0OPtGBnle+zw+i
	 a3HDfe3JwXdv9Ysw2CDHcuKEYFlTk0pMzRIM/VY7hWpU3c/DVNQp7pXsTsEDT9OyA/muT
	 DvsC4pp/uPsY/7wwo0vqhd9/J7voU3uEgkHJLbsxl394fSXzd7WdK2kvmN7pOjFeM5iL8
	 SFIf1sFJ7v2tZ7d1EunhBmS4ZnnE7MPVDEQSXIDdig4xUVv9tXuoFVrv6K3O3T0bbIhfg
	 ifBp1IoXvSoJUMX8TVeuaGdU+1sjJwPzb3UBUGQK/Z1sK+4fdXVBcd22iTbdoawUfrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806043;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y8EIbelQmwDXNINKGdWYmBtsdh5/PXS0KvgWapyB5tc=;
	b=IsirHWDI0kOuVxJqFGJasn8FkOn/PED7azWROCfTcHpYHIE5wtyr5wirTz8k0/XpXSma
	 P4PhjKgOiC7PqLm9HfSQbRf/ZLx2JzKHbtA7hn/UU/tHdo7hkFaUfkknKP5R5VwBP+cb0
	 BeSsDSaBhDIlOxPE4wYMEuQKf/1Qb6+d/iNr3LO0lEPOwWMNKCdB3BkT1S3/KeRoX6QN2
	 STvwTMr7psLxVfcBsktX3uSJKZrZRLniOH6WCr/Eo1rT+u8EizO7bmNgF0mmxbDGSGzaJ
	 5GjeJGO1PGJG4JZs9LmFcSBVHY6VP9LuQLQGdKOKHHn5cFwIK2a9Bqdixy3DY/E6L+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=posteo.net;
	spf=pass smtp.mailfrom=posteo.net;
	dkim=pass header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b="EDt2T1A/";
	arc=none smtp.remote-ip=185.67.36.66
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0842606A33F
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 15:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0842606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=EDt2T1A/
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id AED47240104
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 16:27:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793806040;
	bh=Y8EIbelQmwDXNINKGdWYmBtsdh5/PXS0KvgWapyB5tc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=EDt2T1A/H/qJwI0uM0Q+PARbq4xwvf+KMlWwEPp1KbAWzflsfpklK0VyZQ9QDWsG/
	 Du+TAHpIWadKuRXNV0dwPkIUTBRjraUc5nakFGFu8tnGlFcc8FrwYFvf4IG24U/lK5
	 7BoQs6+WqdNocoZIaJMkpW9P5TrQBm9f2UCrQRrTHjAP9y8fKaUhIfP7J0HpZOemM7
	 vB24B750up6pkg1OtGDihWGd/dmwtTvYKwJn7cxnZhyFZqaLKCSuXcf43mlMYh8mtL
	 fJ/TZzEWIEgVqh31VSWjqBT23yd9CVaBPAWp23A8ZPnQKSc6F+X5SApDyBBdDxrAbm
	 k+J2XlW0tfedA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jKTny3vGQz9rxW;
	Wed,  4 Nov 2026 16:27:18 +0100 (CET)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org
Cc: Christophe Kerello <christophe.kerello@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	Yann Gautier <yann.gautier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH v2 2/5] mmc: mmci: stm32: release the delay block before enabling it
Date: Wed, 04 Nov 2026 15:27:20 +0000
Message-ID: <20261104152657.14909-3-mateusz.nowicki@posteo.net>
In-Reply-To: <20261104152657.14909-1-mateusz.nowicki@posteo.net>
References: <20261104152657.14909-1-mateusz.nowicki@posteo.net>
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

From: Christophe Kerello <christophe.kerello@foss.st.com>

The delay block must be locked on the last frequency set. To avoid it
staying locked on a frequency used before, disable it first and wait for
the lock to drop before enabling it again.

Fixes: b5c3eb385797 ("mmc: mmci: stm32: add delay block support for STM32MP25")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
[Mateusz: reworded the commit message, added Fixes and Cc stable]
Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---

Notes:
    On the STM32MP257F-DK eMMC in HS200 at 150 MHz, switching from DDR52 to
    HS200 made the tuning pick a wrong phase in 9 of 18 tries without this
    change, the phase was right in all 12 tries with it.

 drivers/mmc/host/mmci_stm32_sdmmc.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
index 9dc51859c2e5..bb058e0910ad 100644
--- a/drivers/mmc/host/mmci_stm32_sdmmc.c
+++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
@@ -537,10 +537,20 @@ static int sdmmc_dlyb_mp15_prepare(struct mmci_host *host)
 static int sdmmc_dlyb_mp25_enable(struct sdmmc_dlyb *dlyb)
 {
 	u32 cr, sr;
+	int ret;
 
 	cr = readl_relaxed(dlyb->base + SYSCFG_DLYBSD_CR);
-	cr |= DLYBSD_CR_EN;
 
+	cr &= ~DLYBSD_CR_EN;
+	writel_relaxed(cr, dlyb->base + SYSCFG_DLYBSD_CR);
+
+	ret = readl_relaxed_poll_timeout(dlyb->base + SYSCFG_DLYBSD_SR,
+					 sr, !(sr & DLYBSD_SR_LOCK), 1,
+					 DLYBSD_TIMEOUT_1S_IN_US);
+	if (ret)
+		return ret;
+
+	cr |= DLYBSD_CR_EN;
 	writel_relaxed(cr, dlyb->base + SYSCFG_DLYBSD_CR);
 
 	return readl_relaxed_poll_timeout(dlyb->base + SYSCFG_DLYBSD_SR,
-- 
2.56.0

