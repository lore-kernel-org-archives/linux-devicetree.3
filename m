Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793856760;
	b=Y62Q5Vcnq7FOg4yWbYN90QVmVnsad38bt+3oV7hthlBOs6sVhURqk58J5zAdSfozztHt
	 q0/LnU35UOqtAkBR1eqJWGDtmQLAmJC1KGcRIEzOSYan12DNw2Z98KHgeuZi/FJIyLYGs
	 3C388zRsuNS5RtZroQsJmT/my5Fd7UCWMqAki2GtjvFNXTuz9LYMPMSx5hb2ZHO9WFdFu
	 lZ8+RVkSbqAnwzeDfe8qi8tUMcFawZwZUGN7dyhH9kM6dVYt6Y66qMdfBL4wqOfp03PkS
	 HJjlOD/FgeLzJnunS4L1zjt6qlZhR+Sx6gzlOW4iK6VvJUGlePrbSjY/EwzTJN9ttjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793856760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bW86C95W2VUa3TTtLDIwP6qoN9L9lbkIZbVnklP859U=;
	b=qoWegp4LbA/ChHf2AxwEre/oB60+z2IGGddMk2+ErPkfPDgHwFQ61O/o1jyTj8SQIncp
	 aUcUd9mHKYk6V+0CaC2jp8Ng4y16R1+6mBYkN0Cacg6wJ5KUY9ygqqsdfN9vNIz3dZtuZ
	 0SLOqkq+qTYqGl9bYLBIocKUixJ/nSGawJ4EXR0OJetaQy8Z1Ww2KHFOz1rSIRgZSFVFR
	 9nCKmpcYTT5IaiGbzG7DVec3PranmChuGgvhCgvbDigwduyZpiwSFAPGDk+Y+075vGjpx
	 oq/TXIhBn4FTUOFvh+xzmJQn3NbKktGfaiY5Y+sstXgOhBctie3c8AvVLXGDjCBXqcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ATiem9ng;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kNliE1pm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77C2606A328
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 05:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E77C2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ATiem9ng;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kNliE1pm
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A553b6i378262
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 05:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bW86C95W2VUa3TTtLDIwP6qoN9L9lbkIZbVnklP859U=; b=ATiem9ngPBFH6YEx
	TGjK/0BlMdYHEm/YHjSx8kFRH1vADGx+4lat/4D4RrG/lJCx7Vv6TsB5uIl1ztZY
	vvbYEaovUAyzEncLlZCUgzwYiLrRN8y1CZ3bi+nyha1dyBmLkZAUxg+rVGVBtRpB
	GDK093OwvevmdK1sbO0vgEGi+WMZtSKuLZe28ekdSamKDvTeBghnEquf/LiK07lu
	Jt9rVj4/6XjALxkU+fLGSEvfT2v3A8r9dNOVcKV6v6zG8/8GOFCJAdViI97QhjOG
	3pGfniZiocs2nudTu5Zhs1MdyuelEPZ1jy2Mn8pjp/ZTjIo2WstNWBJfgQkKkKNu
	1TEPxQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq831w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 05:32:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so1368823b3a.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 21:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793856748; x=1794461548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bW86C95W2VUa3TTtLDIwP6qoN9L9lbkIZbVnklP859U=;
        b=kNliE1pmKLwz2WykxnqDvlJMJlzO0eUpA8/xPUmNS59RENLsPDBOu0+ZDg9ltqNVrD
         VVWnIa90/HnXMqNXoxkDDeLLaklAV1iitzu2ZcQOVNMMbSBOxGdnN0JZcr0bHLabKcZ/
         6wV5hGbNVdw1uWfBe4l+TCbJm16ymAnlhaZbHIuUu30jzqePCMPLYbfn649qpb6gJo8f
         q7/cJ+xHaTnp4RYdT1kOFl+sTwSi+VkWi8Vao90Sr/30MHpf6bWBM9bwyWGYEq+QdFbZ
         +bHhTGexU2zFXjb7oPRVwkc48gyAJD02TIn/CXfKvrpDdzUUz95yyzilabl4XBV6C1a2
         M1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793856748; x=1794461548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bW86C95W2VUa3TTtLDIwP6qoN9L9lbkIZbVnklP859U=;
        b=nypGEAMpWfKnwTaxXx9/GjiWNnPhdJJ2TivFpA26LEeogU/60yZkMZ5oeFaS3AyajB
         BbgQ0dSV9sNh7jU3z8fiD9QZaZVf/u9G3SOGs0RwSQZlbhi3x8+npLSRKOg5DYglBHT4
         1GXIy50tN3BdAQ/QOOnnXh9w+0fXcIPiIr3dxx98EWED+PLHVYY3RqwfHoQZ2n0z2qDL
         XRamkVXd7iwZTWmTENlPJbn5O88NdaUcpKp5lVHwc6JRhtaBur3u0KKjRNFuaUjD2VQa
         iBjGsRrqYsGEMbIM9OsNUy+grYtCpksa3sBbUiM0ujCFRMAk0DJ532CT5T6ODZ2hxah8
         Whwg==
X-Forwarded-Encrypted: i=1; AKwUvBy1Q9YDLhTF0ONPyZ+tp9BafyTjpFOBJLfD+pcWrMlVFLftNUcrItluuqKFH9JNyvW+abNwAp34hdb0@vger.kernel.org
X-Gm-Message-State: APuU4Z+LQOwhl0XrYv+ctA3js+wjTRv9fSMYDwPv4cr6xTJHQfBqM6og
	KAFE6HbW07DgvO9Y/Xkv3gQXK3sffJbJEhDQfLW4v5wJ3XgCaGT32aW99NXXNZGqfcCOlrPusA7
	aBW5Nn/8BqQvhD+WQOMyhDvv9QwNHTaBjRdEXZHgk0xiRCRjYb0NXZg6kt0qnhkyz
X-Gm-Gg: AYBFou3MaHwjHKaOiv6vVhZkyi+5LBR6h/bkuY2Ayz4AvACYPosmWic5WNGCv30ifJn
	Qt93ttPCwpgeUnOZT5No6CnM1jMaN+rlWslFNISKtP3pM/krPy9W1ViTUyzTLkUi9s3ovkNGE2v
	kPl3zdDxrmOL4prrkEGTa0Sl26/xXZNZxdYb0SIhMo+p4pAco9Zarr1ULzPtnND4fDgcp83Kk6F
	RD788ge+IrKE+rTUR4iz0qZPUXICZ8LsSymbgHp3phFWdzcgprndUvfCCTe0tSSRXNeQfiQOSEs
	UsmatCsusM6swFjCbAtvytYjACMyedVAeQFIAyXdwCUQFKVD4P9iCDzAJpQMOPcJwZTpa8YuJBi
	9zNt38qkSjaoboH6g+14A7YdmWSzVEA1/fcJhVIraU+ESRvAal+T8ycYpl4rHbwN/mylG3GQzhb
	0=
X-Received: by 2002:a05:6a20:9e4e:b0:3e2:95fb:8d03 with SMTP id adf61e73a8af0-3e928a845f3mr13341117637.69.1793856747821;
        Wed, 04 Nov 2026 21:32:27 -0800 (PST)
X-Received: by 2002:a05:6a20:9e4e:b0:3e2:95fb:8d03 with SMTP id adf61e73a8af0-3e928a845f3mr13341084637.69.1793856747307;
        Wed, 04 Nov 2026 21:32:27 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09b569495sm1577758b3a.37.2026.11.04.21.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 21:32:26 -0800 (PST)
Message-ID: <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 11:02:20 +0530
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
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll>
 <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: D0NtyO3JNBSmhftAUIQ-nD6allDVLtl2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAyMSBTYWx0ZWRfX/WNg+r/5vCDC
 d71mh2dHagheBzzdWztmCtOs8nCR9BWiOakdHUh/G4D2r9u27/D9EzoCTd1XJsf6mWyv6h6Qi/B
 oDhh3yaW8MWJqMdKBMGcT8VJ+72bliw=
X-Proofpoint-ORIG-GUID: D0NtyO3JNBSmhftAUIQ-nD6allDVLtl2
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec14ec cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=iBD9WU1rH6yjH3nr7zsA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAyMSBTYWx0ZWRfX8GXsnSnPuHqM
 b+TPjUFYbIlBXeqoiQlx1s0z+R1/s/OXo/nY0pn3FIkr1GZlirB4fJEFCM3OtqXsE9IlvnOhSGH
 XzbUIKBuT2VMf8ICD+QriD500nrhnAhs8kVOLBm4mpmDcAuioHbxYctWVXZTmA5yiylPCkPvB3r
 O/OAo7LuOYo4xtNW7UHSsNqff+xuDWXohrF+sUeW+iZS4pLZxfdwIHed42+ZvquIH4Gd9GclDlN
 jV93+y3NM+oqTo8a5PNNnhpzHwvSRoDFKrlegWcOt8l5vX/dWpfsaAl4/4+gPGm0VA8i/vDYuz7
 LlN+48LKIP7mgCIjgPw9i1i7WeiXwNQg1qIZq07VbxrF3A5epGG3Ms2hVhWIdyyi0o3GeAA/LAw
 bMekPpu9k/FJ30dA0UFCLlEN5VuKmZSgzwlwgBQ10xBEva/2RwUIRN30KmP8rMJ+ESDGZxnBo2r
 XcIbK1mjSqllvugfpew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050021



On 04-11-2026 21:42, Krzysztof Kozlowski wrote:
>>>> Glymur describes CSI2 PHYs as standalone nodes, but the CAMSS binding
>>>> still models CSIPHY4 as port@3 from the X1E80100 csiphy_res[] layout,
>>>> where entry 3 carried CSIPHY id 4.
>>> You also remove port 2 without explanation.
>>>
>>>
>>>> Describe the hardware connection directly by allowing ports 0, 1 and 4,
>>>> and using port@4 for CSIPHY4.
>>> All this is confusing, why do you introduce gaps? What is the reason?
>>> Your datasheet naming does not matter.
>> Glymur CAMSS has populated inputs for CSIPHY0, CSIPHY1 and CSIPHY4, so I
>> used a sparse pattern for those ports only.
> port@0 is CSIPHY0
> port@1 is CSIPHY1
> port@2 is CSIPHY4
> 
> What is the problem exactly you are solving?
> 

The problem is that CSIPHY4 is connected to CAMSS interface 4, so the
graph should describe it as port@4, not port@2.

The previous port@3 description only worked through the X1E80100 resource
table indirection:

  port@3 -> csiphy_res[3] -> .csiphy.id = 4 -> CSID selects CSIPHY4

New standalone PHY path:
  port@4 -> no csiphy_res[] lookup -> port number is id 4 -> CSID selects CSIPHY4

>> That is confusing for the schema. I will allow the continuous range
>> port@0 through port@4 and keep the example limited to the populated
>> Glymur ports.

-- 
Regards,
Nihal Kumar Gupta

