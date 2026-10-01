Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9337847607B
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 19:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884736; cv=none; b=cwqqa3uA6t5FXKNxcH/mvBU6XEtQONfVX7kcTgEKG40nP8tq4mCAV7tiAVy7a4Ev0mxJiiT4n89Ja1ZfyMLq2EC0vxiJsSupdTYAcHLjsO/fr7EUygL78I8ZLmS0U5FQVUsMowi0Q2zbC//BRsH9FMejCnJJDI4msNeEYRlHVGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884736; c=relaxed/simple;
	bh=lsZA0e/b5sbxRypRHbpgPYpst0BDN0tACu0nxjitEDo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UTidAiQiB9n1dwKsXD0d7bPu2Bb4umyy12sk/hTb8ZJTxVaZFAbRCn0eeUAvWueb9qxwCcCv+QxmGXB408/ah9AOJ+Jb+xZDusWiBeXNaY4JQ+7b95Jpv8JAJf7/OeZR8Pa/nv75nGo4l1TVYr8klVofwsu+1NiEbhFKNyRoaBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MW9NG43D; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MW9NG43D"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so43128555e9.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 12:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790884733; x=1791489533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NZQM6qPjUipP3twsEWuLikKTTxPNmXURRnws6p/YBzA=;
        b=MW9NG43DFNo6qZ4lnwguXoSMpr5jJL8BFlH35NVvTjZti+bf45nbUleWV3TdeeY2lV
         BzMGeW6gVtPiJyOj6nq2W1oA+lqBXE2rUhYBdqysIiGE3HPVUyPL7e7+PAM9KP49Ns0l
         myONMDkxccoPAirj/9p9Odq2HJvRPGAuk4243wcZiRg+3WT2Wpq+0wqbru/Mjy9s2hdE
         /r/6RKbKaF+YzYIs6JA/UfKOp9LQipgtz2f8LONNq6UiH3x/y0GpCQMTfFNwNeaVXmmj
         9nL1HwlfVmQJDQP/pV8TaeGiJFi7waxrSSTE+ygN0hdWE/MJ3KW15wOZrX9U/VSO9mH7
         /siQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790884733; x=1791489533;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZQM6qPjUipP3twsEWuLikKTTxPNmXURRnws6p/YBzA=;
        b=quLj4+RDT2wFy3tU5JydSLLEGWYQub34VarRzsDPm977EdOY/Jfu02hxf/mviuTrVq
         J1x91JY/qcOBdZxFWNidNEmoRdrtK5VD7AQwQUCII27iu1Oy34+EHYVnGJDp2pD2ogas
         f0C8g/XlUNWMK4w7vueMmTUoLtafKoOtMLUuj9zOBZmi0qy+5ZHugkA3MBGjXwnzyHZp
         sEJpH6Q1lYNzFCIE2XgqRHErksYYYc1O8K/gevD+abOR6v+hbGq8qRyLhyj0yG4/zcnY
         5+vORC+hvHAXBq/5akC8MsG6/IP4iTdIXM82oU8N0Lh+qYCcH/DVQI/jk4y5iJCoRwxY
         w9Bw==
X-Forwarded-Encrypted: i=1; AKwUvBxE8noxjST+LyV6ZVeQLZqe4/BoEYomtFL00DPSWFGYFU6YHE7EKJS6b7W7AG14XNS/WIoxh1hi2y93@vger.kernel.org
X-Gm-Message-State: AFuF++lwfeSkEt1eeqYqEex5W0dmL6FixUPCBQ9tqXv9EmdejkExqr2H
	kTGd6NInWY1Xhy8n2vsG3Ja2sOWkFTpNz238EFJhOmswtoeHw4RbiKSk
X-Gm-Gg: AYBFou30aBBiQMyZr/9XM2fKJkVDnotf+HF9//svOs8nJHm5/9THWC5VOvfnQ8mwAeq
	SEdObtVZHlEgOv2E6pbR1dsNJlQcz0EuAnv9fbhVMDXqJ6upmRxd7NQ2Rm9baGkl7znedLQEZL/
	kVUMkdb3+Sy9oX8SI1o6L/QKRkE3vLcPioV3jaIMIUPL1v/vXkFCayMU9s2hJs2ncAfE940WeDj
	x90vjZ/iLiPhd28i82aki76XqaY2ShELcewpwGCpJBQIMHeo6NndgVqaHE2gtmFCdXYjHqDgDKf
	3x8XWcFFKqA91qUgDoUwpVo7c3tLxIM7398wmYVhRJd5COdhfnpQHEsjmuRnyhdi3oGthKcDJsL
	VLAjI0/pmL/FgA5fel0BNb9+O1sa2vX+oEgBx18VnyBy9QXB8Y36xLigzYaVtdpN6kShNd1oIJg
	bnNslY8SXddmvon+t/0JaqxpokTs1E/+z56Qicp8OKCMc0sughyOnhbABV7ABttE8tGHviGmlt6
	uNfYzVIjux/xoP4TYdvWKTR1w==
X-Received: by 2002:a05:600c:3490:b0:4a0:1b14:e845 with SMTP id 5b1f17b1804b1-4a0274d1600mr11350325e9.2.1790884732686;
        Thu, 01 Oct 2026 12:58:52 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276f92d9sm15031045e9.4.2026.10.01.12.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:58:52 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Francesco Valla <francesco@valla.it>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v4 01/13] drm/clients: Kconfig: indent DRM_CLIENT_DEFAULT with tabs
Date: Thu,  1 Oct 2026 21:58:35 +0200
Message-Id: <20261001195847.141192-2-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261001195847.141192-1-maximpedraza@gmail.com>
References: <20261001195847.141192-1-maximpedraza@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The body of DRM_CLIENT_DEFAULT is indented with spaces, unlike every
other entry in the file. Use tabs, so that the next client added to the
list does not have to pick one or the other.

No functional change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/clients/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kconfig
index 6096c623d9d5..8d8bc37ec9f2 100644
--- a/drivers/gpu/drm/clients/Kconfig
+++ b/drivers/gpu/drm/clients/Kconfig
@@ -114,10 +114,10 @@ config DRM_CLIENT_DEFAULT_LOG
 endchoice
 
 config DRM_CLIENT_DEFAULT
-       string
-       depends on DRM_CLIENT
-       default "fbdev" if DRM_CLIENT_DEFAULT_FBDEV
-       default "log" if DRM_CLIENT_DEFAULT_LOG
-       default ""
+	string
+	depends on DRM_CLIENT
+	default "fbdev" if DRM_CLIENT_DEFAULT_FBDEV
+	default "log" if DRM_CLIENT_DEFAULT_LOG
+	default ""
 
 endmenu
-- 
2.39.5

