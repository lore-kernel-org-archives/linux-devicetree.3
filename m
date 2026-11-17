Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794944015;
	b=QptgQhahXGSGT/2wfM5K5t5qVx7kKp+0xobqsItt+cfh8gxRqULQzKnrJKGUJ8W5EAhQ
	 r17ptkOcnWNNVyTtTsNZ4tD2lc2ihcwGErzAbmDQHeeAv38Gf/wQPCi1w6hGvfsbojQKQ
	 oP/mUOE3O8+T4jQbI5x0ekEsqwfqNxv1xMzXfsy+qm6jCYKpeF7UUO4F3eU+TzGzqvWje
	 6zYOZF/gWR/JZSIcB7kG6aMtFCA21SIOOSOy7OBjLjSXsOlhqSdUHCguLu5juqOvyF78g
	 mZ2l6+JkZ5meLQbDjs2MxF2lUTti2iAk/Cwl/adyhlBx5OnyuMT0okfxULcbj2Z7+sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944015;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zXHRlH1grwmsWBkDkO1cZH6/VKYnf69rDnwai8oBUh4=;
	b=tS1QwtOV7gywvWQDHGcEFlsOxwphtyX4HQ8YT0F2cr9M7fxSLu8j8Xa2HVK+yW6WJQPb
	 1ECZds+5FkDI0VmRvig23Mm3qv2AtN1LJsoM3wlmS2+IAGnMn7lCBYENt1bPhp/Btblrl
	 MYlufL4d1Le8gZG3rjio1VBxCf9VWH+jZhn8A6m0V6NiUb/bGy44y/mqGwkgHYQhSa4NP
	 xwfYfDWKebFjom1YdwTZdHEqWrCEA4t/EkNwmjwM2ta5WRIfcPZYm0nBK2AaUfAf9kTfS
	 bFivooVVvTqHb9z/bkdQqzptbtQYhC+SgtV2fOds5HSwRAsfQF3Di7SUiMt5Wt3jOCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b1q+KNBw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA48606A8B6;
	Tue, 17 Nov 2026 19:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b1q+KNBw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794944015;
	b=e2WmYxDBewe6baMMrV8N1rJ7LfOdvPs851eqUG0fZ9j0kvVPK6VMzb2JFBxj4ZiLMLLs
	 /5aGZrbUi1NJ1Ii1L0XQYOnZYO6uvxnldYf+Is0YLjdSPDAcl4eS2uY5xUPn76nJaqM5P
	 Zg0e38+dBUemwieu9xZcipbic5ef5LF3QI3PW4jj7N8BVz5PqyRx34AVyH45rXA5Z/xgH
	 htXgmJ+p9TYu5S38anhbwu3rUXWX0QPoH0x61PU6Isue2PAMUcGbK5UHttFPms5hZapgh
	 qRF3lVYdt59isW9CG3Be4/8DV6u6esc4zVjLLduT3KvyBMx27bBSTP0HA/SqBOd3sMQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794944015;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zXHRlH1grwmsWBkDkO1cZH6/VKYnf69rDnwai8oBUh4=;
	b=r1XvswPmqLr/crL/flupICi62brdROcUxU/pKSCy9mulM9TRQYEfGs3tIc+FBBzl9big
	 2hVJQs63kLUnuGcXzX5eNYTApWm53oJ6jUTTM46j6d62OhgC2go8uij1mbDQ+D9YpHtYI
	 pZ93IwXYTBV+0jP7T/1dG9DmdPK2RYCzF6DCUGXhsFcXrsv7Hg5T/FpbcFB2TPXFY0Mnk
	 sZr4CzKQgWklW+/FZv6dODvpyy8ao+Rct96JOADscQz9CMqt+1hWC7n6g45F20Wsyq8FL
	 1n6coVNeMLSr/FSOS3thkGDCBy/EESDU0+LYrcUExvfMvfTB3n5ANuk5sdgHAsIEtWg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 845A01F000C8;
	Tue, 17 Nov 2026 19:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794944015;
	bh=zXHRlH1grwmsWBkDkO1cZH6/VKYnf69rDnwai8oBUh4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=b1q+KNBwYVprFWI8JADTyQQhXU5mhgv3/aLEMwvzj0nw8iqpq2NXmrVBpyNOvIZ9S
	 VPo0b80+3ia7josXZSc/ndt9AQL8mstGge+5wlpIovJ+agLHP7rK+xU/MGPYl2mBQu
	 w447RzXh2wkbmfgumthe/7pBT5RS6CmDl2+AKDD0QF2xJxy6uHaF5D+0PkqerRiwR7
	 awegVAbn1f2tFqhaB96iGvKGANjF0kr/SkBcXXMW4Mt86J0j+iUPNiq7U/+foNjIA6
	 ORZ8QMJb0SSdDtDPZEvx1WXp1Qt2/RQwXc/WPtZ28uojgXzjuwVuOD7pV0+MkYNE6J
	 sD8IwhLFn0i/g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0AD544AA7E;
	Tue, 17 Nov 2026 19:33:34 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Tue, 17 Nov 2026 20:33:08 +0100
Subject: [PATCH 03/10] dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Add
 hdmi-phy child node
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-meson-drm-create-hdmitx-phy-v1-3-9e0ac931381c@aliel.fr>
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
In-Reply-To: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1884;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=FDST4M33KZfOuH/CuxU1R0fDiCrYl6swyp+sW6O8K1w=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9afNQwu2ssqtyxaPuNC0oavulFPzj2OjVLbuUzGmzW1P
 YSL2SOpo5SFQYyLQVZMkaV/ruWJd5ePnvm6Rz0FZg4rE8gQBi5OAZiIqh/DP4UzuasfXCu6dKJc
 0+Tk629TL5rG7Yidmq51bMeJY7n/Wk4x/HfNMjx53yLh4169K73tD6seMb156edX4c6jq6ezL7T
 MhxMA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr
Content-Transfer-Encoding: 7bit

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

The HDMI TX PHY found on Amlogic Meson SoCs is a child of the HHI
system controller.

Add an optional "hdmi-phy" child node referencing the
amlogic,meson-hdmi-tx-phy binding, and add it to the example.

The node is forbidden for the other system controller variants.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml    | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
index 285edac4c082..97e47592aff2 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
@@ -36,6 +36,9 @@ properties:
   phy:
     type: object
 
+  hdmi-phy:
+    $ref: /schemas/phy/amlogic,meson-hdmi-tx-phy.yaml
+
 allOf:
   - if:
       properties:
@@ -50,6 +53,7 @@ allOf:
 
         pinctrl: false
         phy: false
+        hdmi-phy: false
 
   - if:
       properties:
@@ -80,6 +84,7 @@ allOf:
 
         power-controller: false
         phy: false
+        hdmi-phy: false
 
   - if:
       properties:
@@ -104,6 +109,7 @@ allOf:
           oneOf:
             - $ref: /schemas/phy/amlogic,g12a-mipi-dphy-analog.yaml
             - $ref: /schemas/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
+        hdmi-phy: false
 
 required:
   - compatible
@@ -155,6 +161,11 @@ examples:
                 clocks = <&clk_vpu>, <&clk_vapb>;
                 clock-names = "vpu", "vapb";
             };
+
+            hdmi-phy {
+                compatible = "amlogic,meson-g12a-hdmi-tx-phy";
+                #phy-cells = <0>;
+            };
         };
     };
 

-- 
2.43.0


