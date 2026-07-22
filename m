Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B8D387371;
	Wed, 22 Jul 2026 07:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.201.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704740; cv=none; b=jRI83vI6ilDEBYyl8wHl6GsM3Sl4+N6gXIe2+wuOpmG3Zf67P5fDEaDGm5TNfa3lhP07qW4fe8jlgnb3X0cDRtBfgfb60iyE1h5G0L+GF0/W9RTGbRHjgnnZXweuZFXbixqwD0Amz54PZHFOhxRjGTtWg6HBG1apTndzHqjr+7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704740; c=relaxed/simple;
	bh=c67ixvgOobnsD9YZ1g1D2/zxbHV0RHVU8Y3paFRKUfE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=G1lAa+i2FCw+W0uElZONwKskbmhZyEFmRJIj9MQgd1I9cFFS/cA60aoQawUI5l5GrEIT2UFQMO80kfJrkpcJxHUChOYK/5eh3SRIjEU0lKNEDYDLTVq0vKhrxKcBt7tY8kEgfQP7g8FsIEInBsny/66HoLw7hxrMkIAG7hRcW08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=walle.cc; arc=none smtp.client-ip=159.69.201.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 60D3312F;
	Wed, 22 Jul 2026 09:18:49 +0200 (CEST)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Jul 2026 09:18:48 +0200
Message-Id: <DK4X0XV6ZM1E.2L9G007WXO2J6@kernel.org>
Subject: Re: [PATCH v4 phy-next 1/9] soc: fsl: guts: perform fsl_guts_init()
 error teardown in reverse order of setup
Cc: <devicetree@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-arm-kernel@lists.infradead.org>, "Ioana Ciornei"
 <ioana.ciornei@nxp.com>, "Vinod Koul" <vkoul@kernel.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Tanjeff Moos" <tanjeff.moos@westermo.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Shawn Guo"
 <shawnguo@kernel.org>, "Frank Li" <Frank.Li@nxp.com>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>,
 <linux-phy@lists.infradead.org>
X-Mailer: aerc 0.20.0
References: <20260721231603.67865-1-vladimir.oltean@nxp.com>
 <20260721231603.67865-2-vladimir.oltean@nxp.com>
In-Reply-To: <20260721231603.67865-2-vladimir.oltean@nxp.com>

Hi,

On Wed Jul 22, 2026 at 1:15 AM CEST, Vladimir Oltean wrote:
> Michael Walle has confirmed that ignoring the error was intentional,
> and we preserve that:
> https://lore.kernel.org/linux-phy/DK44809N7Y8I.J2Z3U4N32H0Q@kernel.org/

I thought you wanted to check if kasprintf() fails and return an
error? Just to be clear, I'm fine with either way.

-michael
