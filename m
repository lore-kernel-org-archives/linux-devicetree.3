Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF954E5336
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 20:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232117; cv=none; b=YkgNNg/prRBpOQwu2Yv7BhcC6h+njJllotIka4oYdkcO1ZJ4i75+T7PFNkzq1iCJlAztctNNVP3r3rnsinuGm0+yggLALlX/thfnzDNj+KAj4rsEZ9FalWqYjbdL9Gfg6xotWr51P/ZsUmofX7mCHndwD867eoPUyEHqMa6XRnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232117; c=relaxed/simple;
	bh=3h/9Irsh6hLdvhKk61bUEKtRVcfu/x6aEEt8IH3OiO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eCQSx0ZhlLm7XnUgmRlf2+My4VJyGKwLCby+7V4USR7ulTAdJjLhd67TyxpGPrW00BUkHb4qsoFcCY1uj88uk+t9/OX6QVr6Pabrn3fGTXx91qo6TTr4FAvm/J5hNqf+4jVAa93GgrzsL3gIR7HOlpCsH9245T5rxYjEfzttbOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUiKLa+s; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUiKLa+s"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso3452613a12.3
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 13:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232105; x=1791836905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Em+DHux8TygVduIPIQfg6MjS0noelHiEnVwLPezX/Nk=;
        b=EUiKLa+s+dLlbnmH3pv9ysRRgy5xdZFtOw3eK2E51qz8g5lTezWuaNQmRq78ZAbQ6m
         4qCEArzqW+E0GkMBtZMb1CldDPxc2ZdbphKNGG9ttDZliieVijMN7riC69zQilKqlTAZ
         WjYPVyL4yLvPWT5ayYhfiLCFJ4s6alr4LMOeTLB+NlmmKuE4KVl5Yyr79E1HoBiEwe72
         9z3CtuFF7x/pf7If4MW/nXQIJqfUVpp0sVmMOCSe8ywrsx1F06DjJL7f5QttI86gdIdL
         hu9Fr4/LufNDZyqTYKCMvJqJjVrEsUSXzGswlhc0S5v5cigaPS5cjjfIOuIzhALQFbfe
         /3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232105; x=1791836905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Em+DHux8TygVduIPIQfg6MjS0noelHiEnVwLPezX/Nk=;
        b=sXDzNvgQ2SE0pB8cV26StO80l/V6jsFkDTe/7sndyUwUruJkRaAT7FcBS11sKFLcRs
         xos1HM0g9gyQj1pU2kboijDvPmniBO805O9mDexpbT2n2gf7diO57rx4zXBawgv4Ro3/
         pJ9LmVBd7LP0xQo3FfB2vMvVWfqm3w3Pyut4zoGnhTIM50kiwfIcnYfBKv/PnfEsZswG
         qqWqdIq9K9EQ8kk9XNI+KOcgXYfNA72pwh1mVsi+/cxntZFu8NCwlRwl01yfTJxLpxh8
         5piqBzBq8Zct0BXc4pvFqzf89Ojhah5GpR5OAbYIz/G1WL6oQXsThedRm9f739YkfraH
         nR+A==
X-Forwarded-Encrypted: i=1; AKwUvBxcG+c0Y9eEHIt0GZzhkLDpS8DxdfheS2hxCvVsG2QHI/GlO1NfKwwMccbQntUK1pUZ66/E0cSKaAdl@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5F1kJ2alB51sCjYfHFAw5ye3MxJRLrglCrm/Dz+H5mRdTWRt1
	itMFg6t7YSoIdFD4WqBQwp8b+x2JJmD/qtf8Z0N9g1JS7EKFUlofcX4tYW2mJkQm/3AS/A==
X-Gm-Gg: AYBFou15ElWaH+aetpBoORPvrBX7jgFQiwSkl34b9Q7fY9l4nYyYCir1MmIsUbBUOcy
	v1gm4JBgcp2EMCDcsiKO9mwVydsXO1KkxJDv5dlpVh2iODirj0txqBd696QGhMVcWpePSj62pwo
	zvaWxH5AG0/foXcNidtk/IAOSTpNYhz3MBL/+9Mbulj866qIxGOtc1nO4ndgLYIwZGp4tsCk/pW
	nJAIC2BnQifBWYLGv/QJK5Z1neIdFVM7Mx3WUDWsoz9oqUHCwa8kjOXln0WMGGtX4qepWGXX1g5
	eY8eXUyzSBsjHXy4EGbtq5nK7WiTW8wjNjr58NcdGloZrUFe0qb9bpPN2KKaIyo57ep8VSwtTjD
	OYW0bBNkMMb6fAjn8JEL7RWLYHSnwvCxcseWgnWDhkQzGCgOs9mWMH38HI8q0GQnptpg2wBYhEQ
	N2CsVop9cZ9CovIQpwjd2PiAUCXqOfIKaDhNWbKmppXwosyNhMJw87nhNiKph6kfQVvmK/PL5+0
	XBJDyd/x28qKS92tKEGEbC7CO7QTZC3
X-Received: by 2002:a05:6402:4021:b0:6ac:aec6:a3b9 with SMTP id 4fb4d7f45d1cf-6afad90627bmr7128320a12.24.1791232105212;
        Mon, 05 Oct 2026 13:28:25 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:23 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 08/11] dt-bindings: interrupt-controller: add Allwinner B288 NMI
Date: Mon,  5 Oct 2026 21:27:28 +0100
Message-ID: <20261005202731.153971-9-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same register layout as the sun9i-a80 NMI, like the V3s.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index bb9273ec2457..179e7842bf46 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -29,6 +29,7 @@ properties:
       - const: allwinner,sun55i-a523-nmi
       - items:
           - enum:
+              - allwinner,sun8i-b288-nmi
               - allwinner,sun8i-v3s-nmi
               - allwinner,sun50i-a100-nmi
               - allwinner,sun50i-h616-nmi
-- 
2.52.0

