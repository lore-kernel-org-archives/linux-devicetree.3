Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EB84AA02B
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637248; cv=none; b=ITuor9bPtjJAcpSb+Dvw8FZ0z6H+hyhnw9xxCzB21lV+VhXREhQZ+cWXbxvQq8XDjhDhyrEZL2G73W2nNKa4IKE+rFX1zSjL6dvAM3L9YhPbaKrpYLksmYl/r70O2Men+UfZtx6QbFxfPurNWG8r4XUX3UfmMZrNEHkdvndftPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637248; c=relaxed/simple;
	bh=RvIX/B0FuV6C95HhNeUmyPB6jkzc7KAvCE1LKhTrId4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uo9TdNC3ZMLK2GhXjuyx6YJwb/tNCnqjm1RE9WhJ1nfE914wgdqWovEZN6a5i428ZT/PTWQt/33KdVov1KBMwpkgiYCzVGH55SLL9wPar5zgA8uvKadBCIRIRHFgUJGa6TcTzFC8vmHSwgr9Q8MEJ+g/zTUTqgoEN+D6F19lJDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MVguU4wU; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVguU4wU"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso8146215e9.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 06:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637240; x=1792242040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2JExfj/tGlMkKcgsuSdq+eQx1ckrlan0UXArxeYkCT0=;
        b=MVguU4wUK6RVJfQxRL9SX+i1e3b5T2kOjlZAoG3P+yVqSkXB9YsavWpUquVQoXUNEs
         +myv3qaEVCObnps8B3s+v3dpM2pwDeyPDai0clgHuZ/SBucD0TzWmtPPpY3N6dAkschg
         +fouMLdce2wm1YE+y2fZYwdkV96hFwYz68npf2ZV4JEP+4AzcnKPb9aaXXuAn/sWbkwh
         Lvli9mYU20pnf7tJFW/IYl5Lp/Qtsv6LBHRUR4gss6VyCKsH5d/ajb88p4UiT4QTD5er
         CE4lIJI0xD6Sf8a12/tiw+TDYSSpv1wjqffvlzJUY7HtSazk/SncECgXjmmVQP2gqeLo
         lrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637240; x=1792242040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2JExfj/tGlMkKcgsuSdq+eQx1ckrlan0UXArxeYkCT0=;
        b=x0RIeORGw/uyi/PDGkOavEu8w6REOAuMZqYCImKCu8MSLcfVZX/j9J9UeDcykqZxUo
         6TgYTYKtwGj9mkSYqzQsBXWWofpCPDQ+czibkdsIqFIA3Oxa5xr6C/VVLvcA7635OIAc
         DHfqfjFxqigFUJqaTdQROKPtzxPUKEeBvzgW+JwHYDtQm1na9REIdKhbAvvBhiZD3pW8
         40a7m1PLhwIyo9J2vtL+2HC8SdFSAi/AxFv/2yVFJw1D271vjYRtzHaj1sajhG9YvU7B
         aMw3VUXgkXcBXE0s01cCTfo7f2wI4XudQIdACTw02uQmfuJwgwoB6HFqgqW6BjXYpo4Z
         /06w==
X-Gm-Message-State: AFq9FYKwBQs1QgQtWlxS64UYDadCF6UYoTdXye2qMHlyJXX5RxElHOSM
	Gpr5boQWwnm3UTsuBZ/SyFV8wy5eHHHy68Sn+acBNKRPDr7IIy1fzXuI
X-Gm-Gg: AYBFou2Qf75lkvVoDDyY5nXtbvHI4mDygZrZ8+x9vUf/4o9FS0EsDNuyt8Ig8h/h/xI
	JTZGM6apMxIiU1YYLKwxGCbTG1/oYbQpJ8gfZE7uF0bsDHx/nbbo6N2l2nk/srBoE+XiXZjHNrv
	DH9pVGnJGz/qVzDoqgRoy3CC4I4fkLwdiqY77XQ7b4XBsL0C+3h3Se+oTLI1ELeO2MABNN7EojD
	Qkrg6OXMI/YvwcII0+Fy3b4NOVK3clxgHGBrE/pMCgyaOQ/Xg3xZQvJcivYDs6Cg/KQXMrk5P9U
	kr2ncwS2kflVJUWNskuKymCFXWYLsXLdUCc4aDGqx8tmWKbih8qcnaDIoXSFqA+Sn2VAHwqUKZ/
	9JH421/M/p0T+dYNrCito6W0lC1dA0HUoNo1cpDshcfbChQln9CiZB/YrLrEkfjqq1Pg5GNW7ir
	/C5y7nKq8+80hz3a9qMRAaZcoEZ9DlNxf8jchh0ZJYm1OevW+AaAm8+muSXfMd81s5EAM1oXxQf
	bTFPXNf1puAahSJoiRb1RPSy2u4v/BbWWPGEYSFM16bJY6/6lHDeZrUF3hVRQF4YKyNHvYoutcN
	34HKBsTO3gOC+DsZeOCkcVo4YVkQ6Xew8rQlw1AH85iDOHImQSssKf/oYnFZZrn/IRknvkyS
X-Received: by 2002:a05:600c:620d:b0:4a1:8d46:6235 with SMTP id 5b1f17b1804b1-4a18e483d48mr88612985e9.3.1791637240254;
        Sat, 10 Oct 2026 06:00:40 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:39 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 11/24] dt-bindings: mfd: syscon: Add ZX279128S system controller
Date: Sat, 10 Oct 2026 13:59:49 +0100
Message-ID: <20261010130024.177503-12-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the remaining system-control syscon. PCIe clock/reset/PHY
modeling is explicitly a review question.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 945a168b61..cc0eb377ec 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -132,6 +132,7 @@ properties:
               - ti,j784s4-acspcie-proxy-ctrl
               - ti,j784s4-pcie-ctrl
               - ti,keystone-pllctrl
+              - zte,zx279128s-crm2
           - const: syscon
       - items:
           - enum:
-- 
2.55.0

