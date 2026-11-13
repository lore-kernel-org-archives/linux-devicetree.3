Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586731;
	b=S/34ddo1wXfQFUPvwCDzDhAd8WBiPLR99S5EfGKZP0jHYxKDp3uxNYU3Xsu05AIhw/UB
	 H4KoZPrp6UbU96SbHN2ngkeWD4li4z32bdMo5KXqvOTqhPZDLw7eN3ES0hY7EUZ9RjZja
	 A1kKFwqcYrcW98JKw4J415RiaWUCJivr5Aa09c+W2c9cQtBPXoy16LSv9I8WC32g9A1I8
	 NyAxI2SgppqWP/DTdp7NuC/BOgf8Aq0I37iQ1wzvED16HrqNmyx6YZR4QGOGnzk5eN7ZU
	 MBMI6lZ83qVh87IitKhJkQY//7cZYG4praIUO5tW0d1r8sj8RldjbGxyxft1xGrjaqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HR+1DPCwhbHFYST4j7neRHEcgr2daXj0B9N2zzcfMUo=;
	b=oCIeiBun3RaE8NJ0jIwONlSZuS4vEGzelRokmjf8RPQosTEKKQ7TYNo3dbx/K54LPuCa
	 1+NoSl0MUvoDwJg2wWGdvDQFKo/UMPEztx3Dhsm0ht+bp1Kd2mBcENO6XqInC5BRKblY2
	 BjYempCxzM+dGMhfAEiiHN287DhkzJQC0X5/Y2+rIcpImSiaW4KNqcKgFzG5w53EWdHaJ
	 Si1npLrS1Fddbnot5RHZpJ4L7N7iiEAF7sXF2+GjLyQ+4h9LlHU42h8X1CfLLF8lyQepy
	 n0R4LZiug/3yKUqhpi+o+qnNbVspfKDvU8GsL/UsKSgsnuXrv7tx9v+3PxoEJgYZveg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M9UjRtUD;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618786070FCE
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 618786070FCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M9UjRtUD
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d28f75d62so294889566b.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586730; x=1795191530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HR+1DPCwhbHFYST4j7neRHEcgr2daXj0B9N2zzcfMUo=;
        b=M9UjRtUD4pPPLVx2rlfKtPnYulHOmQSBlzv65hZNd5XJrP8uTSeIG482GQPfDk2hI7
         hOaz8LyLCg+QxHlOolUeh0iqb+6iSi3cV/qtjXjXepsA7nflo5i6k4xzG6Y2p7yay+dK
         umAZt5M7Kq7R8GyhiDHbQFd60NUsxnASXTPBR0SFhakXg7GxXJseLT33OIDoFf/DapK+
         gvcGIO7iugM78r3VU+QwMPYwEBBCSpNdnizDlMF5THvTY+DWpuvTqjJKsCepIWre8yBt
         AoKrHK2cMdqTBtSQYRo2Ca+b1+AdFUx+IjKahNuJV+3QDeWAzd2TeBOTh98kGKp4wmRi
         OVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586730; x=1795191530;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HR+1DPCwhbHFYST4j7neRHEcgr2daXj0B9N2zzcfMUo=;
        b=1nrwQDK2PTuCG95pcYTM0ggl4pwvS2jUPxYVZ8mFcF0Xk7jLKIgvs0o8zcZzybhEYP
         mNzpwA7LKPEJMi2L7Oar2Ao9IFbmN8KDtsgJHF5fMTUUkVdyD8Xn0GYcZb7QniHHb9p/
         rCPJ8cryBEzrBjwbckl+0lHO/kSU3X4feNfDJUzWNUCiQLyZbGYfa2UmJvQm/jOvNqaz
         r6EMd9WL7cMdPqTlBAzO6/pnIzjZt92ggsXPGrhJ+RMZ/ZEwYc8ni25gfwEp4vmCgq3C
         McaGe7r3ie5sPuX772YEEzkW/0N1GQTpLxTAXC9Gx7YYedv9tf2d8tcBUN5BsCe6b6fI
         /PTA==
X-Forwarded-Encrypted: i=1; AL+hErEAzPOm/axK3PQKXImnW9i41Tt20oj07WVzB5C75xmeZz2yLhqsr5lf3R8jxuiEg2vE6i+s3emtSA5k@vger.kernel.org
X-Gm-Message-State: APuU4Z82syIt+/jaDnC+ipe94gfBgpiTjBX0Wo8AvBcGYX1eCn6/zvaY
	MiMIDq3RiGRONw5DrLxs11PMzp07GaPpxfuYQ24COFPCTrj9opvkfgJq
X-Gm-Gg: AYBFou1vthYBQPPoWuUMrSS/gFUN+D+xCH6A8O98JFX0aHiuwf8o2dN40ycFwjL+EWY
	ItFDaaMnGQj0FcwqbgD4dYGP72qRYjZP9tAVj1R5tSqDtvQryI1Fa06RkIDGon3ZxSXTKAssLzy
	GyemHzE2NlkuoxeqaKyNzJHBWLHcnOC9qKpKaPeXj0zAENr7nruBBTm2Xz7K/HuK87COWVCBxwN
	MEI+MpXMZp0LH8rVs8xdTV7RfA3i9Pooi/69ZybQBbSM5yStbaUr65sZixOYvK+BU0UXN6qSLA3
	JUVyOlaHb8XuVL4Vi7QrYUzBoNYWDAL2XwSNl9RceE4fgPkbA+8DAt00HeA3ymWYHlvKCSruper
	okISpmzVtla3uwMHSq2GjtsuuSdCJJnzMVHpGfbx1hZR9uzjzxdxcQX9+YL/t0z+U3AT3XkQWUf
	b7MTz3p1mfETlhY5A/1pnGL++0WT50uosei1JKKEtq5mSZbC49S+VXNx+WUjtW0GdssBDjY9Uwd
	8jxD28AYicKXsPc2Ua7j4JAAPjXE9Oayi/gRNI/wJoo9cl78GI2NuLg0IFf1mDzOGJNndhfENWP
	cw2byae/If3SLdvvdpUbUQTo1QUFcVIlsR3E7BJOmrPmCMMrWVumv/ggVKveKpCgC0maByxyXjr
	bhpUQHRjQ4A==
X-Received: by 2002:a17:907:2d1e:b0:c4d:28ba:f221 with SMTP id a640c23a62f3a-c50963d46dfmr252539966b.42.1794586729694;
        Fri, 13 Nov 2026 08:18:49 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:49 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 05/10] media: tegra-video: vi: Use entity function to check subdev type
Date: Fri, 13 Nov 2026 18:18:14 +0200
Message-ID: <20261113161819.36847-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The tegra_channel_get_remote_source_subdev() function relies on pad flags
to terminate the search for the initial sensor. This causes it to iterate
through devices that should be bypassed—for example, the pixel array (PA)
of the mt9m114, where the internal image signal processor (IFP) should be
the initial source instead. Switch to checking entity->function for a
sensor or ISP to terminate the search.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/platform/nvidia/tegra-video/vi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index a96ef26af89eb..5c649e3162fe3 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -189,13 +189,12 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
 
 	entity = &subdev->entity;
 
-	pad = &subdev->entity.pads[0];
-	while (!(pad->flags & MEDIA_PAD_FL_SOURCE)) {
+	while (entity->function != MEDIA_ENT_F_PROC_VIDEO_ISP &&
+	       entity->function != MEDIA_ENT_F_CAM_SENSOR) {
 		pad = media_entity_remote_source_pad_unique(entity);
 		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
 			break;
 		entity = pad->entity;
-		pad = &entity->pads[0];
 		subdev = media_entity_to_v4l2_subdev(entity);
 	}
 
-- 
2.53.0

