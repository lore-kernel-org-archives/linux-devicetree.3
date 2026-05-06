Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABCC3EC2D1
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 10:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778064481; cv=none; b=SvxjGwzbYlS2IYIoWNJ3rpF5c8XN64nV93LZfNRdmFDW+SXsTyuGAt4VdHoHr2KHP7alP8AibwWkLRqRpEXk145cFJ0jIpmBs4D7Y5UJDgSitN7HNHdkyHuNDC3JJglCMJcrknObpz6zF+8YtMkVjR7ByslOLc67ps75Sw0QCqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778064481; c=relaxed/simple;
	bh=UEqhS/gVtOtsoOlkx4tlcpnnBFw46fyozlsFkaRqtwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nlL8gOM/xuNuZOutUvm84B3sRqPLcU0/M8DcZVZz1zPAjcQ0G8/5PBCibP9ChWNN7QiywNnXnhLXyhKrzMSTEj05lBoNAxqZvOBZaIhnlBlKGJiqnpsu0U5sYce+O7okPiTg3CkZuGXTAXCADL1cFgs2h8bb1uNXtHmyh+WcxO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BhtT+LYl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UVL4kfzz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BhtT+LYl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UVL4kfzz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6468ZtTV442974
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 10:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fyr6BndDsbD/gd4UCCwHZ07yKpNDj6vKJfz1NBHwr0c=; b=BhtT+LYlUqoxEnkk
	xnpA6WhgB0YM/ZnqDxSWzhVy7F+iwRRTL7Y1I8kiBpFeQvq0rcvrQE2RKoDzvr2k
	Fx23YlQlf4NNAurBFDTRS7xjbw6N5n0B+tE3qeedn7Axqx2lYY6ODwiyWBYT/xkx
	FEpgcbPDmxMFqnlQ6z6eRLXx9fjAa5+gmnQ5NEkDfKijEvvuBjykSsqPQKjq6hv0
	S9MTxCqVQMuuLfbaGFsP+fvlf9Kf/qb0UXMV5UgoiIsD68seEKTWuaBzH5fxOSi1
	KBIpAUeL26ty1ek03jpIL8J8eU1NKahhis3OwaBK61vZYctRWx1B/3qVlCrm7bJu
	mxiNaw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0299gfmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 10:47:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ecac841eecso124255785a.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 03:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778064477; x=1778669277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fyr6BndDsbD/gd4UCCwHZ07yKpNDj6vKJfz1NBHwr0c=;
        b=UVL4kfzzba/HZxvCMcFTg+w2EycNyu4+ULfQeMFznMyNr/YdjVoW/BrkKdNM9O0mmW
         T/nq02IZX0P0OtLwS3OdI3FpuzWW7aQc+lknk7UZ51Z+6kMugqcEPgHxg+mCq2yeTWJ8
         1HC6NvO+yhtT8aAWcLaPEouTpCn0dGZNTiQ1BrR+QAv28RQZ4I5Dg4KnFBWbs8xPDwry
         dgQrev0hU+9zH34er5v/hTf6F22MOUTZDh6L2r+lNQPqhu5Vv3vypMXewnuZzv6tPlO1
         Lbl1jjtm5UWCRV8wiMWboldIwSdXJemOOwn3Bio17ywNwqXNvGeulMsOdnB30DZyyR/e
         sVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778064477; x=1778669277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fyr6BndDsbD/gd4UCCwHZ07yKpNDj6vKJfz1NBHwr0c=;
        b=J5bjW8PeM9HetbeoqGC6RSnP2emBb/XU47vxEaX6ZAzav5i5yJE48HAXWn1gMqqLNN
         eKCp1SZF/kvxjUDUbzBFvsirtO5AEzxlx1hE7ovV1SwAigNzusWFrr6q6p+MXvfiubPc
         2un5HynVqyMwVnZeGyr8KG+kgiyBAAuzHMCJE+dil1s6H187x1t2FLa71mYzEflLyU25
         k98Dl+IEsrkNQWeQy+zVzojkUo8CgKxo7J8VzIWhGRqLrExXpXe4nZpWL5gOHSXtjfTN
         lrcRPemDaF+kdnQ+rQ1nZ6BhuxLXqwll2ktBehlUE3TqreOL7SdW5EoOZpS6gwMj+ltx
         J1dg==
X-Forwarded-Encrypted: i=1; AFNElJ9jaiJK7YkzOL8RH1rk1BvLY5DmnR2DDy6UmAmixa/oOS1bsmUkV7RkGQABkRj43nwvXYoTFO0pxFYj@vger.kernel.org
X-Gm-Message-State: AOJu0YxWKGP608D3La1RRZ/Yf3NwDuuYBV7/j/hs4A6c650jr9Mvu8rm
	M/MLArsDmjYCPN1FmgSbgRDNoc3Vbb1WDMSAOkK6fvrez/a5AXCcmCNHFOm34bwoAtZTGUiRIob
	1k2zbFJLDIUerJT7p+x4sSXXbBI6OAo/EOa8sQs6y1/9XO8Bo7uJBJMLqv0RUtUE5
X-Gm-Gg: AeBDietic7lmuyJ6Ik+TDoqyJwDLvH/21ZdM9BHrAa/ijZe7P+WNQHCNcIfuGDpXjlW
	N9tKdt9NEHPE0YrYpGDig+FOAjhPBc5FOk3J/jNTxpmGXus3l7Xib12zcX/Hn6K9fI9QPSZ56qx
	UpNPDsnLH5lE2yGnrHWJyeo9YAIVPp17n05CEVZJBYdwuURPUi1631fn3p2vJMiwip7esMUjOY8
	UvKD+84hqhwwUAHDScUbC+JxbT7O3gTyz3K3NQHeFmIB6WnF5zWdyRBpLBXZLe5/MFOCLSz1CLt
	3AxnxxUJSp9v5woLQAtwc5aaRrGY0PDo7u3jDleGrGsjGIm+56QDqfmGlJZg/zeUP6Oau4GJ30V
	aGnLhceL+7MSqUnodVYpCZLKz1Sqg1fhA18mIsMABmzlluGGpuJlZZ9lLsbFBeWlfLn09OfpfiV
	pLJJDNa+yDBwECIg==
X-Received: by 2002:a05:620a:472a:b0:8f1:9e59:2208 with SMTP id af79cd13be357-9051daff561mr168915285a.4.1778064477606;
        Wed, 06 May 2026 03:47:57 -0700 (PDT)
X-Received: by 2002:a05:620a:472a:b0:8f1:9e59:2208 with SMTP id af79cd13be357-9051daff561mr168913385a.4.1778064477181;
        Wed, 06 May 2026 03:47:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd91a486csm1116640a12.17.2026.05.06.03.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 03:47:55 -0700 (PDT)
Message-ID: <486d6b30-8762-4f14-aa19-7c5497cba00f@oss.qualcomm.com>
Date: Wed, 6 May 2026 12:47:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Document Eliza LLCC
 block
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
 <20260504-eliza-llcc-v1-1-d7006c899812@oss.qualcomm.com>
 <20260506-imported-emerald-quoll-fd1ef8@quoll>
 <0028dd41-d039-4ef5-a9f7-deb730a05b0b@oss.qualcomm.com>
 <319fc5ac-1211-4845-9a66-79f1a3026126@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <319fc5ac-1211-4845-9a66-79f1a3026126@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fMMJG5ae c=1 sm=1 tr=0 ts=69fb1c5e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=u3ptBUEvLvOtx8rFk0cA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: jNDCWvVGYRVYv-nfa4b7f2NmAEd2KTIT
X-Proofpoint-GUID: jNDCWvVGYRVYv-nfa4b7f2NmAEd2KTIT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDEwNCBTYWx0ZWRfX+yCJabuBrcCO
 K3TB2DYgh/iOURDe1MqWe9XDjkNmB7AnaMSm9pZzQ4yv5tzxBd8nHAcVSai14vc7FlLOORd3aJl
 8ZN8PvewyAMvT29x/+H9wgdPm/OHq+72rDWJYVcybBzGS+Ms+SCMUWdlu8CEzyuACHV30ABW2pT
 /w3KJ1xg2zNbIamAvlmtgLbYNbTHZHuCfspwA/8NZkW7FstgZB9v0XiH04QXJLviQB1t3u/Wj7e
 dK88Vy39teV7JDGe/Q44rQOKD5p1WTYRrNOSqG5VUzTToibJ3jj33gsPfwWAXPQf5uGueFG8DjR
 9Im6EoLY66SJ1Bs6hvNhJzLwGfVFz7pVw3QddDHfrmtBf+l2JD3mBLF4qHm9YLtK8FFDkQF9pox
 5bvMlSBQZzyTSGy1I993yTt9PxXvMBZmEWrj7Ow0MuCvF4DMyZSXkL48vGSTn+TU5IWaRf2wHEV
 tjSdOCXSZxrhqV923mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060104

On 5/6/26 11:56 AM, Krzysztof Kozlowski wrote:
> On 06/05/2026 10:49, Konrad Dybcio wrote:
>> On 5/6/26 10:25 AM, Krzysztof Kozlowski wrote:
>>> On Mon, May 04, 2026 at 01:00:07PM +0300, Abel Vesa wrote:
>>>> Document the Last Level Cache Controller on Eliza SoC. Eliza LLCC has 2
>>>> base register regions and an additional AND, OR broadcast region, total 4
>>>> register regions.
>>>>
>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>> ---
>>>>  .../devicetree/bindings/cache/qcom,llcc.yaml       | 22 ++++++++++++++++++++++
>>>>  1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>>>> index 995d57815781..90f5a54b76e3 100644
>>>> --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>>>> +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>>>> @@ -20,6 +20,7 @@ description: |
>>>>  properties:
>>>>    compatible:
>>>>      enum:
>>>> +      - qcom,eliza-llcc
>>>>        - qcom,glymur-llcc
>>>>        - qcom,ipq5424-llcc
>>>>        - qcom,kaanapali-llcc
>>>> @@ -341,6 +342,27 @@ allOf:
>>>>              - const: llcc_broadcast_base
>>>>              - const: llcc_broadcast_and_base
>>>>  
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>> +              - qcom,eliza-llcc
>>>> +    then:
>>>> +      properties:
>>>> +        reg:
>>>> +          items:
>>>> +            - description: LLCC0 base register region
>>>> +            - description: LLCC2 base register region
>>>
>>> LLCC1?
>>
>> Unfortunately not
> 
> Then let's just skip the names, because it will cause unnecessary
> confusion when name is llcc1 (since it is the NEXT entry) but it points
> to block called LLCC2 in the manual.

I don't think skipping the names is a good idea, especially since if
we keep them, we could teach the driver what channel the region actually
corresponds to

Konrad
