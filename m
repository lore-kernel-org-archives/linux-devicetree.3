Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A9A3A5E6C;
	Tue, 18 Aug 2026 08:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040456; cv=none; b=REgtlOQgGOaDO5wbWAYle7/EPQvxNl7+lzn8x7JjKj78IkuwsLxbFZh7KB6+pB85dFemGonqOMoW3EFbN1NWbx1hlGizu07y+K2N82HezaKDQUqb24tcmokMhFDhqwHAIixarJK/wOQnz41NhwLv0RwwsCsjXwT+pweWpMJgptU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040456; c=relaxed/simple;
	bh=FJK6k2vDsk1AYBRzaehrMQjzJwPIztkqItQBFL4wvdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SifoqPkO8DwxtJRkLhbLLwrzB+/TgQ7w2lzVLULOnroHITnYMrThDPkVQLU/ts5wslvFmKq3AcyZwt8LpWwV7TGDDvm+7wy0SpR6b1HAlRpqoa2ZLZTzG6hJfm6POenePMVwbBkmrWoIDikatipZ+AZZfnVxwsRyuYxtPwakasU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxiWr8Hz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxiWr8Hz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 521E31F000E9;
	Tue, 18 Aug 2026 08:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787040454;
	bh=ZakSZwIlVicVAQNxkDcltYm9qdxZrwZnRLZQ3jMlw/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gxiWr8HzfjEhkccs0k+6nIypQN5i/66m0W6dtSLGHjtb32dR9Ku5QkkhUghhWBjK1
	 TnnbXfHiNjk16f5yPnXP5A6bT3O9RBG/82WkSxD2wBVslFOnCg446/BB2gnRQRo4UK
	 kh6FHgCrg8QNBm2WjHV+eyj4hvdgYt+BfEe8DTTuBTJskvLKotUsEwJ3Qz2R/pIlax
	 /FaADAwPAVKesyqSQlJ3BokpEftm/vCSw0PV9mpIUdm91cXBrDwY0tpAjlLJ8EZ2PP
	 ssgoyD5yIhNUPkYeqF28o7b26estlR8SbJuEm0L15Xt1eAQzh+s4pMzcVjfaw4MDDD
	 V8L6pGp5TFqOQ==
Date: Tue, 18 Aug 2026 10:07:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, tglx@kernel.org, lpieralisi@kernel.org, 
	robimarko@gmail.com, linux@gurudas.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: firmware: qcom,scm: Document SM7250
 SCM
Message-ID: <20260818-spicy-rattlesnake-of-resistance-25073d@quoll>
References: <20260816161808.12419-1-sreeshankar0910@gmail.com>
 <20260816161808.12419-5-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260816161808.12419-5-sreeshankar0910@gmail.com>

On Sun, Aug 16, 2026 at 04:18:07PM +0000, Sreeshankar K wrote:
> Document the SCM compatible for Qualcomm SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

