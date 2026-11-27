Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792545;
	b=R3i0x2IUBxbLQX2h+3RzWa456ZX1kNRiCioz412VyvLroqjmjJWFXhA2SmxR4Wmce94F
	 kDJavOxXLcuNX0+ygDVKxGMW0woMdxl+pmAXsxNFQJHjtEfkki5VVU7cbW0MZQqf5oDn3
	 0W6M/z6ZQIkxzx71y+KHPwBU1Fpd7SlEjojR0bWUr5xHQ2bOrpiISdT9XSybdrxpccoya
	 RUczUtASbXI542Q/KCnahpydRuJqZCVUHGks2r347vV1baAOeRZpPXY5HTS8ItH4KPrYu
	 1Tj2QILxSiq5y6G7/P297+xu2q7bTnfHQv6+n3W86FHorhRoJ7EQI/XLUpDUou1xlAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792545;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=K/F58fTzeymXPtAhbnqmB/CVuNXYDU2P7HmmINGKBoo=;
	b=Ct5ndEtR8ONA7DFC0joknpsrVAUo21/piKerpLVAR5RVMMF0tIfCQc4vIV6IaCtptu0r
	 N7TDifMedMGYG74rznfVRrtK1riy3AEWZ+88FFQfNgec1xPO1TX1LOwWNXkIWVRwD5dsb
	 hH624ymvpj45C8bp54OvmdMjTbR26GYouvWr23wi+we7ufNAQoURvFvaZwDPneah0G94l
	 lkWzVxkYUryPTwV32DJQ7FMux7lZJd/ZzcqIbQ0lT8ZHDzVzOKOCQ0Xe16xhFlwekiKwa
	 At5VcF4pnYe3C1Tc/LsfJtlMDpDDTlEBDszKeEQ/WREVSF1XSRIDSCyHjlqsQ7z1KIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YITMaOzE;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F527606A335;
	Fri, 27 Nov 2026 15:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F527606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YITMaOzE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3183E4E417C5;
	Fri, 27 Nov 2026 15:15:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E81C86049C;
	Fri, 27 Nov 2026 15:15:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83EF011E90B55;
	Fri, 27 Nov 2026 16:15:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795792537; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K/F58fTzeymXPtAhbnqmB/CVuNXYDU2P7HmmINGKBoo=;
	b=YITMaOzEHoFT8Vw3PeTkE4bw3pS1fynbk/EHTRHYCmd2eGK6trTuao71I+BwgclPKtBf2o
	sXhYc+lTt7gkgm0WPbFiSBV3G0Yi0tjt3He5CnRIZzNZmZyaI81slENa8dMNr2AjL5nevD
	C8NRIjLqsiFuBtaDTZxyYTIIu9YQObpVyxiT3YZKPkrVOI5YZDW5mB9CjxsCTITBcTKuz9
	zj62EQanPs5MxrFTpq6InG1/a7X+xnrI936IdtvhfeYKAi6uyRM43waRUE/mI9BMw+KnMv
	j9epb+hFf8w3sljp/duVbQHoFU6i/rULR5AuoYFV6VTl55jUK/wRkxaJBsgJ7Q==
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 16:15:28 +0100
Message-Id: <DN63BMGBI07A.1IC73REGZ7NXZ@bootlin.com>
Subject: Re: [PATCH v13 0/5] Add support for i.MX94 DCIF
Cc: <linux-clk@vger.kernel.org>, <imx@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
To: "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>, "Abel Vesa"
 <abelvesa@kernel.org>, "Peng Fan" <peng.fan@nxp.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Brian Masney" <bmasney+clk@redhat.com>, "Jerome
 Brunet" <jbrunet+clk@baylibre.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261120-dcif-upstreaming-v13-0-966ac248773f@oss.nxp.com>
 <awmGCp4e2pgtxsqr@vm>
In-Reply-To: <awmGCp4e2pgtxsqr@vm>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Nov 27, 2026 at 2:41 PM CET, Laurentiu Palcu wrote:
> Hi Luca, Frank,
>
> All patches in v13 now have review tags. Since we are approaching -rc6,
> would it be possible to pick this up for 7.5?
>
> Luca: could you apply 1/5 and 2/5 to drm-misc-next?

I plan to apply these next week. I ususally leave at least 1w after a patch
is reviewed before applying it, in case someone has objections.

> Frank: could 3/5-5/5 go through i.MX tree?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
