Received: from mail-m49240.qiye.163.com (mail-m49240.qiye.163.com [45.254.49.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F3F282F21;
	Tue, 14 Apr 2026 03:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776136236; cv=none; b=UhRqJX67HRbqLKqCo6HJD/LkXOF/q7PNlS2nfAgg5OAYYL9enM09HTpzKOkkFhFN4oCiIaGe1WI0ZHzHWg0GdvGmHhh/Ne+lYJiKe6z4QYWeCCJAMoFtpvprgYNkOpskBOKD2eWHM6My8WVcfcxDJZ9BwYL0R8qx80jTO/8BccA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776136236; c=relaxed/simple;
	bh=av25gekQIuBM/Y6KxSWV5Ks4E89VKaLrHKzcr8v2Occ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mzhmxFjtEaxvZTGbHflYC1Lrkva8waCqadh3tDHhQYsrFqciFrVeJSo4k0U1hO818+vAYsXnXSXnGt6VoxBHSk+Ug30REOlr7mcn2cKo2mTAD9cPJu5LhvWpgd7P0UOY+syQTMIxDc5cF0PRxIgy455mcvqoeFWehNXeh6yLCtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=PsIz2A61; arc=none smtp.client-ip=45.254.49.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="PsIz2A61"
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3a9d8126a;
	Tue, 14 Apr 2026 11:10:23 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Gordon Ge <gordon.ge@bst.ai>
Cc: Albert Yang <yangzh0906@thundersoft.com>,
	krzk@kernel.org,
	arnd@arndb.de,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	bst-upstream@bstai.top,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] arm64: dts/defconfig: enable BST C1200 eMMC
Date: Tue, 14 Apr 2026 11:10:13 +0800
Message-ID: <20260414031017.2834464-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310091211.4171307-1-yangzh0906@thundersoft.com>
References: <20260310091211.4171307-1-yangzh0906@thundersoft.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d89f7f94e09cckunm47224bfd8374c3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGhpDVh8eSkpOGUkaGENJGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=PsIz2A61jB8c0HmAWTe1NuuK92uODdQa1stUjfDOhqsgA26thYg4XKF/6uN1o6pziFlTD9EsXqfIXiSlLk/bR0z/4uElo7q/MnfFFSlsZGkgcJxZbjv+d/Yg3yn0bmyofbaAqBw8X7bDbaE+cTpcHBXKosX+k8eurypYjebM2z0=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=av25gekQIuBM/Y6KxSWV5Ks4E89VKaLrHKzcr8v2Occ=;
	h=date:mime-version:subject:message-id:from;

Hi Gordon,

Could you please help with:

1) Reviewing the remaining 2 patches in this series.

If acceptable, please reply with an Acked-by on each patch below:

- [PATCH v7 1/2] arm64: dts: bst: enable eMMC controller in C1200 CDCU1.0 board
- [PATCH v7 2/2] arm64: defconfig: enable BST SDHCI controller

I will carry your tags in the next revision.

Thanks,
Albert
