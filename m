Received: from r3-212.sinamail.sina.com.cn (r3-212.sinamail.sina.com.cn [202.108.3.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0633F2BEC3F
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002777; cv=none; b=M0f4yfDFfpKRTPLFxS7iF9EChMe9QNffR+Xp6Xmztwp4VEgqzyuOpnmY6nrQLLSYgQ+B8MnbnzGMjl+YLR+uNZWYjbEUWFeTNVT6bzHgAeZP/HWSsgtH7vo5KICJE2onucbh9mNXaGgOlGRYw8KDM+99qUD+2Lm2e+zxwdfv7NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002777; c=relaxed/simple;
	bh=E7GuqGuPKSkJwz9PuOKlo4VEGBMMgMV/w5i/5hyfmV0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=LhsE1MSObJfzEHMbClP35YJd1hXgxhd4ePpgp6PQCHBkd/2rXsQLoxsKqWwR0ViAzERGMbAMBOXdOykkNc6QYvGvkt1BtHd07y7Vqr0tlUH5iD+rNGDAgj0gQwMe0mCE2X6UhYaoxqaQsCqqhdV+4oqJFzwjlsGuSjVH3FpmvN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A27F20700005C2E; Tue, 9 Jun 2026 18:59:20 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 3C0E9EDEB1C3474EBF0C36257744AC6B
X-SMAIL-UIID: 3C0E9EDEB1C3474EBF0C36257744AC6B-20260609-185920
From: Zhang Yi <zhangyi@everest-semi.com>
To: sashiko-bot@kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org
Subject: RE: [PATCH 5/7] ASoC: codecs: ES8389: Add private members related to HPF
Date: Tue,  9 Jun 2026 18:59:18 +0800
Message-Id: <20260609105918.21663-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260609073009.CFEB81F00893@smtp.kernel.org>
References: <20260609073009.CFEB81F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

> [Severity: Medium]
> Devicetree is typically reserved for describing hardware topology, while
> software-configurable tuning parameters like an ADC High Pass Filter are
> usually exposed as ALSA kcontrols. Should these HPF values be registered as
> mixer controls instead of devicetree properties so userspace can dynamically
> adjust them at runtime?

Due to the chip design,
I don't want users to adjust the HPF while the device is in use.
Therefore, I don¡¯t want to make the HPF a kcontrol setting.

> [Severity: Medium]
> Could using device_property_read_u8() here lead to a silent misconfiguration
> if standard 32-bit devicetree cells are used?

I don't think this is a good approach. 
If it's set to u32, I still won't be able to detect if a user has configured it incorrectly in the DTS.
I still believe it should be set to u8,
and that instructions on how to configure this parameter should be included in Documentation/devicetree/bindings.
