Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601997;
	b=Jh5A7BzICAb+TWDRnOxj1tgpVZ674+feS6govYDnqZRCeqZrW7NHv752IIXYjGIqpmMX
	 KLND+V+ojasbsiPiDqshwq1miYrVf9ZfX/WQkoJ36M1q8cIchRpNIb8VMtkbirwsNmhaN
	 nXHaOXiKuU032MmwBNogjMrVtwCCrSL+x2Plppp7COyVs3r6BuOjx73olFfM3z8Qt9PEr
	 9Ja+B/aRNZDnpqAQ1bE5oJvZcUPN7jKIrGkFnrx67TbGHN4WwQ9OHSMlcQ4osa9MpkRt4
	 NQ9z2RrXTySQfMeEuFLAvoUbs2jw42Xsof7laLk5DJqc00X4T8XoDIuYMh/JC8sg30w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601997;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=+u+5Y9841agN8wYX0ru8kZoM+mbh0aExOkblBzQFQZY=;
	b=h3dfonMLRbx/qpx7KG1i2Cc6mSy/1a2tnybTYRTCvdyKoDMXPJdrwrRC3tDcwSD2W5w/
	 XgMgmJLo15YeqPe1Lc+M8csU5fL3oQp4lJNrpBYSvuv5dg9etsXOkV7NX2dXMLs6DDJQI
	 BIGy5j1cOGV58YTrCXxUILAevNNw6BLjXMBvjxcOinnAujOxsUQ/oUGeQ00uhKWOyqzkv
	 l3rdKVMNeqhXR3EBRWo6Nj6IE65qvJNm5/Vc/BIpApw5gnwgVjtsGg0Xv7LX04MSD9PxF
	 ta+awwRzmgWc0Oy6fhnanS8einhcbjAhRUE497INWRqdPkvTUkaLzaobtbZ+7AoJ+aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alessandro.zini@siemens.com header.a=rsa-sha256 header.s=fm1 header.b="ln/tdC+Y";
	arc=none smtp.remote-ip=185.136.64.226
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47E3606A335
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C47E3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alessandro.zini@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=ln/tdC+Y
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202611251019488561c1813e00020798
        for <devicetree@vger.kernel.org>;
        Wed, 25 Nov 2026 11:19:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=+u+5Y9841agN8wYX0ru8kZoM+mbh0aExOkblBzQFQZY=;
 b=ln/tdC+YOYXf8NrZ6BL7WQFpN1AB8A2IPbTkNZoHaGvt7AJBX2hSgoaNAEud9Em7wnf1Up
 lK+ij9WpEAuEfbS9GRgvVnFHk9CtMmsNQio7W7CGbnqctF4nf/27/Xis4X/eGI6HQ/Srzq2W
 8kHLqwmv+mPYF9lGnMy2KWY6KX+ZukyfuLKHdrPrWNen9tAw6ZeL3NEb2kQlokjHTHj2iAyk
 Spoo+AbYNxbkCx9rwGgcL3AeITMuEoTnPc8lkTxmc7DinW5N7FC5qBgeI/W/5/lL0aNDugii
 /eodUkDzbXALITGehc8qVk2cGYyt3eb+xr65JPtq9UN6oJ5mwr3uXaVw==;
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
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Techshine
Date: Wed, 25 Nov 2026 11:19:34 +0100
Message-ID: <20261125101936.103094-2-alessandro.zini@siemens.com>
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

Add the vendor prefix for Guangxi Techshine Electronics Co., Ltd., the
manufacturer of the TS-P0700031A LVDS panel.

Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a846ae023584e..6e896c342f637 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1726,6 +1726,8 @@ patternProperties:
     description: TechNexion
   "^technologic,.*":
     description: Technologic Systems
+  "^techshine,.*":
+    description: Guangxi Techshine Electronics Co., Ltd.
   "^techstar,.*":
     description: Shenzhen Techstar Electronics Co., Ltd.
   "^techvision,.*":
-- 
2.56.1

