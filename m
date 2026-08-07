Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F41391E74
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 14:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786112564; cv=none; b=DdJPYiYa7tbAEPjr72dpri+ftXE5WnTg+D8kt/Jmhn/7lvO/w9q3k9Zl8lr+X1qOtW+hZPib6tlMmNz6jUl14/2E6mfZbi6LNzy3YuzWB0z9PywdIdBZQpPEzLXMBpIM6fXxSADZjk7ZZoJuYrOzHIlnRIh4/cTAyxbwA+g2NPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786112564; c=relaxed/simple;
	bh=0j8TQc1XBE3NthqoJBUaOtN3D1SXokyq3y6sx30QIwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YGjiS5k56E3nRqlpRguOGEAqMoFZ2mIJAQJo5CFlQsNUPD3NJYpt7WuL+e3IXdAsQhFvVKOjbpirOD/bqQIo4oDMQ5RHzM7hi9QleP/Hybwe1PW5s+l+AiH5Yo8/E4yg3YQitGwtzLKyXdDAaiNRUkCs5zB8wirD7K/baRDDX1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpCY+Tpx; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpCY+Tpx"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so4074897b3a.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 07:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786112563; x=1786717363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FAa78h1UPlEGhvqRIND/hGOzg4aWk1ci1bKFVAtltMA=;
        b=GpCY+TpxRVfn5j5nbQRl1p6lnBMBBI9g+gFhrGF1SOfVbqvwmbq3/KSa4FL2pioys/
         8G+UcwyGpKLD84OY65K3qI8GvIOBCnBiGUGWsxrMnynvAJWGSIYef2N0N7oiuAOKnZQc
         2EJ5VzNB8l3bYFxyR8TkFZdys7eWsU/wgX1irBcHTNqa/0apUHmc9rlOaYzqvQW9o4TP
         A86MgPz2JKApMGSvJa8ejFQ2YwSvTvk5Gv6uw32C9MTIVbbW3IvHewaY5QCn6KQnFIyD
         vC4OwPLDp5uv7cX0GUSDqjtYwLT6u4JWCVrCMbxGtFUtSSGTufJfUvzq4AKarEv6S8Ju
         0dKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786112563; x=1786717363;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FAa78h1UPlEGhvqRIND/hGOzg4aWk1ci1bKFVAtltMA=;
        b=di299s0Wy9WoE8Z8C0Bry2wJJYLsB5//m6kWPNXWe0bV5N6+c2E700Qx11xMmTRVnT
         JcDj9Oxsfo5I5RDuCMr/XY4qXdpu1crY6Clrp5mCgJYaU69x2LIqxPpZbjJPZ7Tldulq
         ZDNCnDn7D9pnV5+rHIS6/T/pyg3x5uD6JcOpVuSBAbCtsHnqM7ijFgvgn1bPCGPCGXtL
         VUw+L83VzB17GDdFOIUdvfA8s9dbmv1yBtyaG/d811C6JIBpuu6lavUnrasMGjMwEIad
         3Rz7k9WcRmz5AwgXW0qGttoLV1Q4IxnY9UO7sanm3kC2i40PAFQ/Gu0d+WKF3gQXEtoO
         Ncww==
X-Forwarded-Encrypted: i=1; AHgh+RpTIPeI9E6Ennsjrella0WTuRvmpR9J7HAqLtuPjy/dBnFYEKOylon6HiOFPWp0USgff1/72S9Y+SEN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk85Jeg7RIkfWsk00CndS+Udezdh6qYKWFNoSOSuI+mm2emlAR
	0H7T1qTpzZIVxz+SDpbBvFCYlsDHLbSKhyxgHqKb/VE/ukiM/VCeKSE=
X-Gm-Gg: AR+sD10v0nfv5jsFZIPSHf4X1ChffJLcnupSj1ZTak66C97utudGRWI09MzQjoK2dN4
	ZVMMNgdaKtkfn3xuDn1PGVxdWcfWgwhGYsEP8eILr8U7JwsQRUhkzbh+jTWAXSaGaKxzB45CgOb
	B/UGBmCsCPmht2gAGvn1lniuDYpIfWxkhv59efC31OWbyp+OXPwdOsKUbk4N9iFb8vTV6eA/5W4
	Nf2GGDJH1HgAwWBdqIl8Fep28J1kcFR7RvMQ/u9G5fmSQb1mnP/+G/axk3Q4JVCqXpdO2hD4AgN
	SzTGazb2+hqeHMo/dUiXIujvfZ4A9kWuD29xEhBxEBcAcDqyx3MkWMUFQh/5DYjx/4k51uqt3Ui
	9Q/r3c7mT2BEdenwF2o28NOPPo4ChK8B6Rs+OWeC0h8eKb53dfiXmzqwjOknURHivoAtE4z32jL
	NLW54Bxf8phX3pXbVV7ci88SnbVSMnsLWfMhfT1SR6WUZedE7+LIxB7t6wwBhS2OxX+c+lZklbc
	IwGj7REB4leVxIOEDGMYLfNp07weJKn6omOPsuX
X-Received: by 2002:a05:6a20:cfa2:b0:3c4:397a:69b8 with SMTP id adf61e73a8af0-3cb85e6c93amr31913005637.21.1786112562606;
        Fri, 07 Aug 2026 07:22:42 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a7395sm8521868eec.9.2026.08.07.07.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 07:22:41 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 3/3] MAINTAINERS: add entry for Chipwealth CH1115 OLED controller
Date: Fri,  7 Aug 2026 11:19:52 -0300
Message-ID: <63b7368037a4f03024152716776de23da5442cb7.1786110720.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1786110720.git.nico.antinori.7@gmail.com>
References: <cover.1786110720.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add MAINTAINERS entry for the Chipwealth CH1115 dot matrix OLED
controller.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b09b0ee33f5d..8430e4f4cad3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8590,6 +8590,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
 F:	drivers/gpu/drm/panel/panel-widechips-ws2401.c

+DRM DRIVER FOR CHIPWEALTH CH1115 PANELS
+M:	Nicolás Antinori <nico.antinori.7@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
+F:	drivers/gpu/drm/chipwealth/ch1115.c
+
 DRM DRIVERS
 M:	David Airlie <airlied@gmail.com>
 M:	Simona Vetter <simona@ffwll.ch>
--
2.47.3

