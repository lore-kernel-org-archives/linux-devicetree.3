Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969160;
	b=v2IjJmnj3w3KCPWWqr+KySYRNnyUyceDy4TBCsIL/V7qm6r0jrv+ka3ZDzSpT/G6v2Mc
	 aDxnVO9GtdAzD6YT2wXVsh5eQUpGyzwfzuwO08djcnYgj1SQ3q6B2PyLT9i314ZfEtEdd
	 EtLBM1Nka7GNwNT/+i2AacU0O4bsXMlzeR2tkcPNydCR4tk8+FWaKkTO1qLMjlb42r8Kb
	 hNay+My64rmwWRrHAEH54lW7FPJyLtUJNCYRlhZh32rj8mfuOvhIbY8ljViXvYwhWjH6K
	 TsS/Ma0V0JcjgiM+RK92XNJTB+OWN7wesC10iiFegJuJb2Epd97aq3+77ODCDQ5j1Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969160;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uhXuGcsNppFZheJwKzgkxhB64NiWlPAqyh1GrGVcFL8=;
	b=nFp015nZlj8W4bs7sSvMiBhKUQV+1ajhlRdzTfMBfBaPavYSPNDyEkMgPp2TDanbs0zZ
	 9xEgiTSdX5Hwv/FHLmEGTel77w8xE7gL74271xHF/fkW/4JHmWSNnDVFyQKP9SzvSoB4Q
	 UbsFrtJIydZ9+fxa63RLa/ARp5WB9K6XyDRfWHvjscuFZT7gV0dHjuyod38BsYD+AQZQs
	 2YfP6Aa0osG3wwME6KRjodUOUUEUYPHI6hPJVNx+JGTcLnMYLdKsw11MLUdRbgEdyC8UY
	 YUdZqspb1SmCYaGs2y9wFUgmR7IN4wWgD3FGOSrKswlaDyFLMg9S0WEbPFm+N4aRnEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPkXtPft;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D85F606A329
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 12:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPkXtPft
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE851F0089F;
	Fri,  6 Nov 2026 12:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793969159;
	bh=uhXuGcsNppFZheJwKzgkxhB64NiWlPAqyh1GrGVcFL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lPkXtPftUCej/ZPiVdAjR4T/wtSOuFH7k9wmWHJ7TgH0T1NtYzJ8N+SQps6in51HD
	 6n0uk6Xyd+ylsxcwATB4vFPYGXSKAU+XGOPTQn5vfiJp8B9+C8CbZroKnroqQp00do
	 szWYR0mi6y4rV+spUo2BV5LdzzqLx7ys8KNTE94bOJg30b8RSonpd6n55GTlelNNe9
	 /ymIs7+hafHvwFfWsyg+yMaK7H/3WXUN682BDpg3kLdDA9GTboqjPwdNJ1SxxGYRbu
	 GrB67Zbws13kDKYoHaTBVwGqaXNtRQNOzVD1vHniIkJ0TvgbldxOSBgVbd6fzD/M5e
	 mcQ6BZ0HDJ/9g==
Date: Fri, 6 Nov 2026 13:45:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
	Rob Herring <robh@kernel.org>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: arm: vexpress-config: Drop ineffective
 label limits
Message-ID: <20261106-ubiquitous-interesting-caracara-1627fe@quoll>
References: <20261104151042.2776368-1-sudeep.holla@kernel.org>
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
Content-Disposition: inline
In-Reply-To: <20261104151042.2776368-1-sudeep.holla@kernel.org>

On Wed, Nov 04, 2026 at 03:10:42PM +0000, Sudeep Holla wrote:
> The core Devicetree schema defines label as a scalar string. The
> vexpress-config regulator, amp, temp, power and energy child schemas
> apply maxItems: 1 to label. This keyword constrains arrays and has no
> effect on a string value.
> 
> Remove these ineffective constraints from the child schemas.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-3b655691-26dd-4398-a647-eb878395b929
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

