Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABC241A508
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 02:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788230014; cv=none; b=rLWaoY9Cs/OZzA9mscmrYnu1/94MW53JgggppPSgdu/2VSchY2J+930JSXnFdyw1xxJxp5tYwi/lAifE97TKyRkjGrojZ35LfynRSLIWDubThxJ9NcRb7CPYtdyuu0xnNY4TTV47N/pOrN0WXA65mWNK2LYmuYEUj9R9G2rMUZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788230014; c=relaxed/simple;
	bh=7zvXv2dF/rt84/+WLBvB9wFqWDLTCFcd3fwCRPfFGGM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rEgXHEgulqWR61DQ/SbT47MbV5NYniRfPQvyDZhZBb53PeW4ZvIXyh8XL59AYcRYLXOFz1Bv6kWAtKSnd4NyILlEWNBt9UDMVtHY9ZtyQ4ev9YGFEnqgQmCcbRmPQFMjRan6ySAn5ROvZJ+JZFnoO+hwaPZtWGxt/Y9ocQLqdaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=zWKekOV9; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="zWKekOV9"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8534d507f59so4630262b3a.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 19:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1788230011; x=1788834811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXWMem3KWnB4LNCEveQl9AbeMx+XsbNgDR8AdypxgbU=;
        b=zWKekOV9Jtgx7b7UtWT/0vTeiciq41iIsNkEroAWKVNx+hetSfUfQa4gDZgcIineyH
         kPDRVJVvuAQbVMxWw1yKdtCFXymI117SBYak60hJalk5I2mJVT17+nF9mnNP45CalVz7
         Tk6bpZM0/woWqsDEBxoTm5YjGzagYAwWd4fK13M9UO1+REtt+f0ON+y9YjCwlL5oEtm+
         CgIbhkjJD06Os/VzDZYGdKhZWQKfF7Ek8SLVhe+TYDP9VnmW9beMKRNX30hLblbxXZx7
         Iv7uhc8Q3gGICjaecLp5TJSD0k59RLukvz6DLGYh+oOckSOVpw0MI2MhQfm4KsVcR3rZ
         j6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788230011; x=1788834811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sXWMem3KWnB4LNCEveQl9AbeMx+XsbNgDR8AdypxgbU=;
        b=qV86mfGm96mT4sS+n7Wpz/KH/Bs2FjrzeXEMEJMWuoZLl4FhDMTDqwRWb1NrgX3/EI
         5hQdUtl/DnvcuWRZYiIfI3PlnGwXS7XBKu5mLke4NZ5EhfxiahykPZNuxhaU0ID2+OO1
         VeFoERBhGdmSQDEcf91SJElTmn8cdJ9/iJJ1iFVV+U+Fkpq+5PUQNIkRmU2oSWRhgnAY
         o/R6uKxnOxgHFz3mfFJoUNncciHDAEabSFm9A9EQorZfjF7oxnFs3I7UYuHY1eWUUUKH
         dmm/8zhNv1ayV2lv/9Rz015arKkkSHaIdL2/oaLJTCD7QSKNhf3ehCXYO0MLYybrqqfD
         e+Kg==
X-Forwarded-Encrypted: i=1; AHgh+RoLLLjMydNjRzHn4V79d3mj4zyPp5oxQCj2xCrEyfFXEu6LEHq0yD9tq3J6nfVIGW4fBRf84UNfXjA/@vger.kernel.org
X-Gm-Message-State: AFuF++m9rdt9jNxLOI3yjKpGel/agdKIPjt5XhjhRq2ne+ByqufpAugC
	fbVsoUw6W6FFIjr6hO0R/JExJwC8IATiY0ow/61r8x1SzJWZMfV+L9USdvfkh/b1DuA=
X-Gm-Gg: AR+sD10ZodnP2twlUWFwSB25Je6oFduih+zOLJZkN7PZ2hthjFiUf8ejwCD6HOaPW4K
	l0ml3AbICMIjI0wuiua/IWEMhiVik0YM29xL/qrkEGLCyB6Hi3jiz40xQnBrw4emP75onCv971p
	2txNYXWmqN9HS3BYHNSfg22rVSDQ96i5vKsYr+z94mjX/N2FapDBKbfFleRXOGuA+TsVKIpR65p
	X5T3glHnUfyuCzweK4HxJYpA3DLwGJoUp1/91z+CA46LfpDHXNb6piTd34SJNSO2uihNO+17ss0
	/8+/2pdefdPbaalt2cbkUTzq7j4wtxpxveFacbcPpOPKi1uOpfERcmECCY7mRXdeDuKML5TnzEp
	0ByCA5jIYFBYQFwQOSRhlUggNQ7EkaQ1ACHsfvZ4wXe4p6P3MM6pEvnhT/e29afIMcmuTrXNke8
	B0pmHWRDfKHttQ8gA1EeT+Z3XUAWS/jvL2yfIr5OA7JZ8cvhX3nRqKozAfE/oLLObbKsHvP53J1
	tO9gdbJOUaBp3gpBwvd9a5pRSF9ZZSt7i8FJo/rt5YMzBsuy4hjYvqJd2RgZ+B+ZFMFny8l5fET
	CwQdeA==
X-Received: by 2002:a05:6a20:918c:b0:3d0:ba81:79b1 with SMTP id adf61e73a8af0-3d26277130fmr45092724637.0.1788230011288;
        Mon, 31 Aug 2026 19:33:31 -0700 (PDT)
Received: from bt-tpe-server.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm5005565a12.11.2026.08.31.19.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:33:29 -0700 (PDT)
From: Andy Chang <andy.chang@synaptics.corp-partner.google.com>
To: linux-bluetooth@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	Andy Chang <andy.chang@synaptics.corp-partner.google.com>
Subject: [PATCH v2 1/2] Bluetooth: dt-bindings: net: bluetooth: add BCM4384
Date: Tue,  1 Sep 2026 10:32:59 +0800
Message-Id: <20260901023300.1382808-2-andy.chang@synaptics.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260901023300.1382808-1-andy.chang@synaptics.corp-partner.google.com>
References: <20260827110242.1203546-2-andy.chang@synaptics.corp-partner.google.com>
 <20260901023300.1382808-1-andy.chang@synaptics.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the brcm,bcm4384-bt compatible string to support the
Synaptics BCM4384 Bluetooth controller.

A fallback compatible is not suitable here because the BCM4384
controller requires a dedicated firmware patch file (.hcd) matching
its specific hardware ID and revision.

Falling back to an existing compatible would cause the driver to
request the wrong firmware binary and fail the controller
initialization.

Signed-off-by: Andy Chang <andy.chang@synaptics.corp-partner.google.com>

---
Changes in v2:
 - Add an explaination for why a fallback compatible is not suitable.
 
 .../devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
index 95501e858e6f..612d21123aaa 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
@@ -31,6 +31,7 @@ properties:
           - brcm,bcm43540-bt
           - brcm,bcm4335a0
           - brcm,bcm4349-bt
+          - brcm,bcm4384-bt
           - cypress,cyw4373a0-bt
           - infineon,cyw55572-bt
 
-- 
2.25.1

