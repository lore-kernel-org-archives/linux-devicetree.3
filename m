Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5711A38E8A3
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078041; cv=pass; b=KxL1NA3LjzpU8SDoA1+EVjKx3NLvFLCjHEMk2H2hORkPDVAVJPMJhT1U/NcN9iq+ZeMKAGovWH9XEPmCbBdytLZUICHYvZOw4VwysXjGCwKJHSkDWGLM8dYjj0pLMgQwrVHZbPuJTCptQRGQ4ZgRl3oj8ZHl6YM+yYyztI9WW54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078041; c=relaxed/simple;
	bh=FirkQ9b3WjcBRyWWTk9l4j2fUhJzIUeGfuR4crWVpwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ljk+DbmoKztAebnRpJajdkLXcZEYH3WTPe6ij/GyRd8TXjGWR2SeFlMxBGd6i+gZtZNt1R8n9zz0A9iN9UVYi1kxX7jW70TFTYWvRCVOpcs3e9ZApfOw8huvBYrxRd1VdHSlr1DspbkOytDmkuJUH8wzwRFzOaDnsDKoxtLCJdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V/wa91DK; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V/wa91DK"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bec3ffb95dbso1066557466b.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 00:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781078039; cv=none;
        d=google.com; s=arc-20240605;
        b=L8HJhUk/PsKeX1PAJlJYkaC9LtNZZlJ8GY9cfo1IQ3DWEohOyXxp5eQC+D6Hotses0
         QS3iSYtjl133Cyyu7Gy/AfAinVcU1sLpk+NQpjTpKKEfrfPHNYRnXj+ewysW2o5U97Wu
         4DQDlmiGFzU8oHKHF0rs7d2N3PX903xrQh1D4PSB1Yl/WcMi04VlkvWWYBYv8WGnnqLM
         WvqRir29haTWdo8j7Wfn78dHsCuoPpsk1JKPC/VTFN96a9hvZ+bciy5jhr2j23kdGYcF
         RmgIXBBN/hQSGkVIR+GJFxdMp8B3lhTxB9yiompqispnE9sfgiKBGdx/n+Xp5UP+fS0v
         1f5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kQVHlh3s1LVk2DUq8WGmvLFnNuxxdslZRijXwJj3LTA=;
        fh=F/cb35ozDoEXB32EZ8hAVWmt+AVyAmmkAsIqVQtGPi0=;
        b=APnJzkqTf2rFymKZWRD4j//ncimlBtz/TC2omczY7FpRnHFJhbfs2+Cw63LpCvbuWR
         OKDgb+S3Hr+dzyu086OuT+8uliyOQ4DsUhXVOCx5LfOG6GsE1gMBuUiLcHzTKDyY6vky
         PQX1Af0TXICLQ9EiAEXRhmQBvcZwNYF1WxcC2JV/idVX3douBMheuMM5ALjzTDDlyRwY
         vxd+azmQ/MvDREn2vE3CgTtmgkygXqEop34s4rEnq/A6/IaMzz8ozWKhM8oh+3sNfZIs
         PV1umSMbpQn0fThnXdJXxBpPvG2PojFQicV6iTeoPCxsLDL4KxTXTsvrrlrwVtgfp6fi
         X3Ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781078039; x=1781682839; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kQVHlh3s1LVk2DUq8WGmvLFnNuxxdslZRijXwJj3LTA=;
        b=V/wa91DKWIImVSxUTa6NO84KWNEvsYjd9eOi72KMswNDVQocj0Zo76yA+9VVru8iBG
         rTkPzY8Kyjzafq7AQSHKtjPZjEjX3rcaFuXDQqXm84K0d+NPJXKUA1yIlhijH4ONPurV
         GA1t4L8DI1S1IBtIFXqc1knUil6h2Ioh37FUkQyCc0VQsnw3RnT8am+MThZNglwTg4Qp
         GyhbGoQZmHLR1m5SR+nL4pZRwhELzuCVS+cokT9eH2UyhYcQu+4pTDBqZyfCcJauOaaz
         IJf1SB2oFStPuhS9hhrtjSRc5yV8S/EsaZXEnDd2UbUIBvqjz15zk8layGNMKop66DRm
         plGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781078039; x=1781682839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQVHlh3s1LVk2DUq8WGmvLFnNuxxdslZRijXwJj3LTA=;
        b=YFNOtpBhldM7j71+GNiJtNqNymzDlRTcuEMgz69WN8ZabHLjJqyKUnLNZ4NID+zNru
         iVaqx8sv0/0gL1dW8PRpMHVwZhkQBY0RrBD0NuOhAhGg48k3QYV2M3SrfuAJE/gCdqnA
         OGE4NUfs3BZAaJpE7g8marnbkNSA0807kELzYXqZAyzH2mS+vnGxnt24/kg+jVxoRUGN
         JyfDQY/x9gSTt3XJcu5m5a8nAYi/9bAoAFtWScMSOiXuT+jDDG1g/+9d8bt+ILJKWp6q
         kdZF/pda4QIRNgcG3Kyk2C9GtAj/zoIO715Zgp1xfAetjQjRpMBD9XoCpcHoqtSi7bGI
         zJXA==
X-Forwarded-Encrypted: i=1; AFNElJ+lUVHGLN3ThKc9G3M33hpFZGIRNee+BzAOsd8UcF8f7ro7J4tD2e25Ffo+ycJSdPgM5HLDDMp9AzT0@vger.kernel.org
X-Gm-Message-State: AOJu0Yzykc+kVLLZeyAvwISUQ0XDDhQuyBCw2MjeK13Z0jpuhNwQMIrX
	bwv9gX7W4jLRjddAlZizucNzh/G/Z03YO0t1koF353HduWUawvrlnid7/8SyRPNKRNOVKGo+MLJ
	k/GrlDrrxkX76lKyCoVYyDuo+ZQ5GopGKWOIxcuKEQA==
X-Gm-Gg: Acq92OHea6KN8nwdce6tk2luQS2xfzdqvKWEQow31sAbGSR2wihcrsAwANMX0m2e8Ug
	vAwVxudxWZGeT9I+o7JEHDhWox5Xsc+gMSYtX7+QAjWJiWBB4ffLrx2x95dw8cGdGgk93kPLDC2
	uuSZ5D4pnZ0VZwFPbCE+1glZl1CPn6w7JeXZ+UZblbNbDL/RdWto4uxMNvMYcGYQocaoMFaVTbl
	d3qRD7ebkm1OGKBiITCkV1w6FLRysmJl5TLAQr3EF5MhomW+vJljFd492MS2+14dRpLdr/kzYSS
	+t10hRQOIpsoUZDhb6q2kjA8n+6azyQZYWIO0CgxEb0E8k7ObvSA
X-Received: by 2002:a17:907:ca1:b0:bf4:6aca:6ff1 with SMTP id
 a640c23a62f3a-bf46aca72d8mr639120166b.49.1781078038780; Wed, 10 Jun 2026
 00:53:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260610050335epcas2p3ec1c019e86b75e9a4edd965a8b27ebd3@epcas2p3.samsung.com>
 <20260610050326.2903402-1-sh86.bae@samsung.com> <20260610050326.2903402-2-sh86.bae@samsung.com>
In-Reply-To: <20260610050326.2903402-2-sh86.bae@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 10 Jun 2026 08:53:47 +0100
X-Gm-Features: AVVi8CdBLIK1BYMIyty7W9TdEhhqe-w6-7EwqDM-mk3y9etMhibeEUIwfHY2zNo
Message-ID: <CADrjBPqhODqeV36+-758h_=34YrL=DYHJh5vCwB+Q+qeEkOHtQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: samsung: exynos-sysreg: Add hsi0
 for ExynosAutov920
To: Sanghoon Bae <sh86.bae@samsung.com>
Cc: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, 
	alim.akhtar@samsung.com, kishon@kernel.org, krzk+dt@kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, sowon.na@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Jun 2026 at 06:03, Sanghoon Bae <sh86.bae@samsung.com> wrote:
>
> Add hsi0 compatible on samsung,exynos-sysreg
> To support ExynosAutov920 PCIe settings:
> - PCIe PHY power control
> - PLL settings for PCIe
> - PCIe device direction (RC/EP)
>
> Signed-off-by: Sanghoon Bae <sh86.bae@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml   | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> index 9c63dbcd4d77..fcdb9ffd2644 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> @@ -37,6 +37,7 @@ properties:
>                - samsung,exynos8895-peric1-sysreg
>                - samsung,exynos990-peric0-sysreg
>                - samsung,exynos990-peric1-sysreg
> +              - samsung,exynosautov920-hsi0-sysreg
>                - samsung,exynosautov920-hsi2-sysreg
>                - samsung,exynosautov920-peric0-sysreg
>                - samsung,exynosautov920-peric1-sysreg
> --
> 2.45.2
>
>
