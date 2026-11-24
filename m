Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513598;
	b=fdv7W4nhZa6aN+Wt2Wrelo5RGNc8F3rwtLoskHKuL5UFbVWKqQOFMKQ9wE+NVFjUt2eC
	 JYKniKlybfJEr4Zf0h+2oqMSE0n4NGzPJog4fb+In3TiB13iM6CINJcezVbvqDf7+BoAB
	 v97RRDTguSLVnTVOyAM1JVzWdIKeiy3q09lNaAmoXZqx6r+Qz20Zy3TC4XLmSnT2yp5os
	 0uXzOEAj4b0EBJX40g97pLQvFuq4Q275O70t6lf9h+/3FcnuzTV6K5NsvVvuApChRDmQJ
	 Xp6jhqb1HoNyaS2/eZsnbMiOWSNbP/PL/p2Eg93rFNh6R1MeZRsBJc8S6SZzZXG04sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oaLF5qIGw2nyY3NabfPF5nK44+ZydS+4SbcKbcg9WWs=;
	b=R2ekHJGJLSRLrKbaEmtnMRV3nopsdFcCynhezZ29mGp3dsbSNPScg/p2X0WbCn/vt3ix
	 l1IL+1RMP4nu1RkRUSiOY/rkzfMmIxqhsvd74NNHSW0K7NxwIRB4DSmH84OAu7b8luthU
	 Tp/8tqQH5hBEmdJlnEEnMsBb59Wa60/9z8cR13DBxAlY7cxHvrlp9ACGdbiUeBLMTUYpp
	 qGWUpGW45CVFD45sQJImhoumhQ8Cu0zfLxHFYEkiyJv3WOk45H4wd+DjYdgH5WtrwyO7C
	 LQFEpbDBn51ZTpII3IrkeS9FJD6KuhZjvswmPx3oJ+c50N8kbDOZYtjSzBJ1fD4WsGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="hDQ/Zwnp";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DE2606CC24
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7DE2606CC24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hDQ/Zwnp
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491846221ffso3621086f8f.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795513596; x=1796118396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oaLF5qIGw2nyY3NabfPF5nK44+ZydS+4SbcKbcg9WWs=;
        b=hDQ/ZwnpSFaBpYw6vL86oM48gvv/PCcWR1a3lXgn9Bq1G13dDdODKUnQy57OgrcMJ9
         1asTrnjUSy28E9N/SaG4tcI5J3RhYuQFwSb9zJFuirJ7d4bMtxHowLKM0Bz198y6c5qQ
         Q23v3HNoqpvXrfKIyYvP9bVdE9DA4b/QVsJbguQ1Kztphpo8Oy+IC0+9AC3Auf/QBAXT
         n2AyetudKrb8XS0lA7g8HD5/wyiRJXnv5RNhiXrGpw3pnTvR4sOLjqTF3zLCaaV99zZB
         dbs8ozO1zRDxVh32Quz9H8Z70ctOv8gzXbMft4p5cYAIFKig9CYX9pcstHarT0R6FHLS
         oEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513596; x=1796118396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oaLF5qIGw2nyY3NabfPF5nK44+ZydS+4SbcKbcg9WWs=;
        b=bSRbp36YzqF936+Pl6TYhLVSxQw+agAG8QY1/p35IIU1UPOxxzEBKoVJ3ByLlU2+Pn
         WB6JD3IVd0ZHs8B8O6VwRheGqPpERfLb1t8Jc1FKMFErATQiiqFyzX8HC3j307MQCJqF
         c3HLaB6VDQ+hX3GGRd9Pw2KifJIVwdXk1vj6KMG5FHtA/9g0Fe2dprRjVbVqsD9By5vY
         uSkdbbP9/jeWjs1l4C/IHoRnjETei3ezz5F6bD6xugzKVFWO7QZgiYwiwx5SLz4noWxt
         fhJgoFk7/VgJiQ7AI+OOWu3VloqkBpbB6vyXKA87jG5AMFr/BKnkSFC2SKNEwMDzsTPw
         Eozw==
X-Forwarded-Encrypted: i=1; AL+hErGwxqeR+KfwlKtFxkZsnpCKd0r61dQwCLcZDXeWPn9wGVl2iF9S9gooEr8mhWc7FNf96yZD1Y2Ts/U3@vger.kernel.org
X-Gm-Message-State: APuU4Z/IvLmEVTn9XPDH+Rr7gpgcLCfFVHIp1n+wL7itv+IUXmZOupVi
	/7yBbjTk2llPZNYoofHs4QgBm+Y2YyqWiBydkkQ8SN4UU9yp9WO2H0ckRsUhe9axIo8=
X-Gm-Gg: AZFdTZeC9t+OeTxxAEDuWqQs5OjCt8rdvFTvT2Uv73XhIAfaqmVyZiZvCp39VsWphhi
	09sPTKg82szVlAuoFdXCdxku+a0XMw/6qXJYVo267q7GHAhBWfwcukdHOJTXYpUDdHlllz5632F
	BUbpLr2xgPPW4KmbRlopWSyemdjwotN+Ayrr4dtbXcW/SZdjAX8EEOirTiFx7rOuculs46xq7mz
	5iPShDe1wD3q577q3DhrZbjn92tLL1dj6F1HqUGnigXG9r6VtQQ3rtCSrVYfom+7bRQsKlrVxeN
	TRun0rqcwSsnR6naNPLPHHxFvR9omEsaDgaPczfd0MtiQpGpAuwfStnQYY9YjHACWxb9KAzB3Ps
	eFCyt76owzkE0lUfDDmiMfAhVDiAFhKeYCAAE8pZwsULi+EAaF/HnCgTvlnGHWRecBETRRRFFXr
	UBhde3OZNeHGeIj8hLixM/QtX4hSjidgcxvRkicKITo89bFCnBirefFktjwwfAsHq2Pm50J2Raz
	keR9VneA7DMkKOzshUBCjmuE+Yjye14QiPDQpg/HONLhju3f9SnRuMXV/FL2twpT6rpKWDBAcG7
	ZrmfkpC14wy++mIumZVzCOVp6D86YmhEwc92jT0LW3ya8yUhFGtQp0F0wNcvv98+5XJyc4wbm2K
	oDuTbL3dAnMk=
X-Received: by 2002:a05:600c:1c1f:b0:4bb:6847:7943 with SMTP id 5b1f17b1804b1-4bb88814510mr348413515e9.26.1795513596142;
        Tue, 24 Nov 2026 01:46:36 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm431782555e9.15.2026.11.24.01.46.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 01:46:35 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v5 2/4] iio: magnetometer: mmc5633: Reference the datasheet for the SET/RESET wait
Date: Tue, 24 Nov 2026 10:46:30 +0100
Message-ID: <20261124094632.8879-3-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261124094632.8879-1-gerard@teslabs.com>
References: <20261124094632.8879-1-gerard@teslabs.com>
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

The 1 ms wait after a SET or RESET is tSR in the Operating Timing Diagram
section of both datasheets. Describe it where it is defined, with the
revision and page of each datasheet, in place of the comment at its use
that pointed at the datasheet without either.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 drivers/iio/magnetometer/mmc5633.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/magnetometer/mmc5633.c b/drivers/iio/magnetometer/mmc5633.c
index b651f01e1b5d..8142ba741ddc 100644
--- a/drivers/iio/magnetometer/mmc5633.c
+++ b/drivers/iio/magnetometer/mmc5633.c
@@ -63,6 +63,12 @@
 
 #define MMC5633_CTRL1_BW_MASK		GENMASK(1, 0)
 
+/*
+ * tSR, minimum time between SET or RESET and other operations, per
+ * Operating Timing Diagram section in
+ * - MMC5603NJ datasheet (Rev. B, page 15)
+ * - MMC5633NJL datasheet (Rev. A, page 23)
+ */
 #define MMC5633_WAIT_SET_RESET_US	(1 * USEC_PER_MSEC)
 
 #define MMC5633_HDR_CTRL0_MEAS_M	0x01
@@ -144,10 +150,6 @@ static int mmc5633_init(struct mmc5633_data *data)
 	if (ret)
 		return ret;
 
-	/*
-	 * Minimum time interval between SET or RESET to other operations is
-	 * 1ms according to Operating Timing Diagram in datasheet.
-	 */
 	fsleep(MMC5633_WAIT_SET_RESET_US);
 
 	ret = regmap_write(data->regmap, MMC5633_REG_CTRL0, MMC5633_CTRL0_RESET);
-- 
2.45.2

