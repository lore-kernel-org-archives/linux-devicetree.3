Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9D6214812
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 06:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787207210; cv=none; b=eTe2+cp3MFn8l7U4951fUry47xYtbkUJPGZ64hmxwEs1BXtPdcYmybxk0q4XYsETcze5lXXlEWGuidFoTtGWPy9dnsIE+iVktv3iSgsEhhWqNQ+2ZTd4XgXzTtMSINbWPVy7lF258aDNW/6aacKRmQXvTI5K905jaf7oA4h4Tmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787207210; c=relaxed/simple;
	bh=Y7FWCaIl/m38lorwaP2Ul9eKdzFyPd2HGwBRLZPSrWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P1oRc6CbnqqIje9wGmX10rNtmluUCkPR+pjOEx8J90znWKXwbwYxH+PJp86gwBhh9c95uNhmS0acOUTGncRfBLRludBIWIYBfHMzcJtKzg71G5Re3WsU1AKYopnBfMDKu13B3ifj6Wm0YOiw4XBMAPjzBg1yFSsD9ZzAMLd6s20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=ctGQFP4l; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="ctGQFP4l"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f6609c657so855632f8f.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 23:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787207207; x=1787812007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XXp/MDRgAGHd8zWbW01jplCVgKPQQ7sYClUxWbMVy4M=;
        b=ctGQFP4lua8rThfVwnevKK26YGJtMyZQjm1zuxOcrGnYGzOl8VPgoUT/OW7pZh57fx
         MVbhLPUSa9IVN5G8tEffrauUp98MXZ4qStLG0YYa1lZAE3CK/2dL4pHDoGsrtJLdA8Ns
         BjgYwjqpQQ4ASDW4CCM5mczGm5OA8kQK+x498q0Ghuvb8ixnsNPiXmhb+FNO2nq60niL
         2jjWSo/rH4E+L5HBlsCjqBDb0rxmG5Mrcnxjnv3VFhj/yh5D8H+NcEck6iiP7cCsMRyk
         TknuRdoGv3slI+W+3y/yZ+LooEMHyghuAkxJyVTZ2kwyyx315I99hPG8ElP35UtiaZMD
         tWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787207207; x=1787812007;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXp/MDRgAGHd8zWbW01jplCVgKPQQ7sYClUxWbMVy4M=;
        b=Dzex+ARcpE14M086P7RQx2ZIZZohzD05f3QM3yqhbUCXPSWq6YKjmy6RD6kBAFbRjy
         m5QocVq94DTMQQMNxd+684fSvUbvuXA7AeuFu7g5wz5e8Jwcr/ayl977g8D2Qq/ei43w
         tLUlx4m+jz6McJJRUuyrmPgYVSI0tFTrazQZcwAgAIriJB88cClIunDIimFenzCBycHx
         pGLPg/Rc54c8xjKsv+TC1sQHlxiwXunxkEOJA+bK4w+HD4RtryMTgOKw78rLx3i/27z5
         l2hsTAo+vsxH23ElIWjL04v8Ayv5kbu+Utnnq0WLk+mF4Zzi6YCN7TPgYUkWiJbbTd71
         ex6g==
X-Forwarded-Encrypted: i=1; AHgh+RqLy5w6GKJ/l1dCWj4XfcCqkpwXoNI6hNei1yhryPXaUI58do3KptRH2uFap9eJe/zHZoJENk+MnIOR@vger.kernel.org
X-Gm-Message-State: AFuF++lTFQn/39g7QA0vgCJfXA/i4vEx1vV+1orZX1Gf6Aw0Hq0zNOVD
	VHUgu5HtRaq396bhIVhbYjdcONgSH3LO3q1F2Yg0ampZWTDhJIGUKW7XYdXTtr5Oc0IX/WRCHz+
	7gj70Gkw=
X-Gm-Gg: AR+sD11QYkXs+i2KGfIXKxt/vzuUHnJFiul4zpJ/X1X6QyXYnSgN0vSpWsW5ghlN8OS
	CItFhDGcAupZCdXH+2oYNpJg6fhhxVZzfWzJHKp2alijy/27nJOy4Sr7uJGxL4nl7hAoKzXi0u8
	Taua0Q475rWkX/FC5AjaNxo69HRa/B+ppAfX6zAm0v7mXosos1HL+8PceVENo3Qk/pKViIiLesZ
	5AXwQ4D0NTAaowA3/unvo+FwGH6kWlsgVtSkgsNsjN3aKxEH3RxlZeBbEYU+HD8ZO6laCKVVNLp
	CrGVoxj33ANGd4AkO4O3WlNKUAgtwhIxeXY8mJ/4Ln8PluBYsaLlKUquHNpjSQt0223oMbaZJwK
	/TsvAj+rzqViVOGdLAdmdg0jvmLk/6KXRsuEzS9iMHJGBiyo9qGFUBcs+FzCfIuunZV8dKg7E/P
	aujqERz7WBMrjjCwyg4mbrX8ZVtkeqLGRMeLwdsl4GvRKNKez5hNyRdCBTV7iU6dDt9X6m5Wyr7
	SY=
X-Received: by 2002:a05:6000:455c:b0:482:bb55:8bda with SMTP id ffacd0b85a97d-482bb558d4dmr2428596f8f.5.1787207206966;
        Wed, 19 Aug 2026 23:26:46 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.23.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441725sm9980054f8f.3.2026.08.19.23.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 23:26:46 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH 4/4] MAINTAINERS: add entry for the ES9039Q2M codec driver
Date: Thu, 20 Aug 2026 09:26:26 +0300
Message-Id: <20260820062626.39218-5-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820062626.39218-1-karl@asseily.com>
References: <20260820062626.39218-1-karl@asseily.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add myself as maintainer of the ES9039Q2M codec driver and its binding.

Signed-off-by: Karl Asseily <karl@asseily.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8014b9f8253..7014285399c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9625,6 +9625,13 @@ S:	Maintained
 F:	include/linux/errseq.h
 F:	lib/errseq.c
 
+ES9039Q2M AUDIO CODEC DRIVER
+M:	Karl Asseily <karl@asseily.com>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/ess,es9039q2m.yaml
+F:	sound/soc/codecs/es9039q2m.c
+
 ESD CAN NETWORK DRIVERS
 M:	Stefan Mätje <stefan.maetje@esd.eu>
 R:	socketcan@esd.eu
-- 
2.34.1

