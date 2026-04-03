Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AD126FDBF;
	Fri,  3 Apr 2026 08:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775204396; cv=none; b=siKyah7578nQwty5A044Fq7lgTnoF13np9MBlu9Tf2MT4YRVCt7itM9cKSBw5GKwxqc179EBO59LJuchcPDMqrcxuXKXzAI9JucyQ72deL2P9/af+cnAd7lWVLsWKaE52koaAdOm8NHbrhFK4QZ5HVDh6Nn2/zT59Sshw8oQnWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775204396; c=relaxed/simple;
	bh=XJ9LQ4s6TnrkKaXwodpZ5o36l4ySGjegAn5TmdzxXGk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NLUJ0qS2XHX/1C1KF1gFxj2VLiorLDbOcpRTgyFSHhmMk4QuZL0plYYY+crAc1NWe6rhBvej0HNzucYvjUjZiwjsEvmwAeFFb/F4FUnFQzZiWM5HVSs9BkUGQ5SyU+1jR69J5l02xsSPupro4os3yzyqX+YV8haDWJHPEljPWvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=F6hB5Jdr; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="F6hB5Jdr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B7CCE4E428CA;
	Fri,  3 Apr 2026 08:19:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 88482603C1;
	Fri,  3 Apr 2026 08:19:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44CED104502AB;
	Fri,  3 Apr 2026 10:19:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775204391; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Lxv/KM4QBdN+qoM0q8jf+z4WWd2AC3JR0U0nTb/A3eA=;
	b=F6hB5JdrwfXSjFksrqsxC11MQsaSmL6BKBsVvZH5aUela+3KlPzq839s8ek97RKs/WzVeI
	xxKyMBR0Xln+0TyX60Wuc7fmAa7MiL15fQhX/A8yHHk+vkUjCrVWLFUwMW9Y4rxxrZ167n
	ejqwX0AQN+QACuzHGEdisip9P2cGjtbE4ZG7OfxV1hAvdRVjB5aaJJhX6TxuoaSzzfvvNO
	L5Xckmw1pQNXNUtUI6nodJ01+GTXVefs/ldLo1ZXo4UssopIpv/r5ij7p1ozSxBc+ghQ3S
	/913bKKZ+QTRojt5olYEFRrEILngT65R2T15t48P+/B/wE812eFxDVE35Dukeg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Daniel
 Baluta <daniel.baluta@nxp.com>,  Shawn Guo <shawnguo@kernel.org>,
  devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS),  imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC
 ARM ARCHITECTURE),  linux-arm-kernel@lists.infradead.org (moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
  linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH 1/2] ARM: dts: imx35: remove empty clock-names for
 nand-controller@bb000000
In-Reply-To: <20260403074634.774234-1-Frank.Li@nxp.com> (Frank Li's message of
	"Fri, 3 Apr 2026 03:46:30 -0400")
References: <20260403074634.774234-1-Frank.Li@nxp.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 03 Apr 2026 10:19:47 +0200
Message-ID: <87o6k05ucc.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 03/04/2026 at 03:46:30 -04, Frank Li <Frank.Li@nxp.com> wrote:

> clock-names is empty in nand-controller@bb000000, which is wrong.
>
> Remove it to fix below CHECK_DTBS warings:
>   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: nand-controller@bb000000 (fsl,imx35-nand): Unevaluated properties are not allowed ('clock-names' was unexpected)
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
