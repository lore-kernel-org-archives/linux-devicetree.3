Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD93503916
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739820; cv=none; b=W9ekxtk49FiWYUe5wWfYIoBGzGQ0qFMgJboTOGlHU4h0b9yCBwdkPCMpIcc22o5vfn3t4vhx7/F3CF7OTQEMU6AblWAc51lJyR7Ndl4JCOCwi7oKHqkWRg6YH8QlG4TPFJ9KEY1y0J+LyIBBtB0rmofaasjrDOm/9dbTWDQ9lyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739820; c=relaxed/simple;
	bh=cyFgC+qXLx7TbLlb087AjFkU/0sOlZUcyZhxSpOGPTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T6s5cpEzfLjqJP8jqP8fZXGX0FyG+pnsohK2kPdfzhIlZ++XdpUu+iXnUshNEl3Xy6NT2iIVkcAlezGG2b5KN8Z23/4WeVkxbTuyHbce96UjssVnTdpYcaq5r0gHCR7UycsT+z8CBtI733CRUPVOuGDbYEUY5cCoZ4BBjw77agg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TZlvai9l; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TZlvai9l"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1d00daaaso1243404a12.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789739813; x=1790344613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OrzoJsyfGQAwVoj4rnXSLGvbnlKoCkPzZFVe6L0WIsM=;
        b=TZlvai9l0KmM93xXYcdnSEXUh+7IdfHCLcvzVtSXzPTIM4MzZGIEOzHqRsDqbLBSGs
         lSEKnwjWLfhtfqezjv7OlfFfq/vUOQiYiQdPn20RQO/+Gww5MfUeNhD1BpSBTNHZagrE
         ExvubaOvZfPX2v0lpR9JKPCmQEjsmBmvZq0dqswmC7hNNybSs1R0pcmGwpKEnPqKO8qJ
         YqsMp0u+OeVJ3L5/boOY62m2XoMnYtjVQyr/2V0xtcgOJw+f8u05Nkofhtic92UZxDlD
         6viF9h8uKFqdGoy1hivJICwJ3EwVrIBHOl6EFgMl02hxA6G2R7XRwPZ/yC32jB8hniOL
         +u9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739813; x=1790344613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OrzoJsyfGQAwVoj4rnXSLGvbnlKoCkPzZFVe6L0WIsM=;
        b=XjDdqszhIqcw9ipSvyufmLl8/wPp8o63uLQCskDUXGE05efq6oghHXi+jqhR+l1LZl
         z2Pw2sdmvpPSpaoBPBDzCD0d2J57MG1fGvPy/Uooxn+n3EHWlJ7d0ncvzDu5MYcf2YnI
         lwxZgig9EHslqcrUMrvVEhzQYzrxisyrJCkaneCtywyB7IGWUWYUS5YWEe436n0nI61J
         usokoEODxEARA9zurqvujalvP+HQ/MQROMsHqwWm2G/OYpZTyx+ChNotYGP+QYs6ZM3M
         E5Vr6JO4vcO9Wg/U1XV2i7DPpVLci0HnCG7x6xFS9I0FKAEHhJOBAUotZBEJvTYRiXcd
         mFpQ==
X-Forwarded-Encrypted: i=1; AKwUvByMcpUtJ/EN0AXzfByABejf8AislMUoSSUFMplcN9mR1RvRqh73WzUIdOmVkfbL+kK5xJ1DC2SkriL3@vger.kernel.org
X-Gm-Message-State: AFuF++k6F8beiC/jxH2ecQ1EkcXLDnrK+3M8GNIsK31SMDfwjm7jPFTU
	K9mv0L+a41yn8ji/vZ3GJgIgPWLBMmaNo/YIKwlOAlouIGLC1IxV9u3bbCET8R5t1vi9ikOyl+F
	6VS2OSPQ=
X-Gm-Gg: AYBFou3I0u67Jvp7zl/rLgo+wuk81gDnksxaiG2tawDmqXf0L1nz5Oty+O58pKHxuxU
	BV4e8UqrtNp244v/fmKGeryCJksSTuQtmGVsQ6D8ns+SViLb8Mp7RpZm/otDMBstL8wCkJuLHy/
	ys31CWIO94w5avFDPKIczrNxUw3yo2bFfp80HBZSKHl7rnEd2u7YBNiBjfLdUnxpc127Hmq7NWY
	peOLKQb5eq+CbBWTZMTtuUZpdqwKsPuo0CoRja2zsb8scFlFz2sHEVhK89luI1Di+5zrpiRQimo
	8dXUZ0QLSAW/JxAA6HUGw9UM/E9KkzB12+WGDWWKnqtiQCcm28HkvUIeL335V+fkix3agk6KBsP
	hG1fkPCIAP1YT3sRb0K4syXoA4HOMQih4Hlyz++Yhk12Qfwuffkptd3tWL+xdWIBUJgYd1shzqv
	ZrXJngXSxoc64NNl0SuxDELzGlisIWp+9r7gaJ123PRamutqSrYCMUxzaLP+Gf0c3LGvSeg5jge
	GUsoUL2
X-Received: by 2002:a05:6402:4020:b0:6a9:f88d:b6e3 with SMTP id 4fb4d7f45d1cf-6aa52444ccdmr1676118a12.0.1789739813547;
        Fri, 18 Sep 2026 06:56:53 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.4.225])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59730866sm915455a12.18.2026.09.18.06.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:56:53 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 18 Sep 2026 14:56:39 +0100
Subject: [PATCH v20 4/6] phy: core: Add missing kerneldoc colon in two
 locations
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-4-dc244e124e71@linaro.org>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
In-Reply-To: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1863;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=cyFgC+qXLx7TbLlb087AjFkU/0sOlZUcyZhxSpOGPTs=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqrUMcInVhLdyaudbJKlI64/7xCw8tGs/f8+uvK
 Tr4ZbtYz7WJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaq1DHAAKCRAicTuzoY3I
 OujtEACYXwO198w8CrWRRdGcXNTIysDMDcAUvp1WCuv3mvY6fVpCxXIGF4CSCrfzLcFQr60bX2t
 //L21gFXW3rClTVpHxDa2/I7cBBZ9g1+k3k3lVMayQxOHFcOHCuFFlIrm9ZmaGln631MVSTJ0ws
 c9MrCNLCHA2sxIeBiTh/SaCsCDWRe6nAYIwCUSS7HZgKn+eqMhzh96iVZIlznfWdg8DPmoC+gD8
 lMQEaw+I8SAnAgVtSVER8Q/iyhdRjEgTGH++Iqpo0M8aQXkDewl9gaSAOQz/p1G4sPKUl+c3beu
 VRWWObQfVqlJKSdbAz8IDjKHbtkKiF61eQ2LE5DZiI2DUmXHrbQ8DgaGmFLKMct8E1/0wU6zjKW
 eS2TOdAdvifqQfbtrsNxiNrTYd+aVaUaAHFlsYBBwX+gfDaQnyUIFPlsaeW/ON2EyFu9xwT+3P/
 ltyfZ4TGmNVuhIKSBWMpabAjMkcpHbKtljsofWQsNJF5NJzwOxBYJ7rrrYQlbBwaixoUsZN0RPr
 pxsDiBOBPN5smxSysqmFNF+xPBA7GfEZr9SUAtdH13binQpUeNhdhHHKLZjKkUu2QQRwXpOXepT
 B8Qx7cu2Gy4pdLGzyQCLcWSLeA5Pi/mUNiliWh7A8mwInyO3VqPrbACzMIPZSNqT6W2ee8/8XUt
 Eoa+OjmpJX6fM+Q==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Correct missing colon after Return in kernel doc.

Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/phy-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index f0d2b50d1c76b..597e6b234f5ef 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -643,7 +643,7 @@ static struct phy *_of_phy_get_with_args(struct of_phandle_args *args)
  * @np: device_node for which to get the phy
  * @index: the index of the phy
  *
- * Returns the phy associated with the given phandle value,
+ * Returns: the phy associated with the given phandle value,
  * after getting a refcount to it or -ENODEV if there is no such phy or
  * -EPROBE_DEFER if there is a phandle to the phy, but the device is
  * not yet loaded. This function uses of_xlate call back function provided
@@ -681,7 +681,7 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
  * @np: device_node for which to get the phy
  * @con_id: name of the phy from device's point of view
  *
- * Returns the phy driver, after getting a refcount to it; or
+ * Returns: the phy driver, after getting a refcount to it; or
  * -ENODEV if there is no such phy. The caller is responsible for
  * calling of_phy_put() to release that count.
  */
@@ -797,7 +797,7 @@ EXPORT_SYMBOL_GPL(of_phy_simple_xlate);
  * @string: the phy name as given in the dt data or the name of the controller
  * port for non-dt case
  *
- * Returns the phy driver, after getting a refcount to it; or
+ * Returns: the phy driver, after getting a refcount to it; or
  * -ENODEV if there is no such phy.  The caller is responsible for
  * calling phy_put() to release that count.
  */

-- 
2.55.0

