Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D634499B4
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 12:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338751; cv=none; b=DqOTXXo7jJiHSpzkNipQho4f77+ttxx889JckPPFYvLZUN+av0ZuDWJcup5thR/Y/A8uIqv5yJaom5BiwHpQmPkjqTYlJ3qNrfWxA+9qe2ZDgJDRLY2qeg2H/ehf9nyZI8X0HggMG7FyWiOdsyDSyAV7bCKj/FTNNRG6jrINuIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338751; c=relaxed/simple;
	bh=jjU815oQt0O3NpL/KvupGFQMW7lSCPPiN4K6PrptraA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YP+EQ1H73EDb360n5zTesX3KpHEx/XrcYXn4HKJHL4NfzzcSq5I64m0zYZLsp3FJVqRXTtgGiv533M8lkA8iYExggxj07LCSjeXtDV5EITFW/58xTBIrcOX9ntzuAsZi4Plko8pyg72YU1R9FC+uPFdrFr/JG/QKbmTLlMFYtec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HzuEJ+hF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HzuEJ+hF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ioiz
	H3mYlx5q1MZbfjP+R4RQDGFNB6UDcbjSFJBb8+k=; b=HzuEJ+hFt48GURbkUszL
	plksKCZlWAxLgIFAsw/2/hXWoTOWs5rov5FXDrPADdhp9DiUfe8ny01D6yuiOQwV
	8KKlY8OX88pJqLtBlhYRnXQrguPM/g4fgRQ4M13oRBXMkr38DEThz1ATqG1/zuMn
	3TUooTOi8PCFHdw7gJHrCKnBbgNQaBtNw5OgnEfMouggz+4NLMAtXuGueCGuSyZo
	f0WL+h37M3x7gNVmPWYfRk4Cy4QP4u49IKZc/sCKei77ThfMIp6lNIIf6PfHrW0F
	DSpb4drWaKkB7jSPrwikuVqL1Dm16/lbIW49Gbc1hK0puWlD44+IRrvYEByrC99/
	qw==
Received: (qmail 1554329 invoked from network); 25 Sep 2026 14:19:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2026 14:19:05 +0200
X-UD-Smtp-Session: l3s3148p1@9qr1uE1cYrcujnvn
Date: Fri, 25 Sep 2026 14:19:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
Message-ID: <arZmuSwTUFPXxMxp@shikoro>
References: <20260924-paul-v7-3-rc1-edac-v3-0-bd8054a5b180@bootlin.com>
 <20260924-paul-v7-3-rc1-edac-v3-3-bd8054a5b180@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-paul-v7-3-rc1-edac-v3-3-bd8054a5b180@bootlin.com>

On Thu, Sep 24, 2026 at 04:12:49PM +0200, Paul Louvel wrote:
> Add EDAC node to the SoC base device tree file.
> 
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

