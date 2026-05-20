Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCBE3D5647;
	Wed, 20 May 2026 10:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271853; cv=none; b=Mckp/PPVfR7y4/qrNqgDenfvehuShax8Ebk9wr2dafD2H4F53q6azwpoTZykIp2NobbnddCO6mqDiQRfywgMHTSX89LPsKYDsyCx4UdgIE5MByGPTwCF8syO26kWE+rQHxMg/2qs0xZZij+RhjgoFfJuJddy8szq3fI6cn0xq5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271853; c=relaxed/simple;
	bh=A/J6LuQOCipshQbzSQ2Z78neUa69ptzf7U/s5KY2jEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZcXsw/DVJvhfpUPHvwwIzBOI4XQ7LQqxH6z63eHm11a6aXJBm+KR3gsIaDQNWvNOQkYEVtTRzmXG7V2aWdohpNJfo7PsWtGRCnhSPFpYajpphb6NTa5kYu9f6XEi4W+99nDZL2D1A5CPIOhBtDk3OLFSaR/bE6oUcCccGnxpcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wh4BBkVq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wh4BBkVq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3880B1F000E9;
	Wed, 20 May 2026 10:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271851;
	bh=PivbowipV9Jbg+LCX/X6AF7+nET7mHvJSKbJDIeRSX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wh4BBkVqKEH1+DR+r4Xmb9vgKlV3E0QXlX9Yy5Nz35DXcWOGq4/DKKXwV58ipkpCD
	 DpZxBIm3sd2dGrdE1GgWJS1zj7V73NThaynQnnoGv17Uimu+PqOUvaZonX2ZpF7t3y
	 jIZDYiqvIpp681R5iRYq/nUx06Davk5iMJOzmtViK+H62eHEGZyFwo2BxnHGKDDoZM
	 oyEC8pOKUBlFNO80ILg7iDOVYQtGo06qqABOvYVmIp9fVIT/Vo9B/KQL3oh7ApMP74
	 0yMcA5bw9uChl211Fv9HDiw12OFFSn1KYd5+1ZfzsFKRurrfVOrzmG8Jq+aL8mbHGU
	 FPEOsdXLVYAgw==
Date: Wed, 20 May 2026 12:10:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Document Eliza CQS SoM
 and its EVK board
Message-ID: <ag2IopOAMyyNd6-X@quoll>
References: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
 <20260519-eliza-dts-qcs-evk-v2-1-ad7303659d24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519-eliza-dts-qcs-evk-v2-1-ad7303659d24@oss.qualcomm.com>

On Tue, May 19, 2026 at 07:09:52PM +0300, Abel Vesa wrote:
> Document the compatible strings for the Qualcomm Eliza CQS
> System-on-Module (SoM) and its EVK board.
> 
> The SoM is populated with a CQ7790S Eliza variant, PMICs, LPDDR and
> eMMC. The SoM is then connected to the EVK base board, which provides
> a multitude of connectors for peripherals.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

