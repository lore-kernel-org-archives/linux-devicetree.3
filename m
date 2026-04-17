Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795B43B2FFD
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 10:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776422880; cv=none; b=tDEO30DTYcH08xaJS1p3EIkDa6kRzrT4hF8n8Lcz4ABME4x3HvvZ8RqcP5SEi0DkI2mvdcLsn5Z+BKN8i4maa9ZHNqY7/T8UCxu1GwiAYmCft7/NzlB1Fsfl37BAqqlu75g49Ba306hM+FVLrZ/5hpwKDVLJ2wB9eQnr/TEVYAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776422880; c=relaxed/simple;
	bh=NLar0utG3ijy+c3EwpMDhwv7yVQcWjBJdwRBW3ABryw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r267jzxuDnT+4egtd588k19HZWtrs3G5ixYOMpuKr+tB9YjhwYgYls2LDjV9wZrnP7yLhXu4RotdUTUjeJbXQK3QMg0KGacqP2Jnu/DDOqzGvwwkJbRbfVo3L4DcuRHiPLTk7ZFPYNiwAikT8voenDcqEqqEEHaW5CvBoG4mW2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmjr1ov6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmjr1ov6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b8efed61so5977435e9.1
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 03:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776422877; x=1777027677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9/EUUegoDXn44FXScp1to+APnGd2Tnc7fnqt4PuWeU=;
        b=lmjr1ov6amNEAH3/xPIClEeDHToV6seb3G5HhEdD4Pq2tgy+ZRpRc0NRKZ6uwdTv9P
         j7iqnNJhk2rh30V4eALMlAuUZUWRiUiLfE/gU9U2YjDx/i2mOVUS3n/PrMTl5f2ioJRH
         bLr/3LORyRnpgqkOzlP+Wx0NHQtfHGmKFwpZa1cJNDzsSSzQA8hKjzz11XdNp004DcMb
         uOir91G4cBaepgBR9oJ2yLQDx2iKiCHR7uBtWMsu9RQzRlrwtouyhWE9u2UT2byYdHVY
         dgbtAc18zb3LcT9bayEOD8s3rko908Obo8ZAVw0f7fq/oQpfXT5+kiAY/m6ky6YoZ94Z
         aNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776422877; x=1777027677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L9/EUUegoDXn44FXScp1to+APnGd2Tnc7fnqt4PuWeU=;
        b=eqBDoLfBvKKweB2vty4zEh9xSa3DMTHabsIovIWRzSWDdtBCZeTMxs/WknutEoEsAs
         axg2zkvVQMPqziLf3+6ZRPFwhF/qTlPs/T5WsYYsiwmqY4BdsOEFGQmW/pIKAFvi9XrG
         +SLJK3FS2gwhJEgPadMEORM/NAYE04+wRvkzdlFJXb984WPOrVd9G/bZyzHxSxl2GefH
         I+gt/7CWPvmtG0ZfyOjeiDG7uslAeCoF9jvq8Ty3esXt21cvyLBvpgUnkR62awkFclHk
         me6tnoR9/ZWgb/zGsJ0DpB6FhnLHXdnD/p9M2bvFq3YkstyeMGed6nklv5qV3pL8eKpc
         tErg==
X-Forwarded-Encrypted: i=1; AFNElJ/4e6dL8afUK5LiS+hsGLN2CDqKFsWCdvvERamJV1rA9ow5D5aPCcr9Desb5+ZYrDk+mBs799/Vjdhe@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1KgCkfF6/qXNqMqwAUIcctitUH0SXXgTQKwE2sZ0klGN7Y0WR
	TWwWK93kbne9h9q1B/PdmvTIvaIWwJ315TcKkWL9lC07nbL0FbsihR9d
X-Gm-Gg: AeBDietKvMk8nn03xhzgy3TpIIuERwrBo6GQIu2hDRR/WGbUiOxG7iiZf6wEgx8AEJX
	eNkhJsl+piLfXOIuceTNKiOaFB132xJuJAMj8Ahh3MUB+nxeHGNgXra7M9qbOl0Msh8+4SbHQC0
	jxx8PO7jvqxqYIA3Siv5tizxUqr9ZdXS44blqspeKnyIf+JlSELOl9EMoupUq0Y/vUumiDXVqLL
	FXj0SELTEmKhiI1h1lM0TnKG2IzF01GbiwXufg7OFzpxOlMaRikmEN6Q7Zg1SD2ISwRIMvStKA6
	bCMGPlaQKihi9kXKT4P60y+lAlCZjzELHNUBtK6Png2y69hVjlj3Cvhaqk42nFJQIoZJq2yi8NC
	PSlcdFVn5Jukv4QeWkasUVbINi7c6WCfbLHrU0HjY0llBAxriOLrYJ8/vLOWe0aFpJ+mah+rLzK
	FU3+Mg6Fikkjx0g1voZHjko9O2/Cn3Vg==
X-Received: by 2002:a05:600c:a6aa:b0:488:a9c3:44a3 with SMTP id 5b1f17b1804b1-488fb881cacmr18412825e9.2.1776422876800;
        Fri, 17 Apr 2026 03:47:56 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d5b1sm3732966f8f.30.2026.04.17.03.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 03:47:56 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Jagan Teki <jagan@edgeble.ai>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Marek Vasut <marex@nabladev.com>,
	"Kael D'Alcamo" <dev@kael-k.io>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add compatibles for Zhunyi Z40046
Date: Fri, 17 Apr 2026 11:46:30 +0100
Message-ID: <20260417104740.259689-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417104740.259689-1-l.scorcia@gmail.com>
References: <20260417104740.259689-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Zhunyi Z40046 is a 480x800 24-bit WVGA DSI panel based on the
Fitipower JD9161Z DSI controller found in the Xiaomi Mi Smart Clock
x04g, apparently in two different variants.

The Fitipower JD9161Z LCD driver IC is very similar to the Jadard
JD9365DA-H3, it just uses a different initialization sequence.

Since this is the first supported device from this vendor, document its
name to the vendor-prefixes.yaml file as well.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml   | 2 ++
 Documentation/devicetree/bindings/vendor-prefixes.yaml          | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index e39efb44ed42..158388a284d9 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -24,6 +24,8 @@ properties:
           - radxa,display-10hd-ad001
           - radxa,display-8hd-ad002
           - taiguanck,xti05101-01a
+          - zhunyikeji,z40046-ctc
+          - zhunyikeji,z40046-boe
       - const: jadard,jd9365da-h3
 
   reg:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6339988e3805..debaec59e9a0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1923,6 +1923,8 @@ patternProperties:
     description: Zealz
   "^zeitec,.*":
     description: ZEITEC Semiconductor Co., LTD.
+  "^zhunyikeji,.*":
+    description: Shenzhen Zhunyi Technology Co., Ltd.
   "^zidoo,.*":
     description: Shenzhen Zidoo Technology Co., Ltd.
   "^zii,.*":
-- 
2.43.0

