Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528168;
	b=1ry6SgJ2H+eOXcMt/nKDtis61T+8xGhPynFAt20Wk19dJOjCC2buh4rhPfFG76jKsTim
	 9mNWli0h0ljRqgMJk9bwF4VCxirxXDGn8dXubc2xdk6zMeV8WUuIPIvK+OMufDDc5LPyP
	 oGuYd8+l4ADLGF9a16VFaPFvHId1hzVMk8f4zn1RVvqmJtRDff2MSZwTPlaVaKb5mKkyA
	 0rF1gi9aCrg+vdZzDKexlWo8acJyq9pUlxtxGHMDTcCKHHj5mPfDtxlwl2rQ1iIFeUji9
	 27kYD4YMTCtU83Uwfey9hZwG+qj+zt8/sTURIS0Spg90vmAs6Tdp0TwR4wOj7IX/Y9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528168;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=8/5WpIiDIF7odXUhPjSua3qAHd65kH+m9W4WVcGF87U=;
	b=zvOdYWKdVy0JbZDEfkewt+10R70mHp6XVdzToYD5JaZQV9hiGUK5ixQ8ioWvf2HfDBYt
	 kcbvcmnPDRKZSO5vZqtdsKjTacGa9pzuOrMtF/BvCwdSjElfUyqY+ZkS+56/mLbvZ+jjL
	 E//Xz3pLHV3Dud1Wq0zcAhLsUmig3ZNDERswN56xu6AK48NVxufhQSM7OQiG1ILP5l67P
	 VY0tku/LHrxURJs/CjXtyVhB4lkUSHpqT7HYHAjIwS9/CIX7DbKHA/SNPiCYsV+LaRMJI
	 hyKDcmVQSJUcNpaW/uPiF0vaNVqV6BwqTQ2Z98xOmbaa3ZPzLElS+tYSAyjngaqi4mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Cmpnx7rl;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE141606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 13:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE141606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Cmpnx7rl
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 350524E4175C;
	Tue, 24 Nov 2026 13:49:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 00B34601E1;
	Tue, 24 Nov 2026 13:49:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D53D011E681A0;
	Tue, 24 Nov 2026 14:49:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795528164; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8/5WpIiDIF7odXUhPjSua3qAHd65kH+m9W4WVcGF87U=;
	b=Cmpnx7rl6uDbr2CDscqr0Mb4Z71jVOlQ75QBuG1uXf9D63wGOvy73tgSquUSbODOnV6RC9
	Deiog/0Y+Sc/4RFXRwPR8/LrN+YjwYtor2VR1394OWR1Glq4et7ZTfl9Pyk307B+6SB2LY
	GaolzwfcqG8kTOTlfXwvnoBy8P/oLDdrDWphFrxMEt5/GwIZYg0MbvUku1hWpg9YrVWRFs
	trQ7wyA7OSDEbIdeEdqu5YBgfS0RCwXSTu8oCdA2mvWQ3WAqYsciRE2USY0UyPa0FW9BEU
	e70MLq++LQIUvGgyIERSnT5++QHuTZidN6IjGm56hFZLHDBWchIntqj+YL8H4w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Takahiro
 Kuwano <takahiro.kuwano@infineon.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  praneeth@ti.com,  u-kumar1@ti.com,
  p-mantena@ti.com,  a-dutta@ti.com,  s-k6@ti.com,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH v4 00/11] mtd/spi-mem: Enable DQS control
In-Reply-To: <73680b0b-2c98-4ebc-bcb8-4ca144b469f7@sirena.org.uk> (Mark
	Brown's message of "Tue, 24 Nov 2026 13:45:22 +0000")
References: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
	<164905f5-2857-4b8e-8d99-26939b45cde4@sirena.org.uk>
	<875wxmttj7.fsf@bootlin.com>
	<73680b0b-2c98-4ebc-bcb8-4ca144b469f7@sirena.org.uk>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 24 Nov 2026 14:49:20 +0100
Message-ID: <87ld6is5jz.fsf@bootlin.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 24/11/2026 at 13:45:22 GMT, Mark Brown <broonie@kernel.org> wrote:

> On Tue, Nov 24, 2026 at 11:26:04AM +0100, Miquel Raynal wrote:
>
>> What is your plan with Santhosh's series? If his series will make it
>> this round I will respin once applied. Otherwise I can just respin the
>> independent spi-mem bits.
>
> I had review comments that he hasn't responded to.

Ah, ok, I must have missed them in the flow of e-mails. I will therefore
extract the spi-mem relevant section that is orthogonal to his series.

Thanks,
Miqu=C3=A8l
