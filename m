Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB039451999;
	Tue, 11 Aug 2026 17:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786469928; cv=none; b=bzF7IOVbUWtdP9bfvdv6Ho7N1DLjG6PxDU7wcNPU8PQLuTWU4kZOTlQmNdda8g6ImTtPGOhvK2idH51Lt+zEDZtZWe+aKbBSUYL0AgQb3AafeaBKxDZWEuEva2+GRsEK1C8Pm7XI9sDAua1BuSz9jsB8zCNqJZvFxsZ+GZcQkww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786469928; c=relaxed/simple;
	bh=ay/9cc2rf4AwRnZKueyfN4ZT6j9T29GaRCB3TD+ndr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9hI+fdRQgFE7yXB0UxfNVP0DvrAB4/+si2FaCJvdGanu+fRdoU7C9ZW0M19ay+t9CLMwTPExc3SUp0fRd9a4vF+rSMf/L00+EuVGpTK5nXF4wRxWwfuSmq9oWR7Q73jvkW9TshuI/o/vPMHGCa+pTiHMA4i0znQvmqHIyu1NkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gGdFAjVF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gGdFAjVF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 695771F000E9;
	Tue, 11 Aug 2026 17:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786469926;
	bh=xj2zyhwkrIlDZo2yssRCN7ZP93DbYkQgHHra1ZkJPYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gGdFAjVFE5wOZ1J3cO11beGSOUH9Rf40CMTOf1T0tzeqDh6WwrESJtE8Tlyhf83FZ
	 kYYct/IeXBQ3zwb3e0OFmMFNQ8NaAcsG57MTCvqnSPNe474aYQniTps2vcq087CS5P
	 YTAra7yaO2We8J9L596GK6oAVuFXdyVFmlvV5NVXrOjlMe8PxyoZmdM/O/F394e4Bg
	 friOl66xOXWU3BaRdPTjF/os8vvidqQ/jk1idKBnY4pZIv6BTKzYVWqG7REhJBgqnu
	 LibgOj+qCRFVSbB7U5KxY/Ks5wNI5CZ0WAYdSHH90wxTBsMMsMFNWKS0fl6ezWE3X6
	 4YSdhEC9C0h/w==
Date: Tue, 11 Aug 2026 12:38:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: goledhruva@gmail.com, linux-kernel@vger.kernel.org,
	simona.toaca@nxp.com, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, daniel.baluta@nxp.com,
	m-chawdhry@ti.com, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: power: Convert TI SmartReflex to DT
 schema
Message-ID: <178646992443.2685938.8771297773008996116.robh@kernel.org>
References: <20260810131641.352391-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810131641.352391-1-egbostina@gmail.com>


On Mon, 10 Aug 2026 13:16:41 +0000, Eduard Bostina wrote:
> Convert the Texas Instruments SmartReflex bindings to DT schema.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
> Changes in v2:
> - Dropped the '|' block scalar from the description.
> - Marked 'ti,hwmods' as deprecated.
> - Reduced the examples down to a single one.
> 
> Link to v1:
> https://lore.kernel.org/all/20260730092454.52466-1-egbostina@gmail.com/
> 
>  .../bindings/power/ti,smartreflex.yaml        | 50 +++++++++++++++++++
>  .../bindings/power/ti-smartreflex.txt         | 47 -----------------
>  2 files changed, 50 insertions(+), 47 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/power/ti,smartreflex.yaml
>  delete mode 100644 Documentation/devicetree/bindings/power/ti-smartreflex.txt
> 

Applied, thanks!

