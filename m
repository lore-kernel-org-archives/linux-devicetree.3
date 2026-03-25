Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030D52874FA
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 15:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774451770; cv=none; b=k6WYCNVJY2Gt52LOAqyyogpf/QrIKER5n/z0DlhdNwSESMYTeT24sBO+yCKVKCQOwnr2cq0UmFBqpZI0ychI0INne2DvMP8PC2xxUQLnpibTrA5mAFWL+ELNoeCMOxGrYj7kpZajAGVWEzlVlh+SQsv7lsS+iUuRfUFyNe5cdhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774451770; c=relaxed/simple;
	bh=/vywv4hZ4+kE2TvgFYQ3L9kVw42zFJldnDoEQi5wZGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bVC0Y67DuuTFU+v1TrcvEXqRycjUcsIx2rKpoyN2OJWLWMR+M7wzyFqYCaWRMr0pg5IkDkiJkAAtSduSusrOdPx5P1bEMxFwruluMMf44BY3z/Pa9pIw8WM3+rBBlWBVHQq7MK9mjDdCPaIwrFwwPhgJUD5vpAjqLUmydiDukrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xtl9lsug; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xtl9lsug"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b886fc047d5so1129933066b.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 08:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774451767; x=1775056567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jeZDmS4QXWBXj1GSyJBXJGYP+hGJySEXWFfrbydgUbc=;
        b=Xtl9lsugTjkG1zZ3ws5CkNNW0aOB1buzoShWTUH9GO8vsOmYQ8EAdjqMrPBnZa24uJ
         5Oj4ABMUHI00QYCSOUD6my+zhaz9e7UFsphPqhbvaxMEMRrcyxLmWlsJQABR9VSTSv6K
         MysRVPFd5hXAOgErCJkqUQP42uxmbycD828DD1TJSpa2RqQvITZs9+gupw9snXR9kwcH
         wqqITJdDFcGkvCgAGz8EsfSTpSee4lXNkI87HVUETqllVPy3L0FGqOrq4MqxursLHngD
         UleQ6BtlB58AK/5VCf7FUsm+bY0dvRFJHXnNB+KqGy46rgBSyiJNm8UY55kJ2JfRNG0W
         MH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774451767; x=1775056567;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jeZDmS4QXWBXj1GSyJBXJGYP+hGJySEXWFfrbydgUbc=;
        b=gRSsGONEXhptOu6RZm0kijSDG60kHzTnQOW8tb4cXjbXB5HZ1orZzM9GrZ2JvNrNP7
         9m/AuCYIwK9KZ/HsXJdIfm4NdUYH/ZR26Ma3QqA5i4rPzHJOzQJOB5PoE4zJxzfy4pGt
         2cElTtsdT0IQVQZY8DkBLoe8ysAgRlReTViVEoTdF76jXp2MWknmmae615/IymAvXJRh
         vUplq+olVWJwsSVM1cTdjj2rHakZAqIPz8GDoGd1TpEnLy7e7hirwMXRje+EMkiULgDU
         bXBnRlHhqme0PPw1bnnkTAbgaWLAty3W4Ku1VDKLQDG5BSzyS/j1Gno2odQ6m0elVOdm
         A4ew==
X-Forwarded-Encrypted: i=1; AJvYcCVTnW7H4DI3HcWfpxzPf3aZ87X3z/TMuuYLtkBsaLQr1BFewJnrn4GYGrbHKhDB3k6m5rysxA3bxP1i@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk3MQwA2GKjibTqemefV1vyKoxmJ78gkR1g+Jh538Pm+OajlXn
	DeCNfGfaWVIE8EwN8ESZi2yjLDEx1isgOhafrRgN7P3QarZ1F6/RYEoZ2MKczBLqp3A=
X-Gm-Gg: ATEYQzwxa8/Ueo9DhXDd4ziCO9capSht2KapJ0fmI29MDKgacrSL56dhk1GnTarkVco
	DNj+S793aaWME5CUqj8tYXjyLZbXDV0F6XIb6q//8EZ7Ef4JqPc+9t33hyTnAyo3szGXkMMqzUF
	6EoQQqyaCjb324HnApb3GTgj+VUak2ol29Kr9uzM0MFulCCPABsKRr+pLHscdSdxCQTZmAwPNnF
	lxG43EhnbFQpyEpl4+7kdZ+rlVZo5v3iKBN3Qpx4+PfO5fdz+696mkudKYaVI4pxhEIuyb73+7a
	zytsWrHJ8XZsx2LhguTi1s2sAjK7ViB0EFaw+LLuKoKE4uiShrNAfKC0o2a2npgiNx+fzoZg81Z
	fhya6OOWzELfE2yTqPpwf2of8cOmaBHPcNniXOn44p/qQsum3B4Uuto2+KLhXvkaPGXHX5tKB9n
	TADsTNbZpnelMQYXP1DnjGnEKG5KUF59kYpuNS
X-Received: by 2002:a17:907:619b:b0:b98:1129:51 with SMTP id a640c23a62f3a-b9a3f1abe69mr195370666b.17.1774451767271;
        Wed, 25 Mar 2026 08:16:07 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f440e7sm800025966b.3.2026.03.25.08.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 08:16:06 -0700 (PDT)
Message-ID: <2c5b8402-6036-43b9-bda3-aeee0c6a9d7d@linaro.org>
Date: Wed, 25 Mar 2026 15:16:03 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] media: iris: switch to hardware mode after
 firmware boot
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-2-9c0d1a67af4b@oss.qualcomm.com>
 <7dbf7a23-7a02-4e9e-99c8-6716e3dcf7d9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <7dbf7a23-7a02-4e9e-99c8-6716e3dcf7d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/03/2026 15:14, Vikash Garodia wrote:
> 
> On 3/13/2026 6:49 PM, Vikash Garodia wrote:
>> Currently the driver switches the vcodec GDSC to hardware (HW) mode
>> before firmware load and boot sequence. GDSC can be powered off, keeping
>> in hw mode, thereby the vcodec registers programmed in TrustZone (TZ)
>> carry default (reset) values.
>> Move the transition to HW mode after firmware load and boot sequence.
>>
>> The bug was exposed with driver configuring different stream ids to
>> different devices via iommu-map. With registers carrying reset values,
>> VPU would not generate desired stream-id, thereby leading to SMMU fault.
>>
>> For vpu4, when GDSC is switched to HW mode, there is a need to perform
>> the reset operation. Without reset, there are occassional issues of
>> register corruption observed. Hence the vpu GDSC switch also involves
>> the reset.
>>
>> Fixes: dde659d37036 ("media: iris: Introduce vpu ops for vpu4 with 
>> necessary hooks")
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
> 
> Hi Bryan,
> 
> Please pull this fix patch, let me know if you need me to resend this 
> separately.
> 
> Regards,
> Vikash

np

---
bod
