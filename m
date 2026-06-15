Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D523B1ED1
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506231; cv=none; b=AJxrInxxrqyKES+nN+cPnxjil4zPhw/MLmD9T3qqxZsBsVwm4x2o2XO8p9XD4OjkKIlFW9hnmCc/ThoQ1W+Tw8oLDyWcZBNQd16NoJ27NViXLJOvip8xq6LyO7O76OyFjYeKL08UaFto+DClubCijQ4QekkXXAznWlea9bJMmIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506231; c=relaxed/simple;
	bh=O+9IF8idxOUgGk8wYKvwtC3nVTgh9+G+/QoU7KoNBQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cI7e795tUZg3Xf8DdIC6al6mTW9t9xHG2H72nG840wt99F1z5wm3uAWX33Bs4puD/KzQEYvi/BVPg/Pi2gyx3O/qJBG0dXepQkLkw92rwlNH9P5uLaOmjjiAfVeLVBqTk5krAb4FdpxXbOzVcm7dwC3dt0m3Yrj89XubcNMRdCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJv+ScDB; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJv+ScDB"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304f590dd91so3331409eec.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 23:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781506229; x=1782111029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7XA/vKBHH8dmFPLF0CvhcWERh05nFE3P6i58kyZClA=;
        b=mJv+ScDB75fKCTuthNcPU2Y82+CX04mwE7zEOG4gZN2dCRpEji+8FGewT4PUnTTCl2
         +kn6XY8YJnEmizwy+tj2Jqf4T98SdUue3Q3lPnWUlvlC2bfKSp3f+yGMPZ6BV5LT2rkx
         YsGyzKSpfNVMAoUnxvS98epZ4g9U6ZPNMUKrXlGIA1KWNrNebLj9yudYH4oFHjzMvrGe
         6eCvR648cnc5rHyh9UW4t7JnzM6Y6IGJEd5jjCI79WiLhGOgZTtGoptD5HmZKOwo6Vs3
         I0cHA2PxM0v904Y706odCx+lbzjJ9O6r9VoyQdd7b2+g0kfiornXRn3lfSfleINVQudw
         aghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781506229; x=1782111029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C7XA/vKBHH8dmFPLF0CvhcWERh05nFE3P6i58kyZClA=;
        b=Cr5kbHf6SB9FnSYoSmsYN2nxXzCGWcr/6rka8X/3oxtWJxoNV1zYcv1WKgKWaqIwrE
         6Kom3olmaei+9VMP/jjB/nAfnDo9d1KrXXvBhpF1Z59IMMa6eOEu1THPGPQmKOVP7syh
         Z36L+fzOvbesn8LZhaQ8ARN9OUkeuG3VJlweUVuvYlYdy+bSYdyj1KyVv9FUBgCG3wCe
         FSdJLFuTVk/ZaPhILgPTOE9RCdvo8bMO42d1vFahNSUDNxrzF0ZFK4+grezqlMUcv8Ta
         KStLK0r403oSYvOHoSEnTpFGTeq1g2TW0Wx+4K4VchsnoRMrYuGWF6wWazHXeC7tb8Zn
         3qbg==
X-Forwarded-Encrypted: i=1; AFNElJ+uQxYId0uHSTJXxTK27zM7sbIUM1oc6tZsdpMXmt4UFuyrUR8YBWzb7sLeSzY3I6R4jOhViJbHtHFB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3mcTrnm2lhtVfad/WFWK9Eb/0MWFxSMpDcf4E5rqBRZ6sJA6+
	+r6i3DECw1O6uqQ53DucxXfXgJ67jGl8f2KEnybINEvPMnaaeM/fGjh8
X-Gm-Gg: Acq92OEfB5SkfLzYEtFrx4o0a8fHbWzDpB2GAFlqFh44gWQZb3vAMKntcNh+ERXulPy
	3mAvadI0m2UmfAGJgaBKc9Ioc2QSeD4qBcZVK40+6wxsVDhpAscPDXGGITYSa7qutcxJU6IW0LJ
	EfDNK6cxJPflTGGPzi1Fg5VQRD1zxQxeQ2vkoJfzMSODloZot2wyxack7baAsZQj5WY9Bu4xZCJ
	Jn+0uWNDYZiS7Dm8zx3rRhtSt1IwoSMnqEK9xRtdzFlib/Md5GWHwotuqN49bfA87D/5KrXn4kl
	279U8LHGwB6lY5lBFsKjY12TlVEd/6Da0puLhdzMzcCoWh8lWKzetcs5B9yF2GiWCMO42o7jcYn
	hxkBfuCZnnmIcku6Uni6uSE5NergDB46BRv5UVVq6DTzLdJV1URfh7jaebU15ky95m1pWWnGUfV
	Q0BzUY6sdVfPjNLeCmoHQAu/SKmpzW63oy3HNuot0muSNmYqTWdKEVL6Xr+hZ1ISUGSipGq2rH0
	wGk76Vjed5Z
X-Received: by 2002:a05:7300:6426:b0:2da:1874:f3bd with SMTP id 5a478bee46e88-3082004a336mr6289586eec.16.1781506229088;
        Sun, 14 Jun 2026 23:50:29 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb9a2e7sm13516812eec.30.2026.06.14.23.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:50:28 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v4 5/6] drm/verisilicon: add DCUltraLite chip identity to HWDB
Date: Mon, 15 Jun 2026 14:50:02 +0800
Message-ID: <20260615065003.76661-6-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615065003.76661-1-a0987203069@gmail.com>
References: <20260615065003.76661-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register the Nuvoton MA35D1 DCUltraLite chip identity in
vs_chip_identities[]:
  model       = 0x0   (DCUltraLite; Verisilicon uses 0 for this IP)
  revision    = 0x5560
  customer_id = 0x305
  generation  = VSDC_GEN_DC8000
  display_count = 1
  max_cursor_size = 32

Placing this entry last makes it the gate that enables MA35D1 hardware
recognition only after all the supporting ops and DT binding changes are
in place.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/vs_hwdb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c b/drivers/gpu/drm/verisilicon/vs_hwdb.c
index 91524d16f778..7d630a667a3f 100644
--- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
+++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
@@ -129,6 +129,16 @@ static struct vs_chip_identity vs_chip_identities[] = {
 		.max_cursor_size = 64,
 		.formats = &vs_formats_no_yuv444,
 	},
+	{
+		.model = 0x0,		/* DCUltraLite */
+		.revision = 0x5560,
+		.customer_id = 0x305,
+
+		.generation = VSDC_GEN_DC8000,
+		.display_count = 1,
+		.max_cursor_size = 32,
+		.formats = &vs_formats_no_yuv444,
+	},
 };
 
 int vs_fill_chip_identity(struct regmap *regs,
-- 
2.43.0

