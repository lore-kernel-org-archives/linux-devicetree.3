Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF66233943
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 05:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782968666; cv=none; b=Cucv3mmUJxqj3f/ZSN5+pilXdW76c4pGn3/Bbf19n3cqX8rgrKvuUQuxBaJcBuF4N9rx/u59Jk7Cb0MJnWXxkRPyCMxIzkrxilOKF5yNUjWOnf4Sp8/Ar4vShW+ppAWircQ0aCcCZLwf0LvRvyym5n/XIljxLKD5nJ8lwANt47g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782968666; c=relaxed/simple;
	bh=KY8isj8qnfFeVbnhDgajn0TKgbt63r5onHjMkJEDVBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2/CxmoNLrSDyCaQs9gCq3KmBXSL1ekBkk6HOHR1nRQdt+65qoVz8KHd/3tyLKY+wIjfEkkolGd32VDJIPTL6ygLM7L5cdZx7DTgY0UAmiAI5gL8doJMHQfEnvBxW+mSa1F3FIvct9Jw88YnT2bgsZC48XhUn5tTkF7Y0X7APxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=snWr05SU; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="snWr05SU"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36b9d265355so926474a91.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 22:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782968664; x=1783573464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Oy0cfahmYAXjNqu8zns/MhJDGK3lg7nw8uo1AFuaGQ=;
        b=snWr05SUa29AgH5E2w3tvi2Q0PLnBP04IEEhVsVBUrbGf3cBT84L0lQXqzBu+g+BI9
         LNxJVjsnrz/fpi3dg3X2twVaZyxrkkA17a+8BicPLJ7yfG8rg9RFTyY9Achz+Z5KtJ5m
         mDLXB/YrRlkTYo0DsoEbLGDB5MM17s80Hs/JxGDJ3D4i5Lv4HBBPzL3jS8KFPcD635n/
         UJXriLSDYTwDwQz9h3pu7tIaPTvmjbOJI6BBGS3Upo84oi21H771GYbYrBimXG2gejvE
         MBoZBTVIFkNb628aPEwmbQZmo2gD09oz4qov+6YEQyHzOFTEFi8c4KO0/g4MbBKArkcp
         PUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782968664; x=1783573464;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Oy0cfahmYAXjNqu8zns/MhJDGK3lg7nw8uo1AFuaGQ=;
        b=foYHkAhQXU/TtUaC4HG7vU0ON1vW1ySfrDYhhaSaoJ0zAPf67iafiRhDZ9oMUcya6w
         +Qp4Qgkj+qG+a1xEnflcVYZ7qxyTeHqRWzZ1tBnUU8N0sWCvYz+/nIzprW/haCu6rlCp
         jitWi8DhpJQGjSSDYNRnRW3YJJtYzDrFmwAcxIp10QY1Mpn+Ea75/v69H39jGqBz7GMh
         hsydHyjah9oP7IkfNRqyNokAaEv6bZf4v4Pqr7NHBLF+3v3M24a/tAVDrna0ajfQlWXM
         j1ji7XYh3CRhL0Trs9yf0eMP4UijUR55ZnDd4ujSbkagSZdZpLSKok5wGMokLltrjBT7
         MRkQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZgAehFeJMHZAeIZD7bqy2AM7M/rAWlv9EfJFJWEpAf9aKoDitHvJ+p9NXSwt/dSBdzuTjF4M4Z7me@vger.kernel.org
X-Gm-Message-State: AOJu0YxwNrebjKdFAlRChzWNrlVtLXPfIfWq0PhQ4xhDn62bH3MjoLtz
	nNml51hXs1/gJFa+Ay3aoSWqH8att21htQLGe+CtjiASHxs1rrtGP4pF05sz94Y4/4Y=
X-Gm-Gg: AfdE7cn9yeRYG1DmrlkpuL0G9UNtdhaaJDGH1/8VcTd5GxV54fmUmeKtq19J7jc7QUa
	5e3D6djbgwIp/cjDg3EXXAslRst4sXz/cM8U9Tuz4NnKQc+z2IR7znh2yv1mZrh4+ZuoUVmwXqz
	OF2bRltyAkFd6k4KTYc/KUlB7K+SplTyhK+5xd5qa9cKmyqoqH0Ne1qb/C5nHokY/OCWGIs6615
	fR8nsJPfTSwnfegHus4DT+fTIlOjYdPq2aPPFkNQ7DwhT5tk8J0mJdLKEZ6V7Y3YSXDdEbejUD+
	Ey1xa0QBy0fD8/2EgxcTq9EK1Jyo1oAljq6tPb8tqGBbK8r/gx/pAUYEyEiLZEPO/lNzi8pZXXN
	WIrj2KqrxHFxPqKcEjrs9+DLrHtM+tHGNo0NChsyx4pHCdzgcFQ6cQBncKBeVjVXoTWJrQx+Uhh
	PTzkkJ96pgR0gxgiE7gMSthx8=
X-Received: by 2002:a17:90a:e7cd:b0:37f:464d:ea38 with SMTP id 98e67ed59e1d1-380ba70e00cmr3476721a91.0.1782968663686;
        Wed, 01 Jul 2026 22:04:23 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb84366sm6143858eec.16.2026.07.01.22.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 22:04:22 -0700 (PDT)
Date: Thu, 2 Jul 2026 10:34:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Ilia Lin <ilia.lin@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] cpufreq: qcom-nvmem: Add IPQ5210 support
Message-ID: <k5lgi2x5y3li2cwqdcznfgupd3fhbvrcgepf56ukahlrexyofc@moqiz6k7x24r>
References: <20260701-cpufreq-v1-0-98656ad20ff3@oss.qualcomm.com>
 <20260701-cpufreq-v1-2-98656ad20ff3@oss.qualcomm.com>
 <09de0dd0-343a-40bf-a8ce-f28c3624e6eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09de0dd0-343a-40bf-a8ce-f28c3624e6eb@oss.qualcomm.com>

On 01-07-26, 11:36, Konrad Dybcio wrote:
> nit: checking for == is easier to read
> 
> anyway
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Applied 2/2 with this:

diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index b2aeda7c564a..efa766e98d86 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -205,7 +205,7 @@ static int qcom_cpufreq_kryo_name_version(struct device *cpu_dev,
        case QCOM_ID_QCF2200:
        case QCOM_ID_QCF3200:
        case QCOM_ID_QCF3210:
-               drv->versions = (*speedbin != 0xcd) ? BIT(0) : BIT(1);
+               drv->versions = (*speedbin == 0xcd) ? BIT(1) : BIT(0);
                break;
        case QCOM_ID_IPQ5424:
        case QCOM_ID_IPQ5404:


-- 
viresh
