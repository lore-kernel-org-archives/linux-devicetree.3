Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AB33BBFAA;
	Tue, 21 Jul 2026 09:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784624772; cv=none; b=B8RYiFoiVa/ngHnPR4G4GQmV3K829jN2zxYhX9263EzNQwIiUrjhZLeBNddC4HmNlSskTo8Omf/J7ilWnvHdCfmnZou3OuThTLy0Sch8Wu2X+4hBFU8IJautdoWxJBf0Loeaz0iQ/EWN+Mlx5XI89jPDdKrZtEpxBgTAbcbd1qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784624772; c=relaxed/simple;
	bh=EmxjAQse7ryYLnyPpldiWqD66DyINhj1WdxrOAcxcPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsVllxy7vQgC7m9kJGGWtxzV/ipr/wuisj0MC5N8M2mezy5wqMhnJv423uqFaf2QBVN+i/b+8hYrQ+4gOvXOd3nApbYD3BfIm1DuRPb2rfM7R+S3YYVSR5sawyNwsDH7omGeXfwIIAPTKWpZWiOmVSHLt/Aum8IeHTgLYQKN3c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VgCyTu+2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VgCyTu+2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53921F000E9;
	Tue, 21 Jul 2026 09:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784624770;
	bh=EmxjAQse7ryYLnyPpldiWqD66DyINhj1WdxrOAcxcPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VgCyTu+2osdbuokJyvniSa/MqFZfaUUInV1mbgVGH9kZa5doPweccfB+Mm0mfbAdv
	 RTDJSE3m2ZEUyc2kKhevtwLV+PdhXDj65A7blGb9rY57K/qNsCqas6gIjCBLBhF/Y2
	 Wpxs6kIjerK/egqgSADxeL/Hs/kS0LXL5vuk+QqH0x+tLTlnpgh54wRIcsth5FkOfH
	 VgToZImtTX7A2IXQm7UtnGS7VNF+7vSrGRFZzWrZ/O2hWOpWcniMr52I4qkrwnJFh4
	 AIyhK93O7BQAR+IqgQF//W9O0kTt3zQH8DOjSD29xiWwHLGIEm98PHIYHKNOlQU1Bn
	 GVeA5lotJuFmA==
Date: Tue, 21 Jul 2026 11:06:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: interrupt-controller: mpm: Document
 power-domains property
Message-ID: <20260721-lurking-polar-macaw-b4abba@quoll>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-1-3d858df2cbbf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-1-3d858df2cbbf@oss.qualcomm.com>

On Mon, Jul 13, 2026 at 03:55:41PM +0530, Sneh Mankad wrote:
> Remove #power-domain-cells property and add power-domains property for
> MPM device.

Why? You just repeated the diff, so not really useful.

Best regards,
Krzysztof

