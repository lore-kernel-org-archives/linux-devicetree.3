Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD0437EFEB
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 18:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784314255; cv=none; b=afaJS7kRQUFF0cqqXXqB+hpMzoU5os0BbuBIMOyMjz4mGJ4Qf/RqDHQ5nOJ64eghFGRhb1X/pEHQRTP3eyOkTo4+dvNED/Zwn0bYqKOKlYE0WCROW4X+6JggNcaObvPGPq1cQ9CSzJP2MSJeL+ehzWzsUQXAvnB39Q9AxNrvCEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784314255; c=relaxed/simple;
	bh=+PUNaa8q/0Da7TVT3slqlgYh4gptnVQMTwoWvaoIYy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i5xW2H44c7aRffXbj/zMsTZAcN6YF3OR8yPx2gCcMCrbYVNkLd7UqBrmDgJaG6s2Xr+iVi4euyR+MQUER6nzQixVolYWq09YHXekh5ahmewGxluao/ocW3tbZMCobGt7l67LdVbcCTLj7xFLSiS0k2CzKQNBdf2cymfRgJytVRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qIC+NXUW; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIC+NXUW"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39ca300db70so58763661fa.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784314251; x=1784919051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sIdBXx/E9iqHb1ms8+V810ZBdiXuhyO/kC4yZ+GrYcw=;
        b=qIC+NXUWmhFOc5CRUeL/JfvQoIc5WWjoDncqYXsD0BkIX0P69JOyR4L1duPacxJFzo
         sElJqeZkIZqbHzw4s28043RMAcsJ/9xHBF+37agpC7dL1yMkuf7moCyioVS3xKKqdx+N
         iN/1i5ZryIKLC8Ex7TRgXlhSfCuZ5gv9drUIZ1HdUgwKjbdQB+iYxzkVZZ7wSFwMgGui
         R/cDpoZoNDTECLER/K2z0Zr0SHg/2skJdK/+hpanxs8poNImX0qfLTthqwxpTbn0z7tQ
         Ai0/gs6eKHz3FtoHcdggbtcCarQB/1vYAZXWi6TTWM6TpAqT6npFx+z49rh6cXCdgAcq
         D9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784314251; x=1784919051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sIdBXx/E9iqHb1ms8+V810ZBdiXuhyO/kC4yZ+GrYcw=;
        b=KO1lFiLmzCHnNfA8/2a0G6PyhkMYhEz01dQNBDZV0deD/ydrVov5vdeM0yHOcgeDOb
         F/B6BJ/2f0iqMKGoloowsYDQF7u5KdjxZBC4aI4T3JBsfqK27OHGfetycWC07jiHq0b+
         V25CZVgdWjxbXYYJd6hz1XWN+iEVfhClMU51sB6LHNd9zcT0xbbtoCNFwtwJCG3fe2Gk
         eMaiiWgbx31IKMxg0IXaX218cXdzqVBWsosR5YuGMtUXgGuDqvWhNwgx5xWT3ZvzZA/C
         6ooLHRubdy3SfCi97Ziexb5pr4dCj0k+LOIKEpusvXNgLefyJFk1hiw9xWGzhXdkxv8s
         cO4w==
X-Forwarded-Encrypted: i=1; AHgh+RqwQ37acTo2TGeX6v2bclHKHVbcgkbg/KaPmNHs4HDCsJhGtAxfD33LPRp7GtulM+yMZa0M0gcL6qRz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/VuG/C7uWfUt3PR1cAZYoHLRBB67qoFYyMmheXxBu3+VHwsWU
	eJldZXq3Q+8PoJASZmszPqVdy0TlOlB7MJ+WsGzWuHpKeVTi6oHGjkQ+
X-Gm-Gg: AfdE7cnXupiBl7KiSfCmw5ognFZCkOG7Pxfp2ngvhRpL32HgYFMEzU2DVxKlxKOSrXi
	Jvtue9z6qol9M//vhVM66m7s7MPWgfQuyig9g5RaaCfEYMByWLHdGkb+EfpRMhLyYxd3ErrpzES
	0XgLO/TdcVivbcGCrKttwkZ+ZCCnIfzR7D/KhmHadX46jwU5CYsIL9qGd4IWXboRGaXw6i+jvVU
	w+f7R5UJGzCge2CbwcLzoftStCuz+zoY0anda5yH7FcqkYLdoqtOZ7x3CKcgYupHAUHTqkXa/1W
	puHJyPfBEKR6yy66kt8OUtNuetTiBPaikmyabehacDYW1BgYYfMx8A/CFIm4lLyPtC6Jn7aYE9Q
	vt2z+Sngm6mt5rwPZ93hw3MpxQY/hRLDS37ywz44Y0j0HhBctTSMRkz9FvrP5EgVViRjh3mQrkJ
	p/KuiP01TBmVO0icRRsvHcEd+vIhIVxNjgjkUf98JVz+aKb90=
X-Received: by 2002:a2e:9a14:0:b0:39a:f5f7:2e0d with SMTP id 38308e7fff4ca-39eb27c9782mr8935551fa.16.1784314251292;
        Fri, 17 Jul 2026 11:50:51 -0700 (PDT)
Received: from MSI-LINUX.kielce.vectranet.pl ([2a02:2a40:27ec:2900:9d0c:8f55:3d10:318d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39eb4fd4ba2sm3431721fa.24.2026.07.17.11.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 11:50:49 -0700 (PDT)
From: Jakub Szczudlo <jakubszczudlo40@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	marcelo.schmitt@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mike.looijmans@topic.nl,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jorge.marques@analog.com,
	antoniu.miclaus@analog.com,
	mazziesaccount@gmail.com,
	jishnu.prakash@oss.qualcomm.com,
	duje@dujemihanovic.xyz,
	wens@kernel.org,
	sakari.ailus@linux.intel.com,
	linusw@kernel.org,
	Jakub Szczudlo <jakubszczudlo40@gmail.com>
Subject: [PATCH v8 0/3] iio: adc: ti-ads1100: Add support for TI ADS1110 to ti-ads1100 driver
Date: Fri, 17 Jul 2026 20:50:30 +0200
Message-ID: <20260717185033.246580-1-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the TI ADS1110 to the existing ADS1100 ADC IIO driver.
The ADS1110 is pin-to-pin compatible with the ADS1100 while providing
higher resolution and an internal voltage reference. This patch series
extends driver support for ADS1110, updates device tree bindings and
Kconfig text, and improves the overall hardware description for the
TI ADS1100 family.

Tested on: Raspberry pi 3b+ with 7.0 stable kernel

---
V7 -> V8:
- fix logic error in ads1100_new_data_is_ready, on ads1110 it will wait for new conversion, in
  ads1100 it will just wait for some time because ST/BSY register always reads 1 there
- change ads_config to chip_info
- fail in i2c_get_match_data will return -ENODATA instead of EINVAL
- make returning value in ads1100_poll_data_ready more readable
- move i2c_get_match_data higher in device probe function so all indio_dev will be in the same 
  place
- Link to v7: https://lore.kernel.org/linux-iio/20260714194717.596193-1-jakubszczudlo40@gmail.com/
V6 -> V7:
- checking for negative value returned from get_vref_millivolts and taking value only in probe
  will be added in the next patchset to be easier to review
- change ads1100_new_data_not_ready to ads1100_new_data_is_ready and returning int to be able to 
  return error when i2c read fails
- doesn't add checking for short read as i2c_master_recv can return count of bytes read or negative 
  error code, so checking for short read is not needed
- change from MSPS to SPS in Kconfig help text
- set iio_dev->name after taking device name from device tree in third patch to be more generic 
  and not only for ads1110
- fix typo in ads1100_get_vref_millivolts
- correct typos in commit messages and add ti-ads1100: in subject line
- Link to v6: https://lore.kernel.org/linux-iio/20260711184414.1013686-1-jakubszczudlo40@gmail.com/

V5 -> V6:
- correct for loop so it will be more readible and return error when iterator matches array size
- fix SI unit letter size
- correct using available_data_rate_hz array when using ads1110
- bring cast to char* back
- Link to v5: https://lore.kernel.org/linux-iio/20260628194341.66752-1-jakubszczudlo40@gmail.com/

V4 -> V5:
- Correct pm macros to be more generic
- fix variables ordering in new functions
- delete unnecessary casts
- add unit to variable names
- change array name so it will sound as array not variable
- correct get_vref_milivolts so it will check if not negative value returned
- delete unnecessary short read check in i2c receive
- Link to v4: https://lore.kernel.org/linux-iio/20260622221550.374235-1-jakubszczudlo40@gmail.com/

V3 -> V4:
- make fixes patch the first change in the series
- correct error handling when short read
- use ACQUIRE macros from pm_runtime.h in new functions
- Link to v3: https://lore.kernel.org/linux-iio/20260613190957.654798-1-jakubszczudlo40@gmail.com/

V2 -> V3:
- clean patch from unreleated changes
- divide adding support for ads1110 into separate patch
- add missing changelog
- Link to v2: https://lore.kernel.org/linux-iio/20260607183542.368184-1-jakubszczudlo40@gmail.com/

V1 -> V2:
- go from creating new driver to extending ADS1100 driver to support ADS1110
- Link to v1: https://lore.kernel.org/linux-iio/20260527164312.355729-1-jakubszczudlo40@gmail.com/

Jakub Szczudlo (3):
  iio: adc: ti-ads1100: Fix incorrect reading when datarate changed in
    single mode
  dt-bindings: iio: adc: ti,ads1100: add support for ADS1110
  iio: adc: ti-ads1100: Add ti-ads1110 support to  ti-ads1100 driver

 .../bindings/iio/adc/ti,ads1100.yaml          |  10 +-
 drivers/iio/adc/Kconfig                       |   9 +-
 drivers/iio/adc/ti-ads1100.c                  | 154 +++++++++++++++---
 3 files changed, 143 insertions(+), 30 deletions(-)

-- 
2.47.3

