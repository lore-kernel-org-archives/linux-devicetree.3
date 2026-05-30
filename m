Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3AB318ED6;
	Sat, 30 May 2026 02:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780107361; cv=none; b=pGhsZLEjLolDNLj2v723o+lZ+T1A1r5mxOrCL84wN1+FL3oX9ukM4Ti3XGEZdiQ5Y0+xstJ9Y47d50lxSFY8/6J7vvo7r5ipcZTr74QHQSOTS/99KFmCcFfkgDXO/CEpuxlnaXX8p0J03UzuTuCtn1wa+KABc2O4s09SF0NO+jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780107361; c=relaxed/simple;
	bh=4Drpa48EasU2oIGD6Uv2tzatMur7/jZDIFOEkc3wBDw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZlxC9/oU+amNyxVNVi/2mUYXVxh2LbOEySbEMG/BYtTOAL5kVs5wBioQGhZ9Cu6TEyVD0gFnuTWQyPV2hT6nZy/L5WnmPERFUvlosoVpaiGyWvFKYKo1ILscqi85d9mlufkyLD/vQfnUA3OBZz2nxWswlsnAW9FxPTii7FhrIH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [113.80.141.91])
	by smtp.qiye.163.com (Hmail) with ESMTP id 40645a59b;
	Sat, 30 May 2026 10:10:36 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: amadeus@jmu.edu.cn
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable PMIC on OrangePi R2S
Date: Sat, 30 May 2026 10:10:21 +0800
Message-Id: <20260530021021.1167953-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520100000.575719-1-amadeus@jmu.edu.cn>
References: <20260520100000.575719-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e76a5c82e03a2kunmcb4f5292e3422
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHRpDVh8aSkIeQhhLT0lJTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVQ0tVSk9KVUJKWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++

Hi,

> Enable the i2c8 interface and add the connected SpacemiT P1 PMIC and
> its associated regulators to support voltage regulation on the board.

friendly ping
