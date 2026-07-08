Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F8E49218C;
	Wed,  8 Jul 2026 14:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522676; cv=none; b=iQLJHrqTIJvFVl4pCzOA5Y/zc4BOTnlof47MaHjNmhg2ojNGY80MX2+FJ1rBtDZPevd86/hoh6DQsB3Gjhls8gurHkoh+wOe47cRE54Uxtf3/IIsn26ewt+dLqN4fo0/Nwa7TCdoNU3Ma9vDGX6cARc7mjowksaTecYgiq0PBgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522676; c=relaxed/simple;
	bh=WEzZkvJXxM3nGSJKeR6SCi1fHH11JDLpL+1IYT2YMUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yh27/jRd2pBFLNXvnuFPcaRwCorLAWR1bAJRW4mLSpcUYsg5IKJNyK5sBXrQy0gbTrXdIh9sb2lyIu3PPOkAUoJhGU7SZ2vGdHZ03i/jz6ci6oqHy1TD2BhJt14YwMVitSLCLIsiYSKgLb0JXXF9mC7CX3VZbImVK05YMjJFOxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enguU/9n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="enguU/9n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12EC41F000E9;
	Wed,  8 Jul 2026 14:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522675;
	bh=N3xqkpimVRy54peMWlpoAGI4ntIhVMRt/V2o1OmxrJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=enguU/9n4LE49KOnVy90+hoh2CuKC9U2b8h7QAUxw9erj6a7AuiWjKnIxiRSsplmy
	 l9PtCFY5se+JNMY8tcbk0sGnrZQuif7QDqq3eJfNJa4zY8yd9v7ZHH54HmtBksnsmf
	 jyQ0PRyZ8fOb/Dfap0xeHyAuk3oXjzA7FFxXQ1f4mN2BcTbtucCqNtrI9zhU10vwL2
	 5hpKmuhOImf7oiIIiRh6ot4eDuMqcMqps48FY8pAcuEntxJH3vZkWolKlGhcnrEUk5
	 ycktgOihBISq7V32iBso9+WjJ4e/oD2LbwBM9nllyzntqJ3OjKSVGw9IkOp6wc2JWg
	 Da/wE5Up3SXGA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Teguh Sobirin <teguh@sobir.in>
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add UART15
Date: Wed,  8 Jul 2026 09:56:57 -0500
Message-ID: <178352261627.2235436.5422094904444622236.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260605-sm8750-uart15-v1-1-93e660722e61@gmail.com>
References: <20260605-sm8750-uart15-v1-1-93e660722e61@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 05 Jun 2026 17:49:39 -0500, Aaron Kling wrote:
> Add uart15 node for the UART bus present on the sm8750 SoC.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8750: Add UART15
      commit: 50c0854e2703b4e446f83680d7eb0dc0bd5bb34d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
