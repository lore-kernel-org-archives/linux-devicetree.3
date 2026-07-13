Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3845D390217;
	Mon, 13 Jul 2026 07:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928502; cv=none; b=ogUxu/a4lr2WSLrL7DbB+JCrZXJTBAlF7jBFDxb+BCRewdaVmCXk4c9mnUzVQCLfuWoK8yMcEiY3lZRpDw/+VozCnF32cy8pn0mhhEi9ABNOrbtJNtjCPD2/rqmS0OawT1yXAJLZdYQ3oZDQs2QRiFAwCgbaMmE2xCO6wPClfA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928502; c=relaxed/simple;
	bh=bAXVi8oYiUqAEBLabA5/ZzO9kOe53frHGuluLex3qGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=knCH0uiWnUmUUUyuG7tFxU4I0SF7mUuEa0v4RzjgRzQQ8kf3K8p8IUUgW6wqEZQJAIPpOk67Wf0kzpFCOhXfYoie4N+P7V2XF+CW3BMW14pQwqCgbl4GwDrG7zGwPQn1yi5s+uslCLQ3ivn00E7ziyriqibFYO+Gb4idL716Mhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezciMQaU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezciMQaU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD321F000E9;
	Mon, 13 Jul 2026 07:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928498;
	bh=A3ntnML7IBlzf0c0DB9qQw01XNoLMs7pMdvAj3IbSe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ezciMQaUImIs/DLBfNxGTmxmj9i8LQ9uBXU2eYBkFBzlgmAuuvKQ6jyqh3+0H5DI3
	 5tns3TmMVQ/5rUFpRNaq/upl36U+2L+T0T6iIOQSPhDHLLriFkGX2l0OgZO6IrGkm7
	 79tnqfQPA+Ftiox2MfUsFEjI7cJBiw9ziElXHGFP9dTWUfaAwWdWdbOXL5D+1lyqJK
	 6LsK3QgiJVnqhswA4yDIkvnioQyE1DiKdBWqE+zKbMK4V46WlX1iw4dWdlkDpQdN/e
	 bU0rl3TyHAzOkI/As9FCQkeNaId0h3KfTRyP0KZWg9VZZVcvQ3/ly+uI5XH/AxvsGu
	 NlKSpJmsQZtHw==
Date: Mon, 13 Jul 2026 09:41:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [Resend PATCH] dt-bindings: fix typos and brackets
Message-ID: <20260713-industrious-thick-hyena-13ac0d@quoll>
References: <802ebebbf204cbcec5cd73b6b0f19fc8ed10e86e.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <802ebebbf204cbcec5cd73b6b0f19fc8ed10e86e.camel@mailbox.org>

On Sat, Jul 11, 2026 at 03:38:43PM +0200, Manuel Ebner wrote:
> Add missing '(', ')', '}'
> Remove needless '(', ')', '{', '}'
> 'lover voltage' -> 'lower voltage'
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
> Sorry for the resend - e-mail clients ...
> Sorry for the noise the last days. When sending Documentation/ABI/ patches I got
> the advice to send each change in a seperate patch. For ABI it worked very
> well. That's why I did it.

Checkpatch points to errors. As expected, patch does not apply, because
it is corrupted.

Please carefully follow beginners guide for sending a patch:
https://www.linaro.org/blog/becoming-a-kernel-developer-part1-posting-your-first-patch/
(all series of above blog)

Best regards,
Krzysztof

