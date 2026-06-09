Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FF133F5AE;
	Tue,  9 Jun 2026 07:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989490; cv=none; b=Aso5ATNsjJ0J2/K+nZb4k8Qy/3EfuvCUECjOI9LgbdYYkBt1EJlDntbgBspu8u+gNzWAv74XtLzhO5LZDxDTNFcbewH3mUIOdD5Y7P/4XJ5Le/+odXfXRRgSZ1NFccjSwJQW5o28pb5HhM7knA1DWBeFgL5EzCNVj3joH6SLJ44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989490; c=relaxed/simple;
	bh=lu+Rb/49Rz7y2O9U2JPduslb4hbvFoCzHRjeVCvgAaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5wJ4b8oyvp/M3knfL/Va1MULOiD8x81LedIHkAKoarT0TSsUqyCXG/okPSHBYimGIZFE6Jc/Zp6frmA9qINvPwR3tcns1pIMGiJSCQjlXkVSNI9az+umMkeZ30iBiVa6Tyb3ZGKpeaxhk+3jT0ajkcllTFdjYAKWQQfyhDEyzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fzhT2bcc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fzhT2bcc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A46E71F00893;
	Tue,  9 Jun 2026 07:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780989488;
	bh=mz8ojFXLgCZAzcSHeznkvPuCX2+1KU6fdTaN2fyFoUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fzhT2bccfiXtbo8YlB8l5FmgXgR/6ljjFGN+dE0OkiLiiH7jaMcCEz+CD8yfYVK3f
	 g7QUADv+7yz2hkHLOoC51z7ireNpprWyYjlw3b4LFIBvGhDN7ckm95s7OXoPdlujVb
	 XceznKNt5tXjUBPdQw7N4QrG4XfpW9DCeFUlKWt7+HZhv6dfxG3ZSrSzlNHMYtW4Cy
	 651M6k4Q9Q8rOSHSGqFO3gkESmDdJrC8l+e2AYDmD1LSwrakHFqvGuJMevkxmdq08p
	 GEfzX5xdiSCFo9BrJ2rQtFakdPOHyDfybJUbWGytEFzOoTBbAYc9bNALDnR0fnC+qg
	 X9rc1mquDll1w==
Date: Tue, 9 Jun 2026 09:18:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] regulator: dt-bindings: qcom,smd-rpm-regulator: Add
 PM8019
Message-ID: <20260609-amusing-cryptic-stallion-bb209a@quoll>
References: <20260608-rpm-smd-regulator-pm8019-v1-0-c671388b9ea5@linaro.org>
 <20260608-rpm-smd-regulator-pm8019-v1-1-c671388b9ea5@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608-rpm-smd-regulator-pm8019-v1-1-c671388b9ea5@linaro.org>

On Mon, Jun 08, 2026 at 02:05:43PM +0200, Stephan Gerhold wrote:
> Add the qcom,rpm-pm8019-regulators compatible to allow describing
> regulators controlled by the RPM firmware on platforms that use PM8019.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  .../devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

