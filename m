Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56627585978
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 22:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202992; cv=none; b=Ur+dTIbnnGqB2QHjHQr3rBEUQ4aguKKgDAxG9HUPNIuPheCOTQpP76bldBnoGG1nxbOZMDgzw6V9iNjE033iQvI44UHNkssfHcPNNwOmfNZr2/BudGVmC7OhZ3fW0PHN3cKgGBPgFMR38g8TmAuBc03M8cjWVW3dyHMHWyBBzaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202992; c=relaxed/simple;
	bh=hko1Wr/P+mWTP60B1SdiXSjPWfGT6Bm7y3xjnUp5+yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=syix5+RQ65EBEC/wbuMVznZeBH9IbwaBHLOLkUlqulAPE0R4wenw2keDyeLLkedG6gPBMdQb2ZCy1wv3z54+ZwtRDL3oH6O5v5fatTzIrDSkzMsI/pPoIC7rsnRkv5W4w8QHxm+7rPohrC3idhWaULqOtuuJCYk3r9hKYTFrqPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcouIPTW; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fcouIPTW"
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c67e5059fbso475939e0c.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 15:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790202989; x=1790807789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jqAh36LRZFOSOGvgNmY+eEB5gitwvA40LvfMFJdUpDA=;
        b=fcouIPTWGKTJ8dCXMXPA73TPdHNvE3jsWxLx6f3i35iFGckeHc5w6NDwrsLYwi7ODj
         HmB5hCnvSbv+0z7GHn6aOR5mKmgOdOUyEh66R45yyt/GL5Fi08rR63fr7e5GPpZtzi9O
         X+JWSppxcWMSPjMxf6Cdf2e/ytU29sUtqhx+kzy/+P0wqo3FDKEzOhU5BBNyf6Luvzb8
         I3pdwAN4Hx9/uyNLqjSQKe5bQC8JYaLIizeuvQz+zZp8HhR0JWou6dUD+ttDwr+gWFLh
         W7GLgEGQjTdS0hNEEfXuxEa4bPpndMx2tPE4b/fwuuatKyQGosXHOKf9uyja6VseEYko
         gPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202989; x=1790807789;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqAh36LRZFOSOGvgNmY+eEB5gitwvA40LvfMFJdUpDA=;
        b=tBcLGHG36UPZfQJetVV8+b7XTWThHHBs7zBdkssPiWgC6Q+PYAnaJ0l6yIDWQv3h50
         OhoJDexujD8ghdY25wfx/vZSd9mt/oMAqZ/kkysmpkccbCmuGh0BJCEbzFXG38B6d/ft
         89GTN8kBdW8Un30YC3xp2m4EES1FM6s+BrsOZYX2NhiqSGWCG2D6R9CH87otoaQOaLVz
         inB4mbdzRCO7c9AiLvqNWL1+5GM7uhx50NthOnDxdBDBcf0IV/ij8vXHUj74XCTGUea4
         D5EMYRqaqjLTqROk5tQIrvdqmtrEpmGh6K6knj92Os1W7rVlBNIwPX93T0Jzz0f0V1Zh
         Lr2g==
X-Forwarded-Encrypted: i=1; AKwUvBwz3lDta2MGIa1qSRD7arLiRyDCcro6K9urnGevbVDEuAf/Tv7eKbdvF036IXnh808AVhChqOoW8hah@vger.kernel.org
X-Gm-Message-State: AFuF++l+LdNx+uo382Z6AWMWHC8sjWglob9UZUqZwXSxurXEgoGbC4xq
	MthYuhgHrOEDUwkyx56NJgseGme+8mRFXMJHvJKuHkcZ9v/WpjFgirs=
X-Gm-Gg: AYBFou1rD2grYTP4buRbk2noIAG7v3ZrLUqQLzmFF+znLViN4BshSYAGVD+72CfxaXy
	Jot/BXRIkn1gWI5w92dPgRWEI2ezwufMqPoJORyd4aTOdtW0cOK+05EkHKsGSQNCi76J8DXalnO
	bH54vNz1T1UlRf2T760esqQiP00O2GkSK3HT0ep1ZTjH1VPHIiTs+h6SUGcmk80Cq3y9U8aukFq
	l1kov+wYFqI/mKS6q0usYgFxTsEGa1/h7OnLT09t48Lq/Y0tsGD4tLE8iHgSDvEqQrvyPXOTBQq
	XAtxzyMsSQonfnCzKLYsZRxbcUyO7xkc2CH4GgbSkYxes7aCicGCsFa8FJchuDR8vwuKWiw71hQ
	aPinjedY8UYAany2uSxq1My4HrcmM3WaiJ4a0ljL0CBn+UyheMY1jDxqnN3s5ULrZdHM4Cdp2OJ
	cvlQ2QZRODYQsi7lKl+m9yN72eVLyBDGWTGoscHGnfQzmNMO8Ma8Y0+NLJouAvT8De6qJOL6H3h
	6xfZgxlLqCtNholf+rHnssnrasONhoMBDQUsAE9CLp2m0scUQ==
X-Received: by 2002:a05:6102:2914:b0:7a6:e08f:9fa with SMTP id ada2fe7eead31-7af1cc992f3mr537802137.13.1790202989138;
        Wed, 23 Sep 2026 15:36:29 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04fb621sm5162983e0c.9.2026.09.23.15.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:36:24 -0700 (PDT)
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
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v5 3/3] MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller
Date: Wed, 23 Sep 2026 19:35:15 -0300
Message-ID: <5ba56a096d825fef6b291f4cddfdc5f0caef9dbb.1790200427.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790200427.git.nico.antinori.7@gmail.com>
References: <cover.1790200427.git.nico.antinori.7@gmail.com>
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
index 054178b88dcb..0a3c3e6f0af1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8665,6 +8665,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
 F:	drivers/gpu/drm/panel/panel-widechips-ws2401.c

+DRM DRIVER FOR CHIPWEALTH CH1115 PANELS
+M:	Nicolás Antinori <nico.antinori.7@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
+F:	drivers/gpu/drm/tiny/ch1115-i2c.c
+
 DRM DRIVERS
 M:	David Airlie <airlied@gmail.com>
 M:	Simona Vetter <simona@ffwll.ch>
--
2.47.3

