Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109229;
	b=P0NId1hub3nh+kyB23543heT0NE6gvzoe2ibEAnFU46Y5U7PIN/9KznSImuA1EJmbpeU
	 y82YrhYl73701q2VTwHW3hpeTv9ugUZB9a/Q1QA06X3QDv2Jg6RyRnIX19baM2UoCcp6X
	 LaIVm6wIictHZ+ddchtosoD5RLALjYegI0Maq571v1hK48T+CSu63J4mAOsV9daAMZYaS
	 /esWit4SzhOHydoLyBdn97bGj+YyOJS7y4Ew55o0d1RmQwCwEv6txiLxS43IuP6CFLzuZ
	 Rw4sfT+vcnRKx+jqoUGDZ0z+VCbY6uYQRwA81fTDz71PaPIXweo4AZZhJLfo6VYFVog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/ggIeAF8ymqQPticOc6wmD/qoAjkwXyVLKkCNBrapmc=;
	b=Cyg4ar61DTNm0VXhFR2CWoBUCBEpJcDHhg2NT4+Gw1rKxEnL8VQWRAITJmTjDklS2lWx
	 Zx6EitJLKNhHk8hKFniTT52EjQs+50L0HPHZ6dzFH/7Jluc9ag8wrH2jWwZXox5o9bHOr
	 5EO+phkfy51s+5lAH+oZllYSiA1o0ifPUgux52N6xCTw5NGnbqLSGA/E6blLytDin5kOe
	 T3K+JNwTcEqNMQCFbcTJiKf6XaVAi9yn3ft0iYs3ndG0LTJVogsg9B4FWDUtzj7fGGQ54
	 5n9mtNt6vE40CygwPnClCEV/scORNp55WtGa+WCjMsxunEcTqOPQXgmb4qfCtw5MYNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J9EdSbtg;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42C7606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E42C7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J9EdSbtg
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfb76b304so435403f8f.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109227; x=1793714027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ggIeAF8ymqQPticOc6wmD/qoAjkwXyVLKkCNBrapmc=;
        b=J9EdSbtgiLFlXq27G6BCfiLyCUmgTmamz/0X4sPuWGR7PI4baQHTwUqiGYuOjNv+Zw
         1+lFWIFT+YbazTtQ73hJYOUYzJ3Z4g1NZE2eOsEyEZytb/i4LPOqbzR0IbSPSNEytzDz
         1hHhw/E32QerKbf6y9ivfV/PqizTxvtDena7LjediVrmbjhB5EjOWBkPv/tNqmWrG319
         Ql3I/u4j6qJosxpMmd/ho6YxJ26kxYdNzdxIqPRZcfKDqva/aEjEcEyumDsrF2yfWlTf
         74MjiDyd35Jl7TGIWolX3bWIaH1dYsBJ625xdzWOV1luCLOkhS12QU6RQOgcVXRjuHtC
         2PGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109227; x=1793714027;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ggIeAF8ymqQPticOc6wmD/qoAjkwXyVLKkCNBrapmc=;
        b=wRJRxQ9/lX38IU/UYVTcP2An1aNH1HW5KRiTn1H5mUlhGz+MnHrS+w4jBxfk5xs2ar
         Rx/KRRqs0yhyH+SWYqNXZOn5ZTSpQ1DVqOrrmRQPWylF7rQCtTD56pb3M2LvXtw1cYG7
         r/85M5/t3KzQLYj809gPjeGWX9eVlOsXAhpI0CtgskdCd/vjONrraX9Gthz4K8sY0mBE
         aoCz0r3IhgTmjeO6Pm74jG1cW9HhVq7LTxzsStZNIn37NPVUXh0EPxQvRK8n5I2OFroW
         V0jfdEgTfdRH0kHRYIP5p+myrxFbGMf0dm3wlixyADEMhYZnKvd0WKpdxMKKEDOCFnW1
         9CrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJFmX1rUKA+hly/aPQqXTmOdosY19GsrkQTIs9iV1JIyH7a/6smO6K6oOUNDiDo8pEjHCd7MKqpI9U@vger.kernel.org
X-Gm-Message-State: AFq9FYIiZK88/5xnirQL70spuSi/VesOHbTqiJ9QL6KZ0wedKhiimycN
	qAhOMP44jaVOxqNhPXJIzQ1Q4OxnwVA5pbg0OzxbzTQkiMHcni4HVmFV
X-Gm-Gg: AYBFou0xgN26vzzilgvpozaRc+5jb4P2N7321QeMijjVv7YBzMm2Pq0hD1BB1RVN97A
	JjIYDTsSbJrordvieb6nDBB+mSNc5dgmYs8V+NNMZQrAZprytkQgUZmBa2WagkQGfEynKhy6igC
	+DvYE4t4+Yl3ummMMBKB+6+nMLUZpo0QLCEkOG5bML/1UE8Ayqcc2FWQiqjTRntQyRL/JWkJXZN
	YNQLQU6RxjtjROwObQvQvjg6oRZ0yE+xVssKxYWut1gq9fwWIekamWkyXQw6g7+BZbSiutz5mVs
	/I1+TFSRhkKDQlamUmQWROmK1bwix27Gy+qR+Rtvjo9Z9zogPdfGIZrnHgMIlinJGuYXfifxXIz
	m2ikaHL/Lp3XtD+fZI7VHfs6KnopTyq9ubdmOI4VosfSsVUQ6Hba29nWcDs9478Q1n8fRMw6t3D
	gSSf9T86VhX3jwEq1NsHSo/hjfnH7LE9AX7oL3KdMjRH1M0wrin3MDaj9jQFFfjEhnry793nOZc
	ZCknX5XOv6s1DaEu1B2MTGqPc1bYn/ykdWi69NPcDxFCwurKThlH7qBOVFj9mWRsb60mBfm/jLx
	9/qApZwnoBkihi9lDBzJwcmks58f
X-Received: by 2002:a05:6000:43d4:10b0:48c:77e3:6c8e with SMTP id ffacd0b85a97d-48e3eba1660mr15009254f8f.49.1793109227175;
        Tue, 27 Oct 2026 06:53:47 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:53:46 -0700 (PDT)
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
Subject: [PATCH v6 01/15] drm/clients: Kconfig: indent DRM_CLIENT_DEFAULT with tabs
Date: Tue, 27 Oct 2026 14:53:28 +0100
Message-Id: <20261027135342.2003632-2-maximpedraza@gmail.com>
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

The body of DRM_CLIENT_DEFAULT is indented with spaces, unlike every
other entry in the file. Use tabs, so that the next client added to the
list does not have to pick one or the other.

No functional change.

Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
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

