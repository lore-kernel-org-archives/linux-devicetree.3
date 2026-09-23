Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57BC46EC70
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151515; cv=none; b=CIoA4rcIREynAbLf+Vr7a4adyjG3LC3KavI3kq5BqpTGornUozjZuvYwZQjYuW++3Q4Yv7ULvWAsS2ZdIkk5rq+ER0O3rmCIwyR/bSMIK4AqeiZDV2WvMtZqxGLLXZCRSCup0v1WX7qORS9muy7ZYr+dC/GOmJA1jFQ1C4RRe8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151515; c=relaxed/simple;
	bh=aOYE/Tl0/743HzZHqhMOY/z8sqYDx3bnvebki0Vgqmg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LiaYlCnfYyJCVYyiP42bPDoCG49Of0Hciad7DpYXx1Ctq3LWcgEHM/gW9ZIpHuRxKDeCez8Dh0i69AtrQQz+o+DgdpQGRk13xbgSddHAE2HIGu52nAS2vuPJV9bFXBnbRrG8B8VjTB05MiRRj5bUVChFh2cnPkxVf45YviRo9sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIi3W8Sr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIi3W8Sr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A067C1F00898
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790151513;
	bh=aOYE/Tl0/743HzZHqhMOY/z8sqYDx3bnvebki0Vgqmg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=CIi3W8SrDkBFcjl2qACR1MIg4WYW9VPFLSEVLoEyaFDFui+ojphVMt9fiSIb1T3/M
	 t18RtJpG0B+3QOdvzih9x3iAm4GFN4rVIGgQwiYKEIp+FY6pskPTKko2tI4PzIJMSc
	 PKkbxTNRiFM2uvwBhX/0WYK+DdXXWmNKE+8Yp0nrCRDs6UqtxVOBRIAHCGsDvybasr
	 qIdcmNXwyufVS6DbzH628ihy8MQ3dmZ+papohYt1hEv+VRtq7EnbJnE+Fx0cw5BwJv
	 LUYz2qaixXE2oGuxA+6Q7b/3PorfDvFvp9VF5rD+2rl8xrlYIQGBVH3ludsrvoIktb
	 u0Tc/RhxoPcKg==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a302a4e42aso4276821fa.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:18:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxGjsgrNqr5O1byMTIAvuwZRF/9Npj0FJ5g7zZ2eRa/eda1OrUBY2k3csDlnidusY/lUK+nm77eCY18@vger.kernel.org
X-Gm-Message-State: AFuF++nmRFes5cKKLVWOzV50MhKhMO6+lwwXlzP1R6HLLMlUp9sVm0fh
	2ZH0hsfWxpsyx2b3WbqMdglNKEZxvJP5tbHCgG77eSkWIy7Mvl+64/vY3Lh9+yzFTCJDGsCi8Hx
	3eQVkhbLnSee2skhfzMcvCOqVuhxY567Ln+7sMixyUA==
X-Received: by 2002:a05:6512:110f:b0:5b6:183c:5c98 with SMTP id
 2adb3069b0e04-5b8d89b6776mr545891e87.54.1790151512285; Wed, 23 Sep 2026
 01:18:32 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Sep 2026 01:18:31 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Sep 2026 01:18:31 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260922111354.533902-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922111354.533902-1-shengchao.guo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 01:18:31 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mcmko7oVkRWuGX1ZM6WdLdEBCC0ruwVqJiEsUb5nkhrog@mail.gmail.com>
X-Gm-Features: AclHuK8l_GomYsmy473wjIZApEtMIZ8_bdLcsbHMxcEoZDreibPFTIVAba0mhAk
Message-ID: <CAMRc=Mcmko7oVkRWuGX1ZM6WdLdEBCC0ruwVqJiEsUb5nkhrog@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add adreno SMMU nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sep 2026 13:13:54 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>
> Add the Adreno GPU SMMMUs (MMU-500) for both GPU instances.
>
> Wire up the gpucc clock and power domain on both adreno SMMU nodes in
> nord-embedded.dtsi for embedded Nord variants where gpucc is available.
>
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
