Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109247;
	b=liNu5XUeCFBXA43VLQyhQlLrMit0u1+h6Osp1Kky0AIPH1LTYjHIqNas3SKPxXhdyjXg
	 +zRYVbAGal+ESkFPb5b2vIAvoEAsO2e6Ihrb/+Uu9wMz+Y/BchoOVGwKGwTMn2I0S9vSH
	 q2Bu2q1iBKk0BC5bSACuheXOT2/JJZ30SfRY7Qa0V93Vruni4XvcTElIrq+0bs28mtMYb
	 aK8+aYetXirOPxTBavAX2R34I49wZl/Ts0cVbd8jmmmdwBEbTTZeKfB1QE5USV/jKU/Dl
	 lms9J7qzs9YhdeJkINxSxqLYO3IVnlkWZmdrHjyHHLO60239GF36r4Oy21xiFMCBdKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=x3TRWoAym08EDkUmxJbEElxgHRIsBB4gzy6Y/BELf6M=;
	b=LxHWiAiClx4TKEVxx/nc2SzhSqW6S1Wm0D43eAIWoFKzKzPavhOJ1pXHmbh0Im34PpsI
	 1OUEPHp+zA6zf9ALHF0ouaF1WAU/V8ljr4dRiapNlGe0Ev7tbOTjK6c0bOXwfyYaENmy3
	 j8GPkT0thPFLABZfF1wDvwwtXrkbwwiYlNUk/4xVd81V0TrfhFrr+oOmWkXX7nVtJTFwU
	 dR7yw1MxOutqO99fzuCU5j5YvAPAU5V5Dl4JZh0K474DHCih5AiIkzuCH5TTBIt/WI6QI
	 dZSubi8DzoRdqDNYL3eJ2tkL7tDBDrOrrMi3FatlsM1ri0osGHFjdLBi1v89iAWN26w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CXibKdWQ;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9C060A382F
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D9C060A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CXibKdWQ
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df4f540ebso2078850f8f.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109245; x=1793714045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x3TRWoAym08EDkUmxJbEElxgHRIsBB4gzy6Y/BELf6M=;
        b=CXibKdWQ9F7anjrgC0VMM7aDjT7IZMsjrShnAhjebv9ylc+23J4tWOL8QvB+1moPRX
         +ccoc8d11rCpEb7OtfOrgtPIf/fT8tmb8PVCSRTYx4nbwMkcpY2vtHqVUEpb/OC3PRSX
         n0Ia7Prd8lLKUDe1UZtgqbfo5N4cIvFxQz6SXiyEYg+iyq3EZ/1FhxyWHv5iBM4l7xCx
         7F2ocwI8m+BeAbnle6aJRUD9PWHXDbHOYkGek9AI74WYQgNsj7qt8kMlhNAd0+KVokOO
         6MNd4RtF0WI/55ngrMNg6XmUK6c78cp3ggmzgkKmzUywXESizZ7nCpjNOly4WKzfIN4I
         Qk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109245; x=1793714045;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3TRWoAym08EDkUmxJbEElxgHRIsBB4gzy6Y/BELf6M=;
        b=xJEP+rX3WZVbJA9tlZUf6RDYNf7rZVPluL2F7hL5JKdJgwIt47ZZStQze9CxuagP1y
         g3iHpO4KK5n7qnzYoQ/k0ZCGUjr3UuRLHHuEfZjgBncAKJWcifxgv43A4HsFHiYoILVc
         4BJpUlnGHnoHABkClWH+5W9jnbEq3ouZW5yLC+1cX7acQuJiAGd+Hw6jM6/MxN3ZdmXE
         rV3GR+438Y98dA04upkCPGCZeUwXA8rbOpqqBLqwkYcwtR7RVpSIkl09+PKOCrX9lh+x
         zIJOtQLIwaloIu2CCGp/6Xa/7/wHPbauYRP9AEUYbOVsiH4O5Gt4k3Aa/drPAg2xz4Yw
         bRiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzHJtrCJzRPiqg4NEt9g9MIzHu+zRTElJIFWAmpWeaprcQaBU3r/bW2rQwnbtaXKJdl+Vixw6vg9gX@vger.kernel.org
X-Gm-Message-State: AFq9FYLHoBg95BWN+j9k0/jd7sp5Ef8qEGg9q3XdjMRyI+BdoUozYUYZ
	si+Dgdlhhv57qsTezRlx7/1P9vNcZ6SLvziTHgDPzPTQU9UQHFZF8sRP
X-Gm-Gg: AYBFou14Eqsifcu4LLSlNKKttpUSeKzs2aPZEenpkuvVYFf8QQ0K/TO8DkZ/Bu4Q2Ue
	7k+J9yofr7dvXGZSe5EmCqbrPr6U5j459FTdob8WTkqSCp3MjijLkV3abuugr6uQGGGffsKRD23
	mfrufzWUPIDK0cHtgYJewTlwzaq60czVRf8XSycU9mVPlqI3vdCFIQmf876Cpc4U8vb7RepkM79
	AiHZuCrpNu/aX8C5YbCzvjQouZ29a4pPua6RpCy16JvfldlKLMjQGoh/GvTiR+HCZijum6AP7MR
	6/0P2LizdDUIQptJAHyzJ0sZzDTu8Ek4dDA7vM1jLwHPLZTUwKj/kb3De+3h5YYB6fPPtNe7D2C
	03vclOhpM1vgWBntN6AVaWZ0XjZozQgiLMr3eHMyXQqN2qy3Qigr0uzFxUjjklYUTVwtx/vTQN2
	pF2P5AUGoWMXbsNBO1O0KP1wO3A0/K8n1SSFeTsNsBZxZq0v+cv040aA156lM5aJQ0zI2iIk+In
	Fw1VU43dBFw3M5OojpLWFDEMXmcoGU/sKSVKrZ+b5IOX5O+dJqZjXCN5hMv+/T1wmsjJvfE+udP
	1C+j0qVa3PgqAnXgU4bELsEvcKNp
X-Received: by 2002:a5d:5d10:0:b0:48e:1c72:abc with SMTP id ffacd0b85a97d-48e3eb9890amr18924302f8f.35.1793109244645;
        Tue, 27 Oct 2026 06:54:04 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:54:04 -0700 (PDT)
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
	Jonathan Corbet <corbet@lwn.net>,
	Helge Deller <deller@gmx.de>,
	Peter Jones <pjones@redhat.com>
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
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 08/15] drm/client: splash: pick the image source in one place
Date: Tue, 27 Oct 2026 14:53:35 +0100
Message-Id: <20261027135342.2003632-9-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261027135342.2003632-1-maximpedraza@gmail.com>
References: <20261027135342.2003632-1-maximpedraza@gmail.com>
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

The client chooses between two sources with a boolean: the BGRT if the
firmware left one, otherwise the BMP loaded as firmware. A third one is
coming, and with it an order of preference that a boolean cannot hold.

Name the source in use with an enum, picked once by
drm_splash_pick_source(), and have drm_splash_image_load() switch on
it. No functional change.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/clients/drm_splash.c | 45 +++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clients/drm_splash.c
index 337c7160c4a1..911149b92a52 100644
--- a/drivers/gpu/drm/clients/drm_splash.c
+++ b/drivers/gpu/drm/clients/drm_splash.c
@@ -39,6 +39,16 @@
  * a static image.
  */
 
+/*
+ * Where the image comes from. drm_splash_pick_source() sets the order of
+ * preference; NONE is zero, so that a new splash starts without a source.
+ */
+enum drm_splash_source {
+	DRM_SPLASH_SRC_NONE,
+	DRM_SPLASH_SRC_BGRT,
+	DRM_SPLASH_SRC_BMP,
+};
+
 struct drm_splash_scanout {
 	int id;
 	/* Modesets scanning this buffer out, by position in the list */
@@ -87,7 +97,7 @@ struct drm_splash {
 	const struct firmware *fw;
 	void *map_data;
 
-	bool use_bgrt;
+	enum drm_splash_source src;
 };
 
 static struct drm_splash *client_to_drm_splash(struct drm_client_dev *client)
@@ -429,7 +439,7 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 		return -EINVAL;
 	}
 
-	if (splash->use_bgrt) {
+	if (splash->src == DRM_SPLASH_SRC_BGRT) {
 		x_pad = efi_bgrt_image_offset_x();
 		y_pad = efi_bgrt_image_offset_y();
 
@@ -498,10 +508,31 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 static int drm_splash_image_load(struct drm_splash *splash, const u8 **img_data,
 				 size_t *img_data_len)
 {
-	if (splash->use_bgrt)
+	switch (splash->src) {
+	case DRM_SPLASH_SRC_BGRT:
 		return drm_splash_bgrt_load(splash, img_data, img_data_len);
+	case DRM_SPLASH_SRC_BMP:
+		return drm_splash_fw_load(splash, img_data, img_data_len);
+	case DRM_SPLASH_SRC_NONE:
+		break;
+	}
+
+	return -ENOENT;
+}
+
+/*
+ * Pick the one source the image will come from: the BGRT is whatever the
+ * firmware shows, and the BMP loaded as firmware is the fallback. With
+ * neither, only the background colour is drawn.
+ */
+static enum drm_splash_source drm_splash_pick_source(struct drm_splash *splash)
+{
+	if (drm_splash_bgrt_available(splash))
+		return DRM_SPLASH_SRC_BGRT;
+	if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_BMP))
+		return DRM_SPLASH_SRC_BMP;
 
-	return drm_splash_fw_load(splash, img_data, img_data_len);
+	return DRM_SPLASH_SRC_NONE;
 }
 
 /* At unregister, once nothing else can use the image */
@@ -818,10 +849,10 @@ static int drm_splash_client_hotplug(struct drm_client_dev *client)
 
 	if (!splash->source_picked) {
 		splash->source_picked = true;
-		splash->use_bgrt = drm_splash_bgrt_available(splash);
+		splash->src = drm_splash_pick_source(splash);
 
-		/* If no other image has been loaded, try to load a BMP as firmware */
-		if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_BMP) && !splash->use_bgrt) {
+		/* The BMP loaded as firmware is the only source that arrives later */
+		if (splash->src == DRM_SPLASH_SRC_BMP) {
 			ret = drm_splash_fw_request_bmp(splash);
 			splash->fw_requested = !ret;
 			if (ret)
-- 
2.39.5

