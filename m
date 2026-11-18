Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035191;
	b=2CkiDKOOTAX6TLuebc/LlSKRi3/thx32reOkDR0GPWOZxdxz3rIpWZlRo7ZCfKRY17zE
	 Hiy4PTlW7uGqjqXhEu/08OZ25U4NpeP2S2eaDG8s6mw/HDQaZeNYrck6UVpJE6xUPKEWh
	 hH0ABHUxJD7w4M7d8Yn4+2DPHvupr1np1/0FWlXMkq24PJ+ok2PHbGbCj/Fp0fSYPB37b
	 3LbprIq4KSWeGQ0l7vOeydChVDHlGMknnjMUNs9CUu3L7TVYrVu/ps7rUKSsdmM5Dwe5i
	 I4JN1AxJ6fm7lW20vs6aRk745cYR8QW+I0FIOMjP6z2gemD8lmfKz3otRAQbtgX+9Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yM3BPJ8QKqRePbbotO/o8nLTIwSIfzAlG3YqharGRPA=;
	b=XUW39d+T6Wady+5dM+DMeo5yRd+XDrJsupBMDBdE4DwgWgVflzMF46hzl3BY0VQUuFhc
	 aK+JooAqVBEOG+fmxGvIJCU/u8cDvsky5mTorHS+qHTLAUrBH1sZju1Zcdj9dtThtI9Sn
	 oRYJlez7u1KFZXt3NidpNx8c/PPkvjxZ+X5Ef5CqdYWlyNYmdpTZxI9wFOpWgbfqA8I1A
	 eAw/0+Dq1LsVhFKZJ0uVy9PB7gcXY68O2zlVeqllNHmRVHplHa1qE9RrAqSLrWtEPhB1N
	 HWB+5GTpZo5MDz/JZRAhWodOFesR1OiXRiNh6rUxFbKIPa3GnsUbPyKuiu4IKjIvl9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0YGOL0/h";
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E88960A260B
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 20:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E88960A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0YGOL0/h
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c247f6687dcso222420266b.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035189; x=1795639989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yM3BPJ8QKqRePbbotO/o8nLTIwSIfzAlG3YqharGRPA=;
        b=0YGOL0/hyy6+47TsMZ+kpoOWJcdMNz0GQ5f6BO1ey+aUmPaC7C71wt2b8RcN4Npjpt
         ZZBnKB0GopgEbcVVyhxPsQdkIoxmT1KFZJ4Phbk9TfkdktIBirbceKHg97mcgujRhAB5
         9XTBHooBlgxF5Wew11cVQUHE8Hla1aNPc4Peiq6BKv3nUwdbxqjnV11oq0FG9syzUWzh
         +7JfH+eFSVVOemmQNNHUb/ulaN8WoGpGuhrjrpY+R0w4aElmtEQqoXcX2SKDk4L/eGOS
         1xR2eW/G8uFy7TstA8Fqx2tZvmS/ayRWdPAHIj2etOseL8xKMjKXkO9WQ+ii653YBZ1s
         xXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035189; x=1795639989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yM3BPJ8QKqRePbbotO/o8nLTIwSIfzAlG3YqharGRPA=;
        b=izKM1+89y06ymJYmbSqzhDcqzhVFaxeInINGA0rK6o1mhD2ygfcuS9fJqDWlI56z8D
         iAxaGYeON9vrvz8t9KgJijtconbbIhi9pY5B2dENgwxJLVgAwGIWrsjpuydBgmNFCSQ7
         oOkar0aHRH1yzsIytRlhYBNfITRAW4F97/dsegxVwdbYwisddpoZJX1JsaltC3/BcmOY
         MbwdB4JsUA3AtvDHJB0GFfOU/yZAhn8AZuXFJjj0xmdFELrmbtQPtaRpGUv4YLU0Apmt
         2OOBtYWm9Pgo/LFFW9/R58hIBfYAA2TtWsZ09qNfCiX6Xwv1yz4WcmQ2/ogDNnl8HreP
         96yw==
X-Forwarded-Encrypted: i=1; AL+hErGBa+DkRp615GIYmFhlXtgIaMNailk19BYmsp4uKjJw+sLmaO2GiVaUsoJL0mB5IMdD6S9hdyFqjLg7@vger.kernel.org
X-Gm-Message-State: APuU4Z8f3vzZieRV7jbdB2acAa+A22NHW7ajXwBlExrWOSdQSkOQbW9k
	1D9474sS85VbY0LMLhwitpAjUScH8povI2WrOGEOjOlVrlVrdwL9Yvsw
X-Gm-Gg: AYBFou2guRltVbDRTERGDPV9H7KIlT3dDR3MxLXnJt9lc8AEGQH1uE2UIyhxKfV3DDp
	EHEuRbGavM0C8t3ZQyT00kokuIiK9WCKuvR8DgBhx69XUQp1Z5xjbLNsNzF0SZJHw/XBiay5HwZ
	GC5pcIYcJEL3iXmjA4PRAQBroejd6HkZcnaKMykM8DXeqQWU9s9EziZKOPmPAZnvLX83Y9Vhxhn
	AuW7gHtrmrr9LXIlCQ+Y4HhmDTY5gRAY87DraYI79XW3W5XMbWBnPC1BXcNhRYASU/ABopdpmLu
	+yeJ5m1aNjsW2JYixgcTZ2GR4+PJ6hW1wD6/RWU1r7tYtNmSNhMg2DdwJhAfOsjCO6Uc6F2HQNr
	GC3q4zRtWjrYOj0CAtQyYAooFbubS6mLMbq/G81FFvkWyBIvTdib6Ks+rsMID65E5JumHOp8vVt
	3gVrkw7VkoGKUJ3lpTkJDDx+EhuMISJdsKH4nPL1dW8J/RnIR6BoNZBn48LhRFP8OCZrvQrHgn0
	ERccYF5D0StsKmwi3mSXR5rlu7K9rDKPJ5OQ0UL3uN2uTSYlXjHxtIpb5f0LhNqRsd9NmGY7DPv
	uhC1OySuKu6uO3vrKu7lTn9+GjFd4sQK4Nqx6qOHB3EzbczC49IesgkiD0/x/A==
X-Received: by 2002:a17:906:9f8a:b0:c41:61b9:6ef6 with SMTP id a640c23a62f3a-c510e376c7dmr374133066b.27.1795035189529;
        Wed, 18 Nov 2026 12:53:09 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5123421612sm35303166b.41.2026.11.18.12.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:53:09 -0800 (PST)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: vigneshr@ti.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v2 3/4] i2c: omap: remove unused is_rdr and is_xdr function arguments
Date: Wed, 18 Nov 2026 21:52:06 +0100
Message-ID: <20261118205213.88778-4-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118205213.88778-1-apokusinski01@gmail.com>
References: <20261118205213.88778-1-apokusinski01@gmail.com>
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

Both functions omap_i2c_{receive|transmit}_data() have unused arguments
is_{r|x}dr which can be deleted.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/i2c/busses/i2c-omap.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index f02d294db42a..3f7060d57a86 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -996,8 +996,7 @@ static int errata_omap3_i462(struct omap_i2c_dev *omap)
 	return 0;
 }
 
-static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes,
-		bool is_rdr)
+static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes)
 {
 	u16		w;
 
@@ -1017,8 +1016,7 @@ static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes,
 	}
 }
 
-static int omap_i2c_transmit_data(struct omap_i2c_dev *omap, u8 num_bytes,
-		bool is_xdr)
+static int omap_i2c_transmit_data(struct omap_i2c_dev *omap, u8 num_bytes)
 {
 	u16		w;
 
@@ -1122,7 +1120,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 					OMAP_I2C_BUFSTAT_REG) >> 8) & 0x3F;
 			}
 
-			omap_i2c_receive_data(omap, num_bytes, true);
+			omap_i2c_receive_data(omap, num_bytes);
 			omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RDR);
 			continue;
 		}
@@ -1133,7 +1131,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 			if (omap->threshold)
 				num_bytes = omap->threshold;
 
-			omap_i2c_receive_data(omap, num_bytes, false);
+			omap_i2c_receive_data(omap, num_bytes);
 			omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RRDY);
 			continue;
 		}
@@ -1145,7 +1143,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 			if (omap->fifo_size)
 				num_bytes = omap->buf_len;
 
-			ret = omap_i2c_transmit_data(omap, num_bytes, true);
+			ret = omap_i2c_transmit_data(omap, num_bytes);
 			if (ret < 0)
 				break;
 
@@ -1160,7 +1158,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 			if (omap->threshold)
 				num_bytes = omap->threshold;
 
-			ret = omap_i2c_transmit_data(omap, num_bytes, false);
+			ret = omap_i2c_transmit_data(omap, num_bytes);
 			if (ret < 0)
 				break;
 
-- 
2.56.1

