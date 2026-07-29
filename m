Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11744028F5;
	Wed, 29 Jul 2026 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314421; cv=none; b=hdCY2+O8rDRxl77dNYw9yYBD60TG6oYUzUXp7A6x7+qOv1IMxdxlZIUq2v1f/e6BfphFyXOgfMHRIoLMfJA6CliSX/BIXsxpGB937z1vPhcKYNbSvsE609dUbryCK8It2DCqUMIYIVAhl8feLJr/39TswAVN86M77Cbrpfuwbbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314421; c=relaxed/simple;
	bh=FAe0wggE5Z3NPluP25xSK8xCI1aHZnOhbzPnOGxX3Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChPVUpPUi5Bt540CP9cUnf4W5fspDVKFjNsXgYSSwrcAPI2XPcPZhHi6SYxneu0Mw12J7wa9E7GzuwHhynpLxWdPzUpW4ci82jvFpbYxrMl+aSm9ESiExSMNQ0kg2ZyVFX5BmgTFqu6VbikQYqMQAR26IR/o1gWKEhPg0ND6ubw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pz3hMM0F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pz3hMM0F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D8F1F000E9;
	Wed, 29 Jul 2026 08:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785314419;
	bh=lgVUcD8CFwoIBIUfkRSTzNndhdC7UEOcfo40aszScmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pz3hMM0FQ5je3tz4sXl5/T3mPU0zNBSa2Py+tDu8Qs8igIipFWRYPF5MZ2HoMGvRX
	 CB/vkkqC4ujVZQNEiVFZf57ir88xqMZaRs3HC8VwSTiNltd+at5OXBwgP2yJjQDr7c
	 HGc9K2WcB2SuFKQpQYzWjbKGzTDO7x+0XKS0n2/hwpEobpgGQeEN544xBG/O7ernDf
	 sRrk1XUElCsE/RrXaV4jCYC5y758UxEsg/BvJ41BHbqcvNp5zrjjkTcn1QMNrL2zVZ
	 AQ+uYQx6paUeg8abmgjy+bLMUFm9By9A3/S6yhkbJQJxfI6kLKZ+H85y5ET6n/uSvd
	 p2krLy7KGT4TA==
Date: Wed, 29 Jul 2026 10:40:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alberto Robazza <robazza.alberto@proton.me>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	Alberto Robazza <robazzalberto@gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add Orbbec
Message-ID: <20260729-unbreakable-observant-clam-ca4f6d@quoll>
References: <20260728151636.236393-1-robazzalberto@gmail.com>
 <20260728151636.236393-2-robazzalberto@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728151636.236393-2-robazzalberto@gmail.com>

On Tue, Jul 28, 2026 at 05:16:34PM +0200, Alberto Robazza wrote:
> Add the "orbbec" vendor prefix for Orbbec Inc., a manufacturer of
> 3D depth cameras and embedded vision boards. The prefix is needed by
> an upcoming board compatible string ("orbbec,zora-p1") introduced by
> this series.

Drop the last sentence. It is implied if it comes within this patchset.
Are you using it in this patchset, though?

> 
> Link: https://www.orbbec.com/
> Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

