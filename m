Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C537D43C04B
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 14:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777385153; cv=none; b=iB4GoSKCseH55vY17Rqi0rbI6wXl0HJ1qbFD+3XWLvXzIanfiHYQbG0R2t28cNwbWfo6PiJ4zeBvrStNCxV50JTTLw9SN7rqehXIewm7DC+DOlxKKvL4u6kQfNWXX6/bLsyOsnQZCPTPdCjbi0HU0yf/3O3xcckWOb9R0+vjua4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777385153; c=relaxed/simple;
	bh=88pgZhsc8E1YwM4QVADZ+eYx9jSwGydBUbXrq3neU5Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dH49/40QRuCwyD7slCj92xO44oBZksKT0aJNVWBkCtzAG4nBXa3m23nuz7YRxaNb1Mg4G78m0NTdUOSciFdiV6jVV32/veeX1x4w1TLafsrgVTDw1Y8/m4yVLcgkAPpSlM3i0dJWkGRYAZlgX0FbvOJO4sUC4WrTW6IrlTjn+8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cb4edd6M; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cb4edd6M"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43eada6d900so11098867f8f.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 07:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777385150; x=1777989950; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bRQEHJ1gmgZAbyT1I/zyFm8qCQLY2gss42m4vu095n0=;
        b=cb4edd6MBJmAPx0kxGpXN+wdJocDy8YldqgnCt+f3FGM6amTmjtR2/NTissDmtDd+F
         iFZBQQ4OouLD5btENufq6drSl1GF8sNcV14+kKvfhsUml8w6L5AeS9x75YqXtRjB/k3X
         vOU75ujsha14Ldf5MfcjxG2rO4gjtD6HB3A7+S2aJ01VCcUCOC3bAJtoOFL6pSRo58QR
         7fV8xlftDHbUioApeIEFzbvj8WI2B1isF1UH9B7DxtmUK0ijL3t0ssEOXvj8Rt24ksF/
         ah/tbwzWqqXAqfMkqJz4XyxpmtBHE9xBRfGh4GH9KaxL+GSzrZwR1vhGhy9VEhsUd85x
         ch0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777385150; x=1777989950;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRQEHJ1gmgZAbyT1I/zyFm8qCQLY2gss42m4vu095n0=;
        b=GiptPO6KYDbQLukcFXNQk1x83QdC7ykLhpVAmDhrjgCt/GfSopbOfwruHAj44hMjPt
         I+YfTIuuOuUEiSLFn7n7qP1PlqCVtSQAovjZXB9BIN6kqkkDdho6mZSe8PMu2xIU95fF
         oMSLujCjTjCgu2n53BfTA8AMjwZpKn5ouU7mKbXASgjBxM5TJngFpNlMFL9D0vfKqWFD
         32tYyy+JoL6O6kdJTXzz16DwnexVGdg2I5ANHHe0rsM14KZzKL7SmShjFTpOZuWo8nzJ
         MbwyObAAEiVcAnlzPC6H9/hvYHoywcidPCbIOJxItPAtr8jrEAV408ZBXaq5Zw6T+mbp
         vGag==
X-Forwarded-Encrypted: i=1; AFNElJ+8+/yvURGAkg7kGnUCYla0b9PGSvu+Ghl5VllK0ID2gK7lNpzWA8Z7rFcmpI1aNqHWiaQRjEJpmur5@vger.kernel.org
X-Gm-Message-State: AOJu0YyZQHdImi0CmR5xp/ScMK2sB+UagMuPFbc7Iqui+cfyRutTY2Xp
	tjxrcdO6iJ3geawXEpVQkiteT+0EuIZQzREKO2vh+yB8KPr1rla6K0lg1/npUk/UFsBZe3XlYpf
	VOMVwfHc=
X-Gm-Gg: AeBDiesENyF/Bn3eX3nhR6Lm8W0LaSd0mpKSOY6cua0u55wcozlciESiWts6NbJj0oA
	yNlkXaSUXGd9YMu2e2FqnJwE3BssokgbZBtjOxhK+ys7IUoSwneTg5gIx55k40UKj9IA34b3/uQ
	/jx8x92zkc4cx1jBl4wnyO0mPOdLtbx/XS6skXGcnrzSbAfyzxarpufmohwPB73NuHc3GiG0ol+
	49rRsI+S0Ns8hb8jujw6i5mgeqPKLFiTXdQlVwcpYk2CvIwCgKnthfsrO0+UQMQf61Kq7I93+cw
	HNLEfHYtKYKasjKSB8dVbZNEDTcQBOrOkO7qtm7zK3ZToiB3odwHnvOt6uNm+fxhn9QEBwmFqKm
	GEX61EGJ/+jrVa9IRzdYlP8gQ6aWt+enCFxgTuvFJpGkr1NkXQsTQlkNesE3URSpJbxsUET18tD
	jU1oZVE8ki7K7JHydt8ed0mxVCXlHYvtleZaDQ1dbQ10G2eYv8vj7tUMo=
X-Received: by 2002:a5d:5f54:0:b0:43f:ea25:20ff with SMTP id ffacd0b85a97d-4464a1685e0mr5748911f8f.29.1777385149896;
        Tue, 28 Apr 2026 07:05:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4464004ed80sm7143264f8f.34.2026.04.28.07.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:05:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] drm: panel: support the R63419 based dual-DSI video
 mode Display Panels
Date: Tue, 28 Apr 2026 16:05:45 +0200
Message-Id: <20260428-topic-sm8650-ayaneo-pocket-s2-r63419-v1-0-981eb5ab5a51@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALm+8GkC/yXNMQ7CMAxA0atUnrGUmpAWroIY0tQFg2iiOCBQ1
 bsTYHzL/wsoZ2GFQ7NA5qeoxLmi3TQQLn4+M8pYDWTIGUs9lpgkoN57tzPo337miCmGGxdUwuy
 2tt0jd2RdxzQOZoKaSpknef02x9Pf+hiuHMq3Dev6AauhPEeIAAAA
X-Change-ID: 20260428-topic-sm8650-ayaneo-pocket-s2-r63419-e72467e2db0f
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 KancyJoe <kancy2333@outlook.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=910;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=88pgZhsc8E1YwM4QVADZ+eYx9jSwGydBUbXrq3neU5Y=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp8L67GKe5ofqeuJ8rIeXlAFfbCbEimZSktcmLWvLR
 D/De/gKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafC+uwAKCRB33NvayMhJ0XEED/
 9TvNeA+di5MIBpxZOFwW2ddOJGqL9cu9ZgKv3w4xNlVpaHUT8LbdEOIlMdap8lo5IqfjLNWPRncIUQ
 2Ysxv57Wbaun6wt6puSjABTBM9Mwvy2mUSakseGinNp/H5MLiWA1KEeGiuTRYFxPcR/3k0jGL7zA5C
 7SQXTAB8gaWht1BEncZATE0aRWC7hAFpUI0JSFGt55DsT0QlBn6gn9rcPtyfyOG+tx1SrlN7Rbj5wu
 X7+Gqn879GevK01/3ya/ZYUCqYBCiWtwEVrsYYFQkgwWDFakW0j0P22pyO0I9B4vOXoGPGTJ0wD1wM
 5rTGVDjbyiSz0ekhf/GdoTuyfmAyvLYxVs6ReDyJBFQEF1CxuLi7SDCYYx8iSFYodwim39AIo+PQHA
 LiNbIjs6jzeOFKPL5eg0qnfyagytd/oN3+asZ32kz8I9MNdgefR/bcAdW0bRdX1qSX9Wly0lEdJW9v
 qLC4MFho2/9M4LMvXI5RJNIwG4brTBJPFsaIi3A8DHjkkuGpIu7orqW10CBc5byuxsje9aSR4Lj7/e
 R0mgURJOPoHxURxjUELThRgvvUv50RogkbXyMvhKnSPBtUNMP3QvWNmqEWDe8SrQ5YkhV3zNy2rVqf
 DvPzltxQ6MqwjP3ff4LHpLBIDj/PKtYktZ2V5BELAqnzArsj1IxhhfXhrbyg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add support for the Renesas 63419 based dual-DSI video mode
Display Panels found in the Ayaneo gaming handled devices.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
KancyJoe (1):
      drm: panel: add support for the R63419 based dual-DSI video mode Display Panels

Neil Armstrong (1):
      dt-bindings: regulator: document the R63419 based dual-DSI video mode Display Panels

 .../bindings/display/panel/renesas,r63419.yaml     |  92 ++++++
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-renesas-r63419.c       | 356 +++++++++++++++++++++
 4 files changed, 461 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-r63419-e72467e2db0f

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

