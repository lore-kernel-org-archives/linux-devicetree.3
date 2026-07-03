Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E317338737E
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068389; cv=none; b=q40mupJUyWxnY3v6icBTN2CwiV0wikNPXZkXWla7tFlXkCj1wCU2/pddMqNW4NPAxHtufOGWOMX+GOrfYz31BJUuQmVOSuB0XERRbpXTOAYW4ZQq7EbKfpg10mTxKco8BSI/Sa/5jHRAYgQdfqGl9deFvW9eOiX8hF5XC9iurlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068389; c=relaxed/simple;
	bh=tJqUeWhpGTg0obPJtpEawVuUyUQuPSm5Xsr2+4uUENI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C1bycqvzHsma7TX2RVovb8D288Awv9a3dUvTXDrUB1aq5rbD+36TV0PsHeIJh1HGkXtFFdSBcDQU/dv4VaqW+9ow601CndhZJKD7w4KFpybjrUhbusqXEmcip6DK+ku5LHbZN2ZHHEy4dXrcU76EbYvZ9Y0hN60Iy0n6kCC0U/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iK+KEYx5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iK+KEYx5"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b68b4643so1661295e9.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068382; x=1783673182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+y5W164dlcrJTGRumnXkL5RSs7h3mqolWsnSZSGBcDE=;
        b=iK+KEYx5gpTCmuxLnXLVTJxdifNeY8bEgKwvcpAbt6j+kY7Rv1LBxNm7+x8QzF+FBH
         CXPdVKPakbYSovJDnDT/sGYV3kSD3EErUXhL5gQCd0n1g1LwAS8ubcx22nDTagmF8nzF
         S4QfNeVBeVg6/WDsPVKfZhTWmPjyH6qxFdtt7mflZ/b8T50cm3lMa7gEhG79/xF+SiAe
         oWSATu8VxctFm0L92tWai4S/y5reBvJUjsCy8W3tE9F45inQ74OhUKEYz3udnEWhKCjX
         pKR8/3g35wX+8nHMRV+JM6466jDFjtln5y4wJoQ3bau+1u6Ikw/Nx6qSEdGrxzKCX+8F
         M4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068382; x=1783673182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+y5W164dlcrJTGRumnXkL5RSs7h3mqolWsnSZSGBcDE=;
        b=F5g8JAa7ofcAWLKGYCgD5J2yuFBss0MynYaS9B2D3jxZWe0qIM9vMcm5EBJuqANSh1
         1Uwttbno82UHA/HuL8nEch4+sdbk/coqPwP4yPcdte3OWy4y7ZxhK8wBeEw4sU/0NZzC
         FF8J2mW0TTeLv/zRBZygCzleLoFoHS0167Gk011xteuucAEy8np2c1BjPCjVfPzkD5Qc
         JjbV8QCapDq5MTO2TUJ9dqsn5vRF5UfmAHCu1VicwItv3usk7uV4O2BWyaRNi7PlSsmE
         kRedT7PSIHtr4J2qGJa/VcGL6AiSso4TsD6M7LG582+ZGbywm5L3tzSspvuP4/xsEASd
         J+vA==
X-Forwarded-Encrypted: i=1; AFNElJ/lBvwlREmTVk79QjbywMeThcTl4H9ga8p7vysDYHdDvB3vMyhJsCpDA9F9U/qglwAvkUXz8qAODK/C@vger.kernel.org
X-Gm-Message-State: AOJu0YytWLNvsocTyFQH0Chmctuptq+sSO9wOkcu0tqruHaswUscgjyi
	9CGNwpKHBQlM7qKLr+49gcsNETZqo5RQ82dOW0M1zk0ki1NIDOUZbVY8
X-Gm-Gg: AfdE7cmLXO1Yzi4PmkWi+VTXU9JQaufPmbdSX6ZVf68usZpA5vKwb/buvBLciUYBCzM
	Vpz3mkLWXN+f+JPCJibgynaoWZs/YezmZeuCwtZsNy+Xwx4WNG+KrmDA52TbryacmiVI4rq/e+E
	iKWoGcuO5DMBwIVXx74EwH/BPh3ttZwl14s6mCGQrHM1vPDlgxgTm+uKO3ULFgPk5GNj3AqzBLz
	mWBYUdyPHqKq/V6WrT/t7l/HNVc/mHQcqR1M5io+gj7OFJh4isN/LVFdv4gv5ZV1X3kLjEJTmlV
	Tt/OCQgOji8gFimNE3U4xNRY8iZfVdpoE82kUedcvAjswuQpqaA7XHpmYYjDg/Ozk+cWw5L/na+
	14aGB4glkHHScQZZD2dAcf7YGoVQwKgRd3fyeLkNza/7DYaX0lzUnsnwr9FyJ01Tfolv6Fogyt0
	xg9BSB1Om+IVjBCrKeq/kGAOilH0dfuH4WBWMs3se0A+VmqNm4T5hq9woHCkVNqB9yz+ricVUL+
	p4YuTC8WjtmyLfFX/8z6F4vPA==
X-Received: by 2002:a05:600c:60a:b0:492:68bc:3237 with SMTP id 5b1f17b1804b1-493c3cf8cc5mr79033825e9.32.1783068382118;
        Fri, 03 Jul 2026 01:46:22 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:21 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 13/15] arm64: dts: imx8mn-var-som-symphony: keep RGB_SEL low
Date: Fri,  3 Jul 2026 10:46:00 +0200
Message-ID: <2599c90338d72b3062b36b8c261493fe4ce5e589.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index c98dca8e7889..ddd4651b35d7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -168,6 +168,14 @@ pca6408: gpio@21 {
 		reg = <0x21>;
 		gpio-controller;
 		#gpio-cells = <2>;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "rgb_sel";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3

