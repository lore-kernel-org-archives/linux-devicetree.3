Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514219;
	b=lyoqimXQIW6959PGmtFXUcY2cHVp/ZHghHcsVGPri4LWzUspXdUwZeXw5JqXNjjqEqFJ
	 SY8Ovk2U6oTDeEpVnqfUpjWREvUd64qrARrZE5fXspQoxIl52MUyA+PlSxTnynjwUsHAv
	 7BAWujz4UX0YjOETuzFEpZBgisfAX+iW4IMh4La1JK3CLrBlCWGHMdpQ3UfwPvHmeUQ2+
	 /bCj4YArvs5WRkQ/JYqd+1RhDW5lG77PtA1/CJLSWPs93krmyyTZYZlLrM3zI82np4kBx
	 YUZwyAqlp6dmxd7GGFgB2Nq7aOe/qRD5w+/NzhATxhTuSGAu0Xavqv+aTQzZccWR+oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Z7ixIHGB/x6muOCf12bPPxl1sG73TY3AqjMKZ2p7Iqw=;
	b=lE5ARM02DPd6M2omEm+GPFAjyiLiOUij71F95c3jOIXDW2b4Ne5zUAl08rtU2EPZI+Tf
	 9YHLC1jEjPyR4OE0FSBIvOUsSSDKmXA56uVBY30qWpuSyJQauQtVj2Hq17cHNiuMidDVD
	 GhAcdanpUH5Ys1N3Un3XPTy8yX7YjubLc5BY70KBzind+LTz9GuclvI1elQQe+wJ1c/qq
	 aXV8kb5+4TWSOR5RZNuqmf1xNHqHGuAfo79sCO8T8ybS3ILl9RJcmxc+Ec0nmVDCd9K5Q
	 ug8Mf0qyCF7zqWjLCk2xYfAWOqXspOvwE31nO4d2kgKbMZj0mQL/HR8BfUj8cR/6kcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fmCLP9gt;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C440606A327
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C440606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fmCLP9gt
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c1ad0d0b72so418932e87.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795514217; x=1796119017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z7ixIHGB/x6muOCf12bPPxl1sG73TY3AqjMKZ2p7Iqw=;
        b=fmCLP9gtyFynzPpKhVinxN3fvX0HMhPJbqD1her/p9bj1TkyZMQ3CUW2x1K2iN6Q6x
         wZ4W5yjzxqt3fzPs1oofjP/eOC6ezr++bplcBpOLgydsEwa/ibvh5ZgR4ciR1XPO9Nun
         tJP8gaFyKB3uXo1JAq1nJVoyQ3d6zu2DJFMcAnm9FOJt6bYNI5jAISAfNXrcQZLMqqbS
         XbcOsFJ/qBdpwrj8ya6lkp1s4F/MKwr8F9x6FTOxCEkFzlQMc66c57dzu5b4dZXrAyqU
         sjyN/lSUSN7rV1QbdPFM53mzZAdsRIXj0FmSSgxsnNdCJIdXXBRN5ZSI4uvoC3MJhezY
         xrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514217; x=1796119017;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7ixIHGB/x6muOCf12bPPxl1sG73TY3AqjMKZ2p7Iqw=;
        b=GswwovZht08FSdVQxJPD1VcQrlRg1TQAckDk04t75OB5LKuxx9axG2GvJndNM99Bap
         oPKBlkVbwyQykeovCOAK8XTwr/zM/HI4gpXsiJwmTHasCpSwQhGY7s4lieAIdI3bYCLi
         DjOM+fQbmgYUxwPvvnzWUdMPfSx3DFK0GNFakCLkJuvfFI7rnpZTy/vjaBPxb0bLNp7f
         fL/bCPnXVxM4QFL8WMwd6/tYm2yXcO4rXk1jFy6+quLP6LPHI2izb5DVaWqtIh+7BnWu
         EUl10i7hT2NHx5TX17hK3iwR0JiMRWmzL2suz0CXOlHv2Qv4SQ9gHa+QF8rAVoQW9Z6g
         D47Q==
X-Forwarded-Encrypted: i=1; AL+hErHSkJ3psk0gGAzfCH8a+qVP4XV31iBP7ERVjeffHUbHWQBJwx+PhZMv7m5fgCQ5W/hPX+wrRsEZ5FX5@vger.kernel.org
X-Gm-Message-State: APuU4Z9S45JYuSuVs8CvN5DEK8Ov7vwWBidkUacWnLxtEEXh/xpJ1nVB
	EXmsTHDPooR7Zwm/xQbZKolFKdesgp0f9RllYA3Z5R1PCJjON7ipDUviHLC/OIBOAH0=
X-Gm-Gg: AZFdTZcBtuXlFkCi2y5HHtVxFXAMlC+41XoS2lZHhfQI7UL4f+uCxNM2vmXdTSVqY4P
	hURTrbTVxp3B8lTADuwtpKc+idWKuqxp2PeeFVQXoSoYruLYUFLC9FZSJm6e9Jx5Hx2vY/OiMAn
	7YPmw/oVO/sCed608A4HpX4GD6on0rDvskwqxph3CLJ5lOR9E/EkO10aivCj78J6f1xdUtSxLJA
	Wk7TrasERw7yDadHi0C4RAhQSaroRKV5V57/mCq13UyJ/1+F940tNdAmOOaMTX+6YqvV+voYYZK
	3Rq1VWElP4wdNzTWzjmKpXgjL4MQavHPkLY3YtxiBT5k/cjjG5FI7oHJoUx9t1p28Rq5+YbLqCU
	7+cFwlsJ5+snxMDhAudshjmdcLSMgVo4qS46fIX1s8H6cWt5FKnRJI/W869F/oQIio37UmQuJBB
	wd+UhCAUVVvxpK9arqJKgmA9qGJ4k1zr75e33javijdhpQrW53SNwe7/GKlyKUPGxS9sGhVnHLq
	4Gixy6BZJoTk4xo/pKVjLUz4SnqKpEbOCV3ViIJ1wKwh5+sCFYjTxnq7HqxzZAkjP6wDdp+zyMp
	FOoCoL1r1nvDmV8VkNwiGpXRUulfxE9e8PMQogwbzJWKsfwPlIZNbt5okABQRqG7b28H6gosdbH
	lRHrGuFU=
X-Received: by 2002:a05:6512:b88:b0:5c1:5488:f57d with SMTP id 2adb3069b0e04-5c1bc85b735mr5132306e87.4.1795514217327;
        Tue, 24 Nov 2026 01:56:57 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff86c4sm3570448e87.22.2026.11.24.01.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:56:57 -0800 (PST)
Message-ID: <da038528-5b25-4956-a14f-1827ffe2eef8@linaro.org>
Date: Tue, 24 Nov 2026 11:56:44 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: Andrew Gigena <mail@andrewgigena.dev>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-2-0103e8a0bbcd@andrewgigena.dev>
 <21be3761-9da9-48c6-aaa1-b56f8625167a@linaro.org>
 <ab79818e-4b4c-4b58-bd2f-57d9ae4cddc3@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <ab79818e-4b4c-4b58-bd2f-57d9ae4cddc3@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew.

On 11/11/26 01:46, Andrew Gigena wrote:
> Hi Vladimir,
> 
>> That's an intermix of names, and you will get a review comment from
>> Krzysztof about it, I stand aside.
>>
>> Here too.
> 
> Krzysztof did comment. I kept the vfe0/csid0/vfe1/csid1 order from
> sc8280xp-camss.yaml in reg-names and interrupt-names, and asked him if
> he prefers another grouping.

Exactly.

>> Drop 'gcc_axi_sf'.
> 
> Downstream sm8150-camera.dtsi feeds GCC_CAMERA_SF_AXI_CLK to CPAS and
> x1e80100-camss.yaml has gcc_axi_sf, so it is used. Can you explain why it
> should go?

There is no CPAS in the upstream CAMSS stack, and it makes it irrelevant,
that's why I asked to remove it.

I believe one day CPAS will be modelled as a separate device tree node and
device driver, then it gets its SF AXI clock.

>> Drop 'cam_' prefix and 'cam_sf_0_mnoc' also.
> 
> Prefix dropped. I kept sf_0_mnoc because SM8150 has a CAMNOC SF path.
> Should I remove it too?
> 

Yes, please remove the interconnect, it adds nothing for upstream, and
I believe your tests will show that the image streaming is not broken,
if there is no 'cam_sf_0_mnoc'.

>> Or C-PHY, right?..
>> In fact you shall drop bus-type from here, because the link between
>> CAMSS and PHY's output is not a CSI-2 bus, it makes it inapplicable.
> 
> Agreed, bus-type is gone from the CAMSS ports. It only exists on the PHY
> sensor input now.
> 

Thank you so much for working on SM8150 CAMSS support, will be glad to
review the next version of the changes.

-- 
Best wishes,
Vladimir
