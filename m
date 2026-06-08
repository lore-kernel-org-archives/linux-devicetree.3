Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E58365A14;
	Mon,  8 Jun 2026 09:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910740; cv=none; b=IEgeWjtUUQSYGpr0D0ZQpmAnyQq1So0ySEy8MSmgPgMqv1XhcHlUTrrZqtZyBEgs48Of3H1CL+sIeRHlpeoohL9K0xD9ZYbdJm4y/HywmWjACUwHvjQdtUxhZMyXgywt0TQSMHrUmqrWvQXRgTLDrVGAhNKDOFQaL4YWuiHwt8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910740; c=relaxed/simple;
	bh=jcITkZya5DctEjJTpnhNnyUaklT05KbjrGX++UKoNys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDmOtF0Ec/jlmiG3pEjfdnNWTf2ymOjm3LPcfVy9MWBlSSSSXCzTF7RkfgW2up98lOcn7lGJtp1/dzduRp1FNRp7t4o+qPua5/BNLIThpXpJ0VSFSIlkjGKmbR06uTNrKOmtFYX9zPDk2UdcqC+hjGz+6u8bPRyYY+HmJTQ+aYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahTbVFL6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahTbVFL6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F441F00893;
	Mon,  8 Jun 2026 09:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780910739;
	bh=97SVP/N1UPsxwdFM+XWV9XePY4QYpYmCHmoPoWmKD6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ahTbVFL6EgM2d7jyD1QZAZM1ROx1P5MW5VPygBDVUBcqURzOX1/t8vVKCGmBRZhDs
	 adXAVt+xkzwy18Rekd91qxeJNXBd18oi0CLm7ZL+grrOcqxWRsGsdEmJvmLWRYHWBd
	 h//0iCIEjyqBFe8dQfLpNKx0ss3xgrEgBlXAn9xEK7Pqc77iHM3YEok8gJp/MegGPM
	 cKxpdUz0TO6PlU8znPr86/DtkYHYd6sfoFMsBO4xQRfmgoKVMNW+9sAl3avTr0VTtu
	 K+J13BaYgm10HrlsN/wLNAUZ7Y618T9wiG58zAqBNLj8C1Y3LsNpKu4xszkxp5ncb7
	 nAmn1iIH0P6YA==
Date: Mon, 8 Jun 2026 11:25:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: cache: qcom,llcc: Document Maili SoC
Message-ID: <20260608-warm-astonishing-chinchilla-deff3f@quoll>
References: <20260604-maili-llcc-v2-1-dd24f05bc197@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260604-maili-llcc-v2-1-dd24f05bc197@oss.qualcomm.com>

On Thu, Jun 04, 2026 at 11:06:16PM -0700, Jingyi Wang wrote:
> Add documentation for the Last Level Cache Controller (LLCC) bindings
> for Qualcomm Maili SoC which is fully compatible with the one found on
> Qualcomm Hawi.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
> Changes in v2:
> - Update commit msg - Krzysztof
> - Link to v1: https://lore.kernel.org/r/20260525-maili-llcc-v1-1-cdc72b98b671@oss.qualcomm.com
> ---
>  .../devicetree/bindings/cache/qcom,llcc.yaml       | 63 ++++++++++++----------
>  1 file changed, 34 insertions(+), 29 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

