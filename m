Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D5534BA5B;
	Tue,  5 May 2026 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777977617; cv=none; b=RvMWFy9tenqZ5FhrFtfYQo9hr5Ke+Ryp8t5qZ6NgX5wzIiVJ5JQQQN7oCIXcyTUC997I3seqP2Qlz0mbJXsEs2NMhXmniuMEPG2iW7wMinfXb1KNp+8Lp+a2h/AwFxQFK7TQ1hSo+soC7scjq89AUIFxxBcxMtjqh4k/jphTCes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777977617; c=relaxed/simple;
	bh=mNl9xK6Bk3ISCTbctcscXvb4dxmPHVw7qC8/sl6A1qg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T3lftuwn3IJbLD5GDRnJVY684UPg4QfG1DAww0nmXRzZwE34qRzcn7GQE2cNg/p4qJwV2YqQ4HQIlDd3vlFzYnKEJkCvYykvTca59pSFR0Ml7eY+wQAdlvqfRNwihV0oMy3I65znViR3UO20yyrh0/NBT77Jan0RgFH4oOTjKEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=XpBxw0RZ; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="XpBxw0RZ"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 645AdthiF1157147, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1777977595; bh=NIgVwvY6IewK6TNQqYKcV//Qio7X17sC+8U3nqOmNuc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=XpBxw0RZfi7E2dbNjI6FzZW7e9Dppg2iAMATHucJFAQAulNe7EmP0GsysbeV9PAi9
	 dCI01Y0x3fNl0XrweM3lo2NPK4x9NOQrxxBqz2l3hWEzj2l27HvfVA67OQlMP2D2Et
	 bgNIX6Qs7p0XizgXQtqYn/6SXG6wXNQ7akbgVdaEJNLQyNNrYYcWcLsNf/YRSYCc9M
	 5wj1Z8GeVnjVVIDsBADxOvc8nV9nxW9j5qchsrxIYu4UFrvzFpSK03AjIc+7MqQ9PE
	 9vWaUMNsoHc28lgbwyKYJotfMHJa06oKMySKePPQjcf8HSE39X0FmGNcw6WUt1UXrI
	 Nzl0iEFTyHNrg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 645AdthiF1157147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 May 2026 18:39:55 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 5 May 2026 18:39:55 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 5 May 2026 18:39:55 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <soc@kernel.org>
CC: <james.tai@realtek.com>, <eleanor.lin@realtek.com>, <afaerber@suse.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>
Subject: [PATCH 1/3] MAINTAINERS: Add maintainers for ARM/REALTEK ARCHITECTURE
Date: Tue, 5 May 2026 18:39:53 +0800
Message-ID: <20260505103955.1010130-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260505103955.1010130-1-eleanor.lin@realtek.com>
References: <20260505103955.1010130-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Add James Tai and Yu-Chun Lin as co-maintainers for the ARM/REALTEK
ARCHITECTURE to continue supporting Realtek SoCs.

Additionally, based on the discussion, move Andreas Färber to a
reviewer role and update his email address accordingly.

Link: https://lore.kernel.org/lkml/bbabf0f1-99fa-4822-85c8-df76ce89da01@suse.com/
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: James Tai <james.tai@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 71f6968fa695..b66b739ae2ca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3346,7 +3346,9 @@ F:	drivers/irqchip/irq-rda-intc.c
 F:	drivers/tty/serial/rda-uart.c
 
 ARM/REALTEK ARCHITECTURE
-M:	Andreas Färber <afaerber@suse.de>
+M:	James Tai <james.tai@realtek.com>
+M:	Yu-Chun Lin <eleanor.lin@realtek.com>
+R:	Andreas Färber <afaerber@suse.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-realtek-soc@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-- 
2.34.1

