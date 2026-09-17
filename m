Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F2D4CB8D0
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643144; cv=none; b=jjuaSgiajV6tPmqxUa0herONs6A+sS7TPXz5FeFBqUWqsxhbUjmIroUU8Ohs6LJ1WL3wM/YUdqIXPJ3oa9tUyxLPdpMbXnPFzeQ9DjIgQ4X2swSrXM9AdUid/UwIywT950CQjqVVB86+BhrEf2U9Sqx2B0YETqQqcZgDqnLajdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643144; c=relaxed/simple;
	bh=14mg3m0bqOPpb7OloMRlVv5faEAI74LhvelLDIAd/tk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s2hSYJDk/VBx2Y+hOxCXaT0mvMVyEQIxwP2+p4y8yB7iMuGzf3/46lfYTR804bmoPgwGC4Egp9ljJhzqKMaFtGrs7wGQCH9vrR2IYIJ3I/lswyEY5gfgsbxvHW8AwZ2BDJOyg+6wqyvHNRt87JqikQi0/TNAtoGrZgCxtlYeyzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=T7BQox8K; arc=none smtp.client-ip=185.136.65.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="T7BQox8K"
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202609171105191b49a8fbd90002071d
        for <devicetree@vger.kernel.org>;
        Thu, 17 Sep 2026 13:05:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=GXdhflyGWUbl9NTwcQhvsBNxzZkrZQmTOjB/BvxV0xM=;
 b=T7BQox8KW3PoO/xkGmhlbpXZ5uf1MOPc5BNZ8KwkRrJzXu/oEN3D59u/JJMK92icZ6bR8y
 yjiAzH4v2TYOAmhnWkqpAAdAF+W1RCXkWEgRSLXceBfrpGyQjaNVHzSVUt7R3fqmhK9xA9r6
 IG53XaQnATykqiGZVgfcHE5bjBMqEfiFnDAxp7jf1L1TjxefpLRLSYpeWqMBPqrTQvhhYvVb
 sRm0rgXdUmY566vFnJSqpE64rKIhH4Yj/iHChnrRBPk3OuoOPYm29cKe3552/OAVgSKkIGc4
 P/1uM378ptL7mwc7SzPgr5t1xSAQiMNBWsdkEbhAZsV+Z7Br82JqWDsw==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
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
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/panel: simple: Add Truly TFT320240-229-E panel
Date: Thu, 17 Sep 2026 13:05:13 +0200
Message-ID: <20260917110517.1053556-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Add Truly TFT320240-229-E panel support into panel-simple driver along with
the required DT bindings documentation.

Alexander Sverdlin (1):
  dt-bindings: display: simple: Add Truly TFT320240-229-E panel

Frank Bodammer (1):
  drm/panel: simple: Add support for Truly TFT320240-229-E panel

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++++++++++
 2 files changed, 31 insertions(+)

-- 
2.55.0

