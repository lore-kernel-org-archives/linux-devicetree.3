Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802181;
	b=bXss31npZSGiet57k2Hx+zS65INyFr5nSvem7ZjlIKfJqXBZG0dR+H5zaMLkVv6e5p3K
	 JkAdRccycWjqro3JdEALat2N5nWC/5IGOY1Jv/GZxia6yS8jLMMD9HGfm23CCTAFvXcLx
	 WtiD7JhXjKdo2PXe4uIHi2xqj+9E6MWgHeytK7/1bGwXysvwhy10sMkkOSSncU3NxGK+r
	 EVbMZwqDOfbhkTcK/XInUIkNp1OYccxVSGKaCpYFAZ8DrYc6MncWGhKhB2mx5nT5dx1CX
	 NsVAX67QtpyEXEYXaRsrQeS8UCxraFNDVIjyuPcJ1sH9Ge0GDOoWhNN8TbjH8Fu7ZEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802181;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy:X-DKIM-Results:
	 X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=9qJRGK8FBzw3qsx6BCksBJ7d8jSqTZwCkoSlKjJtisA=;
	b=pLjrZRiPbTU4hOysXb6a5iP+nUJby76wLHQDcqD8bYInNcMl18yB/jegqdMbW9Af3UU7
	 uiUX+YFjdF/z10bRkEWWcRmCNsGehcj2WVxlsLnFk5CazOk+KFDTpPKkysZ7KdVn7nClP
	 fIW1WtisdyCamld/dUHb/sNq9CXNXz3eQBSzLcW8RPIcmoSMxAj1oaif53Io2X6HM7uH2
	 zbM1y8dLswqG1V06wHMRITQRpRBAZwOUbMBbqW4WfVUoMLoVp7Y0D6Kh7RqSxhoPkR2A5
	 1cXNOvsJnONY1G5/nMgMZvWruBnqgNZWvnFwHUSJ8j3Tu0jv+Ko8eXHqZP0QbIKTzBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38282606A88D
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 04:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38282606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs53.andestech.com [10.0.1.153])
	by Atcsqr.andestech.com with ESMTPS id 6AG49Tpo084334
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 12:09:29 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs53.andestech.com
 (10.0.1.153) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 16 Nov
 2026 12:09:29 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Nov
 2026 12:09:28 +0800
From: CL Wang <cl634@andestech.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: CL Wang <cl634@andestech.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tim609@andestech.com>
Subject: [PATCH 0/3] gpio: Add support for Andes ATCGPIO100 GPIO controller
Date: Mon, 16 Nov 2026 12:09:11 +0800
Message-ID: <20261116040914.368298-1-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
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
X-MAIL:Atcsqr.andestech.com 6AG49Tpo084334

This series adds support for the Andes ATCGPIO100 GPIO controller, an
IP integrated in the Andes AE350 platform and in SoCs such as Qilai.

The controller provides up to 32 lines with optional pull, interrupt
and debounce features, all reported by its configuration register.
The driver builds the data path on the generic MMIO GPIO library and
adds:
 - Pull-up and pull-down bias
 - Edge (rising, falling, both) and level (high, low) interrupts
 - Hardware input debounce, clocked from pclk or an optional extclk
 - Wakeup through the parent interrupt
 - System suspend and resume

CL Wang (3):
  dt-bindings: gpio: Add support for ATCGPIO100 GPIO controller
  gpio: atcgpio100: Add ATCGPIO100 GPIO driver
  MAINTAINERS: Add entry for Andes ATCGPIO100 GPIO

 .../bindings/gpio/andestech,ae350-gpio.yaml   |  92 +++
 MAINTAINERS                                   |   6 +
 drivers/gpio/Kconfig                          |  16 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-atcgpio100.c                | 641 ++++++++++++++++++
 5 files changed, 756 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/andestech,ae350-gpio.yaml
 create mode 100644 drivers/gpio/gpio-atcgpio100.c


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.34.1

