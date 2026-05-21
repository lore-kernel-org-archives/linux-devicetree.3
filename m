Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B215367B88
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354234; cv=none; b=Jk2qGWwPCyXPwxvyKQOiUHO/cpC/NtTqsNlYtNSKYndiemCK1Jb2YmpEnsGBKK2v8kg0NMtxmrWBCOi0KaWGFLR9OOGh5B08bh00ZqcuE2tnIeIxcHtij3+toguWtqixVzP68hP75WiQ1EGb+YeRrevgDmM027KRvHeCUozuOjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354234; c=relaxed/simple;
	bh=utKvz2pSSj71JvdOn9TmwqnNZ0nsKBa0WY+09/l+KLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C7XbZAganZepwOeJmr7x0IH8NZObq1Wx8v/QD8Fc0rFSqA1KjCITHw3rV9NqQ8Ln3pUScZLyxzIIallMjlmDj8i/Rvk16i5VUzTpovBnCuS66uekV2zL1MquriFxKIxgJWyHOkG0j8z9nAIyUvlzPuZBhIxxJ+fww/cnYJQEw/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKe7xTj7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKe7xTj7"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso36004935e9.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 02:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779354230; x=1779959030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Pc5FY+vpBD78oI22TjAWL4xC2GsHLjSnp78r+My6kA=;
        b=mKe7xTj7GYo19CAR/E7h7MX5bqRbISwTver0HEFPvIMzygDcJ03/ymF4ghaZ4Lid6p
         6JtzmCaFVUP9Rq1GrfqWPjIh8n75UXvQbrmLBMF6QaUchNkdHMjJv5HSadE617TzZeSo
         ffebapmdhTgp31BseH2QyvHvXl1Qa+HECwtzGyytQZv4vsM57ueKOnmFKvajWYdXc+42
         1dweUfBXKPXheSnWnMQplwq+TeVLZ8KbRVIr8yiBddW1DOHsJGqJN3NPgdzVaZgbt/0R
         JJUzN9EdQnWIyRleBwBZNEDHd3WIOzaVOa/+dh0/q40QHNMT5MxACXxDp0WzoTH+n4Lx
         /GGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779354230; x=1779959030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Pc5FY+vpBD78oI22TjAWL4xC2GsHLjSnp78r+My6kA=;
        b=N39V72uRjjP+Mr/IVHln52VAAMDTvqniUAzuhH2h3b261VhwNc1tT8OBKIO58oGF1e
         KZOoS6dYulFxBYfOBb9VC8rcaavsZR187NkyN/jQCRdguKTYXEwuy9rxjlX3WJsKSFAA
         vzqEW9xr4BvMQnKTHop5GJaxdZ+yVEl12jq8gWohMiZHX7Tp7QXOhOtmgt/OlgxQnaB5
         diMPcDoK1X9d1zgzB5bwnpP/bJF7QxogcA2FlBtDdbW7gSWm6IZQF0CdFCVKeMOEXHKo
         Qy/T5BueQbFOYH1FYhaJyJs9ttxe0HfwF8LX6a0WN23YHV6TshfnUne9AEKKhDrsiQ6n
         lhVA==
X-Gm-Message-State: AOJu0YwShAReZPnnhTXvAonaTqg5r+8/zLJfQIDA81mspNisHOhB6Ge7
	8e+7leg/2zBdbvjuM6DDurWLxqekmuSj/rgXGrPWG9dWkC1WHnZ4HWUs
X-Gm-Gg: Acq92OHpQWjcb5/738wkc7dwEqUsEw4JuEa8hDviuNCDZFij7pw7VZu4beDdIi2X5FF
	TiOks2Hp2lJdoabCoSL8qAdHSnT7mzt6b+LeJKm7wd932wC2Wl4p+HygCyJvVXSmRQz3v/Kvp7r
	5YvQzsP8JYh6gTfy4T2STa8BWY05WZh49W9jOkwFMV9XhaqpsE2tEa1F9jIFAEPrYiwzeWvv59C
	zwc9sJzDOLkKgHgLzotYDgwtmWdlSJ73uVSmKuolvc/geVvPgSCDOH9ueGU3Tn2479aurraG2yM
	hw8Tbz5QNXAlL4RbVMF0f9QKIVd7Bq5fphg9IFUDvKpWIvvm1iskEiTlBBcgA7ZfLUTQjEFDDxx
	22InI5fDv5YOD3/n1+cmShAIi+10cp9rWk0wFrog728ZOX9JIFmLH7niWoRCjTlgiH0tCT6qzn4
	z4z5iTqbhqFqIq4PsUnDAuXOWzJpO1iy/Q1XaF7dX5fmi0yDlBX1d8938hL1nGih1UFwwFqk9uO
	61EVn9CzMhxl6ooKksVZEUOjuydkV16Fz4qPXwLB938pUGNAwNjBnsEG2LkHXLTiF3fnPQPOTrl
	eQ==
X-Received: by 2002:a05:600c:a108:b0:48f:d346:e646 with SMTP id 5b1f17b1804b1-49036039969mr21695725e9.10.1779354230309;
        Thu, 21 May 2026 02:03:50 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c72c78sm16151525e9.3.2026.05.21.02.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:03:49 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Thu, 21 May 2026 11:03:45 +0200
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add Aquila iMX95
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-add-aquila-imx95-v3-1-621843807def@toradex.com>
References: <20260521-add-aquila-imx95-v3-0-621843807def@toradex.com>
In-Reply-To: <20260521-add-aquila-imx95-v3-0-621843807def@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

From: Franz Schnyder <franz.schnyder@toradex.com>

Add DT compatible strings for the Aquila i.MX95 SoM and its supported
carrier boards: the Aquila Development Board and the Clover carrier
board.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
Link: https://www.toradex.com/products/carrier-board/clover
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v3: No changes
v2: Added Conor's acked-by
v1: https://lore.kernel.org/all/20260506-add-aquila-imx95-v1-1-69c8ee1c5413@toradex.com/
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 59f7f168bf7c4..ea4cc98dadebc 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1507,6 +1507,14 @@ properties:
           - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
           - const: fsl,imx95
 
+      - description: Toradex Boards with Aquila iMX95 Modules
+        items:
+          - enum:
+              - toradex,aquila-imx95-clover # Aquila iMX95 Module on Clover Board
+              - toradex,aquila-imx95-dev    # Aquila iMX95 Module on Aquila Development Board
+          - const: toradex,aquila-imx95     # Aquila iMX95 Module
+          - const: fsl,imx95
+
       - description: Toradex Boards with SMARC iMX95 Modules
         items:
           - const: toradex,smarc-imx95-dev # Toradex SMARC iMX95 on Toradex SMARC Development Board

-- 
2.43.0

