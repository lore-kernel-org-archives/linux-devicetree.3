Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C30244D010
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 15:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169583; cv=none; b=GQ9Jo8Yu6aOjJFLA7RpK0fogU/RnPlygMs+BLzgo1xEJ55BgbAvgtEIlusCInJ8edYJ0OrnWodwxY1bYLhvrJJ5j6gMc5YRqFD+nYF0TXFl94EPEkHE8vbgrTOjRyqTUSY2ufsFeGrrTABzbVnsWvoJf4sQ4PMFTsIsr+d+1Na0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169583; c=relaxed/simple;
	bh=9+S2zxMvCv67KnGXE8yesBqn08LbdyThK/csdr0U9FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXZuMcJnwXejWPx6//qrt1OfdSR2xQa0PdXNUZnq2N+9VjxMRahdSInGZMRjujWk9G5mLjyQea5L44LlwgAb6DjmnNlpzYzsMkSmcWe+b0lY6IsgMPwrKeaxmvhkdyarXCD+n191VMM8p+X5pS5JlhkJcePK7KiPXCqxRU9KbV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LATo3EpI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ewo0zEQr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LATo3EpI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ewo0zEQr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647FRuQB3464846
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 15:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gGu2wFTIajaPBghQ0FihXQpYUWio1degOPuerHJdNKs=; b=LATo3EpI9rT6o28r
	KCoPbI3+MQtZievPhb720w5ihgtyGXjJZKsB69pAmEbfuCcRR8V+7lLuUTZZo99q
	lsRjkZmMwSxGPNcNZb8QJ/h/bM/DGv4/26XhxIxFvf1mi4/ep/5/xDGhe5mEvxat
	WsF8q0rOfUc9eaY+UXkzfbdtSYhjXWwjoxcym5g0nQwIzuuQicoGDzONhVtndOjM
	Y89yNz6vhdtitpewPXX3ZiudNR1QY9rb3VGesJm6SNyeXWj+WLZJWPkb1IOTm5UY
	rNmIRkOEA2rszmMvaE5MHz84IG3o2832IOAIzTckyjRuOMLnzoyllHVlQo8HYrRW
	8uNfuA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn2yet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 15:59:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba268cb5e6so12761625ad.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 08:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778169581; x=1778774381; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gGu2wFTIajaPBghQ0FihXQpYUWio1degOPuerHJdNKs=;
        b=ewo0zEQrU/EbXZ4MTy5/lW8inso1w3s1Lg0P0Pfx/uKLR/dX23w3zhJlBc2cKVpHXa
         EfQ+/ek3z66Io9UCRg/b8BnQh/a9yQYKfRt08oTuOTNlg5fx5AEFGieQkU8PUr7XX6dF
         BjH1w6qr72KzjzGLnVVSSRRP2MKlH7+WIYuFtWaFEiDL/FuoWXjbIWgqfOSEL4z0Q85V
         v4eq8nuznRshmZP1O5Er4bcWUkJCjPDSknkw0IcDgnUu213yOw3VGQYl3M1XTywXfMIn
         JFycgb8L5rFJScB5WprB83An4+ZYDMS3gFbG00e0p7k9aCSK1al2AxBklmECvNgKAP9A
         LoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169581; x=1778774381;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGu2wFTIajaPBghQ0FihXQpYUWio1degOPuerHJdNKs=;
        b=Di71wh+ecXCmhb3arBH73QBo13/9453inNJhJIK6X6wpd1u/A05k1iJUgLlZhTpA3d
         L+SYJkd6svPwosyoajmO60IaW6gQimq6zSftq53IT1CBEAzlH+DnqJ8LA89Ori12QuZm
         rZ/6+EzIn84n2ysANj1qeAZd8W7Ef5dW7HMkmGaHFaFyG9CAjMp5bf6YoIrqvCpmxxnO
         /UeTmzARc+MZI0S3l7YW2EoEWESw69HMpDyU3rK9i1ix1ULQ+Z2KFRJ6svzG9m60VZrv
         ILKx+Kj8hc0lOwgTOvecAex7gWuW7RfetMNOwT4u5zgp/dy91vb1jRTY9AnDrL2IydJK
         8Fow==
X-Forwarded-Encrypted: i=1; AFNElJ/IhJyGpSIYZkp6LIvGERmUYKBS7ZfUuwEPf7seIPCjnw1iB7Cs9EPp1aHFapa+tSr722nx09JaTWLD@vger.kernel.org
X-Gm-Message-State: AOJu0YyzrREhR19sYEzliWghUbrRpduitVKdMpQUkpSAxMbtbGBW3n/G
	Pyj0g+l9xhRccM+xhY7V/SJ66KVszxNT8nsfXF5zm6DRg44AaCJ55eVDTeIb6rgDSOB5nXvg497
	E7xirrv25pN29+o4rAsZWmxhUT4kQDDHj+vJm7Tj9ajRP1KEy/AHEadp1aSxDgAGj
X-Gm-Gg: Acq92OFFeFcNQhzD796SwxJIrNSMCvXmrFuH/2zjNpQY1ZBYxgGttw2XfSSo+RWrCUy
	Ir5AKjyQXBHSjsL/rwgTmpadPp9Rdau74NWe1483xd32XPxBzMUCPTJR3xO3iDNG45z5smnQHN/
	i+5+sK1wwdV/QiritoIFGpAJKRDjS/tX+8ZYagPc1Jcbuf+532uV1gpab7NPIsRUzyQYKODMivR
	MAOulJtCMzsUkGPix0IkF5pD9wyotktMZkgLp2pMblWa+dcJoBE+rc8JIWVixCns2KMFC/Jum5/
	71KMifXOZ6ftjDNcTO5/VvzaDMJJvcXWZDQzCNggS0rRdgZdzR5dfN4ni3gWwaP1wbKk08RpeyC
	PpdWz0u1zoVVXQPtFCtMGgr3uMbRDjOPUasd1ws/wLlbtjD30WVYDxN0=
X-Received: by 2002:a17:903:38cd:b0:2ba:be5f:cabc with SMTP id d9443c01a7336-2babe5fcdd5mr36392245ad.32.1778169580372;
        Thu, 07 May 2026 08:59:40 -0700 (PDT)
X-Received: by 2002:a17:903:38cd:b0:2ba:be5f:cabc with SMTP id d9443c01a7336-2babe5fcdd5mr36391845ad.32.1778169579854;
        Thu, 07 May 2026 08:59:39 -0700 (PDT)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae7854891sm1194865ad.57.2026.05.07.08.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 08:59:39 -0700 (PDT)
Message-ID: <2efe667a-c3fa-45de-88fc-ecded1f34543@oss.qualcomm.com>
Date: Thu, 7 May 2026 21:29:30 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: display/msm: gpu: Document Adreno
 X2-185
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20260501-glymur-gpu-dt-v2-0-2f128b5596bb@oss.qualcomm.com>
 <20260501-glymur-gpu-dt-v2-1-2f128b5596bb@oss.qualcomm.com>
 <20260503-resourceful-walrus-of-bloom-3ec6f4@quoll>
 <1136c1e1-749d-455b-9176-5e71fc1fe18c@kernel.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1136c1e1-749d-455b-9176-5e71fc1fe18c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE2MCBTYWx0ZWRfX50DoMA5pWc4b
 6fbNOKydsuplu1aL/S2zg/XZlOjjfNXOALlx/MCpOuPg3t78zMs6PwaoV02t2c3MAifRoS9ygp5
 x7RFV/xG6W2FeAz3C87VPQSHFGI+X+0CR2K0tF2V1zjpEMeKrtpesOoklLKIHiU6zUuy+nT6mq8
 1XlieccE9Xnv0/YA0GLEbTuiKiUWfauy168OZMOvw0ft1G/cnfkI3LlY15HAugn8NTfLpG/oHVj
 RUyakY7X1C6EzcZ5huuDAqL++HAFC9Jnp9Fq1ceuCDoYa2Af22o9QQ9ruaUQ/8WuNsNSzP2MCGi
 C2XrJa+Zk/cs7mJwl+vhVjK0dVUihR1BNlAqw9TFbp+1hVh4aJDhGjDlldz2qoJD5ZCfNzH+Ktb
 j3fTfIisTRsV4XoevTF7pTy/65US9tpZPBB3W0RNsnzhjraUkJ+TpkGh/WNfv12L7g7p9wyOzlc
 WVoKHQZ6iII32P4ZcQA==
X-Proofpoint-ORIG-GUID: o2MY_oQyScOlL2KsT9It6a2fHRZAWRL3
X-Proofpoint-GUID: o2MY_oQyScOlL2KsT9It6a2fHRZAWRL3
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fcb6ed cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=i7vGOPbq9zpShFDyuUEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070160

On 5/3/2026 7:43 PM, Krzysztof Kozlowski wrote:
> On 03/05/2026 16:10, Krzysztof Kozlowski wrote:
>> On Fri, May 01, 2026 at 10:40:37PM +0530, Akhil P Oommen wrote:
>>> Adreno X2-185 GPU found in Glymur chipsets belongs to the A8x family.
>>> It features a new slice architecture with 4 slices, significantly higher
>>> bandwidth throughput compared to mobile counterparts, raytracing support,
>>> and the highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among
>>> other improvements. Update the dt bindings documentation to describe this
>>> GPU.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> I was a bit too fast and did not notice that this is only one if out of
> two required. Where are the constraints for the rest of flexible properties?
> 

I will add a new entry under 'allOf' for Glymur to describe a constraint
for the 'reg' property.

-Akhil


> Best regards,
> Krzysztof

