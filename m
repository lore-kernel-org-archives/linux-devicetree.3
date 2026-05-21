Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CCE3C4B6F
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 12:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779364823; cv=none; b=POd8ZFVKvC1pqV++b8Xv47qPKEkj7hBAqFg096lIDvBL5baBZiIJG42SHDyUAAa2hfwAyKRXdAV/NCXFhUFPc9/SpqrbKs5mz9n9nGNTjqJsjiDyLm2NtmCfLYemnvSTtejVW8PKF+nw3cg1vqEyObDZU5EQm6aIyx4xbNRMyNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779364823; c=relaxed/simple;
	bh=SHgxTl7i8ZJcoJsANiAFTcbeJAToHEACN55Qh8i2i6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPVnrI9vN4jQ8q37Ms4FZ62QLTbPoWS/TvOC3Y/6VD/fc2Q0PY2OyyPAmvkGONBFkmU7kKTgm6UF3R/6duaj1QKs2kPtB0ARoAwcxZ5bhAVmPKfsZ33oyKeAEQkq6mWpZAkTc7SUs8NiSzkawXnoMSFTXQemguFJY4nIPuxjKEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qr8twvrP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qr8twvrP"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48896199cbaso47086675e9.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 05:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779364820; x=1779969620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CyUjlgC7rWY0SffOj02D7tXJ5nKvMClnXbMF17mpGVU=;
        b=qr8twvrPrsik9O3eSGYnPGqLhfZy1H8fJ8RcAQdP9z1YUBWMoKhiVacap3AcxDm57I
         QyToA06UThOCleWBwaDNOOZ7JhyfxsqyMMOGjIbsQcQXzDukpXRMsGh8YkThHCLGR9hr
         EwQdAc/mPYYf/i7APD9NKUpLrUInMFgjzkBP/bCh+/DC4AHps9xct8uZGdk7u1Gee4Og
         z7sGBs31M/FoWNRdExWB3H/ytTzZWMSoIUcuq8lTLgg2UU5hAexVeZJNephsuarJfcYM
         HXnSxQu13sLLqSXAxsRY+UIwlYsbedu4fXhf1wArFwEH/lV8rQ4mOq+LYCjPInJTCJbp
         pGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779364820; x=1779969620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CyUjlgC7rWY0SffOj02D7tXJ5nKvMClnXbMF17mpGVU=;
        b=pUwo7WYKMh3YyTcZpmB2NF3Wz5nt0DErQcCawGW/ClhaV5bcGrE3k2eFe9OzrO/flq
         2XIWNIzNAuYMqSXZRxOM+BwWjKnUYpoPxUjObwt08YeiJWQA8I5Qozt7PVeGY1gRGAI4
         Q9oayrbRWYjZpe/wO+qKcAezzHf1KF6wdkXmVwD23bxMG084RywSpexAxu6wYwrDa26f
         AJH42zwRJVoyn7BbDZ2RHal4LW+fbyQTMJ47NCNo3PEFrkbkmc7YMrXOfcm910HE8DpQ
         I7VZQKetCRp9mnKITJwlrW9vt8Gq5wUPuhEMAc9nvQX+VmJvC0WIvly/0k03I80Gek94
         f5Ig==
X-Forwarded-Encrypted: i=1; AFNElJ9tplyUgqJG+XsW2UJyBnL0uXFWxPWr7H37TaEKbQ42RizeIQbfZeBuITWetxk47qIWgEm/3MsjW+9+@vger.kernel.org
X-Gm-Message-State: AOJu0YxzNHS479Parim+RmaMhAyCB+0+XxvXD8cDgF2FPGVGz5PKQjqM
	sUYcWsnlmEeOrWGYamnq9Qqu6ONcenSRiiW3mSoVkWQt+DJSbXMqsobg0XG07em/5hg=
X-Gm-Gg: Acq92OHxG0cGKJY8nS0x6e8ij6Jx9pvIyGCWwuENptLaT8jQglVVJZj6mgI4Vw3PRjW
	4zKW/nHMjekZKBaYOeZlK8tT6grw/pQlEEzvRTHqNNC9LaVB4FYdD3N0h6sr0LP3ZKAdzNSFQ7a
	WvSEHJcMBudWJFy9pUNpbaEHVaPixkXIj0kUD5dY0jFfqnFBGRMVGLbPFHHVvjIfFD4X2kG8PPL
	WS92erf/TDASILZGuP0TZNIBdZVEpdVasGqT1RRDNq+txtKrdcXGtgyiUekz7dpeVRCtMIKSFWv
	anpOMUsOmYx3OSwjUyrdOVA61tL7l9S+woVJ2wqCNNNstTSLnBCQ2Nnww2CW5d11gy00famG0xe
	lKJsoIYmh/7lv9QGitS/4Aib8Je0UCDP3/fIJxj+ZnQ9MNcwRlJlBmExVmvbnkK84HF4aKdNdxP
	0iW9QEfVo1P7heaauovCb7jMoDFkbsmKCdpzi7YeSjpAAb
X-Received: by 2002:a05:600c:4fc7:b0:48a:66a8:9981 with SMTP id 5b1f17b1804b1-490360ddce0mr34321265e9.27.1779364819051;
        Thu, 21 May 2026 05:00:19 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.55.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7dd9e6sm2386503f8f.16.2026.05.21.05.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 05:00:18 -0700 (PDT)
Message-ID: <5cb46913-9aa5-4a12-b18f-5eccb6ca861b@linaro.org>
Date: Thu, 21 May 2026 13:00:17 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] phy: qcom: qmp-combo: track whether the cached
 typec_mux mode was committed to hardware
To: Michael Scott <mike.scott@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
 abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
 linux-phy@lists.infradead.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, val@packett.cool, laurentiu.tudor1@dell.com,
 alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
 <20260521010935.1333494-3-mike.scott@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260521010935.1333494-3-mike.scott@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/05/2026 02:09, Michael Scott wrote:
> qmp_combo_typec_mux_set() updates qmp->qmpphy_mode (the cached state)
> unconditionally, but only reprograms hardware when qmp->init_count is
> non-zero. If pmic_glink_altmode (or any other typec_mux consumer)
> calls into the PHY before DWC3 has performed phy_init() -- a real
> ordering observed during testing of USB-C role-switch enablement on
> Snapdragon X (X1E80100) -- the cache transitions away from the
> probe default QMPPHY_MODE_USB3DP but the hardware is never touched.
> 
> Subsequent calls (for example on partner detach, where TYPEC_STATE_SAFE
> also resolves to QMPPHY_MODE_USB3_ONLY in the !DP-SVID branch) then
> match the cached mode and the function bails out early with:
> 
>    qcom-qmp-combo-phy faXX000.phy: typec_mux_set: same qmpphy mode, bail out
> 
> leaving the lane mux in whatever configuration it powered up in. On
> the Dell Latitude 7455 this manifests as the SS lanes being left in
> the default state when the first altmode notification arrives during
> DWC3 probe, with the function bailing out on every subsequent attach.
> 
> Track separately whether the cached mode has actually been committed
> to hardware. The bail-out optimization is only safe when the cache
> truly reflects the hardware:
> 
>    - qmp_combo_typec_mux_set(): bail only when the cached mode matches
>      and was committed; clear the committed flag whenever the cache is
>      updated, set it again after a successful reprogram inside the
>      init_count-guarded block.
> 
>    - qmp_combo_com_init(): set the committed flag at the end of a
>      successful init, since com_init() programs registers from the
>      cached qmpphy_mode.
> 
> No behavioural change on platforms where typec_mux_set never fires
> before phy_init -- committed remains true through normal operation.
> 
> Signed-off-by: Michael Scott <mike.scott@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 25 +++++++++++++++++++++--
>   1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 0db200292642..e28bc1cc7a78 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -2295,6 +2295,7 @@ struct qmp_combo {
>   	struct mutex phy_mutex;
>   	int init_count;
>   	enum qmpphy_mode qmpphy_mode;
> +	bool qmpphy_mode_committed;
>   
>   	struct phy *usb_phy;
>   	enum phy_mode phy_mode;
> @@ -3754,6 +3755,9 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
>   	qphy_setbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>   			SW_PWRDN);
>   
> +	/* com_init() just programmed registers from qmp->qmpphy_mode. */
> +	qmp->qmpphy_mode_committed = true;
> +
>   	return 0;
>   
>   err_disable_clocks:
> @@ -4509,9 +4513,22 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
>   		new_mode = QMPPHY_MODE_USB3_ONLY;
>   	}
>   
> +	/*
> +	 * Fast-path bail only when the cached mode is also known to be
> +	 * committed to hardware. The cache may be ahead of the hardware
> +	 * if a typec_mux_set arrived while the PHY had not yet been
> +	 * initialised (init_count == 0); in that case the cache update
> +	 * below was the only thing that ran, and we still need to drive
> +	 * the registers when the PHY does come up.
> +	 */
>   	if (new_mode == qmp->qmpphy_mode) {
> -		dev_dbg(qmp->dev, "typec_mux_set: same qmpphy mode, bail out\n");
> -		return 0;
> +		if (qmp->qmpphy_mode_committed) {
> +			dev_dbg(qmp->dev,
> +				"typec_mux_set: same qmpphy mode (committed), bail out\n");
> +			return 0;
> +		}
> +		dev_dbg(qmp->dev,
> +			"typec_mux_set: same qmpphy mode but uncommitted; reprogramming\n");
>   	}
>   
>   	if (qmp->qmpphy_mode != QMPPHY_MODE_USB3_ONLY && qmp->dp_powered_on) {
> @@ -4523,6 +4540,7 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
>   		qmp->qmpphy_mode, new_mode);
>   
>   	qmp->qmpphy_mode = new_mode;
> +	qmp->qmpphy_mode_committed = false;
>   
>   	if (qmp->init_count) {
>   		if (qmp->usb_init_count)
> @@ -4551,6 +4569,9 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
>   			if (qmp->dp_init_count)
>   				cfg->dp_aux_init(qmp);
>   		}
> +
> +		/* Reprogram complete; cache now reflects hardware. */
> +		qmp->qmpphy_mode_committed = true;
>   	}
>   
>   	return 0;

Can we not make the commit to hardware atomic from the perspective of 
the caller ?

i.e. use a workqueue and a completion timeout when setting ?

---
bod
