Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCB5149C7B;
	Wed, 27 May 2026 02:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779849541; cv=none; b=NEzT5VeBfN7pVY1utBlo44XFE/omSI5RTBScWlNWh5QnPTbUfX/GgI4eIW4loYUA49TYG23fyDDrL6FlT2sn066z9DcAFPCEG5yOnp2le/T2g/hwWrj0JCI4cznmhW2vMIPcCIEx/ufSi+LeUWB+GYRmKysPPgIw/CoHzY/0Vl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779849541; c=relaxed/simple;
	bh=uC/Tu/DOmoyi+U35rnO4ACVczfafAHcCsLueUvRPGDQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=j/+8lbTW6SXxY4ZEzLk3SbfQHsHWqI0Kmi2hYMfOOeGc/tvAjr55kdpx/iIMSOStBDc0zWYKOi+h4KKSOfb0ik1foU12C1qx1FQOCqgnWDcfJQZC20zTFaRQQTeGXLvMUdyUoOOD1w492QlM7eeYWkT/F2maT055+c5Q+Z/nLXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=DYB3eydz; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="DYB3eydz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779849538;
	bh=s6X96fCiiUtZy7vCtG5EjDCaHqggdWfq0rJbxB68zFQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DYB3eydzT8IPzY0KJPLgjOnUrH/Rci9Ku8LhD/2WsdQdlYwpjM5CHknmNv0R29sUg
	 o9evBWo298eQCyVVQVGPzQ8+FceW3/LBNvUkJbPuAU8DMpMEFHwsb++kos53dMWZMp
	 cR5UP2ClNYnNFx/irO41O8QmmkeLq733ef5gidPbfQxBR+X2R96WsYAwDt3bv3dDKK
	 erN9V3ueEEsxvQT7vDmiKR6fUzXgvP27RJi1wAGcn4JINXilLzILWtXjkwLu8tUSYz
	 JJD5Nmp/Dd4ZrUd5uKt7zpemnkZch9AFW2XouoOVPfpMEbx2ZR1J3vDybx2ItbQufk
	 NTEWXCoerO6UA==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BAB2C6001B;
	Wed, 27 May 2026 10:38:57 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Anirudh Srinivasan <anirudhsriniv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260331-asus-kommando-networking-v2-1-f7d72ae5d40d@gmail.com>
References: <20260331-asus-kommando-networking-v2-1-f7d72ae5d40d@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Enable networking for Asus
 Kommando IPMI Card
Message-Id: <177984953766.356210.4909123426054062345.b4-ty@b4>
Date: Wed, 27 May 2026 12:08:57 +0930
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 31 Mar 2026 09:18:00 -0500, Anirudh Srinivasan wrote:
> Adds the DT nodes needed for ethernet support for Asus Kommando, with
> phy mode set to rgmii-id.
> 
> When this DT was originally added, the phy mode was set to rgmii (which
> was incorrect). It was suggested to remove networking support from the
> DT till the Aspeed networking driver was patched so that the correct phy
> mode could be used.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

