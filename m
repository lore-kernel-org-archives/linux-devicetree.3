Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0F330568B;
	Mon, 17 Aug 2026 06:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786949435; cv=none; b=SswV0jgweMuxqrido5Wxq8zGUYn8M6ncP6ZYUqTboTi6+uoRnbGYdsuXB7mXa+id+O44HzZAf04PTzhq4GpNmAH+3C7aJAEerGYdsi0Q8f6DNdJqUAiLQr8hAR+PJme85n+QylzopnfOHnN7nJY2yHLdCITbtBfAd9s36QTugmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786949435; c=relaxed/simple;
	bh=Z5Hd9s97wvmrvHXBMv0u/DeCJAlkAHgq7W5Ck7s/6cs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LFu+A7WOW8/LW3qv/zNQ1aiH3BKhYHqa9IS8gCOAd3qgLfjYPETaoNqvGua/DWGqHHkVDilzVAVVEXkMBW9ZIGK91K0Fg2Q01ed7T3e7pVNhJFiQj3UqyymuaBJexuxmueH8C3BxRABxk4SsRDrOrPs9P6Rs0ffWuVvSkQjC7Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.lan (unknown [IPV6:240e:3bc:2e87:7f70:16d5:d57:cd0e:58c1])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4a36f9033;
	Mon, 17 Aug 2026 14:50:18 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: andrew@lunn.ch
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	naoki@radxa.com,
	robh@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add Radxa E54C
Date: Mon, 17 Aug 2026 14:50:10 +0800
Message-Id: <20260817065010.4163977-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6248f137-ff98-4d3e-9ca6-f94741533686@lunn.ch>
References: <6248f137-ff98-4d3e-9ca6-f94741533686@lunn.ch>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa00e7c3e3503a2kunm8aa2e3fb2528f7
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTBgZVh5PHx5NHkxOGRhCT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJT0seQUgZGEFJHkNMQUwdTEtBSk0fTkEfTkxBGB9LHkFOQx
	hKWVdZFhoPEhUdFFlBWU9LSFVCQklOS1VKS0tVSkJLQlkG

Hi,

> Both the MAC and the switch are using rgmii-id? How does that work?

The switch driver uses phy_interface_mode_is_rgmii() to enter rgmii
mode. I will change the phy-mode on the switch to "rgmii".

Thanks,
Chukun
