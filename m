Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9512E36492D;
	Mon, 30 Mar 2026 06:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774853437; cv=none; b=X9+SrcGGu7FuGQkDbXsMU/1Bwg9ZWdRBP+axFC44H0JGYI8K9n6oeUnQ4fDuEvn6Tfkf9A1rU2Wrhlotg5S1S49XJmbAByjHvbTYBwEiNgA0C6x3R/zmG7+gdEfwvigDhvVyADK6vukIa9KA8QMo0u31rJpeDtJkTpygpbYYCXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774853437; c=relaxed/simple;
	bh=SY8s8v7XyHMa6PDAQyM6cfvcfjnoiXrm7DXp2GBrtxU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ChprEHuAgzxoxN6gnbUQZzgLlfKcBa9coavrBNmh0eOsUY7GxomhjB9nDjcfn7SmLFkwkGFhp0g2RCkySUkCjREnolAk9/RetZZFLkFNioWFyZRW2pWLYeQ8JgfTP/JTvnJ647g1dDg4oFjHp/GE+TarKhHxPBtvtoXL1HVAWmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.94.183])
	by smtp.qiye.163.com (Hmail) with ESMTP id 38c8426bf;
	Mon, 30 Mar 2026 14:50:22 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: gaohan@iscas.ac.cn
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
	rabenda.cn@gmail.com,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v3 2/3] riscv: dts: spacemit: Define the P1 PMIC regulators for OrangePi RV2
Date: Mon, 30 Mar 2026 14:50:19 +0800
Message-Id: <20260330065019.1918917-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <492e0bea0fb84f49f4bead3dc3d563b13d98df11.1774803532.git.gaohan@iscas.ac.cn>
References: <492e0bea0fb84f49f4bead3dc3d563b13d98df11.1774803532.git.gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d3d81fe4403a2kunm8cfff3c446d9cc
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSk0aVh5OSkxPSEIaQkxMQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkNIWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++

Hi,

> The power management hardware design on the OrangePi RV2 is identical to
> the Banana Pi BPI-F3, so the DT Nodes were taken from k1-bananapi-f3.dts.

Why? If you've looked at the schematics, you'll find there are differences.
e.g. The regulator name and the PMIC have several pins left floating:
aldo2, aldo3, aldo4, dldo2, dldo3, dldo7.

> +	reg_dc_in: regulator-vcc-in-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dc_in_5v";

vcc_5v0

> +	reg_vcc_4v: regulator-vcc-4v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_4v";

vcc4v0

Thanks,
Chukun
