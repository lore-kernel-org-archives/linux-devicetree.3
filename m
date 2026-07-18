Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5189636CDE3
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 23:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784418040; cv=none; b=t44QxEk+z3wiMzSt5OHlXVhy3V5WrrIEDVVKUJ6gvAcqi3kMggL5QU5O+OEVeQ/EMVe7EIZR+BpDlY46+YrQsRuEkgww4NDO7UJ9mO70BsV8k2tyQ4SbczjOqRfMCsKNWhCWmZelVBVGOPCGmFvIblIEc+JAwPnHUZq+y7Tnc78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784418040; c=relaxed/simple;
	bh=XWCs4fUBo6gGQ1M2CVgFrj56MJznDKoZZ3l/K7qUBiA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=asGIfX+Yr8KDRpW+Fwwgk/Qe2o3x4Euuj0i5o1cVRHgsK/qOw5dOC7tDPSS1Bxe5CeXrVfLLi4mJ36ZpxNH4iXiKLWCk9RIMLnDSgnjiq6nEbWCzjsOGQb+7LWuvs+UwYCHniIjmwA8e+k2gL6t8al63UPLp9GVYzLlwt/diTqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqeFNGzO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Djgrl4pZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqeFNGzO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Djgrl4pZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IN2hLS1812869
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 23:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z3Q9taMjWV9GchlGB3+zBzhpobDtgh7Q1RKR4fp9cao=; b=eqeFNGzOzq/LuXAC
	rrVczsovsIm/nfjblLpCpc22YiURUUBI5y3tPn0mnzSpcy/r89538s+VpcWdvE04
	7Wv9HcU1dXRknHJfqImE6MUJN2i0YMQS7BU/eiILFbzjrvbq2fG2n/qge8+FEYwF
	ikOaOgM9Fpm2rDPqAba2fqWRj5eYnBRUf0hmyYKPHkX2t3UA2GGfeX+jywd9VFZW
	rpgj0SVXtFpxWz4KDSJaxvl/WfJJcMjTXWxVkbsqhCteLvSaHVrX1IWz3Fkd2S8h
	2DmnC4+ukJrdShJ26quDe3/iIbn0aMVWsN2DciWAHIErj3HQZ7A7RWkiN43WIK7N
	yNMb3g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chhrbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 23:40:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc640dfde3so66516115ad.1
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 16:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784418037; x=1785022837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z3Q9taMjWV9GchlGB3+zBzhpobDtgh7Q1RKR4fp9cao=;
        b=Djgrl4pZ6NnU040txIyuUrBcR9LZGGKh8f59IwgUYnOX7N+oAbnbTI3OOq8FHsEqEO
         Ijqe2/MtpQBeJWbOQ23Cwd1YlJYhBctKupnkGI9xUcp73FtpCAUfuSkizAKcjYIa/ayR
         TBwdSLj2RFCX8Y6Kvt9GyMLfQjQ2Rp4g7EMr+VbbsENqdCePqRNdQBEFTlB/DZ2rVCAL
         RpQeet8EprQ7oOA6MSAKFjYHdsFum4/MjO+1MiC3evTYtgEf/MgP7vLgPSFshQZZsuUm
         qPsUnkyt0/58X5sIx+Vql9cuNmSMsfJ3V4UPbnBPW5jpnu8KgR8PA6gAnvLX92HA6Lj4
         oW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784418037; x=1785022837;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z3Q9taMjWV9GchlGB3+zBzhpobDtgh7Q1RKR4fp9cao=;
        b=k7Whp3HFgNPqXbdhshh+bDSUTnjGNSsIsnfw0uqpMhKCU7AjJcicECjAe4602rnW3w
         ozjE+u+lsqZU8T35j51LptRMnVwVX/82SovTF1HexzI3cMh8/VBE8ZV7RZ0sjcx2M+Hm
         HaDO5iaqn/sMsBDxq/6dOU0S4IVRCfrqvQnasDixJBZLjuWx03VJcXaN3zMDeuZEQOgR
         475BWhTYwcSY6TRwseNKX3w+N+nx2PUj2zeMPRdYEzMdhcZjRpKQwPUuJ8G1Gw9+koB/
         QF6vOoPxUEo2YeN7mIo+J20goD7+DT3vA0tu0nDECB1FV2UQR1aymThTQ0p5Y2IZu8Ly
         19Zw==
X-Forwarded-Encrypted: i=1; AHgh+RpT4JOkOId6kroPoK5XeVYpwf6Ha/wDE1Z9aF2QJqTy4JWY5Dm7JKKL/awJgtq7SUoZY/K3LjUVevzk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0dTtTRZoHu3X27BqFLwahconeK2cNOopMuVAuP9kPi8u37kWC
	nc+0UHzYMP/md3I+ALpJGnYrA6iJRQ+79ewF7Q4AYf4ivxCSj8p8Cn/Aw3o+zrlJJRzy4h4Vbq8
	It65pK2HO3T9YLGvncmWT9NxpiJfY/sqkyeD6t2ULInBoGnnhlFxcKx0MXqmfqyPR6Nt0LNBJ
X-Gm-Gg: AfdE7cnYkZ8OKnnSDmsP7HYySqb/eOjbSbZWwobUvi7CwdC9uDqOzhoMgR96zTKfFml
	/6kGOfegP7PzW5vlDca+hCD9W1nhtTBmXG5B3fqvzkGwCfUsw+bnaIqRheZ0zCCQuSYbpDaYvTY
	xYBXQ/PvQ9DBV9gWbck276F80AQvMjFSlHRRge342LMHwfjYla24L2NigfewKFYra+isQyeuS/g
	/5KkUuc5MBgxwkN6dVsKZYKDqb2Hf1ZUq9NFKkydyK8L6gaKVtYpTNt/mWwjOwET+/6Q8iQznXj
	QTlNoF63SV7UEzIMIOzNEKRBwLdVKNIt74fxgWn1Xvu2/poLuvPoza8VrPiT63fLXcPPNN/GIvQ
	7t0XwQKv8zDnicGq5
X-Received: by 2002:a17:903:324e:b0:2ca:6514:9201 with SMTP id d9443c01a7336-2cf3486f1ffmr93265225ad.15.1784418036774;
        Sat, 18 Jul 2026 16:40:36 -0700 (PDT)
X-Received: by 2002:a17:903:324e:b0:2ca:6514:9201 with SMTP id d9443c01a7336-2cf3486f1ffmr93264825ad.15.1784418036323;
        Sat, 18 Jul 2026 16:40:36 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448d9b0sm33136325ad.13.2026.07.18.16.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:40:35 -0700 (PDT)
Date: Sun, 19 Jul 2026 00:40:29 +0100
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
Subject: Re: [PATCH v8 1/8] iio: dac: ad5696: properly check i2c_transfer()
 return value
Message-ID: <20260719002355.4a818026@jic23-huawei>
In-Reply-To: <20260716-ad5686-new-features-v8-1-ebb0051af5e5@analog.com>
References: <20260716-ad5686-new-features-v8-0-ebb0051af5e5@analog.com>
	<20260716-ad5686-new-features-v8-1-ebb0051af5e5@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDI0OCBTYWx0ZWRfX7wtEpIe8Xcta
 uJU8xQGoh2JAL9Pwj9XqBXswQdmOTWUfc/cDgqWxaW2fJgowfYHa2EeybXcBhtI7vx8o9m6EpnS
 gUNXPGp4vfSVKC/rKU3jHjcvKGdtMh8=
X-Proofpoint-GUID: tyD3mY_rmOfSCKLxgUf2QkMMKNJi6ICO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDI0OCBTYWx0ZWRfX9YN3dUdO8KgG
 740x7wRo4qB3Dm1wRE2wb6CT3DboMm1iJUrgFYOyQESpjQ8YdXaZb2cpACyqtI+GEiZTKlo0mWT
 1fkH6sc4I/MHARZexYsJYwiEX6989TXPixmAZ4X/ncQQKeOqa2LxfYIeplMPMm9wh+3c35Z5V6t
 p149WaRJK6MHhueUmW+pQMUymtezGHkT7EcuC2DXCfuLG5oaEq1UL9nkcoI+1DH37FAaudebLa2
 20CYBMZg4tJ925uIjZ/Hq8F7w15axRs1PQE55uK+LT0wBF4dM5tzJJiVPY9kv4cAxaam3v1Rhwr
 ywK7hP80KgOLLiA9JbO9CyDSS44VKobF0zF7+OMyn/LHUd/BQqOuwJ3s2Pd1uERfzmR39Td0wjI
 8+N8LKRi+D9mS/kTyiwcSm7EgDMlnA+I2rzIu/WtSagv6qiibA2Nb0rB7VvBUrZzpzLPycrdwGu
 aKAXRWMhyfVvULOpDWw==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5c0ef5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=IpJZQVW2AAAA:8 a=eCasKaYD3dZQZqGzH0wA:9
 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: tyD3mY_rmOfSCKLxgUf2QkMMKNJi6ICO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180248

On Thu, 16 Jul 2026 13:14:17 +0100
Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:

> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Verify that the expected number of i2c messages were transferred when
> ad5686_i2c_read() is called. This issue exists since the support for I2C
> devices was first introduced.
> 
> Fixes: 4177381b4401 ("iio:dac:ad5686: Add AD5671R/75R/94/94R/95R/96/96R support")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/all/20260705114746.1485F1F000E9@smtp.kernel.org/
> Reviewed-by: David Lechner <dlechner@baylibre.com>
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>

Let's hold off on this for now.  Whilst it is technically correct today I'm
looking into ensuring that we never need this.  The only error case
today is actually returning 0 which in practice is an error.

> ---
>  drivers/iio/dac/ad5696-i2c.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/dac/ad5696-i2c.c b/drivers/iio/dac/ad5696-i2c.c
> index 279309329b64..551b200bfe14 100644
> --- a/drivers/iio/dac/ad5696-i2c.c
> +++ b/drivers/iio/dac/ad5696-i2c.c
> @@ -7,6 +7,7 @@
>   * Copyright 2018 Analog Devices Inc.
>   */
>  
> +#include <linux/array_size.h>
>  #include <linux/errno.h>
>  #include <linux/i2c.h>
>  #include <linux/mod_devicetable.h>
> @@ -39,9 +40,11 @@ static int ad5686_i2c_read(struct ad5686_state *st, u8 addr)
>  				      AD5686_ADDR(addr) |
>  				      0x00);
>  
> -	ret = i2c_transfer(i2c->adapter, msg, 2);
> +	ret = i2c_transfer(i2c->adapter, msg, ARRAY_SIZE(msg));
>  	if (ret < 0)
>  		return ret;
> +	if (ret != ARRAY_SIZE(msg))
> +		return -EIO;
>  
>  	return be16_to_cpu(st->data[0].d16);
>  }
> 

