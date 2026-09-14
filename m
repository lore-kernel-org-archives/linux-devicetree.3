Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDF547668C
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393690; cv=none; b=YVQOM/Klt2vUvNLu2P0lgjYCu62JoehE493AnFEgI6p23xgax4EoG544Vr/KrErJ86tyw3Pf15EK48HZkXTxeeFYwtAQVTK3ivndDxeFSR/Wq0Rhkn7Btik3bn9IFYFbjlLUtBlRZbUveonHCN+Jz1FSpPQuZ9ntSScH/+kv5uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393690; c=relaxed/simple;
	bh=EG/ztHWKElovDpphTXoJLfpgeTlLLOAmLLnmFprYhHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DErW2EhgvQXl5vv3wzQMrCAj5dG21KKjTvUmnk2EghxoGEAiis0dwTlXrFbegurEF/nWxD0vaE/77VJjQZL3mWKl2/ScnxuQ/UtGfSxQbMKxn9TgEDdoQe9yd+52ZtlU1k+7RipniNPfCyi8FiYcKtflbJ3giscaSOxRhBvKW+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=yBdXAGRo; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="yBdXAGRo"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so10859745e9.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 06:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1789393687; x=1789998487; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l49MHyks2tmo+INGHY8t8az6CtTGwBm7JjOMFzvt9u0=;
        b=yBdXAGRoQ5guTMCuHVZfI7tuljr6Gj9b5Q57kbQzTJ+qIa1LddsQZccFZsT4DArC2l
         gi3dZbDdMUjU9c7YMU5/BMUPmAmLRxjzN7VhNgVwAbsrEpDFC3QDso5EzzXyRDKq0hMc
         ddZ1wBdbbC3mqSOfpUPtnB4qPehYOgvgFAIL7CvOqQF9aV27SOk5GFLTMsNnr4LslqkW
         8AE7PAzVZdyULCW9j3RD3dwqclOe//ylrmQjNJRDpdTNlg/Bdpj2ziVzT33Ee0XynU4s
         2RtkP5CKAjizV+8KfYO9FUDOs5rFBabuM94dNl8mhKx3kvLA3GLfWsVdV2A7F4m1gD7D
         RIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393687; x=1789998487;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l49MHyks2tmo+INGHY8t8az6CtTGwBm7JjOMFzvt9u0=;
        b=WiBfQW09X+/jsW2ueIt7Afdlp6b7AA6/dAapfgAZGXOPrmtGL6pV18npmKNKcy1j17
         YHRNYvzMwhrbX6Wtnw5xjsIDpeNm6gZK76MPqZVaaPrGnUke2iUVSEQKGg7nxIZRvUGQ
         2+JBQQxlgPKiWXfFIyOpcODJNoyTcyYL6/ij+xDmIGNfk67xXyEWo79JPlDN1ai/uTUq
         vB2oKShbyjl1fLkMh889cvaZrT9irNM2UD/OH3DK4w1FMSRHp+VM/5WnpdBj/xuVPkr1
         iSr4kn9gHmagIws0B+mw/YfyF8xEn5/CkxGDEDVHFXwsZdrfKYgMaLK/V+CqIWVyZ1/l
         oBnQ==
X-Forwarded-Encrypted: i=1; AKwUvByyEzJTDF+v96VG1J7JRz5N45JvA78K+uXej0gksdq/She+esX0u+ecLF7cUKW2fLWWopugDV675YIy@vger.kernel.org
X-Gm-Message-State: AFuF++nbeOaFJNFBVO7lSpOetcBxkAInJVwNrQsqGzloofEauvNWks3t
	s8Ifq0Kgq1rc0BGbGJsKXhv1gtyPFaecVHDoqmA3eD9hWCAXflYPW4tV3pR1DlNAKoM=
X-Gm-Gg: AYBFou1b+CEivcazn57YgfNI63Z80LJBmXD9vTadFy/22k/EXIBsUVWcV/nYQtWHZzz
	N9F/wVcDyuVKSyKxMzC8HKiyl8VnNAjWW6nMU9O68tuaFNBk6OEa/P8/1KKM0CXaU6sn9p4i0vg
	Cl5fIZrNWvKPjpDTQQsRMnusBYlHzQjiCNkWNB2TDtstqwiwl5535dOjVS8xQtyLZLp2bK2PiGQ
	m3TX+fXlsNNgoRVjLAxu1yNDx7jASzokQti+l5qD/OWmece/lDoMjC4GqOiMxtB6RbYRZmLStHq
	7/mGi/jZg8lDUkH4YLGPVSq5qa/VKwO47ayxHsJ28dbpAdy4YFD83shGtFGEeaNg6kHq1weVuIG
	wPFk785GIFedJVWERZNCWEracisST3iBQwij6VBgZ5jLDKWx65ajro6TaVqw0omSwoPFoI4esa5
	/4/q+nhhnx1WBoCzSwvQsoz17TY+BNM4HUcBGlf1FXRTkKZMpgRU+dcMhToB2oEovOOsJpLPgaa
	aXLlJq4rXCfz4OynR0=
X-Received: by 2002:a05:600c:860b:b0:49c:ee36:10fc with SMTP id 5b1f17b1804b1-49e7a648955mr28649655e9.8.1789393686773;
        Mon, 14 Sep 2026 06:48:06 -0700 (PDT)
Received: from alchark-surface.localdomain ([146.70.184.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm447432445e9.7.2026.09.14.06.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:48:06 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 14 Sep 2026 17:48:03 +0400
Subject: [PATCH] dt-bindings: mfd: ti,bq25703a: Expand to include BQ25798
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-bq25798-v1-1-dc5e2ec343c4@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0MT3aRCI1NzSwtdM3NzM4tEEwNTQ/NUJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tAB2KtM5rAAAA
X-Change-ID: 20260914-bq25798-67768a40517e
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1465; i=alchark@flipper.net;
 h=from:subject:message-id; bh=EG/ztHWKElovDpphTXoJLfpgeTlLLOAmLLnmFprYhHs=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQt/y1efX5jXeJ50af31mwO1F2wu3v395vXm3exXVytE
 VAUkdYW3jGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBU72VhZDjRca99d5eQbfHS6jhWth+vD+QWXP7CwFQi+1S5fB3fmwkM/4xa9zx
 i4H6+LnD/5jNCcgEp+yWqH8txaZ/umtv3/JuEBT8A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

TI has unpublished the BQ25792 charger variant and pulled its docs from
their website.

BQ25798 is a pin and register compatible replacement, which also adds MPPT
tracking support (reg 0x15, added in BQ25798 and reserved in BQ25792) and
backup mode (reg 0x0f[1], reg 0x10[7:6], reg 0x16[0] and reg 0x1c[7:5] on
BQ25798 - all of them reserved on BQ25792).

Expand the existing binding to include BQ25798 with a fallback compatible
to BQ25792.

Link: https://www.ti.com/product/BQ25798
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml b/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
index cdce83f05804..43afd232a614 100644
--- a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
@@ -11,9 +11,14 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - ti,bq25703a
-      - ti,bq25792
+    oneOf:
+      - enum:
+          - ti,bq25703a
+          - ti,bq25792
+      - items:
+          - enum:
+              - ti,bq25798
+          - const: ti,bq25792
 
   reg:
     const: 0x6b

---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260914-bq25798-67768a40517e

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

