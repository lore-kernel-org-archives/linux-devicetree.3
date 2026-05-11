Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C2833B97A;
	Mon, 11 May 2026 06:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778479590; cv=none; b=fXGDTobCKQC8KEQqqsUikIcwBee39AUnMX9s4u031nJ1vtdlcldhvdRuzKgeMC+IkOEjnkmBnGp44hYoUlX5oLeK6UTmisQ5AmebnlOIDD8aft1T5S8d9lEBYRMPEGiks2QvphZj1SJue0IoaQHKty3roqgq5yDjW3/h/TLDPzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778479590; c=relaxed/simple;
	bh=knZ0PTpHSWBjWc+hQe+qISMFrRRWZuwJUYm/ztoFBXk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J91zgS8BWJT3aIgtzobBn4Wy7X6fhGMNKEjtDXBo7WRcSoXtkIFfKKmOQ7+ciDsaM3iKaT5DGBnAmQGMgN5W7j3vfPDHK9dbNaldFaerpx20Kw3M35pVrDYSMakB0SwJRBCwVoVRgZ0XcTDgSTy0Fo0LbIrpGb/HFvbiog8dCPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [119.122.215.211])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3de3f72bb;
	Mon, 11 May 2026 14:01:06 +0800 (GMT+08:00)
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
Subject: Re: [PATCH v3 0/3] riscv: dts: spacemit: enable USB3 on OrangePi
Date: Mon, 11 May 2026 14:01:01 +0800
Message-Id: <20260511060101.3782514-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260410100010.1197804-1-amadeus@jmu.edu.cn>
References: <20260410100010.1197804-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e159ffada03a2kunmdbb494cd256d62
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTRhOVhoaSEtLGElJTxkdSlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJSkpZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0tVSktLVUtZBg++

Hi,

>   riscv: dts: spacemit: add fixed regulators for OrangePi R2S
>   riscv: dts: spacemit: enable USB3 on OrangePi R2S

Ping... This patch seems to have been forgotten.
