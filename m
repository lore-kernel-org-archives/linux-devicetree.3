Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A45D40F736
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790430058; cv=none; b=DdphIuOKwHtDgXqjIkik1DYWytjFKwIYjzjZXHVczSCSknhibx4YDAvfwJlE5c98WoxoEfd67g/2nTeLImke2fpMvMhHS1gv2hgKTQN8f+dXFM0gPDXi36UtDffLdgR76qdDosaSrbDl7dF5NZsAlFS19HTNIv+T7V/PBcqJRTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790430058; c=relaxed/simple;
	bh=w6XavIMw57aHLiDolrRY4GGk/U21PS94Ij+L0KosGQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RYhjLYtF2IbpQWryhggorYLJ3PzzwX+aQRY9fTjCcok4GL7L8UV7oEk30GNg/ozFbPZxkgLqg68LiAr2FY/pyc1GHSqu7+I8TbI+i/okFu1bX92qHSOycngEa2SIMqHWo8DxOEEHGjALB9neFcqtBUb/b0Tlxf+p/U4v85qXdvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LS4C5tZH; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LS4C5tZH"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f690df6so1066723f8f.1
        for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790430055; x=1791034855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bAJZqOMLmiD+huTN0vJljnBzZgWbzy5vIPKgZ6U/QBA=;
        b=LS4C5tZH+706MxGAzyunUKi/UJ8wRPQ2MUXJVBh7oJkifoIQPaPsc1s8FCz5ZHyauE
         RBT1SdJRlhjpxqvnjXMPM+q6hiVwrV83uj/wUqWEP1q2CJTbF93G5QNhpfT60CY2H/rz
         t5oQWch3G08E+hcEiTnQPvpzTeQu89sk8UQpKnRbITfFnlX+ecAYatDgMg83zTAB0jh3
         lHSlS4alRSj3oNWs5hiP1fc9yi3tEwk8zOm/nbqGdQmI+/Y8LWHL+a1L0gF/WMO0dQSv
         dfhszJc9qgKoFMMm/z8yQmgfkjt4VWJZcW+7f1QjOgpORVx1G78KPFJ2U7AOdzjmyi2D
         fV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790430055; x=1791034855;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAJZqOMLmiD+huTN0vJljnBzZgWbzy5vIPKgZ6U/QBA=;
        b=QuGJ+PN+LnQ/eIOQKqBgmqFxePfg74Xid4/EwItJ2fHCtACTGJV1KSYg5B9/rCbZJn
         aUaNYsMzXWIE0ItOHEPDyDOhoLp1nnDEFJ7ziQJRw5046J7hQJXNR8qjTMrobjwtBhMk
         dfDApI7s2mv6DXkwfD6HLEDxvY2jvZgBf/2pKah8hzG9JrPUWHoz7upe0F0aJ4Kpb0Fr
         QuFlEFmYu48S/VpjBSr6jUlm053g9jvismFFBIQqjaA+7DUugNWdpJd+aXQb87soXn5L
         bTxuK9Y7CtHRbwCdZBmampTngK0ttXc/UqWtX/xRQJ6sAbJCafZazwRsP7yKzLh5G282
         OYUA==
X-Forwarded-Encrypted: i=1; AKwUvByUt4Dj9JSmGKripTxrlXSYsBfgjEDS4AaFaqvLHHwET7iUHDyxpOxFTnH0HL6rzjsq6KQQ9XwJbWrz@vger.kernel.org
X-Gm-Message-State: AFq9FYIag4Af4NdoTU3YKGDr1cKe2MoxZxfJzbNNT22GR/SwjG1u3sV+
	/V8oZL+anBmOI0FLMHeDtIFJWQAQiwke9r9/7I7zF+Tknu7eXvAlHMXm92PRFJGOAN4=
X-Gm-Gg: AYBFou0e35Mri0RegDWUCg2vMvBLwcnsm4VVHNARrwMv6rKvS4hGLZ8qzaXbvC6IQhl
	680zKX1hFH2FCtyXwe4QywjA2q4t2gidxsXc4v62JMEzLkfY3BWWhYu/9E7wqQTxTb8gV+YXGQL
	PUsNebhLHzFvNCTpRndtZSi9o2qNuzppMXZbiT/lOJxlJ5VpYgcwkQD13mwVkBQjMjQ0f7mwYQe
	1gSD3BBSBEXXk0wt8vDhIOaXrgx6gDXZiUlPVYiAA5+BV0Dnt6yxwW7xFBFNOo4P/AzfF7hjhgu
	gPHB+RwBusJQqNqVwZoiV1Vz1+bKqLmQeo01Zn+kwxeXIoSDzgY+AoFGA8wD4rLCYBnSNXgDVIc
	wxazBMdsJtxYBAGQmZcXiC3vsDk5Y7GpsFUJ6NFVYPClKhquWmWm/il+bzX67wzdwqaiypU0EUq
	ds8BL/9LOexr0l6Wz5zV5NGFF2BxKXSO7ftHORiyKHS06fwYdopxxl5dPJ5fs+ce3S4pJdi/8u9
	/XVYzTA410=
X-Received: by 2002:a05:6000:2910:b0:488:8987:663b with SMTP id ffacd0b85a97d-48889876a66mr2785861f8f.23.1790430055389;
        Sat, 26 Sep 2026 06:40:55 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm14660447f8f.12.2026.09.26.06.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 06:40:54 -0700 (PDT)
Message-ID: <bd0a8dd8-7d0b-441d-9b14-25fb153465db@linaro.org>
Date: Sat, 26 Sep 2026 14:40:53 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/12] usb: typec: qcom: Make typec_port accept also
 different structure
To: david@ixit.cz, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-5-31adc19f32c6@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-typec-v1-5-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg<david@ixit.cz>
> 
> This is needed by followup commit introducing 1st gen of type-c support.
> 
> Assisted-by: LLM
> Co-developed-by: Alexey Minnekhanov<alexeymin@minlexx.ru>
> Signed-off-by: Alexey Minnekhanov<alexeymin@minlexx.ru>
> Signed-off-by: David Heidelberg<david@ixit.cz>
Same comment.

Understood its needed but, please describe why. I haven't read the next 
patch yet but I guess you are going to have something other than struct 
pmic_typec_port *

Again a minor nit you an fixup in the next rev

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
