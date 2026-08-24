Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EC937417B
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563139; cv=none; b=c4+ieliJBJN4tFgWy/6UVdddojrTkCempCa62ZfFUlfH4V62gDBsev1f3jJDrERGCGdi5DGDbGB462NKH1RrXP6WG4dg6Ni8PslIxh3bHfJqMCuFk7eHINdW+PETUj9uWsDhGPTOEdycZ0P969JDvCkSHwliRUdQubzPIDNPhMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563139; c=relaxed/simple;
	bh=WhHWUx1lkpZdwfjQMtwcJicNC0V9nwr/uenYypZhCYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBcdeaGIS28kz1lKwOW+D7qYT67Xl+i25h/h7ia1sVBzncqq9Rxm3Vv16nqAyXgZYoMc9noxJTfKDfKHtgjviwKOa4O/ZTd9K64jlF9L+CUffsunVuBgNcaPdM3kWHvIUgGkMmYPcDJpOPlVL1B1bjyoeNCF0SsLGWTljonvmmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MiZts4lX; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MiZts4lX"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84e04df8c46so4281466b3a.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 02:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787563132; x=1788167932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pbr5eP75HMWDjVi5kSReXoq3ufPagXFdRczlYd+lCws=;
        b=MiZts4lXoJkLr5HBI4HQPY7610zQ5iyr38oxrXtio882yooTVihC3CZYo859or82nk
         G0mMU52DSVGVcAAIKiSZAmF1E4ennLMXvMTp9ouo1x2Ilz0HU1pL0T7SZQGAzcZMOxi8
         VH8G39IcfEKDPR2F4CsGZKbs74ypLf0tL8LBYhAzt2e+vmF+vDrFBMvXY2kM/PdACuDn
         2Cpdh9ucuRtkG9hp5oWb/NCoL/Zns/kqcnBNV92ml5YIU55tm6aKVfIXXWuiXiWqWJJB
         jSTVr6Nn2H/V+eV/RYHBf23K6K23G3Rm4+KWGbbYAAMOb4VOGxbVf7FtmGTSTjZwKnEe
         3iQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787563132; x=1788167932;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pbr5eP75HMWDjVi5kSReXoq3ufPagXFdRczlYd+lCws=;
        b=tMDx+UrGGY/c6jfT/h6ERhxcL9XOnnnHHx1fdnpWMVhSSKu3IgZfHz2JX72zx/LgLP
         qB4wnY3YAPJIUYiCoy0ndFkugS4B5q6eYQ3RCkRRPVoCkw+It+ZoKTlSTBSekZmqauaH
         EN87dJe0hup2HqcmZPQEUyC2Va4z4KaV9A6ynEahJ9QB6vUgeqt3MK+CakqugbOSe155
         iYQDY/Qze3QwAPnYnfbZyRci0Xp5hVjlkMTfJdEP3UBMIW0i/xgQZWzw2s/oQlp48XRp
         Pn1Qy+tn1msOJm+MeD/fnMaplH7KtK+GR4qtQ391wjxNp9zHRZH/sd/PSyRbv/EwN7IR
         j6tQ==
X-Forwarded-Encrypted: i=1; AHgh+RpHoVhtt9SqbX//RJ82ehhbxmhoCyclyD+V+Q+/ecxzd8b1vO5kIvha746wGOZDJsmWoGb+UavjxD/9@vger.kernel.org
X-Gm-Message-State: AFuF++m3iSaAjrF/bjO5eJmvVx8mbxiqHHsvcyXv5LrkioCOMmYKS7g0
	7ThAo67ucocGqHUlaEEZNa2RytWNu7acwbeiddYr5beBOvfrRKAmG7hkP/2sxfoB81s=
X-Gm-Gg: AR+sD12ob/BrwcGj6/54j69fKH7G9x8YMEtXx2/1uhYuIY0WYRkQhm15HPSyFuKMvf4
	KrOqASP0lvehML4Fjr0ynzLNJfUbmCWMx1LpuWQrTIqZIx1JhiYWuFgb+H0P+AZtY8LSqwg8aZF
	y5uOQ/cPCUjK0OJVcov7LIIWpS7N4mMSrDFkioN69vm6jUu+Po5vAa/WJpHml+NWNt+oXc5PzWo
	XZqsxnH1L7T9ilI6VvuiYiPIArhq8xVj4bLwfqI3IVVsSmJVXH7hr1pYNDeFedeOisIv3mDLyVO
	Ic1kNI+GAgOImvvimEd6gWk7Mpx3E16l7GlLhmodVQyJGt5OvxWYc6d8zesGM4q6mPw/ahAzR+U
	6fZGRKOeNIajLQqZUlTiqO3WW1Wwt6ZLD43hX0FnsfdXDOSilpHwMOVp7GEcXFlJjtMCh4vn9Kv
	cuZAOG9d6eX7kBDmTcBXZ7yW/GL5MShFb2z7SsvBEZcvZ8A0XwnIeqYTDcJQRi4Dli
X-Received: by 2002:a05:6a21:9981:b0:3c4:1916:9d40 with SMTP id adf61e73a8af0-3cd2ffc1753mr40291706637.12.1787563132361;
        Mon, 24 Aug 2026 02:18:52 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f923f2c0sm36790685eec.30.2026.08.24.02.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 02:18:51 -0700 (PDT)
Date: Mon, 24 Aug 2026 14:48:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	rafael@kernel.org, konradybcio@kernel.org, tglx@kernel.org,
	ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net,
	abel.vesa@oss.qualcomm.com, lpieralisi@kernel.org,
	quic_tdas@quicinc.com, danila@mainlining.org, davidwronek@gmail.com,
	mani@kernel.org, robimarko@gmail.com, linux@gurudas.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 12/13] dt-bindings: cpufreq: qcom-hw: Document SM7250
 cpufreq hardware
Message-ID: <aowMeGkWZQGmSmHx@vireshk-B250M-D3H>
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
 <20260821154030.2514-13-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821154030.2514-13-sreeshankar0910@gmail.com>

On 21-08-26, 15:40, Sreeshankar K wrote:
> Document the cpufreq hardware on the SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> index 98eb36bff..2dc2c265c 100644
> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> @@ -29,6 +29,7 @@ properties:
>                - qcom,sdm845-cpufreq-hw
>                - qcom,sm6115-cpufreq-hw
>                - qcom,sm6350-cpufreq-hw
> +              - qcom,sm7250-cpufreq-hw
>                - qcom,sm8150-cpufreq-hw
>            - const: qcom,cpufreq-hw

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
