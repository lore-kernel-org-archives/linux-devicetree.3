Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825D03446BE
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 23:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781221092; cv=pass; b=iao1Wa60xoc94VNxtDe2/Vae2Vj122+ukSZArui0CyQHyn0EvlPBKJ8UFZfFqZc6smZxXtHUg7MHwyCcAmaPuKo9JZHPd+U+2ImFzzUJynRiMAD5WnBi/1QlNkd5mL3f71dLTPQc6blEHKIscBJ9czT7PVin0Jz+gvSyR49p1fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781221092; c=relaxed/simple;
	bh=OCI9iA6DxuuvVs6SgcV5UZj41qFoK7VUdUsBZR++iII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HT+4S7njoBWsvhqiH6dcQMo5VA3gtmAX2ES9dnLr1s9X5slysw2FRBkzdUXVG9Cjo3ihmZojCeeCfez2WehrP+ML3BiWtRfqOryLsEIGUHdRxBKPZar6diG33gOBrd0FgaXL0zmqGP5rNUO8Fb+dPYrejJocbVbF0angeopg/6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6lUoct4; arc=pass smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6lUoct4"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4863eae4526so251866b6e.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 16:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781221090; cv=none;
        d=google.com; s=arc-20240605;
        b=YcxxJ1ESU/CYJE8xedDynntcuicoORqwhr8yduR8p9VONVzQehqC/cdd0PzDBsD0OZ
         ZKDkmLrAie8QB4/cGQqwqfJE/4K9/wRU1edbWGYFnssHsZzqa0q2LiC/KEwL0J3LLZ58
         2OXyzbc5MYXyH6YkTEr0Xxf1U7UimMO6+etAwUqTW8pZVyVxMaeJim61vhIGI4FcsbCm
         /ns53SUrNRavs/fPE8QHA7QgoaiBePfzQl/zgnl6WKU4LK4WIOmDFBceWc56OfWIn0pn
         f57f2q5SfM92YhD9uZeeXioVp9Qba0rGuejFjUCr7bQITfMD5DF4zC640MfX9SZu+43n
         1Opg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oQN/0dYPUTUtLXSjPa/KqXbPj3fPnMrFaO2ZCvHqkPA=;
        fh=GfhJpu801FTnlaJ7TTaRaG0kIO3jcfbZp/5dgOXLn7g=;
        b=GW17QhcxCwf6hleXnqZcu7yko+rDjo9sBjP/edTc0vdBWkJUThb99VB+jyxOd2ShrS
         KvE6L48mkfqPKfmX4qKmjnbsHfcDwamsUo2NGfKlStcntlIqmWRT3xgcVLei02C473fJ
         Y61IF1VJo4/1kD9hiRPg4KyqihBy4+jeM7YIQN7Lk5vrvp76unAHig0Z9vp88V9x+/cm
         QvB9HOrP2qvywwpSKIvIB/vspEXTH/MTlkbvNljQQYgtVActrHwVEW7xWT/OJu0MK3CX
         qnLmgAKMUfJUXbJgRIrYf86gNzumCZY4onzzmk6Zqn/yakR/NLJk4AKxKqRwXRMloptG
         FC6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781221090; x=1781825890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQN/0dYPUTUtLXSjPa/KqXbPj3fPnMrFaO2ZCvHqkPA=;
        b=P6lUoct4uFNA/2SqbUL+F7H73OP8HoaK3NMTPpDmf70C9Q7MzXhQKXcgp8PMWMefC2
         WGdZto4pZkVoFIzo+yZH/Dvgiz1us/Ib+IPZGJBcRJ+nXs7dCJia7Z3pL6tsjNYsSn62
         Vl5ywljNMOxJnEDdTEYPYucsJvJaTJC2vwpFtO8ZctI5umpjWofIIN7qbNP+3yebPT7m
         Ptmwbq312wj5AShtH+Du8EV1U5i7kRT3Tx4Pdl2iDsD7zVxjgxdI2VWamgB6vq/Yf4Uo
         h7vFxnae/dNXd6WzrU4rNP06m0w2IbCR731zwhgT6Wc9zhNCZ8Q0l00kEcitl4rksJq5
         78Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781221090; x=1781825890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oQN/0dYPUTUtLXSjPa/KqXbPj3fPnMrFaO2ZCvHqkPA=;
        b=V4VINwgTr1ANvcqyM3cG6WNtV/FN2/XtojMUENFVd3m2vnULgD/sp8k6MKgy7WiWtm
         ompNh8ImBrGBK3FRozn7kK3Szp2ue7lFeO2RmejhpY3UpoQGxmTkuRISOhfNj1yxfvhT
         5Ras2TbEjMj9q9c86ZWIA7Hw/6vmV/Y1xjFz7ZF+BhwFabooGjEKL13cwZctTeCNVygL
         jf2ZCDGaUAObasuC1EcuC+K+qtvYiFgwD8/WSGUUAOKRo84Arcz3m8TIlYwxe9CTTOnH
         d9dER6Jsoc2MPhtzxkhhQsx4cuoomN6cWiaboiYWM5l48i4AYbM86uJjQwXALOAnbthg
         G6aw==
X-Forwarded-Encrypted: i=1; AFNElJ/PITwQYPnXGkRV+f6kCSL7/8ICUDUcEDwOwNuFWeX/hBNLkOFLZeBghEYTgCo+QqdAt2spDUtRq/Ze@vger.kernel.org
X-Gm-Message-State: AOJu0YxguTNFMtTgvzqVh1SoF9mr3sg3A57+dLQS7QbBfZJiLVgzQVbT
	CkpJgWiOSftf81d4HmRUG+Xl79l2l0mTX+TyHeFWbt4zQAva9cqk/xNF6I+f+OLBK/dQaQpw/tL
	oksukTkyXpOuYU1XOTkgs0hqhf5Nb0AI=
X-Gm-Gg: Acq92OEzkU1MLoDz2eTnyzrnjD/WaSq2hLZypAHNLOkJV+EDXRHW4weM52aaX2pQyMx
	QCRm0bYHrby0RY5rh+kJ1eJiUwJzFncjPfMyOBPFM7SuKWtHxkcY97byxgQ3i2axShhLJvYUE7H
	Y+ELMa/2HZDWD4MAndMJYo4HEzobPni+ESkHKalV/K7+hd0yQQJr5+ACdMEstTYQ9fy13Jb64i5
	tTtQ24+X7HIbLz7LrVz77Jc1FiBhneU/M9kw+IOv+w3izTG15fccyBRl9nBp/ErS3Is1pQ1sHbK
	e7UBOCVQ0jtxGXSzrtw=
X-Received: by 2002:a05:6809:20e:20b0:486:cbc9:fc18 with SMTP id
 5614622812f47-4872f59d6eemr232963b6e.36.1781221090436; Thu, 11 Jun 2026
 16:38:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526-mailbox-qcom-maili-v1-1-1b689a42f33e@oss.qualcomm.com>
In-Reply-To: <20260526-mailbox-qcom-maili-v1-1-1b689a42f33e@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 11 Jun 2026 18:37:59 -0500
X-Gm-Features: AVVi8CdCWnW_myf0FClK3jHx803e6rWUVbaC7JSscx17uIuBUvByHh5ERwWcBXw
Message-ID: <CABb+yY2+3S=PM8ku6oRtm0iBNtoY9yzVe90EBWh7jD4xSms_sg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mailbox: qcom: Add IPCC support for Maili Platform
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, yijie.yang@oss.qualcomm.com, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>, 
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 10:38=E2=80=AFPM Chunkai Deng
<chunkai.deng@oss.qualcomm.com> wrote:
>
> Document the Inter-Processor Communication Controller on the Qualcomm
> Maili Platform, which will be used to route interrupts across various
> subsystems found on the SoC.
>
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/D=
ocumentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index f5c584cf2146..4b69a281971a 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -27,6 +27,7 @@ properties:
>            - qcom,eliza-ipcc
>            - qcom,glymur-ipcc
>            - qcom,kaanapali-ipcc
> +          - qcom,maili-ipcc
>            - qcom,milos-ipcc
>            - qcom,qcs8300-ipcc
>            - qcom,qdu1000-ipcc
>
Applied to mailbox/for-next
Thanks
Jassi
