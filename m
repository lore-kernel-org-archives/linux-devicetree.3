Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602451;
	b=BAwbQWBiuglurS07GBdlCuPO1HFOmE53sIVLW7p1zI4VQ6ZA5oy3+/EEr6iTVv3IVYW7
	 1f1gYm9fdDc4pmBkVvPglRCQqZBVi3KFYZcEnTsyI2zH06+7IWEdmc9OeVW0To+3za5UA
	 KNsDHRP1zPrc6zWg5LzAcyVh4iZl9LzPFfXkHVIClsUxkIXuAi1ZnInUnY1Kd9EkvH4Z8
	 HC1Q0kaC33JUbKOJyhHMvzbJmqsy3RAkuvxhJA30oeugW19h+cIPDvQJBsy1v+cC3TKS2
	 sV2801QuEF1tq6tbTUZVC7X91W9C8aCJO7nkVCdQcwSSXLP2FmTbtZfVdXV8M294UAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602451;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=+1eDKjoOcrtWwLGX9PBuZf4Wp7y6OLqWwRZOf/G6PLA=;
	b=QhhgQj8H5AmOKJQcYpgWeqbDU7eqMx09Fn00yZhdycWJtNYAKtjzGCjC27Rr2RMcTwoZ
	 9bf5t2e3aB4Q3rVAhKDSfHoB3OZ6Lzv5Sh2JX6kIByKzii1OvKTbMw8sSFNyozJVAcpQc
	 ASFRcNLHM67vNgVWF7Ke5/ghHAPT8soCiE4B78Db0EDO1cslHn5UmQMTdznWtR5MdUbS9
	 4nWpM+p5kKBTctJqCI1n2JhRkKU0okGi9Gst/WZFop5bywLNeir136taQ7WIGqKVAshul
	 2UxKzMeLbC9ROu2YR4Dbrm8r2aK8Kj5BXwogzqHhT5c9lFAhfguyYdLYe4PVo4UTKfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alessandro.zini@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=I3YmTEFk;
	arc=none smtp.remote-ip=185.136.64.228
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB7D606A329
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DB7D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alessandro.zini@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=I3YmTEFk
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202611251027291eee01c85900020726
        for <devicetree@vger.kernel.org>;
        Wed, 25 Nov 2026 11:27:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=+1eDKjoOcrtWwLGX9PBuZf4Wp7y6OLqWwRZOf/G6PLA=;
 b=I3YmTEFkZMv7N02Kv83dOyyXsRhf7JpOdoy1c6y0ADCFt0Tsk9jdYDvgarTTrIhpl8y6nF
 /PGiqGtV2ElAtGO3Zz00BpyBaBYqDEKXHsJtwJ1u7ujplfDfkhyNO1ov5NHVpbwpe/DiquIt
 035pIHZeCFm3EllSva7VprR8ejgyR7Qtl1W57oWRokC+jU+TbW8j2lJ2rrUXgAQlhbdup4Jw
 RyUivOgS3irZPuLrymutRTYEnu5bSevhuEI8Gqirb5hoSYwVuImvdozuNxJtIgBYHqOPB0ea
 wYnlwqun7cOJqxfwMIy9fe+Cp1isyGjPDcJd8oQv35NQDvXKSW7zUSCg==;
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
	Wang Yang <yang.wang-wy@siemens.com>,
	Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH 2/3] dt-bindings: display: simple: Add Goworld ILI6150H6 panel
Date: Wed, 25 Nov 2026 11:26:59 +0100
Message-ID: <20261125102700.126248-3-alessandro.zini@siemens.com>
In-Reply-To: <20261125102700.126248-1-alessandro.zini@siemens.com>
References: <20261125102700.126248-1-alessandro.zini@siemens.com>
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

Document the compatible string for the Shantou Goworld Display
Technology Co., Ltd. ILI6150H6 7.0" 1024x600 single-channel 24-bit LVDS
(SPWG) TFT LCD panel, which is driven by the panel-simple driver.

Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 11d4a8275ecde..3c664175b528b 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -154,6 +154,8 @@ properties:
       - giantplus,gpg48273qs5
         # GiantPlus GPM940B0 3.0" QVGA TFT LCD panel
       - giantplus,gpm940b0
+        # Shantou Goworld Display Technology Co., Ltd. ILI6150H6 7.0" 1024x600 LVDS TFT LCD panel
+      - goworld,ili6150h6
         # HannStar Display Corp. HSD070PWW1 7.0" WXGA TFT LCD panel
       - hannstar,hsd070pww1
         # HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
-- 
2.56.1

