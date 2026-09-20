Received: from mail-oa2-f0.google.com (mail-oa2-f0.google.com [74.125.231.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98DD3D6CD9
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789882331; cv=none; b=DcgL3yEk8zzFL43vLP1YvTeUaBwr9GXbS+KzqF4sg8UwPY7NYvfka0pKnteJBb9nuiM8AethqNXwoVlXBoMJT49Mjmef4cl8rr5grTEdx/xmso1Y7fVvVqVaQB1V0zp4Dk+KzqyhNL1JPGqlkKEJeWi2bnBnK780k+ovEJI6IeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789882331; c=relaxed/simple;
	bh=1otP8UYV9viBZZ+f8NwjITACufQDeLB/kdjE9I9R9IM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pZtLCj8LsC0vtSSJepzAZNnGGfNwYrs7fi7RuR7DgXYRM5f5R1iqJnVj4xkztjroNIKqd6zEvQI4ITdrmUXu5tokuw2yfUVapHUUoHhVtDfLnrXAKyfNsICs3jHBJKPaFVFag0bv2hA+EExth/Y2iPvHUWiAXsF1FJP5q7tb2WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEchglrN; arc=none smtp.client-ip=74.125.231.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEchglrN"
Received: by mail-oa2-f0.google.com with SMTP id 586e51a60fabf-44cdbcd53b8so260971fac.0
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 22:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789882328; x=1790487128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=cEchglrNuJlLC45J60P4tJ6kTKISj+g7r23WamFMMTF/k9fbbVFvGI0e57s5YzuAAk
         Aeoge6jiTvuBjdAZYLL2LIE53huRy1BteP0fdAuD8CH1oRS0xqvzh5UKrTD5ZIoBFw82
         HVtodRMIIimS5nnmf1DvfikNl9WQxLcVsZBkWvRrdVEPu+WdVww73ygeZKyoNeQrHo1P
         GihHDvUOMtJpIPhLJhasaL4rrC8QUVbVyOLnI7QuRN43fD4A/XrM5inMtJeBtY4BpxUp
         raa4pJatHTqzo5/nRJ0Cp1u0cYuGxQu6Afv7IY/aG8QbP1CYmRFUFSce+/4aB2MYihZU
         5raA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789882328; x=1790487128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=vyKAn8yBCsos6vOEGH9ruPfZkH8HPfs/Uq0yLFDAd/OZ4TXNfcvn0SxQBolZGJ5yq9
         btUIH0eZrBkUDjwKaHrfVcid+lQT8q3k3ZYxgPC+kmBkY7e+qiLNCeCAOrfrq3LQ2cB7
         iFh4Fw9Wzh8V+ByCUbSUR+kwglBaCPFjDafhvqvIXmTl4oz/fUXNMxSkqGXugx0PsdKm
         kGgPvmwbE8ujNEqF2gaFrCtXu/1NEIqAUQaFJgtl85HyNHuQx71Ymi1HAFMyT+r86oSv
         WzFrifsbIN1646ieQ2ySaaLcJSfwygVie1TmN2eA2PtsEQWwlF1hL0LjwNtYQBX9qy6f
         MckA==
X-Forwarded-Encrypted: i=1; AKwUvByeSrFeXcH7OuSaKh13q7HvwPSWJFow+0eOUN5jHIGsTKEtxaupzz/iU6U3L7sjvbcx1xTHB1Z3QHUs@vger.kernel.org
X-Gm-Message-State: AFuF++npdzjH+gpPPLoPKDhDKC6pSzqvwPgzpIAKLSvN48FyAaTMkZq0
	HBnKb7gGMpLfq3kE1m3Kw2zgY6dhmAdB2lkOQd29cIbPvIXt/sIDEku+
X-Gm-Gg: AYBFou1GfnevaOI/cMDsHvWqozB7puf/McxwrHU0xq4v9hu85GLq5hCY0dxOrAfKjYM
	yRoV2544EMmu1mKrnQYYZCnk5CSONOdYJzBi2fwGbvBID+dB6t1L/8Swwe/JDnKS/HZJfCfYgVm
	8FvdTAG9wCnTzzyxy7e2N2vpHt41x00tqwIwrnQEo2xDUt5GrFCFOdBuUY3v7KftJ/JHP2K/OEC
	XuDr4UnNVetFo1554XvEuGg6t63Ef4ZTnXlf0yqkCp7a7GFi0pZNNdxtVIkkFSTT092m70oGhe9
	E+CaEgpbBcCApe5I+pVOFOWKkFEOtEK8qZMGAYZbs7VRbi4fuov0JFlw27tsNTKH67ZoAZ3qSU5
	X7x3lRi0VP03HdZ6aiVJYnRk0LOe/p+ebNpcVJcapi8m6SbYjK+eV5kW6j9gGxtoTz+AmmbEX1K
	JtRMYidyKPBcKe5CO7tigXVRrBBh9HZhmMGxHyJdU5tkn+fBtCvvzK3VidtXySNmj1WQ==
X-Received: by 2002:a05:6820:818a:b0:6b7:8396:f3d6 with SMTP id 006d021491bc7-6ca9ce4cfcdmr7217118eaf.56.1789882327657;
        Sat, 19 Sep 2026 22:32:07 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd3541f07fsm5007319eaf.10.2026.09.19.22.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 22:32:06 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 20 Sep 2026 00:31:53 -0500
Subject: [PATCH v3 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-3-c00edacbee64@gmail.com>
References: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
In-Reply-To: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789882316; l=822;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=1otP8UYV9viBZZ+f8NwjITACufQDeLB/kdjE9I9R9IM=;
 b=9u9PT8EgMhT2CU7ynGTjZXDCJlhMILqp7KosTLFKUyKBrbzaMyv7T6YSoFBmQnoUOssaMtNEq
 wq0GEJz7dXDAC/rXFbTt3HuxJH3iGRrtfTsh2kyNLr/fEKdyaxtfq/X
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
devices array to allow the corresponding driver to probe using compatible
string.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/mfd/mt6397-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 9ec951996588..5d5f816492aa 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -261,6 +261,9 @@ static const struct mfd_cell mt6359_devs[] = {
 
 static const struct mfd_cell mt6397_devs[] = {
 	{
+		.name = "mt6397-auxadc",
+		.of_compatible = "mediatek,mt6397-auxadc",
+	}, {
 		.name = "mt6397-rtc",
 		.num_resources = ARRAY_SIZE(mt6397_rtc_resources),
 		.resources = mt6397_rtc_resources,

-- 
2.55.0

