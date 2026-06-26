Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8154315F;
	Fri, 26 Jun 2026 03:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782445164; cv=none; b=bkAVZYrRDyiBcXtn0pLtDQDtFAlBnEKKWruO+G8M6CTcGQwgFDuI4yLu8a8IApFsurKIgbs2aWMwlBbZxSCiNin3CUMaMgkqiA1wJzzCyoNRVEJt5iilJsZYgKqn7n3gSDRkoT3f6XJcRShyN5axWV1oalkiOgrGhJNaRw/vAt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782445164; c=relaxed/simple;
	bh=8cZvrd12OFF3EHntgDCKOyWiw07qr5bu5yuwDuFO1fo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fzwz97BsCBTjII4vArjwMbZF8D/AgkrccRkY/6Red/OjE5GLxEATciOuUxbeV7KQOxxQZ0y1i3FerCotp3EoK3Ea46lNTk5sLM1y+MdihyZtwO6ncfVUqMw6BbX6jhRat7s+dluU6IyA4YmzHmrBh1NDIgOnlCejOOdepLs1nIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=Ys3ogTLT; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="Ys3ogTLT"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1782445153;
	bh=e0kEp6TIKcSkhTWP/hRPj04OaAKFXldHgscnAo7fhdw=; l=1467;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Ys3ogTLT0Y9eToKHjk1fx28OcshYkL08pBPibIqbuUHD++2ScGglYtpmSytNvkd36
	 Hs04rNA6aY1tBpHEQ91uuYyY7Be1FcUq1XHARnF2tj7wOAO9HrVhXWjPn8s0pXmjFE
	 bupiY4mZogqh0ijxyU/VefQbRroqBsPTerAVKSvlJoDGdI64ezPLd1gUwyc4eO72js
	 gn0WsRzESLrhX+jZIni2NAlOUeD0Wry8aUF0fluqA7FIfbnt1cBLpjrlIV47LKqTzg
	 iAxk1Nf/a5pjSGMTdjyJL629qzaOhOhKtF6blHGpnTXjxhsDkWB9RrOm2gXpSO/2gJ
	 dYH/M348+kZeA==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1155897:1:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Fri, 26 Jun 2026 11:38:58 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Fri, 26 Jun
 2026 11:38:57 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Fri, 26 Jun 2026 11:38:57 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, ChiYuan Huang <cy_huang@richtek.com>, "Yoon
 Dong Min" <dm.youn@telechips.com>, <edward_kim@richtek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] regulator: dt-bindings: rtq2208: Label mtp-sel-high property as deprecated
Date: Fri, 26 Jun 2026 11:38:52 +0800
Message-ID: <594ebe167b33ca885c040984624e4b5d1382c0e2.1782444299.git.cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1782444299.git.cy_huang@richtek.com>
References: <cover.1782444299.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: ChiYuan Huang <cy_huang@richtek.com>

Since it can be identified by hardware register, label the unnecessary
property 'richtek,mtp-sel-high' as deprecated.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
v2
- Following by AI Robot suggestion
  https://sashiko.dev/#/patchset/cover.1782353659.git.cy_huang@richtek.com?part=1

  Remove'richtek,mtp-sel-high' from yaml example block
---
 .../devicetree/bindings/regulator/richtek,rtq2208.yaml        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/richtek,rtq2208.yaml b/Documentation/devicetree/bindings/regulator/richtek,rtq2208.yaml
index 022c1f197364..25b0865d4c04 100644
--- a/Documentation/devicetree/bindings/regulator/richtek,rtq2208.yaml
+++ b/Documentation/devicetree/bindings/regulator/richtek,rtq2208.yaml
@@ -42,11 +42,14 @@ properties:
 
   richtek,mtp-sel-high:
     type: boolean
+    deprecated: true
     description:
       vout register selection based on this boolean value.
       false - Using DVS0 register setting to adjust vout
       true - Using DVS1 register setting to adjust vout
 
+      The property is now deprecated. Will be identified by RG HW register.
+
   regulators:
     type: object
     additionalProperties: false
@@ -100,7 +103,6 @@ examples:
         compatible = "richtek,rtq2208";
         reg = <0x10>;
         interrupts-extended = <&gpio26 0 IRQ_TYPE_LEVEL_LOW>;
-        richtek,mtp-sel-high;
 
         regulators {
           buck-a {
-- 
2.43.0

