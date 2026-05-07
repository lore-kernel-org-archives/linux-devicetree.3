Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A8D3A4512
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 13:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159590; cv=none; b=R3JsYnxsqkZ/JqjYSn+up43G3SKcMtN2K33u3frYi13rvziEioBSGbiW9YQLEVW2OaXFKCj/5R0rrbvS5tq1Um07git/cNjPUo4MjYzI/j+idZ4BzIyhgpd2Y8mnmk/CfaLdY0cguU9doxBFEsQQGFbmDbVELN+EY9nD4eASg9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159590; c=relaxed/simple;
	bh=cL1mcO868xyHlLeGUFZOBD7kKYgyhHySlDGJ9VjKdyQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QHU7BV4JOE8oIGjWdea8+C7YEQztaCoM4tYOldr0JH+r01aqEfLjAPJkwWfiazOLlwbAO2fJCYlv8AgsB/7CXrnFlugiKNMHLvVRhXUR+8U+8M95h5VXBwr1dWJUmvmh9zNUk99dUiZ6BRlD9nTS29b7yHBGPL37okSWFn57SBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZF5fLfb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZF5fLfb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9522FC2BCB2;
	Thu,  7 May 2026 13:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778159590;
	bh=cL1mcO868xyHlLeGUFZOBD7kKYgyhHySlDGJ9VjKdyQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GZF5fLfbFHyRhKHPLacppHZEol48ZWvouuyP3lmrcbJZ2XrXWswRn6ZCBv2Pe7kw1
	 LvlECTmv1ktK6eVhan3G8dIpc5LJ29hsFNJbHS/Pb4xkY+JyYoMYf3UUWqkM60Y458
	 J5Vc7498mzSb9x7bYmGR9fCnSWjBxQCP6kJKJ+v94Vik0GuX1iJ97TovwjiVhzbe8C
	 oUaerueSgol9s4B2vd0WuSfOKyGYYwki+XvZ1gmMnznkmkl6ZTbEUd4LAeFAjFiO4h
	 AZfRKkT2+XPv6Y+9LdfapF/TtUxCnSNP7HG+vKsQUcAzsYJMwCav4+kEJDSL61vEtC
	 SradcZ8JXaoFA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Shaunak Datar <shaunakkdatar@gmail.com>
Cc: devicetree@vger.kernel.org, daniel.lezcano@kernel.org
In-Reply-To: <20260423113237.260652-1-shaunakkdatar@gmail.com>
References: <20260423113237.260652-1-shaunakkdatar@gmail.com>
Subject: Re: (subset) [PATCH v2] dt-bindings: mfd: hisilicon,hi655x-pmic:
 Convert to DT schema
Message-Id: <177815958834.1856708.5917940936476601892.b4-ty@b4>
Date: Thu, 07 May 2026 14:13:08 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Thu, 23 Apr 2026 17:02:37 +0530, Shaunak Datar wrote:
> Convert the Hisilicon Hi655x PMIC binding from the text format to DT schema
> to enable dtbs_check validation.
> 
> The 'regulators' child node is added based on existing usage in
> arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts, which defines child
> regulator nodes not documented in the original .txt binding.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: hisilicon,hi655x-pmic: Convert to DT schema
      commit: 182a61b3f8d2314995f7687364265cad7a365a38

--
Lee Jones [李琼斯]

