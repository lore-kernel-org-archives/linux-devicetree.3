Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F164448384;
	Wed, 19 Aug 2026 09:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787132795; cv=none; b=Om/H/JOp3aM0EDlwewGXyLNWQeTWhg/9eoNj1yq2Z72GUH3WC/0/kP6bKrrIsdswi5Tkm0YwrdzyydOIhJZi3e94XgWPS/sNHZxYMogsJnq3gZjboKjaY9qTk4rUfanWlZ0/hZYOH3XewYRUpuEOSEwP6N0rc0hYqnxdeXqLiGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787132795; c=relaxed/simple;
	bh=mYV3VXLdDr4ogcy6C9Id1v91GUn+6jAiXl+bLe0EwLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKoleSm9ylKFDKExtURG0onlGKtENe/X8AFEoLYC/7jMrbjS2o9SvM6n3cKUjWXjeHN1sFJ2xCcQLOxa1uo1NpL+WhTif8PoSfbuxTK2nFtES1k0sKfK2mKGJC1xZRKJG3QdWL5LtyaZwk2U/zNXCzRMhc/RdWs77qUoEnDDVoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZCSjoC4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZCSjoC4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2481F000E9;
	Wed, 19 Aug 2026 09:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787132793;
	bh=Q/zOpe2HngJG23s9QAhN8OFYFXMzqOJAL3nJjlP7+wI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OZCSjoC4XV+BnBOuj6G9GjNJ0myzhg40c5fWKVejHTYg35wWI/9WvzZmwqoszlDV0
	 IJF5/pUAxcDkEFic86+MC4oDBoWlc2uG+hMwP2DPYo04gIZLoEiikwRBWhiFugjf63
	 u3s8AtYpkYaMFqBiu+x1fX1REH+Z8KriU9ihPrxvXpDFEK2T/Zz0UeaFAyrbJ3rZVQ
	 Flt1DeQ8tysjs58EMmIeItskhGBCc+WHpidTT079W4bjv43Bi9TYmEWaOW/PbryMXn
	 VKxd5NOEkW9LJ1GKGzO2KKwh00Mn35K8BulG0SxvUWUIPTnW7kukeuRHRD29PFl/7i
	 X6sSGm1rKPkMg==
Date: Wed, 19 Aug 2026 11:46:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swark Yang <syang@axiado.com>
Cc: Krishnakumar Kesavan <kkesavan@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
	Karthikeyan Mitran <kmitran@axiado.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mailbox: add Axiado AX3005 mailbox
Message-ID: <20260819-popular-vanilla-poodle-80c9c7@quoll>
References: <20260817-upstream-axiado-ax3005-mailbox-upstream-v2-0-25e713eccff3@axiado.com>
 <20260817-upstream-axiado-ax3005-mailbox-upstream-v2-1-25e713eccff3@axiado.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260817-upstream-axiado-ax3005-mailbox-upstream-v2-1-25e713eccff3@axiado.com>

On Mon, Aug 17, 2026 at 08:34:07PM -0700, Swark Yang wrote:
> Add a devicetree binding for the Axiado AX3005 mailbox controller.
> The controller provides inter-processor communication channels
> between the host CPU and the coprocessor, with separate TX and RX
> register regions.
> 
> Add the corresponding MAINTAINERS entry covering the binding.
> 
> Signed-off-by: Swark Yang <syang@axiado.com>
> ---
>  .../bindings/mailbox/axiado,ax3005-mailbox.yaml    | 96 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 ++
>  2 files changed, 103 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

