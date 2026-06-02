Received: from mail-m3283.qiye.163.com (mail-m3283.qiye.163.com [220.197.32.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBC530E0CC;
	Tue,  2 Jun 2026 08:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389801; cv=none; b=jMiLGzy6n/SklKvzvEX3mEfzS+Unm7lr0HV3/8uNIj0MXnENJpam1FrXyMesepm/3eHh7y7j6PBopDkq+YPWraxsUYPaPZasjTwC1O1oUcI1Wc1gF24456rTzFNKRPrrpI1+I15Y36FEjqhFA1nGQmD/szp08c4bPPJkCwqEnco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389801; c=relaxed/simple;
	bh=OJeQdj+r1ZFu2vWzwbCWQs5gW8jjy5Mm335Q34E1WTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jssTZSe11vTTAOt1qeg+0yNC/DFgn6KEPidkawfHywr6CEXMM53QuPJo87VbkTz1aTqzSZt38BbuXPD9ZEjE0mVp2RpGNUaduM3S5er95rlEkHt4VlpOoMY9apKyz1DZLtUYM4EwwNooWA3G+VR6pQDC8optMAZ2U7xVphmz/oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=AE6I+cDs; arc=none smtp.client-ip=220.197.32.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="AE6I+cDs"
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 40bcd4a9c;
	Tue, 2 Jun 2026 16:43:03 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: arnd@arndb.de
Cc: yangzh0906@thundersoft.com,
	bst-upstream@bstai.top,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gordon.ge@bst.ai,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	will@kernel.org
Subject: Re: [PATCH v8 0/2] arm64: dts/defconfig: enable BST C1200 eMMC
Date: Tue,  2 Jun 2026 16:43:01 +0800
Message-ID: <20260602084302.2101364-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427062329.3715925-1-yangzh0906@thundersoft.com>
References: <20260427062329.3715925-1-yangzh0906@thundersoft.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e8780271c09cdkunme64f759f430087
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGR0aVkIfGkJDQxpNS01MQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=AE6I+cDs3Te8sSPwLPNmXaZFtJPNpU0siz6kaUMLNLom0SAuoJD8g7D/+tG5bnhrcW3GjB3yfJ257soMoJbmvriokAH0MPQxNbSoHXj57R6Yrk2CeMXJu1G4JVCL+IMmhwSYSl0DdRbIotL5h59SjwLx4Tv6ebluQ/PSpanga7s=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=OJeQdj+r1ZFu2vWzwbCWQs5gW8jjy5Mm335Q34E1WTQ=;
	h=date:mime-version:subject:message-id:from;

Hi Arnd,

Gentle ping on this series. It has been about 5 weeks since v8 was posted.

The MMC driver patches from the original series were merged via mmc-next
in v7.1-rc1. These remaining 2 patches (DTS + defconfig) are still pending.

Both patches have Acked-by: Gordon Ge <gordon.ge@bst.ai>.

No code changes needed — still applies cleanly.

Would you be able to pick this up via soc tree?

Thanks,
Albert
