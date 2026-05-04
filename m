Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F493A7597;
	Mon,  4 May 2026 11:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777892773; cv=none; b=h4KaoDEjQW+ZT1wrAjgbYOAcfQ3TjhjoueqOnDCkihMSdx0bU9vayjfwxWUgkBA4uE3KlzMQSkzh4hV7OqoMNzeN+AObBOpG3NGPWiKUBWihlStFtrn6IoVK3AZfFCHx8KOdFSzvy9yn5Jg4ZgchIvm6BIagVFbCM8Sfhjy/IWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777892773; c=relaxed/simple;
	bh=sJTZIiOg7b1p9ynGB6mRqkfzuVlPomfglTd9N0O3xOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZXF8Qs5ClUyC7OIEN4/2Ilqcmo1QAgbnKrGsXU+7T+mSTiWSQ+HaZ6aUlo9YBffwWNglNb9xTX4plQa+SDmWaS69p3e1Mkq/qCVpmd70sJbVCDctQ3dfReKV4u+eOhnLjQgqTWIFpDYDRomH2ZZtBWsgy112X6CDa2SXjWa5gZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fILSU+X9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fILSU+X9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9918BC2BCF4;
	Mon,  4 May 2026 11:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777892773;
	bh=sJTZIiOg7b1p9ynGB6mRqkfzuVlPomfglTd9N0O3xOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fILSU+X9QGcj5rznf88KfCoLItmzl3G3OsS2TYVopCDh97QH3pXChF3p/f8c1UehX
	 liccl8UT7Q4cCfNOSucwPTlzaCQWtSO+51A2kjZndj8VJNqXXoz/1x9NHovUuwu0HP
	 FjIM8Mzqd27vGUt+QtJnUSCYtaHo6s35d/A+IR3hxkMPc5BC2yY7hd50GlXbjj4px9
	 PEUPdmP1tBuAV3diMNavrRi4ByatDk5aj3vJrEsvz8Pe1vKmwgPAFP8ExseSdNY00M
	 E02dt26ZElE97VAoaRf4BkbS82VHI8AVbnAUY4TZPl67ggcJj7343qfcB0L8yAb9bo
	 nbPLVLLMMSSrg==
Date: Mon, 4 May 2026 13:06:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add Shikra compatible
Message-ID: <20260504-ingenious-bison-of-defense-5e16ba@quoll>
References: <20260501-shikra-qfprom-binding-v1-1-17e63148c2c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-shikra-qfprom-binding-v1-1-17e63148c2c8@oss.qualcomm.com>

On Fri, May 01, 2026 at 11:40:59PM +0530, Komal Bajaj wrote:
> Document compatible string for the QFPROM on Shikra platform.

subject prefix - it is "qcom,qfprom"

Here as well: s/Shikra platform/Qualcomm Shikra SoC/

Best regards,
Krzysztof

