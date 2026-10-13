Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557913EDADC
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883981; cv=none; b=ipDm6tayEwMPJ7UtdISI5OXXQdtou2WziqBH6OK/fwgEMtx2nePQtLowaAEsNyolw20vdXivP3uIgHEi0Y3RHzXmDrjToroguebSuTbN1m/Me9xDODobslXiaKjZSIqya/bJYHwErtDWKGdVygC8Ohf+3bKMkq64D5fH6akr/3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883981; c=relaxed/simple;
	bh=aRtwvMv9yIklUEfwA2tgF7gNewrgncEQ/GN8vn8QiY4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rwGIkNOCYScyhJSVdV64UnQCI4pDhp/UXDWUVTS+u3efar1maBsh4O8+lRDk8WNHz+Jl2wui16y3ZrLeSMUAS318EZUvl252halUQjYGyHpuBIzs19hai8Rjt4KzyGR6WPDIQlaC7isKzzjzSNWfzlBNLA6M23N6nVa/f42tUbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r83duQ7n; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r83duQ7n"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1514139f8f.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 02:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791883978; x=1792488778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6FMp4bmsFYk3mzSCH1/ElOs2cwgfyNFSJhXfclhOUCc=;
        b=r83duQ7nXCBb1NxgMViTUYQnb/tZDDGslK4TR5GAYdQxkBIPuLZNmr5Z166cduMhx0
         2VUQCwLEbbuJ6RSNG50hn3BZ60PZmFOcs9+Fh7PQEqS+tq+ow54LyDJE/J8hxjz3RTIa
         9Vk56WZKCvpihlA/fyZ1ZUYXQqIck02WKZDlUhjyV1VF2kcWZgt0lkKUtWbeCGhf/4Z3
         QJJqkUXHLJcELfmudn2bOKjvkKLOndN3/Uzl+m1YAXMvTaOU60JTtqill6b2LVgBU3Kf
         343TU7z3DQa6zu+u8474OAY6oZpI6GDJU12nGIsEntUZnGXDxbocZcoFJC042EryN4PH
         iu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883978; x=1792488778;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6FMp4bmsFYk3mzSCH1/ElOs2cwgfyNFSJhXfclhOUCc=;
        b=RRHsL6KzYGmIyUWP7TDnUMP8I14k+jUUEHNncdIQYA/BUNJLr+JjiwD3YVcic9cs9D
         PKpGg6qlhLf2TrhOWUq8BDizNA6vgfSXpy07qHYLcBFdeuv+H39/mWAIx1LmhXCfCJkB
         ky1bU0N9udqWcpaNjfaQ2urOmIF/LNci4kxIU9u7Qkmru5wrV7Z2miExsw0J+uyJWMhA
         qPXi37wrXtTpvg4VIImlhFNYoibJxvZkv2TSyoN0SeA4+3QVnE+BeDYibaPJYOp/7TKA
         ixSOZ/RtG7U6AAbopJ/hRpJGpmwlFBi/9TvGDRN6H/YhVegn8aARFJgExNoE/gmpqNrj
         wZTg==
X-Forwarded-Encrypted: i=1; AKwUvBxSnr3QiUq4iIJ2H+NmFjmstzzGgZnoF+I3CRTO3TrWa/Cr/Iin/usKSXnbKZAMsmFlkPNp3yo/ep4t@vger.kernel.org
X-Gm-Message-State: AFq9FYJIx9f9qsawE5S0kJoSIWJpPUKkFj6Qw0fesTOVDJaKXb3XWvZT
	hecW4dx1LQwKiy3JZGjYE8TokSclNf/5iiW4H0DWnTgqnIITySFePMboO2dbl9yT
X-Gm-Gg: AYBFou0ovOfou5PtOpqFVJSfrVi+TgV4JLKRTR1nEmM9WRkUemv3EWRETq1PXMQg5y8
	f1JAbxJ3LGx3cXxeQMtvWVV/GBp9M/UJkMDmhou+LovUHh220UbO3RoYWDi9RcSQZudgnb2eTlC
	YjwvQE92mlqY15SJwCFSr6V3wZGCZYDU0/WnOEwUp0JNKIhuF50VNH/QRYUO7Vvt5MqLaPXckOu
	M91p4wV9OFarakNZFkCSh9HeLdXDeDVA7aFbCgDq1oWIi8UySo8AtE9wgCyOzguOjHdSw7/DQ//
	utNJwImzF7VRnQqxDKKqEB8s0nYPJ/nwz8ygvP8yWpSUhMKfnWij8dimUL9Q36ju73JrhRa5djB
	ebnpSfsxvu3IRC65UVWEB7NG0LIdMXDiMXiKwpefJxRCAg0rr4GFy2vrMJhbE0/kORhBnhRzaTv
	G3BfPSuStwuRIJNUZpqf2dlV1mwkKns2mCLWiE7WibDoc1n6xa7hSCWCHjB4Z4kwm/ZYekKH+q8
	iISXx3YxHMGYHqz2+Rw8MJp
X-Received: by 2002:a05:6000:4313:b0:48c:77e3:6c8e with SMTP id ffacd0b85a97d-48dbacf4700mr22504037f8f.49.1791883978432;
        Tue, 13 Oct 2026 02:32:58 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm3986774f8f.48.2026.10.13.02.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:32:58 -0700 (PDT)
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
Subject: [PATCH v5 04/13] MAINTAINERS: add entry for DRM splash client
Date: Tue, 13 Oct 2026 11:32:34 +0200
Message-Id: <20261013093243.505776-5-maximpedraza@gmail.com>
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

