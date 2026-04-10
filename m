Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966BE31327A
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 05:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775798494; cv=none; b=KodB+km4m0zcFwCBadNoDeCb5i2n2WnS+fFuIR7j33D9VKNKIqNc2OVt24AEyzgL/FF/obq1HsZgGrsNTBNk4AkiNkG8Xw99w5Xsr5x2+Zji80pAY9IsjaLh8Q8CUVgtS6rFe3CWMygAelXpqT5VCzxY6gH+Jz2o5PcjILomFoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775798494; c=relaxed/simple;
	bh=yHvOI2JZgbxhhrS18x0i0G5yfw4r80zSgSr0hfssywE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=L7Bx6SZcEtG4dRVLOfC3+P/gYPN6dHNa9yS1Vr3IX0jmW/OulR4DwpFobjhOOir/WvkAwiVOgpmcbdHW+ncTNcemOOZigMyOd0rgrpmW2Oc5UqQG3RAiJ8OVlWs7NRti6gieH26zR57w3W2KYg7Dpksy7RZ3buuIREGqGr4m6zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EFm/x4IP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XY6QXC7A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EFm/x4IP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XY6QXC7A"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5A4Ba3352902
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 05:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IizYWfGnPeXguJY8VoN9IpzJy4a0fnMYo5oTTGL49d0=; b=EFm/x4IP1CiaFMsX
	dcZCV1zlJ7zw4ZmY4hK8WZwxwuVCDNGucrVuc0mIcwtyT5kxR4I3qSMHsB/e8/9k
	ZOIGrf7sxwAUcseroqYEIhRzMmFkHWMn0j4nO6/ZTaPap3lZlSAH6FmJL46xoz22
	p7K37GA3u90WJTAA0rYyobPwwh06Y25VCkSXYrC+6Pm+EvUisQRCT84NpwgoQXV8
	+yWdUNIR9EhmLk1JLFRsCz67Z/Sb+l6WvFTc/oljFmMsYNjuOk2ioI0rbe019zw0
	VHi0/r65bVSxH06T2bzgSUzolxBW9OZJDfyw5kh3ZdB/+yq1hwRiNPTthUuxWQwB
	7znu2g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1qu178-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 05:21:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24a00d12cso16640165ad.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 22:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775798492; x=1776403292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IizYWfGnPeXguJY8VoN9IpzJy4a0fnMYo5oTTGL49d0=;
        b=XY6QXC7AmXanzf00bclrkBA0S7/OQGpsHCBhnXwwuhAW0J9IUhDAf37Wr1mfroQfE+
         MA69mRU19gEFbGVXvRXEdzenE0mWbkzDYLDcUnAuEtYetdVYddA0wTde1LE6imG0IQUs
         GUfIMzGFn4LkQAKm1+f4s+cn3+dbJ3EghRCDyXDqND4+12tbHe2IILe6/FHj35FDV3y/
         hsPUXXTNk6oO2gEamMjL1lqV2PpcF8Ccd9nYkQkg1GUN4joaFC/rqQQE8iy89d6y3Rbe
         LV+i9FmdEm1HKL5J1kruTI9VJWiF8hMwL5w+ZgzfOqYV7q3Y1Q98lCZf0Y2nFbjl8GM4
         p2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775798492; x=1776403292;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IizYWfGnPeXguJY8VoN9IpzJy4a0fnMYo5oTTGL49d0=;
        b=HkPQVhAPPNh+IqYyD36ABJHrFp3S9prUCA0iO/HdF5/XG27IX5iYJeOyxlF//Sqclz
         W+j0SUT0vIZe7ha3y/ZOt/UASuTiyEtPUdCVOQTUhNLCim/U4JlWsV9ec9n9OgHDupJg
         lW4kFQIxBl/7eVzm5TEAglVO7R9nY4Huq3cWeSJCNKCRSF/7x968Bw1eyyp6SjzaqxMn
         WuhURZugmUh0ZAO5qxJtR3NF2UHLY5horcMrBzwQn1IAnkiWeCfanJc0LjJeFkN/acb2
         z4vIWwCc9K5lzBqQw//Q25HaxvimA9Cj6lZ/QqJtzk1pxZwWVHWi1HGUiDhX/EtZxjQ5
         FA0A==
X-Forwarded-Encrypted: i=1; AJvYcCVubMaG2II43opAMC0V7uDus1kbJiE22I3pkQX0fARXFLn12sOHSQo6PLZ0zLWytbgLQNxvVsGchAO2@vger.kernel.org
X-Gm-Message-State: AOJu0YyidRHT79LRPSqF59CubAfMs80hog8Sr8xbT37I+71VqKgC1fZs
	suD0X5mWDZmMYx+5OMTWEUub0RHYX/v/2rzKFJ8WdjLD7rbARJBD16r0q2ZjWc7OJxtchGr6vJt
	n2dThTtrqwVtLuc8kfb83ElaWKZT7n41+cHq0CVFxYyD5YANQT0rYvLcn2x4kK4al
X-Gm-Gg: AeBDieubduh2u9vjGDtERf7xiIhP/0xYi1PTNkaYiVJyGOC8f4+actjW9Gz6lR395PH
	/GsPR3BnFJLQV8WssfYHIdI1V6g4gU0mm9bgcsU0p1TS/Zm21wFOkYejmDr+0RqwKLlql0MEOun
	uy+m0JVe2XQK4q8XMnz12DIhLWZN/h1W4EWSEIvVPoxZfUm7OwmEn84a3jrazic4ZTKRiogGATY
	MlFXQbRk6xPBSZwJ+HQb3AiX6Cfa0l9kzW/ZKfv7fRMh9crA8r6d+vZjoSlnIjMrm3M5eqJlAzp
	j80TLjW9y7dHkKJhKL3GbyUeimGVC01Hvtb+qCxp6ruynvoiuMvM3zjDgde3S43tjSxhFlrgNGN
	lmc+pMrPZfLtzMY3IR+zxUgocXNQTasMj6Dtb/ns0TT9rvGQyXRUX
X-Received: by 2002:a17:902:a70e:b0:2b2:65db:8c5f with SMTP id d9443c01a7336-2b2d5a1cbfemr13291195ad.27.1775798491276;
        Thu, 09 Apr 2026 22:21:31 -0700 (PDT)
X-Received: by 2002:a17:902:a70e:b0:2b2:65db:8c5f with SMTP id d9443c01a7336-2b2d5a1cbfemr13290865ad.27.1775798490717;
        Thu, 09 Apr 2026 22:21:30 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f469casm13692445ad.81.2026.04.09.22.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 22:21:30 -0700 (PDT)
Message-ID: <a6b18da5-4132-4a76-9a24-80e2978af86f@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 10:51:19 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] dt-bindings: crypto: qcom,ice: Fix missing
 power-domain and iface clk
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
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
 <36b4fead-81fe-4b98-9de5-4d524f199569@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <36b4fead-81fe-4b98-9de5-4d524f199569@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA0NyBTYWx0ZWRfX/QIEmFJWgBUR
 JmIkYxbhkIdsQFW0LRFIqBcRzf0N4wqdjB+s5bsRfSEi8U3gDS6zEG3+TE26q5BUYEaa9GzZHNL
 DVVTKieIe+ozJ9mZlag4IdNVUmlT0C1AQFHqVG273Q3d9aUGh7nhsWhRNssEbI8fJ3Hm6iDHETw
 5v/HbNpREnsMPziCeTj+G7f9u+N3peTU5kEOcwC7j+2FA9uGrFyydXQmnGDOGhBnLIxnGluJBi8
 Uvcg3s0LxhgAORL/Xg1vUoRdA4RlAc+vS1OoRzpHak2htWwdQZaXsLB4LgYjixYfEvTcQJ9dY6e
 5+R/WwLwrNTFHTc34zhmbdml4IS2a2OerJ0JiOk6etCeIRowNW80onL2BJPUYB7JcdVZ33nqZY8
 uPyW03elLlKLpdSRBNeJMcMJeEjav9Nhoodi8K1SuqYZzlSxxdcVtuXsTB3OKdCtzl5Hy1dLidt
 WvchDu9xz3o7Yk3HECg==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d888dc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Z7d3RZfmASx9lX5pdYsA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: jWjBJEGvNiBipk5Pg3EXTz2EyVUpfbQG
X-Proofpoint-ORIG-GUID: jWjBJEGvNiBipk5Pg3EXTz2EyVUpfbQG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100047

On 4/7/2026 10:28 AM, Kuldeep Singh wrote:
>>> Hi Krzysztof,
>>>
>>> As motive here is to enforce 2 clocks for upcoming targets and keep
>>> minItems as 1 for already merged ones for ensuring backward
>>> compatibility. Can we do like below?
>>>
>>> allOf:
>>>   - if:
>>>       not:
>>>         properties:
>>>           compatible:
>>>             contains:
>>>               enum:
>>>                 - qcom,kaanapali-inline-crypto-engine
>>>                 - qcom,qcs8300-inline-crypto-engine
>>>                 - qcom,sa8775p-inline-crypto-engine
>>>                 - qcom,sc7180-inline-crypto-engine
>>>                 - qcom,sc7280-inline-crypto-engine
>>>                 - qcom,sm8450-inline-crypto-engine
>>>                 - qcom,sm8550-inline-crypto-engine
>>>                 - qcom,sm8650-inline-crypto-engine
>>>                 - qcom,sm8750-inline-crypto-engine
>>>
>>>     then:
>>>       required:
>>>         - power-domains
>>>         - clock-names
>>>       properties:
>>>         clocks:
>>>           minItems: 2
>>>         clock-names:
>>>           minItems: 2
>>>
>>> This will ensure for every new target addition, default clock count is
>>> enforced as 2 default.
>>> Please share your thoughts as well.
> 
> Hi Rob/Krzysztof,
> 
> Were you able to review this suggestion?
> Please let me know if need to update patch on top of this one to
> initiate discussion.
> 
> One advantage i see with suggested approach:
> For new target addition, just need to document new compatible string and
> no need to update another list everytime.
> It's easy to miss adding entry alongside eliza/milos and might make
> wrong assumption to authors/dt-checker that 1 clock is still allowed.
> 

Hi Krzysztof/Rob,
Kind reminder!
Could you please share your thoughts.

-- 
Regards
Kuldeep

