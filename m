Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB91C2D97BB;
	Tue,  9 Jun 2026 07:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989512; cv=none; b=mJOJlL4FWVBt3Fbt5pLDJ/Zu/ydP+QVVKx71NyWUh7ZN+K9DWddKctjuzGF3RAsjfTXpoIH9PlrWJWyxF/7A+FkaZbEPPcTnyMsoUS8WAmgN0Kf5Z9QtPu5lp9Lz3awt+a2hsIR+c7VJem6uwpOfzS+6s43JylafeJElwEGGKXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989512; c=relaxed/simple;
	bh=jB+9iYQzLWMOHTzqxJfSZdfoSY/mPNRWtrD+kyYbiOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wibrktle3+uphFmuUy1DKVx78+ka5iQYzbx4StAIS2kIVsGPpkDuD6rxTzz7Sw6HYCPZP7BOkvzXorKaxtunNBlYPOVnjxFUWpiG75kJxiF6q1fqdcKCvWI4xYdsP3TKM/R0Hw2R+VWKuo5EEgLFr3u4MiRxPgdcTm6RRfqsSCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3VNPKH9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3VNPKH9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB861F00893;
	Tue,  9 Jun 2026 07:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780989511;
	bh=D+j2bglNUemdqYv53Kc/U+NhITrTdZZ/fBecoxTIbnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n3VNPKH9LPbsw9TmWAzPZWnTVt71Qj5N33xRdeUqfjzWb1lJmGfVERHRNv5RatWdW
	 D3R9cu0xU/cncCBYYDP6J20SBn9fnOJq6hpglE+B7RCJPHfCBlC8BMmkVeEM/5WLqL
	 agxQxquDw5uZQ4wFIhc13YSrXsQzfwsd/zOqf22upEHXyOgfVvTqqmndkALbeOYpEX
	 POat0KSwpKQK0xTWHg16SF8nJsDn3Q4mNI3h7OBli/yuRQUsTq1b/rZwQKF5q3E3Lr
	 /rl1wWMjtA/ZFZkQLfk/ZV1gD+dW6NeaK4XA+CcqSyO8sS14uxX8Rr7CrRYHbRC/HC
	 IBRgkj0gQRBAA==
Date: Tue, 9 Jun 2026 09:18:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: qcom_smd-regulator: Add PM8019
Message-ID: <20260609-watchful-cyan-mackerel-8bc8aa@quoll>
References: <20260608-rpm-smd-regulator-pm8019-v1-0-c671388b9ea5@linaro.org>
 <20260608-rpm-smd-regulator-pm8019-v1-2-c671388b9ea5@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608-rpm-smd-regulator-pm8019-v1-2-c671388b9ea5@linaro.org>

On Mon, Jun 08, 2026 at 02:05:44PM +0200, Stephan Gerhold wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> Add the definitions for the regulators in PM8019 to allow controlling them
> through the RPM firmware. Reading the TYPE/SUBTYPE registers using SPMI
> reveals that PM8019 uses a mixture of regulators from PMA8084 (hfsmps,
> pldo) and PM8916 (nldo).
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  drivers/regulator/qcom_smd-regulator.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

