Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7370118C2C;
	Wed,  8 Apr 2026 00:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775607589; cv=none; b=fmdkHw9cYSn0Kq9jbno0KhlFqV4Q5J3GNFIT51qsIElbxhUFuUWl9+7dIteO1o15ttDPFbE2SOmDXrqX1qMP6ywtME5D5vDxWSKF3tRR+HoAxlwcirVzSrI/dwZAgpHCRRb1HoGEMPx7gyy/vwrKrC+K+AnIdFraUnoURHltFFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775607589; c=relaxed/simple;
	bh=OXs0Y2Jl9HdzHS2ird2lMW+ChAu5fLrUXDPFb8yIrDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovxWmxNGFGAy1jMF/MDlkMNMuF78z32AJ7XaA1PHJDqNHaGYsBMX0/c3kKmlwdVHNZ660EkpqdMU0Oj9dthLsjqUr4d0Qg37mxuLa/JOALTwAN0JRiy6SzoS5WEzYI9PUb1/RU/1zAvvcLx/WuWWUGHN+OApOkObcLjZUjXG8T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Znvicg7H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Znvicg7H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D173CC116C6;
	Wed,  8 Apr 2026 00:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775607589;
	bh=OXs0Y2Jl9HdzHS2ird2lMW+ChAu5fLrUXDPFb8yIrDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Znvicg7HoBJ/Y1hIrP5bjjWIHLDPN+3QIcAlVe4xcM+qf8aY+AO2psHaNv1rAX3HJ
	 mFN6R0o1NAARuWExTKjItxLuHZyFDOqtckmJhb90nED3kRXlQXInan0iDUe1+0uPN0
	 lpaFFVw2XfOoghvyi0HSDeLVgr7FGFqkPrMpMrH9mzFGf4yg2a7Xbk9zcYneTXXflM
	 Gl2bx9roHdJLL+luasZoYnvyykNdjJX9yLZxjPHSl9hQEWCpLHxbMXBTYwQWbVstJd
	 UQpH5RxXQnFauhr+OT/cpurbKH7DeTZbMD0U8dVeNSRospLVaNFXNG2SE0K38yPIKF
	 SaNL+ZwP2qCUA==
Date: Tue, 7 Apr 2026 19:19:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Pawel Dembicki <paweldembicki@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Wensheng Wang <wenswang@yeah.net>,
	Dixit Parmar <dixitparmar19@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org, Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 2/2] dt-bindings: trivial-devices: add atmel,atecc608b
Message-ID: <177560758652.39663.11215595026885409037.robh@kernel.org>
References: <20260330100800.389042-3-thorsten.blum@linux.dev>
 <20260330100800.389042-4-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330100800.389042-4-thorsten.blum@linux.dev>


On Mon, 30 Mar 2026 12:08:01 +0200, Thorsten Blum wrote:
> Add entry for ATECC608B.  Update the ATECC508A comment for consistency.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

