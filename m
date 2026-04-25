Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269E537E2E9
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 12:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777121695; cv=none; b=cG/tzWe3YtqUlCmpZnPma05QY0cR4B8yizybOa3a/rp28XVuBSBOww5O9pN7V+NFj9+ClbiW9RtV4T4MmFb8LP763iOOzUuDwDaVF8OxabkT1irzk0K8drBvFuo1Ngj22sdJ5AFNj40oFkqWNsQNRgcbfLbOI4kh3ETHAlPz7Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777121695; c=relaxed/simple;
	bh=os3bytxGw2AOC8T4LmbMOxb3v9WrfYXIrI2AmuC6D7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iv/C+whYXW5w+F96ezLVH7k6QBOqjTTV2ra8AUNoupQ1nbWp8Kw6CGsX1lQyYibLAXg6v8aiylW7ANRq/0XRNf4uGd/d8eGq/c2JF2ntAvanfqR6mbv6VssnAhF/EO1GoWfALKddeywWA2JjjyOZ9emI2rmLqIA7CAeyAMGU9Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IiTns9ZR; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IiTns9ZR"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38df1889fb9so84264091fa.1
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 05:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777121691; x=1777726491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INZTHDtHLu0hLsiQAV4hWhdKZ29geUdagZMSnUDNr8g=;
        b=IiTns9ZRAfG3wTFDcgGbF3Zast0cvspVDYk1f/LThMDGDBrV+3iJHUZgDOpJ+TfHtl
         giSi2niMe3oBmvzvUeHA3julqD1x3j471i0i8x/WW6n7lSALRVUqmYQCjeeN9tCc+h9l
         GE4FPQDQI+GeQKmLr/zR8pjJOGTAPwtW67mj0Lm7Dsl/XjbcikBn4ifCDTbqbwWlyaaM
         Sl46Yr2/seaU4pOWTibQK/7Ux53YPPs35eeVWpF+ynZvlR4YbQWvB15EH/7NrqV6NhQN
         t+ic61PLvTrRbKuxakUMRoU0llkDVCHCAKBBuKtd5dknaephRgqNbgv8BPuVtNhCUo7E
         /fkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777121691; x=1777726491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=INZTHDtHLu0hLsiQAV4hWhdKZ29geUdagZMSnUDNr8g=;
        b=Vyh5UZD78BpfBqKjsLq8/1U4hauv2VyyuaA52Z/ZLtKoIHo8u5ij79spFQqFLOmfTU
         UyOMaL5/4KHu1mUNIvJhHo2AOfc29LWWSYV9bXPLQM7DabMuz1PwfRYjDOF6yYL2xPec
         qcbUMiobF2WJaSj4xdl1wufLXfLLbDjyL2i01MYE+47LSACmomO638LL2SmAAoKDNezs
         lfAlH5gamTYWmAaRLY2FVn47wXHB/Q9EUxKqxbAOZVp5xDQSuVSYIlZl57B27blKSKeT
         YJu4n+292Oj6EtH7hdT9gapFfgh9gQPgORSuqv30HctE912R863bKlMKmRWS7XYuf5EN
         OzEw==
X-Forwarded-Encrypted: i=1; AFNElJ/fA+BgvnI7mUkcaaLNNl5qDqW7YJ2d6QrMUf9LGP0mj7PGJlm9/4I4LNZkRFc0Nxr7M8aXNQsCeBzG@vger.kernel.org
X-Gm-Message-State: AOJu0YzOQMdLvPxJHnYtShkexWFwD+JfuePoAoV3f2WqSxan8y0cZJoh
	SXcyFMxZ8YqDn9SWqXFk4wA9LnhcqjPCBFLrYfC/XtFK9MtkvFF7RXvU
X-Gm-Gg: AeBDietdfx5UnASPa+keDxWWWhv9D67FxSyzNBRwLWX7gOPVcj7XkUQ3QdEd+I8btyh
	fQK1bpCJcq4Wt52AZz9Hpl7LynevnvYM+bQYyydgyLmmnPHwfRwCj/nfcRm/zXQpSztV2z1qo+n
	n44BbgXsGkz5l7Oq4kcuruWyC7lCTYMxBRC4B28AIz/7fP9s0IqI0VuYgz+aiVuVTN491LjN/VO
	ZJZMxVTJI05nrSzeOoUcqMzLTA5kzUpgRiaQZV0iP/1qoxIOv660RZKAiH8X734a5cr+pTL5JEg
	8/eHEyrJuRoAaftAJIAkP1wNTwUauMDnEEXYmw9R0OsD89QVtOdb5Q5m+Fmka7f6EjlLyTBsTrX
	PLkIS1f9Bu7nALPsJVgofpLxpWgxA4QmAG20fx5WyF+K/2zKIocQxgMyIRrk88PbMufkQSwWZ9w
	f9T84qhXiQpzCaxADEmsiMjIOc7S0tSc9GpA==
X-Received: by 2002:a05:651c:420e:b0:38e:2aa7:3984 with SMTP id 38308e7fff4ca-38ec781824cmr101464481fa.11.1777121691174;
        Sat, 25 Apr 2026 05:54:51 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f6b20sm58334271fa.18.2026.04.25.05.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 05:54:50 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 2/3] iio: tsl2772: Add support for Avago APDS9900/9901 ALS/Proximity sensor
Date: Sat, 25 Apr 2026 15:54:28 +0300
Message-ID: <20260425125429.65154-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260425125429.65154-1-clamor95@gmail.com>
References: <20260425125429.65154-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Avago APDS9900/9901 has a similar register layout to the
TAOS/AMS TSL2772 but features a unique set of configurations. Add support
for the APDS9900/9901 into the TSL2772 driver by adding the required
device-specific configurations.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/light/tsl2772.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/iio/light/tsl2772.c b/drivers/iio/light/tsl2772.c
index c8f15ba95267..9ba8140c8bc1 100644
--- a/drivers/iio/light/tsl2772.c
+++ b/drivers/iio/light/tsl2772.c
@@ -127,6 +127,7 @@ enum {
 	tmd2672,
 	tsl2772,
 	tmd2772,
+	apds9900,
 	apds9930,
 };
 
@@ -221,6 +222,12 @@ static const struct tsl2772_lux tmd2x72_lux_table[TSL2772_DEF_LUX_TABLE_SZ] = {
 	{     0,      0 },
 };
 
+static const struct tsl2772_lux apds9900_lux_table[TSL2772_DEF_LUX_TABLE_SZ] = {
+	{ 52000,  115960 },
+	{ 36400,   73840 },
+	{     0,       0 },
+};
+
 static const struct tsl2772_lux apds9930_lux_table[TSL2772_DEF_LUX_TABLE_SZ] = {
 	{ 52000,  96824 },
 	{ 38792,  67132 },
@@ -238,6 +245,7 @@ static const struct tsl2772_lux *tsl2772_default_lux_table_group[] = {
 	[tmd2672] = tmd2x72_lux_table,
 	[tsl2772] = tsl2x72_lux_table,
 	[tmd2772] = tmd2x72_lux_table,
+	[apds9900] = apds9900_lux_table,
 	[apds9930] = apds9930_lux_table,
 };
 
@@ -289,6 +297,7 @@ static const int tsl2772_int_time_avail[][6] = {
 	[tmd2672] = { 0, 2730, 0, 2730, 0, 699000 },
 	[tsl2772] = { 0, 2730, 0, 2730, 0, 699000 },
 	[tmd2772] = { 0, 2730, 0, 2730, 0, 699000 },
+	[apds9900] = { 0, 2720, 0, 2720, 0, 696000 },
 	[apds9930] = { 0, 2730, 0, 2730, 0, 699000 },
 };
 
@@ -316,6 +325,7 @@ static const u8 device_channel_config[] = {
 	[tmd2672] = PRX2,
 	[tsl2772] = ALSPRX2,
 	[tmd2772] = ALSPRX2,
+	[apds9900] = ALSPRX,
 	[apds9930] = ALSPRX2,
 };
 
@@ -530,6 +540,7 @@ static int tsl2772_get_prox(struct iio_dev *indio_dev)
 	case tmd2672:
 	case tsl2772:
 	case tmd2772:
+	case apds9900:
 	case apds9930:
 		if (!(ret & TSL2772_STA_PRX_VALID)) {
 			ret = -EINVAL;
@@ -1367,6 +1378,7 @@ static int tsl2772_device_id_verif(int id, int target)
 		return (id & 0xf0) == TRITON_ID;
 	case tmd2671:
 	case tmd2771:
+	case apds9900:
 		return (id & 0xf0) == HALIBUT_ID;
 	case tsl2572:
 	case tsl2672:
@@ -1898,6 +1910,8 @@ static const struct i2c_device_id tsl2772_idtable[] = {
 	{ "tmd2672", tmd2672 },
 	{ "tsl2772", tsl2772 },
 	{ "tmd2772", tmd2772 },
+	{ "apds9900", apds9900 },
+	{ "apds9901", apds9900 },
 	{ "apds9930", apds9930 },
 	{ }
 };
@@ -1915,6 +1929,8 @@ static const struct of_device_id tsl2772_of_match[] = {
 	{ .compatible = "amstaos,tmd2672" },
 	{ .compatible = "amstaos,tsl2772" },
 	{ .compatible = "amstaos,tmd2772" },
+	{ .compatible = "avago,apds9900" },
+	{ .compatible = "avago,apds9901" },
 	{ .compatible = "avago,apds9930" },
 	{ }
 };
-- 
2.51.0

