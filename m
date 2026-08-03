Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF8638A736;
	Mon,  3 Aug 2026 09:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785749444; cv=none; b=doA/JtiuwFCi522i+mfwTT9JhYMVJqHVvGTpYpyKNYkY7bn0QWSirbC8nhlqBlsT7HZivcel+v8wTlj0prCMJ3iztdfAxVFtlS2G41mlneE++MpcmbVxdxITySqjR9kth0TF4sg2haaBwEsBa0RvSvS/pPrVTQ7YBn0vIsCPuRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785749444; c=relaxed/simple;
	bh=Exk59rmbTaq5NmU43zTeMmsopBWmlMzispDDwmKx7d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5yVh4zOvwef0zbmI3TvNUK8iZCy/n96TMkSUckOv5j1nLH0JXdsVbNZrEaLn8xPKFcug2FgyGzxwES9KZPVQf7rpeBxi83ZJKf1tiKTV+/sAN8m/OiX6NpBVw3v5Uol322iULdBE9AfqAbMSN7dtHko8jsMykqojz+zkxpAQYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oaFcfiz/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oaFcfiz/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1E01F00A3E;
	Mon,  3 Aug 2026 09:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785749435;
	bh=WqJ7leuOpfjMkZK4XKhIdUvL7igZAF01XndvgIb22fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oaFcfiz/JZFuZDMT5th4cRErmc3idfS757GYbGObjRe5AauMRdiLAkqTKLftOZXg3
	 9KFoaLvz4LXGb8k1wIqqht79hCfbWCMDmBeUqMaJWG/iFwQJybP9B4nzubT5ipYqaB
	 BDWEiPpZzECLv3X9RAd5Uy8LxT+2xNEg+5QSDxqzZt5Mo9yJ8R2AXTO7R6c8dIbKiK
	 TXYnzdvCHFWmbzkATeg5RMRVxe2YYwr0Ej17wIEK2zT19wsx+Mv2Pnr0+nEwWie8pR
	 WsIu+OYSxoWswApGx3M3OragHZnhKqhSaY9DOLYlbdqbI9le1eNPC/bLUgI30uKIiP
	 IxhiOxNNSGt8Q==
Date: Mon, 3 Aug 2026 11:30:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x
 Gen11
Message-ID: <20260803-eager-phoenix-of-greatness-cdedb9@quoll>
References: <20260731-topic-yoga_submission-v2-0-f1887031da4f@oss.qualcomm.com>
 <20260731-topic-yoga_submission-v2-1-f1887031da4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260731-topic-yoga_submission-v2-1-f1887031da4f@oss.qualcomm.com>

On Fri, Jul 31, 2026 at 07:59:44PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Yoga Slim 7x Gen11 is a Snapdragon X2 Elite-based 14" laptop from
> Lenovo, featuring an OLED touch panel. Add a compatible for it.
> 
> According to the spec page [1], there  also exist other variations
> (based on the Mahua SoC and/or with a different type of display panel),
> but those are to be described separately
> 
> [1] https://psref.lenovo.com/Product/Yoga_Slim_7_14Q8Y11?tab=spec
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

