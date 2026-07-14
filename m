Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AB1418A4F
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784056444; cv=none; b=IMnV7L1dhZQDEh8P85erquLVn6RBn/mgDs/fuhqD/+tlh0ulYSgFoQiGfe6g926435S191IzTSDqyQvuPDVUoyC5cx35Kz2PfZlQhEnireSpFGH2ChfhhcbZnUo2ji1pnSv1z9oKIGKG7Yfnz2fjl4x9mcfDiRtLnbFWd2groZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784056444; c=relaxed/simple;
	bh=wxPeLCsTAeswrvJTcR+iTOSTPK40LDXWungZWSaYsrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z9BaBh2jhjkIAKKA5+Id4c9PyoqhBIUPkLo9SCiVeqsJU1oqUS7ahsDNQCOlELv2y7VKSDqQPURYl06XKUSgrR5drDi8NptWyg5xo8P5lOLAOrz2yVB738TDl12zU6waTpoKF+nAqzfQu2a20Woaaui3f4Va8qiXNkWemAkUh+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0sKl51c; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0sKl51c"
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2ccbff2e6a7so31003395ad.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784056443; x=1784661243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8x8RDbcfDX0JdqW/clHRnOctzbZEE6whwRLBLDpw64o=;
        b=d0sKl51cPheR02G4mwJ/+sPH35EqhCpVvqaQfDK0GTYOt8yNLCdsbDp1p9aMxnqHub
         JnXIxBcD06x3YQfQcS1VK/8zjOfB5JmK5rm1GDyeGBwMGHJzs0izcEvZKI6R/lXMgkSC
         gTi35BV3wXY92BpgMnCZ86AihrptpWPkhT78MuCDKpaGHaJqhD53dFnVgPNLWRVD+v4T
         27HFC0kFAqANC6KnpFUYEgWYxl7gXLysZ4DNGHXgmmqIeECl4diax36QpO+e8m6vuNTG
         b/gXXKaGr7P5zthl+JGdp/RvGAXwqtXSeBEcTYgee6MJinYBYhBNWw3SgAdEwVr5OMSV
         QDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056443; x=1784661243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8x8RDbcfDX0JdqW/clHRnOctzbZEE6whwRLBLDpw64o=;
        b=egf84u3+QlvPoS8aq9TJCkLQ9i4CgpOhnJjWtnp2X8AFwaoNoTOjkBtG9iuWnVat6U
         5/CCZ75Jcqst+SajTKSAYKuMfpm38QfbRTnDVwMsXBM1hOG80NpqDFaN6HckJQVK/VNG
         bsZcwoNNvQRmZVWPntGE0LjziYdcV6VXiI1wuIeQ6/44tjeea78ZeSHIy9IpWy7SCdBX
         HlKZJXPwOx6RIKgfbyUMRB0/dAPJ2JixQR0U0qcBtJKE5bnaaIQYc9ezbAOLJui7dk4w
         YK/km+EGxSNMKtnoNQBmWii3GwcGBElzz+cdzDyhhiJD16wPm+kLLmuBKIh0RPOsIRke
         6JxA==
X-Forwarded-Encrypted: i=1; AHgh+RrsoAhrXN1fDT4Jk/wHCJhBm8MmDrOEsGAMFv273WnfVHN3d/CMiKw+L91aI4YAo4lBILe5GQ4AFddL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjggumde5+SDI4kmgyg9Ln96xLLlgV4Lpux1tuG5RRgLZDHmG9
	bD+unRMHV9LY5By7dzxX4cab1e9TwzJHPcb5wVcttcPk6/dVBVIw2kzh
X-Gm-Gg: AfdE7cmkvbsP8SdMQEGtXxCryirB/8cgGosgm7oqJsn6NkfQboyVjIZXphv/M2LKNiZ
	1t9nHWCvJOjcqza2nIqCL/vo0To7Tmdb95OozXIYgW0p2i8k3CkDYO9ysGEKioCWGzB6P4SNe9X
	7Chv6E9hjWq7A1x7QLH3HO/lIiPuzuObRw0/mWUY6mdRw9qCkuHYeeD0nbyUtY+nKFBUTde+eLV
	b65U6Yt9Lj0prDlXYY+trFQzc5oCM0XdLeaibiIVwOZPTjh4KjzhkkaG5NhgWWiUTK/OhGpK+YR
	XZVjQlGbb6khJI/1DFh+k95weouaozqnKdwiLt48nmnWT9HOGaAdGVtIWrzY7QOjZkRVg+Twaex
	j6nNdIPMgRyy5hy4c8X1XAayO7lc6gFhnnS9dE7bCGz6h2Jcbz/WiluMZX+TN1ezTCT72nHY0cJ
	NXboKhhTdWu+E=
X-Received: by 2002:a17:902:ffce:b0:2c9:97a8:8c1b with SMTP id d9443c01a7336-2cef1374743mr36739275ad.46.1784056442914;
        Tue, 14 Jul 2026 12:14:02 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d451sm120763245ad.65.2026.07.14.12.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:14:02 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: kuba@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	heiko@sntech.de
Cc: netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [RFC PATCH 02/10] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Wed, 15 Jul 2026 03:08:30 +0800
Message-ID: <20260714191341.690906-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714191341.690906-1-coiaprant@gmail.com>
References: <20260714191341.690906-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RK3568, the SGMII interface can be routed to either GMAC0 or
GMAC1 via the pipe_sgmii_mac_sel bit in the pipe GRF registers.

Add the optional "rockchip,sgmii-mac-sel" property to allow the
device tree to select which GMAC controller is used for SGMII.

The property takes a value of 0 (GMAC0) or 1 (GMAC1), with 0 being
the default.

This is necessary for boards such as the Ariaboard Photonicat, where
the SGMII interface is connected to GMAC0 and needs to be explicitly
configured.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/phy/phy-rockchip-naneng-combphy.yaml          | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 379b08bd9e97a..6173192e31ab2 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -80,6 +80,13 @@ properties:
     description:
       Some additional pipe settings are accessed through GRF regs.
 
+  rockchip,sgmii-mac-sel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 0
+    description:
+      Select gmac0 or gmac1 to be used as SGMII controller.
+
   "#phy-cells":
     const: 1
 
-- 
2.47.3

