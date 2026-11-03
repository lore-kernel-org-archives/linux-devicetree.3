Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703929;
	b=HwIYRtcKzbWm4OS+6mwV+qHgwi6UKTM58XsQ+LmxjJROR/uK7pZKg8D/EZ8TB1ZkmMD4
	 /bENYwEyRD3+Yg1hcFlarOdL0aTtf1O7ZuDYoBxDIM4uR4njkewVLWAhUjd/er4AQHlL/
	 /P5bFLCXtEVJEuDCo5xJhkMw1CJdXsLeYYGe6g3YSSHspFoRYbYIL8k6jy9pG4Et1AQQO
	 JpybF7KrmDcJ69U41WjX2ApvSoBFVcqZ/ZsmipZsFbefx88Hbt48konZp+GDBZb5+UAKu
	 XeiVrlT/oviI08dWFbmhyeef+7cZFT7ovIR0uTGWkrBoMMwPt7ys5/pG5/gONWaSe/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2peUJ98OgTSEIArQaXah+YOCOAD/R5kMNJb0El9Mbi0=;
	b=KI6BcqB9NtV2WinL9x/ybAvitzy4b831/A+nfa3n1tfkIy0wKD/j7TUHEBeals4rbBS8
	 85dXeXGH2aAeT8C2gJdimvowQ2T//iVeKwWMjPnqxEl5WvuTGSjsKwAWgfYk68Bm6qKDM
	 e7zAyhG2lIUwffR+aakZv8wazY1COA9GCyJ2pxpX6sbTwTqCtPVEDXtQoYby8MGMfTH6E
	 J2SlicdaUuGJ/GcvawdFK26glu96/aUYCPdhEpccHycTD5SfRYtJzYFyd+OtaVpPyKzGb
	 w6DcXRgkHpTcMIHsJDP7PoM7J82Di2YFHldUhM1v39iv+T4uVFYnktYe3Y2v5suBv4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hGIH5NqZ;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF5F606ED84
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 11:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DF5F606ED84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hGIH5NqZ
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso32686395e9.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 03:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793703928; x=1794308728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2peUJ98OgTSEIArQaXah+YOCOAD/R5kMNJb0El9Mbi0=;
        b=hGIH5NqZpKssCrXz9eVV7dV9w9rb/utOwtMeSSTdftkrFFZE2N60ZyooWCwnCgnnMa
         YgOyr/7wmhi+oVyhVLg9oI3MRwWrBK0FC6MShRXA4zhh0eTRwyrxZmuPdI3Ex4G+gdoh
         MWiLZdqxOri9/1STMpArrfugKMi7tZA+kDnMO41zrb9GQt6QpYwzbBkdfsZHxZAWvUvo
         yjfpk8J1yiycTO7tQUtkrZ6G+hv3mCYD2TVXLVkKj3sXnRdbObenOxrFTjh9re/Q6zgW
         fdC8LatkTa+hFh4MuuBGtVyxVPjqWoqRf+fmnGw6h2cLmWAfaJs/tVGobqfRnIwafOWj
         tJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703928; x=1794308728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2peUJ98OgTSEIArQaXah+YOCOAD/R5kMNJb0El9Mbi0=;
        b=GqkR1NB1+HNqKByc1/3NsMQgruxqnNLzCoo8L+AUY54i/1GaajWh+/GYvP4xNZd1ab
         dGUZGgz7inX45LLJss+JuJCj3syE8+fNUwMewLytADA6PG2mpTl6f+nQIseULyD1Ftgi
         oFhgfWr00ueXXkjLl3khdORJC+uB09PZFlIRuByCoEAkO1SqAWMMCq/+fhFWY//3P9FU
         bLhcK7tI1nBRSRVjpHQ5fW4FvQO86eBPYlcnxtxo5HvBPsWJ9JFS7YMtdVVdD0QO/GmY
         KPP3aKEqQ+rtpaib6L+j7N0/aPkhmPAYASoVlvlo3sd+FfOOgVqe6FkgXRw0HiqcPA0B
         VlpA==
X-Forwarded-Encrypted: i=1; AKwUvBwRrI+oE6P85ydp8Z78Ya1B7E490vX8sQhhqEcw3bZ5fVRZu8dPGaw4TqI1bcATlTo4ryKZP8/iRaQe@vger.kernel.org
X-Gm-Message-State: APuU4Z+/IHPty97c4GN9OvBhe8ZTvIFEJsWAGCfMNNiYim7aXZ988GMB
	0dVCSXP0Cufs1izz4v47XJlBPZQ+waGIikfeLDF3ec+kkQdANY9mj8ii
X-Gm-Gg: AYBFou0ygQBjfE4+5VbRVj77rKVr5ZctOYXQMCJQi/JF9854Tk5SqX9b60+cMe8E39W
	anUmaJ5qxsVi20zNGKOLA3EW+i9s/GSrvQ+4QSmlYoc+LyN5BtVF1X7bUIRl8dFMQD14kAx00pU
	G85yAlhUApnj+4RSvSawmVaEFTTzxwzXF6wzLtQJ+EuVSi7KIbE5mVo8p7yanxcZmwBButYHRsH
	tbNKOMO6HCnyy4TfF87qlFWb/JbDGpYTEfIb3Xcq55ac95BO3/VC7k/Q0+VgUKGs4UlDuhU983K
	oz+HWrsD3bXHjO79Ge7npeih8J8d99P5yYsOrhv1tDBVaYDiwDxfIvZGwPsqzvgV9LxwdFb1CbC
	/a7Q6WO4ZhKr2xBvnBcIc4SAYWW5QIQz8MHl8ySf4kAcEN3szC44sczQcUfiQqnNMtsA0g1DdlQ
	Iz+S0QyqHFouiwSKCM5fUDD5axYfFtpwX4WgjMP4FgodpPSAhFFet7FdaB6HJ3fCPMJEVCT1C1p
	oFnrKfk7WxAvZkxE/FtjDQWQ+LkqC4e6mEP4lOpJSTWkFSWUzNAk1/q15yJAnuuIDBIT04oqKPC
	4i7jru9Rp/GXdqwl57m94jFE4AQqe+wzzch+PzqkaxSumw8w642ZVN6+W1WFgJl7tW+FyIGcxq0
	0XxpykCRvW35zC2J+KYqP3Y6W1YZp/wSb957mxtnn4OUFpg==
X-Received: by 2002:a05:600c:19c9:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4ac18a8911amr292299845e9.34.1793703927676;
        Tue, 03 Nov 2026 03:05:27 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:14ec:7986:30c8:6bc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm53218155e9.4.2026.11.03.03.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:05:27 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Igor Reznichenko <igor@reznichenko.net>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 3/4] dt-bindings: display: panel: ilitek,ili9488: add the PocketGo S30 panel
Date: Tue,  3 Nov 2026 12:05:23 +0100
Message-ID: <20261103110524.2812831-4-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103110524.2812831-1-romain.tisserand@gmail.com>
References: <20261103110524.2812831-1-romain.tisserand@gmail.com>
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

The PocketGo S30 handheld has a 320x480 1-lane MIPI-DSI panel built
around an Ilitek ILI9488.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9488.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
index 016a573893b7..27f9aaa81582 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - focuslcds,e35gh-i-mw800cb
+          - pocketgo,s30-panel
       - const: ilitek,ili9488
 
   reg:
-- 
2.43.0

