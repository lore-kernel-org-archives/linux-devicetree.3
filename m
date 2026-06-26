Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CB13ED3A7;
	Fri, 26 Jun 2026 10:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782469230; cv=none; b=oeQ5UIBb/MmplU84hz1YTHzz0kaGUrvV4XCbNk5567usuKp/zTmdqu2SfeHYdILQF7Z8YAG0D1ElFthNURH+csMg6NlpW64pIn/RlEVevczxu4HkowH6eFlkqPpbfa5XstExMBxzPdR/NOj2StDPDRehTDxjvr5I75mHgjh19D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782469230; c=relaxed/simple;
	bh=cA4bqx8KhbMCX1Ji7f0/tsavrsTBEJPeJ/BUQgSCZDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4Ww866lJLIsr+xKRF8eke5EbmyJyOU19nPhIDrjOGyDzEc9UvCB6coEHCELK2O/s76VH4DTNzCcY206ICdbOz2fFk2lzm+peJ9x5s8uj3AIaTvBm3zdjEKJ7D1jlT7QS3Ln5hDwWqdsesoBLXTtAjMivEpst6+yc/S5MIAIJ/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbVd2XT7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbVd2XT7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79CC91F000E9;
	Fri, 26 Jun 2026 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782469228;
	bh=5ulkSddQAHOxiSQk3m9xueItocxgNHAwiG6q2cpaoeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GbVd2XT7c2UKSUEXOXOjCQ/vOccTGOK9UdnmcOVj0drOzY622DcjYSh5c0o0T6W2j
	 PYXRpsVDgvJ+3mKWTG3WQbvB9mjT4ncgwCUoBKeaRxf8BTIFVOpySPIlfzX1sTkZ+9
	 Lgfb3I/Bp42MsUJyXbHHKtvnE2whf87SGvDol7zS7FEx9QPHIK28Dy9W1RuCSvhYK/
	 /bPQP2cw4e6X5+lHWUXctTd2PojWL+mQX020NzjYtBB6zr5+mVzxbFOtab70FyN6TM
	 yzelRHJwpyIAlZDMTh6Q13DMnuAQZ4swxl/CTFV9D0NECzjCIWQ7qmki9muwc0FbfS
	 WYckOW9r0XO6A==
Date: Fri, 26 Jun 2026 12:20:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, Mahadevan P <mahadevan.p@oss.qualcomm.com>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Add HP EliteBook X G2q 14
 AI
Message-ID: <20260626-grateful-hopping-dugong-c2fce8@quoll>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
 <20260625-glymur-send-v2-1-00905324ffbf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260625-glymur-send-v2-1-00905324ffbf@oss.qualcomm.com>

On Thu, Jun 25, 2026 at 10:47:20PM -0700, Jason Pettit wrote:
> The HP EliteBook X G2q 14 AI is a Snapdragon X2 Elite (Glymur) laptop.
> Document its top-level "hp,elitebook-x-g2q" compatible.
> 
> Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

