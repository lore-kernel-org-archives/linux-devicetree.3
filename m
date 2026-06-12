Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B4627FB37
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 18:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289096; cv=none; b=BDe2feD/qf6pvSciSX+3iWd0jGQW29DmBAjbjTxUtq228ywgzQWuMBfXgSplfCxZYekr+9RCaWbXzXJ4RwhFCascaqQx0mZEIFdy6jN51PMJpzz8kqmW01tiIiZ9xr3mRB9BUyEvT40qWdQyc6Y+bVJSTmnCpzif3qtkWZ4BZDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289096; c=relaxed/simple;
	bh=7yn0/utgYVTOzUs+vb5c05ZV/Jxy6WpLqXn0DYdLdKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XjH8xsyQCM4+4lr0rbMBBkO/tR1o7g6QUS8Ob3LeNAQPdqQi1dAWd9Ycwj+d58ADlBM2SrXeoCuUlxlC4POtU40Pta+OF29zqZJT7bydIn3GTTNZ7iGrmbwKydSInrzj7rWOJU24dfwvv3kJOnMDTRXjj15UOAMTorcbXnuZRi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zk5Fh91g; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zk5Fh91g"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso10268085e9.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 11:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781289093; x=1781893893; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=95AvFvq/SHF/XMgHFAPH0gEXz2BnMwa+fdNSG/EQyq4=;
        b=Zk5Fh91gSl4XTJRJmoM0if8u9PfmlOEE8uKaDGRYI4WTzE6LgYbi8eo+bmf3SCT/Je
         8x5IvZVP78knfKgo0hmeKMHQrynb7mdhXddEiz+cJW9PasQlNBrI8hgrxTALX46Zfjkq
         of/k//95hGUziOspiMxBKvjylZwXflEaka+ddd9JsVsj5O+DX8aAgUg8baFCJTYR60dA
         J/dUpuVkNBpYtwpliX2xoyDc/8UnQQyshogqRkpxCJ7EbzfowkrZT9lOV0xFC4PFcBIg
         v8r40Zv3Voa3wbH6Xw7obKOVwSwgHWiY+DKOK1hzzL3mouI/tF2mb0/fRz3tPu0u1ZWG
         N1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781289093; x=1781893893;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=95AvFvq/SHF/XMgHFAPH0gEXz2BnMwa+fdNSG/EQyq4=;
        b=r3+JEDJ/8Ym9g6b63V0QpC+UH2qGcU01DGYFhqwtxlifwwdM88RrpG17bEn18JcCWX
         QroSqmCF1nxSnsOU3LtDfLHw2XqQyF1SU7bWBTlPQw2QQUGlPmR8JvyIx4JLL4b3Uvvi
         sOIijvIEhNNNx+Yav6I5W1sWK8p7NYl/W27stF5SobOZ1ZIfYwDM/cJ3DGkFOSA8lcol
         BtKxb0O1IkwGI3SfDrwtR6WAT5DG9QXWDwouobFVIUZTf2NUs6UDG3nw28rHXBoYkc9c
         eCYRZpxX3etGozKfmkawHoMxTaa+f7CsdICLjAawO9Yj7fHSQGe2gZglIcYzmcpB70rh
         cFrw==
X-Forwarded-Encrypted: i=1; AFNElJ9o5lRIEMHteMc/WK58XUylottocBCL2znpeIRv1tDKwiSujouRIlqyoj7ojcpv452JDc5ItjYi4NzH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2U5NeCDFXXTBF1CgmL9BvPILi+h5Dp0+4p0dRvxBQow+YLYEi
	Nnt4yPAxSg9WpzOgl3J3UGF0TqPa8KsmcfVtKq7wQFV6aB3mwFojNlcq
X-Gm-Gg: Acq92OE9r11LN2sZ3geYMvdgj3JrvCnP/3uKpg2msNhyZ3XgaUX4w677FSAIuY+N2e/
	CfASkZ8NbxafLxDJtoYAnate+LlKAc4cZ0IedKszOJ/jOSHAf5ApbNJEWs8m0j8UlVm9M+Fwap2
	kx2BLUNytwKRgj/W9JS5/MSTWojK1DeafmaZFCPWeGHGyUBJH7MayCuw086zXZzwAW/EfUnXtNr
	qkF13FuWwhO+JiV06Ua3YIiKthD8+jnN1aVtuUmwzIJ+MDRJL3WH+eWzRoz3f1zItA3KRCYw1g8
	EXhsyxSAGzBufYDY92Ey/UhIlb7wfLqOkb6gXdJDIsG42YNTWqSfsou/KF4eaXp4UN331lFkW8Z
	bLvYxFqmd2BdOmWG05VVF9WD360tvGvSj1JAQEMevhHGrd8XAGCpRlIN+iM4hkBejs4IXDVpK3Z
	ZHEMEjap53Aw0USHRzkkpZgd3PTlA76N5BXN9o876/B8lBxaojD55gBDJpZOLZFQ06BKbSQdGY9
	XU=
X-Received: by 2002:a05:600c:214b:b0:490:bd1d:472a with SMTP id 5b1f17b1804b1-490ec4d7879mr37936905e9.15.1781289093399;
        Fri, 12 Jun 2026 11:31:33 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee? ([2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c0801sm6310585e9.10.2026.06.12.11.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 11:31:33 -0700 (PDT)
Message-ID: <3b7ce952-d653-4957-ba20-a14f932ad639@gmail.com>
Date: Fri, 12 Jun 2026 21:31:30 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next 5/9] net: ethernet: ravb: Replace gPTP flags with
 callbacks
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Paul Barker <paul@pbarker.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260610102432.3538432-1-niklas.soderlund+renesas@ragnatech.se>
 <20260610102432.3538432-6-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260610102432.3538432-6-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/10/26 1:24 PM, Niklas Söderlund wrote:

> Prepare for adding Gen4 support which will add a third and new way to
> interact with the gPTP clock by replacing the flags for Gen2 behavior
> (info->gptp) and Gen3 behavior (info->ccc_gac) with callbacks.
> 
> This will make adding Gen4 support cleaner as the code will not have "if
> else if else" sprinkled all over to handle each generations special
> cases.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Sergey Shtylyov <sergei.shtylyov@gmail.com>

[...]

> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index 013ced6dcf29..70bef3b31d38 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -1034,6 +1034,27 @@ struct ravb_ptp {
>  	struct ravb_ptp_perout perout[N_PER_OUT];
>  };
>  
> +/**
> + * struct ravb_gptp_info - Platform specific gPTP behavior
> + *
> + * Each generation of RAVB have slightly different behaviors when interacting

   Well, I haven't seen the word RAVB in any Renesas' manuals, have you?
   I personally prefer calling it EtherAVB; the manuals had "Ethernet AVB", IIRC... :-)

[...]

MBR, Sergey

