Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9412FB965;
	Thu, 18 Jun 2026 16:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781800635; cv=none; b=XSbrFDhkONrfkEROv10QNnrlPny0AL5ki2Y1HZQYw1coKuFA0xU/APe8QxOC6licV5g4TA29Wipe7uhC+NuzYC/B9LnU8/flkWGc6vcWtzCYUR3ArNOuhgXrqfc2ysIE5LSz6gDu135frwkFOif51mcCja2PYwtWxgEzoc0B3KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781800635; c=relaxed/simple;
	bh=oajZpRtz0vnN8OojIIQbyoFX95fGy1vCqCja4AlWHUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nH+khMCCAubsg2+ViKw8HlOhkssx+rvx33V+yWt9tqQN5BRHFsi6Zk7aqqO1ths9g4tCWsgqB5hAytL9hezyEOzN45ZetKd2WW2RAQ0da5Dcv5xWQAnD6xEPdKFt3TnLX481VEH+UF9sQ/jr+3tis2oAPhNIWkXhEfXiklH+UhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IAqjQOXj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IAqjQOXj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90271F000E9;
	Thu, 18 Jun 2026 16:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781800634;
	bh=oajZpRtz0vnN8OojIIQbyoFX95fGy1vCqCja4AlWHUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IAqjQOXjcwFJnK8pqaAAg/LX+UsndmvjZc7y9BbHoeGDX2eZslJoZYAfeDwHW+0Ia
	 UslfEKQGD6FTKk9bPUvQkpYaZozmVbpgDEoY8NYyFOyzcxzMhMdmrzSGDYJDUE3xsh
	 wnZ2bNA/ubucrG2G0kE9LNXKd1SlC/+X0woew/4/qm0hD90T+MAQQPZF4NjJiLSOND
	 RtYlzAj+Q0vwdzDK7IsqgoWIl4qEpBb/rSsriQEFBgEylCDSvbrCfOcveMk+wVw1wP
	 yErT6nBaP+Eulnfj2UpuAcK23f+Z0pGNP5eSx1Z2UYjRLXtumDBncYtX0EObsrx65o
	 PL0C/LzIyENIg==
Date: Thu, 18 Jun 2026 17:37:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, andrew+kernel@donnellan.id.au,
	aou@eecs.berkeley.edu, apatel@ventanamicro.com, apopple@nvidia.com,
	atishp@rivosinc.com, baolin.wang@linux.alibaba.com,
	cleger@rivosinc.com, conor+dt@kernel.org, debug@rivosinc.com,
	devicetree@vger.kernel.org, guodong@riscstar.com,
	hui.wang@canonical.com, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	liu.xuemei1@zte.com.cn, namcao@linutronix.de, nick.hu@sifive.com,
	palmer@dabbelt.com, pincheng.plct@isrc.iscas.ac.cn, pjw@kernel.org,
	qingwei.hu@bytedance.com, ritesh.list@gmail.com,
	rmclure@linux.ibm.com, robh@kernel.org, wangruikang@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn, zong.li@sifive.com
Subject: Re: [PATCH v4 1/3] dt-bindings: riscv: describe Svadu as disabled at
 boot
Message-ID: <20260618-speech-whacking-852cd7142f3d@spud>
References: <20260618064406.14508-1-cuiyunhui@bytedance.com>
 <20260618064406.14508-2-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QAAXcFZyWuXw/ru/"
Content-Disposition: inline
In-Reply-To: <20260618064406.14508-2-cuiyunhui@bytedance.com>


--QAAXcFZyWuXw/ru/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--QAAXcFZyWuXw/ru/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajQesgAKCRB4tDGHoIJi
0rMwAQDhYQHwC9LRxR8M1J79bOJrhiCLaKNDrpaYF5AlboExiAD9G3JaxJCxfcVJ
BwGh/jevK0xl5noJFNI4xGP2pUHdkA4=
=e/WI
-----END PGP SIGNATURE-----

--QAAXcFZyWuXw/ru/--
