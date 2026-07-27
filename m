Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A778641D640
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167952; cv=none; b=rDp6c6vTzHllAtqn4UxVfbApL1hUJx6TtKxWyzOUBThhqj0jstbojoMXHmnG5QhTkCMML+aCFomMo3X1Hczx0r2jS+dwa8T+ZYtZ5lCcFsyMhl4XZE0b18XZYAgfH4uWj2k+WZHm5gu2YM/PlkzCi8qJ4lobeGmrrTornSksGeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167952; c=relaxed/simple;
	bh=RPvzmBUvGUDgoK8qi8BU9CzoCvJCoYIwfvAGLDgTQwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N5+dpSuTkq4YsUyYCV/v60OeCI1gjdDtoww2Wd2+y5c45yCVGE1I95oRMDMopA+Gl+rydeV6A240MMX6RZkT4feG3iLL9QlBmtp8OvxzJ7FzF2R2ViFemF31OmuqisCe3aGjfuagWQgmqVyGtmEpzqEKRAdRLpNBoA59eWePfEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=yPuSF4AV; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="yPuSF4AV"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-527e352a167so20847251cf.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1785167950; x=1785772750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eI+pv0AMxILlggFrEFkkHRcxF3WFLsvXTsHBUr1TQj8=;
        b=yPuSF4AVhLvFAvTfBIdr/NUvsgdZwH4S59L72w3rkKBG78P9ex/bqGmkbojkwkfQzl
         qjQiDOe5q3RV0SWZQ9AwCAQigx74MqYV5w2Xoqjy9lgP5oGb9uvcInIKVrBB/gs4tO16
         eE/dpgxMQJcW2DYOgP33WdMMscBpDCA8srsC+rr3TlBKXHVbUwCJyZsWZW4seLywqL8s
         IiRaTF0rmOS2Gv0n7w4qqSgtsfkgAGMh2OWPa0tYAJtMauUqWq/Cn3U6qjMU3cPol9Wn
         ADXbVdlHw59Pr5J+R5M4Tfy6Nz/3JDPvRaFe+YoZPPOtQhI6P+GpT0XwvYqWfRp9IcI1
         SYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167950; x=1785772750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eI+pv0AMxILlggFrEFkkHRcxF3WFLsvXTsHBUr1TQj8=;
        b=q8C1qTu7Q8bgmjKsRG4/2/9EV886ROuXrJPiqQUGKB1wpuFGhjnrsBpx5o6KQDwdTZ
         FLMxyn97wD5fDdkWKAeCHAIusySh1bMIvqJSX5NHUeM5HW1e5Gnth6S21wsPN1U0ur+N
         5qsNzNlXF3S7kiRBMweUK4cLZqGCZkEnNMjU6SB4C4sl9Ja0TXi7pveaQtP9MB3yBLKE
         fWdcQyW1+we9Th/j3ujcbTjl2avbSFj+pPndmwzY3YH25sqCmwuakEzaLE2G6IMvXf8N
         6GqmSrwV5LQ3WEPZE4gdK7q7+iX0oGfUvf0J/10ff7fUmTxwTuD7GNFuCYrb7y2QW/Ca
         cr2g==
X-Forwarded-Encrypted: i=1; AHgh+RppIe1gMJ6czyxmPbrr4UBdXVWPMzc+VZBPWOtxOq2lu+o2EDnP12hFlSrwXV1snlNl/KujNH64NWFK@vger.kernel.org
X-Gm-Message-State: AOJu0YzGsRs3INvoGUrYWeYbS9hJfyG8au2uNwS9xZjWFQEL2nC7mOtH
	lpd+cV+uFOqmrK9B8lUxIjBMrlUcq3X8cetI+VlW7AWVDjewRoKEPHsKMe6Zlvt+2sE=
X-Gm-Gg: AR+sD13m35lA+CHb59krlxbR4duqYUaQVrMKPpH/DfP2K+5GQyjKt6UtTUI65Heqy0M
	xp8tFFsp74f0wAYdPDbN1cvkFf5eucwUgBuUfIYIXmrE17Fo7LjWt6Io5OMBW2G2N3KfD3sfgJN
	ZF1tthWqqt0RnywWt6zpewpBShmp8Ov88pIwDucfMGG4m25piq4Vb9IB+wZS7v4jG38M057dSFB
	RCx/p41bhYY0vy5qGy7xy+1rUyt/tc07djLfYJ8pBNWcseViu8Sw6vGSRBzHX8sgD0qGIZ+7v/I
	vvpbqvH/She0ejiJD9MxSoB9TKfoG3CMEL3ZKrlpwhV/op1TT28QfYa53foHUdrCY24sEniTXfY
	wHwQMznSC3f3wWbZlJwDe//8Htb6lvM4aJenxwZGq8bvEOkObxm33jK+57/tyCeJB8fBUohH6rf
	tqdQ==
X-Received: by 2002:a05:622a:559a:b0:528:3ae6:14b1 with SMTP id d75a77b69052e-529d1c4c98fmr673601cf.43.1785167949589;
        Mon, 27 Jul 2026 08:59:09 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529a262fa9dsm56944561cf.0.2026.07.27.08.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 08:59:09 -0700 (PDT)
Message-ID: <f210077c-a868-4cdb-98fc-39e6fd715085@riscstar.com>
Date: Mon, 27 Jul 2026 10:59:08 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] PCI/pwrctrl: tc9563: Power off only the external
 ports in tc9563_pwrctrl_disable_port()
To: manivannan.sadhasivam@oss.qualcomm.com,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260725-tc9563-fix-v1-0-ec4286e31331@oss.qualcomm.com>
 <20260725-tc9563-fix-v1-3-ec4286e31331@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260725-tc9563-fix-v1-3-ec4286e31331@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/25/26 3:59 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> TC9563 supports powering off only the external facing ports like DSP1 and
> DSP2. It is not recommended to power off USP and DSP3 as they have fixed
> ports/endpoint connected.
> 
> Hence, fix tc9563_pwrctrl_disable_port() to power off only DSP1 and DSP2.
> 
> Fixes: 4c9c7be47310 ("PCI: pwrctrl: Add power control driver for TC9563")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

This is very nice and makes that function a little less
confusing...

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> index 482e82e433dd..ca19bf60d290 100644
> --- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> +++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> @@ -241,12 +241,18 @@ static int tc9563_pwrctrl_disable_port(struct tc9563_pwrctrl *tc9563,
>   	if (!cfg->disable_port)
>   		return 0;
>   
> -	if (port == TC9563_DSP1) {
> +	switch (port) {
> +	case TC9563_DSP1:
>   		seq = dsp1_pwroff_seq;
>   		len = ARRAY_SIZE(dsp1_pwroff_seq);
> -	} else {
> +		break;
> +	case TC9563_DSP2:
>   		seq = dsp2_pwroff_seq;
>   		len = ARRAY_SIZE(dsp2_pwroff_seq);
> +		break;
> +	default:
> +		/* Only external downstream ports DSP1/DSP2 can be powered off */
> +		return 0;
>   	}
>   
>   	ret = tc9563_pwrctrl_i2c_bulk_write(tc9563->client, seq, len);
> 

