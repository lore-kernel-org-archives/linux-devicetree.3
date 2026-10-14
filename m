Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67202750F2
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971034; cv=none; b=n3YLkiOUGDi/yQF20Uu/urQWPkPHRV30YwGYldKMvXteIltRVujbXsngQhyaIT6kO7juxm6zuMpMBiJD3zvgVB1wg2CKhA4qnHuy7IqshgkEqEttGSQRe7FiNFp9mQHnJvXzZCZt6uSGDgBuvb/qViK/5B5PbSN+lSkGHPxyHXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971034; c=relaxed/simple;
	bh=p8bij+xPIuY1F2wzTxNxuEiDx2tLRjfxK2DOQb5YmqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PDIV/yP9wxj79OoLOUKhKjB85E7Hn3BkE+zN+tijROU1t/L5oJc9eX/eOHtAGdsRiZQoMn7apWF2oi4ZeMn/XDPDWZhG2Yktp42Kg/xcwD/tHNCL5UHXKGu/Ues/bJ+s/lkg5pOqWzITeJSyP6PgweQ3r7A0g7/EPBi8JwT+Als=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uOYw7f4O; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uOYw7f4O"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso4145246a12.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 02:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791971032; x=1792575832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOCQwbGkL9XqwqZkq5Sc8MdH9xmRzvz/HA/PLReDL08=;
        b=uOYw7f4OPvpwLDJBsDw0RiocCBQFaY7L6IVYwf251T6PDD/vlDPeINPkrEszp7xxIo
         tMYI1dkwiYFQdtHXwQGsFlUNJ4uJ0SQS44kUbPEWNkUWv1Q9jdW1kBeAYxXb5KANJ2Y4
         RFGHRPgeCRucwsmvJuUSu/C2l+aKDhToYAInFS9joJW/uXFa9aQzXkwAaB30tdikQUCG
         j22Dkuet1XeZ6Lpk1ZX5Qa9jTLcXR7j7c4VIxP19NtPtgOIJBLb5GpVFh1taqWS0ZlGs
         KLCOIPOhEozBod3CsqIF6OHYwDVKE+PHKh1svgXSSUWWG8F0RFuGODxfna50qSVRfp5Q
         kZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791971032; x=1792575832;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOCQwbGkL9XqwqZkq5Sc8MdH9xmRzvz/HA/PLReDL08=;
        b=p0QzB44DmxaWgqv6ekQ20RuoGxqt9TBMEEJepDr0VyT951HEX+VaCDxVlAkgoJFBTC
         imXV7w6uK3wGx7lWnpQyt1o5QdG+TGRoyeS/sAUfNL7JfPnowawZK3fxtGqRi+5ih1Jf
         mnAOgBLE2+6hlJ1iI5PJuoT55NaQFYHYigRGQvdrrfnpPYM3ZXshP4aUYxQRMs/h5+c6
         H549C5gkviq82gXZpX9D79WdB6QmCS7dhUS59QDShVhITxHBnbst3wpSRucKLYHIU1ec
         5AG6D+eUesfVT4UbW2xJXMROU6vAAz9Mmk2n+kqkl3tuUKedZGDKRYBTqDVTP4L2RAKX
         rxeQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4J4LJQ3A5QhsqgBbupbXkkiRDajhjyAWnJp+8DTGZC2OJkz3o38Vx5PpbRZLIcDy337a98ZqQyI/t@vger.kernel.org
X-Gm-Message-State: AFq9FYLIX7bd8njr/ikr+VHn35SrpU5NDKI7afSzOuDLt6BYbSckiIiX
	8UK2y2xWaLPFN8XDc0A/DFnlCIU2rmRYMdxMnBzAClvkebCcF2dVQBasOkco5Bwu79k=
X-Gm-Gg: AYBFou1DtoFXwV30D84Ag/xYupHPZREXW9zjoFCCE4edMRic/PXJ037hKhmJ0yg3MIn
	dGuo2oDs8umg0LnO9eqACNewu5jaHxFNWEe8hTKbKUQg2/nZYUh922maD6o3Cf28QWY/lw4EqI/
	PNxSf9GuRn/BfKoYkDaFRspLCC+pAkHfH+aVYPypoyao0k43+8wn4GZD+XtX6Zh6fziFY5Uwvxc
	qVhdr/xGNnKmuq60bI28D86/fNnA5AxWw3P3Fys402THQI1MwGWAxKZEbwBmWVa4YSQrMynqvbZ
	mFzdiG2+JaLPsaRfsFaV+Q+H1lEnws6WPz5DLH/h8iiBrenJgXkDIziu4Q79sEFo76V8tHvuqB1
	us3qW8jkMDBrnnvbXNODBG1MZqjDKNnFHu6kFYJ6Hkss/CwH9wBK1qmh/Ldc+As5x3olIjMPddz
	YqifFaIuG1uGzJNwMXZzixlmZbEF9NfaBMCF9nhlbCzVrVHaceBHW9fLn4Yla922Nnk/1kER7f3
	+qAKVolvKbF
X-Received: by 2002:a17:907:6093:b0:c2d:d929:95e2 with SMTP id a640c23a62f3a-c31a7067739mr1466697066b.21.1791971031904;
        Wed, 14 Oct 2026 02:43:51 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.126.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac702fsm690779866b.65.2026.10.14.02.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:43:51 -0700 (PDT)
Message-ID: <4fe3f636-2352-4f3d-9634-637622b2cd40@linaro.org>
Date: Wed, 14 Oct 2026 10:43:50 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] media: qcom: camss: Add Hawi compatible camss
 driver
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
 <20261013-hawi-maili-camss-v2-6-fc93222da89c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261013-hawi-maili-camss-v2-6-fc93222da89c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2026 12:02, Nihal Kumar Gupta wrote:
> +static const struct camss_resources hawi_resources = {
> +	.version = CAMSS_HAWI,
> +	.pd_name = "top",
> +	.csiphy_res = csiphy_res_kaanapali,
> +	.tpg_res = tpg_res_x1e80100,
> +	.icc_res = icc_res_hawi,
> +	.icc_path_num = ARRAY_SIZE(icc_res_hawi),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
> +	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
> +};

Wait a second - no IFE or CSID in this table, with both added in 
follow-on patches.

Lets just collapse the last three patches into one. I mean this can't 
bisect in a meaningful way as three distinct patches really.

---
bod
