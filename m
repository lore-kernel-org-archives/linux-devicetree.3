Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893152;
	b=LhlTs8M/ldebU/vdMdPP5/0jWz4yHb26uX9g5oXwnla7+m8XkoFRuimSVBnEFupzqdPF
	 W3ee7dZdYOdI+zSRldTHSTqbveBsSC3O+aaYzNN1/L8Ud1C1a+Sh/mS5z63ojOfof0UsO
	 wlH21QNtRMyrM/bSlUFFyXa4AO+u3AmDiL8TBHyOfrmksgWCYnkeyDqs6ffVFR86u4Uq5
	 vtc4lKkvJL+c8xs1v1v9ndkHyQve858wJSlxepKU0aMbsn7pwSuqMhIgaWJAXkE/xfAZY
	 vNV06J0wtdh4lzQiCuH6TazbY1xUWt9/0YzkXcTYJsnfwoViqDYCVqXq4qcgbhgxnbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Z5K5hANiP4hKvDWgB+1UuOsMTO32b8ekKek1eVxjOKw=;
	b=GOwMptO3w4G5eN1U8cUWtgaECFJ6bdw/OU9/o7WNqVBDk1ssI6uvjO4PENVQglrFVzR/
	 bJStKDwb3GNj/rMmRpmVkUvxXUhaj8F1lA2KtKGiphtp8Sy5JRDF2So0YoSxJcSZe9FsJ
	 K70uDCi5zEvIPDJgsMEcHoinP5FAZ6/4riAszT5gdTvIyBOmKwizVNhbvIfmTBlmn+6FK
	 qZUdzciy2oTB0ItcAX+/DkcqXoMzHNByutOMVGnO2FzTqZ0K/kVGSHopngoyqQCHwwsts
	 A7L0O6p5FEUD/SFOA2i6nxhRSufcZVBSpSfS+fYxl3rkNtTwEeI9dJnMp6avinWW1YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="NAJ6/dW1";
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A23606EE90
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 15:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59A23606EE90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NAJ6/dW1
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be502e1adaso162102e87.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 07:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793893150; x=1794497950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z5K5hANiP4hKvDWgB+1UuOsMTO32b8ekKek1eVxjOKw=;
        b=NAJ6/dW1nNAVv5R+uX3W5IJtd67R+F0lgLEmD9I0ASfgwmXwO68uagcQFee1bXpMzX
         /6K6Wiz1xN7GQobFBDvwjYth98PaWzz2StfLEijXVxgd0ai01lNQduJdItoH0rY7mNOM
         Z4mrBiVTJmVQ1bhYdDEbWXIJ66Owovkmmi0H8qeuN8Y0ZrXJymDGgS7Wt3tFcfVO7Mn/
         ky/qEi9xlbfRbqU2rEMwa0pGjc68SLAfpjgpemuUG99osK0OuczkdeMv5ejwGqCOPivU
         my88SK+ooURsBq+1kLvPZxDAvSnQw302cdQcqHytJ8DqambTc5TMyfuunxoXIS97/8Xs
         RekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893150; x=1794497950;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z5K5hANiP4hKvDWgB+1UuOsMTO32b8ekKek1eVxjOKw=;
        b=Ug32L5T5/ZWkIcl4JiCQ8/DjHMWxa26ZCMsjGmJ9bHLvUWdBZW8BErxVquQ2XffKFS
         EG8rdQ0J8jHkcYykDwXnlYadnSmWXzPucenJ7wmwwhntwJBfKfzT3VxU0qJ7ozeElA3M
         Nq/yzKnL3x4OOsgE2Hzn/j4tNiXzfNJJyZhAVYUPuydBuF5xWbTpF/cbdtuH6paRjAmz
         4phMoCkzdb09ZmhAKxrY8Dl8NyiIoasL6/WaKJEahd4uLhdCKyYEtDClAX3bnrri8w9v
         DPqpIsOJeoR+wUOe4P0IC1V5EQ/6buEmodnXLKcqsTYVIT7wQuzEeXnKLcn9dtO6ChC7
         PVtw==
X-Forwarded-Encrypted: i=1; AKwUvByo9tKhjsgUhtUXXxViKU6iCYvvu74q5tj1N6ivI7bUxoiMrnMQpIH8Olaev85kffeNb730yz3Srlu1@vger.kernel.org
X-Gm-Message-State: APuU4Z/riAespi/KBhxykAYxE0DWda+JOjxFm8Iee2CqybHtJlQjLqtV
	n/7OT/VtEpZ6NEc1SsC5idxaf7bpDaUhsAUukuSFySTChbumKhTBtVOvK1bW15Cic5v0sh1GeM7
	WNf1QLhI=
X-Gm-Gg: AYBFou3XDWWtnGFlciwOE2sdC5QQe4FQ2rADOBIbzkviGfEY1niD+le/G05xcpslLcV
	fJ1cDh2eep9sLG3FhfuAV+1ZRuSe4JFd7WlHl7WGxcioFLJuN8WkDwjMeHryIFzdNPR8Kjbt736
	ejjwZT+ajCQ7hVk3fJ0oHy4i/H/+kb4pLEP0nUX4ZtA6JLzk9s4eANtItgvFHgXE1Mf2eQeZOX0
	+16Ya122oVZXUcwxPDBNCOOREiyAgH1plu653Gs6Im/SsXSYmCCeCa+fZqT2Hk21RcHsziq2yQz
	QL279yZz6vmdnIwF59XyAMSnijvIkA6G4GAT423eNCQeaSMLMEnaMM6mReJsGexampjpaxUi4h9
	IfNMmMSQEUJabwMHRZVi+VgLFK1lS3QMaDEuy/X+Tx5gZYJkaqhTw3EA/vFPHlRsXrR3tAW5qum
	f7AXxspzbnc+B/+HFX4lla7ABAZHi9bwhLzirN6l/SA0qBeLFfJyOk6oM2bHyTHKr+3/uP/90KH
	+ky3AS1FksUmeeG7uo+YzqRrERsUZdJx0cY6U5IPMgKwOCC7ckPuARJctVnZizgk0BRqOZMPu/2
	DgtjglMHuj8bDqZdAM/f6k7HeXRFn4+aI5pAa01JORizgMW7l9l60zEc+Z+VWI6a8C37E6ny/va
	ETGR62xNLdZ9svwZ6O5++HfwTdHU=
X-Received: by 2002:a05:6512:4041:b0:5bf:a48b:7807 with SMTP id 2adb3069b0e04-5bfd952024bmr6876236e87.1.1793893150208;
        Thu, 05 Nov 2026 07:39:10 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff9a660b0sm485831e87.11.2026.11.05.07.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:39:09 -0800 (PST)
Message-ID: <4d656385-fd3b-426d-b326-b1d20ba1e2d7@linaro.org>
Date: Thu, 5 Nov 2026 17:39:09 +0200
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
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll>
 <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org>
 <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org>
 <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org>
 <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org>
 <CAFEp6-1fSPP41cVFmu8=0z2xibDpHuH5Lxrw7W_rvnt+Fw9EpA@mail.gmail.com>
 <62fba00d-831c-44cc-8d3e-083a95abfbe8@kernel.org>
 <CAFEp6-2_opRq3pj6S=2nDFxXBv0waeyGBKSxp3t8OOe6vvKcoQ@mail.gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAFEp6-2_opRq3pj6S=2nDFxXBv0waeyGBKSxp3t8OOe6vvKcoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/5/26 16:01, Loic Poulain wrote:
> On Thu, Nov 5, 2026 at 2:21 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 05/11/2026 13:04, Loic Poulain wrote:
>>> On Thu, Nov 5, 2026 at 11:45 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On 05/11/2026 10:53, Loic Poulain wrote:
>>>>> So some chipsets share the same IP blocks, with some block/phy
>>>>> instances disabled. As a result, we need to decide whether we're
>>>>> numbering based on active instances or on the actual hardware instance
>>>>> index/offset. If we use active-instance numbering, then yes, it should
>>>>> be @2 (CSIPHY4 being the third active instance). Alternatively, if the
>>>>> port numbering is intended to reflect the hardware instance offset,
>>>>> matching the register prop, then @4 would be more appropriate. It also
>>>>> has the advantage of directly identifying the underlying hardware
>>>>> instance, without requiring any additional driver-side mapping. In any
>>>>> case, @3 is incorrect.
>>>>>
>>>>> That said, since the bindings have already been merged in its current
>>>>> form, we'll need to preserve backward compatibility when addressing
>>>>> this.
>>>>
>>>> This is the input port to camss, so how is it called in camss, not the
>>>> csi phy?
>>>
>>> The CSIPHYs are connected to the CAMSS input ports, which can then be
>>> multiplexed and routed to different CSIDs. The mux identifies its PHY
>>> inputs using the hardware PHY IDs, so the CSIPHY4 is identified as the
>>> CAMSS PHY4 input. In this configuration, PHY2 and PHY3 inputs are not
>>> connected.
>>
>> I could not find that information in Glymur HPG, but maybe I looked
>> wrong. CSID Wrapper lists CSID 0-2, not 0, 1 and 4, but again maybe I am
>> looking at wrong device description/interface...
> 
> Yes, there are three CSIDs (CSID0-2) and two CSID_LITEs
> (CSID_LITE0-1). These blocks select the PHY source to be routed by
> programming their PHY ID (PHY ID = PHY index + 1), as defined by the
> PHY_NUM_SEL field in CSI2_RX_CFG0.
> 
> If the CAMSS port ID matches the PHY index, the port ID can be used
> directly as a routing reference, which keeps the implementation
> straightforward.
> 
> Alternatively, exposing logical port IDs such as { 0, 1, 2 } also
> makes sense. In that case, the driver would simply maintain an
> internal mapping table, for example mapping DT/logical ports { 0, 1, 2
> } to PHY indices { 0, 1, 4 }. As long as we establish and document the
> convention, either approach should work fine.
> 
> Today, the Glymur bindings define DT ports { 0, 1, 3 } to map to PHY
> indices { 0, 1, 4 }. One could argue that this is already an
> established convention, as it is documented in the bindings. However,
> it is somewhat confusing.
> 

I believe it should be fine to have incontiguous port indices, because
there is no need to link unused phys to CAMSS on any particular board,
therefore there will be unavoidable "holes", and this can be set right
in the documentation of CSIPHY to CAMSS connection.

-- 
Best wishes,
Vladimir
