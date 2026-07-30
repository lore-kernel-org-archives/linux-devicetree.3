Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6990F2D8767;
	Thu, 30 Jul 2026 21:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785448337; cv=none; b=oEHu3j9lj8JtwlIJBA72m/KkxJ1a8z5/CIJrZMhx08Gs3TmqRRO3uL1kGIUHwRRtFLeoYPpm4keAW6ERJPd0VMDiFUhUGBi0TG+C8bnogTpk+abG2Azxeoba7USQOAtm65dJ7U26DMZvxIrGpFkui7c1QbAxXPMIbFkxrfwSLFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785448337; c=relaxed/simple;
	bh=N364PIoVWuH6cDGXXPM9/j7iB6vbHjElNnY5IAQZcD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=omHkWe2Jq5C6KUwEQB9HjlfmY3Uq+ToAw/a8XM3LDqKFTtCfYjm157urbR4FP84JIxph5sxVBCVsgYFUi9jza/liCT2R6gGHZC1fi7gpbxxfPzkGX90Qxn9QFG3SP1N5iVDq1LtZ/6I4EvUqEWxEi1zTkfIxwLIRfSk1P+0Apo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9c7vw7Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9c7vw7Q"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DCBFC2BCF7;
	Thu, 30 Jul 2026 21:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785448337;
	bh=N364PIoVWuH6cDGXXPM9/j7iB6vbHjElNnY5IAQZcD4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=m9c7vw7Q4Q512J7Q+jBGFt6kwIbQtXjnlt6xzaE5MP3RFkF0A/UlFh6XWEfVYCYjm
	 bk8qZXqDWCnQTALeaJ1ikuwLXTm+GqK7gk8/iXrXnq5oOBz6VRZKkW8cyW8QJ6Zuoc
	 aM3spqQT+BIKrxTSJ4eWUJw/Arfi4BwBQ1gq13hS2DKqwZrM1jR16LPj/6t61d7+v2
	 68sICCxhxEzl6uXvZVacGZqm7kytkkuHV1tfi/p+VoyuUMKPRUt2+18H0wQhKWg82F
	 dq4iTfkz/37EE+gw1KWfb76L9jll5yHK0Wb6W+gQYUrUgeFn0hqOb6dDjtAOLTt14O
	 UM+S2SUMEWBGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE74AC55162;
	Thu, 30 Jul 2026 21:52:16 +0000 (UTC)
From: =?utf-8?q?Dawid_Wr=C3=B3bel_via_B4_Relay?= <devnull+me.dawidwrobel.com@kernel.org>
Date: Thu, 30 Jul 2026 23:52:00 +0200
Subject: [PATCH 1/4] dt-bindings: display: panel: novatek,nt36523: add the
 Mi Pad 5 Pro 5G panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260730-sm8250-xiaomi-enuma-v1-1-ed6d8fb99668@dawidwrobel.com>
References: <20260730-sm8250-xiaomi-enuma-v1-0-ed6d8fb99668@dawidwrobel.com>
In-Reply-To: <20260730-sm8250-xiaomi-enuma-v1-0-ed6d8fb99668@dawidwrobel.com>
To: Jianhua Lu <lujianhua000@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 =?utf-8?q?Dawid_Wr=C3=B3bel?= <me@dawidwrobel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=me@dawidwrobel.com;
 h=from:subject:message-id;
 bh=HLBHIFL7Bhy2H/xHi+CSj5nPkTSnPI1C32w3QZKtKr8=;
 b=owGbwMvMwCV2qrTGfeXVd28ZT6slMWRlH++XM91l8LFvVpKjuqHynx+HStJ/Lny+Z8+7fU6nC
 vL3X2ON6ChlYRDjYpAVU2TRSwvaYxX88vu7F7/DYeawMoEMYeDiFICJqGow/OGfLPUuN9Fijcmd
 b1fNm3xv3vi+2bn7YKj31/yLUf90S94z/NMu43G/+q5zqffCggP3zH+UO1zh+8ARZxR26Pz5fHH
 WgwwA
X-Developer-Key: i=me@dawidwrobel.com; a=openpgp;
 fpr=B64A778E0E64049A70C831C8B7B81FA12B282A92
X-Endpoint-Received: by B4 Relay for me@dawidwrobel.com/default with
 auth_id=901
X-Original-From: =?utf-8?q?Dawid_Wr=C3=B3bel?= <me@dawidwrobel.com>
Reply-To: me@dawidwrobel.com

From: Dawid Wróbel <me@dawidwrobel.com>

The Xiaomi Mi Pad 5 Pro 5G (enuma) ships the same CSOT panel as the Mi
Pad 5 Pro (elish), so it falls back to the elish compatible. Give it a
device-specific one in front, so a later difference does not need a
device tree change.

Signed-off-by: Dawid Wróbel <me@dawidwrobel.com>
---
 Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
index b9300a1f2646..2f3f34d08f29 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
@@ -22,6 +22,10 @@ properties:
               - xiaomi,elish-boe-nt36523
               - xiaomi,elish-csot-nt36523
           - const: novatek,nt36523
+      - items:
+          - const: xiaomi,enuma-csot-nt36523
+          - const: xiaomi,elish-csot-nt36523
+          - const: novatek,nt36523
       - items:
           - enum:
               - lenovo,j606f-boe-nt36523w

-- 
2.55.0


