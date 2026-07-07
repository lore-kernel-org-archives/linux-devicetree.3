Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE9441D4E0
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430925; cv=none; b=q26ePW2L4f91eRvMKNd05a4pq1ysZ3mA1fg5uNEqcxnBsCCsSCLoosr7qSBEUIyqg0hTdweEby3pGjrqPcWQRxPDk6nwOe4TE8D7hYdw+HfMBpN9UwpXrRKy2U7NtkFVkiT6q3Tk34DkHCEYHod5Yods0jgffSas8N5LSpOpJ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430925; c=relaxed/simple;
	bh=0FKoq7hLu09a+YTggc0+5XIYhkmzWH4CZtlIsc5csL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IVdyCJdIgWvw6x2Ojd+b5frAiE5pcaZlAOHMUvnjPuxjBXo6RBcDOTa6jGv9zEId5gtOtbQDZejQjiyJwGtWimsPN0b23uhi1/HG8EX5zEYeuAqa6bco3eMFO1KNB6hTyfhghpk3vf4Zc/f69gYEjCttzxCGAbwsyLaGqdVRbtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=iAw9uiXn; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="iAw9uiXn"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47640541585so2589645f8f.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783430921; x=1784035721; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OAsqyO6GgeZampdy6KW0w+EGUHWEd+iflFYg/ri9H9A=;
        b=iAw9uiXno3qjaauDbqNlDjnzNRoMoH6mRB7NT3VpwkhJjkh0oF2eAeF9WuyHtFa1On
         rjUtLyX2Jeo8zvST3eI1O3/m54SROlpsm+63pwId8qSlQilfgtdIrpx06b0QmOKGlyi3
         jR5Ybkyk1KAFRps7rqAzLpfYrx7kJlONBcEW/o9W2apYwj4UrgSsvev6z68Vwnagmd8N
         YeCzOMnugRax6f/ImtYkZ8JglKb9ZGawQnCfumPLZfzidm03WqJ7Jy4tkgqSyUtpCRvt
         nNowkc4UrL24dFohBjJUsygVpcZQIpS/X/x1WiNhY8hwhUz6tEJv9J93lBOOXt+wldTd
         Hgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783430921; x=1784035721;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAsqyO6GgeZampdy6KW0w+EGUHWEd+iflFYg/ri9H9A=;
        b=L3TEMmZTfjfnIO6p46bn9SmsGJzQLzzJ+8FgD7GRWWk+mgLDBdO1pttzUHsyKRauIX
         0So25/OrEU+pp45OK/Teo4QYlvt27aNPV3AxhoyG+DSx2x7NWEEPP5UedWIkdwRAsENj
         UdR5JKqjvLaYXt8a6T2oDNNDyfOAUyHC+CWb6Hrqsy+QzXvWhVH3zsCtoQrIXYiRJtEx
         uBDpLdaeJzKpnFjbkvFUQUpP0kco4LpRFYpgdN/axrGisJ8QKEJ1f7fYk28h9Lvt3mCT
         TCk9WUS9ePurMLd0/XjZlGOKKzHYR9fjj+rg0zpZHASz8cgXfw7LlKwd8Q5Bjc99MZST
         3OJw==
X-Forwarded-Encrypted: i=1; AHgh+RpwySC79YaoaiuhXre48t80XQHRhDYg2LTeHO1yyS/sZQkJh7C1a/5umzpamM2QzX8c2jG5JW7Yu3m2@vger.kernel.org
X-Gm-Message-State: AOJu0YwKfDNMZo6Ue5KFCyM1W2WAfs6hOoFMg/UHw4zvk5u4jtcMruIC
	sy58057iljA0wQgDC5sU84b5lApGoS7URbrJbNoew1upVYaLIDDjJaWywBFrR8cg1h/Q7KgcGtt
	YQzc/
X-Gm-Gg: AfdE7cmDAw6pZhJwIDaTQxaZlWH2+zNIo7uiEHmlhm8pKRua0296TItG9P/HJvUc8Ua
	qrzryxk+Ki3dJ+fzHOY1B1ZtmrN/Ka8xekUR35mBD8rVpEcoWgoKMutpTgMClNaNdF9elMus0hj
	/3Ya84kIWs9OON9+6kYW2XIHkJSwd/E9l98Bg3I8pk6a5Y/bODg8AOjN9li/wfmApxAdRUCibvm
	2Waaz9CckECZcK8R+KgQr/q+hvwXYcdXJXY3uqKT8RqyrmU+PBeU9BSIggRMWkrQmnPgl1FXXl3
	7vmiFtlz9suk173Q/f8TdfrJPP3A2OG1hUqa3CocT011Asa27cru+2QXA37Zw8slGCeUqe87Wz1
	pFDIvuVlDR5qutn0fmy2keh4Axfjb6sg5HtXtX5EZSQgVtot15E7YXKpQdKA3YeCiK19JH+K4AW
	YEobdk8F8jzk0=
X-Received: by 2002:adf:fd12:0:b0:465:81cb:bb20 with SMTP id ffacd0b85a97d-47de666b180mr4267840f8f.9.1783430920880;
        Tue, 07 Jul 2026 06:28:40 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:df5f:95d0:b28f:9180])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9de1d905sm34336003f8f.2.2026.07.07.06.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:28:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 07 Jul 2026 15:28:28 +0200
Subject: [PATCH] dt-bindings: i2c: mv64xxx: Add Allwinner A733 compatible
 string
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-allwinner-a733-i2c-compatible-v1-1-566340542bdd@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAPv+TGoC/yXMSw6CMBAA0KuQWTtJaQ1Fr2JcDOMAY2ohLX4Sw
 t2punybt0KWpJLhXK2Q5KVZp1hQHyrgkeIgqLdisMY2xhuPFMJbY5SE5J1DtYw8PWZatAuCzen
 I1NrWsKuhHHOSXj+//3L9Oz+7u/DyTWHbdr/7yUGBAAAA
X-Change-ID: 20260707-allwinner-a733-i2c-compatible-694ca8280c31
To: Chen-Yu Tsai <wens@kernel.org>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0FKoq7hLu09a+YTggc0+5XIYhkmzWH4CZtlIsc5csL8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqTP78ynmZm8LqBW8z2bfeTlGcrUz56U7zrD+ep
 NJhRorGfMKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakz+/AAKCRDm/A8cN/La
 hZb4D/0byM/y8b/cPdKD0MLfM2h6d8McFQ40cZbuxDxxX7lZ79txQQYqeUTgbgZJM5FHb2Sc50s
 h8jpKrr0V2CE8qJTxrNwfWRoM8w7MuYQ/POFb3KzQ9ZW0QJ29mo/5lrCBMlXUKNLA6KOsWfRyOa
 mNzW5obn21doyQOdtJfJSx5qOcYn788A4ylvIZ1jxIYYff1BGJiPqu0tYon+Sx7IlWRQmzeNypH
 FxP38sA3tZJIvpERBMY8Si6UtXwaYCgYMzTrihfGf6+fFMknmc5lFUHRHUi+CHIA1OiRS9do+tg
 x2xi18qO5N2Yx0bEpfOYXk+QAtyGtGaZ9RPGbslFjKw9vRifQ+DmgGsoLcfgdtOiLM6yTkDkNm/
 nvOrUn3vpL5iASh1F/QedxtiNKarjN3brs+bhN4J7wzdqOGppz9mv3pZFJRy/IJvmsuFpLxBCF+
 CdDi57OvoDigysxIim6zGLBgXqcO5Zs4R6I10WXkr5y4HXHt5c97BHAtSlQAt2zaTNhuZ4d887i
 QtiAm7/dspDY0zdd6rIUQs23Y582IPKJNjw9wiw/4hE45ujN0ASKq2oxMjUTwevoldtLkbHxfSy
 l/bBijigq4H0yPV8C8RraJYJlPmHWBjuDSar82C+6+MvrtCJrpm1U0NNupYelgwpGFd3W1+UPgz
 qQDw3R9B2zrBuRw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The I2C controller IP used in the Allwinner A733 SoC is
compatible with the ones used in the other recent Allwinner SoCs.

Add the A733 specific compatible string to the list of existing names
falling back to the allwinner,sun8i-v536-i2c string.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
This was tested on the Raxda A7A while enabling the AXP318 PMIC on S-TWI0
---
 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index c4efcef59133..2a9e723a724f 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -34,6 +34,7 @@ properties:
               - allwinner,sun50i-h616-i2c
               - allwinner,sun50i-r329-i2c
               - allwinner,sun55i-a523-i2c
+              - allwinner,sun60i-a733-i2c
           - const: allwinner,sun8i-v536-i2c
           - const: allwinner,sun6i-a31-i2c
       - const: marvell,mv64xxx-i2c

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260707-allwinner-a733-i2c-compatible-694ca8280c31

Best regards,
--  
Jerome

