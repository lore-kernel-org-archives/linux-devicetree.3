Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D891F212548
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740486; cv=none; b=jTUEEiWb4GCQFGFJpip0yuB6USK8TWR5/KBkh7t2ECULIH/3mU0y89wnz5k5Za/8LjrIH+0hSJchGy3VrywXhrOPK0+5tGTTt/vvDsDuNtKrWkk/9dMYpBdMR12ykYOwHtTA5L2415sbR+JVyK8n5QIO76Y9ZOd/g2giWu/5iAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740486; c=relaxed/simple;
	bh=CQJFHVi3mWhoGuN7PwL+jX0oz9CJw/ur/BmVyt7Uy50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oDW9rC0C6u5fexKj4cI/U0hAKCR/g8xY4OrKSHKLfQvO7WHsnlw1N2dEmC3YaqlRwV16lBX1J9Jq4qDWNzDpW+NIL+cvgmRUczXcD29dM8J5U2aT2LIi540PsImvaHW1HV0AlYVCP7rM8GFz1iCLFVmxH4t5qC3oFvpZ2z5dhgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZCIg6Dl4; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZCIg6Dl4"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39ae97ecc63so1562241fa.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782740483; x=1783345283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W1SHPHn50RFg01mCguwYGn/fl6UooE/4FbPssLiu2OM=;
        b=ZCIg6Dl4o2C93w2kDS32LfgLSNvwQe31Vt801v2ivfnbg2PTe42u0N5tyW94g4cdnJ
         RgtHhfzh6dH/07gco+VsQ6sZGSed4J2/BFrh9CnpNIqRX4BHstSaTgx2JVGxVO/luJUw
         1dbkvCfLuL0S8DVDHWtQHWJZLMnIMsDMjnxsyxwLKvUeLdVJu8dxFPJiu/whSYM7DWqW
         LZ88TSulr5yXKlTCoIz1h3MvzYVlU3ylTEpqFMK7610346ddr9GOPq5t7SIs1c9IWSAc
         PVjpzIljWGP0jc8NBa7X1+1oX33NADPPMDaJFUe1X5MvCnsAvNLEkSj9yKpz1E2RWgjA
         8OdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782740483; x=1783345283;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1SHPHn50RFg01mCguwYGn/fl6UooE/4FbPssLiu2OM=;
        b=oZBqXiujlGnSZSlgeAUYGc3ZxBzf+6VSLmlG//6ll9jTmH032uaaG9L1Ef0+ykcAJg
         aHYdSSTlbVEu2KWDAgBqPD4b+Y3mDrWw2iMX265QLxjr7slVZY3rNOADOnw6GcVfJknc
         HZTD526CXcBzEVRu6zzFt09eeIhVYsh6pGA1KctOFrZhQ4eg+tw4pt0jYCvnuEuo/c4Y
         bTao/lOooScCHpwQMrr/hUdkXvMyI1yjk9cBajE5VSgf078fp9AJ/k0WwTPdM3LGpN34
         jA9ZlJUwuxpcDXwWJtn4CrRkhsbT+y0Ru8PovxDolzZ50oIdim822rF7Kzw2rjlxZnls
         k8Jg==
X-Forwarded-Encrypted: i=1; AHgh+Rrcw2QLhAcRLFllxhJiwEd8lDLgIH6pb4hI1uA+67fhrSj6GOp+gvNiJujghcsJqQQPPWKyvHlN2p5r@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ23j4Fogz7SDTEjtdKTE/MA1wLfBskgy/YZ6lQD/U/L2nxtCw
	ifOLUf0ymVEyllnysk9l4CGpcLBdlYskL3Bv2wYD2tCDKU5m8Q1/c+g9qi1zUzINAHY=
X-Gm-Gg: AfdE7cmGYvT2zbKB97TU6Iti0gzcop0Mq9oGxEC0dxgHvHY8wEPi82hYUOLl6eJLkFh
	iNwl1UvbT5xZU27LUmlwkPszEuC5rzSgckmL7IuNwJanDj1iEi/khvAaCLKayKrbHnERkWYyL3z
	GBw717htXuT12Fjj5HkE3HB4cpVcbnSpTMVRQzAZMm16ps6Z31WJsJSLJgCZLxK+XyN5nghC7ak
	AYAXC1BlGROhSLvdM+BJNrOTpr4bmHUmkaH7opjN5yu93xt4aZ90E/xhLnYtAsiSlJ1pp+egJu0
	ae77M0qBCWu6Ls4a0OF5yf7uE8rryahORjx8bLoSY4Z3ElWWjvglyJ8h34fhI7pIKCE0hShyCl6
	JVooSTULvTuuHFJvAjAThIn2CwzUeAamlF/03WogyzmXWSO5lEyXGg8kLNZROrsEEaYjBtAKGE5
	fnl29ZsCmmI5YM7wk/xoPIPvklncTWvZt3RZ8dQTjtU3jEUzrS4awbPbJE2O9PnNPMz/w=
X-Received: by 2002:a2e:ab06:0:b0:396:8c78:3d53 with SMTP id 38308e7fff4ca-39acb9ac8a6mr17363281fa.8.1782740483113;
        Mon, 29 Jun 2026 06:41:23 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b176967a1sm3100311fa.13.2026.06.29.06.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:41:22 -0700 (PDT)
Message-ID: <a06e5330-ac88-42aa-8b9f-148e9c5a6734@linaro.org>
Date: Mon, 29 Jun 2026 16:41:21 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] media: qcom: camss: populate child platform
 devices
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-2-atanas.filipov@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260629121750.3469292-2-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/29/26 15:17, Atanas Filipov wrote:
> Call of_platform_populate() at the end of camss_probe() so that child
> nodes of the CAMSS DT node are registered as platform devices and
> probed via their own platform_driver. This allows hardware blocks that
> are physically part of the Camera SubSystem - such as the JPEG encoder
> - to be described as sub-nodes of the CAMSS DT node and probe
> automatically without any changes to their own drivers.
> 
> Call of_platform_depopulate() at the start of camss_remove() to tear
> down child devices before the parent unwinds its own resources.
> 
> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Link: https://patchwork.linuxtv.org/project/linux-media/patch/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org/
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Instead please include this unmodified change to the series:

https://lore.kernel.org/linux-media/20260508-camss-isp-ope-v3-11-bb1055274603@oss.qualcomm.com/

> ---
>   drivers/media/platform/qcom/camss/camss.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d..d2ecc79d5269 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -16,6 +16,7 @@
>   #include <linux/of.h>
>   #include <linux/of_device.h>
>   #include <linux/of_graph.h>
> +#include <linux/of_platform.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/pm_domain.h>
>   #include <linux/slab.h>
> @@ -5460,6 +5461,8 @@ static int camss_probe(struct platform_device *pdev)
>   		goto err_media_device_unregister;
>   	}
>   
> +	of_platform_populate(dev->of_node, NULL, NULL, dev);
> +
>   	return 0;
>   
>   err_media_device_unregister:
> @@ -5497,6 +5500,7 @@ static void camss_remove(struct platform_device *pdev)
>   {
>   	struct camss *camss = platform_get_drvdata(pdev);
>   
> +	of_platform_depopulate(&pdev->dev);
>   	v4l2_async_nf_unregister(&camss->notifier);
>   	v4l2_async_nf_cleanup(&camss->notifier);
>   	camss_unregister_entities(camss);

-- 
Best wishes,
Vladimir
