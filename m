Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F62B3FC5B7;
	Wed, 10 Jun 2026 11:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781092325; cv=none; b=lyB3vuXZg4isaHKfl3KXEHteqmlyzQ2a9d/X8OCK6rv2NSk3sFPpKjWvARwBEtalIOf4xnwQaOxf6lQzZ3Qj1oGaH2ihrKMUFd+//rNKBo5VJe4t5qhyrXs7Hdfs4ddxesLl/2mPXD5yFVbX8iAk31lEy8wv57WmMWo3zpBLBw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781092325; c=relaxed/simple;
	bh=TABUlIRjYK9dilIv4p8mNqs8Ov2t8XLUCjkOv1XbLMg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=LutKeJj1XJ04v7hu+2CODzazP+AkoIoqpeXnfI+iGZ40YvSiVUySLVxOvfrU+rCL6U0fBF2T/3e0+AoCXAdiEzj69S9ASyYuXJdCEQXhpycfPZrX8HGrk3m+gZWtndkVQKslxzMnQImGbFuWG0sJ/zmNIJMMcgUJWUuDnHF4+LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=I60ba5Cj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IEV9VM43; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="I60ba5Cj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IEV9VM43"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 49E0D1D000B5;
	Wed, 10 Jun 2026 07:52:01 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 10 Jun 2026 07:52:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781092321;
	 x=1781178721; bh=Qbr4ROVH+jnt4tP/9mv5QAbtw8gA7hNTlWAUzPbg2+k=; b=
	I60ba5Cj6DsveHCsg/ZOr3eoF7690GZ07OPp5jm+Q0NqcKgTHSH4NIAUBk5mYG/T
	hYTZN1dheeg4nLnu1qtrJZXzvrQDHZh/Xz7DNU/pD9jgkoadydvbOfN5/6Y7fcPd
	vAsiMQexpiwUckMaLgY735DBTkWPYXCKyexJU3q8VdBQvBPwMFZ47SHCiKRY/4ih
	K/xNubhkbPntZw/l7XZ/LVrKWhRbpaM/Bn+iKYmbqu8SzPAwNv8oD8uTj/ru/pZI
	t+zMTvaN0RzkBvgDMQldXh3AkAJDsR0OuaWodENz3ZgOJy5nh17WMniM5HqxBsCI
	WZcxrxaKK8tFVIQmc3ZAkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781092321; x=
	1781178721; bh=Qbr4ROVH+jnt4tP/9mv5QAbtw8gA7hNTlWAUzPbg2+k=; b=I
	EV9VM43ZgrzUZCqQy6trvY2y8OoI7rzF8ItGKLO61WL/EiAJQsQolyNZHwBFfSld
	sCSDADJNgTHPO1997s42D9fWljm0Up5+kEwksei6hUyUGDnTP6C/rp1TaXC745C3
	HT4Caqh0F+yoBIECFBwbx0ToxZEdKQlCZKiam2lWZYa4CTtRog2f3Tur5l98IfLN
	n22JliFjGKL2rwx4dQAWpuWrOikmAnLfawV741HBBr5g6hakh7qQ2KtbN2FK1aoO
	bs+Gfjy2gsl6GagQvaXzWG2bp95itV1P8nJq/Xs24f64M5XKTceiganvgQiJ2PAB
	fP+m63VUruopen9qC1pjg==
X-ME-Sender: <xms:4E8pasbG_oJaJw5Y4HuM8Gp2euFrxLfd338BoFiIwooPOLG88fIg8A>
    <xme:4E8paiNaJ3uHurcYPSlQXLwJLipVgXeuJ2IfQOg0Fqx4zTkcaS7hzx-RnObGkhUI6
    HxAT7-4Ll_2QmiC6QDhYj_lR8JijsgBZjRkT2ELGYhP5NFqrVnQgO8>
X-ME-Proxy-Cause: dmFkZTGZIwo5KtSHdxfT+Ae64Z6rtdz5qTlNjl7FQnd+4W9H0YALvvQkZ+IixgJZNGBa7Y
    LYgKbfPl/W+rX4T4g5+CUd9983g0PTGHzmRYNdIffjWinfRKw+TFC+/fmnApz7o99xadEr
    olm9xmZCxrTzsWTgfRYgb/R85ICIg8/4BoCVDYEe+y45mqLDyip8pilF21897oM81wqBl8
    znBuzSMuTTauEqbGX6ZyCcZFnxdsHw//6xumk9LkhqjFnGtZWUlu5s4TnNziskFcCjR2Dw
    65hcN3f4aRMLnEBQQVlczGDJRhQYNLdCQ5y11+APEnGoNI9NVs3f4rJ4Wth3u7fQ2eBXhq
    8RwSu1fVarIVtvGfxpJFQvTRBi8FxNiH+DfTdFVJK2iw3ZVVbFAy2HwguRmjTgBwSK7IZP
    R8OoPv0mLf1+3s9zEy28uxB6CDDp9ongYg8ajQz7UTA/bGCgQ2bwrg9TxH8iGVcxwQhg33
    CzSPFt9U/KYMaQPuOLiQVGvVt+OeV2EYD38x2B0xRdl11uZJ2ucsgbP0Hk2z+VEvW+qWSO
    osKYbJHsCjFZaRR/f++UmrcLnDtAb8zhGSj46Vj1jLxjBjzQtQPMgoJes1F1ae47v+0l12
    c/kbDxeT1sHpapI8GHAc2PfQLvI5DqufxT2zH0zjwAZkyzwpHT0Ex8q2bYUg
X-ME-Proxy: <xmx:4E8parIa9ie_4XSYMC-TNZK2FYY7niU1j1VDSedgsD0sfS0g4Zj_9g>
    <xmx:4E8pahsqkUpjWaZ_zE3jeZa_mhPp9DAtdyZc4JB9naRX1t-Zfg_-eA>
    <xmx:4E8panUEpe1X_i6_itQoVeCAXtEW38--Sfl3kNrbbeoI-qbBL-Wbng>
    <xmx:4E8paki5rBB0Ev3HeAHDsiCiYZfMWqbeDgxb3BIJda7cFkC7r97OWQ>
    <xmx:4U8paqJp29TUkKDJo2AJn1sfrfLUU6CgT7eA5h7tlfM_d5gojBmxvM_v>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CFE54182007E; Wed, 10 Jun 2026 07:52:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AveuuW7LIw6B
Date: Wed, 10 Jun 2026 13:51:40 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Josua Mayer" <josua@solid-run.com>, "Frank Li" <Frank.Li@nxp.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <fc58ffaa-c910-4bf5-9a37-20e9aeab466b@app.fastmail.com>
In-Reply-To: 
 <20260610-lx2160-pcie-fix-ranges-32bit-v1-1-98086fc5fb6b@solid-run.com>
References: 
 <20260610-lx2160-pcie-fix-ranges-32bit-v1-1-98086fc5fb6b@solid-run.com>
Subject: Re: [PATCH] arm64: dts: lx2160a-rev2: avoid 32-bit pcie window system ram
 overlap
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Jun 10, 2026, at 13:45, Josua Mayer wrote:
> A 3GB non-prefetchable PCIe bus window can overlap with inbound DMA
> addresses for low system RAM, so DMA transactions may be routed to a BAR
> on the same host bridge instead of memory.
>
> Change the 32-bit non-prefetchable PCIe window back from 3GB to 1GB on all
> controllers, avoiding that overlap while keeping the added 64-bit
> prefetchable region.
>
> This partially reverts commit 9ed301397090 ("arm64: dts: lx2160a-rev2:
> extend 32-bit and add 64-bit pci regions").
>
> Fixes: 9ed301397090 ("arm64: dts: lx2160a-rev2: extend 32-bit and add 
> 64-bit pci regions")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Closes: 
> https://lore.kernel.org/r/9e6326f6-dad1-4169-a63c-e62ee5b341f2@app.fastmail.com
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Looks good to me, thanks for the fix!

Acked-by: Arnd Bergmann <arnd@arndb.de>
