Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C06382389;
	Mon, 20 Apr 2026 14:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776694486; cv=none; b=MTFkJ7cp/V/iEjOKijhyVyv1xG5m3ltjWA7mS6BXjO//BwQ4fniczO569O0uKpxLIgXyC5JXrgs0Nyzs6ipHUO5sBGGCknfM6Or1fX5Q6g5qmM3quHgbPB6Q2UW2OK/rrFCGW5c6YJOH7AStYZLb45xtYxLomiuNQ/Sko86XO+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776694486; c=relaxed/simple;
	bh=8Nte2YJgSiUtFuCrOky4JdK1trVLbH28GAm5o55yJ94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1rvYpPB12RxewBXr+99kjj1EA4G2hPUUXq/Zx+E4e50z1msCw3JrJv9W63cbmFN9IyA9SvcthenGs4Dka191TKCDJ0MDbSzsoISkTvVoyz9MPWxvXejcV08SKtLmfpM9oaMzWAYy1vVZJRfyhH5tzy1XtJVkX9yArXyeY9xdSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1vu6RRT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1vu6RRT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E49EC19425;
	Mon, 20 Apr 2026 14:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776694485;
	bh=8Nte2YJgSiUtFuCrOky4JdK1trVLbH28GAm5o55yJ94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S1vu6RRTG20NQc+5Gyq7ep+AY0jsV8TJUTDVGo+/yO7b6ijYF0Ig3+UTS1PSzVp0M
	 /fGqmQsMyr3SMRfSNuQv2eoEx7HoKO4xNgBktOXYcW+3EePKivvfZIMuKyfPq4U9t/
	 /a0xs8j9g7N8eAylMUX7wcclnKUCxFv0RGoI+KZ+QT+2RdvaPEUGzLhN2IgPcMMjhs
	 d1HqkVXboY/IAkfdz54Hqo9ER3KNvJV1shhbeu2POIdDUlAp9n7BSGXXJyddguGor5
	 Bectzvqotl+z0evyFTyadsLVqJafChyGZ7dOYZslbrS3azpJjWsMTLSqZj9VklEmtH
	 BwcDACUsQRgYA==
Date: Mon, 20 Apr 2026 16:14:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, David Collins <david.collins@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	kernel@oss.qualcomm.com
Subject: Re: [PATCH v3 1/2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Qualcomm Hawi SoC
Message-ID: <20260420-inescapable-fantastic-coua-5dba14@quoll>
References: <20260419-hawi-spmi-v3-0-b04ee909cb87@oss.qualcomm.com>
 <20260419-hawi-spmi-v3-1-b04ee909cb87@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260419-hawi-spmi-v3-1-b04ee909cb87@oss.qualcomm.com>

On Sun, Apr 19, 2026 at 07:25:52PM -0700, Fenglin Wu wrote:
> The PMIC arbiter in the Qualcomm Hawi SoC is version v8.5, which
> introduces parity and CRC checks for data received from the PMIC,
> as well as NACK checks for command sequences except for read.
> All other features in PMIC arbiter remain the same as the one in
> the Qualcomm Glymur SoC, with the only differences being some
> additional error status checks.
> 
> Therefore, add a string for "qcom,hawi-spmi-pmic-arb" as a compatible
> entry for "qcom,glymur-spmi-pmic-arb".
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

