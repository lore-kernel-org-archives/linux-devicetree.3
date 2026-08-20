Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B01448397
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787234486; cv=none; b=cxR07qew+nqF4/0zlV31rUtOwu5KPfMkYtF1yVK8RjJoX9bvyhEaVeWrolUrnt9ddUfVizvVR+eRpOkZrlgqhOzxRAlBfwzZ+DPpVMhaBGuz+E6hzdcCoUEdQPMGfpEjfz+fXKy1O23hGg/tnC3heUYc/MX5KX+GrukR9hl26Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787234486; c=relaxed/simple;
	bh=1F1r7NotkpzJGaZPEdB9UeDk/iA0euzjHAVH6r9N3K0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gJPTPrMxpunwG6IostQwilm28gYjtC7vHbUhdL2vud5BIzRqAvbzjvjTA7Ej7e15snRHqJblGZEGX19ZqMJEDrxwg6DPoLfnweHFaRI2ItddBDcW1TyziJXgf8c6gfHFfPWsyTvL769Sj37SQT1nfOYiUP0AsO2zgt09aH9r+iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOy3j2rt; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOy3j2rt"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so27131785e9.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787234483; x=1787839283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nO19FsrOkyTqyk5fmO2arL61kBUyFj/iNWEiNLbHn98=;
        b=dOy3j2rt0TY1GN68gQDI3GY+Bt7xQ7HM+bSzofC96F5ozYb0b0OSeLDQhUv4eYTCeE
         EKVRsMpihiN2eyTCY+Oe3hAAVn/OvVhvTQOjHEG2oXv6Acdr7SM+lbY3wxZVBrsJIi7b
         b+n01Ynif/Ss5p6JDfkh5d2zSrEm/Wdz0ygXxLKHm/TsfuaOFKTFZ4OCkfc6DndoRXj+
         2H2paSndOpFRru4qjz9c5yvSbV16Y+KpoiXaMUMPwTFSSydejAD66c+ENcMhfcCad/G2
         Lbzzr03WFBdte+DYNe4cZ0wiu/L90fb44lfpddO460OqdVLZRHvOoodv+z8Exu1EjPwU
         rPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787234483; x=1787839283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nO19FsrOkyTqyk5fmO2arL61kBUyFj/iNWEiNLbHn98=;
        b=VIxkcm2iWOYx2IRrCY1Xm2cwkqk6lJFSWFtEUG4cP2jVxJnRKUUWNrEKO/xzmV1y4n
         vTihL3Ph+pCufT7iKMdlqJDo8xlLzh+a/7ybZjZp4OuwD9eN7s2HF5SnR/4qQhZbjSJC
         xJ54BLgTn8LvMpJC/Z87Gb3mHfiDSfWxaohZedHvDAK9196Em7I6kDprqokiYNO2hu6M
         k81QMjlG2/Iqg7uV4mNcj6qKy2zl5T/YTPOYkHBzSBEfhFTo9RRkCBCnUGuDrGt28cl7
         7s7DF1Gtdm8lp1h1XpXo2W5IfRM975TEnC6xgB1XqO54Tnb8LEB8a9i7mFt0FJOPotGy
         Z3Dw==
X-Forwarded-Encrypted: i=1; AHgh+RqcQYYMpAAYq1FaiVbfdKFH6YocROz6hp+maRDZN2NZ/lAYYn/KnjJiR+C3yCJ6RTVadpI3QZ/7G3AX@vger.kernel.org
X-Gm-Message-State: AOJu0YwCZDY/+RBYWFMQf9gHv6b3ZQ7kmSYActlh2qwRBV0j0d410zZL
	146EfhL+z2b8epetBevygjvp1tjIUDLsBgpqI4yfqdIAn9biXMwYP5Ir
X-Gm-Gg: AR+sD12pi8m3WUPS35JCgPr7ajjaPE5a6Q2g1sgQO9JMRbJ1Zly/hMaLa5lyxG49hTZ
	AHTc7AbRgQ0+OrgtDX/HF1xAz5W0ns02g3iB0KbN2Q5wmE0cT9JqXU/0/TBrtVm76IuL6Wgsh0k
	DsqYRKIf9LU1ZkodNTVcpbz1ZMk407/LRoumRXJyKJgnv6MN8bmm0RraR0Tox4sFDLa+rKmRbQc
	azpT7kN4efFMVTfGTEnk/M56Rrf67ASzOkhO48nLnfEg7vTRRqHnA9JUtoX6+fbdPvAYEf4GNyc
	fuu87Vi66bYkykSCOBUjpXMSp9nSlVDEm8wBKZ2FzL2MNE+x5C5ASqWhBvopgfCOZaaFDxDE452
	dQ8gXik+JqTpWPNy/ZzRYaqzqPd6M+iMzWzgSI1infy2Zr7W5M9ZL35sPW4C3XDoVCmnSw4HWiz
	tLkOg1xwC19UyrKIzaCh48sTzgBs/Uc82QJNf0cdNCHzUUZXl+lTAYBvB3R3j84qtuzc3qq19K3
	Csecxa5ElNwgJoR3C0RdSKTfN8GJF+1qKBUCxD0yMMR1ig=
X-Received: by 2002:a05:600c:8b32:b0:496:c06b:9fb4 with SMTP id 5b1f17b1804b1-499aa200efcmr247008575e9.14.1787234483139;
        Thu, 20 Aug 2026 07:01:23 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0e473dsm137978275e9.15.2026.08.20.07.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:01:22 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Thu, 20 Aug 2026 16:01:08 +0200
Subject: [PATCH 1/4] dt-bindings: soc: rockchip: add rk3576 csidphy grf
 syscon
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-rk3576-dphy-v1-1-70e25e8d5e78@gmail.com>
References: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
In-Reply-To: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787234481; l=910;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=1F1r7NotkpzJGaZPEdB9UeDk/iA0euzjHAVH6r9N3K0=;
 b=Np7eikFgXwccg4Ti8gJzd+xtDeEZPan62gfovBipj90sdPV2MtJiz/SXhtWw+8fOcZ8ds5+jG
 kJxuBnXeSeqAJT6L09jGvrAaMY7eANAsKn7TqrvSzAgZ4vRkDHTVPOI
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

Document the syscon compatible for the General Register Files of the
RK3576 MIPI CSI-2 DPHYs.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 7bcb4e2f47ec..e94c83d7c138 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -32,6 +32,7 @@ properties:
               - rockchip,rk3568-usb2phy-grf
               - rockchip,rk3576-bigcore-grf
               - rockchip,rk3576-cci-grf
+              - rockchip,rk3576-csidphy-grf
               - rockchip,rk3576-dcphy-grf
               - rockchip,rk3576-gpu-grf
               - rockchip,rk3576-hdptxphy-grf

-- 
2.43.0

