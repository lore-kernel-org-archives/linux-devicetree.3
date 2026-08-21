Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147CA4C77D8
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323127; cv=none; b=FVkcuaZznFafxvEtk5f7NOr3gq0p2+w+uqUspuvnSV6x2bN2hWIbdIVYQ8dI2Ts7olwc4vEbQ4iniwrD0qQ2uZco6UogDpHz4X5r62T3vnLgH0XH42xNnWPVkIemKwqeBKprgpk9at86gJj/KkZZIuEARsLo5ENnfnwBD57DSOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323127; c=relaxed/simple;
	bh=jP2B8Oq/SxivmT2+4bp6q/xxtMABghG2HFb3rq1F3l4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gZDvgbKNlLTvbweqPNiFR4O0lT3o44bt2O8G4ZMylELDVaGzIhMTuGqOM2F1LYF6bQyNyzbiEUYYKZAeUjqYUb7xbszlhs5co8sQfWZatQKDXd2ogcNyAHwL1PItsiY2BUluu/nGGIgq364/0V5k3+/11dRalACzO5lh/RTk8OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2prGbB9; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2prGbB9"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81ecf499af9so16657447b3.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 07:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787323122; x=1787927922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5O2ZS9+ansg0/IUrCuwtyZKXd4BjLxjahxk05rb1blQ=;
        b=l2prGbB9aWgh5KG4Lh2YNNx0p40f2KnizlD5zOKVCDXMjAL3mVg0r6djHgeWc+xT25
         IKm1Hb6WPdshTXX8qUcU5JBAK+1ZJHL2WwingsjsrYN7JPj3+sqmnCz0OQO+YWfGiNR4
         OiO9N4yVPWLZsnwp9MWjsNhxmMdntJpJ1Su4qOPTRmQsiXlurFxwGvELEEuaniUPhXd/
         ljgElXjAClTshuN2FdgrptddY+9tvNEP00FDp5S9wr1mjrKkGDHCSi22NwuhmBZpv0gD
         60DQIf1stsX4Oue6xUMKeZLUC026ulMzV9vjrpHPTNYw+JadB5A2Idb/cPStmN+kWEIp
         qHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787323122; x=1787927922;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5O2ZS9+ansg0/IUrCuwtyZKXd4BjLxjahxk05rb1blQ=;
        b=VdsUNiuHXUYvVhVEO8xpJi1R4fiJDMArbAnAxUDYyWm6IvIVPEA9N5JPQueznVcnhx
         qgBy4GbbijZEPRH0ROULL1Az9n8dM4aaEHQNgzyYE6wugZ1V3cxCgYKwSlln2ibFA1sw
         b6Fpd4OKeo9bjIyhIJuiXpVM8D9cZOzMyT4pRbk08YstH9otDEPhvYsv+u3su31+JqVH
         gp3o+Z/2+amzm3bi/EwuN6+Evp0fHobTOWyL+hvutbhenYhHItMnwHb6njniVmhlIW4a
         E1C9XGwQUoGzJnnHjR61L9Sj8EPgqkUDPr4dFLG3DNBttUm4XRhL6ouRCrAb3I9dLqk9
         63nA==
X-Forwarded-Encrypted: i=1; AHgh+RpxqUH0qNOiThj7Q5dJEQEyIsdX6+ErQzyOz7JtFMJWFZtWH5w7VgCM6Fpa570RsTBsCWIr3hXlzsBi@vger.kernel.org
X-Gm-Message-State: AFuF++lBrPSgdZiuGlDyWjpsVU+RyzHzthwcTDUF/bPVY8Lxv2jkrFeH
	VQsvIVi8nCwc/VqlYl8nCd6rnsBnsP0/YEkl6kULn/OltX/dcXo8nZk=
X-Gm-Gg: AR+sD13kjwXCGxCV+ckNx4jgmrpO0zGGzzS3Q75kDtUgJydahvUw9vNZefOqX+Sefac
	IEJXlSxhLrnwAALxMHBP8E7JgWMEEIAbme75CmUL9VdLfvvICagOEBZfvrmLJpUy+zi0Qp497im
	0SYR9w9al0We+rsMk5HHRzRmCr6hmdTkVNgoE0B5WAzkMXVUnzXEg+QjgpJ6TaG5EviyrHA2S3S
	krIysYynRqSo3doltUSWQaI3u4UwDqMOT9YUFtIxDpOEN733/8qtErSWjSB4KEUgtznXjZdNeHk
	YStZpWVe/lxhzwIzbINGrqmd2mCab5zmWLzl8Dzeq48obox12dNcjN/Fo/uE9IfEFIxIbRnoltg
	BOMInNR+p95weg4UlXGXNTxOo4ogQRR/fY0jwlHNW85FmhSDLcYGorqsxGDqWZ/NHFd4BSA/Rfh
	HcQqbvDpKSq0nDXWk55wHo46o9U++H6lmmPmrARz7CozVdNR2HzBV80HTlWqXAVjnSJKTF39neJ
	r+zWL3rETII1hJSp4lt4viz7qOBVbANQEzdrqs2
X-Received: by 2002:a05:690c:e288:20b0:81f:d505:8ea4 with SMTP id 00721157ae682-849f449c2b8mr21855567b3.18.1787323122701;
        Fri, 21 Aug 2026 07:38:42 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-845188b28f2sm41868277b3.38.2026.08.21.07.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:38:42 -0700 (PDT)
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
Subject: [PATCH v2 3/3] MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller
Date: Fri, 21 Aug 2026 11:34:18 -0300
Message-ID: <a56f15cab62e16df835fd702f26739a381949bec.1787321297.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787321297.git.nico.antinori.7@gmail.com>
References: <cover.1787321297.git.nico.antinori.7@gmail.com>
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
index 59d60df34dfa..dff105e5f01b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8581,6 +8581,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
 F:	drivers/gpu/drm/panel/panel-widechips-ws2401.c

+DRM DRIVER FOR CHIPWEALTH CH1115 PANELS
+M:	Nicolás Antinori <nico.antinori.7@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
+F:	drivers/gpu/drm/chipwealth/ch1115-i2c.c
+
 DRM DRIVERS
 M:	David Airlie <airlied@gmail.com>
 M:	Simona Vetter <simona@ffwll.ch>
--
2.47.3

