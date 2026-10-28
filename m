Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191894;
	b=lT4KRSmS72NPofsrPeVwUpWDmApwdVprAAYXPEVBw75uqMMxKc6J7wpR226WsssWfyrO
	 qT6Kmxpa3nepyYQIpnY2FUkXx2+F9J1PShhd9gzHvczPauzC5Xnh/2jNZxjxC9y9lSiOn
	 +bgxAXfGCsp+Yz8GsRKU7FN+1I63h9QAgCmeu0CQStmUJ0s2dZjSn1QxiH9pvZvBOf/ca
	 bxuKk94rse2EFBSWiv3L/YdXjBDyS2nBGaLPTOzMf3L6Rjjfsj/k9LnqaP4jmZVwN4kVK
	 GFzqg2H9+yw/DqPi/nH9UQHdqEl6rqzSFwK9TXtaJCkzRMc1tV3eo6fH6CGv51aY0AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=58mU3YE1A8ySMdmeUGmqkV/ZZ/o0/aVwbVzGIHclv1c=;
	b=T8nAnFb0Z63LddRlO0iNxTofwQEI2eJhsXAVakrMTEs7GW94GbaWEZt0Xzw/YVJ71F6y
	 SNmff1sF68XVBajhyF143LnUOv3YWj8seDnKWGU1M0+yhfzou99uOfpEBC7LkamNp5WaS
	 w2JjH+UPeZBJtSF5DwbGVzxsns2zQLmqGZ99Q9T6jLZHusnh+4EEw6O9SrveoTXEYMo0K
	 bEKVTRpQz+AXORf9kOr+daj+/qFWaFZRvI0yzNTmfGR1/LOgiIxHanbByI4snjgyE7/NT
	 Kuqxu4XNq8ZQq+dAtPOA5INU9Ka0j7GC82aOsnUI0wmqKEztGMoigbn4t2d89N576uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cxv0F5G+;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5B2606A33F
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA5B2606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cxv0F5G+
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e47347279so697024f8f.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191892; x=1793796692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58mU3YE1A8ySMdmeUGmqkV/ZZ/o0/aVwbVzGIHclv1c=;
        b=Cxv0F5G+jXvHhAayNWRctdZCvgaTHYI7gEQ0bpvPR4tVX0JbRzaa/stQxFjqLVyDZq
         dVq5zYYk67wQJOV4Vm42Ajt0Oq9zH8SAIWqL/DyH8Xz3CsmoYtjnCD4YrUoSiyn3oyQW
         PO/q+P33m3PonZ3LotTCOCRocp1tZWNUdlBUaOYh4vz4pZNr+MYsEkVQ94T6Td7lNSGQ
         Oqg2yXtCOuq6RDfPKelMuVsoEANnthgRjaHoJchsgr/+6fjmTsZhRx03y3qvbUagednU
         tPjRfup1kbyNE7opiQpLOzpFkiQmuILdP2b3BP4dg0FXxoK1f/v4vmzxf4gRnY1HNoaQ
         U8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191892; x=1793796692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58mU3YE1A8ySMdmeUGmqkV/ZZ/o0/aVwbVzGIHclv1c=;
        b=2RNe6Z1VvDMLia2UGIcIIi6vl+t7pFlICSJgLJz6qtKh4lgRXQ3uJyBbZf8PGRVnGp
         raoL2+RC6iCbPhBKx2iPW7givFJ/+e24dCe0/ZEV2AB62lPZRHtkl1wlOfMvu+5zGZUN
         o4KkhYKmtU7duTMkLTF/FFIuhzMNJDr7XwKrELf2XY7JQSswAAWHbgAdw/znyEWK7X+V
         8DjpbRI6DpbnfDhs8QlZ+t8MXp3xzvvRJqHgu773FKoJxMBYukyjrOxe8PYVADkOh6nj
         VlV27BLwX2m5k3J8XgIqO3h53ptQ6EVg+SulyFO0bzcueX761/6SkPpOavnLZaFDvmpf
         fl9w==
X-Forwarded-Encrypted: i=1; AKwUvByDJaufNgYTR09G23H1eMNbdytw7s4pOGVAynvfY2chUHlY3O4aiSQWtFIp8ERWiOzqwTPbuxg5kWor@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8ntmw2B56onp7m+DVNWREZRytX/dvZ6acogMF+0c0aY0LMagA
	ZbL3HSVj1P0BIJGiMVHLyRrnIvq3XPLHmfFz+rVcfcKdPpBY92jl9mnU
X-Gm-Gg: AYBFou36ITGGhd42Evvio5ukA4kaESkIWU2lAU/qrYLxadHaxpxPAK9POALgio7rgcs
	rlEUrm3Ja5HbEAu4vVN32v9NJrKNA6EJTNxGr8kMfXodHZocqt14A7SpNF9Ba9NteNGKXn8ANP2
	99FGEYEmFlHUrCjMoXir43DVGrXuuiN2y5yoMWLVCYO5m5st/u1kSQLtbFE0Do9RRblYo5yegzK
	+EKNWM4PJmMODiUZxysxTgZNqfjyOWMAjmAKYLqKNsP7sQrHNGPBC2bpTN0Zk6AQOFo7mwTub3Y
	ZYivk+maxm/iMl2tMCAVQitSrX49kbE5Ubx6rrVGi0MSslonTfJixsaAmCJ1UipKpxib9KuC6eh
	Pi/CaETJzQGlQ6k6iFDFQpUxNML/kgCrDjplZNSHv2JWvk5xAWjO6LjAstnNbqXFOR5+wlnsDQu
	NVv/e9Qf4hSxGaToApS2KtSqMH1MV9rPQCmRWeNjkiw8w5tDStnvSOsfKLPSB6deDwZqrib1YOw
	R+wU2Z9+io9SN4XPTnNXcAtNcSCm7teqkamHyDlPuUDbBNIBETqSnJX+vk6RGnL5sLOgUH2vhaE
	vIqTZOuvzqn8Xm8zF3FeMUggTpzjTWkkdzG6xI7BTFzK/VfB8WyNjAhVtPpW8oNigus=
X-Received: by 2002:a05:6000:3102:b0:487:13f:f612 with SMTP id ffacd0b85a97d-48e5d5d802fmr5596555f8f.37.1793191892168;
        Wed, 28 Oct 2026 05:51:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6bf5:6c0a:cf99:c9f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm29275016f8f.10.2026.10.28.05.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:51:31 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 28 Oct 2026 12:51:27 +0000
Subject: [PATCH v25 10/11] mmc: renesas_sdhi: Add write32_hook for
 CTL_SD_CARD_CLK_CTL register writes
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
Message-Id: <20261028-rzg3l_sdhi-v25-10-57f16691c2ed@bp.renesas.com>
References: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
In-Reply-To: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191879; l=3693;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=ltWOzQvnXnaIZzBe/fnpRtSR9lOqq9Os7KYKzujgEKw=;
 b=/gBzy0L2P6XiAi0r9ZxYLEERTAZkDff5ULocuimlZsTKkG2n7ba8hs/euuypHKf0FdLK17Omi
 3yeK/f6kiHYCk4b98wHwfG7nArdFyebiNldvD+asBE2Fp3NDdeoVdUB
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a write32_hook, analogous to the existing write16_hook, so that
sd_ctrl_write32() can wait for the SD bus to become idle before
certain 32-bit register writes.

renesas_sdhi_write32_hook() checks whether the target register is
CTL_SD_CARD_CLK_CTL and, if so, waits for TMIO_STAT_SCLKDIVEN via
renesas_sdhi_wait_idle() before the write proceeds. Other registers
are unaffected. As with write16_hook, the write is skipped if the
hook returns a non-zero error.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v24->v25:
 * Updated comit description.
 * Updated tmio_mmc_host_probe() to set write32_hook() to NULL if
   TMIO_MMC_HAS_IDLE_WAIT is not defined.
v23->v24:
 * No change.
v23:
 * New patch.
---
 drivers/mmc/host/renesas_sdhi_core.c | 9 +++++++++
 drivers/mmc/host/tmio_mmc.h          | 7 +++++++
 drivers/mmc/host/tmio_mmc_core.c     | 4 +++-
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index e897328d5b70..cb41f38ec80e 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -965,6 +965,14 @@ static int renesas_sdhi_write16_hook(struct tmio_mmc_host *host, int addr)
 	return 0;
 }
 
+static int renesas_sdhi_write32_hook(struct tmio_mmc_host *host, int addr)
+{
+	if (addr == CTL_SD_CARD_CLK_CTL)
+		return renesas_sdhi_wait_idle(host, TMIO_STAT_SCLKDIVEN);
+
+	return 0;
+}
+
 static int renesas_sdhi_multi_io_quirk(struct mmc_card *card,
 				       unsigned int direction, int blk_size)
 {
@@ -1199,6 +1207,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	}
 
 	host->write16_hook = renesas_sdhi_write16_hook;
+	host->write32_hook = renesas_sdhi_write32_hook;
 	host->clk_enable = renesas_sdhi_clk_enable;
 	host->clk_disable = renesas_sdhi_clk_disable;
 	host->set_clock = renesas_sdhi_set_clock;
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index 3ab8c0d8a2bd..e29a2fe06ef6 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -189,6 +189,7 @@ struct tmio_mmc_host {
 	int (*multi_io_quirk)(struct mmc_card *card,
 			      unsigned int direction, int blk_size);
 	int (*write16_hook)(struct tmio_mmc_host *host, int addr);
+	int (*write32_hook)(struct tmio_mmc_host *host, int addr);
 	void (*reset)(struct tmio_mmc_host *host, bool preserve);
 	bool (*check_retune)(struct tmio_mmc_host *host, struct mmc_request *mrq);
 	void (*fixup_request)(struct tmio_mmc_host *host, struct mmc_request *mrq);
@@ -283,6 +284,12 @@ static inline void sd_ctrl_write32_as_16_and_16(struct tmio_mmc_host *host,
 
 static inline void sd_ctrl_write32(struct tmio_mmc_host *host, int addr, u32 val)
 {
+	/* If there is a hook and it returns non-zero then there
+	 * is an error and the write should be skipped
+	 */
+	if (host->write32_hook && host->write32_hook(host, addr))
+		return;
+
 	iowrite32(val, host->ctl + (addr << host->bus_shift));
 }
 
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 4116c4d29c63..4fe98b437121 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1169,8 +1169,10 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 	if (mmc->f_min == 0)
 		return -EINVAL;
 
-	if (!(pdata->flags & TMIO_MMC_HAS_IDLE_WAIT))
+	if (!(pdata->flags & TMIO_MMC_HAS_IDLE_WAIT)) {
 		_host->write16_hook = NULL;
+		_host->write32_hook = NULL;
+	}
 
 	if (pdata->flags & TMIO_MMC_USE_BUSY_TIMEOUT && !_host->get_timeout_cycles)
 		_host->get_timeout_cycles = tmio_mmc_get_timeout_cycles;

-- 
2.43.0

