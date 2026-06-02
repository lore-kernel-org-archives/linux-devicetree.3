Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E28356758
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 22:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780438529; cv=none; b=ldCl2CFABpT/ggb8oLTOUHj2qCh829ce96rG6a6UvJ2clWo0afCZvtVy4/SpMa51lpHQpFjRkYBOZh4cAFJswZVUWsKWFv4GuZCgrfFqaxJhB4DT03prZ5BhX7UQ8Fux39+5d2KixhZ8gSpF57y57vZMJBrQYB6pDtXfIR8VFtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780438529; c=relaxed/simple;
	bh=0l2ZoBsNnuodhMPRW4K78PbcurismS2rK+dwCagNV1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hg1x52+/FFAy830U6cEZQVVS3UuN3QJQ6xPBtp4hSmT23lcNr5lhcXq4o/Urb8Tnwx1c2aQ9+n6BPCZeiTqqrQjq7cD8L/ZJgjvQrn9Ng31hyUWO5rLMFakOIUGv++NEgczLJihfubvcjfEFea5y66//Zyn+sn3WK/DpkfUrBfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e8rHw67s; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e8rHw67s"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa679cc2c9so393861e87.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 15:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780438526; x=1781043326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgy25aO5siADmjOHA8m8ArvPv18ukgqv39s8uxTpK68=;
        b=e8rHw67skHmOQ8kPoTe6+oocv4OUg/IB2nEMr+0fpK4i5Gb2Ty7tk+7gOoSVPyFYkj
         cz/rgfHDQo3o4q3rgEEfot2bUDKa/U5IhhwM60C5H2eqV32hKrWQOizcVhOhjldx6VFJ
         7Gy4PbKz6Q7O/j43kO62HDI6B7Dm9I/BhUsVtrgQs8+vW8MS+68ML1f+aJtRoQF9neUF
         zzQ86WLaAsy6UcFJiXMskcb3xNHNAzDElazx1IwJinN183bynJ6KCOrm/AZFplO8LuF5
         XlprvD1OHBrBF0IoOIm+TDoV/lCxVXfly3/xY8SPgMXRqMLKXSVRvtXy4sdy9o+7QAsW
         4e7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780438526; x=1781043326;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jgy25aO5siADmjOHA8m8ArvPv18ukgqv39s8uxTpK68=;
        b=r2MoLMvD1eoPafmcKrJZRHwZ28UrXhqc+yFRyTfe3psO8w1aHlcgDGBMKRHcTUhTkj
         Y3zu56pPuvJu93xAfYvBLqZ9cSBsP7pZbKfN4aPzf/c624dXF+fpNeBru4Ap5PmxDCpW
         xTCPX53MOuJ/wR3lFcKlRWzWuc1SMD78AzDCeEUyRxbRSfqW4tbnEjN3snJbWCLb+s9I
         jetXNUPhlDsojgT13HY0bFojRy3+J0QkSnLu03FBJViV3UF9ufORMT2VV5xenGzgSCKn
         9izClob9RjY9QofedArULCpOchNOZF6SWNdW7k/DUk9TqjUwaBBabgsj6Sc5ITYEkPQX
         6bGg==
X-Forwarded-Encrypted: i=1; AFNElJ+8dRAjWda869JSAZ+Boum7pWElqnSvHGkt/lvvmnuTqaQZejHjjl/OHI8PfKQ/3ad+0ywyOrip0WEW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0n1F91uxvUD0fVceudCzaxmqLF0wd3kl+E+jGj3DH/3is6msC
	eNr7TiA6rPFkjiupM8HWmEj62G8t/vC2MMPLESz0R8I/o0RNqAPz25bTQTvvYRurkDw=
X-Gm-Gg: Acq92OHAbaeIS8DT3kGni47kg60lqnRwKiA9wt29RZ54sdhcb37jUO6W+qdpnGmVJ0X
	RGgX9tW/ABJ8O/V+1f2003eJkHmyqditb/GB9qXHByDmEpjABftVLr3x5OEjKOWmO7/MLh/AFru
	UquW/JQXFlaxXdk0yBJKZi4VBvkC9bqP5M11OQJU8OaUaxWsu9aX5XACUJr1qQ34PRpoh5OpTQm
	JCEeZ5DkZCo5q2pw60lWxWeRn9ACpx+5oNaKkyX78NNkCosMQj3BEHNoSt84WqhCQCNIXFq5fiW
	UWplZ9WOyjo/+P4v70JOq/QfZzmjRylmymnVS5jFdu/zopQa2yKBN1J024n+IeauqccmWwwh/fP
	MQpUI/DML34I2GOzAHnQmT4DmpTXdVfaqwxJdmTSuWjU/JJqbsUtfHR4PPc20wJ0rzlrDkd9sWO
	sRw3EepkzeRDTP+H+beQ49e17sDxYWu2Xp0tQs7hzg4vQpdB5M3pOO6dzdjT9yrAHQtsiVCtXzR
	JAlC42VCfz40ZjI
X-Received: by 2002:a05:6512:3c95:b0:5aa:7126:c62e with SMTP id 2adb3069b0e04-5aa7beaff61mr128839e87.2.1780438525691;
        Tue, 02 Jun 2026 15:15:25 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed2d3sm217245e87.5.2026.06.02.15.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 15:15:22 -0700 (PDT)
Message-ID: <d9564f1e-0b5e-4c69-88c5-b57ab2e0b543@linaro.org>
Date: Wed, 3 Jun 2026 01:15:20 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/5] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com>
 <20260508-kaanapali-camss-v13-3-2541d8e55651@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260508-kaanapali-camss-v13-3-2541d8e55651@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/26 11:05, Hangxiang Ma wrote:
> Add more detailed resource information for CSIPHY devices in the camss
> driver along with the support for v2.4.0 in the 2 phase CSIPHY driver
> that is responsible for the PHY lane register configuration, module
> reset and interrupt handling.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
