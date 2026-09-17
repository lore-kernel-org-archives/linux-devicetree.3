Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD46A345751
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657749; cv=none; b=NU+iZTYqUiEVeRfoGdvsTgf8yS0V0lUL7zjub2tVZTlalRk98dzggqkp/0IOts46ye71vobxL4+hBhcZ2az9D5UX6wWUXClRy9pliXK5Ri0KJUoMXhzSC4M1UIzbKrbHklJHJPZxTAYYHcCk0px/n9QYm0kGPMK/iKoY/LqWppQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657749; c=relaxed/simple;
	bh=MsImb+1536QAHQzSwaHjm6KM9sDbSoEHlPqn31ZATNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QZDtWKDllzrBzHFFLxLOuLmNNkhZRCiNwUcd1if2OHgQju9hKfo1Mg9Sq2bZQNcw0tqFF+JHY8RNaTSZbks2B/afjQA5u/j/mMihmyBZqmtG5wRjzvSOwQjkEIcXsHklwmUxGRbBdnHFlwGgx56qRX8xfhmO0Ohb6hzQk0d/78U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qyLflwAE; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qyLflwAE"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so5224385e9.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789657738; x=1790262538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mq40chmiQYOJ0gNp2bpIfeyZ0OR86JtTGyJZDUn+cjk=;
        b=qyLflwAE2B74jukdhVBBxeQs/UWgjtmcc9nF/TwWi4WU2qoe12WxTpEXb57aGJQt3D
         adYFW4g4vWB73DSJn3L3MQ5gP7CdjXjkcCr+g6b39mDeC5u87aQJ8sZQuIrOC7JJ0oZT
         YJUToVpBIgQVRc6WlQLhinjyz1xXbrfMmujR5UUtbGvz7AxO0w2jLcEcS1eD9yZdK4Pr
         WarcRBmPyXlVbN3nYarapYJrVk8ipK0FbEzj2stnz39eoj7oLWZkXDAqQZqpyKjkp3bV
         IX80HUS/afH5O/guh9X7TgWo9p6ComZEOruFGwfbBUMbmwIXek1Wp0CH2lTLwqwOuGul
         Di4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657738; x=1790262538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mq40chmiQYOJ0gNp2bpIfeyZ0OR86JtTGyJZDUn+cjk=;
        b=vDUoqaLqNvxEhYcCvR4Iyk4O2Q/ZD1Ro+daqBpSsxYeqQ5c/AAMGj5IP0PRGNIKzVP
         Ea+kYGNXWTNsuyWwr2z2pHykRgkQlrcM7bps7OhuXjLa8xiGSJt43CZtN6tDTVAV9fmc
         BbLc+OTfBdAzQalbeL/yDOyx1Fl2qhRzHfi9k1MwcQGJnZsUGJdr+d+3q1IVpYWAh5fo
         TwVwi197tERYJIxNiCytumi9dycUm1nOWo+6UQUYIo++Cbva1wCrut5LN9tOavUg5SZe
         9x91crJkzWRuLOEmaxYjHom9TmJTi2oxTc+RfoLPsDwEQ3BBoTOwbMvL1+em0hF24RtM
         f3SA==
X-Forwarded-Encrypted: i=1; AKwUvBzjsuatB9efjIK7Oi/nCp/MfqYk8cVg/+jg+F41RRecZjFEtqLee23e+62zMF1wfWFQOpuapS863KSr@vger.kernel.org
X-Gm-Message-State: AFuF++n9wQNhVQ77xLZ+T9vNK5TG63c5G7xJrIpIB9TZE8JYCLLHEeTw
	4MjPAfdRZnwOlgU8iCk6fJS5rmPbraVCf8Y389xp9YIYiIP1KrXJpFbO
X-Gm-Gg: AYBFou0KVpBfcfobF+7NknvrHtBIR7Jl5ZCmmYtNjNrS8BfEFPMpDXMlrRTScBOdol1
	m8/UrE/pXKi04tH6bYQkv/qXYJ0ofZkxOTGoqyEX9Y1uMRPtxQhDbSJQQOxhnK/slrSYsUjFhHL
	1QZ0SGJerKyutCK5PTvWSSYVqgIuf0+giUB60wq+k6Yeb1e1XK3jgNTjVoMo7rJpNR+oZHp2zVc
	iitIBnHuxg1e/Gw82xetXaMQG9cTSMn0DW1gWEn0eGpVF5tHsG0lOzz4u3SVU2M67je76F2qVJ0
	wlwwB+22nEOMenhQWn2Xt98/KursWjJFhhjtVh8Z5F3vi8jbhqY0MCXYwtHe43/5jklHjojmPMf
	rPtF/8+MODcKkRFa4JhUsDcstOAMxlOzAgGSKPqTEXxv/aLfM4W9NP03i4EZUtOTbWwaru53S44
	pKznmGvEkHZMcJXXOP25tMOM1GWxFQv8dUOcco3gra2gIRPwo3NWWN4oBETMFo7JpG3LffKq0AC
	DehUV6UbMaoVzl1NUosILLqcQg1WyIDBgQu1z5ROkDV8KNY9B8tzyyHZOwQ2AwADBBNhFLDj9ls
	upL0YFh8zUmfWQvTFM3FwA==
X-Received: by 2002:a05:600c:1992:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49fbd1af43dmr50366195e9.3.1789657738046;
        Thu, 17 Sep 2026 08:08:58 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd226ef3sm82531345e9.1.2026.09.17.08.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:08:57 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 0/3] arm64: dts: imx8mm-var-dart: update SoM support
Date: Thu, 17 Sep 2026 17:08:42 +0200
Message-ID: <cover.1789657399.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the Variscite DART-MX8M-MINI SoM device tree to
better reflect the currently supported hardware configuration.

The changes configure SAI3 in synchronous RX mode, add TPM support,
and increase the Ethernet PHY reset deassert delay to improve PHY
detection reliability.

Stefano Radaelli (3):
  arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
  arm64: dts: imx8mm-var-dart: add TPM support
  arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay

 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)


base-commit: 46d8fa682d263271f3ef7bf95166b124c19d6c62
-- 
2.47.3

