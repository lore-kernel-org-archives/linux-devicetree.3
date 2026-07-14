Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD403ED5CD;
	Tue, 14 Jul 2026 22:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784067989; cv=none; b=JYz6nHTivmrIwmQ1t7DvSm82P1/MPxxrqp/ZXNiJaN5nW+8kOhkgOyzq6c7yY70cHrlJU4diOW6LCXRbt3MZNePLkwizZktxaH6wLgDEJbD5F8jUpdnu52FiGiXQWTtZ/9eXWMmVR/7zsCA20Q+YRIagxpHP+EcAs32iklPhZFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784067989; c=relaxed/simple;
	bh=6slD16vbofSB7Y+a5Xgowag1eUf5CPTVsvwVDzoV7Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxQybbv2MQKmmUoVAcqxGkQDM0h6THCd1POxCLXCNc6IehaxOx/goAzvPD0eGzFweuWM9zARzFxc8IKzUusr+jjk2M2JRdE4t8GE8vOTUTFU9A5F9EA/YL8xYRx73y90BcECwMbmZS50JcT5gM32SV1N5ZzLIukpeuZViDXp8Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fybwDaMy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fybwDaMy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90411F000E9;
	Tue, 14 Jul 2026 22:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784067988;
	bh=6254VFiGfgr94l91u+xgz3JWJQRkuI1F1x5IMQGXKVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fybwDaMypu9dOgtVBJyexrAMi9RQLi1YRgRIXB9JnNbH/WYZTljwOOlbcDVg55Q4L
	 LAHrMTf/oKZlr7YvSoYz3H8wwkYskAkB/3Cxmhes5I9p7umKXhF6jfLgh+R2CzHLlT
	 xHNU5vky2jA+uBwJUysoOdhuOW7vu5N9dbquq2aXO4Z1wdXDIBNv/wkZQVWHWWEpz8
	 sEbX2xyZOFZwPmBThFZCGdVgoSKwaAbP3Z3camT8IqV8uA8Jotgb+e7wMbSMXbtkEr
	 YEaFHT3S0OYaRMgSidwtnnqKBgf7XA5u/PnCYwcGkRkSmbhwvhrfdeYIQA7I5EVCr0
	 829VFbhKWHOMw==
Date: Tue, 14 Jul 2026 17:26:27 -0500
From: Rob Herring <robh@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: Document SCM on Shikra
 SoC
Message-ID: <20260714222627.GA3164320-robh@kernel.org>
References: <20260501-shikra-scm-binding-v1-1-93d7faf1b784@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501-shikra-scm-binding-v1-1-93d7faf1b784@oss.qualcomm.com>

On Fri, May 01, 2026 at 11:23:46PM +0530, Komal Bajaj wrote:
> Document the SCM compatible for the Shikra SoC.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Applied.
