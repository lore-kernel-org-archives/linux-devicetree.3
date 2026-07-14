Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4114494A17
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 15:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784042941; cv=none; b=XZFvHxyiE+2kO4NOzAbO8pw21WgbA8WYNzbJ+4H+ENEmuAKwOFKC3K/hgkdHkEIsQU3rZsvqc3anMR1AdB+tKgMezwAxliwsQPpqU/tjIZpG4uczz1j9IVl6CFC1Bw8buKrnETgcFebjSLYWDNmwJwMukpMaRu0rshxud0UY7io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784042941; c=relaxed/simple;
	bh=iK2N13Fa+ahJt7iMw2mLWbp8smO+p23o4+F3b2Vp1Bo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZxeCzOI+gvHcDIGcKlGerv/H7II5Eyg8vRneHcghYKdnEhUwYLtwPga1zF6h+xkEc9x2kynS6NjtoG/AKha6r1hA5KYds/MbqJ8nUwG/OlAWwMucyVsJFJis3Ua2SuBLGpfUNEROUlAQ1Y+gRe1or3GiR6z9NfYVEQt/ICHS8W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GfBblfg3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GfBblfg3"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493e8d4f4dcso34500405e9.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784042938; x=1784647738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09TcclYmaPCDKc6+KZii+R3xNkB+ca7ftigSvlljO8Q=;
        b=GfBblfg3V4AhQ9Y1uHsNefuUfkCLEWBXZ72vdRzrlRILtviBg0uiRYy6BFvhvoSdXn
         mDus/zcQBCfIKqBYzJTgjoHTxejorRrDolSK6u56p0RK34XxJXTPuJC2Yz/LM52Ejr4Q
         oGX0xAbUNj9JkIzz7hpIJhn8eq8M8lPawoLON5J11UapnhQFgAgLJ/pUK+uGavFn0/EN
         5Jpl+mohSIt7Pc6PPJnlzaknIW+SiqguRR20rDHQI5ar0C7+3OItHQE48QP/HVx/YeRH
         dmzBS0ydiBeVdgZTU1kqaVh60NxSrzd5KZAQk75FztGkD5hzP/ZMVQ7OPhXpygQyBNG6
         IcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784042938; x=1784647738;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09TcclYmaPCDKc6+KZii+R3xNkB+ca7ftigSvlljO8Q=;
        b=AUp56CBtITMI1z68JAfTlqecx9167ckwcXOSCzIA4CC+4mh/gSzrE6PGs9v0bY/mwt
         r8jkyaS2BrXlQ2In4GqtYzj25IwRlHAUDgI+iAaJ7lLzhGsoeeCqeuj4Z7Qs1N4Fb05S
         glyh+gCLrmTTSnYaAnnsZxS3uh5FbEV231RDNS63GJ69ZTAucDyOODPG4gypMzKuxaeQ
         BdSFKbKKCWTotJV/9zLeMJFfcLD13KckQU/9RUmZyvaHZVBvkKmJTbXPlPLYV/uPI7He
         MnOhZfuZcYn4vwl3gbLzJl6s6UVISzoEegrCsRmlMFya5HWW8keGo88+LqXuHf1+jnkZ
         xByA==
X-Gm-Message-State: AOJu0YzA7JXZ5Ycu8/D9JO0Q7Vpsqx4QfVwYW2tyolw5+NEnS7FrsLbj
	VHTjXyX/44/ssCmpjm1qekHu8cfXm/2rr6YO68o0UaSyPVBzFBuDn6Z1t0el+z2nI7g=
X-Gm-Gg: AfdE7clXqm7m5QdtROn8AM4XCSSn820LHmTQnz+gRGeCMMpB30BTiGRww+Me7fhjewi
	In7POll0BwWibqk24gvquL+tR5MtV/1R7J6JC1Jcz9deAswaIGxg0Q7ZgNeADssQsV4fhxvm/Uz
	12ehPnD2x71FJnQ6SPSx5T9sob45T493kFRzvOGktZbHr4mi0eE4+FSorhYA3xOg/TBsCSiY80L
	PdiVU8P+0Xo7A66snzXQpC3tB3Buh84d1l6ORf+BZW6Qmml9KYiHq10Ly/NGuzfUfiTrYE1qVUF
	kz8vZ2JVvklIyWiEDAAdat5ov/XTlyvptoGbYc+gR4IOZrpHETEEgvA6xt3Hl0/VRArcygla0aj
	NzCL60KP3CERkt2lziLYTnUvX6CFCA1YHHnaB6Gl8J9nPPvhego6o0DcuRXbTXH+fJVCTJC/EQy
	+6Hmg7/BXQjH6xczCFRsjZeyAj9hBiV7WIVs621dcWvkiK
X-Received: by 2002:a05:600d:6413:10b0:494:1cdd:4f9e with SMTP id 5b1f17b1804b1-4941cdd5035mr55153835e9.31.1784042937995;
        Tue, 14 Jul 2026 08:28:57 -0700 (PDT)
Received: from [192.168.0.25] (62.43.169.102.dyn.user.ono.com. [62.43.169.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493fd3ccfd4sm190589985e9.2.2026.07.14.08.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 08:28:57 -0700 (PDT)
Message-ID: <2e1731d4-71d9-4924-a728-0aa4821486cd@suse.com>
Date: Tue, 14 Jul 2026 17:28:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pmdomain: mediatek: Add support for secure modem
 power domain control
To: nikolai.burov@jolla.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, Nikolai Burov <nikolai.burov+review@abscue.de>
References: <20260714-mt6858-pmdomain-v1-0-4f09bbb822e0@jolla.com>
 <20260714-mt6858-pmdomain-v1-2-4f09bbb822e0@jolla.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 xsFNBFP1zgUBEAC21D6hk7//0kOmsUrE3eZ55kjc9DmFPKIz6l4NggqwQjBNRHIMh04BbCMY
 fL3eT7ZsYV5nur7zctmJ+vbszoOASXUpfq8M+S5hU2w7sBaVk5rpH9yW8CUWz2+ZpQXPJcFa
 OhLZuSKB1F5JcvLbETRjNzNU7B3TdS2+zkgQQdEyt7Ij2HXGLJ2w+yG2GuR9/iyCJRf10Okq
 gTh//XESJZ8S6KlOWbLXRE+yfkKDXQx2Jr1XuVvM3zPqH5FMg8reRVFsQ+vI0b+OlyekT/Xe
 0Hwvqkev95GG6x7yseJwI+2ydDH6M5O7fPKFW5mzAdDE2g/K9B4e2tYK6/rA7Fq4cqiAw1+u
 EgO44+eFgv082xtBez5WNkGn18vtw0LW3ESmKh19u6kEGoi0WZwslCNaGFrS4M7OH+aOJeqK
 fx5dIv2CEbxc6xnHY7dwkcHikTA4QdbdFeUSuj4YhIZ+0QlDVtS1QEXyvZbZky7ur9rHkZvP
 ZqlUsLJ2nOqsmahMTIQ8Mgx9SLEShWqD4kOF4zNfPJsgEMB49KbS2o9jxbGB+JKupjNddfxZ
 HlH1KF8QwCMZEYaTNogrVazuEJzx6JdRpR3sFda/0x5qjTadwIW6Cl9tkqe2h391dOGX1eOA
 1ntn9O/39KqSrWNGvm+1raHK+Ev1yPtn0Wxn+0oy1tl67TxUjQARAQABzSRNYXR0aGlhcyBC
 cnVnZ2VyIDxtYnJ1Z2dlckBzdXNlLmNvbT7CwXgEEwECACIFAlV6iM0CGwMGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAAAoJENkUC7JWEwLx6isQAIMGBgJnFWovDS7ClZtjz1LgoY8skcMU
 ghUZY4Z/rwwPqmMPbY8KYDdOFA+kMTEiAHOR+IyOVe2+HlMrXv/qYH4pRoxQKm8H9FbdZXgL
 bG8IPlBu80ZSOwWjVH+tG62KHW4RzssVrgXEFR1ZPTdbfN+9Gtf7kKxcGxWnurRJFzBEZi4s
 RfTSulQKqTxJ/sewOb/0kfGOJYPAt/QN5SUaWa6ILa5QFg8bLAj6bZ81CDStswDt/zJmAWp0
 08NOnhrZaTQdRU7mTMddUph5YVNXEXd3ThOl8PetTyoSCt04PPTDDmyeMgB5C3INLo1AXhEp
 NTdu+okvD56MqCxgMfexXiqYOkEWs/wv4LWC8V8EI3Z+DQ0YuoymI5MFPsW39aPmmBhSiacx
 diC+7cQVQRwBR6Oz/k9oLc+0/15mc+XlbvyYfscGWs6CEeidDQyNKE/yX75KjLUSvOXYV4d4
 UdaNrSoEcK/5XlW5IJNM9yae6ZOL8vZrs5u1+/w7pAlCDAAokz/As0vZ7xWiePrI+kTzuOt5
 psfJOdEoMKQWWFGd/9olX5ZAyh9iXk9TQprGUOaX6sFjDrsTRycmmD9i4PdQTawObEEiAfzx
 1m2MwiDs2nppsRr7qwAjyRhCq2TOAh0EDRNgYaSlbIXX/zp38FpK/9DMbtH14vVvG6FXog75
 HBoOzsFNBF3VOUgBEACbvyZOfLjgfB0hg0rhlAfpTmnFwm1TjkssGZKvgMr/t6v1yGm8nmmD
 MIa4jblx41MSDkUKFhyB80wqrAIB6SRX0h6DOLpQrjjxbV46nxB5ANLqwektI57yenr/O+ZS
 +GIuiSTu1kGEbP5ezmpCYk9dxqDsAyJ+4Rx/zxlKkKGZQHdZ+UlXYOnEXexKifkTDaLne6Zc
 up1EgkTDVmzam4MloyrA/fAjIx2t90gfVkEEkMhZX/nc/naYq1hDQqGN778CiWkqX3qimLqj
 1UsZ6qSl6qsozZxvVuOjlmafiVeXo28lEf9lPrzMG04pS3CFKU4HZsTwgOidBkI5ijbDSimI
 CDJ+luKPy6IjuyIETptbHZ9CmyaLgmtkGaENPqf+5iV4ZbQNFxmYTZSN56Q9ZS6Y3XeNpVm6
 FOFXrlKeFTTlyFlPy9TWcBMDCKsxV5eB5kYvDGGxx26Tec1vlVKxX3kQz8o62KWsfr1kvpeu
 fDzx/rFpoY91XJSKAFNZz99xa7DX6eQYkM2qN9K8HuJ7XXhHTxDbxpi3wsIlFdgzVa5iWhNw
 iFFJdSiEaAeaHu6yXjr39FrkIVoyFPfIJVyK4d1mHe77H47WxFw6FoVbcGTEoTL6e3HDwntn
 OGAU6CLYcaQ4aAz1HTcDrLBzSw/BuCSAXscIuKuyE/ZT+rFbLcLwOQARAQABwsF2BBgBCAAg
 FiEE5rmSGMDywyUcLDoX2RQLslYTAvEFAl3VOUgCGwwACgkQ2RQLslYTAvG11w/+Mcn28jxp
 0WLUdChZQoJBtl1nlkkdrIUojNT2RkT8UfPPMwNlgWBwJOzaSZRXIaWhK1elnRa10IwwHfWM
 GhB7nH0u0gIcSKnSKs1ebzRazI8IQdTfDH3VCQ6YMl+2bpPz4XeWqGVzcLAkamg9jsBWV6/N
 c0l8BNlHT5iH02E43lbDgCOxme2pArETyuuJ4tF36F7ntl1Eq1FE0Ypk5LjB602Gh2N+eOGv
 hnbkECywPmr7Hi5o7yh8bFOM52tKdGG+HM8KCY/sEpFRkDTA28XGNugjDyttOI4UZvURuvO6
 quuvdYW4rgLVgAXgLJdQEvpnUu2j/+LjjOJBQr12ICB8T/waFc/QmUzBFQGVc20SsmAi1H9c
 C4XB87oE4jjc/X1jASy7JCr6u5tbZa+tZjYGPZ1cMApTFLhO4tR/a/9v1Fy3fqWPNs3F4Ra3
 5irgg5jpAecT7DjFUCR/CNP5W6nywKn7MUm/19VSmj9uN484vg8w/XL49iung+Y+ZHCiSUGn
 LV6nybxdRG/jp8ZQdQQixPA9azZDzuTu+NjKtzIA5qtfZfmm8xC+kAwAMZ/ZnfCsKwN0bbnD
 YfO3B5Q131ASmu0kbwY03Mw4PhxDzZNrt4a89Y95dq5YkMtVH2Me1ZP063cFCCYCkvEAK/C8
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20260714-mt6858-pmdomain-v1-2-4f09bbb822e0@jolla.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/07/2026 15:43, Nikolai Burov via B4 Relay wrote:
> From: Nikolai Burov <nikolai.burov@jolla.com>
> 
> On recent MediaTek SoCs such as MT6858, the kernel is required to use
> a secure monitor call (SMC) to enable or disable the modem power domain.
> The power domain control register can be read, but firmware prevents it
> from being modified directly. Other parts of the power sequence, such as
> setting the ext_buck_iso register, still need to be performed on the
> kernel side.
> 
> In preparation for modem support, add a flag to enable this new power
> sequence for SoCs that need it.
> 
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
> ---
>   drivers/pmdomain/mediatek/mtk-pm-domains.c | 54 +++++++++++++++++++++++++++---
>   drivers/pmdomain/mediatek/mtk-pm-domains.h |  1 +
>   include/linux/soc/mediatek/mtk_sip_svc.h   |  3 ++
>   3 files changed, 53 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index e1cfd4223473..56437b32b252 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -57,6 +57,12 @@
>   
>   #define MTK_SIP_KERNEL_HWCCF_CONTROL	MTK_SIP_SMC_CMD(0x540)
>   
> +/* Power domain commands for MTK_SIP_KERNEL_CCCI_CONTROL */
> +enum {
> +	MTK_MD_MTCMOS_ENABLE = 18,
> +	MTK_MD_MTCMOS_DISABLE = 19,
> +};
> +
>   struct scpsys_domain {
>   	struct generic_pm_domain genpd;
>   	const struct scpsys_domain_data *data;
> @@ -615,6 +621,34 @@ static void scpsys_modem_pwrseq_off(struct scpsys_domain *pd)
>   		regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
>   }
>   
> +static bool scpsys_modem_sec_poll(unsigned long cmd)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_smc(MTK_SIP_KERNEL_CCCI_CONTROL, cmd, 1, 0, 0, 0, 0, 0, &res);
> +
> +	return res.a0 == 0;
> +}
> +
> +static int scpsys_modem_sec_power_on(bool on)
> +{
> +	struct arm_smccc_res res;
> +	unsigned long cmd = on ? MTK_MD_MTCMOS_ENABLE : MTK_MD_MTCMOS_DISABLE;
> +	bool tmp;
> +	int ret;
> +
> +	arm_smccc_smc(MTK_SIP_KERNEL_CCCI_CONTROL, cmd, 0, 0, 0, 0, 0, 0, &res);
> +	if (res.a0 == 0)
> +		return 0;
> +
> +	ret = readx_poll_timeout(scpsys_modem_sec_poll, cmd, tmp, tmp,
> +				 MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
>   static int scpsys_power_on(struct generic_pm_domain *genpd)
>   {
>   	struct scpsys_domain *pd = container_of(genpd, struct scpsys_domain, genpd);
> @@ -633,7 +667,9 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>   		regmap_clear_bits(scpsys->base, pd->data->ext_buck_iso_offs,
>   				  pd->data->ext_buck_iso_mask);
>   
> -	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
> +	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_SECURE))
> +		ret = scpsys_modem_sec_power_on(true);
> +	else if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
>   		ret = scpsys_modem_pwrseq_on(pd);

So we can have either cap MTK_SCPD_MODEM_SECURE or MTK_SCPD_MODEM_PWRSEQ but...

[...]

> @@ -719,10 +761,12 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>   	if (ret < 0)
>   		return ret;
>   
> -	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
> -		scpsys_modem_pwrseq_off(pd);
> -	else
> -		scpsys_ctl_pwrseq_off(pd);
> +	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_SECURE)) {
> +		if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))

... here it seems that a power domain could have both caps set. I suppose this 
second case does not exist, but code should treat just one of the two cases 
(mutual exclusive or not mutual exclusive).

Regards,
Matthias
