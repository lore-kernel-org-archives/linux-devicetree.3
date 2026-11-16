Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802192;
	b=tk3othJZE+6eR3p4M72oPnn0G1G/lsTaajl7TzPjfFxS5niWHpLiwwwNploL/L8pQtS8
	 V3RJdekPv179jWY6mO+W0MQQ+25cJd9HIjr9LW+dQR7K4TFxfm+lCB79tay7IFR3/qNN2
	 tnZN+1ZY/upXlZWzUMy+1c/ZvfWqHijeiShfRYw4F56d8RsZU0VyK4d1/fE/hrPhHMMQt
	 nQX58jLSAaHBtKz6lBTCWCo9JAsSIVhdwy2o0UxIbL4r1vA+bR5t/qoI7QUNM5AF9Sipq
	 grZN5mO2Ylv9nuNg76UMr0gKGttgKsjp9uFtFYli6ydPlBERtVbwRdVDLvAc4b9qIcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802192;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=pZZX6BmLi6Dauf64Y3wJVPnB5bVdPUDvzyAyi7x0gjI=;
	b=juXstPl5iESpB7s6VzJNCNw17Nsrg0O5WydUr1C2ZOj0129pOIIv53OM0I4xIlgmJ8gr
	 UMt07+/SA9JrFbNRXU61rPJLVkzvGs2/EibCznAKbvKXVHKTHf9V7jZy0Pv/nP2QKUByv
	 ANDnjCzGISfbuwOhnpRw2EJmXxPWOA1p88dyZkEkcIYn2g1ajanSrpfTreg2O4UphGEXL
	 MSrULimMY660TbRhr9oJq4oC7ibj0nWfGijSHwJXt82nSO6oRzWIv+Wxz5pDsszzp8cOo
	 0HwqVv7QOqNygnwHQIQ6Ciyv8BmTxBX9CI4tggkgdhz37z9PJrGCpK9becuTafUv3rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679BF606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 04:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 679BF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs53.andestech.com [10.0.1.153])
	by Atcsqr.andestech.com with ESMTPS id 6AG49cbq084379
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 12:09:38 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs53.andestech.com
 (10.0.1.153) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 16 Nov
 2026 12:09:38 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Nov
 2026 12:09:38 +0800
From: CL Wang <cl634@andestech.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: CL Wang <cl634@andestech.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tim609@andestech.com>
Subject: [PATCH 3/3] MAINTAINERS: Add entry for Andes ATCGPIO100 GPIO
Date: Mon, 16 Nov 2026 12:09:14 +0800
Message-ID: <20261116040914.368298-4-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116040914.368298-1-cl634@andestech.com>
References: <20261116040914.368298-1-cl634@andestech.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs53.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AG49cbq084379

Add MAINTAINERS entry for the Andes ATCGPIO100 GPIO controller driver.

Signed-off-by: CL Wang <cl634@andestech.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..ba1930a37596 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2042,6 +2042,12 @@ S:	Supported
 F:	drivers/clk/analogbits/*
 F:	include/linux/clk/analogbits*
 
+ANDES ATCGPIO100 GPIO DRIVER
+M:	CL Wang <cl634@andestech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/gpio/andestech,ae350-gpio.yaml
+F:	drivers/gpio/gpio-atcgpio100.c
+
 ANDES ATCSPI200 SPI DRIVER
 M:	CL Wang <cl634@andestech.com>
 S:	Supported
-- 
2.34.1

