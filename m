Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A093D3750B6;
	Thu,  2 Jul 2026 06:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782972726; cv=none; b=hQd1R9vjRG+n9DgHq5uRByo6MViGBqOUhNV+rcHlDFZBCKd/0tcBpSru2lANHGUegUqursCaeUKcMH8D1/eA7i3om0pNkznfWKOVouFea8dGqu2CkOBm62gET9rcdXTvf+J7G/lAyY1LkpST/gHkAwTpUEqJHNMset/G8hDx8wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782972726; c=relaxed/simple;
	bh=hduswI07gJ0MhnGZKhJ1tUTJH2beaihRK9u1YpLbwcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZROya9GPohkHv7pX00eflreIXgNmzBj/S/hA8u7l7Ul0j70PG+McRblMreHKVNql3s4CB2Q3oCYhdaWxavTar8FU1yjgxsFQlPw8+9XRj2tTFAW8zmATJitW+jCnU+cj7JSQ7iqCc2mIKUEg5mNirkHvRxQa/0I5CwLKOqSbG+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnUFleNc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SnUFleNc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F1C1F000E9;
	Thu,  2 Jul 2026 06:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782972724;
	bh=jRGcvDR8CBDSOCR6Lp8cAuCESyy8VVvYP/0X1by0aKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SnUFleNcPFIoaWoy6G/bsLb/VGB6k488wokGtCyxiFdgoiObEYFbslQia8LfZtFoL
	 3XQZiPSTn1W6JoKPD7vhPqoTnhsYHqsePKdmtup4uFBBJ/K+CUyusCA5XlmlDBPfil
	 40rhh9QDGFEK4oppNCCgFFVFOmcgpHlON0Hea2ktvQO+PmcjzAeH4t8BnD0EF51Zfk
	 BNJnTinpX4YqEHrrbzA7dVH8/C0oFWTn9mGLEQJoExfdY3ceteirKCVLUc8NGxdH2I
	 24dDGOzqierzJiImYzQvym0bI4jBHNgTSZ4My+FjyPHwi1ZlepdH5UOhmFRRrgJfBM
	 /802g+lF6IhPA==
Date: Thu, 2 Jul 2026 08:12:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, 
	sibi.sankar@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com, quic_srivasam@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 1/3] dt-bindings: soundwire: qcom: Increase max data
 ports to 17
Message-ID: <20260702-monumental-inventive-malkoha-dcfe7d@quoll>
References: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260701163115.3701298-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701163115.3701298-2-srinivas.kandagatla@oss.qualcomm.com>

On Wed, Jul 01, 2026 at 05:31:13PM +0100, Srinivas Kandagatla wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Bump the maxItems from 16 to 17 for all qcom,ports-* properties to
> accommodate SoundWire controllers v3.1.0 with 17 data ports.
> 
> WSA instances on Glymur has 6 DIN and 11 DOUT ports.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../bindings/soundwire/qcom,soundwire.yaml    | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

