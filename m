Received: from r3-71.sinamail.sina.com.cn (r3-71.sinamail.sina.com.cn [202.108.3.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860673E63A4
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177435; cv=none; b=sEi3/kY5W/lKy0d79j/Cg5DUvlWIZ6FEEtADgB8whgs7RMuXtUUKSwUQztm6BB3u8fMN4OXwbkIFRorjLsGOOhTRa1HCYwxV8Nd+/+fMtrc2LQxESQUGUuVN/Xd31FeN+mzlbygZ0fF5AA0TYmU67PrInl4NWTLaTsDAyntuBio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177435; c=relaxed/simple;
	bh=n3otl8cPAQpDds00mT2pqekhJ7HJJW10lPDqxW3XgTA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=F1dB2M4Lhc46lNuCBnx/imThMXvN0XroTgLMBWdJphYE1s/GZjOiye/ZF3xMR8hkxvbLkW5x4mF015jc7Sq3ReR9gTw+KSXAhk0GtELQd+j8x4m60PHPVuiChEj3Xm9ZELNJlq6RhxS6ulY+RHu61BFu9KHsWe4qjdeahJls7qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.39) with ESMTP
	id 6A2A9C4D000030FF; Thu, 11 Jun 2026 19:30:22 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 054A55A60D70428E8B9CEF385AC080E5
X-SMAIL-UIID: 054A55A60D70428E8B9CEF385AC080E5-20260611-193022
From: Zhang Yi <zhangyi@everest-semi.com>
To: krzk@kernel.org
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-sound@vger.kernel.org,
	robh@kernel.org,
	tiwai@suse.com,
	zhangyi@everest-semi.com
Subject: RE: [PATCH v1 1/7] ASoC: dt-bindings: ES8389: Add members about HPF and clock
Date: Thu, 11 Jun 2026 19:30:19 +0800
Message-Id: <20260611113019.5772-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260611-mamba-of-legendary-anger-af76a9@quoll>
References: <20260611-mamba-of-legendary-anger-af76a9@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

> So this is like third time you send the same.
> 
> You never responded to feedback, I don't see improvements and you keep
> sending the same v1.
> 
> Version your patches correctly - read help of git format-patch or just
> use b4.
> 
> NAK again because you just ignore us.

Sorry, I was wondering if you received the following two emails
https://lore.kernel.org/all/20260610100637.25568-1-zhangyi@everest-semi.com/
https://lore.kernel.org/all/20260610095820.25386-1-zhangyi@everest-semi.com/
