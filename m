Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01B94FC330
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417302; cv=none; b=tlgSHdkxkbtKmMnk9GfvS2Gu01hSiEQ5L4XtByofyxdLVLylm2l0oUfnLA1MCo5V6zoswZUtbV9ElVMFn42Rr2ILP4sMAI13KJHMuMZGVoOBf43gO/4HcXjgbMj7J8JfD/bQSy4YylMw9mLOKgA4c3MZodFxmTL2HVGzMIpcFtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417302; c=relaxed/simple;
	bh=hLRYNiIFpN5MJZo0UujIbLJcUZVp8+gOs06hfUBDIcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l+JN3827KoLF8Cay1Qj5Y8g2jpbfTf1/BBwUWKWep4aPoTYHMS4M/AKccnP8V7R8qkjGJScOLINxgHjDaDS8ntswItRYwfB8ZSVyfajQZQFcPVjPdYGCmS9Br5m0tXLuLkGxIp6zqbc9+tLKQc3Aod0MzebJhP0ch74EuZEmegE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=omHBm/48; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jap7YI+g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="omHBm/48";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jap7YI+g"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OrRW1665504
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dDGgUx2y+vlBcRfA5nze/kCSIFOOUQjvYj72SlXRyOQ=; b=omHBm/48enmLcQH/
	MNw8ut+xE4M1JaFUhd5ppKQYXRk174X7DcI4lJ/rbgLUWbP6794HOkDiJfagG2WV
	xi2YLRAw5FdI+qUlyIqpdv6F7ws+P0WTqi4VnB8qnTQ8R3g4ASB8kuJkryQuTpMs
	+8GCgpschP2zYW8psKdYFFvKyp8xTA7tsVPpu08cfTQnwE+Mq4AOaGb9zKBGFxTR
	yy9zyQA6HDBSr2vDzpMk13XQtm8x/sR1hPgW5uLIYDEEpturxeoP477/5hKDm+tk
	PNz29+fkXoTCUpZ4kcfFXC0xOQkVTVL5mQWZ2Mo+O3Pjic3TPfLi2S5ZJghBpRem
	EjECjA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n1bwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:41:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e93e2f72bfso25874175ad.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 06:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417300; x=1793022100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDGgUx2y+vlBcRfA5nze/kCSIFOOUQjvYj72SlXRyOQ=;
        b=jap7YI+gWNqJhpB89hLdZwKg54zKBnIsq3KylwbogVJf8yVf8wPp/jyG3Lw4EgVY7O
         O6dv/j/vyfWeXBALV+XPEmOWjGVU4BiQsjmzqndd1TTUOg/hXATgJ8NLe+VD/JF146BD
         TpUT9kyvhY1hnr6vxNe+WTJhyggqYEE1KTfRR5imDSCrxJaES3AVJlVGBM3yDfxCJxwC
         UOAvj2LMpx83/JrfDYAnGRPLt25Hr+Ta49TvjaYZ5TBuacVBiXV+tRv07K7iyID3FWI3
         5DG+zcTzpVqVbDrwZB6fdUOS6QTAc395T7Y9MGCoXOZYk7iqxdjXo1I2Lwa91q50vIM2
         mu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417300; x=1793022100;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dDGgUx2y+vlBcRfA5nze/kCSIFOOUQjvYj72SlXRyOQ=;
        b=kkKSpUewKpgqilqu1K2daKUwpRNXsGBEi0OLN3wMq8JtuPcrYX6mE+D/Ai8345W1Tb
         sPFHm0oufTa9ZCZCfzZwpbHBqUkOhQoMt4pKwihXUpQWfbHpGgvRix7b/wiF5byDMLV+
         Vg6BIDa8oIi6qca3IrcelLxSvBxoLaLhAFArLU0WUtBRqBO7vDMOWufEQhlb328HpIWi
         bfcgkRvyS0oXYydURNSZi9ae545acqTidWXMuZHx5GV7WIOKsavZl76uuXwUbXOZbVf+
         s2E2phpNu0kYjRY6xO72/s0TfUt7x6Gduhe0M0TGzDX0ZvNOy28ly9PBMWBI9dIKu/Z8
         93Lw==
X-Forwarded-Encrypted: i=1; AKwUvBwDw/ZUJIarIBsM+0kUTO3Q6gY+ZTb9ynWOX58TzYosmCO5NJFRo0lLmDo7G9vP1Fn218RKJcvC3aBP@vger.kernel.org
X-Gm-Message-State: AFq9FYKnh5H10Qae4+o7X50W8NyNPXNRzPiwGya2dfqP5vER88W11OH9
	njZC7cc3exxVsJyf+wyqsC3GcXFIHdcqLf6U+zMrSRkDKqa+oPUNtEjB1c7Iw+pODv6MEwP8nd0
	7qgqpOL2bA/8+hWqZ9wqLq3FEwkkqu3mvTbaJ2jS6HgLToRzx+u1JR5tXLQrp8US5
X-Gm-Gg: AYBFou2lkrcHMJpp7b4yq1iR/E58JuKu34FCzz677h6XY/r85CXPWZ1K+HXq1hBZrCT
	x3QnT3LfAYWQXF96Nj7EfIkyd7fiiQlbZOJwfxl4tAsZ/EMMcbXB3VJHQHWqaZ7n4vpgdpyUXF8
	yPPPE4RDRGEFdA5DPityVgZrRCZR9VuhvfWrdrl7vupGpv/ZwflwfrABChvTqebrhgoTtl2eJFp
	RrKjuqKxVzgWrOgcocAyyDT5MqaCfOsKaHWS2LV2ibiBYJ0ThZPO1AAcqQF+Fc6wB0o25e1JB6M
	iHP58ckxYJFj3JPEqyC4ZjQ4H5Yq5rvjE5EJ4M1StfPdnOzBbcgoNO0jZnBj/9R3XThzm4eF+CZ
	uJBHstbahnKOiRmdFUgyy60ohiFm+Un63JgU=
X-Received: by 2002:a17:902:f546:b0:2e9:5a8c:5ae4 with SMTP id d9443c01a7336-2e9a6d403acmr67541255ad.24.1792417300234;
        Mon, 19 Oct 2026 06:41:40 -0700 (PDT)
X-Received: by 2002:a17:902:f546:b0:2e9:5a8c:5ae4 with SMTP id d9443c01a7336-2e9a6d403acmr67540605ad.24.1792417298844;
        Mon, 19 Oct 2026 06:41:38 -0700 (PDT)
Received: from [192.168.0.103] ([124.123.193.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1501e269sm989185ad.46.2026.10.19.06.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:41:18 -0700 (PDT)
Message-ID: <5c2a1c97-1ae3-4369-b94f-93264662ff47@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 19:11:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/9] ASoC: dt-bindings: qcom: Add Maili LPASS macro
 codecs
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
 <20261014-add_shikra_support_v5-v5-7-fb9f0667e613@oss.qualcomm.com>
 <20261017-vivid-chubby-chimpanzee-c31c56@quoll>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261017-vivid-chubby-chimpanzee-c31c56@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX3UlQk7CDZPvy
 RdkGDrXlEQy+fJSqjawN6nfSwjh08Bzhoa56XUdu6u8uWFjqMIJJaHXL88x5eHV9GU7wSpyDy8A
 D37+QQw0q3Wzvb1wd/fR6q46r3bOQdc=
X-Proofpoint-ORIG-GUID: XOZik2u2E97fInO5OOAP1yeuv1IAAOH_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX9W1uggWMpIqW
 eiYfYgY17DHYMct4nUXGfpbCmUFtl/FvnxzejaQBxv9QZJLKrTyELO3QOlUuukM/PSJ7TpqjT5l
 9EwTn2riKNj0k3VLfM9sCmwg0wU8ZKeHWerUXvqLe7nmu5YH50+BkF2NloraQFbIa7FaVYqb6tP
 RVF7JbEJ3bRuRploWCQxcZdi62TFhjea4x/2Ev/OfE9uU6JWKn8V2sPZzfWOtXvpN7/irMpWTnQ
 BeOFf9qrQjH626Rp2gzL1ZFxInWKOtrpuY9juWsLkhKPU9cMkrJWXuoeG2b5RRQUPz/l+stolGA
 haR87NKi62AQQ6bfXaqWaO4fbhZvpxOpH4uJNDjJdk8mAkqTzyO3tuWil77HgZpDx/XeYkIHJv5
 iLaO9DKhKHGvZ9nLpxLLaD7SF7FRehYTWQkXev3eYXUKE+Iy2LIFq1UQxA66Kifv60vMuuwAWDd
 UQSlWohJbT2JYScNw4A==
X-Proofpoint-GUID: XOZik2u2E97fInO5OOAP1yeuv1IAAOH_
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad61e14 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=BrlcFtHvR1PXzI/wv7BzPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=s_dmKMIZ5sDHlGwdeUEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190054


On 10/17/2026 10:02 PM, Krzysztof Kozlowski wrote:
> On Wed, Oct 14, 2026 at 02:42:53PM +0530, Mohammad Rafi Shaik wrote:
>> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>>
>> Add compatibles for the RX, TX and VA macro codecs found in the Low
>> Power Audio SubSystem (LPASS) of the Qualcomm Maili SoC.
>>
>> The Maili RX, TX and VA macros are identical to their Hawi counterparts,
>> so document them with the corresponding Hawi compatible as fallback.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 4 ++++
>>   Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 4 ++++
>>   Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 4 ++++
>>   3 files changed, 12 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
>> index 142955b85..41b578f83 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
>> @@ -29,6 +29,10 @@ properties:
>>                 - qcom,sm8750-lpass-rx-macro
>>                 - qcom,x1e80100-lpass-rx-macro
>>             - const: qcom,sm8550-lpass-rx-macro
>> +      - items:
>> +          - enum:
>> +              - qcom,maili-lpass-rx-macro
>> +          - const: qcom,hawi-lpass-rx-macro
> h < s, thus this list should be placed before above one using sm8550
> fallback.

Right, will move the hawi block above the sm8550-fallback one
in all three bindings (rx/tx/va) in next revision.

Thanks,
Prasad

>
> Best regards,
> Krzysztof
