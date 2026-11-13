Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586730;
	b=idHC/wwMO/L8O+nTLoxbYHszlrxaB6WgxBSCH1VymqGYXF/j2d6rQXAWwP9iJbXuxDtD
	 QV76F2yLrbfh1fPEaHTTyKSybjdrmg21WZ05T2GRgFtXWqHcDuM1szYXh0C8bSfxu3uw+
	 U6B1ue1w+NR7Zjr4uVd39ws8C5NF233EqpJayOTds+3b3lQYcoCmwAxxGoO2OG+vEDBwO
	 FNuSjZnq8yxHx2A3TRMGEAGZ6HnuxH2ZFdpMpXeQdSnQJU+TPiMv3d2kU/lo2zA1PhHpj
	 GFwGJ7tmqV1awq5qYBGcQfOUDwSiXv50E1KmpTL0sjDYle0MOIisfws9hxPTaR13UbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wB38b6je5TukLZG4QeKQmlwzA/Ycxh9nT5Bea008608=;
	b=Nvkv2L6Hwk6YeJMWbzhWSB8tpwD3Kp3enHyVVk1/OWayvJN4mZBt9UvfwbwmRFzN6TD+
	 B9FomIA6KW3TbAliawnd7ekEyn1ljyYNoYe+pD3KmqFupoFXLQ9b0ECWR1fWOfowXaoiH
	 0HRDGvY+q+mbeQk0w86ElIdaGDXli0bClG1rQ6d/PI8T1kVvCMddyv5PvCxQJFcyR8Yx4
	 0ZslKUeSLrW7Ue24vBay44Squj7xxOGKkGz4YCp0RObXu1tWzplF6ZplYW8Z/rlCvs/9A
	 7tzRSwpUkoHGZCWyFAc7iRTDnfUdrBytb1XptUdEJURFvwmT9pbjk9P04sJ3bnohTvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=At09PamB;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D136606D46C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D136606D46C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=At09PamB
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c45551fa84eso305070966b.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586728; x=1795191528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wB38b6je5TukLZG4QeKQmlwzA/Ycxh9nT5Bea008608=;
        b=At09PamBlx0mgZ8wA1mn4FX0b8cMAl3wGpEtI5vUsyZVLZyLykijn6m+GBgHgmaz3k
         N5Lo76AHNSxg4Qh/mPhuczNxLbchBt9gYHFcLUj67NOD8u4MARnPOl3nJDJAZ7gABrOk
         aeyH/buHFumDJ/xvVZBaKjF5ueH6dBa8X5qoVlK7mgs7IkaoAUxDM5msSqZvSzxUpqnr
         gLXGN8g2/2+nmIQWofHRVcSR2Og6UWJX9G0RtZymvfi1lAnnf3q8yQ8T41Ep8PpFBmDu
         P/KCpvPP58K3MFtcs4kVVsNbubB6RKywoF+xivcSAJQj3YBXNjii7VJY1TMK8EevsSBk
         umwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586728; x=1795191528;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wB38b6je5TukLZG4QeKQmlwzA/Ycxh9nT5Bea008608=;
        b=QNAGsMKuKxH/ZENb3X4hAaEBnZuiWNA/KkbbTyG6QqhVE7X9YBf+Ppo4Zdunmp9N+D
         R5Rq4mabUmf+pAFVWphwnqrVGFK77ZB+Nj+sBF8o0dDmr7xNcwDVgy/vRFUmNiSOGi4p
         dFYtV0oBnvFyU2XGIRcnB/d4rObLZ/k3+/NpL7YukCwA4hqHekf6ahS/Xq6tFXgcHoJX
         0krwIdhbuChCyEicjCZ0u/yWb26aGG/CKTHwUaaN2U5kC7fHg0y0DB0sl0fW1dCNGySI
         w7NguRj9ytHON8lF4tcbxZDMYgC8Pp8Al6Wt8K5T2NDdBb8H+TZ7c/L101jWB2BzKO6C
         /NQg==
X-Forwarded-Encrypted: i=1; AL+hErG9xm2Z02UJYajQCtkYyeKIDXhH+nEkk4lbTnPp2z8kKakKms43qVZSfzqGPrlXZyeqaV88Sr+HgNyh@vger.kernel.org
X-Gm-Message-State: APuU4Z8Tig3ORkrCyYsDz5f+MqO052RDyDp5Kf5JromjhnGZXWGulJ6y
	x/yyPP7zhrbt83FGqecp9MwQmB7USj1Vno7s2DkuE5wx9AWgfh5IuYvZ
X-Gm-Gg: AYBFou2T01CBRzI5d5iqzKvJoI7zf+xdkjnlWpsMP0NmRUNxZEgdoSk6wrVMBcCTMVT
	bizkVACXiOWKAo3t/U6Omou3AQ6PVqn8NFMTbYGh3RPDfUyxEc6YrPu7RNf9HbjvwYvmFgKg/wn
	2wtJIdXyatQplfj91T8m8MI0pvfuM7WvSNbPvyhXCPtDNeMvl6lcgvbirAzWPLL8voJsGIGMnSP
	gBSFL2nMwc+/pbgkxTiTgOLVNAle1axj6DRICbZVTktfsSd07PbJC9mXoonWbxIv5MEuGslrRpC
	xSEhJSWQmarZCEzWKKl0o+iaytK4Lnfh6A7+VKmlIhs3zdg9OioPMmqtEDy00tbhYBETsUaZo2j
	s+yCYekITFI0HHmRCNX/aW/6JR/CVzChMKBz15Tp1xah4oWjhZHFIGMoQjE3QCI0bDYeDK+7W3R
	XM8nxBsmxeQQguDVj49SkIH7ca+1thBJVn1K+/nan2a+n1h8dVY8+xnRsO9iYqKPluQ6IE+Eix3
	fb65ebsdhSD3Wf69yqb7kFxnU1aBZ/VnH8bZXoHsH0F7LFGPjx7ZL6J1po9DbvpuM0Hvgxn7pTP
	qn1N7syxGiIn0AFgDtxY+v+ETW2tJhSxdOIEZceXOFki8/EfHHNj7uj1xlMPTCrFZNM1fkUwVjv
	X7Iy+OqUI4g==
X-Received: by 2002:a17:907:c09:b0:c49:9231:5518 with SMTP id a640c23a62f3a-c50963d4f29mr272520066b.21.1794586727949;
        Fri, 13 Nov 2026 08:18:47 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:47 -0800 (PST)
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
Subject: [PATCH v1 04/10] media: tegra-video: vi: Switch to media_entity_remote_source_pad_unique() helper
Date: Fri, 13 Nov 2026 18:18:13 +0200
Message-ID: <20261113161819.36847-5-clamor95@gmail.com>
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

The tegra_channel_get_remote_source_subdev() helper walks up the chain
to the initial source. It blindly uses pad 0, assuming it will always be
the remote source pad. This may not be the case for more complex multipad
devices — for example, the mt9m114 camera sensor with a built-in IFP,
where the source pad is 1. Switch to
media_entity_remote_source_pad_unique() to specifically retrieve the
remote source pad.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/platform/nvidia/tegra-video/vi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 12eaa89304e84..a96ef26af89eb 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -187,9 +187,11 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
 	if (!subdev)
 		return NULL;
 
+	entity = &subdev->entity;
+
 	pad = &subdev->entity.pads[0];
 	while (!(pad->flags & MEDIA_PAD_FL_SOURCE)) {
-		pad = media_pad_remote_pad_first(pad);
+		pad = media_entity_remote_source_pad_unique(entity);
 		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
 			break;
 		entity = pad->entity;
-- 
2.53.0

