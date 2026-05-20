Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568C754768
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779292554; cv=none; b=VRtiZdeWZ09Gnjzsp8qS2mR314rLdVOFlpupdRYF1o/ubYjT6MX7FOeq2P4s4bY3bU6DBZRqggkekYknaN3Qcz3NsRT5jsJ7yVDFUu2ReSAHllnyC8VuC4FAZbc7Yls2TSJrEinpfbmWIYRZtDtQaFtCQaSPOMbwpJI61UQKKa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779292554; c=relaxed/simple;
	bh=xObQCOiN0w+zUIIotJQUzrX+GI6lzkrYiMyhdIqPchs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ad2V51yj81e400wjeqiyDenHhhim1EEqH1U0TRdpS3B8Pa45nir2BfUUHHeKrjKIzvmxTnnG4NYZyXtCY7lDmUYue4w2dv2l75O8VnazK0hoTQky0dsdhenMN7vLt06Pch0jBb/RJ6yncdeN1agUPzYTnCK8UmTucZLHeGlJhio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/ry8pf9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/ry8pf9"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48d146705b4so56077665e9.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292549; x=1779897349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GV5z0VH3S60eKaBNh37Ayp3vpCM7R2YdmjwXSt3Qs84=;
        b=j/ry8pf9D2wyaWwdx5UUKrTNiuH/vuTTnRGIYiSAhv+cfgsZoCfkvDFVixh+bMNwtG
         2iAvEtPLgWoedHXJ/h1YMlWWtLGGjrctel3HjRX++4V82F3qprmKxER5W5Xtl5E1P+Kl
         cPKGW7QG6hIJqaZdN6WtrgPKUn4FYdprfPObH/flFxsP8ltM6ta444+OKZMjj7m8bDJk
         IwIJD23EdjDdpiZlSOxRQrZJkhkRU85FFNMnin92imZprpXbs11QWhDsODe+7wI05LRY
         R7je0B0t6X+WnBEVsHw9gGIYlBH3sMbBB5gWeuBMpJCZJy648SeVYn/+GGiK2mXn5Obv
         SXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292549; x=1779897349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GV5z0VH3S60eKaBNh37Ayp3vpCM7R2YdmjwXSt3Qs84=;
        b=VOc1D9ZOhkjtAl3uWJenWLrJGc7cZ9z2kOtgFt3BgezvdVm0SFhzrdFxk5+cbOQvAp
         X5rajLrLcjcGtJxd2FCHZFgbNLauGW3SbIIzOZCo2wWYcGmVU9TupTBRhRxsFuuBKsS3
         aitwF8aG/7bGy246EVKZwlbU/FfhiwLwldjUCNCX+Xpy4FWbMeyhNHvpADWp1wQK4wO4
         rvEbbGUEWboQYEbln/E0JaS3mkKVGR6Dtgvd27z/t9oZxB9RDn39KeEbJbDkFSBpbevW
         oubXkXY72ozBXx7oNbyGv4Hc1TfLz/Hxu9+nU4FJQdMRr5wlPDUhnXP4duA88Jwo6d+6
         GmDA==
X-Forwarded-Encrypted: i=1; AFNElJ/C6ojuZuEO0e2WI364LG4em94PWlkKr2vBkbQTC3gBnQOF5CVE1NdLand2XKqCgILYhCMPxYNO6quO@vger.kernel.org
X-Gm-Message-State: AOJu0YyRZ4Y6dAViYvmuf+QSnryUXBj7UZgJJXWzeDKOXF+1chpVITfb
	VVhwFC7F6f7Acx8dH2+lxa1lQdGoBqw71H7QVEi/W4xW4KWFJlRYBj+z
X-Gm-Gg: Acq92OH5V3z1JhIjAvEUnattduzIJl6kTA0iTAzktTNsK4i3cBW59NSZ6A8tA78M+oA
	VUJtFaoSOzAhs1pOVdsb2rvZWWSHBpNkrIBFHW+eY+7d9vnhyGVmF/AdUxI1Q1SHwTxlA7jfPbl
	4DvPkEUzuMR2FfhlwbFsP9hBeSglJCQE1/2WdridygbHY0UPjUphRO5pXa6ZqYWn1p99538mjHV
	Qu6ZZULQndZuh2P6kuKp1eNQBSjoQR4hWff+bHrjD2HjA2R/nD6D6vhCXysjJJQCIOzUwZfDdxE
	CWZhTGQczmaeH3oKNgVCXNX2XVh8vbgN9HApnQEg//xqlNKbOkn46aBggnXTsV+CDZpCJA7idYB
	ULkzyeEVjz9juQkGhxOhCL7p7x56GkoxXT5TfRsfnqbG56gzdA1Tc5fXfHWIOMpVAqaYtQZBEBh
	9WbIw6iEIF1mLxigTXtIV41B5BWO7/fIyX/WGd45bkNEn8w3zT2zSoZnoYNK++gFw=
X-Received: by 2002:a05:600c:3b21:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-48fe6514dd6mr361015365e9.24.1779292549009;
        Wed, 20 May 2026 08:55:49 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fed253f93sm132123215e9.16.2026.05.20.08.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:55:48 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v5 1/7] thermal/drivers: airoha: fix copy paste error on clamp_t low temp
Date: Wed, 20 May 2026 17:55:14 +0200
Message-ID: <20260520155525.22239-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520155525.22239-1-ansuelsmth@gmail.com>
References: <20260520155525.22239-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In airoha_thermal_set_trips, there is a copy paste error on clamping the
value for the low trip temp point. Fix it to the correct value and actually
clamp for the low variable.

Fixes: 42de37f40e1b ("thermal/drivers: Add support for Airoha EN7581 thermal sensor")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/thermal/airoha_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_thermal.c
index b9fd6bfc88e5..439aa011b75c 100644
--- a/drivers/thermal/airoha_thermal.c
+++ b/drivers/thermal/airoha_thermal.c
@@ -273,7 +273,7 @@ static int airoha_thermal_set_trips(struct thermal_zone_device *tz, int low,
 
 	if (low != -INT_MAX) {
 		/* Validate low and clamp it to a supported value */
-		low = clamp_t(int, high, RAW_TO_TEMP(priv, 0),
+		low = clamp_t(int, low, RAW_TO_TEMP(priv, 0),
 			      RAW_TO_TEMP(priv, FIELD_MAX(EN7581_DOUT_TADC_MASK)));
 
 		/* We offset the low temp of 1°C to trigger correct event */
-- 
2.53.0

