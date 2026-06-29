Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F9538C2A0;
	Mon, 29 Jun 2026 07:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718067; cv=none; b=CnkDZeJsNFkr1mEaMoad57G9ZxK6Jfbjb0y35h4Kh6x1bXXJlm0dIJ0VdMCMvJcmbSb36auHHciReQARPjgcDWpkHwDpFpwp1eFAmYmM6KsGV/XEYr+wSuQyQDxoyf6PTwTxiCgvLEg4eu0trkZcXcL1gVQ1uMX6nu1smcFTtNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718067; c=relaxed/simple;
	bh=XkGgdWedqB2yI9Ho51BiY/aE81HGUa+RbDdRie7fw78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KM9C9Fue3xx86Lhwt5pkqOD48160LwQqV+pw9+UXAoYIt39EV905KMT+aYf8ycpGNHcas15tsNkskpmA13uASuBh0W7jAZvah0Pd/3g98DJY4O1hg97n6mJDkd4riUsuXc93vXY5HZdashH0oxDpCY5LdTvyC3RlEbw1Kezibq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5541F000E9;
	Mon, 29 Jun 2026 07:27:42 +0000 (UTC)
Date: Mon, 29 Jun 2026 09:27:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom: Add IPQ5210 APCS compatible
Message-ID: <20260629-boisterous-lean-bloodhound-ea0949@quoll>
References: <20260629-mailbox-v1-1-3b75ae87c4b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629-mailbox-v1-1-3b75ae87c4b5@oss.qualcomm.com>

On Mon, Jun 29, 2026 at 10:10:46AM +0530, Varadarajan Narayanan wrote:
> Add the APCS mailbox compatible for the IPQ5210 SoC. It uses the IPQ6018
> APCS mailbox compatible as a fallback, so document the valid compatible
> string combination in the binding.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
> no cover letter contents, it is a single patch
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> index 1b4ef0688ca7..39bc374300c3 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -19,6 +19,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,ipq5018-apcs-apps-global
> +              - qcom,ipq5210-apcs-apps-global
>                - qcom,ipq5332-apcs-apps-global
>                - qcom,ipq5424-apcs-apps-global
>                - qcom,ipq8074-apcs-apps-global
> 
> ---
> base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
> change-id: 20260625-mailbox-01f977bcceec
> prerequisite-change-id: 20260625-apss-clk-ed39c40ed468:v1
> prerequisite-patch-id: d9efdd8a09b028b1343243c5f0e78cf3e8b1e253

Same author, just squash them.

I already complained within Qualcomm about this more than once. On the
mailing list, on the internal company-wide open-source channel and in
person now when I was in Hyderabad.

Repeating the same is waste of my time, easier to have blanket NAK on
your patches.

NAK

Best regards,
Krzysztof

