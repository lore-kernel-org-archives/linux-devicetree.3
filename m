Received: from mail-ed2-f29.google.com (mail-ed2-f29.google.com [74.125.228.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348C73446CB
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483202; cv=pass; b=CPwMdTwaqPzBFYZbCpnMKyB1GEhCJ0xXrzzQk8M4IpA0nOCcb2xtFwEdqlLgUgvM5qY+Z2N9V05mthHjgEc3e6ymHlycspelHL3n7+z3jO+M8w5GAXwYrnN5/cFw++tCMQrHWLYsrc1Lq1AiaAAYtORnCYSmQK8xG9C3fxM086k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483202; c=relaxed/simple;
	bh=bxAXDKKvJla3W1iIKPwj/ImYJtcT6TODMkzHew3uDnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMW5qRCqwH6HcP8SLeSegj6KBpcU8pxijrLQdLhtaKUyd0TcyNvLcHI7dDYPbRNKCKVbqmtdkQf29GdUA2+uIzqkXysmrbn/6dU+0D313bscdEiNSIH0j8rabKafdJcCF802e78Q/P6qkUSdqj2tOTKe0i9HAYBIBKeXnbMnyWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HsfwtDDv; arc=pass smtp.client-ip=74.125.228.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HsfwtDDv"
Received: by mail-ed2-f29.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso722297a12.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789483198; cv=none;
        d=google.com; s=arc-20260327;
        b=HBn63u3WgbnmYAHDpHJMijYzIKU9UC0O2kUD8lNBrABxEHN2aHtTcjvYHTWTl4Gshj
         VSTmii8wFhZ2OVkhtvdO5rQJoEvktMbZT6MIALUCyvbIkGxZrexwS0UHgFu5bcATnl0h
         N0oPjtWWCQDbP1ELBZN/ul8jKTICIrez6ysIVciF7ZoQR9pLePML+ik7E2bphxV3qkut
         JCEQEfgss+cIA2dhmrmTjHjmuvuNkK79tX0mQrr4cKROXvVCwZbtdaxjyRdEx3GTenEP
         FJmnHAH7rwIDX4JjydwOsTGcbvu3f2sh4cw5jrWuHcwjIqSNzUFFXLnA2BI5jMAja37r
         PbWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3Xwa5YtOq2I0pAIeBe3GC0dtIeA/uMMyehMpms7xKhI=;
        fh=lR7czlHmPCHcB8ZRIKt1GFsNVOIyBE6NGa1I/WhZxe0=;
        b=nCMpU2sTAyqQpQebqytaT/3UlOagCVvRifujSy4NMzAcmsioBKp4sIElLmMzwKjrlf
         dRYjfKGUwoYRb4BtmfsdRifHn/eg+Lnc+uQI//GMb3GNgjChneiX5w/3oKGkCZmwfuxd
         IflnCOvU0zjFLG3RpXtArLu3PDPziunu2OGqi2uTAY30EuUSmu5UqUPZYABxRb/6jhTR
         p/P4H4Wb376nRRXEWQ6GxQfeaet6Z+RyKe7uqvHp+0sCBq59JV+2cSVab7LuxxiqBHZW
         myQWJP8Jftdz4T+Cp1SIXtBOFvGAGbKzBZ4c3cFbW0cC84h/6YFu3sfTGTjWvBZQA3GG
         ttwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789483198; x=1790087998; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Xwa5YtOq2I0pAIeBe3GC0dtIeA/uMMyehMpms7xKhI=;
        b=HsfwtDDvtnLaXd4IM5o8j+x+NH3OWLAiok1HXT7Wx6pKsPHwC3EFLXeGfKsjuA2Yo9
         09hcNWo0ov8EZRG/dc9I7GaCfMVXcABmOV2oqy+lnlrG4rg/pRFeKazbQRCUoozhF6mM
         fS0pQZOLLqgtI1X2M0On+TKyJqnPHu9BTxM6GVWvwt3Kg4IXnKaZCfN1XqV/MOB5qatw
         /RxAPExpFX+5NJY7QVEAkux1MRBvb0SvnK/4eefbDL2W+il+C+vDJu8AW+/+MamrDf4W
         Ug5meXddV3I8wewZDdSVOB367kQSZTvQirq+NGhZGdHkEUr8VwK4bO38o+xW4m0iGtrR
         kIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483198; x=1790087998;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3Xwa5YtOq2I0pAIeBe3GC0dtIeA/uMMyehMpms7xKhI=;
        b=DXmpfkFCIIpjt2In75GPfeE4yAT3t5B9cfIVed66GirSco2qq5CXZuzIdT8GtkCF0F
         yT4uQEnjaMvizQzLBH8UC6CLNqqKpcVw6g920TvRQ2NAWLfaDdZKMxZVnd3CwHCouovV
         jmLtyjl2c6IM28kMpAHHSDvxnSv9s4XpZVdm9WRmoufa/eRmetVB7kgITxbMwbfTcpji
         Fur41V1odMz308HnqbVufEK0HR0JceYTHMTp/65IwziT8Gxm1UcldIlCBdtv4rb0d/b5
         yExjINnNLrBi8wnStGYSpMad4d8loAVxKbYG4MktjvWyAy2pnr+ifL8SsIO/iEgklKtr
         +TLA==
X-Forwarded-Encrypted: i=1; AKwUvBxNqPwgaGkKuiWxPNceXx1K8EJli/kjOF8RofSHeiI+HCGz6IZLmG54JQdE7foKLi/WkE8Pob5cjVRw@vger.kernel.org
X-Gm-Message-State: AFuF++lck4FyUM3i5lh97AIOVfzZRt422GtRN906xtdSJ2nywNiXxvXC
	DxAa+cl4LnFnTBc3Rxr3lRA2YahX24zTvvStGtNegyPac7L4KFNQJ0LZumHPgn/fwDt77bnvfdI
	QBZ8JRgz42znFrh9YtN88d9i2qSU3902wvEBPH1lQYA==
X-Gm-Gg: AYBFou00WBXH1xHcD2FYMUjq/LV8+slh33ZccX8jGvA6uIgF24Bp0BuLK0mlSbne+I6
	wATPYc1zh5mESHIhIDquk6Otw2gF/zz/Z/7B60a0h056VON8Xu/eGAfH1y3Y/FqK+YRF5TT5BP/
	J/K+FPrU7Qv4Lf/TqKpwTxtwGIIgDihUFtkl7zVbu7BPj2JTQWLXWkL4EP7EcuYm+hetaeYqabM
	ufGwBVqhD4y12DU1yxs3LB1lvDjdsi3PVhOJn1fpozTmtFe85v08nNV74e8+BXqeIP7dn3pCLNB
	MmGBCh8NaAmaSYZ3xWWLwYnxHnbAYOhYbwq4nX0E6ftO984ZFd07IUKVX+RECuszjrr6CakSAyO
	oKknn3+fNHMEwDQ==
X-Received: by 2002:a05:6402:20ce:20b0:6aa:1112:62ce with SMTP id
 4fb4d7f45d1cf-6aa11126963mr2247651a12.17.1789483198039; Tue, 15 Sep 2026
 07:39:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org> <20260914-exynos850_sram-v4-1-253871de0f61@linaro.org>
In-Reply-To: <20260914-exynos850_sram-v4-1-253871de0f61@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 15 Sep 2026 15:39:46 +0100
X-Gm-Features: AcwNN1UWbY0jLS0AasFyFQBRa0-ZrbV9B9Ct3OZ1vkaXc7hzdPFBJ52yoD3W0ms
Message-ID: <CADrjBPoEmxv=f9DmRx2Zn9cB40+V9DpruayEHFkAznbNeu7D_Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: sram: Document samsung,exynos850-acpm-sram
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 17:58, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Document "samsung,exynos850-acpm-sram" which represents an SRAM region used
> for ACPM communication on Samsung-based SoCs.
>
> The SRAM is consumed as a whole, is not split up using child nodes and
> properties related to this are not required, that is why "mmio-sram"
> compatible can't be used for ACPM purposes because it requires child nodes
> to be declared, which are not needed and make no sense in case of ACPM.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
> index b83fc6831947..b9c4d4f3199b 100644
> --- a/Documentation/devicetree/bindings/sram/sram.yaml
> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> @@ -43,6 +43,7 @@ properties:
>          - qcom,rpm-msg-ram
>          - qcom,shikra-imem
>          - rockchip,rk3288-pmu-sram
> +        - samsung,exynos850-acpm-sram
>
>    reg:
>      maxItems: 1
> @@ -159,6 +160,7 @@ if:
>            enum:
>              - qcom,rpm-msg-ram
>              - rockchip,rk3288-pmu-sram
> +            - samsung,exynos850-acpm-sram
>  then:
>    required:
>      - "#address-cells"
>
> --
> 2.51.0
>
