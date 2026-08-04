Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423D13F1ABD;
	Tue,  4 Aug 2026 06:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785825625; cv=none; b=EvmuQB9sKuqr3vjzVaOWf9EU7qrYyrw5YVqH+uvmdT6BepaTY8zuCwSjQ/OZBi2q4b2bKnCj5BWmf/ZW3FJ7BV1I7jTylx2FXZ+kuXn40cUW58PACQLea0ofz913KZXRqZiDYjrO7CNOej004FxgGvbL56kUXq7FVDwgz+gHlzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785825625; c=relaxed/simple;
	bh=Zq19xXoHf5uNAdn0tYddA7oZEvLFG46WEj0MtIKrUp8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jZfh+fpSfWenHw3k3hu/Ez1NJ5FomimgTJKJoWsBfzzaVdtadDh+a/fBG0ohe7G/c5glAGiIo8vZe29iZ2ZilGKJsiSE7h8uC0yVG/RnhqknLfkW2qRy2Y1Kv4Uwj9lAzuP3Y17U8+D3eyF+/aYXVmxsLw47rQ51kAVFxVibssQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.116])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48af19290;
	Tue, 4 Aug 2026 14:40:07 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: krzk@kernel.org
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add MangoPi M28K
Date: Tue,  4 Aug 2026 14:40:00 +0800
Message-Id: <20260804064000.1047278-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803-fractal-sly-earthworm-2fe241@quoll>
References: <20260803-fractal-sly-earthworm-2fe241@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fcb803d4c03a2kunm5209684c2b0cfd
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSR9PVk1LSEgYSE8YTEMfHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpKTVlXWRYaDxIVHRRZQVlPS0hVQkJJTk
	tVSktLVUpCS0JZBg++

Hi,

> How did you resolve my comments from v1? You split patches instead of
> squashing and removed any explanation I asked for.

My idea is to add an official product link to differentiate them.
HINLINK H28K has this link, which I added to the commit message.
As for MangoPi, since it's discontinued, there's no product link
available. I will include a link to an image of the board in the
next patch to show that they are different boards.

Does this solve your problem?

Thanks,
Chukun
