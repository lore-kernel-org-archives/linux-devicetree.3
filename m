Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393464;
	b=wVDLCcX5nzCoBdbspRJRLw/h0A6Q0nXThhdMV738C1qLCWduQtrJK4vc9iwxeJWFN+fP
	 gwxx4RrQ/Zv1Cw5dlkfMET+ABzx7lTg5WRLRW/LlpNtMYsAIc2Nmn6N7zyuDojn+wTPi0
	 sRtrGN1k5U98IRb/oAOxl6s/VkGUJxR7eEu9DsfXGRXlXrxeHCFJgFBa4pyOrbT+bG4Tn
	 44Ze3iGB5hqV7X8nY4XzOA7smjlp0aoU5YAHKhOqGP0UzCmW0XiRfdinlSRNOs+5y+KQB
	 Jl1tIeEqNyJIiYMPy7Spg99e4R5kvsFFKJFoF3xLwYu3YN7cYAlHos4dJq2Gs5phn2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0qMWUwpenvvRooHCV912wT6twGzrEe+8/IZ/0k0HJCU=;
	b=N4QQJ3isu1muMivQwwBsaZrZNeS7J8gKY7FSIvdNN783dZk3BvRcU/cI1GV2iB/P3q3T
	 x0PWTBTKwat1p9LWJCAGQ4z4Qu0praBNGuZPiUEYpV4y+JV21ublJcev7VGoGXsj7jXoi
	 EjXdtpIpDDRtlybmxNOBNffeMHZWolL1rekK9U7K0K0UEu+i1BiAxRDYnMtQXfXICiatZ
	 d0p2/xZ1g/hl4cG6m0Vh9WA1g2UGuzzo6KPqhGxw02o1Vm9Acp0/NMJcVnRwBxLTRsVOY
	 gLRSva/917mfK3RzCzERdMXs7szXiZmvxNu4d37mnlufsM2fF99sQ2ZCvQt5+OxFYyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Qc8xrak4;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7CC606A896
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF7CC606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Qc8xrak4
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so4696193c88.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 02:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794393463; x=1794998263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qMWUwpenvvRooHCV912wT6twGzrEe+8/IZ/0k0HJCU=;
        b=Qc8xrak4/32Gna3SdE8hXByhMXfk5ZZ39ef3KlM7LHsk/FC0f7Gjv11KdQfftmNbKi
         ZtMFOwXoIgdUsue1L1z9jsQjczEeNfC+aru77qwkE0bRpriBwNJj/5HhYqznr8rtacKj
         JcoVLxM3d59zgKMcBFHGHPpODNY+xk7Tqy/b4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794393463; x=1794998263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0qMWUwpenvvRooHCV912wT6twGzrEe+8/IZ/0k0HJCU=;
        b=xZRqm45t45+XoHnv+U+88iNchTFSk7sTZtcdrK1E9mRoklQeUdoBRuveNpDEqJQXHX
         G3vEMlR2Citug8PS3ejP3n/X0j78KGFmBmze+SIJ5GTgfmqwOeyMbwUTgZwVtxUA46aZ
         yUkJ6d3AXRuoOKB/30ysUdwVNCJ/QfpSlQC22hLteNHX206ggW9BGsCjpW+f2xmowovk
         +Y/qyRtXfpSJbloLmHDfbREELarEdmz6pvSi1fl24wvYNZVk1c9CyCFjJWNg1gbC3Np7
         d21rgZ6mkwut+Km7rzz+3giDWT/Xy8L+N9kZG7LJL7QJz/QejQrF05eeh2H7NWyoCXEe
         +UJg==
X-Forwarded-Encrypted: i=1; AL+hErEN3rtCA3+wLcMP6hwLlkfHDWcyWF8drs+Hbc8qsGpgWqPXcm49c7x76SSVRt00zceuI01xGo866GYC@vger.kernel.org
X-Gm-Message-State: APuU4Z9U25l5LbO259T/NJ+S1oFkqGtTxe7kTXup1r8T0G9XZymySBrl
	I7ijlhNJIhFkdJd4xt4aMbjaswQ72D29T9xIKIQEYS3DUcLsK+irbfMcd8aXxpKKoQ==
X-Gm-Gg: AYBFou3ppwmH/L6zmjqihJtRxVCVkmQOBbs90lzd9RKjtNnaLBhbA4AE5BjLkmkccTh
	6sK4WsnFqupktRGBiDqCAMZGy47J+bwiEqEPhGWz+MvT5fzb2BuVZyDbapHKscvBNkKX84H9+JM
	IJtUOYNJTuEHlLKz4563i/KBr1sU2xiaYR3GW9fG9KwH5M17xKYoEu5sKSYPYg8BH3t7muP2iPj
	3vaUQqQMq5EQb8yj9fKQpN3mC+6ma0yWbuBoqSC2aUr9gVb7QWXqtjLd5k+3mMV1QWUG9LwnK8o
	ixhtG+Mgc441jMMla79R5ub1Nj5Hn8RzY0F1TV+XTHxYZHBE9MdQ+dlZwiB7HH1qwM0YQefDa8/
	yt0/IFb3KMj8ncB/OCDx/IDu4t8H0Q9yzR1VTaZOjWK+WePXsBxN8DZWXmlf2AcBfwCb5v1wl0H
	3OvQkULipDoacN0nJcufeI0PA6cB/C/hU3VkPP6lYH+/obR5qtAo98f7o/9pcQlFi3J7Qy/7S0W
	dnM58TCqh75XcSwe4wGmy2qkDZiDLOx10sVqk0tCq14fvN6TCmFda+6irzewpDE9IqvWiSxcEB+
	uAvr12LOD140007LrWt7g8gwkzRt3yAceQ0lwtIuWsjrRJd5UECfijcYvc+DWH/zP3ajh9MMfhj
	iI2XX22R1JtWAGsHBI9ObHjJw1OEV14SXLLVJ9A==
X-Received: by 2002:a05:7022:c91:b0:143:2968:564c with SMTP id a92af1059eb24-1b3c0318478mr1829313c88.26.1794393462774;
        Wed, 11 Nov 2026 02:37:42 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com.com (61.14.81.34.bc.googleusercontent.com. [34.81.14.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm14735194c88.2.2026.11.11.02.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:37:42 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Fei Shao <fshao@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: usb: Add Genesys Logic GL3525 hub controller
Date: Wed, 11 Nov 2026 18:36:12 +0800
Message-ID: <20261111103710.1393311-2-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
In-Reply-To: <20261111103710.1393311-1-fshao@chromium.org>
References: <20261111103710.1393311-1-fshao@chromium.org>
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

Add USB 3.2 (usb5e3,629) and USB 2.0 (usb5e3,630) compatibles for the
Genesys Logic GL3525 hub controller, which is powered by a 5V VDD supply
like GL3523.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index e8b8c03f87a0..5153a988a835 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -17,6 +17,8 @@ properties:
       - usb5e3,620
       - usb5e3,625
       - usb5e3,626
+      - usb5e3,629
+      - usb5e3,630
 
   reg: true
 
@@ -70,6 +72,8 @@ allOf:
             enum:
               - usb5e3,610
               - usb5e3,620
+              - usb5e3,629
+              - usb5e3,630
     then:
       properties:
         peer-hub: true
-- 
2.56.0.542.g3ef89b7020-goog

