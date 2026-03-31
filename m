Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A634219EA
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 21:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774993038; cv=none; b=cRh3+VXOBF8a0k9Kvl4XCNVED7Vrd3xQwzzmM7h53/BAc96p+g7FMnbK0Fv12Fc8OUb91lgBfIsbmFN8uchSDFykhQFUspww+Bz6HgVNRYaKEOSjBFlCid82Pm+I56PIIA3WqfOZdUdsCa3Ejqor4p4G0y4Uu16lE6EMyX0buvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774993038; c=relaxed/simple;
	bh=77TKJXfDqxRbDJZcS4iQHfQ8ePzfWbiSwaDIcMZRDug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gz18RCePLD9K5mDA9Xkdwga4sQfhFija3WP3mzATSRhp+fFoc+RSmE9pCp0QMmr1bMdgFSl9hT6AYtcglC4ZsTQTsSVhuXepBcWhXFhMjWsi1zTgx19CuFhO5o1IKnjUpIgKKO3//W9VhiwDzGphQiRcMAFDm3RxBgpIQfJM9rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NwYRp2iR; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NwYRp2iR"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a2c0710afdso75614e87.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 14:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774993035; x=1775597835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHUi+YrE+mS2lDKmIKKoK4NA/mtXRLEN2zW5bJXcYuk=;
        b=NwYRp2iRxPPx8fvTfwe0/Bp9h9kSs1CCF1G2mfCPegUPc8pWgatU+ffGKa9dT/6Pi5
         0h9a5fuAppZYQLmujL8LjF16ErqGiOs5pXwzP5nU+lwnmTtVQwGKTVjyouPQ1774Vx7z
         f1bq06Y9Aw2XzbKYsWR1N7tCNQL+ETTk2tD6s55UwFYTGV2rvyES4eaG2wrTFMKFcgvm
         hoYjmzhrwyaCOq0KPdRFme/9ciAH1YqzcYxpFsV8A3dFxNLf1rXUTHe3nmhsVgXdWL7L
         POV8H7IMAnWS1eCQExEtZjh0UpO7oyf6/CmDofzzyhtOGL8JKV6XBIm73YnthF8OJFFl
         i4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774993035; x=1775597835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KHUi+YrE+mS2lDKmIKKoK4NA/mtXRLEN2zW5bJXcYuk=;
        b=Orz02gptqDckyiPdUxdnJy3VFTMTFJjo7LwBlFQH3S3Zbcfc7hQMxURvbZYvAbNrST
         GfGRnQNKclh1GtCsARuvxpoSThR2OmDLlb6o8Raw7oR3hk2GrJ2Pik2JgrtMnVb5cg9R
         OUxYwzTYCrdXS3OhAEIb++umXNorxE/VXMHj6dUkNVXOwsiTB5qE05ZdErMQskjvvv8R
         BQ2ncdVx0GFOHQNucCXV+Apyr+aKtccCXspYa7sgp0l6z7ue59ddo/5ZRggOswzXicNf
         OcELhV9LxnRRFNhMkl3/gEo62Mbc7YtsptHQ+NEkYb6HXIdwoKdvbc4DcT1ICPBQitem
         lvyw==
X-Forwarded-Encrypted: i=1; AJvYcCXvOBP/XkNMlNcR/Sxocp4R39XrBr5R9xi1d9Gk3kJsIyY1t3ySsocOS4orcNVQ/RRC8H/wppYSpvtF@vger.kernel.org
X-Gm-Message-State: AOJu0YykHAYR5pPHxODQsmXRkjfVj6a1ibguulR3PigecAnhe9ayC1u6
	4AJbyMyX82fYIYo2suZjk8sX5WyN4SedU4AycpdTLMUKeFkhoTvEdG+Za+DdpT1CGQ8=
X-Gm-Gg: ATEYQzzwGGueMzfpJMA5ve0OoA9sahCLKinyrcfn4YAIht4feq1VNKDqiS445f8YSVB
	BsV6PRuex6b5eQdS1CdAbwgvrW7uhsGnK2N2FyDjIsI6VO8Yerbw+4co4QcqY8QilyluN2Sc+ej
	zgfYSH0RYd0q0hGdnFWiLFLwKfxYKn2EsQ4FBQY5eHprSxwTVnTOZsAFzCag7EZoHBjzs/4Ldok
	DRCznqgA1Ufm8p6EpstntlSSn/ZidA8dXt80q58YUwD33A7stUOIkIn9tHnynbRfKh8tnX4Pn0e
	4YlvJa5YjqcRWnoFr9XdDAI8f5PSDAV1b9KJG9CbgjudOQxHDZHlveEEEmvFW/isuu9FUd67eRh
	cAC16OukWZzGAEPo9DTTLdGX6oTkVIKEzdykA4JaQ8IW794UPSN/UFYKxE+dHntaDyIA/SggCLY
	Tg0UEUpfAZhCVAJL1FAjAqNW35fBILI6A3A19wmlyAUFMwlQGh2rKsQesdrQY8zogPT54pnvAOW
	ZdDkTLJW65jlWTP
X-Received: by 2002:a05:6512:1091:b0:5a1:3d15:287b with SMTP id 2adb3069b0e04-5a2c1c98cc5mr165782e87.0.1774993035132;
        Tue, 31 Mar 2026 14:37:15 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83890bbcsm25187391fa.25.2026.03.31.14.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 14:37:14 -0700 (PDT)
Message-ID: <3c51f9fe-9c5f-47dd-a971-5b2a9e416230@linaro.org>
Date: Wed, 1 Apr 2026 00:37:14 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/7] media: i2c: imx355: Restrict data lanes to 4
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Tianshu Qiu
 <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
 David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-5-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260217002738.133534-5-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/17/26 02:27, Richard Acayan wrote:
> The IMX355 sensor driver currently supports having 4 data lanes. There
> can't be more or less, so check if the firmware specifies 4 lanes.

Does IMX355 sensor hardware support any other number of lanes?

1) If no, then it makes no practical sense to check for data lanes number
given by firmware, there can be any stored value, but it's known that the
number of sensor data lanes is 4.

2) If yes, then please return to the sensor dt bindings, and reflect any
other options, right now it is set strictly to 4 lanes only. In case if
'data-lanes' property is omitted, you can use 4 lanes as a default number
of data lanes, and this information shall be documented in the dt bindings.

> 
> Existing ACPI hardware descriptions may not have the data lanes defined
> so this check also accepts a placeholder of 0 lanes.
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Link: https://lore.kernel.org/r/aW3uFcT1zmiF4GUP@kekkonen.localdomain
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   drivers/media/i2c/imx355.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 9ca87488c933..0d6aabea7d59 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -66,6 +66,9 @@
>   #define IMX355_EXT_CLK			19200000
>   #define IMX355_LINK_FREQ_INDEX		0
>   
> +/* number of data lanes */
> +#define IMX355_DATA_LANES		4
> +
>   struct imx355_reg {
>   	u16 address;
>   	u8 val;
> @@ -1705,6 +1708,10 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
>   	if (!cfg)
>   		goto out_err;
>   
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 0
> +	 && bus_cfg.bus.mipi_csi2.num_data_lanes != IMX355_DATA_LANES)
> +		goto out_err;
> +
>   	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
>   				       bus_cfg.nr_of_link_frequencies,
>   				       link_freq_menu_items,

-- 
Best wishes,
Vladimir
