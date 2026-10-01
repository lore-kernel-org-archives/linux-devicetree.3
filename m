Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5EE490C00
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 19:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884740; cv=none; b=RVwHYuLaKMxSV2SzWpln2Vli2u7XX9KCxn/1rQ/Csfw6HbRo0uJL5bOIItdg/6f1tAOe7oBKh6/Nj8T/V2jgnivdTZlRDLIx9znekjNSuaOkfowgbbxL3LEsQHrzxkzDImR86V93WxIcJEUapat4schfoVlLSu5UNXNTZ6qy89g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884740; c=relaxed/simple;
	bh=S6qMh34KvLbIjfGfRDQ/vaEK1EGhvlMVKSGZLXlQONs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SSRIzP1LyTXCXw86jI4htpV4jL1kTaKPzix9DHH5+PlfgJspbnuAc3kyktWebvBNiph0kHRR46oAOK89WrLSx/Kl+0RSLkUTtLgA8AoSoHW6P3K/GhsQhduTc51b/0KgQVwgA8MSpVO5MMb2FZSboIkeL6tub6g9LpcGEQltwLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKvSOoxw; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKvSOoxw"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3920so52312295e9.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 12:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790884735; x=1791489535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1937oKfIRQVCPoNo84DTw0NidOzq8BgSFZcKFKTUzSM=;
        b=iKvSOoxwhJzdPbnheneehnMScjWTgrS7azEtcoIqarfb5SgcDfs7e705ZdwYF4FD3Z
         aeTOo0zre6ySTnkuAV7thJqxJ6rCMU0t4AodS/1r12XkDiofxDWmLVpKDumCuFf5K7vG
         rbXI021QiUUCl8J+5twDgDBkDclH7AwWHHDf7Jb6axOuLfES2tSwDPzELAhYG/e1yCiB
         sEseKVz5pD1moH+r6C/ol7YMrzopgzcjEHy/I2Ec+ojTmY+mCKtOZiHisgnbZyy5393i
         SxsTm6J7Kc9XbEMAbcGzN8N1adSQIPflztOOXgTSTh3UtXEG5OrZOxRNI/drr+QqReCQ
         iPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790884735; x=1791489535;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1937oKfIRQVCPoNo84DTw0NidOzq8BgSFZcKFKTUzSM=;
        b=2lHzrNIHD3dTyY770bAXQzjjvPi3TM8WzzjOqBSXvAi/HPT9Y64aOzfNF3/qs5prS/
         2fMnVJRVZyXH3apVXtiNITVh7E/EBGUpibaqX+Z80T+pmSLMbiVxlD75G0JRmeAi53js
         UwAk5Lc/4Pcl02Yq1iYUZK8ATu9zNYKtmI9azWWcse8W48pWRaGwo5d//mu1TMo05gMx
         qi8lxFmbDwbUG+I/AWXFXjXjgrxI57D/N9wTZgd9AvJjFTtMzuY108o7sRBO7FhBOR3a
         5Dazkmkf79AjpVAstzF72yaDZK6+yuhkQ2LA9DT1/ynaljLGGXiQ6WYD3k5H2yMxyqkR
         EGQA==
X-Forwarded-Encrypted: i=1; AKwUvBwqa6IzEhCQaIDemrXtdzb84v7mxx8ElQfa9zVfRqC4KeZ/1tDVmNvBIXkPmJXp6XTgAJjgsDurUa9g@vger.kernel.org
X-Gm-Message-State: AFuF++mOk8EorKiHXTdKHhF4KlEBz8g0GrGNGtstvs/WiLuvB49dKR+p
	2dLjdbJoMviArGVu5TL0EIOPXws5klKygVVqmrxbFLSx9jSXnqH5/NYC
X-Gm-Gg: AYBFou02l1bwg5xI4NJ5UP7gucKNF7Ip32LJS4oOSmxdYzpTVL1Y9mnT8FgBZpMFEYP
	W3WtnAJrST5Xv35w9KYEhDNRok0MqrJNWb+ikRr8/+KuygmAA/X3TOs1F13jK1/42Y584SVyTyd
	uRJHqe9GgzGIhSB9V12DmHTlWDxK+UMCBzn8kMI3uUyOtBOOHGSfRSuXkn2tpQzg3NMwuUEcKE4
	WlzhAKmHZJieOTeUE9P5B2VHHCdbFv0fU77EFBR44jmkfk3rWhFpn31l7Hsk4QArK0K2Wx7E6DW
	OUyOrjnT6Isd9m66Vo3mBnSUhtmIv4mmhG3OxnZwhIqT0VOQhT2i1toVQZChw24JtFt3qK8m7V1
	5a/HNWf3IZgGLxXfaiRo7Es4YQBgvBUuP6giYSEhUFWk95LmhnNBbBMf9DLMOO7yyXvd2rNy+Tm
	CdH6b8UbIkUSX3OzBbXcMuZNapobiWM5sE6FwGtmRa0jBUdvWzcJ88Dotz7O5NfREcdJehTCuM6
	6/lZBOB+GsLafXB31ozXrusag==
X-Received: by 2002:a05:600c:46ca:b0:49c:edd8:ba35 with SMTP id 5b1f17b1804b1-4a027590091mr11675715e9.6.1790884734605;
        Thu, 01 Oct 2026 12:58:54 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276f92d9sm15031045e9.4.2026.10.01.12.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:58:54 -0700 (PDT)
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
Subject: [PATCH RFC v4 02/13] efi: bgrt: export the BGRT table and image size
Date: Thu,  1 Oct 2026 21:58:36 +0200
Message-Id: <20261001195847.141192-3-maximpedraza@gmail.com>
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

The DRM splash client reads the boot graphics the firmware left behind
through bgrt_tab and bgrt_image_size. Built as part of drm_client_lib,
which can be a module, it then fails to link:

  ERROR: modpost: drivers/gpu/drm/clients/drm_client_lib.ko: symbol 'bgrt_tab' undefined!
  ERROR: modpost: drivers/gpu/drm/clients/drm_client_lib.ko: symbol 'bgrt_image_size' undefined!

Export both. They are filled in once, early in boot, and only read
after that.

Reported-by: Mario Limonciello <mario.limonciello@amd.com>
Closes: https://lore.kernel.org/dri-devel/5d7067de-97b7-4232-9cf6-e4b978696482@amd.com/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/firmware/efi/efi-bgrt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/efi/efi-bgrt.c b/drivers/firmware/efi/efi-bgrt.c
index 1da451582812..746a8fb3a337 100644
--- a/drivers/firmware/efi/efi-bgrt.c
+++ b/drivers/firmware/efi/efi-bgrt.c
@@ -17,7 +17,10 @@
 #include <linux/efi-bgrt.h>
 
 struct acpi_table_bgrt bgrt_tab;
+EXPORT_SYMBOL_GPL(bgrt_tab);
+
 size_t bgrt_image_size;
+EXPORT_SYMBOL_GPL(bgrt_image_size);
 
 struct bmp_header {
 	u16 id;
-- 
2.39.5

