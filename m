Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A983F075D;
	Mon, 18 May 2026 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112954; cv=none; b=oj6JWsbyR1YgB9ex50ytn31ukWinya3CzWjgjCL4U18Y51opbxoXlFiw3D8ci8ojMwwrC2CSXbHbTl8jxIsoY27Q2SZH7pOpLeh3MEeL1aw8ZJWPiaySk1eWptu+K9L16BMOebYZUptt4+hEduionZkvKfgfcFP02ZSQURQp4Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112954; c=relaxed/simple;
	bh=Euz4W2Winbl8UYReAtpi3+YUmBuLoDpv8m5d1tYIoBI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lffpCIkFjY/n9PjdQ/JeZeBISRlL6u6fxDAx3XJokCLa4Y0iWSO7IlhU+3I9k+/f9/9FsHj0743jorVAxkud+rH1eSiCWwvN1ZcKj79fAjl4hiQcuxrkqFFb3lMec1Nw/O0r8JpBhpJZBjO2mD9iCxw542Gtznzgvyfh3EDt714=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=ZWaKw0M8; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="ZWaKw0M8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779112950;
	bh=Nefc8G0NeaGyb3UUQULb64nwG2lmumgk5OzS0zMOeq0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZWaKw0M8IW1TXPTTsI7HUNxZSISrzmkTLNJukBj40iCHyHYVdd7+OD4OIFEAzJgQi
	 M4izzl9RdIWTpSNmXU2HIRyJZd9Tyu84ONGnmB2jZrtlDPM8X/qVWbG53+dI95fvli
	 F/wol8eBioyTpGdWye8EYvva64DQiZ8sDiPMJnJpYNjJjYoCJ5N6DGKvMk5pdqGFnX
	 NL5uUDbP5H5UsdOhO1/QcgQsV2Ew5gbqu+DwFmOmmHJHjVZTEWjwJbW+RgLsylZkhy
	 EIFOVJag9WLUG0gekQ1k0RySJRIiGSKsEWFmHatrcdej7DIKRUByRex+pZfSQV9b2i
	 M35kL3oTaPnlQ==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7BCC56025D;
	Mon, 18 May 2026 22:02:29 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Patrick Williams <patrick@stwcx.xyz>, Potin Lai <potin.lai.pt@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai@quantatw.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Andrew Lunn <andrew@lunn.ch>
In-Reply-To: <20260323-sanmiguel_init_dts-v4-0-caaa48a7f7be@gmail.com>
References: <20260323-sanmiguel_init_dts-v4-0-caaa48a7f7be@gmail.com>
Subject: Re: [PATCH v4 0/2] Add Meta (Facebook) SanMiguel BMC (AST2620)
Message-Id: <177911294941.2210651.9798336892963650465.b4-ty@b4>
Date: Mon, 18 May 2026 23:32:29 +0930
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 23 Mar 2026 20:41:04 +0800, Potin Lai wrote:
> Add Linux device tree entries for Meta (Facebook) SanMiguel specific
> devices connected to the AST2620 BMC SoC.

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

