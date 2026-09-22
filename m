Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8C5306B3D
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790056917; cv=none; b=gp+Nv3XRQgbozf3yiSwZBlhxFNYP8ZQXQwGiI07V2K/T8if/LmcToZiXA5IZn9xRiT99va0i01tn21/i46i8Hb750ilgUyKD9iYMM1vcue2Uw3Q2Ql7cDzTRQrTXExLs6IgZYEB8B+OQEOS2yoS9hcBJCB0Ac1TB+e0IHs9uITk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790056917; c=relaxed/simple;
	bh=sDdKrJmvs5QWB2mO+IddhtMXz6qcKGamXBsMMe9RzFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DQDtawnFDpXpvrdOyP7xj+4ye4e5jPKbkn+dnYH1mATP/PnweLycgg5N2k68gln45BdH7UDbKFAlgz8+9zr1P+z9RmXPzAgfqGyVwpDVh7EKMOzv2x8XfMBmjASKSIUdRsImxDrill8qUiktbjfRjeKL9srgAjNDMCtU9zM3HUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhJnvQJA; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhJnvQJA"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so3628848a91.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 23:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790056915; x=1790661715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37Eexq0zFYxGYgBaFUWATikMtDj/TkGR7YrZ6T7c8q8=;
        b=fhJnvQJAHSiVbBZJWpejnHZ15mqHkOwtCOlvpAqWhbklWNe3zVTwiV1Ir7jT0AB7RW
         eLb3xugrmsvbBlp7DewfrfmWqapmA68wJWuZjez4H1q7jKi42sWZ15aTXLk/WbY0sIQV
         /dE2fB02jlWZDMZTdBP/XZV7g8ZKNu3GBt9HZu5nUPdhIJJMqiMVf20QhHnXDg3qhYi7
         M3i5qWS6Q84F1/IrDe+hFmd9/agCA3sax0sCdcxMv5lj4vhjNEBnHb+pJfNqqFy9tF4A
         eOfmVm6QC7yO82giPpXtomNou0Ueui02s4oiAmrxOW49YFsEhaRjb4/BNmofWIoyZLzR
         BFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790056915; x=1790661715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37Eexq0zFYxGYgBaFUWATikMtDj/TkGR7YrZ6T7c8q8=;
        b=Cwxyrm1dPnouRCpqnM6+sw05akxofj1h47F9ioANUsSiAaeO7mRfJpoIQ30APWCgHl
         /lRAQGYzE1yUyS329Cd0K49R1hcLYJhQip/lbJjZj1WfsCfSv83iMoYXxE8SPzEKHUjJ
         IM5cQ3p6MFPsft8tf4RHb+cH7/FEhm+uUxKyPbQ0Hux9CPdh0WuWcXl+6EWRHYC/fJ9s
         1+i8Qqq/q3sf6fHCWqNy/Ov+Gvv3T8vj+p9PuH7+DAtrt4CIEePIq1urxF9av8FatNXc
         DMN4Yvgb06lZc67PK1DvX5GM4Y7FVhuStIlAGOQ55wuF3MqD9uDo6AN00VArUxGHZYre
         vMQQ==
X-Forwarded-Encrypted: i=1; AKwUvByllj+WWUsvxbqcq/6JxuP9cFKjtmGEDEb5b09qLlBXLOHlb8pFwSd9G/fdzqqXRZTldezKwg1lOmoO@vger.kernel.org
X-Gm-Message-State: AFuF++lY9iko3GlpuiWTqnaGTD8Lp81bgCNdJsuiOcQomUEvZRg7nqeL
	R0p6JWZc3ZxmYiZo9lGUVKbRouwBBANyp6RAhtV7gCYa8Bc0oGB6vpLZ
X-Gm-Gg: AYBFou1IKgDB5348nYFlNC+9ZrjBaFlmDr96k5LlwyAZxkP53qn+O03SAqm8hh71XFm
	J2Uz+slOR/js3tFqZLtGqaRFTYg5+yBuYJO/emH7MLXqbOS3mmIsVwwjXZk4Bahp0lQPdzTf9eW
	PSjMYJFwhgvVX+2AXJpNMrTEk/qKKEZexqueM//CN91NfyQDWFYC07ia/X9Y/zB100kQST0CNV7
	D/NPnoVufVz9Qc6VluwCXFrb2tcV4Aa1UTyIzGw2SXR1lsPuIvoTzL3mLP6oNl5FtoN7sNf/YBz
	aY6m6yoCqjsqte/B6gdNt9gts0M7Z3qT6i8X8GJYR/aoSGqWA+pAPnJdh4YKp35/AcBdRdE1fCe
	L8cn7i9E76VT0zSb02tWYFImt0oIR4MEnpKEO3Wm4DuEPxCO3D1II/ewGzzr4KiBEEYL9ACOdlS
	6rIeYK0sbi/8cgSfvahSDuicEfocPcm1sUEt3O4pVtowfRecmdhxviI6RcXP5u1hua5xbns4zsP
	+kFQ22wpWb00NK4QYE=
X-Received: by 2002:a17:90b:558d:b0:39e:1ec8:ee7b with SMTP id 98e67ed59e1d1-3a07309f897mr123698a91.7.1790056915456;
        Mon, 21 Sep 2026 23:01:55 -0700 (PDT)
Received: from [10.25.133.25] ([165.85.205.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e8439sm2788903eec.3.2026.09.21.23.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:01:54 -0700 (PDT)
Message-ID: <878dc90c-3a4c-45fb-bfbb-2ba802bfc14c@gmail.com>
Date: Tue, 22 Sep 2026 14:01:46 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5 4/5] ASoC: fsl_asrc: expose individual DAIs per
 conversion path
To: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 shawnguo@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com,
 perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
References: <20260922033428.1690822-1-shengjiu.wang@oss.nxp.com>
 <20260922033428.1690822-5-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260922033428.1690822-5-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/2026 11:34 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The i.MX ASRC hardware supports three independent conversion pairs
> (A, B, C). The driver previously registered a single DAI with generic
> stream names "ASRC-Playback" and "ASRC-Capture", which prevents
> multiple independent conversion paths from being used simultaneously.
> 
> Replace the single fsl_asrc_dai instance with an array of three DAI
> drivers to allow up to three independent conversion paths to be active
> at the same time:
> 
>   asrc-0 -- ASRC-Playback / ASRC-Capture (backward compatible)
>   asrc-1 -- ASRC1-Playback / ASRC1-Capture
>   asrc-2 -- ASRC2-Playback / ASRC2-Capture
> 
> asrc-0 retains the original generic stream names to preserve backward
> compatibility with existing machine drivers and board configurations.
> Each DAI retains the same channel, rate and format capabilities as the
> original. Update the devm_snd_soc_register_component() call to register
> all three DAIs.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu

