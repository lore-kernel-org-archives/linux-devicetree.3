Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0283633BBB9
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066961; cv=none; b=rs9YEPjiXvmwzupLZ/lomeCj3dVhhoo9S6HVbV94yVUmPOpGWT2wIxI8Z78nAUwVUv5FDpMh/g2oubnbKJ5hE1RzzYVyn9q+bDpx8yvVPGK3OgXHlXY04fenNs9xy7ABCYpjSDobVQTMZZhZrjt9rnwH2YoPH7kIQrStszC+LeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066961; c=relaxed/simple;
	bh=vLVgW3xulLa3nCqtqtWHvnpLz3Ze9clktRd/QXErZG4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BFJ5UARlxGmq1pq2fRK1blCGd7tBkUc4QkkuFTrTHNTgAzJBhPAjOYOhsQ739TTTO1MWu57oDDV233Ml7j76IETxk4MU2OFycW16FXJywH4PHw5BF7XiiuQ3ZocPyNW26tad2u25v8Defgd39XTRbmWu04IInc4AxJAmiZ/hjlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+7N0sLp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+7N0sLp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F2E1F000E9
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783066959;
	bh=ywuJ0AZ8u1hP0D95hIbh7X9+0JfEtduzaP9JnPgxj/E=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=d+7N0sLpH35mDzs/9JKmSII1SjW1ma9BUJbMPe+N2VNH8WDlVTIfORYwkNo1jkstm
	 a2/ispO4rTyIC8hb4QV6c9wV9WMXbzwsw6ZOGsKEJK0GNdhwHuIAEDUrgK0XjbhxaF
	 46zaVHdJIPFTjGTdgdGnns2/+rusj0JVuQsRGVpU8JwYFVRqAfttXWRLY/GyrilpET
	 za7dA+P/kwj0blMgHiXLy50QuiHL+OKaz85mjebhpKrfdeMYY/QSr4nxeHi1B2RrpI
	 CSTTvihq3aiVlnqkDcJSHxRl6gEHfR8GqPGeQsGEDcp0AMVMDv1cnmZflcHx3PXn4Z
	 aUrOoFV+6+wNQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39b03d41976so2509291fa.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:22:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr2W9eAUcMELsqkIMHPXcGhYnUA8LMJSHZk/qI2ctqB0JyfbrxUbkAFVMRLBygT9HfctsKzwvXMAMse@vger.kernel.org
X-Gm-Message-State: AOJu0YwmOFVfJPjx3Vuqt6raCY5Ky+i1Ho0wqx9oKuSZJ0uYoNKuFjUU
	MneKctA1g90qr76Ga6r8JQWmWbgaOQQPKvDqF3igiOOAe14ypXSjZ+i1l2ZkgHcgy7CebfiRWr7
	D0/Rqr2AdoLan6VFPcxM3oDNMfloUvujj+ioxp7zOqw==
X-Received: by 2002:a05:651c:154b:b0:396:9630:5ed with SMTP id
 38308e7fff4ca-39b36e4249cmr20150231fa.15.1783066958510; Fri, 03 Jul 2026
 01:22:38 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:22:36 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:22:36 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260703-sm7125-samsung-v1-2-3e5f752048c1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com> <20260703-sm7125-samsung-v1-2-3e5f752048c1@gmail.com>
Date: Fri, 3 Jul 2026 03:22:36 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdgFa52SLZwmaNNfAvQqfAdJ_6y3k62FoMZ7z8qdzjydw@mail.gmail.com>
X-Gm-Features: AVVi8Cc7bwuKMYohPWqp1zH4CSCcBUAXYimhNm5HsDqGhbfxgP0goQuvcz_VCfA
Message-ID: <CAMRc=MdgFa52SLZwmaNNfAvQqfAdJ_6y3k62FoMZ7z8qdzjydw@mail.gmail.com>
Subject: Re: [PATCH 2/3] firmware: qcom: tzmem: disable SHM bridge for SM7125 platform
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Vitalii Skorkin <nikroksm@mail.ru>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Jul 2026 09:59:39 +0200, Erikas Bitovtas <xerikasxx@gmail.com> said:
> From: Vitalii Skorkin <nikroksm@mail.ru>
>
> Currently SHM bridge causes RCU stalls when booting. Disable it for
> SM7125 until a fix is available.
>
> Signed-off-by: Vitalii Skorkin <nikroksm@mail.ru>
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  drivers/firmware/qcom/qcom_tzmem.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
> index 0635cbeacfc8..50f500834758 100644
> --- a/drivers/firmware/qcom/qcom_tzmem.c
> +++ b/drivers/firmware/qcom/qcom_tzmem.c
> @@ -81,6 +81,7 @@ static const char *const qcom_tzmem_blacklist[] = {
>  	"qcom,sc8180x",
>  	"qcom,sdm670", /* failure in GPU firmware loading */
>  	"qcom,sdm845", /* reset in rmtfs memory assignment */
> +	"qcom,sm7125", /* hang in rmtfs memory assignment */
>  	"qcom,sm7150", /* reset in rmtfs memory assignment */
>  	"qcom,sm8150", /* reset in rmtfs memory assignment */
>  	NULL
>
> --
> 2.55.0
>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
