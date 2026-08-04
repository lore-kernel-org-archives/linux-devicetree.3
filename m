Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECE24503FA;
	Tue,  4 Aug 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833764; cv=none; b=Tuo+pAmAwfdNZ6Zq43PajG9KfEh0DIjWmbZnA2hd6THS+DyadjmZf+FbsN4cNnV5SWZLSAZ7B5F7mXba17crhYKC7HNAkQrkaVqBM1vFyONV2u1fR5XJkv6+SdUanjKm92WQ4KwwD4drWDlZycjgvSuVsF2f0kpLXSczWeaG+u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833764; c=relaxed/simple;
	bh=HXOiia6kvh0ZrH9ueHxWeVpGai2uVznQFbdZS265ors=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A4LgKPrvjWHYXdtCe3PmAsrm8/yTrUYhUHhWyZRwfpeqE0LPaZ17/GctJHc25X6YF6+envExu/Q5Hd7BBH1nUvP/6KRgcmx5NaTJmu/9NgRDAkgY0Y1XafBlrCxi5kp1XreWFsbpQ08U8AbqXE68u3tucpX5qdEXWZ30I8v3JfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWo0K3YC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWo0K3YC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D720C2BCF4;
	Tue,  4 Aug 2026 08:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785833764;
	bh=HXOiia6kvh0ZrH9ueHxWeVpGai2uVznQFbdZS265ors=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NWo0K3YC+ck9e5IWmXePCzGqIQWQmu2j8ikFVunva71OMYmBbJGWaN3w82CdY6ZTw
	 P63nJ8Nlu+SBydItk1GClakx4djzta8QcwVCzKYEHVTMxM4oYA7t16rKYdZzaCujNe
	 4sB8XIFP6/o2bFWpk5knvOGv1+zYCuBIUqA1ySsFLan5d4YQre8FstsGeLRHdAwp/r
	 D1/5df/yMDVUl+REcM9wKYfiRof+lFVwb91DA9SKcweIycDzWXYRhf84jgoF9jjlCQ
	 ZEnSwpRMabpjo4SOIRmz4tEpOick7BOIakkJHdeIr472PwU8A2covHhIquixJkHvcy
	 T+fiyiAAXc0vA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F176AC5518F;
	Tue,  4 Aug 2026 08:56:03 +0000 (UTC)
From: =?utf-8?q?Dawid_Wr=C3=B3bel_via_B4_Relay?= <devnull+me.dawidwrobel.com@kernel.org>
Date: Tue, 04 Aug 2026 10:55:55 +0200
Subject: [PATCH v2 1/3] dt-bindings: display: panel: novatek,nt36523: add
 the Mi Pad 5 Pro 5G panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260804-sm8250-xiaomi-enuma-v2-1-9dd0486f1155@dawidwrobel.com>
References: <20260804-sm8250-xiaomi-enuma-v2-0-9dd0486f1155@dawidwrobel.com>
In-Reply-To: <20260804-sm8250-xiaomi-enuma-v2-0-9dd0486f1155@dawidwrobel.com>
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
 =?utf-8?q?Dawid_Wr=C3=B3bel?= <me@dawidwrobel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225; i=me@dawidwrobel.com;
 h=from:subject:message-id;
 bh=K3PgfeiNwX67+Qu2eA93ZAIdcx9wFeJuCrMiBI+GtWU=;
 b=owGbwMvMwCV2qrTGfeXVd28ZT6slMWQVrlR6e6Ama9rh0Oe/0i/+nJP1sdXy5ap3gUo3knIcb
 SL6jtnJdJSyMIhxMciKKbLopQXtsQp++f3di9/hMHNYmUCGMHBxCsBEYjoYGZp6ZgR/Nn3f96mH
 nfvprfUvPK/xbqnIYw7RcOr0TrJO38/IMKOl+cHdWNUfH3/t2C635sKZ9TwLls+/KriiwGT50cr
 JbzgA
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


