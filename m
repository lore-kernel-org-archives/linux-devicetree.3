Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57DB2E0902
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 19:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782244710; cv=none; b=M0emjB1mlJNm0/UUy0MmmrbyGlbBX/WbSP2+42naWU+cqqB7vPqShdONNKYjh0uuxtVR7LA8fAgbIcplk7YpXowrw7sIoZmBcwvQnEy8TEEQT+UxVEMaYYIiGKJn3R4XBg6A1yG+6Z+SrJPGLCQRxgcaOw68FFOwUeNh/JK2/OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782244710; c=relaxed/simple;
	bh=SMTlkp0HCXcehzdH49CvmLbQXkkIlz+ezG34FzOvfFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPSf6JtnMnAhvPbztHjatchumFafYJwWSbiG5/JYUmjPfLNCRK7gNiwaOXaRBnATFTncHjsvOy0CfDUxnGm+JxFvDE9EolyYjoAgBL7uABKDXWlLY4lmBbccKmBm+f4j5z5YxkMMXAPHDSaCFTvRHAlyF00CNKt2Gy5lHQs+KaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8rW66nP; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8rW66nP"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-139cc9b208aso547095c88.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 12:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782244709; x=1782849509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cd2toS9EVtCpFi8pDPSG86Zuz4knsyDYVlmhOocX+b4=;
        b=K8rW66nPuGD7Ut4HVhAWceD9LZoFQ7XJBZZz9xA4QObMIUd2kCeBCOC1/g89DySCdQ
         /OZQhkto16RpJvCs4stDvCAzkTh1jo9cf/q8iZ28vDdSgRBdRcmnU1Dr3oRHJsdXyH2b
         wBy/9e8MOAuRVrJekbS+S8GLKlo2DFxt5Wy8pC9yFVTn+pXjVsvaHLEe+gVp5ID6v/hn
         SO0qn8SV0AlENjz3TKRoA/UVs8rp7Y3b+1mld6ZMbnkTdgbB5Evhqzd7rzYaLrAS8rLe
         Tib58654TeNu7nwmDixP+DMTg0xI//pUVfaA2mkpNGnqyF6ZAsc/JZEqt+Rxdn1BC5H4
         O9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782244709; x=1782849509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cd2toS9EVtCpFi8pDPSG86Zuz4knsyDYVlmhOocX+b4=;
        b=slvtxh4wJF7vdyyrJH/RjF9DBBUSYcjfQZUkLAkvjDGd+xxYK0Ogh/lMpzE5kXODPs
         xt671+85w9hV8ZTkdCnMCQN8flSZP+nMTLBOWl5NdsFAO4ORXP9WQwtN2tUK4Z14PHR3
         V+rhluUejoCABHqlVhPXi9DCi866l79QnAzAkT6ntyb3pWm2Oao9rn4bZy9rekJIw+ox
         EdwvJBodZerjmdag23E9enVyh9OOUONr4FvYJCC/aiLgPctUdHGyxxGQxWWyyP+uSpQk
         9I6/J/pvGhVYP68yx2MmjyYEYd0gGZEdAERmay5tc8W3c88G3bOhEsfddamBJVEMDBsu
         bZHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9WPJuYNLMT/ma9gqsO7lB7LXroHkNSuInlUsNUcM2zdeg3cW61ssP539Fm1nYg1xxVxEawsy+Fu+3j@vger.kernel.org
X-Gm-Message-State: AOJu0YzdCEOcDCKMa/L5f9vVtDD1Hl+zTlTOkk2cjPIIha1S/NjE0PmM
	Si7Gx+xtNdQj7Jqc7AmN2ll5V/y3wwzS2DAmH0SYGdX9cn7jP1hna2jQ
X-Gm-Gg: AfdE7cnl2PNqVuJpQpOGMt3jK7x4mhEIlqmpfjhp09j2Yc5WCQJGLmtT07TmRnWjHeZ
	zxLKHjkxw86XpAmkJxQoRN5ZrcD7Foj31BUZVkCQhnpcCCGFfutyJVRxGRxyzXPlayINBrgtK76
	SlDtNHla5uoz+qzVMCq+XxUvTZ/sXqAxWlvOX7ik36lh3mcgPcA1RAJEvcKmqlsv4aj9mcFZZsf
	kw//K5coOImtBhUx7JEsC72MMM6BxrpKne29ceN0QrBd1lltjo7clw3+08sae00ltedCcHu0fpr
	fIRSITC5jmaj32+Eg5VNJRsf8Cn/uG6nx+kOa1UGdh84GvTiZVZad4Pkzft9yLvHRvCtUhUD242
	YErq4E5MIcnSmnvSwv5/2AMgRQP0g+FK+MgM6CWfFUqjFwwvK6CEH7tHwZgCj3lc8MA513aSJhf
	b1vJu0QAZukkL8w5SrB6FWQFUVUhBsOMUUxpYnjIomc0X5E1C9GL7HA7/7G8jtULmoJOJNLh/Bj
	54ofrAwav8/jyHUcmygWMvqFRzU4vqPaCo9jT8UGs8=
X-Received: by 2002:a05:7022:69a4:b0:138:49ea:f487 with SMTP id a92af1059eb24-139d0c040f2mr216795c88.6.1782244708943;
        Tue, 23 Jun 2026 12:58:28 -0700 (PDT)
Received: from leonardoc-nb (201-68-197-145.dsl.telesp.net.br. [201.68.197.145])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add85c40sm15730896c88.15.2026.06.23.12.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 12:58:28 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nm@ti.com,
	vigneshr@ti.com,
	kristo@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	thierry.reding@gmail.com,
	sam@ravnborg.org
Cc: leonardo.costa@toradex.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/5] dt-bindings: display: panel-lvds: Add compatible for Opto Logic SCX1001511GGC49
Date: Tue, 23 Jun 2026 16:57:38 -0300
Message-ID: <20260623195741.495734-3-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623195741.495734-1-leoreis.costa@gmail.com>
References: <20260623195741.495734-1-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

The Opto Logic SCX1001511GGC49 is a 10.1" WXGA (1280x800) TFT LCD LVDS
panel.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index b89f86bc06837..8382d4920bfd6 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -58,6 +58,8 @@ properties:
           - hydis,hv070wx2-1e0
           # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - jenson,bl-jt60050-01a
+          # Opto Logic SCX1001511GGC49 10.1" WXGA (1280x800) TFT LCD LVDS panel
+          - optologic,scx1001511ggc49
           # Riverdi RVT101HVLNWC00 10.1" WXGA (1280x800) TFT LCD LVDS panel
           - riverdi,rvt101hvlnwc00
           # Riverdi RVT70HSLNWCA0 7.0" WSVGA (1024x600) TFT LCD LVDS panel
