Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486A742A141
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298724; cv=none; b=Rlu9vAPnFPehn0bz4QKrsJOaK6x6lZ6gq9RnXFE9SMq9mWsyqp9hScJIYHOBX/OmuXF/zn4lY+DUMaiTy72p23IBhWU103SUOHbvAdLYGnfvt6XnBUOy7NJ7gKBOh+7tNPiPIXCGw4KP9w0rV6QEP8hFVch3O3c8Z6RbDgVL/yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298724; c=relaxed/simple;
	bh=bA8lkVa6MhT21HmHeSNZxVJnTSK1jb7w+kbz7hqzzyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EqHOSFUj53T/VuVE811sunKdhe71L6bCQ4AEuf55SA9bxf6eJZ7Veu3VyXKL8w3Svn9ZLQz1d6tfswWn8VT9S89+zFqrFkRbUZt9eNrur2lJoCy+3mkhQpv2KitKHBI9gPfiuAysiR5s/kG5lAAp9uXLWCIiVS6s2CJRuD+SyV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=eDKtOoyf; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="eDKtOoyf"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954dff6536so947885e9.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784298719; x=1784903519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvg1048boO0grk708g2we8TSqKA9YID/DFGl64E7ytM=;
        b=eDKtOoyfJksHivnmog+9r+gsR3Z+U0ejSxhjkQBJ5qoPlkmEL4CYlq6g585t7SEePl
         rDtfkmp+Mb/LMOaQEFj4CzhuPT7FO5BJbRVBexnnyJD1j+rcG7UyD0uj4j3a2JZzZCyc
         ziJhtRft+z/J9BWXwv76SMWZrFc4VYXvRsrTmlpU0lZRAEG9Ix8xTakR0Dm0cFA4Rbhi
         xMsyehcqmGk0L0BCSKm6/PLSgjHsyUaVQOaA0y+Psxd+ERWXjXZNVE1h+vF2AICUurYy
         g3nxjn8opXElEq8BdN04bncqVwErmFgeUBPmhCiDu+Sa4I0uPEwiOQ2glAfLiz5PqGw0
         9gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298719; x=1784903519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvg1048boO0grk708g2we8TSqKA9YID/DFGl64E7ytM=;
        b=MinhOZ8fUP5ozFtaUrbVdaU1QQB+R8wU4M5hwoRW1B+kkc7uV4Y3jkMOrsIhKEyHdM
         ZRVP++blCGHWFCZTZfOC9Lt9lg0etvT6payrBxrnwdZTufxhBPSA7QErxyFlZNq9rdoX
         S3SIBGfrPiHYTzlunCWKd+cgZeyWCqGMBkiRgvpftvN+6CglKb+4dzVP0yGD7Vb3zltr
         5NunD7uE6BVuCXB2/4weqc4Y7l3pnpRCY26X6XdlqNr1BOmNfqfBGIF+LCliRNXw3t8E
         alUpdCObdVI1N+Z61jplj7CnsezvzoGw/YYwQp5I5qKFsfFUKc0yHpIrLSKYCLJ05Lfy
         J+Zw==
X-Gm-Message-State: AOJu0YxPrbSGyyf/u/Ux15sGbe4v8tiEWptQ8J5Uv7Fj6TK9lkZAp0ty
	keJU3MFZEDUdOg+p+V1sDR6QbOOsG5WHyzN2RKJ99jvvyYAwa7w7bpsWfYTGoB4Cr+4=
X-Gm-Gg: AfdE7cl03Uxkh5HGXgla8YiTnuyWKMBQPPFWcMMJ2KLl32ZHdHtSoBuikE58D6rVqTC
	oer5TvCX3A7ZXpoYydr0X2DcRSbnSFQzFw/zO/UTrDNjmhvhHkcmQR0BycMFUc6sy8jFoyxChT9
	neEuQoB2BE/B7fPfqsAydWU2Uzbyg/7PGdclnwDPeFpuM0GAFJZkoAi9kvxFZui0xhWuptyEHnr
	so8WTkGgIlfnQrMSz+CWOdnovuMPZwZTTAZnpj2gWunvpy/ZCp6IeIbOw+JB1FioZ0vAgWHcRQL
	zDc27u2Nauhd7RaJ1mPnTgfwHRuoUg4FI8xzP6Xfv5JBxyzme8mvo8HY36rRmBivFILXwFw1xuk
	Kf/iSmW1Wkmd+3H68jczLNCawqbCRYpfLdNSKGJa8M3E5OSpiDgBVOBE9NbF6DmsjCwGf+2O+L/
	NkrWOlVnwyxwk=
X-Received: by 2002:a05:600c:4687:b0:495:4e1d:82e6 with SMTP id 5b1f17b1804b1-4954e1d837bmr5313105e9.36.1784298719527;
        Fri, 17 Jul 2026 07:31:59 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8e22:8a15:f33f:dc60])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49549a359a6sm55783625e9.1.2026.07.17.07.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:31:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 17 Jul 2026 16:31:25 +0200
Subject: [PATCH v4 3/5] mfd: axp20x: Constify axp313 and axp717 cells
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-axp318-regulator-v4-3-50aff97084dd@baylibre.com>
References: <20260717-axp318-regulator-v4-0-50aff97084dd@baylibre.com>
In-Reply-To: <20260717-axp318-regulator-v4-0-50aff97084dd@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=bA8lkVa6MhT21HmHeSNZxVJnTSK1jb7w+kbz7hqzzyw=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqWjzQ4Xzl9JkmP2zOxXMetVyOdlQ/qdYj4kOJ2
 JPxUFa9njOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCalo80AAKCRDm/A8cN/La
 hYBFD/9qMvJwd2gJeWMEqujSohQ4ebJc363dsM7Y4Hy2GxQiqig4vn4R2bP3J9nucE2uB9Dac5p
 2jCJlO8gKjLfxpGvDeCmAxXYf3kF45tXbZ26nNZUZtXWqUneaijhaei37FDS24uhLALG3QkDHgv
 7U7/IFSXeCwoMqaJmU7mNL5xE3aDBqprLfnKavVT7Zb76hsqrJim/tYPHZv7c8v2P+ge8cvb6vy
 alV7pgR6D2C1zD0QmF0EqLCfJkrBlwOJgheu8jgcdyjF3T6nOsP6uXLwKJeaF5IR1lzWtSArxf4
 55fei/Qd7z6D77jrvutoY7i5MFEoEezsCenTqjwLz+xk02Jkj9Z3KSBtZHKwGtNCjeUcQBcs/i/
 p+k2hhTDmiajq9BsxXcQHLssg8OpfznjOAOmZ5dkp1o2HrZ71CXc41CUvi8Kg9oDdwXQ6KTU4/P
 OqTgcN2TTLd16QS0MYloQ9IJMeCBIpXvtRNCZv1RvS+6h0E1O2MSsFgGeyxK1DCA86ep6525lGv
 0fU1q4vUn53GdcHJ/Jk6SfvCyWV4pKc8wUVL0zi372Ev7vy2X3ndSUMUWVLnY4r05mUoYaJ8cmr
 5EFlwP63frOvyNGSMQNq4cvddz9U2KkFonGKVsaUqIMkOgNx1KU+30R4tkKZyXu5Z8FIxXwIMPY
 ePFAirRzg0Hu8sg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

mfd_cells array should generally be const and there does not seem to be
anything against it for the axp313 and axp717.

Constify the mfd_cells array for the axp313 and axp717 to be consitent
with the other supported chips

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mfd/axp20x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index c8aeebd01bbc..2bbe73afff43 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1123,7 +1123,7 @@ static const struct mfd_cell axp152_cells[] = {
 	},
 };
 
-static struct mfd_cell axp313a_cells[] = {
+static const struct mfd_cell axp313a_cells[] = {
 	/* AXP323 is sometimes paired with AXP717 as sub-PMIC */
 	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
 	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
@@ -1133,7 +1133,7 @@ static const struct mfd_cell axp318_cells[] = {
 	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
 };
 
-static struct mfd_cell axp717_cells[] = {
+static const struct mfd_cell axp717_cells[] = {
 	MFD_CELL_NAME("axp20x-regulator"),
 	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),
 	MFD_CELL_OF("axp717-adc",

-- 
2.47.3

