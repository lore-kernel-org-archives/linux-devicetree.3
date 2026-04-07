Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B64F3502A7
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 04:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775537926; cv=none; b=FjxI8Wqld8Bw47/P+DNa7BjKiEOvuaFQgXvYDfeOmScLZOBwWlRGvqkvneqDRTMtUr7reXfTos7shO42T8E01fIT6db5RrzL8hr64c4xmxI6FfaRZ0KN+DCgezthTSUom0Q6LAaLgUEGit/YPIRPOjOuwEL8KR7j6RIiO1m0QdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775537926; c=relaxed/simple;
	bh=J++kxu/Qhsw4LsB04WiHy/TDQ4EalrrhKYHNO3yHMUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtwggB/LfTrOj75RhcBiF2BvpAZpQStWOx5YZ3WfNR7Igkx+UZpSnAQd/i6LMEz+GRw/w9tW6GF4DY23Mx7mftIMk/+nUVV802V1wEa7840wpYVkjDlJABuYc+WMcQRvf05ss79ahBcA/WkHYIvoUa8xIZv1gKoirBDG13xXP+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EpzUrMV7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTwp6MmF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EpzUrMV7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTwp6MmF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQgq44008704
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 04:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fI1QWCv8LnJQ96xsWZNjekKg+htIRb2Y3HJHwChBLug=; b=EpzUrMV7XmgfGTtb
	nXX7oZYN2owfGiVcPUBtRiBNFj50mtZkQmT2W6VJurwybImIZ24MlYJ/Ym6UVo3i
	kpjhqq3P/tqh1cd0hLTvpr9TvMy95a1kZtwSxOvqpr01gay2h6Y3eIIwB/TSYBG+
	36VOlBaL01pJz9OtnwAmcSWV20QVtVjOPeBNdIqhK9eQPpTgfT/ybDBOdit+M71C
	egY9d/HbD52R6BxkxPzoTpfG4fegUZT0G1rxJXDzguSXdc/WIVt8cGVPGyUVh6vG
	oZPE9Jo5y8qpxW1xBVUYWxgm5nOQMm2Rqk/W8/W/Rai5u10ksxczTBIjSYlkmpLV
	kbomOQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrks2gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 04:58:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7422397574so6625523a12.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 21:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775537923; x=1776142723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fI1QWCv8LnJQ96xsWZNjekKg+htIRb2Y3HJHwChBLug=;
        b=aTwp6MmFYMsEBTdPtZCz5CH8P42lr7i1rm5LL7oXLVbwWWcDTc1cuCW4JfI+yAWSvy
         Zf1sX+yGfu/EJ2Sw/VBcBMo/IxvHQ8nJACgUu4PFDcdQft1zqKEHeW28pISJ9m6Mvo82
         jhyE9bZgedDnD+Kl+Ak65Zg46UYB2LrtPu6wovJRDK7J/wh1EuNpMwQXhav9t3at+4GH
         MEUPnDpQjW5a3hF0KQA7uGAtYqHJpE0+lKj9GDaVHt1bv7s45VdE3E0Z+bHomI7UaaOP
         V0iCnqBojlsu0baskf/jmzJj28FnPdvV49epJ7TneNFouRGDQM9bDja8s/Gz5B3GoIYn
         B9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775537923; x=1776142723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fI1QWCv8LnJQ96xsWZNjekKg+htIRb2Y3HJHwChBLug=;
        b=XXF8PLcgdNtl024pvvlyFUYYH3udhTUr8EZhEMpTiOAw97Gmaiu7HDte5zQUJpZdBf
         6ZoF5sz/t52ScH1RLU/zzqmOAtlOAldKYIc8On6VvSkMchUlghcMQz3cXe0svHcOIaJM
         LV3Nv5as/7p3ETgFzznM8fKTd/sEMQ9bqDzf8LyEBHCZpu71hFNeZ4vLWPszdod0sXY0
         MYVCkgxvXFJtEOkPPuRWJLNCrxYS4A9EECepERzWiqJuUnbCj8so5LH1BprP5hslcetM
         WbjzyAvvcvJm1McIhvL0GU0UHcQ++wkhp1u7xhTcNVPO0YdR9okIcowAYp/umQLWITBn
         H4Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVqA8AElHH+QvnJjZvQg5XOrVRCOpmQxadf1WbsnVohTP+wIcnr/tivU4crbc/puB7tmBvyIQ5vhij1@vger.kernel.org
X-Gm-Message-State: AOJu0YyI5wd3km5zkaFJBE/4sCGmEijPwoFrpHnM00B+j6vWX43YEWv+
	fX10eWG32amkzyu2KyXJTNzOm1JVI7IXyVWU1Pc7q289fkypVWBwSrK0Jqr9mBP8sIp5r2Sm0P3
	nsXbPUX1w7NhbnBRFPaRK5J36VqiN35s872dvAX4mKyBW8W2UvUWuHTs2ltdRWu6H
X-Gm-Gg: AeBDievbQFpIja0hW2zIxbHncNYuf89V3M6dsVvguhDMUVdZn4U7B2BM+rUyPv2sMtp
	Ix1eZ6kovT/AvNA94zy/yCUcqUKQKLzgaBPUPyK/tRfc2wq9Exhd4nlp5ey3E+5YDuEkCaaV72z
	rMaIcXuEq60/4wkZvGf4KdVt6zHJU9cIH3zsyCRCLJMg6/ZgNlCRZZxG/k9keSkd1tA56FfnLTx
	NDzr+zIOCfxfKe5vWu/XJDg1vCfSngEnPls3ztr+p5hEQeymkjy2Pu6hixQLqkVeooG6pMC5nr5
	y8weOEsjaeuACdLMDEA5aa7QiwfXqi2QmcsTDP8ihgGiK2w9wboe8m52E4GbTDIFr3pJeAVf172
	0Q7ZmJ9ITdzQFaDc8djvT8Ne0sfo/vOCNsZJ9gZFUrueg2w9ysQOm
X-Received: by 2002:a05:6a00:338b:b0:82c:e0d7:2682 with SMTP id d2e1a72fcca58-82d0daa569amr14383790b3a.25.1775537923217;
        Mon, 06 Apr 2026 21:58:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:338b:b0:82c:e0d7:2682 with SMTP id d2e1a72fcca58-82d0daa569amr14383749b3a.25.1775537922619;
        Mon, 06 Apr 2026 21:58:42 -0700 (PDT)
Received: from [10.217.223.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6fdd7sm16011317b3a.48.2026.04.06.21.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 21:58:42 -0700 (PDT)
Message-ID: <36b4fead-81fe-4b98-9de5-4d524f199569@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 10:28:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] dt-bindings: crypto: qcom,ice: Fix missing
 power-domain and iface clk
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>, Rob Herring <robh@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-1-e36044bbdfe9@oss.qualcomm.com>
 <873e8ad2-50cd-4c09-9a51-20ad745fe8dc@oss.qualcomm.com>
 <2b71dd68-ff35-411e-905d-3ffa2ea3efe4@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <2b71dd68-ff35-411e-905d-3ffa2ea3efe4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d48f04 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=qoNIJ1LOUDDmZ2oDbzIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: mh264aI_SlZc7r1x4goDRWtHX6CzMDsZ
X-Proofpoint-GUID: mh264aI_SlZc7r1x4goDRWtHX6CzMDsZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0NCBTYWx0ZWRfX0nqZWwWyRAc4
 ICk8XfEadinaItpjw0ckkvXJLd/lO0zYDxIrFAoY+t9yb/5xa7EYKZ4scEeSXY70BqtmGBhnqG6
 uyeSO2PqxHNaBQBkW7AYJ2uJfpxYeB/7m9leI+yG4lNq+deTqQnp9OhZun1y8bVQZ0L89Lkr3V8
 6utztwLG45Te9dO178hMR56LW61uKETz28/Y3aOUyrHLXgCFxm/MpWGyC0fY6rUhgV764QH2vmz
 G4El0Ayu1s9yE5umARlw2uZ3Eo5ol8gRzOzzlaWCqPOQ78MoEk5cN38exSvMYluRx5aiJ4Py3CK
 ZJQi/cB7+Dx+EWvzEUCF19A+asUBnK8enuXz8ml81/D1FtNXVlZ9CDDPceJdR8MVGwhbUV8Yw8w
 kmoazrUZGdRvWqfhmIryrsH4LEapk+b6uLk3rpTiMDocueN9O8huacOlKX9O/Bp7nEmO22X51+X
 FBjYbqfzVnyE8B3TluQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070044

On 3/31/2026 3:10 PM, Harshal Dev wrote:
> Hi Kuldeep,
> 
> On 3/24/2026 4:16 PM, Kuldeep Singh wrote:
>>
>> On 3/23/2026 2:47 PM, Harshal Dev wrote:
>>> The DT bindings for inline-crypto engine do not specify the UFS_PHY_GDSC
>>> power-domain and iface clock. Without enabling the iface clock and the
>>> associated power-domain the ICE hardware cannot function correctly and
>>> leads to unclocked hardware accesses being observed during probe.
>>>
>>> Fix the DT bindings for inline-crypto engine to require the UFS_PHY_GDSC
>>> power-domain and iface clock for new devices (Eliza and Milos) introduced
>>> in the current release (7.0) with yet-to-stabilize ABI, while preserving
>>> backward compatibility for older devices.
>>>
>>> Fixes: 618195a7ac3df ("dt-bindings: crypto: qcom,inline-crypto-engine: Document the Eliza ICE")
>>> Fixes: 85faec1e85555 ("dt-bindings: crypto: qcom,inline-crypto-engine: document the Milos ICE")
>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>> ---
>>>  .../bindings/crypto/qcom,inline-crypto-engine.yaml | 35 +++++++++++++++++++++-
>>>  1 file changed, 34 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>> index 876bf90ed96e..ccb6b8dd8e11 100644
>>> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>> @@ -30,6 +30,16 @@ properties:
>>>      maxItems: 1
>>>  
>>>    clocks:
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +
>>> +  clock-names:
>>> +    minItems: 1
>>> +    items:
>>> +      - const: core
>>> +      - const: iface
>>> +
>>> +  power-domains:
>>>      maxItems: 1
>>>  
>>>    operating-points-v2: true
>>> @@ -44,6 +54,25 @@ required:
>>>  
>>>  additionalProperties: false
>>>  
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - qcom,eliza-inline-crypto-engine
>>> +              - qcom,milos-inline-crypto-engine
>>> +
>>> +    then:
>>> +      required:
>>> +        - power-domains
>>> +        - clock-names
>>> +      properties:
>>> +        clocks:
>>> +          minItems: 2
>>> +        clock-names:
>>> +          minItems: 2
>>> +
>>
>> Hi Krzysztof,
>>
>> As motive here is to enforce 2 clocks for upcoming targets and keep
>> minItems as 1 for already merged ones for ensuring backward
>> compatibility. Can we do like below?
>>
>> allOf:
>>   - if:
>>       not:
>>         properties:
>>           compatible:
>>             contains:
>>               enum:
>>                 - qcom,kaanapali-inline-crypto-engine
>>                 - qcom,qcs8300-inline-crypto-engine
>>                 - qcom,sa8775p-inline-crypto-engine
>>                 - qcom,sc7180-inline-crypto-engine
>>                 - qcom,sc7280-inline-crypto-engine
>>                 - qcom,sm8450-inline-crypto-engine
>>                 - qcom,sm8550-inline-crypto-engine
>>                 - qcom,sm8650-inline-crypto-engine
>>                 - qcom,sm8750-inline-crypto-engine
>>
>>     then:
>>       required:
>>         - power-domains
>>         - clock-names
>>       properties:
>>         clocks:
>>           minItems: 2
>>         clock-names:
>>           minItems: 2
>>
>> This will ensure for every new target addition, default clock count is
>> enforced as 2 default.
>> Please share your thoughts as well.

Hi Rob/Krzysztof,

Were you able to review this suggestion?
Please let me know if need to update patch on top of this one to
initiate discussion.

One advantage i see with suggested approach:
For new target addition, just need to document new compatible string and
no need to update another list everytime.
It's easy to miss adding entry alongside eliza/milos and might make
wrong assumption to authors/dt-checker that 1 clock is still allowed.

>>
> 
> I don't really have any particular objections to this proposal, but I can
> see that other bindings where the need for an additional clock was realized
> later on use a similar pattern as this patchset does:
> https://elixir.bootlin.com/linux/v7.0-rc2/source/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
> 

Sure Harshal, the current is doing what's intended to do.

For that,
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

If not in this patch, maybe we can take this discussion in separate thread.

-- 
Regards
Kuldeep

