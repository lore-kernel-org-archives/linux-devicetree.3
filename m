Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F38033E345
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719128; cv=none; b=TOgJ2d88oIbT0znF7k9F6/8O78XpNwPZbimthybUysAhSKJJEg8M2Hf9BMLsxhAYUl4I13Q/X5Fv04enQPXdZ9KrlTdvM6SozLmVDS9BGGPK7sh0uqS/Oj05m6IJTrse847Ms60PIdWQ4BDKCcsuYKu9Qi3cFapNLrZOCPBKQpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719128; c=relaxed/simple;
	bh=m+5icXg44L8UoXTkQAQ0uexZtogw0DmmjbuxXLmq23w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUeNsvA6PFbeQ7sUzeazOUAJN5t3NbnNYivTnEPgxW1KDQsd+Yfa5ZAtEN8FaMCaR8RRE5TjP/yEPC/tS6jobpkpdLvSPa3VXZ4h6kxdgD243lmtkaGmfmpcBJ0ElJ4CsumrYRdzzrFzrgzDZpHpvafXLfOzzvJhOTC1kPZAk+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPTt2csa; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPTt2csa"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f7027ca11so2704255f8f.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 04:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784719125; x=1785323925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XEVQFga+mNJxLAziks0aejJBFPUIoIq1NAMdQ57DJTg=;
        b=UPTt2csaSRpsBlKy2R6g+q+JCQ/+HCqW+oesLqDSe0kZYEwhJNKompTYivZIp2yhwc
         7lwrtGSlvkitSWZhbYxMmt6NsDfl8h/Buoj34Z1+78//4bgd9jP9lN4ELVPpR9PdwRxy
         C7soif/4iqpx4HR2F1UAsJZVAVyVkYQHDF0tbLzBz6oGBUIa3w8Squu16/63flCYJJER
         jnl/DoWdd1OShd18oA1lkAUmhbPZQhCmt22ymq9moxQWPpVKEtgiVwpPkPbruf7HgaPO
         Xy6oPJOx5beuy18kftZ0DD54ebchIAQl6wavVl0GZT0heE3dyc7a9jhECvQuICB43Asi
         I1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784719125; x=1785323925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XEVQFga+mNJxLAziks0aejJBFPUIoIq1NAMdQ57DJTg=;
        b=MLZ5R0pbVabZZ4ZauB0voWt4Gr2BU6cegNvK2rV6fswCoXlviRLXnyY5x9/q/5BpQ/
         XHA4qVjyZ382QpC+PsSc70Zyyzx9cy3MThaZACieSMX/qvTGqbu6h0piVcAgzm1algC4
         FhHF5rT76VybfUO9gWOAhFnTnGo/CFR6s/QIaJ44pQX+TidqANCHvePD6i7AEUmn9wuD
         68ur37fsRDJmCXbPxRzFutkUE4PN7jFCYeLtoT5j2/RMxLzJrCI9GRvr5kmTTN+5pck4
         KbhhwNkrqy/lSC8UFAYU8RDDvJXAEU/pRy++dNUR/obF71pvfU8k3aYZqrclPI4+zLbs
         gJng==
X-Forwarded-Encrypted: i=1; AHgh+RpPFRzD5dk+08RsqMnEVehYi+dk6Sx0N6VN6qo4ypPanCjXesc0ciZMq3y8VClB71ccB6/YK9h3Ns/K@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj8LV3ce+PThuQup6HF1bzL9tJ2Xo5EpMOFpK42sG59D02V3K9
	MoEV/nx1HpC+TQRRnI5pbWMOLVZDMjPCVlFzpJcE/ttDZ9iZOIHHnK6B
X-Gm-Gg: AR+sD10FVFwOAGTO6STeIoAk0yh21bSSJVc9sTWG1mA5JymvvPYBzRyrIzC1TwRQkII
	TX4UBLQBSauxC1fkY8GLdPptjAFxn4WTDmcDgoPNjoBcaFVa7dDpecrCuUaDNzEKCsmwGJLtUt5
	rvrgGmuK0Yt8TKDcmYRORzfHuksXAN/yH+ZLWd0fkzX+YloQF3w6naMoDNWPYP8DJBOVdruy4Dz
	WEVwfO5wWDaFaOmK7gBaAnOAgopVdtV2vf54/P2vYNcEMOTqdgdjPD0d0L+pAerAJPbW+x/6KYH
	0Fr3Xf68EKgchhJEHvbFu6nCV5V4LAoGVsPQRnBWFzSrc45khhuJj+GH9qO6wyb2bxT9dhCHQv3
	Ti4XdcbWuczV7FzNwtJ+Jd/66cMyYoyROdnGptgdtnYLs5vsoDABCUXIvdccN+OlacMX72iN4AD
	02PmupkY8I7E2RKvdS/CZolfKN1eKCWJ0UW1E2+XMsmGCtFcYo488h7E9nfEjQTTMh4hsSIxSjh
	vpCLrzFQAytVSfslp6N4A==
X-Received: by 2002:a05:6000:400d:b0:47f:8148:3af8 with SMTP id ffacd0b85a97d-47f81483b6fmr8180062f8f.43.1784719124938;
        Wed, 22 Jul 2026 04:18:44 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c67339sm5345775f8f.31.2026.07.22.04.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:18:44 -0700 (PDT)
Date: Wed, 22 Jul 2026 13:18:41 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8qm-ss-dma: add LPUART4
Message-ID: <amCnETDWQuSLXcMx@Lord-Beerus.station>
References: <20260722104200.17729-1-stefano.r@variscite.com>
 <3426538.aeNJFYEL58@steina-w>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3426538.aeNJFYEL58@steina-w>

On Wed, Jul 22, 2026 at 01:11:10PM +0200, Alexander Stein wrote:
> Hi Stefano,
> 
> Am Mittwoch, 22. Juli 2026, 12:42:00 CEST schrieb Stefano Radaelli:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> > 
> > Add the missing LPUART4 node to the i.MX8QM DMA subsystem description.
> > 
> > The peripheral is present in the SoC and its LPCG clock controller is
> > already described, but the UART device node is currently missing.
> > Describe its registers, interrupt, clocks, power domain and eDMA
> > channels based on the NXP downstream device tree.
> > 
> > Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> 
> Commit d879cc948e6f7 ("arm64: dts: imx8qm-ss-dma: add lpuart4 node") landed
> in next-20260721, which is essentially the same patch.
> 
> Best regards,
> Alexander
> 

Thank you Alexander,

I missed this one :D

Best regards,
Stefano
