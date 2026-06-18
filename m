Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1432D0C64
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 02:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781750027; cv=none; b=Se3PK4QG7ABWKjmGC8Fx02p0jhLDuILZkHFeZFGShNuXFc9WimkjMsi9i/IcaOqLEYwveIUS3NDRwrtjFTwR0zOc0o/jceMqvYrRFoj75on1sYfhtbaOColPN4f3R/9CS/EYpKNY1zAdiSBsLcpMBlkM5mMsCObJ66RgxwkSPj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781750027; c=relaxed/simple;
	bh=iIlS5jhtZMjuo8gglp6tVBsS03VnKU3kEreZFvvVOkg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f/d07AF0zIV4rv3M5DpX2bqvLEN+NKZqxr4mDUSW6tbb7JxjyuvVhPWgq6PVJ9w0YHjB/oJf4GMpl4EDoi9Cs0wKQ30h+wE2khD8BqL4HOow8rDq+m61nvDOa6P/eeqlySoYFUL485EFTIUSH552B6H4aFuns0WlP994R1wJzpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WL3CgYfv; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WL3CgYfv"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-845369f60faso182128b3a.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 19:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781750026; x=1782354826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIlS5jhtZMjuo8gglp6tVBsS03VnKU3kEreZFvvVOkg=;
        b=WL3CgYfv9b+sSsNLWmgBFHzLEiRc6m980+0F8cFoXLJBC2idmsh8B19BmLuvkqb8uH
         ONa5xUUhElkE2VVjTU/yE5nh94ZuO6XXgr/Mqq18HnM/TQEUqRkAMsd1a74+85muEeWO
         5/cmqGUgPCsyurQgg8npg9ptyUvNtASc7inKRUJTE1WnSsEbVXC1Rj16UijXUTCiLtC3
         gsnc2Ty7DiDErQ5NJFz5vkW92RZzCED41DS8+jS/R3BrZr+ZWEuoAYMkYMk3IvMh2aAo
         bExPDG7ag/TJPGz344EELp+OO4jfgR0NBTCBI/5tQImOOylVQi5LvYPEd9qV0HDFjECh
         1Pfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781750026; x=1782354826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iIlS5jhtZMjuo8gglp6tVBsS03VnKU3kEreZFvvVOkg=;
        b=FehgJp9GdQrvHJfghHvEeZnegTPiFyNtViSPBG5ZQoNegbI4LTp14vsYh22W94lVfX
         8FaMqQDmPG7L6l5TwLSBPE38Ra0UOj9rBJUPMLcCj2csv6NIgt31cxZUq7QjUpisHQfW
         8/EN3Wagxl5K+34LOJLt6Kyg1OoF8TchOf0agLxkMsXdHrNopB5I/6bGu/EqjmI0/PMC
         siboWKyljbrcK96A3r1PkiufchJYgKfTPBaZnmZEJML2O3KUiZ4kIB4ZajsvPk9IV1bg
         iH8xi3yyXSIyKxLQzYleNGwICgjABui8k1S+96obwsds/r3UnC4o+hDmETdrODtNcMja
         d0bA==
X-Forwarded-Encrypted: i=1; AFNElJ9oGcK8aFLbJjod1EhMI22+gNd0LVEjPK/nU2pvXPrlTK/S5QjE/7sn0YygZzBt+Yr/8TXl4LJOU6bK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5mOVsIbGCLs3jLewZGpe8gNJWEt34HtVbEP+AplHzk/RP6pdH
	2BmKryUZkrSNz0plP5zL77y6gg7dPzvYXSGX+9k3zX+NareP9w4eSFLUtN016DirEjs=
X-Gm-Gg: Acq92OHw9jykWAn1WacvxRxMAZuIdukpLTCidATFYIn9x/6dArh+nrPrOCqkq5G3L34
	gL0Vw+iF5h3JJv2C6kBuW/EqtE9W1djI6fxLNW02CmXQ50aOJkBbKddrBxNVn/+TFbr8yIfqr67
	duqQwXy5TBdw0u+PhT55gTn5xnQ66xffhih4EjQ9PWbUnL5vcUa4yPoHBYur61N6y/8H51NP4Mf
	y562mzGxfc1unKUKzloCl2KViFV+O5aptmZM1friSBjc4MSRuK3qw+JkH9tg3SRpAN8D2s6ZUF9
	/ZNsGIdkQgfHotz8loLg8TsLVtIoVVZ6jtR0XTieis7TZzMswVw9NBVAq8kHj4HxQmRMB4mvFNE
	/P4PAJdUsI2fKRPi7fj9KEfQ6WXAFIhWOQhZBLh1gjuETy/k8+JdFugxhv/zfUHoFkOucxmrB1o
	bRzk/gxpfwxzD8Y+5IRN7ztsstf1u0JtZlSCjSKPfxXyv5Kf+Pr4ibTh1Qpnmgqa3tBiw/6P2k+
	asVNRal2i4Ii2DyHUCvVPhy
X-Received: by 2002:a05:6a00:2d96:b0:837:80a:5abe with SMTP id d2e1a72fcca58-84524595b14mr6044974b3a.37.1781750025763;
        Wed, 17 Jun 2026 19:33:45 -0700 (PDT)
Received: from lcwang-Precision-3630-Tower.. (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845353d096dsm1722242b3a.59.2026.06.17.19.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 19:33:44 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
	Devarsh Thakkar <devarsht@ti.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wig Cheng <onlywig@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	LiangCheng Wang <zaq14760@gmail.com>
Subject: Re: [PATCH v3 2/2] drm/tiny: add support for PIXPAPER 4.26 monochrome e-ink panel
Date: Thu, 18 Jun 2026 10:33:38 +0800
Message-Id: <20260618023338.26630-1-zaq14760@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <9fb7915b-dc46-45af-bba1-a3d3a59b5e49@suse.de>
References: <20260529-bar-v3-0-5c2ac1c751ee@gmail.com> <20260529-bar-v3-2-5c2ac1c751ee@gmail.com> <9fb7915b-dc46-45af-bba1-a3d3a59b5e49@suse.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Thomas,

Thanks for the review, and no worries about the timing.

Before I spin a v4 for these comments, I'd like to confirm the overall
direction, since it affects whether this should remain a standalone driver
at all.

In parallel, Devarsh Thakkar is adding a generic Solomon SSD16xx e-paper
driver (panel-ssd16xx.c, currently v1 in review). The PIXPAPER 4.26 uses an
SSD1677, which is part of that family; Devarsh has said he will add SSD1677
support in the next revision (v2) of his series, after which this panel
could be supported there as a panel entry rather than as a separate driver.
That work isn't posted yet, but I had agreed that consolidating under
panel-ssd16xx.c is the better long-term direction.

I'd appreciate your guidance on how to proceed -- whether it is better to
keep iterating on this standalone driver, or to hold it and add the
PIXPAPER 4.26 panel to panel-ssd16xx.c once that driver supports SSD1677.
I'm happy to go whichever way you prefer.

Regards,
LiangCheng
