Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463657;
	b=crmpl8tzPFljK0iJpyPQQej8s3WNkplP7250PgL8iS3bs/joQ/SZwE2VVY9j0AWWK6/l
	 YsrAziJBsFHeGmU/vVmtBn/yX2LvJ+p3o3eqb2ti2e5V4lvrNg/Z+WTE27uxml11shK/J
	 WVmgiuqNW3ZUKf2P6gtB5wfVtW7kLY86PjCh18XooUGr6oxZv+ETYwP56i6/qWv45aJnf
	 /YojSW1KFYv8yaWqiS11xS8udKMBvUOtBHor5u4GPDKBRbYolGsXylNRdgB9pgmCokJXk
	 PsWzEOT5O77vw1RBfa5EuOZK/Jq/xH8JcfkMwsOOrfHR27Zfc5PbisPqVpoReTzYpMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=KGnofmf1/TUmvz6/LdHCt+9mScC85Mc6Sony5/UMrQ0=;
	b=bU6PJ5l4SJDoILdyrsi32AWVw4xNsVs2HeVxpwY982cYge1F+kVbK2g11FsqazmYa8uT
	 Fxd9eRwhxTKFy+tslcMEfWLg98jzljloWk/wzBn4pIw4tzxG2cgGFZbCW7iKo83Jeiadh
	 kfuqdxqUHz8jyKi37Cf7rGsT/RozLQwIE++Vh54Z4HxBfz5pNaFVNgqfXWzolUrSBGA6d
	 Z/CmJrgZcYmAX4L0ie/OfDtsyjC5N2d6XMOnRjRPlc+VbVMVIGBuyUyWyut2+x5Qu4uH1
	 NhALw62eu2l8ssCU9M2AQfgnL/HkqLtjqoDlFrQf89YUUIganOjtQTA1BkHVNrt+0xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b="Fw0cT/vG";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF94F606A32F
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 16:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF94F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=Fw0cT/vG
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3535a54bed9so2592341eec.1
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 09:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793463656; x=1794068456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KGnofmf1/TUmvz6/LdHCt+9mScC85Mc6Sony5/UMrQ0=;
        b=Fw0cT/vGyZayC8va03gwO+veLsYq8NZOPMRSvDZwENiAFeGWMa1Cavf2vdNTLUNvot
         sb6377hQM+HMiMke1b72BPkB9gbJFp0fKx++of3dYgvDWd5ulCZyuoOV//ORsvKmWZO5
         +cxehdFCEb99oidhIgmzFTV1txwbutqk5hlXVsnRxoTvJS7NbFNyqpCovzMFgeKZcbAf
         SzHUZ2tkhlAcsxfDQsUpC5QnU0G1DfhICKwAOOblwY7/1Tgtcj+GGm7Ujixq/+7nL+ZZ
         4gkR73XlCuff/YjrIlvez6OK+B++Cfwwi3AuCaM7X8xW0YSoPkjK4AlLzDHotqapPY50
         LTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463656; x=1794068456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGnofmf1/TUmvz6/LdHCt+9mScC85Mc6Sony5/UMrQ0=;
        b=JQUXINI2yslJ0pAQN8HW6T73h6cI5Qlkv1C0Ez20cp8BqwJjwQHBM6U0TDkwbVbUDr
         NMSsymj0IruTliB9rm9FGkhIkiF1aPhBPDiD30u24QZ0nwpIDbDZZydMcDaUETbaU5/A
         ivVueQXoEh5d2OFejlGGxdK1FsDnFVD7RTmOdpTcIkTog77HEf3yznD+bxvMMATa0rcW
         vX6mTulHMe59R46/7FVIHnlf8UyMQlTgcwztlrAxwfnevl/WVpCbauEHLQYzgDNOg3Rk
         J2US8IklITyP3fSvpoamF7q6jKP1YW1ac8/hKcA+S1fb/0jMteiaejcDTh8/1PSR++Yx
         70lQ==
X-Gm-Message-State: AFq9FYKZqdF0opFp/tpsz/Mhcprc01Iz8zgXiT4afU4tm1Fi+LCjSF12
	Al7Od5/xuazvvNUWeFjFsRKz+T8PXjaYiW7Ucb6dR7nyh5Y8OPYJw0yJ+MOdIT3inLQ=
X-Gm-Gg: AYBFou2A0QQ3ftcGh81FEniGpA3uTHiajyida/zXQZcNuem5W1rBtUC/eIhCA6vA1AK
	wrG8V1XrBxgWk2BbtV5kPlgYRJ4zkEaaUDyLf0ieGDHasLDZ8shgW3GSTDqHhAitNmTMRFlzs0G
	DkF+EZmeST9uWXAnOZFKtghuQU8Zfx2RWKa32PVPmmI+W1ruRfUbAa3bSQi89u8PTl+iFsKZnKy
	+fi+OmwhxkwZ1MaoGnRD0blw9WK1ihAq/Bme32sre9l+W0kS5aCVUMnJ07+nejHTV7lKHx+z/XK
	o5T956U/cBjg+smHODox/okRBnXG6qStL9H7soqFIhMn6t+aAJDXvsnzvQLjK0WiGV1wbfNGzWv
	CfXP2VhxYuewgwL02xXx2klueSOse4YrVmUOs6SK8GIl5nEX2vkLgwrE1ypYXjR/kNaNyI66/+u
	2QmQnKjinOpFFT404dVBFZzRYsw2jh63gnDivDeHUK6GN1fnkG9ghezAlzOBJ4FwcsyAOPtUqUc
	hO7zofC28eVqBwUNV7FSbf6ienEORsFuxinANboq509LGznwhHZpCM77huVUIQ8flEGjMOLJd1b
	HixZN96HLtjcA4nCBp3StDD1vnl0zJhGSdLHw9ZD30a0mdc7ThhFXQ==
X-Received: by 2002:a05:7301:22a6:b0:369:f9c4:1fda with SMTP id 5a478bee46e88-36a42489041mr10383429eec.27.1793463655579;
        Sat, 31 Oct 2026 09:20:55 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428aed76sm19185195eec.9.2026.10.31.09.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:20:55 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 31 Oct 2026 09:20:51 -0700
Subject: [PATCH v2 2/2] nvmem: eeprom_93xx46: add Microchip 93LC86C
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
Message-Id: <20261031-eeprom-93xx46-93lc86c-v2-2-d37331af73d3@nexthop.ai>
References: <20261031-eeprom-93xx46-93lc86c-v2-0-d37331af73d3@nexthop.ai>
In-Reply-To: <20261031-eeprom-93xx46-93lc86c-v2-0-d37331af73d3@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Cory Tusar <cory.tusar@pid1solutions.com>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793463652; l=2481;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=4jH76N7hz1AxW1XPeahTW+3Gh4aa+Q7uWx1sNvUiNXg=;
 b=wkYGYywy1SPJC3HroZOXMaD0DamdopNMoTM0jt9Lu/ioTtnDuIQ3bdc6Vj+l68NfFN+pmfsiY
 4w2uKfitpdUCNsb0UI+WlyC0cgx4S3bYKe30Dp/oj9p6DhqpINNroRw
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The 93LC86C is the 16 Kbit member of the family: 2048 bytes, so a
10 bit word address in x16 and 11 bits in x8. Like the 93LC46B it
clocks an extra cycle out after the address during a read, so it
takes the same quirk.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/nvmem/eeprom_93xx46.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/nvmem/eeprom_93xx46.c b/drivers/nvmem/eeprom_93xx46.c
index f9c3ab52c2f9..77fe1fb641aa 100644
--- a/drivers/nvmem/eeprom_93xx46.c
+++ b/drivers/nvmem/eeprom_93xx46.c
@@ -29,6 +29,7 @@ struct eeprom_93xx46_platform_data {
 #define EE_SIZE1K	0x10		/* 1 kb of data, that is a 93xx46 */
 #define EE_SIZE2K	0x20		/* 2 kb of data, that is a 93xx56 */
 #define EE_SIZE4K	0x40		/* 4 kb of data, that is a 93xx66 */
+#define EE_SIZE16K	0x80		/* 16 kb of data, that is a 93xx86 */
 
 	unsigned int	quirks;
 /* Single word read transfers only; no sequential read. */
@@ -77,6 +78,11 @@ static const struct eeprom_93xx46_devtype_data microchip_93lc46b_data = {
 	.quirks = EEPROM_93XX46_QUIRK_EXTRA_READ_CYCLE,
 };
 
+static const struct eeprom_93xx46_devtype_data microchip_93lc86c_data = {
+	.flags = EE_SIZE16K,
+	.quirks = EEPROM_93XX46_QUIRK_EXTRA_READ_CYCLE,
+};
+
 struct eeprom_93xx46_dev {
 	struct spi_device *spi;
 	struct eeprom_93xx46_platform_data *pdata;
@@ -389,6 +395,7 @@ static const struct of_device_id eeprom_93xx46_of_table[] = {
 	{ .compatible = "atmel,at93c56", .data = &at93c56_data, },
 	{ .compatible = "atmel,at93c66", .data = &at93c66_data, },
 	{ .compatible = "microchip,93lc46b", .data = &microchip_93lc46b_data, },
+	{ .compatible = "microchip,93lc86c", .data = &microchip_93lc86c_data, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, eeprom_93xx46_of_table);
@@ -406,6 +413,8 @@ static const struct spi_device_id eeprom_93xx46_spi_ids[] = {
 	  .driver_data = (kernel_ulong_t)&at93c66_data, },
 	{ .name = "93lc46b",
 	  .driver_data = (kernel_ulong_t)&microchip_93lc46b_data, },
+	{ .name = "93lc86c",
+	  .driver_data = (kernel_ulong_t)&microchip_93lc86c_data, },
 	{}
 };
 MODULE_DEVICE_TABLE(spi, eeprom_93xx46_spi_ids);
@@ -482,6 +491,8 @@ static int eeprom_93xx46_probe(struct spi_device *spi)
 		edev->size = 256;
 	else if (pd->flags & EE_SIZE4K)
 		edev->size = 512;
+	else if (pd->flags & EE_SIZE16K)
+		edev->size = 2048;
 	else {
 		dev_err(&spi->dev, "unspecified size\n");
 		return -EINVAL;

-- 
2.54.0

