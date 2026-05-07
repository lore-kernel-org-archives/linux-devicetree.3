Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9D9275B03
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 02:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778121159; cv=none; b=bMQRdbc3XRMpPbIFgflXonXfzC4odvZXnLLWR7SRH6YDBmg/c16O3XkeB5avn6zwKLe6YlmPrUm3o9/Lu/LAU+Y/5FUnYLLCuw6zG3KKJ8V14u2enZyrdGMA+rwxrirLObO08iq6zR1bYbdmrUkk2l8yCkOruyVxFIzbZOeuahc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778121159; c=relaxed/simple;
	bh=e5t95QU7BUXyKPxTLVHhF/9f2P0zpBdP+DhDzgoGykQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oqPKhzhHP/KTsTZUwJMmJvsBgvv6oGKpPb1oRORPRvk4U8eI8hZLdH59bLsYeA4sORilut/QUQLShwvStTMflI5JlYnWtCZ8FFJ9JpNnGEnbFZGH+WCwsFrrkqmF8FXiaC7ExHnCgtWpPSSD1+Dyc/DkJPTw0GBZoZ0NbMw8aKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/2wtTJU; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/2wtTJU"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b788a98557so2223085ad.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 19:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778121158; x=1778725958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5t95QU7BUXyKPxTLVHhF/9f2P0zpBdP+DhDzgoGykQ=;
        b=Z/2wtTJUx2Cka6WQvY05eSo9eFhymFhqTRMfBptFFiwP8Zzg2hHCRJiloWNm9Dp4be
         wfL+wq73UsTT6135PVvekM6O5LDz53S6anRbdVCj66rHmsdNIqNfWoOvPwzARxu4hSbJ
         Yf/8bULfxEM/S00SrJSlGDX0dwT8sU0QkOINe2fqU3GikVwT3pV1ttwAvsTnz+8raL6L
         Yyf++y4jJJc7HNSb4NkpnlAGWJFe2aoS9R3tYLxWTUWa3CoQlTI4EzPhE2DmDyRsupn2
         9hB8iFpsaM1WKFaHUKGql8aSu9fJGZtqZhGLgZcaUwNeNZv7gPGnT/9wCgO7BqrGHfCS
         gJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778121158; x=1778725958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e5t95QU7BUXyKPxTLVHhF/9f2P0zpBdP+DhDzgoGykQ=;
        b=pgDn0r5Nk11YDYsqz28MkQOUCON8oqNU7pr3vhaNRpcILmg+gHzGzpdzJ+HUY7P8/F
         M2KKRlJSV/XW9OJlWqhBQcXiCRYy73fBddWGLyV86nkS1yilEejgYER248PyZ35eBq8T
         npAfarfTmtRPwPZ14J7qtglT5/60n8S7Q1aIhvw0S9hnlWN2UUr/FiaPG12+b0yOi+UZ
         Vd2fnGQu6t1OJm1ixTChiOoqnjNntUSLUSWZL5cWU9zq3y/syboyjCChwPoWcuvN82ht
         h//yz33eaF9GUeUlxzIOYLJCfsMzPpmtv0vwwGGBWMYe12YrhR4IxY5JTVcgayYwQqHv
         Q0+w==
X-Forwarded-Encrypted: i=1; AFNElJ99sHvXEm4GHmwEXaTXIXioEriZnBspQsj8o8QY3wOZ5LAZljfArx9Os3IJLyPs9vZFkg1A/sUiVpUM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4uvzunNNeDIk6peuGNP270Dajob6oAEhA6DK0GAXSk61jmmBr
	lm7aXbEX3XxwnEnfGWwT+nuLGZf6kNMGbIo9MZRGEnZh3nx7tJbPgOTf
X-Gm-Gg: AeBDieuqsvMSeFwfaT3HBGOJn9Aga4KvOfEW136qyyGDsfBVq6/KJef1oLF7u/Y0QPO
	AroLfdvetG5T+NzEvhRlEWtIhYxMTD+J4UaG3IZ6BTzvcrlLfnkPy9DyGxxJR0a79f8Ai/jWxw1
	uUdZ49D2ui5BUS/uyzWzTlFPHD0Oh2y+8VDXO8PJuNExnJZb7lGpKkL3j+m0FSXnFrkn/suBcdv
	AD727eY633aWnF1hhOwJrC1xBYJYGrxWK/znZIfXJnUQoZ2x/MNGyf8Ru0/pj+836FbVCIIQs69
	pzkPx6qO3+jHr8k2ro6JwpkiTfjom46yD1RBZbNrtUAQcN7W2yyNL1Pb9pNVwcX3H9gzkIiO5it
	sK69832iGlF92KE2UoSrjYNWZniRnZWMWocHYe185pKHPng7IP4A9D/cUWmHnKSAER9tZHcRO2h
	3Tp9j8F+kvIdrlA0586jvC1W28aM0Ir5Djsb/utatMh0Vc3EuTuizMzcm0cbXxJBLu7CiAYtvcU
	rcpHhr68OoqfRGF8GN9DaY4294bprOmxq/I5llDNG2AYg==
X-Received: by 2002:a17:902:f707:b0:2ba:bfb5:9cc with SMTP id d9443c01a7336-2babfb50f2cmr6888245ad.26.1778121158118;
        Wed, 06 May 2026 19:32:38 -0700 (PDT)
Received: from lcwang-Precision-3630-Tower.. (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babadef9e0sm5985525ad.63.2026.05.06.19.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 19:32:37 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: conor@kernel.org
Cc: airlied@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	onlywig@gmail.com,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	zaq14760@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: display: mayqueen,pixpaper: add pixpaper-426m
Date: Thu,  7 May 2026 10:32:34 +0800
Message-Id: <20260507023234.3655616-1-zaq14760@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260506-clique-safely-6dd507d0593f@spud>
References: <20260506-clique-safely-6dd507d0593f@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Conor,

Thanks for the review.

You're right on both points.

The new panel uses the same DT properties as the existing Pixpaper
panel, but it requires a distinct compatible because the driver
selects a different panel-specific initialization and update sequence.

The second example is also redundant, so I'll drop it.

I'll fold these fixes into the next revision and wait a bit longer
for any driver-side feedback before sending v2.

Thanks,
LiangCheng
