Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EA12F39B5;
	Mon,  8 Jun 2026 20:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949185; cv=none; b=eyxHrJqa8w/fhMmvfvhb0hkAZq0sOtt2LDX59OhJ87QW8BxLNttSokevlzuThT4u6tFtoLQvHKHDqoYn9J55+oNvNPKC1+z5d6XIbwJMz5yQWRi1Oj5nPCHxoedPZaJCpDZLEZN7VWkoSjqdJknLdB5OQ4kepm04n8xIv+6AF6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949185; c=relaxed/simple;
	bh=JrXs+tGiY3xKwQKeOwR8BSSl7fQyYyCuApIf+iVWtDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYbS3Axq6ZctS2SolWlFNvL/++O+eW33FBhvnWzvvKW2Aj/36gOqpVmPGqwaaQZRENP5QGnXisbpaoDILzJTApr+num8atYfHh6qGX2OkQpX+beUD7JeVjRnC4OG7cE3aHyq+i2yaw7Byqty0aCegL1JRbtLevtPGZMp2xFIOn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Je8f5NCE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Je8f5NCE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B961F00893;
	Mon,  8 Jun 2026 20:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949184;
	bh=/16MXuPq2Ir5apRNIQjRucdXdMzC6TZraT+bxU+vx6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Je8f5NCEP9ppoCNHr4EasJJjlfLrzVe9yU/TCNegJxJADLkd5aoJWHZ2BcGTrrxvS
	 TzLIm3D+h4er3LTN9FioIxkecqY4T52+BRHeh/U3WfzaiwKd5+38eIW/JpV88Kms2G
	 90r3Eefq4j1erEFdo8SwNSLhyZs1I4VFcuH0M/MPVdugB9PJwqZo6IgYMa6EZ4SJJb
	 3IrB+LnEp770Za0cLVYd3v97C7pOnrgzDVkbUDuMyAvQWBoD2bzpGD21gCSMbU95Fp
	 LRcF2mZ4PHoDrsanl3o4P1FkE6a1R6eNrTyn9GmyMhc93SZiEMUqBWTpcfGQI9mtTO
	 YSXL/h/SzkwFg==
Date: Mon, 8 Jun 2026 22:06:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_wcheng@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: phy: qcom,qmp-usb: Add ipq5210 USB3
 PHY
Message-ID: <20260608-nippy-devout-potoo-0b0656@quoll>
References: <20260608103344.2740174-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260608103344.2740174-3-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608103344.2740174-3-varadarajan.narayanan@oss.qualcomm.com>

On Mon, Jun 08, 2026 at 04:03:44PM +0530, Varadarajan Narayanan wrote:
> Add dt-bindings for the USB3 QMP PHY found on the Qualcomm IPQ5210 SoC. The
> IPQ5210 PHY is compatible with the IPQ9574 PHY, so add it as a fallback-
> compatible entry using a oneOf construct rather than a plain enum entry.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 46 +++++++++++--------
>  1 file changed, 26 insertions(+), 20 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

