Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFB63D88E3
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 19:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783367959; cv=none; b=ucQ+1M0Rp5ZgTpmtdBpI5R9mNBX70YZed3D3pUoSmjZOr+ZYzTNiI72/WqfuO1DtUFhB6nF20hAqozXwoUfI0C2RVgfaBi6L78OOKRFD+YxZ0rYqDM5FhGQM1L89aCxLC8FDuoxpCvTUVSPilQnKirt8WtguRcYsU9xTWQfcj9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783367959; c=relaxed/simple;
	bh=HG/vvcE6mGXLyntQsY5DYfWZVPbqICPTaBsQ4HuEnG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=syTgqT9wzP+GxJpUeQqDLBe/XHB5lOttK1pWxNTGQaFIqeRK5OCfKmVbjaAKAaikm5kqSe3f7HW+o/dZoK9ySZL0ZAY4XwJpAEsWyXrQR0u1PaFmWcczOBkX6Whd0P1sUWFiWDjUn8lJkaFW3XeH97xGaKatgXCHSS2mZYSHhsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GnzBFrgK; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GnzBFrgK"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e9d7464b71so996973a34.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783367956; x=1783972756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuhJj+HUo5Ktaz5cJIt67wPPHXjsVKySj5VwgZdB+yw=;
        b=GnzBFrgK4fTANISxcjXk6/QyY4BRZbYfxgQlE/fcRAqok1+pbCkuK8YW5ecdroGcpg
         MA/nv4gC53ubc/hbY2p+LvAriT8rlcatfwQlS1eBzML6VSsUBcaD4M08Wge59nnJht2E
         diwYPDnVD19fuBMAGw4N3DBIT+HB0v/E3oQE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367956; x=1783972756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IuhJj+HUo5Ktaz5cJIt67wPPHXjsVKySj5VwgZdB+yw=;
        b=jB1C9tLgsHx7jG9dZ2uBmM1RtwFa9wPUeaW7TlXOc1i/CulrKgJ1gkii1ZkhD661az
         ZK0CS1CdgTlFs9sUGXxWJBtxNJP9w08q3NKDkYAn+xbzCuY8WX04UppJxDvqa8GwlhcL
         07s8mgSQxrTyMWagJFDAHSk2GHBBBpbZZXIcmFyTmO2fLKe0zIO5oiSwRqQ4mBNOtmAs
         qRkJX3uuthqY3a3yCwZUCtYPbO5CBwbRJGqW8IY0rsQXqpkFacUCtKTVxvJI9x3lBDai
         TWmXLtpcIaRpfsuN/yNaQcJBlyIxLYTiBXrsx28NvBW9xM6d3pVrNqXOyfjuEdTTktSx
         mevw==
X-Forwarded-Encrypted: i=1; AFNElJ+8kk+X72IdhRY/ty0AwNggekYnqFAJBbg9KkMbeGPLXGcQpSmZVZZRZ4ScbYy86GLiKgz/yz5snEtV@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqj0/ab+uomDXPIEEylVRpesDXf0OPNsQchBPz4xGhR89VnYRN
	mE9XLPpR4F2QoViplibMo7hTLcWU+7SN4iixqu58AGRMoClxLA4uXHVlE4osxLFnEA==
X-Gm-Gg: AfdE7clSN00isOi4KG1u7aPlEnk1i49ySbSODwGkV35rC2OkREiY9NpVqY4TKqoGwEu
	3dDniigT5GwlAdP3EksrC7f3o4WFJBbZ93JxfMAfJzsndna+Cja41dcDKK1MYqStPoBQg+dxpmj
	o029laFEcsuzPmnjZHLQ/iimnMJZb+ilV8RXf54xPiFrUFowrc0oAfTax7Q1HvjAiILm6takO3p
	Xtzt9arteJ7IE0jdWqXtFfEHKBrtpKm1Kvezn15p79Toy9PcF2g96m5fsN4OAtrp5Fx1pWM3M0H
	BIAUHa2vh95DXNAkfcdDJeEaPJTJfZZy3XhCfAtv90GfyTsHVxfS8pMdeaAkfWtRaETSDC5kMD5
	i8wShrjQNDbEdKWu40b3BW6/61m1fCpKitQNzKN5hc/iP6LjiTvr5c2GDdSfhOH5US2tOQ37d3d
	qF6ZH2lyc=
X-Received: by 2002:a05:6830:6ab4:b0:7e9:dbbe:5afc with SMTP id 46e09a7af769-7ebb23d1703mr1257460a34.32.1783367955684;
        Mon, 06 Jul 2026 12:59:15 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm12161834a34.8.2026.07.06.12.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:59:15 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	huang lin <hl@rock-chips.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/12] dt-bindings: pinctrl: rockchip: Add RV1106 compatible
Date: Mon,  6 Jul 2026 13:57:59 -0600
Message-ID: <20260706195818.3906949-4-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706195818.3906949-1-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the pin controller of the Rockchip RV1106 and
its RV1103 package variant.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 9b3cbeb54fed..81747bb53056 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -51,6 +51,7 @@ properties:
       - rockchip,rk3576-pinctrl
       - rockchip,rk3588-pinctrl
       - rockchip,rv1103b-pinctrl
+      - rockchip,rv1106-pinctrl
       - rockchip,rv1108-pinctrl
       - rockchip,rv1126-pinctrl
 
-- 
2.43.0

