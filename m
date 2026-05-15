Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F64C495526
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778858920; cv=none; b=WaB3KQVODgYTJ8+xfVgpuHybcN6jrgqwTqT/LIelBWXzZQzJBwxQ0axyhpKpZLTkiUsLOkKfhORC+cXBNV7uyk9RpcPvJMaGRwpxJl1vCWf1aD8IeyP0gRHXsSAEfPltJvpqcOtATpe4uFwYcZDNfvh7uIiyrNlvOTo0VGrUR5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778858920; c=relaxed/simple;
	bh=rc3/KQHbD7iPq+RAzZOqNKPnZqPEf5/8Mos0tvVnP5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G0A7AkNwqKXmbW80kuvsNy6MwYZF9zFi4nS9sWsWfo0c0dJiW6/aL0MoYNtllWT3IITvTIKiK91hjL0hRycXDu/eu/lHzOB+0s9WWO5sKtnn55dD1i829K0nnb74RCu6ehofr6J2xhq6VTvAgz/QnzX/Qwbgl1xBmYXIxMP+iVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c9kRNYmB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3F6fvIZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c9kRNYmB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3F6fvIZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBeCaO3797495
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yBktAiJ2n07zR7RbDMF1ANnkKUO8hFQpm7YthU0eIUU=; b=c9kRNYmBGZKoL+XI
	isAGNqehczL0RMyfEb4Tbcj4gpmN4O94rcKAM2rtC3bbCccsaQcouXz6PNzKyvVh
	BsUvQRgAFkzsk4P6mtENc0OmiHELEiN57g65kaIRBvWw4IHHpvOhRd7aTcdfvCo+
	Ot2TLDbZQwB9GKp/Ha5TWY2QnWvYo7MGJ/BO3A0MqzeUgEGOKjba6CJkMFaf43HG
	7BTGQJm54l707h6oYErYK/j4yY6FlWGLNQJ8OsafxWWPMrXvuHVQ/k+4JrYP3GXk
	kb9LcgMtKpay9aGTiKxHjUtppk92NEX5ayohUTTgEWQ/DeSZWCr2FbpZDdGMZ8ti
	BCAAag==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1sus9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:28:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8279604464so7566915a12.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778858917; x=1779463717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yBktAiJ2n07zR7RbDMF1ANnkKUO8hFQpm7YthU0eIUU=;
        b=a3F6fvIZveEiDAeC0I/0xtDhA6KKUKiep8YoRBpYIeirrbOn0jbFownuCf+aTnFple
         GiRlYHc1Rn2brWpFDCU0MdZcN9TpYvyfMz9ETAOcrKXHln8c6wiz5NnCQPn5acAFLbtf
         XxZ5hdNurdlrvtAlxpUhTF+wrLh3kWjYOVRxr5pjP4U8ubA0E1cYbnoErmmUBU0+q5kb
         ZX/jRe6OMNX8zCngtLnqC9+ficjzVvfYK+Cnvqo1AXS/8W/q8kfS4w0ZHIFgsLdqAgIg
         QTBjwV/uBaobd5VqH46/AmK/u40cQQkXalZTyC6E4zdkZd1yvExzFAlM9ZtQuAep6kG+
         ZffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778858917; x=1779463717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBktAiJ2n07zR7RbDMF1ANnkKUO8hFQpm7YthU0eIUU=;
        b=MWvJ3O8b7ajgyljW3DmP4AnMoaL6Dizn1xOdI5L1xZkE7MjfHbNuAA6ZWmJAgQFz2w
         lWlSa1dzAbJxLdzrRcL/QUteXZndLijt4qo0/TNfqy7LdrIIO5519xDgOy/wbe4f35jq
         6Bzh3pRFp0ECnDJ5KWgvpXIZnO+E3RDD1tMOkby31J1QCmnIMiXY+pia/sH0aLS5c7vm
         8k8wM453c95bVBcreLATT5c6f7VkBrjeVzTwQEGul42/jNwntWV77xGFl0E0G+DPlBrV
         5I4AyHEd9YaAmX+BRGF/6wXD7TGZWMl5SA+bj6wwsg71aSx5EASPV4G12QLyxUQYbmwA
         6GhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TlCaDKoje6wF0zdoOFpnyle0Z4oW13HpJNXqz6K+ucmVqUCj16sZKPj2qeIvG+kEYZxxocVUNQ6pi@vger.kernel.org
X-Gm-Message-State: AOJu0YxSEX67nYFU95xnyIZc4W5hUihpXyATbb7jKH9Rr9ISuQT0Om1S
	ytscme0+ktMmZIFbyapc8hv1dxRdDcp9OvfaXYubdzHF+rYpQpO/wrTOAE0LQIFVzNntisJdyu4
	5EFsYzuegZPSd9vc3Plicj1Js5AtZdY9qtxndbFIoKpk4zc93nAjd5CAFULS1tYGl
X-Gm-Gg: Acq92OFLPNso2Tct5xp0C8lEwbUeeLgtakF8oNlbf/3RSC6UM48NZhzfWfP0RY7CXk1
	yd6ufABdktDoqi/JlApBZBxlwvYIEE6Wg3hZMffq9fUEJb1PUQkS2iEPc6VZWKGEiIx5CtiUFAX
	eUwIm3U/3Iu6g4bU2PnDpFj2tPanVt46jFGBcsQNm2UEt0bRFbyOs7sRgDMgiDXO8qp3KJB7/qQ
	Z3jKjB6IRrV/+G1Da5SitHp8w8Q7//i5knG6Kcgleq24zjLoP3t8HJepNGb4DteRQXQgIyHf5Nx
	EP4cg4d6Hs31gLCpwprBJNK+yaGyHlg6hAfC27Jnm03F+uz7FL7EYTM+YxMHl5YnqLplLAPMyqN
	RXFpZ3LpLaHz5e7wPL+mQtkRypviRjwwTGM4OfuNxQsiyFG1fjSb7az6GlVm3zcEva7zm6AxsZI
	0sIw==
X-Received: by 2002:a05:6a20:2454:b0:3a3:addc:8f47 with SMTP id adf61e73a8af0-3b22ec64553mr5222446637.42.1778858917397;
        Fri, 15 May 2026 08:28:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:2454:b0:3a3:addc:8f47 with SMTP id adf61e73a8af0-3b22ec64553mr5222414637.42.1778858916923;
        Fri, 15 May 2026 08:28:36 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.84.236])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb123986sm6209094a12.32.2026.05.15.08.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 08:28:36 -0700 (PDT)
Message-ID: <cb78b09f-e3b9-40b7-84a5-8f9217f4fa6f@oss.qualcomm.com>
Date: Fri, 15 May 2026 20:58:30 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm-smmu: qcom: Add compatible for IPQ9650
 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260512-ipq9650_smmu_binding-v1-1-04defdaa140c@oss.qualcomm.com>
 <b8f02a31-b175-4dc2-9b2a-5765774b4d88@oss.qualcomm.com>
 <39588541-b6f8-4697-9787-4b42df21156b@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <39588541-b6f8-4697-9787-4b42df21156b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE1NyBTYWx0ZWRfX+tURtQtB/Qa7
 BpesVjh3F9ly4ZWNMn+Pybwomeulc3il2ODjPP1DsAiULcglcNXuqkcJd+vEH+fxiNl/k10RmUk
 Wt538JLMOcIeqB9ZJMVBMo+S98ogrSnKupMr8MZkY6lGgxQ5u8gkZxkr35TEvBvo34BjeJJcMg2
 kR12AxoyllgEzuyJT4X5TsJPdPcacgKUiKevWz2I93YD1YkzTYSZKeaYIkv7dwuiikFx+SqjX1E
 K8Ea0/OhjSobMkH1vvd3AVb5obJsb2Q1+DkLHT1y7do7s9kTRN63Kai/91Ha2F2gfDUOeQHzksk
 VYcYCuD0SI/KBar4djs0uQVWOd96Dsx7cGLoJIJOYGPf4phsWqMpxazGzXbkgJCLzEyNS8Yi/43
 hSznJqzoyeWVgx9uq7+uyTA1fXBTSMJwy2jz5c6tQxCXurl0JkypwnpRq+eR4FD0ju1Qj0ctIqZ
 c2hNqhM1oq+aD+WJ6GA==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a073ba6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=pcck7Iv2+kD8UxzcD71x3w==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=skYpixVSqG8Zg7K71KQA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: TZ0zUBSvWituywmEz7HqCukHdhXM6eL1
X-Proofpoint-ORIG-GUID: TZ0zUBSvWituywmEz7HqCukHdhXM6eL1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150157


On 5/15/2026 8:46 PM, Krzysztof Kozlowski wrote:
> On 15/05/2026 15:30, Kathiravan Thirumoorthy wrote:
>> On 5/12/2026 12:17 PM, Kathiravan Thirumoorthy wrote:
>>> Qualcomm IPQ9650 SoC include APPS SMMU that implements arm,mmu-500.
>>> Document the compatible for the same.
>> Kindly ignore this patch. I will repost along with DTSI changes once it
>> is validated again!
> Preemptively, I dropped all your patches from Patchwork based on earlier
> comments. Now I have proof that I should be doing that for future as
> well. :/

I understand your frustration. Apologies for that. Please note that, I 
have validated all the changes before posting.

In this case, when I was cross checking the HW doc for some other 
details and I noticed that SMMU interrupts are changed and HW folks 
haven't notified us. Hence I wanted to re-validate the change and post 
it. I don't want to change the binding (if any such case arises), hence 
requested to drop this patch. Hope this helps.

>
> Best regards,
> Krzysztof
