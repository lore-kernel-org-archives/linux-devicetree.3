Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A29C511197
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677729; cv=none; b=pAB8/aU+b7snSHFWRgY2c6YmI1wc7AhdvDIiqybMfQZZoxvnKd+souYcgMfUCL8IFqVDadaeN2PzvQyFcSIh4fY2kRS7U1GYFokd4YCldxV/9HZeqYOmxvkyqdfztOhWIgjCigBQfCYpnULJ8+2HOJV42qfDCo7V3M0coMj6kp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677729; c=relaxed/simple;
	bh=QQGLNQvdHfru03RYinWVR9vfNnySQYKGE1jNzOfXc3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bPluqX9Hj3NLcUt9m5sDH4Ot6f/TPBYJTA8k2f49eGsaEx+Cb56r0ZXkUPTHf9/wLL1LWk9FWLdLTuF0ompMw3fDvJrIQAOsZegErvl0CYzJ7y5x21QZ+0Jw5Acp+yqqjIhUqvT5FCr9c5AiX1I40oKsdIWxGcbhbPuqXaOpndY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=va54BRMl; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="va54BRMl"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so23505045e9.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790677719; x=1791282519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QZTRsHj0KfhwDqKEq7QsxYeKNtzFQI0k4FjiWBg73As=;
        b=va54BRMlUmstMfPhvAkc3qh7l4QbuX9cKewh7ip8Rgy95qOTBtz0mcZmHRfZlBvNLe
         hUd08XSXNhrZGYV1yHUHCeUKS6qO7wWKkmox6xi0bgXBSZtHCydwBxd8sAvX0P97Bg/P
         slwnNB/JiF9aWW1JH6WzrEQsjBHKJ64/ElsM7b8ZA+bTcS4j4H0HEcpm/oPZ+e758Em9
         FZYgN1dssqDeYwgGY83Z46L2e3BSoqiMh9ZqeAn+LlpS78PCQ0K3JuOt+l+M9yyHMUXX
         Q0oUjA+OS8BIHh1J3eydIK1g1viOZNWc2kOXqSzf/iz87WavPxQHW2kvE23bkgZecWzX
         FsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677719; x=1791282519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZTRsHj0KfhwDqKEq7QsxYeKNtzFQI0k4FjiWBg73As=;
        b=BFZyCEaKzSL/rc6eLRJCQShNwcd28N8HI03iR9dqVycqUhDfRdM2jBnOrW8KBSue/r
         /XXedCkxX8AKMC6eX61n/gzd1o7retoBoJ3NSTQHO2S9rMRUthGl2/7uzf8JgCasF3u7
         +rxrSXeHS6ZYsGAb3WL9aSFoqxxuaFy65K7j9PPNBA4Li6d+mGLUPUbYEWDmUUBuYgJ3
         VgGfbFF7q7ESoz+L7YOvXK79yHfjzm5w6ZW3nZ9R/sfq/TG6Lw7u89fmc9BJEBQU1Wy2
         Hiv5/pUYZhlw685eqRRNP+liBfHWl1GCF0T3yfPOj622PJNPryesa0UMdyhb2Y0OBKjy
         O8uw==
X-Forwarded-Encrypted: i=1; AKwUvBwiLOPvBIrO7QBlz0Ay4hFaSuUqmgxwmOfjrOx8y9rPBmjRQ/HQyoBTR2pZ7O5HHZDbVte9HB5NwfDH@vger.kernel.org
X-Gm-Message-State: AFuF++k8dGhPZl2qka8KdEXrohTGMd8h27b4Tsx/zMbOAe+qZi74Ym9R
	chtJ6WKjIePyAkpk9PJt7mClS6XUfUEw0xGK42mb6CwGOeh+Hi7wdsszk3bhgEoWLFM=
X-Gm-Gg: AYBFou19iugYXZIOs/3o1XvycAO6O8MhmMhSIzRy6nIRcGgjWMiqKQCHvHEV8uA6x3G
	Ri/afuzVyeuHVm1fzs3woZoqkTQ01aR55eg52jOQUSg5bl3m/rRVnmuee2NrokzsoiRZ45w1l8Z
	PzVwOmmXoW8LloS0wxBRZ8FyJuO/8y19CX7pLNoK0zM2njyrL14ioRv/ZRJF/2JNysuCLmK58nZ
	WCnQKq6djBROyk+q7HBK7pes1sZ94pvBFTm3inBtoeP0sOZGl9ivb30wSn7l8meLNisGKLVA04N
	6S7ii/xz6LWuseukOBbjAobzqhckFUgPnWB4OXsauhN42LFPXqG0K9aXM+rK/hU4SXY5fa/jztC
	w4BOCdGbIWC4PWGAZS0755fRvG/+kgAjfwGfdMTMLFzuV6TiTJtkGxkd4hi88ywmFSKpPkwOdK0
	BFGWtj/TYojeCn52i/gN6rBZoIyguFkqBKbNAT86T+xHwil4mOyYA+p7QbDYoj+3mfQWoYUB4M4
	kC2FjMn27+6bY9bow==
X-Received: by 2002:a05:600c:c16d:b0:49f:cac3:c68a with SMTP id 5b1f17b1804b1-49fe66f9ff1mr251267355e9.31.1790677719072;
        Tue, 29 Sep 2026 03:28:39 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfb479asm66579305e9.15.2026.09.29.03.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:28:38 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 29 Sep 2026 14:28:19 +0400
Subject: [PATCH v2 2/5] dt-bindings: power: reset: syscon-reboot-mode:
 allow supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rk3576-reboot-mode-v2-2-5a34ca72065a@flipper.net>
References: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
In-Reply-To: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Shawn Lin <shawn.lin@rock-chips.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1537; i=alchark@flipper.net;
 h=from:subject:message-id; bh=QQGLNQvdHfru03RYinWVR9vfNnySQYKGE1jNzOfXc3U=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtnnTx1Oz7jZ82Be+vas833B3yclvwKsWj6+zvTJzy7
 ezV75aMGzsmsjCIcTFYiimyzP22xHaqEd+sXR4eX2HmsDKBDJEWaWAAAhYGvtzEvFIjHSM9U21D
 PUMjHWMdIwYuTgGY6p/6DP+UGuJyZT8kqW4WFf796lPHnY0+KwQrdB5kcL7fxqwUEdDE8M/I7Np
 NSdvgt7NEXh1LbsxIXixqctRkZr9Q6hGeo19OCvEBAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Whatever program that acts on a reboot mode runs before a full OS, so it
may lack the capability to enable the regulators it depends on, and a
reset that preserves the mode register generally leaves the regulators as
the previously running system left them.

Allow a reboot mode node to name such supplies, so that they can be
turned on while the mode is being requested.

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../devicetree/bindings/power/reset/syscon-reboot-mode.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
index 79ffc78b23ea..5ed70c87269e 100644
--- a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
+++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
@@ -36,6 +36,14 @@ patternProperties:
   "^mode-.*$":
     maxItems: 1
 
+  "^[a-z0-9]+(-[a-z0-9]+)*-supply$":
+    description:
+      Supply that has to be powered for whatever program acts on the mode.
+      That could be a boot ROM with no access to regulators, and a warm reset
+      leaves them as the previously running system left them and not necessarily
+      what their expected out-of-reboot state is. Any supply described here is
+      enabled when a mode is requested, and stays enabled.
+
 unevaluatedProperties: false
 
 required:

-- 
2.55.0

