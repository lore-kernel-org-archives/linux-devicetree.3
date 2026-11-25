Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601993;
	b=mYU5k5ljuSaK2ns983CTjkDsBzRtvN4C5FTNts10MMgYEj+KNnk07/jPiKrUjpnud1Tu
	 tItg1EoQiSWxIvpqqZ9ThNTD/gXXIOKE3mm48wNWPxc/pdIwLWWBqkd1kpezNsZWaM1j/
	 i40hKEmEd3uxyCeb0ulMVVhyp3cuPJcbj/NarJFf8P44a1o41279hhNrInWX0JeoH0GYW
	 xIIJswx9csddW698VFgBXUwWloEfskh2vTmfCnwGRKdNB9vRy6XumeDX73I44ocMv5BKL
	 vTCj/EMyk7NRAok5NIAQUlE/Rk3f9aBctvatE+nxzynlUgayjTURcI4Y004+6/DBmbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601993;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=Tp8EWDBlw09/za6VVbHUXILROD5Fv65N0+O1lixBQxY=;
	b=l3P50uVvb5+bKrj5I/cXbHB+kKhuH+O7ZNjf0vPfhyvqARUfHznCvYs2dncICgh0lYzR
	 4huoeRrjqkg0An3VlWT9ELj+u9qSWY1nxZZyZWcdYMS02/1bmaEDxbrdFP8DnpHfWVZfB
	 QwwvM03DHXHdhTUQB3sup3UEVxZSjU+5HLcix+/tTajA2AdEhRuRRFSaIwAIt4WJU6hHU
	 DsJHiPw67cSjbc06gOE0RMk4C45OM0oOsc9QEKM9cs0WMQR6x/l/DXxxpisvSBQ1HJvwZ
	 gIyC/Usq6KhGOgKbjMD+7JPrZNeJamKG7sI1DCYa2RueqhLiQhS7eN8nbF0jw/cZLWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alessandro.zini@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=bfORKQLy;
	arc=none smtp.remote-ip=185.136.64.225
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBE8606A338
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FBE8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alessandro.zini@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=bfORKQLy
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202611251019505459c7673700020746
        for <devicetree@vger.kernel.org>;
        Wed, 25 Nov 2026 11:19:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Tp8EWDBlw09/za6VVbHUXILROD5Fv65N0+O1lixBQxY=;
 b=bfORKQLysZN2zJIoLiYn5hqAfNjLtEPEN6RxM1uVUrzE22cpfV0nY16tlQ4lSHfLNiWCXL
 Qkt/bhFBzarbS0kYbb3wL+9pBZU3xwHZifAWlvbDn6KrFUMNLu9Hbhz95Nb2S//VD+W07CRU
 b70Cnqr8IGoEmYeSSRZeyAZv0WzaG3/jBMxJnok+hIFJ/yO0ZA5un2+SU52JVPFJP6PJX4y5
 XByxlDHBCWf5EEzMMuEMOBQrejy/97hYKruORudFeNoGO+Vpsy1gkUIsvQZ09q19VyspSU1L
 s2O2060am1xFt07SPy+kUR1bV4WNE8yNVtkMuzMvO8YNklYrwygQ0GPQ==;
From: Alessandro Zini <alessandro.zini@siemens.com>
To: neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	thierry.reding@gmail.com,
	sam@ravnborg.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Andrej Valek <andrej.v@skyrain.eu>,
	Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH 2/3] dt-bindings: display: simple: Add Techshine TS-P0700031A panel
Date: Wed, 25 Nov 2026 11:19:35 +0100
Message-ID: <20261125101936.103094-3-alessandro.zini@siemens.com>
In-Reply-To: <20261125101936.103094-1-alessandro.zini@siemens.com>
References: <20261125101936.103094-1-alessandro.zini@siemens.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer

Document the compatible string for the Guangxi Techshine Electronics
Co., Ltd. TS-P0700031A 1024x600 single-channel 24-bit LVDS (SPWG) TFT
LCD panel, which is driven by the panel-simple driver.

Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 11d4a8275ecde..385ee9acf5e1b 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -318,6 +318,8 @@ properties:
       - startek,kd070wvfpa
         # Team Source Display Technology TST043015CMHX 4.3" WQVGA TFT LCD panel
       - team-source-display,tst043015cmhx
+        # Guangxi Techshine Electronics Co., Ltd. TS-P0700031A 1024x600 LVDS TFT LCD panel
+      - techshine,ts-p0700031a
         # Tianma Micro-electronics P0700WXF1MBAA 7.0" WXGA (1280x800) LVDS TFT LCD panel
       - tianma,p0700wxf1mbaa
         # Tianma Micro-electronics TM050RDH03 5.0" WVGA TFT LCD panel
-- 
2.56.1

