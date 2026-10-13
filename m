Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC48E3E557D
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883977; cv=none; b=OAn3sKtZZO8B3uDmAQU0jKWJkXBkYCqX4Zg0WSqLidnEPEML6j+jm1CLRo8UmIQK0Y1LpwImpiFCBZMWusy9lrjmS/FotNpEb/vkGGpCIr8WCAh8ZpPxxyOD4yBuoRefrBjHXqNarmB/TZwyf9rT9xoAaRgCRvVdDghMx0Fb1oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883977; c=relaxed/simple;
	bh=AI9TykBgDRYyT96EaqkqSaNydivxgaXeejHoFob5uwc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HfbC57+psT//6KMmoT+p4t1AExMoYG09ZHkEdimYR0Yi/TLu4lyxFwXXCKsWQLwTM8yRq5JdLx6h3f+acwz96u2TvGveOUzBcOQp89FcTonGzD1sysd8k4eJLsVELfKLrd+x0xWCeDFRStHpRbFxguxIrvmN50fO23fOcfyuSbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkcv8VxN; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkcv8VxN"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso2083271f8f.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 02:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791883973; x=1792488773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z6NPHx9LACWbH6+mzFH89ozzk12nlHrey7ZxWH5hggM=;
        b=bkcv8VxNjkcIc0KV8GMyBZ6nJVg1lg/lRrTTbjC8lQe8wnjx38Ah4mrSVeEeOABxiL
         uftV7+AB0/sRu/tPZU+w4wzjRPe/iXkUf3wG9iDwG51KZ3VXpdR2S4gL4wgzZEJ6E1QU
         2G5XpJnxAMZa24KUdvmWo+eerave/NDWAsDh6ehwgGGjH77otg3Hk5IucsgaLm4LEA9u
         nlsAHzFINw07FCy9GSMOdpNSApsqn916U8Cj+lkD1Kvub7vLDo1oIyHAY5JIUaFzlEzU
         iDAgcUenMa4OUG994+xMRkixGRkYUg+2/DNycke1cOPUwBgq+KcSBYUoAVlMHtgRvWIw
         Jpbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883973; x=1792488773;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z6NPHx9LACWbH6+mzFH89ozzk12nlHrey7ZxWH5hggM=;
        b=jmKSetNheGXvGiP5u2iS2sdeFwTr3GmDj0d0wtvlIqJ+/PZGZCkl75g8hcvWxjORBP
         IsGCs3qF6jY+s/WCgzugfkqfF3VnGGBNkx4HXlNrmi3XgbEiB0c45LQ3Ex3t8+IK/mSi
         pDzHjPY8L3QZZvJjSGzsWzm69/LcElObmQhB9Ya46F9H4hdzYPeomjQRfyPeDuqJwBeB
         3SsqFrSdREbO/pouGTDBiwNKt02UoQidqF7Cj6166ovK44liw1BtjjucTvOac6UavPQT
         +QbZqcQc8Yp/ApmUk6yL0sh2yzhWKV1ksWix2yQYeCNHqqAf53UjUhqPMo0omIT+FhLr
         q5Nw==
X-Forwarded-Encrypted: i=1; AKwUvBxlWSYG0PcRlFcNRPPvJqogKiuNRFiDenY+Lf4Suo2eN+4/Qy22glXtBaj9pQbYS3icPNCWYoSAr9yL@vger.kernel.org
X-Gm-Message-State: AFq9FYKEj5tfcHNqLg8fD8wRpwK6JSi71Cd/KWJpK1BnwubEA0xCLgt6
	YDk+/mbWZNHY6o4SiSpnxG9ysWvFQrjLBBTFtgwL3TMyKYTGs5wVqKUf
X-Gm-Gg: AYBFou3euQDjZTHJjfcAqnuNrihnUTNJRdafWAEqV42G54FYrk6/w6kZ0sWWSNjhSR7
	IUqkXkTeZEO0CU3Vh/x5IDIWM/nSi7XJwEIAYfC/rpjQzOugnSW5Nc7YwXKJxrYoVC+ogGCcffa
	aZl7ljlWuJp+F0+1ARu3QM2shkPtT6Ux3EmVW76uojWELAtIfiXuX8utYduQNb+pgAX7aPAT7/B
	9FyVi9nrARmRt5b6VaOy8EY9NbBXKunDbJPbPoThPtCgPXRRQQWMCtqWnRDa6NiMZCz3s2u1rvC
	7QuT4OPKQXsnm0se5r8fIeCaWgWPZ1jlZrAaxNYL/Zp3NqFZ/xFOqxnPBpdK7XrOfYq3hZTZHM+
	WLNEYiSzLef81EOtMwz1uvB4lotvav76q8+D2VnC+2UN9hbxnyOZ3Fldaja94PUpeZcc9ggZ/5N
	43ihmdN997g1Jb8oCP+0gf7iUbPw4ys2Dtp9m8FZNzpY0b8z/wtZgStlZbqS9Y29Wu/e9ugTghU
	XC7UhsANWROJ9fVXJpcS7Gg
X-Received: by 2002:a05:6000:469b:b0:48b:a4b:5a2c with SMTP id ffacd0b85a97d-48dba7893e3mr15115259f8f.3.1791883972704;
        Tue, 13 Oct 2026 02:32:52 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm3986774f8f.48.2026.10.13.02.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:32:52 -0700 (PDT)
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
	Jani Nikula <jani.nikula@linux.intel.com>,
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
Subject: [PATCH v5 02/13] efi: bgrt: add accessors for the boot graphics
Date: Tue, 13 Oct 2026 11:32:32 +0200
Message-Id: <20261013093243.505776-3-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261013093243.505776-1-maximpedraza@gmail.com>
References: <20261013093243.505776-1-maximpedraza@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The DRM splash client shows the boot graphics the firmware left behind,
and needs the image address and size, its offsets and the status bits.
Reading them from bgrt_tab and bgrt_image_size works with drm_client_lib
built in, but it can be a module, and neither is exported:

  ERROR: modpost: drivers/gpu/drm/clients/drm_client_lib.ko: symbol 'bgrt_tab' undefined!
  ERROR: modpost: drivers/gpu/drm/clients/drm_client_lib.ko: symbol 'bgrt_image_size' undefined!

Rather than export the data, add an accessor for each of them, exported
GPL only, with stubs in efi-bgrt.h for CONFIG_ACPI_BGRT=n so that users
need no #ifdef of their own. The variables stay global for
drivers/acpi/bgrt.c, and are only written by efi_bgrt_init(): mark them
__ro_after_init.

Reported-by: Mario Limonciello <mario.limonciello@amd.com>
Closes: https://lore.kernel.org/dri-devel/5d7067de-97b7-4232-9cf6-e4b978696482@amd.com/
Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/firmware/efi/efi-bgrt.c | 74 ++++++++++++++++++++++++++++++++-
 include/linux/efi-bgrt.h        | 39 ++++++++++++++++-
 2 files changed, 110 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/efi/efi-bgrt.c b/drivers/firmware/efi/efi-bgrt.c
index 1da451582812..01425c4d2e70 100644
--- a/drivers/firmware/efi/efi-bgrt.c
+++ b/drivers/firmware/efi/efi-bgrt.c
@@ -16,8 +16,8 @@
 #include <linux/efi.h>
 #include <linux/efi-bgrt.h>
 
-struct acpi_table_bgrt bgrt_tab;
-size_t bgrt_image_size;
+struct acpi_table_bgrt bgrt_tab __ro_after_init;
+size_t bgrt_image_size __ro_after_init;
 
 struct bmp_header {
 	u16 id;
@@ -89,3 +89,73 @@ void __init efi_bgrt_init(struct acpi_table_header *table)
 out:
 	memset(bgrt, 0, sizeof(bgrt_tab));
 }
+
+/**
+ * efi_bgrt_has_image() - Whether the firmware left a boot graphic
+ *
+ * Return: true if the BGRT points at a BMP image, which efi_bgrt_init()
+ * checked and reserved.
+ */
+bool efi_bgrt_has_image(void)
+{
+	return bgrt_tab.image_address != 0;
+}
+EXPORT_SYMBOL_GPL(efi_bgrt_has_image);
+
+/**
+ * efi_bgrt_image_address() - Physical address of the boot graphic
+ *
+ * Return: the address of the BMP image, or 0 if there is none.
+ */
+phys_addr_t efi_bgrt_image_address(void)
+{
+	return bgrt_tab.image_address;
+}
+EXPORT_SYMBOL_GPL(efi_bgrt_image_address);
+
+/**
+ * efi_bgrt_image_size() - Size of the boot graphic
+ *
+ * Return: the size of the BMP image, as its header gives it, or 0 if there
+ * is none.
+ */
+size_t efi_bgrt_image_size(void)
+{
+	return bgrt_image_size;
+}
+EXPORT_SYMBOL_GPL(efi_bgrt_image_size);
+
+/**
+ * efi_bgrt_status() - Status field of the BGRT
+ *
+ * Return: the status byte. Bit 0 tells whether the image is still on
+ * screen and, since ACPI 6.2, bits 1-2 how far it has to be turned to show
+ * upright (ACPI_BGRT_ORIENTATION_OFFSET).
+ */
+u8 efi_bgrt_status(void)
+{
+	return bgrt_tab.status;
+}
+EXPORT_SYMBOL_GPL(efi_bgrt_status);
+
+/**
+ * efi_bgrt_image_offset_x() - Horizontal position of the boot graphic
+ *
+ * Return: the X offset, in pixels, at which the firmware drew the image.
+ */
+u32 efi_bgrt_image_offset_x(void)
+{
+	return bgrt_tab.image_offset_x;
+}
+EXPORT_SYMBOL_GPL(efi_bgrt_image_offset_x);
+
+/**
+ * efi_bgrt_image_offset_y() - Vertical position of the boot graphic
+ *
+ * Return: the Y offset, in pixels, at which the firmware drew the image.
+ */
+u32 efi_bgrt_image_offset_y(void)
+{
+	return bgrt_tab.image_offset_y;
+}
+EXPORT_SYMBOL_GPL(efi_bgrt_image_offset_y);
diff --git a/include/linux/efi-bgrt.h b/include/linux/efi-bgrt.h
index e6cd51005633..1c287e5fd388 100644
--- a/include/linux/efi-bgrt.h
+++ b/include/linux/efi-bgrt.h
@@ -9,7 +9,14 @@
 void efi_bgrt_init(struct acpi_table_header *table);
 int __init acpi_parse_bgrt(struct acpi_table_header *table);
 
-/* The BGRT data itself; only valid if bgrt_image != NULL. */
+bool efi_bgrt_has_image(void);
+phys_addr_t efi_bgrt_image_address(void);
+size_t efi_bgrt_image_size(void);
+u8 efi_bgrt_status(void);
+u32 efi_bgrt_image_offset_x(void);
+u32 efi_bgrt_image_offset_y(void);
+
+/* The BGRT data itself; only valid if efi_bgrt_has_image(). */
 extern size_t bgrt_image_size;
 extern struct acpi_table_bgrt bgrt_tab;
 
@@ -21,6 +28,36 @@ static inline int __init acpi_parse_bgrt(struct acpi_table_header *table)
 	return 0;
 }
 
+static inline bool efi_bgrt_has_image(void)
+{
+	return false;
+}
+
+static inline phys_addr_t efi_bgrt_image_address(void)
+{
+	return 0;
+}
+
+static inline size_t efi_bgrt_image_size(void)
+{
+	return 0;
+}
+
+static inline u8 efi_bgrt_status(void)
+{
+	return 0;
+}
+
+static inline u32 efi_bgrt_image_offset_x(void)
+{
+	return 0;
+}
+
+static inline u32 efi_bgrt_image_offset_y(void)
+{
+	return 0;
+}
+
 #endif /* !CONFIG_ACPI_BGRT */
 
 #endif /* _LINUX_EFI_BGRT_H */
-- 
2.39.5

