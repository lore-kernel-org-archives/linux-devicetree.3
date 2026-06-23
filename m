Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616912D7380
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 13:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782220140; cv=none; b=hD7lsJ3+DMRs09PVfNiyjYjBfL2PJxrvuV2TizfyJczMmbptuliWfPi7xoKa4Z2pUIuJwOiCnELrIK6T3FysT6JZsX7XfUHAgQXKFeSRDBEmpwliETFp9/Iz+HV69HuxeVdv0khQA3NxBzc5mm7UdW4WvDx2twaaTGPxjM+MlLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782220140; c=relaxed/simple;
	bh=bm87lO1WY51W1JQZ6AFcWt4PscTutQWjvvP0wDQnS1Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BOaID2F/kiaMlHjc12eZ9+Um/5Jv/LrhFos2Q0wGg58czh8B7eGp92XHi4d5jb1zkD2gGBaTRbXeX56w/FTaLRMYfr/MrGSNiMQivNN8Dq6HA66Ho+Jx7/13M9ho47Vu9Lwb4thD5yfo+v5M0qFbvXYCCq6dIqmZAiXiAleXXRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=Jfhz3xEZ; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="Jfhz3xEZ"
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1782220126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bm87lO1WY51W1JQZ6AFcWt4PscTutQWjvvP0wDQnS1Q=;
	b=Jfhz3xEZlv0Q/ZeopIdCK4IgxmFSrBVcWyz29qGDLMc8XkPXOHioHSga9BlFaVxY9HuI9a
	aqAMSygPKToaLFrwHsPS/k7X6p7vGrWrslP4snAR90xFkskfU+g9BWurucH1/2VEyc+OkJ
	ZnvbLs1IDCpcOPj9pnMCkJCOEaBKhm5g9q1bXncD6Jk7aRotmJqW9+fmunVLMtr1ZnUpr3
	lomYuMOsjFeeIae+QHegz/esBPyhuYs41Sfx86eHE2nimZXQ0g/LqlNhBKZ4YsM2+IkI+W
	+5E/KpafopJ63ZXZAdaA93513l1NksHGgrDh9kORk5tTqmrOjDJhiZz1GAFevA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 15:08:36 +0200
Message-Id: <DJGGAYJ6I48X.1EWZ2H4TB116A@cknow-tech.com>
Cc: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Ricardo Pardini" <ricardo@pardini.net>
Subject: Re: [PATCH v4 5/5] clk: rockchip: rk3588: add GATE_GRF clocks for
 I2S MCLK output to IO
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Diederik de Haas" <diederik@cknow-tech.com>, "Daniele Briguglio"
 <hello@superkali.me>, "Heiko Stuebner" <heiko@sntech.de>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
References: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me>
 <20260419-rk3588-mclk-gate-grf-v4-5-513a42dd1dcc@superkali.me>
 <DJGDSS875DDO.22TYPVYK5X8KZ@cknow-tech.com> <2100447.PIDvDuAF1L@diego>
 <20260623123316.4111002-1-hello@superkali.me>
 <DJGG8DEAKSPK.1GJ8FARAHXPXM@cknow-tech.com>
In-Reply-To: <DJGG8DEAKSPK.1GJ8FARAHXPXM@cknow-tech.com>
X-Migadu-Flow: FLOW_OUT

On Tue Jun 23, 2026 at 3:05 PM CEST, Diederik de Haas wrote:
> On Tue Jun 23, 2026 at 2:33 PM CEST, Daniele Briguglio wrote:
>> If that turns out to be the case, CLK_IGNORE_UNUSED on the gates is a
>> reasonable way to stop the kernel from closing a gate the firmware alrea=
dy
>> left open, for boards that would rather not switch their DTS to _TO_IO.
>
> I'm not so sure I agree that CLK_IGNORE_UNUSED is reasonable, but I'll le=
ave
> judgement up to others. I'll do the test regardless, though.

Ah, just learned those should be added to your patch, in which case my
objection goes away.
