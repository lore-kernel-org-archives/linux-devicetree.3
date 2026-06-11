Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FF83BB106;
	Thu, 11 Jun 2026 08:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168133; cv=none; b=TK+kp4Aw1osGrNUB0c1He59c/4UATEenxn6pO44e8MLhlwASAOSq3A3OG5C9nXsfJxDypJa29XYyZkWMzBYpXcq4TfZxQ1CdyeAS6bjvhjNJGvzOPwv8cTIK0O3vUaOwamxKyf8qjnIbHdWPTSwSK+QRtHqtgCl9FaOl/9YkHBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168133; c=relaxed/simple;
	bh=2m09wI38lQ0Xd4gfxo6C+jSHQZCF/g0NehlKnf87m5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BcVZv1NeKRuLYMt3BkWeCMjLGwZDuJedG4mDc8B8OPHS3L7jE1heP5vsnuLbe97qLmzXZSLBVVP5dHIN0oee8wkJbRJa/wfp21GVyJUjZ4kZE1kn9dkEe1zvJmi0x+S6ZNjvGY2fpPmERM0Gm/sz27D1ZcGVWTPxyo2VrXs68og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YvGQpVuP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YvGQpVuP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A470F1F00899;
	Thu, 11 Jun 2026 08:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781168132;
	bh=ptOWDVk7nTwS3qZXkdxZmcw+4PFeMnryZ2vMlih7jLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YvGQpVuPn05rub+Xr6Xgn4clpuhn0qlTIOAEuXj8KzY45sZjmH8DwZy9UvWDRSAva
	 YBcvKtt9fR1wIqxbEFWsF7VZT4kKVbLGXwBN2Mt0/2IaPVzD5ajXSmMSYiuoKjcFTQ
	 a6b3u+wDJD44Iz6nMbrYgtxlhe4Pq4J8Ta5/xi68mN5WzdHKTQET1ticu/QL7OT/Ki
	 IALuuAq3+TrXwNu3EyBfj3Jczh5afJB0lWqXbYOCh7a5A6cDzl8cEN4je6SnYHGrU3
	 yN6/itM8g3GSvevDjswMl78G0d9MUtyGdxJ8Wg/vdQn9F5GAvgQ7Z3rPbaLeZde02B
	 Sm1o5luxQ3CUA==
Date: Thu, 11 Jun 2026 10:55:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Collins <david.collins@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
	kernel@oss.qualcomm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: qcom: qcom,pmic-glink: Add Maili
 compatible string
Message-ID: <20260611-impressive-lively-jellyfish-4e69bc@quoll>
References: <20260610-maili-pmic-glink-v1-1-a6ba02d6deba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610-maili-pmic-glink-v1-1-a6ba02d6deba@oss.qualcomm.com>

On Wed, Jun 10, 2026 at 12:10:13AM -0700, Fenglin Wu wrote:
> Maili is a mobile platform that is compatible with Hawi and Kaanapali
> platform with respect to pmic-glink support. Add Maili compatible string
> with Kaanapali as a fallback.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

