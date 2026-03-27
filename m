Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B743F7E8F
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 14:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774622299; cv=none; b=RpIId/8TC9qqI6nXPXC9s8eIbfpRrvQ2DBsFygG/5UDDstzydiY6zKeUn2wxjKpbpAattX52u8o8aSbfYPQG+DJTjPZEkE9xY4utQ3gJ8DkO6myr2hYJR/dk+FZAZy9rUOogaAFmJF59jdz2G9Y1i0vF+Fqxx936nnlGX6kou90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774622299; c=relaxed/simple;
	bh=cJvQjfP9254ZxGBTE+ZydM3eM349poCVeRdu7qw4XpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HeTsDNaLWowuOa9AVxTq1CFdcpmlcf3dNsBdYwnw3dBRmLStpRoTOpgK6zYg6ewdMg+Am4td38YhccUEp1nyhMftlJpqscFuONZ5mOQnq6jcS/PTkwshBym55co7mnSX07moHozFhY9Jlgh16J+nEzd+7XeBIkWp9tJahkinRKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E+YDmp8B; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E+YDmp8B"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b9144790dso1227669f8f.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 07:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774622294; x=1775227094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x0Jo0aFxcF9Ybb4MoHJTFDiEvjw/5Yz1myZV3Vc0n1c=;
        b=E+YDmp8BHGANo7DY3weMTDKZSpEWWcjnKwl/quOmHP9lgiWEJ0amXyhfR6JQnv5ANJ
         r7519bnU2pw77pkZQ93qC/lz3p9q6RzKHz+NSlEfe+IbICpkL9Ut9bwHuifCYeijVdJR
         QvoXA6uVAS2bhG2TqbBBAkOLq2L8iTvsVAGmkBcTTRJBJnnAt6WtE3RMze1iiKyS3Zoi
         cE3dtNuDW6812Gn+oQKLnQ67zQPPo645trDxihBFIOp9BqhfKfCWgZq73Jb8QLSJpS8p
         7Y0e86pAccV/v3hzmqgxbJB9o+EYaJk8zk3YEye2lYVDT0ilZdReVW8wjIFO6/lnJrrE
         HHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774622294; x=1775227094;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x0Jo0aFxcF9Ybb4MoHJTFDiEvjw/5Yz1myZV3Vc0n1c=;
        b=sBrycVMDc6F4HigHpG/9VvslTGGsDZern7q4Q5KRK+ev8/MUcvyzb2rPDnfCPWG9yp
         OAjc3NYF7YyzjVj61PyqrnXkynowK9vzWhw27gEmFZ94UeCOQrM4iEKiEgX1J6p4AlD/
         PBsDDiXZajN4oNHfBDZR7yy/qzvip8SQhqJDtpmaLY1sEBS9QQBdE4XtmL5borsrEsPW
         XTE/yqjES7xyDWnehykSrfMqA4t1YNBeLYPla3JLyFYkpE7cRlu7S5aW9dO8mPTulX1Y
         tHV63rwEfdX2r39cVhNbpi70zeIjAd6s3kfdLzQQkfj6qVh8HPRSGJFOBWX7eTCZprWl
         hm+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVD+L2C48lyoZ9IMi9SopPYIG5q5eaiUzOkgEpKPdlb2FB7NINjDJYRpbeC3yBVn4UIPaU88rPqThsh@vger.kernel.org
X-Gm-Message-State: AOJu0YwngzkycuAM7Qn+vbqJ759PvFynV7pzazUt3+gjHP5c3tadL3kH
	nODAECASH15jxJIVCASDFh4hFLgu+v5zQ6iYDiQKYaQfl8nDEPbv3FX7W4rxGVHdY20=
X-Gm-Gg: ATEYQzwLOrRgt0jutXQKrFjqgl44VtmkC2APYHw16cF/VtYP6yPENAET+WJQkJPf/uD
	VgmyAKs/GqoUhabJ3fKJ3/eNBdagZVTP9f/q4TE5Uy6zYZkUjcaYEyyF3xvnwy9MmxnyliA+zMD
	HHqOJo40jtMDCSaSaa+twbM7MqkhFUpSKGbNsNOUmqktFttq1AO5wOMxpglOrunSMjtCkAh18tM
	p5pvHloc54soobwjs5EQwndYSwT+D4svKJA9Fw8Ex9FE+s9sDbGcHia56ExNobMeKONqRUK+tP0
	ae48PafPBgYsKwCLgDxHChqJq/l++9o7t8+5k8lFzxrUBY7IxCIoA6X/7xR8wm1vcIm57rrLrKg
	CNFVfjWuTl2iVIfuVdhmEnjt3PyEReHaDURHY2oGq8W7LHsgR0RzzG0O6UkZCMll3YsnE8EqvLj
	DkiJcQuqhDjHU84FA8wV1JFKHSEdJbDp1soSK+
X-Received: by 2002:a05:6000:1ac8:b0:43b:8858:1146 with SMTP id ffacd0b85a97d-43b9e9fad6dmr4533166f8f.41.1774622294053;
        Fri, 27 Mar 2026 07:38:14 -0700 (PDT)
Received: from [192.168.0.167] ([78.152.214.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df7dcsm16761200f8f.27.2026.03.27.07.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 07:38:13 -0700 (PDT)
Message-ID: <da3ed78d-fb5e-4820-95d6-527d540cf03e@linaro.org>
Date: Fri, 27 Mar 2026 14:38:12 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2026 10:07, Konrad Dybcio wrote:
> On 3/26/26 2:04 AM, Bryan O'Donoghue wrote:
>> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
>> PHY devices.
>>
>> The hardware can support both CPHY, DPHY and a special split-mode DPHY. We
>> capture those modes as:
>>
>> - PHY_QCOM_CSI2_MODE_DPHY
>> - PHY_QCOM_CSI2_MODE_CPHY
>> - PHY_QCOM_CSI2_MODE_SPLIT_DPHY
> Does the_PHY_ DT node need to be aware about this upfront?

Yeah that's a fair question.

The standard model is to pass the mode via binding right now. You 
_could_ configure it @ run time in principle.

And you could even conceive of a sensor hardware that might find value 
in that - but IMO it's a 100% hypothetical use-case - you'd basically 
need an FPGA that could output CPHY, DPHY or for some reason SPLIT_MODE 
DPHY.

But that's a pretty off the wall use-case to hypothesize. Split-mode 
OTOH is a board-level physical reality which => a DT description not a 
runtime choice.

> If we have some sideband signal (e.g. the sensor driver specifically
> requesting C-PHY mode), we can simply throw all this complexity into
> phy_mode + phy_configure_opts, all at runtime

Like I say its conceivable but IMO not a real thing and unless your 
sensor is an FPGA not possible to support in real hardware.

> Further, the combo/split mode may possibly be selected through
> aggregation of requests.
> 
> The question remains whether the sensor should have a direct connection to
> the PHY itself (i.e. phys = <&csiphyN> or of_graph straight into the PHY)
> or whether it's going to be translated by the camss node (which would be
> the one holding a PHY reference) - there's probably surface for adding such
> negotiation logic in both places

To be frankly honest you can make an argument for it either way. However 
my honestly held position is analysing other upstream implementations 
connecting to the PHY means we can't make the PHY device a drivers/phy 
device - it would have to be a V4L2 device and then for me the question 
is why is that even required ?

The model we have right now, right or wrong is sensor endpoint to 
controller. Similarly the <&phy MODE_GOES_HERE> is a pattern Rob Herring 
suggested and IMO is a consistent pattern we should aim for upstream. We 
see it in latest Rockchip, Cadence.


> Note this is a question and I'm not aware of all the possible combinations
> 
> Konrad

