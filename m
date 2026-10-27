Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109240;
	b=fFb9SHRHtwz7rFAItAr1TwpTGYGv820q/BYm7sodauiAClG1H6hMsvepzokpdlBBVbLR
	 7TVv8cT4+/oCGLWt5Dp6C724htWJ95GOfSpViWdalZITS2HdRMtHEWNduIqhNuNGSur5x
	 nQ1H++xJ5iZ865EFBopUiHNMhvQnKNHVKkEGEYpLtlmxsuTWA2n6CMms6d3rRfyfn9Svb
	 S5ahjgclSJ6jCc9977jFCMTMRcA7aHACD/dmxQ3zV0k96Gr/Hmb7L3vFlHP0pqtp3VNBK
	 cEhOmzzXck+/Xr+8QnlK7ZvghAoE1kHtXT95xsFQOb7TdDm1QU20Efee2wozttUyftg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6FMp4bmsFYk3mzSCH1/ElOs2cwgfyNFSJhXfclhOUCc=;
	b=KXCj03O4Q18U4Xj876ce73Pifg4z2KOd+M0k894DRrSz1vNwTln/9FdC0Abz8GcZDzPQ
	 pFWkbDZ51CQe5EGY10FCSZwWhgHm9XgX8WFo03NyR1ct7b4FnuYREBsiGU5zQurDlUBRg
	 MdqOVa0o+8fOylHAodckNeXbM0SBnF6GVFfjJilcqtELvFmo4Gr+zPtOGiMg0GBQ5lk8T
	 dyd5hiSwydeYo2RzDSbNpDKeBTc16sVVlEeSV7tX4kPgtjCWYTor8LL6KOR5t6VQ0YKR/
	 oCZtabahRwyION2AYNvBtbQsnrnVHzKnEEpp+1MJsK/qKDfLzZImOu366bAvJicHBRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBF0TdNK;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF607606A339
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF607606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBF0TdNK
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so24563925e9.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793109238; x=1793714038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6FMp4bmsFYk3mzSCH1/ElOs2cwgfyNFSJhXfclhOUCc=;
        b=EBF0TdNKiZev92JTXZUKMNM+bikjTpnl6F+xtg1lO25YQMK6ahE6FtSlVFxjBHIfIJ
         2tDrWqG50yvBgr1XKRETOm6kWMHgVeuJM7lBibOyLXXDYgMKX1OPJwSjhZhLALr5KYEc
         Q1SCgLNw6BDYwmvXk5af0SJUgK8tAcDbAMVyUsW6eeK4lI9ZJ/zeaLnLSL3QXyaOHP9c
         3LAIk0jo9oQzD/MXMTG9cVzn0VCwjdkQ/RQrhNaRSRhrf7RTxJJ4NNApmMPopv82MM0Q
         ZP99MlLYSNoqXjI22Xh68F20Jf0avL8oolZjogdrqlkKurBxko1tjvuPerYh9ooefJAS
         w38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109238; x=1793714038;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6FMp4bmsFYk3mzSCH1/ElOs2cwgfyNFSJhXfclhOUCc=;
        b=drCluP5b5vTKlnLcBoMX9KcVGob2xPHpq4H3j2XQt33FkDWxLYARnntTbnRfIhqUVp
         5BG88xW3wOhc3cXO/+p1B2MznQ87ZXir0mGDNATSL9wx0lE4koBEFvh1ptglBzA4j/HH
         FnlNb5ZLkct6yt9KN/RMMC8pODpHvAhh6CWZiFrLh2yJhPBgP/Uohwy4cGAyREF19fKD
         hap1t17YrZotPZ3x9Nb083YwT7n8LpyhOHpnezW0OQUkP2aTWBKmJHAiIUbplfjKJZ25
         nHoI8qdGkBtSvnhdAcx7+lTu5lkmd+6iWrJUiEbLkVMlgiGpKUUFRoHU6zA48fGKM5Sh
         1uWw==
X-Forwarded-Encrypted: i=1; AKwUvBwe462g2mcIUNTHCyGU2bj7ql+DLR6zyz0G0864ileq5DloRICQ9ienyd3TtlvJBvimngcmeR5MMm2m@vger.kernel.org
X-Gm-Message-State: AFq9FYJnEvwO7ogs8rJKpkcSSPNb1/mS1Ry7ZZtHYoS3DMt4//q5drm1
	7BebIggTaKHqq/n9W0/rBzS8aVdRvFTeYe7sk5OCmbE4cZoMBDbHLpX4v2n5rH7N
X-Gm-Gg: AYBFou034UegRs7Ql6Buz7xx+1gpGzGGyGn3G8DuL4p1xAPKZACbH+G/WlbCfhMkfZJ
	ZgH11lDXfv5HewxLkeUBWrr0ddU74qlXjN1ZLXeDV1YIv1SedW5CVGD1qU2PJj8c8j7MvFVtAKr
	4Ya+Qk1KlVResmgEGb8j7QvZC8sWEMxRKsUhs9HA/4pcvcMI3BoaZhlg8JGPLqtu/P/Nb8r1V0+
	n8lAud/Xwm9jirD6QupyN9+BZEAaoLBDyASJquG7deiCmL7LekxUyCP6p3DgezoqjCqwmg5QLnP
	S4gFEuSALbHhB1Hj/37FORJIiojUiLUPHIbPqyhhWGDGrYxzoNMMKmSxLsFGenGQS49WvCoOEYd
	yZzq95eCTiW3tv4W8Qen8rRAMhM9hkU0syoJkNbWGkFlUW1jm9hkmoWLYyMbwBCT+jfOoIOpsWU
	uucc4o54EO9TkYRnY3gHeURJx3HFmBinFx/Hu/+XpTxTHmgFGQwBz6TdfgM3ncO0UzR1TRTJg9k
	tr5tJbn5xC7hTM3ggJQZZRhrqg1/2xhGFftAlDmXFgnqzMgGoucwzFUzmLyQ2buhfpenfxgkYAV
	+bzHcxM=
X-Received: by 2002:a05:600c:524c:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4a35ac8bdc6mr188823805e9.8.1793109237982;
        Tue, 27 Oct 2026 06:53:57 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:53:57 -0700 (PDT)
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
Subject: [PATCH v6 05/15] MAINTAINERS: add entry for DRM splash client
Date: Tue, 27 Oct 2026 14:53:32 +0100
Message-Id: <20261027135342.2003632-6-maximpedraza@gmail.com>
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

From: Francesco Valla <francesco@valla.it>

Add myself as maintainer for the DRM splash client.

Signed-off-by: Francesco Valla <francesco@valla.it>
[Màxim: add myself as co-maintainer]
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a08087fb6e67..321ecb9f5b5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9168,6 +9168,14 @@ F:	Documentation/gpu/drm-ras.rst
 F:	drivers/gpu/drm/drm_ras*
 F:	include/drm/drm_ras*
 
+DRM SPLASH
+M:	Francesco Valla <francesco@valla.it>
+M:	Màxim Pedraza Padilla <maximpedraza@gmail.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/clients/drm_splash.c
+
 DRM TTM SUBSYSTEM
 M:	Natalie Vock <nat@pixelcluster.dev>
 M:	Arun Pravin <arunpravin.paneerselvam@amd.com>
-- 
2.39.5

