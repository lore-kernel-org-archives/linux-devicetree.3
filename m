Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1B3367B9E
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 23:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784419165; cv=none; b=Ds6cNi9wkh2VxAUmqLPjnrZvycYYGXEGqTmUPmkqTVB2A7BIf4mLyggjeQ4AR9GebCnedKPV/BukSDXmsWxWmqjGiwWg+GZ/PWp+cZq2Lg38sw9NsjZBVOBLB1zjrzZmHd4kiSkvSLDBxc6tcPri+nv/DSbxt5TyC9wqVyElYdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784419165; c=relaxed/simple;
	bh=U6eCNFgQl24h5cm20ZPbYYjjWr7jTuXfAWCnv3wIP7w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GzXjELGaDRQ0O9+b9fGthZcq14GNZhsfnGbdX5YcGWnarr+QLKk8SVr2tbk/lOYYoyOY3IzIf1BU0rCcALKya1RoBDSQrQuXtIDTLU25T1HXFBNU/Y7CYgsQezoDmF+LF+DavnVV+aG8ALT9vqmnGs1NfZsRuiU6cnAs5MBuKBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aDJoJOkb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLvLDYMd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aDJoJOkb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLvLDYMd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IN2Bua1585053
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 23:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BlX0v5gGgT4IHLQD84AwHM3lT+72OwlqLgYbraMzkeQ=; b=aDJoJOkbPbd1hBaH
	wQFlvqiGWlGGvatrTTvap5oXvI2ICv80kI6pEj8Ytk+3/OzeRo5CtHhy4gaskW9C
	JOyMkMEH+WAbblgNBXYXGlWrwKZKPWI2gD/z94WKfzfJJ0/IQbzhAFCSS4OfhkFm
	dg/VA+iOrfQP5Jn/wqtiHlJ+aE9Vk0nN75dyKBrHyVCigMucZuCWPWYBeov1SxYY
	0EExm46cpaYTHMHQSTmCuEwiTt9JZh0hbK82dD3r7cgWMmU8YbMrkgoshIMhVtmG
	+jKj5hVHuSS6KRSEp9HL5UxWuwLtqU447Rommy6GWXCfvjwarTABJCRoCg+j3nZ5
	xG4IoQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhhrnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 23:59:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848568a6f62so15322261b3a.0
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 16:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784419163; x=1785023963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BlX0v5gGgT4IHLQD84AwHM3lT+72OwlqLgYbraMzkeQ=;
        b=DLvLDYMd4MaT6ZYrZNPktzaKIjIyNDZqBFCLZtzcex+5ZqrEozkRjdcqFZ/Xud1Y60
         Qqx7zWA7asKd7mT3yOXhB8tbx5bdHZ3Rf8bdj0JgI9s3IVvbwgr/hiHYLx8akdx4Jh5D
         A8vO+IfA1kR+i7I5LtomFBpkQiOK2vcm7aUsyibMQQiiQXpOpZh7qtYt4gs84M3knh0+
         sIEBxdg5bpDVRlruTS/tvpzzSbZF/JqZK6mypW4sFOqlprxHfjLJftUeqa+7FSJJH3GK
         ufH96fEKxbHpLoaAUIpH0QWZXqUF6xowE33Fc6QqQ7kXDpWZwOmCsRPIh0645WpdWvs0
         C2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784419163; x=1785023963;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BlX0v5gGgT4IHLQD84AwHM3lT+72OwlqLgYbraMzkeQ=;
        b=SXX3uJQpyT4jE4VRZpEH6JYjY+qUtBIng5d//SsFhtJv0k/IHVc2CtDNh5Y661t4+v
         /KkE2AE4O9Sy03PWsyKcl0KAZUkMBIuPYDosisFzOnVs3ZlZ5zNWazci18owVAtUMPhu
         L1zJm6Yz10NkXZkbypFmqdj/fk7way++/HrBh1PhVnbPr9+qv/UXM+qZcEUgSw9h0dKo
         JI0oXf//goNB+0PeE00G91QgVGVjueHu4MX31cscTvBXmkb0Ak9cPWDz5vX/Ec//06SY
         MjWTvZ+0vd9ZZBXY0Qyi6kqVpzLz1iIdGbuTmCBVQfccimkBY72FueaExopc+KeGn2Uq
         kiGw==
X-Forwarded-Encrypted: i=1; AHgh+Rp9XkDQlbVPhcD3ZtcckK6j1uGDNOtUISF9+ZWFujCFwLC+RE2yEJ7SirgxJsaITBCQxe2srFSaQ2Vs@vger.kernel.org
X-Gm-Message-State: AOJu0YylMLzAH+mCuR/dCjW4zb6be2h8NgBv2pcIawG6clrGhUoyu/Oc
	mrSO7KHDN4OSIWV8gAS5+QGyJsoDIWAwy68anKw2Yvwv/3cKoju90EeJxWW89UQnddyYHBGRZaj
	H/w1E9+oiDOLvR95Tu8Ye38dQzcLEnpxTmsEZ+oZQiA04Rj1n/rpEH0FV12eEwdmY
X-Gm-Gg: AfdE7cl8Pw+q3UeBpzxnP7SG9VLXbbxIJw3TB2dHHC+CSGqRuZlTWuOgD3DKoZ2kyxr
	gNnsTNJg++6hEAAQuunE3fiA/ePih60JDy/3hGxfOIGiMJcrIgrGqfw9JJt17pQRpMUIsYuJPqe
	B7YlStE12lfUPi/dtNkJJXPIP+vB//W2oxEmUsU3QALT6hfFBeEy0b+AcZoyJUwTOGry17JcFzx
	4V7TUj+slfLOMltkOgtMtzs5P0XBn2Q2+N9PLa8XmuwgdOYrbUCdDzmA5BzFbiB3IoOwm71a3SY
	hUEIJ9OvEhJkeQmqa8R8ttD0jQ9/rz9l1KR7j11mv4QfjVNL1okXa+qSVLAMKYLv2GtUcMyWCdX
	4wM0rSQJ7XXVTRIiw
X-Received: by 2002:a05:6a00:2d84:b0:84a:640f:1ae6 with SMTP id d2e1a72fcca58-84c295268bemr8231590b3a.67.1784419162741;
        Sat, 18 Jul 2026 16:59:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d84:b0:84a:640f:1ae6 with SMTP id d2e1a72fcca58-84c295268bemr8231557b3a.67.1784419162224;
        Sat, 18 Jul 2026 16:59:22 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af9f00bsm3396222b3a.56.2026.07.18.16.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:59:21 -0700 (PDT)
Date: Sun, 19 Jul 2026 00:59:18 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, Michael Auchter <michael.auchter@ni.com>,
        linux@analog.com, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Michael
 Hennerich <Michael.Hennerich@analog.com>,
        David Lechner
 <dlechner@baylibre.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook
 <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>, sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/8] iio: dac: ad5686: refactor command/data macros
Message-ID: <20260719005918.1e58ebf4@jic23-huawei>
In-Reply-To: <20260716-ad5686-new-features-v8-3-ebb0051af5e5@analog.com>
References: <20260716-ad5686-new-features-v8-0-ebb0051af5e5@analog.com>
	<20260716-ad5686-new-features-v8-3-ebb0051af5e5@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5c135b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=IpJZQVW2AAAA:8 a=ORtW8YiJEmzS7SvgJCwA:9
 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: -KlKR7qVeBMjm_X2YTjTutE3-eNvs11t
X-Proofpoint-ORIG-GUID: -KlKR7qVeBMjm_X2YTjTutE3-eNvs11t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDI1MSBTYWx0ZWRfX+G3JivXopsLL
 IKI92H+jv2rdxHT9Pycd0Vz0t4O0vQmFTwVN00Pc5Uj7kCb7mPkeQcVKl0ESHs1ksAg2IXIryZK
 VC8WEKIEb9RiK4Fe505fSoTl8l7WjHMsW00XDZdzZB6frnyFLpZ7lGDTYHqbXuIHUUpbjoxGre0
 bLi3gzqvjDU9xvYsASyBHze5U8uu6GjYBRGZp+Sim1KhnPPzfCUaY1sRWpv2GYrqWkioRc9Xdvi
 YLya8r7SBPa9Zjwea/TcbQltR9OguD0b1fWYD/KgpOIWPelxh1DYc1rF0b4zVw3kBIdGD/83YxM
 TTnMDdATbC1xEX/1y6WGXvgXwSls703xMgRvfA0OUYFaPbWBW08MU6gzVGCln3PBiYV9TaXA3vW
 u1FV+mSSIOWZleV+U4X3Bb96r25MqwbGfxp2NgE1QHx/Ql65dGx6cOwEjNBR6m/bfb0bojNxncj
 Ix7UyAWFYvHa7Gp6KNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDI1MSBTYWx0ZWRfXyWm++sECAjOA
 tQaCDrWOQTxAJNW9Dj8nTllMvk9KZTUnHRdn8C7aqcFdlkBQTeQ5uAr3y/3YJgYisPdN+qdsADP
 DpwyU4Tp8TllCfMrLAMpNZTwZcaG8KI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180251

On Thu, 16 Jul 2026 13:14:19 +0100
Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:

> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Replace usage of bit shifting macros for FIELD_PREP(), which would not
> ignore bit masking when preparing SPI/I2C commands. This change is a code
> hardening measure to be paired with the upcoming triggered buffer support.
> For the AD5310 regmap case, 16-bit data coming from the buffer may overlap
> with command bits if the data field is unmasked.
> 
> *_REF_BIT_MSK and *_PD_MSK bit position macros are renamed (with a DATA
> prefix) so to indicate that they are relative to the DATA field.
> 
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/all/20260628143026.EC6CA1F000E9@smtp.kernel.org/
> Reviewed-by: David Lechner <dlechner@baylibre.com>
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
Some fuzz when applying this due at least partly to crossing with various
header cleanup related series. Please check I didn't mess it up!

Thanks,

Jonathan

> ---
>  drivers/iio/dac/ad5686-spi.c | 21 +++++++++++----------
>  drivers/iio/dac/ad5686.c     | 10 +++++-----
>  drivers/iio/dac/ad5686.h     | 22 ++++++++++++----------
>  drivers/iio/dac/ad5696-i2c.c | 11 ++++++-----
>  4 files changed, 34 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/iio/dac/ad5686-spi.c b/drivers/iio/dac/ad5686-spi.c
> index 6b6ef1d7071f..d3b64b4361d5 100644
> --- a/drivers/iio/dac/ad5686-spi.c
> +++ b/drivers/iio/dac/ad5686-spi.c
> @@ -9,6 +9,7 @@
>   */
>  
>  #include <linux/array_size.h>
> +#include <linux/bitfield.h>
>  #include <linux/errno.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> @@ -26,21 +27,21 @@ static int ad5686_spi_write(struct ad5686_state *st,
>  
>  	switch (st->chip_info->regmap_type) {
>  	case AD5310_REGMAP:
> -		st->data[0].d16 = cpu_to_be16(AD5310_CMD(cmd) |
> -					      val);
> +		st->data[0].d16 = cpu_to_be16(FIELD_PREP(AD5310_CMD_MSK, cmd) |
> +					      FIELD_PREP(AD5310_DATA_MSK, val));
>  		buf = &st->data[0].d8[0];
>  		tx_len = 2;
>  		break;
>  	case AD5683_REGMAP:
> -		st->data[0].d32 = cpu_to_be32(AD5686_CMD(cmd) |
> -					      AD5683_DATA(val));
> +		st->data[0].d32 = cpu_to_be32(FIELD_PREP(AD5686_CMD_MSK, cmd) |
> +					      FIELD_PREP(AD5683_DATA_MSK, val));
>  		buf = &st->data[0].d8[1];
>  		tx_len = 3;
>  		break;
>  	case AD5686_REGMAP:
> -		st->data[0].d32 = cpu_to_be32(AD5686_CMD(cmd) |
> -					      AD5686_ADDR(addr) |
> -					      val);
> +		st->data[0].d32 = cpu_to_be32(FIELD_PREP(AD5686_CMD_MSK, cmd) |
> +					      FIELD_PREP(AD5686_ADDR_MSK, addr) |
> +					      FIELD_PREP(AD5686_DATA_MSK, val));
>  		buf = &st->data[0].d8[1];
>  		tx_len = 3;
>  		break;
> @@ -81,9 +82,9 @@ static int ad5686_spi_read(struct ad5686_state *st, u8 addr)
>  		return -EINVAL;
>  	}
>  
> -	st->data[0].d32 = cpu_to_be32(AD5686_CMD(cmd) |
> -				      AD5686_ADDR(addr));
> -	st->data[1].d32 = cpu_to_be32(AD5686_CMD(AD5686_CMD_NOOP));
> +	st->data[0].d32 = cpu_to_be32(FIELD_PREP(AD5686_CMD_MSK, cmd) |
> +				      FIELD_PREP(AD5686_ADDR_MSK, addr));
> +	st->data[1].d32 = cpu_to_be32(FIELD_PREP(AD5686_CMD_MSK, AD5686_CMD_NOOP));
>  
>  	ret = spi_sync_transfer(spi, t, ARRAY_SIZE(t));
>  	if (ret < 0)
> diff --git a/drivers/iio/dac/ad5686.c b/drivers/iio/dac/ad5686.c
> index d34250647aa4..c285aeed44d1 100644
> --- a/drivers/iio/dac/ad5686.c
> +++ b/drivers/iio/dac/ad5686.c
> @@ -35,8 +35,8 @@ static int ad5310_control_sync(struct ad5686_state *st)
>  	unsigned int pd_val = st->pwr_down_mask & st->pwr_down_mode;
>  
>  	return ad5686_write(st, AD5686_CMD_CONTROL_REG, 0,
> -			    FIELD_PREP(AD5310_PD_MSK, pd_val & AD5686_PD_MSK) |
> -			    FIELD_PREP(AD5310_REF_BIT_MSK, st->use_internal_vref ? 0 : 1));
> +			    FIELD_PREP(AD5310_DATA_PD_MSK, pd_val & AD5686_PD_MSK) |
> +			    FIELD_PREP(AD5310_DATA_REF_MSK, st->use_internal_vref ? 0 : 1));
>  }
>  
>  static int ad5683_control_sync(struct ad5686_state *st)
> @@ -44,8 +44,8 @@ static int ad5683_control_sync(struct ad5686_state *st)
>  	unsigned int pd_val = st->pwr_down_mask & st->pwr_down_mode;
>  
>  	return ad5686_write(st, AD5686_CMD_CONTROL_REG, 0,
> -			    FIELD_PREP(AD5683_PD_MSK, pd_val & AD5686_PD_MSK) |
> -			    FIELD_PREP(AD5683_REF_BIT_MSK, st->use_internal_vref ? 0 : 1));
> +			    FIELD_PREP(AD5683_DATA_PD_MSK, pd_val & AD5686_PD_MSK) |
> +			    FIELD_PREP(AD5683_DATA_REF_MSK, st->use_internal_vref ? 0 : 1));
>  }
>  
>  static inline unsigned int ad5686_pd_mask_shift(const struct iio_chan_spec *chan)
> @@ -565,7 +565,7 @@ int ad5686_probe(struct device *dev,
>  		break;
>  	case AD5686_REGMAP:
>  		ret = ad5686_write(st, AD5686_CMD_INTERNAL_REFER_SETUP, 0,
> -				   st->use_internal_vref ? 0 : AD5686_REF_BIT_MSK);
> +				   st->use_internal_vref ? 0 : AD5686_DATA_REF_MSK);
>  		if (ret)
>  			return ret;
>  		break;
> diff --git a/drivers/iio/dac/ad5686.h b/drivers/iio/dac/ad5686.h
> index c424720f8f72..32cb3931413c 100644
> --- a/drivers/iio/dac/ad5686.h
> +++ b/drivers/iio/dac/ad5686.h
> @@ -14,12 +14,14 @@
>  
>  #include <linux/iio/iio.h>
>  
> -#define AD5310_CMD(x)				((x) << 12)
> +#define AD5310_CMD_MSK				GENMASK(15, 12)
> +#define AD5310_DATA_MSK				GENMASK(11, 0)
>  
> -#define AD5683_DATA(x)				((x) << 4)
> +#define AD5683_DATA_MSK				GENMASK(19, 4)
>  
> -#define AD5686_ADDR(x)				((x) << 16)
> -#define AD5686_CMD(x)				((x) << 20)
> +#define AD5686_CMD_MSK				GENMASK(23, 20)
> +#define AD5686_ADDR_MSK				GENMASK(19, 16)
> +#define AD5686_DATA_MSK				GENMASK(15, 0)
>  
>  #define AD5686_ADDR_DAC(chan)			(0x1 << (chan))
>  #define AD5686_ADDR_ALL_DAC			0xF
> @@ -38,15 +40,15 @@
>  #define AD5686_CMD_CONTROL_REG			0x4
>  #define AD5686_CMD_READBACK_ENABLE_V2		0x5
>  
> -#define AD5310_REF_BIT_MSK			BIT(8)
> -#define AD5310_PD_MSK				GENMASK(10, 9)
> +#define AD5310_DATA_REF_MSK			BIT(8)
> +#define AD5310_DATA_PD_MSK			GENMASK(10, 9)
>  
> -#define AD5683_REF_BIT_MSK			BIT(12)
> -#define AD5683_PD_MSK				GENMASK(14, 13)
> +#define AD5683_DATA_REF_MSK			BIT(12) /* DB16 */
> +#define AD5683_DATA_PD_MSK			GENMASK(14, 13) /* DB18:DB17 */
> +
> +#define AD5686_DATA_REF_MSK			BIT(0)
>  
> -#define AD5686_REF_BIT_MSK			BIT(0)
>  #define AD5686_PD_MSK				GENMASK(1, 0)
> -
>  #define AD5686_PD_MODE_1K_TO_GND		0x1
>  #define AD5686_PD_MODE_100K_TO_GND		0x2
>  #define AD5686_PD_MODE_THREE_STATE		0x3
> diff --git a/drivers/iio/dac/ad5696-i2c.c b/drivers/iio/dac/ad5696-i2c.c
> index 551b200bfe14..2c95d394a1c0 100644
> --- a/drivers/iio/dac/ad5696-i2c.c
> +++ b/drivers/iio/dac/ad5696-i2c.c
> @@ -8,6 +8,7 @@
>   */
>  
>  #include <linux/array_size.h>
> +#include <linux/bitfield.h>
>  #include <linux/errno.h>
>  #include <linux/i2c.h>
>  #include <linux/mod_devicetable.h>
> @@ -36,9 +37,8 @@ static int ad5686_i2c_read(struct ad5686_state *st, u8 addr)
>  	};
>  	int ret;
>  
> -	st->data[0].d32 = cpu_to_be32(AD5686_CMD(AD5686_CMD_NOOP) |
> -				      AD5686_ADDR(addr) |
> -				      0x00);
> +	st->data[0].d32 = cpu_to_be32(FIELD_PREP(AD5686_CMD_MSK, AD5686_CMD_NOOP) |
> +				      FIELD_PREP(AD5686_ADDR_MSK, addr));
>  
>  	ret = i2c_transfer(i2c->adapter, msg, ARRAY_SIZE(msg));
>  	if (ret < 0)
> @@ -55,8 +55,9 @@ static int ad5686_i2c_write(struct ad5686_state *st,
>  	struct i2c_client *i2c = to_i2c_client(st->dev);
>  	int ret;
>  
> -	st->data[0].d32 = cpu_to_be32(AD5686_CMD(cmd) | AD5686_ADDR(addr)
> -				      | val);
> +	st->data[0].d32 = cpu_to_be32(FIELD_PREP(AD5686_CMD_MSK, cmd) |
> +				      FIELD_PREP(AD5686_ADDR_MSK, addr) |
> +				      FIELD_PREP(AD5686_DATA_MSK, val));
>  
>  	ret = i2c_master_send(i2c, &st->data[0].d8[1], 3);
>  	if (ret < 0)
> 

