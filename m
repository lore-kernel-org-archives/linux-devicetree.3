Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D434BB5BD
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493480; cv=none; b=eMjPp036g//DlrJQRAOkfwjF+fpTL5seWSlibLt75fqlzhcF5mjQP9YIZRsdolpvZZ2mXpTzURjaiWl7QMgx8dswKdSLBO8vuY7sS7thEQkmDo5xBPlwY+GrCIzfmy3Rdpiyz6LhGZ9fU/34JCwGeMzvMS/HVc2g8Yu/c3S9lb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493480; c=relaxed/simple;
	bh=o9xq46vXu5Tdoa925A4y5EdPo5VNKEplp1aJ/lym32Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kp7GZYt/HE8cu7UBRrNip/OyX0wAjsr3liWwBTSAmWbyj0DeMShT84AENK7nXOQm228CVOMY7E84wIEoXrXmvEowzIuFyUSp2/yflXG1kISvDjvOTj0iQj///8DpUMn9nQ/HyddQtkED51MwbUkXD7uU0v/YaKS0xOsveMzntvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJqWvuh/; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJqWvuh/"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so3579982a91.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789493477; x=1790098277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ybh+8iD5mGNcd8ks8NS+pX/Np+RtyJxn1trRvhxScPk=;
        b=CJqWvuh/GZHITGkwwN1wlA/gXya0cBi6C0thJSOcBJcPo6268fvWrxtTe1yvEEahjC
         afJJgvv3SMj7mZx0vWibFbS3vGoRFuZgumC6s34WxzDqUJnsvGpr8wmmu3fRbk/L9wVf
         5TvYuHNUGxeJK8HxOGUmNE6smHZ63hQl9f+EsDiHq00R7IUIpMgRh+Ul2BofEJDrswrZ
         q6j82SwlJjhK7omnW9RFbF8MX6GngyVBNNP9HF62wRyUH6v4Xy6Dflr2kBEKLA3cCIvk
         kVKp7E0JxVcI+P2EzxQuwdl75isUmSkxR5VbFsu68mIzB9/uGaK1dyDy/xupBfL1NQon
         wBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789493477; x=1790098277;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ybh+8iD5mGNcd8ks8NS+pX/Np+RtyJxn1trRvhxScPk=;
        b=Z7gmuuIwTJqR68B9CJTawDB7FJR2IbkLTaXBmJ3sshePzn19W5SCxW/i5IzUolRAdj
         TP+QFysLbzAjvlLjpSzG0joZ+LTRHe6wDcJW8bwn7ylkdSL8wrNco6tMC06n06x67lm/
         7mRhkU70SiTREpv0IUcWOpJJrDyZ5dTpzUjYaWWqN/z6RI10YnB2j92h0YLFeqGUvf4o
         7Er4Os08JfNENXvfOyp8IuJvGek+Jf6CR1DkzFpqtVAbBtHIVS3C9mrS5J1GrOFSrcMP
         mSRpXgr0RvmRIogWfHGaVRVnrprAQAfsArr8b06gjyL6x5tziaDC0bJOSFQFUi3ZB8EW
         E4KQ==
X-Forwarded-Encrypted: i=1; AKwUvBwE799mQeSPl272m4FVMd6Pf4R6XuWe50ziyRx6mpgDgcyYNfQfmk4neyYiIoGcGW0DrEzYVeDV0Odc@vger.kernel.org
X-Gm-Message-State: AFuF++nSXcXegZ2Riy4jyXoW1o4q6qPab55IrkawbGAu4IYxn2i/Czr+
	JUoVBVNQbhVYgjDJmnUooTBiWIIJf27AxdlM8lhK4RtlB9VC8rXO46UI
X-Gm-Gg: AYBFou1fb61EE3VDp6ylbQdVYHz3T+5Kr4hVOOqzqIzDKoUzEZ8nZnNbXPCZ6LpOx8W
	ScYYZDsXtAzv4JIur2nC4z2cgNyJlGhkgLpl07GIM67VJdunskkqIglo8qu/LXgloTmKhnJoRe1
	Eqg/u94bAtdWHVHu+6Bd2ns/5LljCTr+t8yYCEkNDcZXFiPzpzKEcH0O6zO9hf1hAKdlom3TXJs
	UFKjy9dROaWr7KxOS0wNJ3IQSGm/1nwVDt+r+H46Avq/JLMVEAwxQO1iHULCkH7LMg+YZUez2sp
	tQxxzLC87/pLKZssLq0uDuhQ4hbw9AC69Tn0xZSSEXPyS3hYzckFvALsy7EkYLMNDw5Wh1+0vOa
	nYeWaduWd9qPyGh2hnLT4OA3GULBG5RKjIkTwhhV4eeRzeixCf+qqgZbGyntLoyuxrEGS3a4/yh
	tsemVxlIUo0cTGMJmg1udxCNmWLC2ECzQePVx2kdr9ACLd71Bm4LGSIhbc53RdHsVSVJ0pbVYRg
	FrpxlPmFIZiN5EIgVZ7GlPtD5hYlnWCeKA01KWelXYTNz5A
X-Received: by 2002:a17:90b:50c8:b0:39d:f773:37b5 with SMTP id 98e67ed59e1d1-39df7733906mr14510340a91.0.1789493472947;
        Tue, 15 Sep 2026 10:31:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfbb55b01sm2153011a91.4.2026.09.15.10.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 10:31:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <64518f1b-9c17-4fa7-8582-dc399728111a@roeck-us.net>
Date: Tue, 15 Sep 2026 10:31:10 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] hwmon: (pmbus/tps53679) Fix TPS53676 phase page
 decoding
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>,
 Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20260915164823.160977-1-sanman.pradhan@hpe.com>
 <20260915164823.160977-2-sanman.pradhan@hpe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260915164823.160977-2-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 9/15/26 09:48, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> tps53676_identify() reads the USER_DATA_03 phase configuration to count
> the phases assigned to each channel and derive the number of PMBus pages.
> In each 16-bit phase descriptor the channel (PAGE) is encoded in bit 4 and
> the firing order in bits 3:0, but the code tested bit 3 (0x08), which is
> part of the firing-order field.
> 
> TPS53676 supports up to seven phases, so firing-order bit 3 is never set.
> As a result the existing test classifies every enabled phase as channel A.
> On a dual-channel configuration the phases assigned to channel B are
> therefore miscounted as channel A and page 1 is not exposed.
> 
> Test the PAGE field (bit 4) instead.
> 

tps53676_identify() has a second problem: It does not set the current page
to 0 for single-page systems. If the BIOS/ROMMON had selected page 1 for
some reason, the page register is never updated because pmbus_set_page()
does not set the page number if the number of pages is 1. Please fix that
as well.

Thanks,
Guenter

> Fixes: cb3d37b59012 ("hwmon: (pmbus/tps53679) Add support for TI TPS53676")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> ---
>   drivers/hwmon/pmbus/tps53679.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
> index fa0fdf1e3e6c9..680339a6b90fe 100644
> --- a/drivers/hwmon/pmbus/tps53679.c
> +++ b/drivers/hwmon/pmbus/tps53679.c
> @@ -188,7 +188,7 @@ static int tps53676_identify(struct i2c_client *client,
>   		return -EIO;
>   	for (i = 0; i < 2 * TPS53676_MAX_PHASES; i += 2) {
>   		if (buf[i + 1] & 0x80) {
> -			if (buf[i] & 0x08)
> +			if (buf[i] & BIT(4))
>   				phases_b++;
>   			else
>   				phases_a++;

