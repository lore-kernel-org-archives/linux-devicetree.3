Received: from mail-qk2-f8.google.com (mail-qk2-f8.google.com [74.125.230.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135174FC358
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 20:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629056; cv=none; b=W9AXLY1zh2gdGuJ8Lw3Jqv9PYk8SjANmPIE8jzPnCKed928oQFqLxyVmlBtQDHka9omkn5nqACQdFbEv99KaHYKqcIL1PLje8VF8nX2LbYeDbIEFRq7QLS5L9xRniJkaaADH63zbs6CsLZR021geDqFY1wJmhWb/K9MBclnS3As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629056; c=relaxed/simple;
	bh=7RoUzDOZY1QDhkSdG9ZG4g/IuQvy7fWK/zAReNc1Fzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qenBFF5qZC60AO3v129hnVYjy319TiSS2ifXjuce35lTsDHZyhvQU4aQOKRmGpQIslWVYgIl+O2TjsIwe1rBYi48CZ399BMCxWimFeHG85K+XQ7M3VVCUrsXicBPy4/1p93WaLRElVFk1gTV04VFMsFL5Y07wK8ZbLGENZurXH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edKN1scn; arc=none smtp.client-ip=74.125.230.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edKN1scn"
Received: by mail-qk2-f8.google.com with SMTP id d75a77b69052e-530e2f0c0a8so39985971cf.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 13:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790629054; x=1791233854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VERUOQXBp5L44ineuoMQ6cH79KBHk57qqtJbh8GU1Ow=;
        b=edKN1scn1pXm5JSWlBRsSn8T6B4V31ST9jTE/kSDwYX+AWWcog8zrl0tUj6j7prLEj
         MkyptZb3JlX+djoHnJl4DHjjd+2NmZykyV0W4L0dzA8vAktcIvYz4RHIv+Zq7eWAiUmA
         wLb61EytYn9ak4xWZbnD87poZCVwYrsQ3hBM5Vu10PctXw7PiZKv1h5A2Re20geu8zBk
         qCoC4kB8nQf7VaF74EX813Kh+9/VDO0KnYPmO6FjXgB7ls1vWA026yncfEl2/eIFFrea
         JCwh5MnH0/XgdlKSzoC+yESk5nsJ4CDGsM5ujYZfaKbNt4tsDW12jvvC5MJ0eaFaPvWx
         CV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790629054; x=1791233854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VERUOQXBp5L44ineuoMQ6cH79KBHk57qqtJbh8GU1Ow=;
        b=Bkvd8CInaJLd4Tz2pcdZ4HUYGVVcfiH4Ac2YVAY+3/GQJpyhu1x7Xj7fkRZrxfTG8b
         54y4kjsDlidoszpGEE4rRBGU6osTIcMRXzJVTbxtmR8I9z8iGyTd4oR47G6N10q05JxH
         6nfOInoucEglRQdgOpYRH/0T0ZMqtS3GsvAsqZh1vB6dEa2t1G/1wdhU8wBRqq+CKgtk
         c3IC63WHwKm6rV67DLTy1gVlOIRb7pfMd9Ps+yBwpPXVQeJOwGxdUWv3fRyUcOKfPir0
         FBeVt8OUjLK5W94o3i0MwWn20qRR8tLi5oXHMzOd/7oiLLQm7qv76+37Mf0KwmOqefCc
         yAbg==
X-Forwarded-Encrypted: i=1; AKwUvBzO9JeTFuGS2VwEz+D5VfdCL5ZnrySUvdzEO8mFRyitKlVKpQ5Qb/j7hqrlhykqJBUp0VKIOpMxiLki@vger.kernel.org
X-Gm-Message-State: AFuF++ni8ehZjGIU/kVcOrmQ8tgRMlmHIQj5QbTwibuREdHR9cf54vWf
	vdXueTJbLkaNyPZsmP+BN6s4eozKXHoUUXK7lqrY/wW6RdTpmp0tS7Ey
X-Gm-Gg: AYBFou1BIE6Sr0J3VUpWbZwj+XqGQ8Al8wa1Vb5v6jgddIyu0AsGxxKKuRvo1Jwsopc
	G/u88HT63hsnOvICl6MDjQq3tZHTBsOIpZh2ftiBTBu/0aI7Vl7LK37smX7ihRdT4yZQazhHU3U
	09rxtfRZDtr5KEu7zMC4Rbtfv2YrVu/J9KCGR7zwuZEFgngc5toxN0pjFdaGuy2HcUvmfSSDIem
	wTjgtuRXWEvJuYUR9obowYfFw3Ddm0gPC9EI24PtRHoPV1Qq3JGNym7lyT7FbAGVNJpyGfGio6E
	3ZTiJErFK08ez6gIeShLAqWjKngx5PfzqJ4oCjX0yEhyVPqwXbhHwbFZ4938+s2BDJ8VDtadqwI
	1U3gV/Zl7zxA7Use42DFiWFzNBFzSiNos2IgIgrOPU3fjbnz2CtJliBibqZgBbvq/IHsC1YtNMH
	eEm0IS+wlw6yMoDyGX8O0Lry2ez4AiqvEzX6vYfBFE3/JZaIprGeu7o5iqEG6To2blDyZ70L+k0
	wh0rqw1d6WjVZRBBiN1m73NdHO987dUXf760JJkcU+FhvoQI+HgGJN9olyP94tu7VFjbrL8bCA=
X-Received: by 2002:a05:622a:13d1:b0:530:e343:b65a with SMTP id d75a77b69052e-5330b6ac001mr253823481cf.51.1790629054051;
        Mon, 28 Sep 2026 13:57:34 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533223c6d82sm71443421cf.21.2026.09.28.13.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:57:33 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 28 Sep 2026 15:57:21 -0500
Subject: [PATCH v4 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-3-23533a0d30e3@gmail.com>
References: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com>
In-Reply-To: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790629044; l=905;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=7RoUzDOZY1QDhkSdG9ZG4g/IuQvy7fWK/zAReNc1Fzk=;
 b=A6AqE7eu3ncyQ70or985e3ODrK8FHn79n9oI/zJvG4E8nupeafb2sik3BBKjwJARUxbfOYIEG
 cbE3E3gNJVsBZowBHGPEj6IcOlHtEOy4pJejW+IVae1ULrZIHdD/kjd
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
devices array to allow the corresponding driver to probe using compatible
string.

Assisted-by: LLM
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

