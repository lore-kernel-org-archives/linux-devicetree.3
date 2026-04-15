Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153B62C375A;
	Wed, 15 Apr 2026 22:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776290782; cv=none; b=rorsPRQI7BdBNjp6gX5nUguK65Yk+sRlo9r2F9poJ65ViAl59/2kZ3VZWPEY9+z8o0b49eu9gG1Xsnf/dlJwSEtOox5zR2NbGUMauAJWx4gtOrSx6iBXJHeUEnTreRAug4PPvH3ymEKvmbXFDaQAzxeUacGZdPqbDrorGCS7qeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776290782; c=relaxed/simple;
	bh=xBM85E9FRL9wxRj9wgTrZT+Qajy2JJo0C4Si6ICumEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q34QLrnuQl1Gy5M/SmL1VEFETt0+I7EMYT23ZtcSyRaC8GwXYwWG0OIwa3PKMFjEwJJCKfXUYxWOjbbA0g8zl6ncBNXymp/N73i/rWK/3aEC5uwrKAP6TJoAn12nVKlC2Z0fr/ibr/r+nyvZsi1eUf/knO05knhdV2KbtK8I6Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcmutZJL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcmutZJL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8013C19424;
	Wed, 15 Apr 2026 22:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776290782;
	bh=xBM85E9FRL9wxRj9wgTrZT+Qajy2JJo0C4Si6ICumEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kcmutZJLUo2ytOeU4oxccTrwEtBIttbVruKnqqPG8tGkP7NNxWv7euKRvH1iXISli
	 o3LFlq0u1Fw0hrQzPeZYqR+iXxn1Z29eMZQHqnEMVAWRg4YpZnYmlrJW7Hsepsyywv
	 MoI49STOBJNIC0nAEWCBQZIFYdNKMh0hMEfBQKDKMNVq6zxVc6lcqwcdaRd2plpbM3
	 Sb1pfFaFM5vyq56mIVGQ/Y8DciJ/jFfFzJ/JmAPz2eY4nlHqtNuvtQ0gHsutiWZsBk
	 T/WsltItZq2FkQ1GAE25xwGLgmxvCQK3BfrGFhojiRHx8chlgH8tA9hotS9JNjliAy
	 z87pRVPBtbu/g==
Date: Wed, 15 Apr 2026 17:06:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	freedreno@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 3/8] dt-bindings: display/msm: sm8650: Correct VBIF
 range in example
Message-ID: <177629077925.746715.12299768843152635858.robh@kernel.org>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
 <20260405-dts-qcom-display-regs-v2-3-34f4024c65dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405-dts-qcom-display-regs-v2-3-34f4024c65dc@oss.qualcomm.com>


On Sun, 05 Apr 2026 16:33:59 +0200, Krzysztof Kozlowski wrote:
> VBIF register range is 0x3000 long, so correct the example.  No
> practical impact, except when existing code is being re-used in new
> contributions.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml  | 2 +-
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

