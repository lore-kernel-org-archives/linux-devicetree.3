Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B47825BF13
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 02:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779158328; cv=none; b=Bl4GxiaFFNcNifv2XHFMNHgvuFWVlGwa6CDb/+qSvcoyITd70JmG4znnHGMNJcYSo3tFNUnKGte5hID9sjEolBFhUGSfCfZYgby9+eNiEr2XIILNqeLhXb48hYJRbmMo8iMRnTt/QUEKy+W4sNyFnkLKQcbHxq+UiAVd/xCzUSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779158328; c=relaxed/simple;
	bh=odhb/pL4+OEyptXdZCB0xOFlff++opOt4haF353oLTY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GU24hqzzGW5lvqBVkmJLdN8Bz8dhnJFBWh8VV6Fim0C2sgY8tirap6rb8qcameWFTpFe6ftk+tyPLhdwvLckjpqedGi9Oc+b+pck99fbnLfyw+3YI1BkdMPp21wOEQh3vEJ+xgwUPEu13BDalgpzhQ62N1mFlkWhrnb2PnnUJBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ny5VERZm; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ny5VERZm"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-366be8040a9so1155096a91.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 19:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779158326; x=1779763126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sk6tV1sPr/bj1s6vxEL5RD26ZR5/PjbXYD2u/WPihaU=;
        b=ny5VERZms5cF3+CaDOLr6xOuRpUcCcB9ek3zj3z4/rwVdO58gpMjOlhah0G7VubUyp
         vHzmz5qH5rHfeqltwh0E8kEpwRvQFVWFrjqy9W0WGWMlzSpQJ+42cxXtsGB7YPIk4Z8c
         txsU0u6tY1f4boSj7xyhDCRNRrSHoyC5uEJXalH190CEtU2bui/xAmNNbGkuKFPHERL1
         j1jepo6HXf/oSrCqDQeC6rYqi9yucVlO47g5wP2BIEuOnaAuSMUSP4uB5uXsvIJbBb1e
         yP0nKVQp3P7S6Ffj2YN8zpeeYGSr8g1sX11qRLQ8RJ+RPjCPTKgGMgdD0S55xAt2tAXN
         jksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779158326; x=1779763126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sk6tV1sPr/bj1s6vxEL5RD26ZR5/PjbXYD2u/WPihaU=;
        b=W97gmzrpydMt3Q6fq9LBJPuYBoTrYXP40NzJbDlth7JwjyIjrwlIwaYZ8IokncaA5U
         6T2tac/mQwtKP8uK/ohEhta0j2s67g/I447A0YIQ18FLv88uVVH6pDW0JULrV7YPNsTB
         UdH/CIteMttJdqqADtMmI9ISupmhYA9c7rzHUem1CjJHB4V1IfhMF6fHIJ1xrKdC6LcY
         OYOiAOnYfZkqI/Oj61cUEVb1pldUfZ421y7wkKb5ZFyLiFlkwVUqfs8V/7XYKamMlc3t
         9/VnCXZWvwBnBY8rjnarhh6iqLBaOzmTZsjN0TSAKNQEZlg7XExYS0pGc6HIDIRmenJ1
         w0bw==
X-Gm-Message-State: AOJu0Yw1N1DEJ7Fvv/yv5Jb8QWlonqlj/LwFue1qJBykCeZPbpK0rECg
	GjhEv/Hveh+JWGIH6pml2GEDqDvY3Ypw9jMl7+lp/otLxSCE6sB7kV3w
X-Gm-Gg: Acq92OGBatQohMXjeFxX+VUAPJGuM4YYaMHaSREM6aJuygELqVZH3NagGJpUU1mRAFH
	VgqsTPRbNnrG6+QanvEVhAkYbqfvbCitz77u4Ms4816fynMB/qegmvJKzm4/U0x/mSXuOXGo0PI
	OEbpYlWHZYsG4qVHj2fZYYTyeHXJqg4ftgh9C/0pHZbv+VsJfDy9/pJGzJXLxZH1ZMDbZTMfUPi
	XVSCDvAFmB04Lca1H+mXzwvdkkVkJfFuiIlnjinGLCrBiL8wBw0F7/GnehRe6UuqPn6Bh/gG4P7
	wVe+t1d5/aZxCcnAfL4aZjTK2siF+LMbqpac5rAvHPc29f/RsAU6ckxZbYUdqpfuQyu95GWkHc5
	8StP3K/lsIyagIK7kspJfJ94MnGH7IA/DhO3piPYcbeD5mogLF+GiZ+AfncEo4XHcVeEnvvcKqk
	abIoI74q9+XHjTiiWGITGuNUmYRP5cgVZ1O7X4MJ/3qafgqg6CoAmuFyDt7M5uv9uAjEj0C17Mz
	QflsKBthnabCA==
X-Received: by 2002:a17:90a:e710:b0:369:ee20:f5e5 with SMTP id 98e67ed59e1d1-369ee20fe62mr3060296a91.2.1779158326394;
        Mon, 18 May 2026 19:38:46 -0700 (PDT)
Received: from open.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695124601asm12407713a91.2.2026.05.18.19.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 19:38:45 -0700 (PDT)
From: Neil Cheng <neilcheng0417@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Neil Cheng <neilcheng0417@gmail.com>
Subject: [PATCH v2 0/2] Add Meta Rainiera6 BMC support
Date: Tue, 19 May 2026 10:38:36 +0800
Message-Id: <cover.1779157117.git.neilcheng0417@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1779088499.git.neilcheng0417@gmail.com>
References: <cover.1779088499.git.neilcheng0417@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial device tree support for the Meta Rainiera6 platform.

Changes in v2:

- reorder adc0/adc1 properties
- add Acked-by from Conor Dooley

This series adds:
- Meta Rainiera6 compatible entry
- Rainiera6 BMC DTS

The DTS has been validated with:
- make dtbs
- make dt_binding_check
- make CHECK_DTBS=y

Neil Cheng (2):
  dt-bindings: arm: aspeed: Add Meta Rainiera6 board
  ARM: dts: aspeed: rainiera6: Add Meta Rainiera6 BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-rainiera6.dts  | 1012 +++++++++++++++++
 3 files changed, 1014 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts

-- 
2.25.1

