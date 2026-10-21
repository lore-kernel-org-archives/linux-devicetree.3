Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583274;
	b=nht0TkxbrSQvbjtUM6kdY/9XWqkPNYfsA4WdpupDz+h++FMDn49x6nG6DIUbwjIqYC8m
	 jlERKerZzC2YJJw376Fr+193l4Q/yd5eRzlDPvK8llxOiSZHMJjMCQ7dYghVcjCZQWL8L
	 1VViX0mm2TX8hqoxa84xtCIIkS5+j6lBfi4Q2SMgdjyauVmvHcFcclyOQHg1R3g6PjSrZ
	 DNgCc8P+HG3R+3jLrGazOMpcZcx6AJBkpRevXy/zztuFG+0aUQ0fYz8CvW6FqDLn65/yC
	 c6WDdbyOW8yzEwIm1v5xwj9iU79/VjCUygqf5rtiZW3JKpe+Tqs05qtt+fQAQqw0lSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NDUHLGZMzCPAMAt4zW3HlLbP5RBvEtH50ODDFpz13Xw=;
	b=mpJjOG2pTrEzSARaGKizMjk/fu+sYE1zJfYUwFD+UuxYxGvtUFqUiYi823oHpPrum2NV
	 Gs9uni06Hq+QOrArGJ5MOXhDsSg7g51vPPlgfweJnrun7RqHS1+do1a1+B0axu1O5w9Ld
	 CT0bea/VlhEVZ6AubgJxjNvGWOaTJEctznaUB9cjk4rvlpHISM88Kn8w9kboOhUJj8ZWi
	 f3eJpHhllT5j+FGaDFXvcMX6d2AjxrPWqBpIue8PVTz2lfBQUpFk1NG05c/LwMFcXiBTi
	 ImSob/8TIm3FeLASOstwSZXSabk05RA8+o97oOUDOkI1vEnnTSZCMMg+BOIn0Agk6jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dpBblJDH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyZZd7Ka;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD2360A380D
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCD2360A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dpBblJDH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyZZd7Ka
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgD7O1568463
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NDUHLGZMzCPAMAt4zW3HlLbP5RBvEtH50ODDFpz13Xw=; b=dpBblJDHv2bW3nLQ
	Zu/Sjh2kCnB22dralm5jpvyh8VkOvoxtAi6eHhdS/MF7Kl5ZalmHQX5eG2PAsxuz
	E/2lYLUasH26gDSn8ezyy8Tc+bQAVlQOfURbguepNhe+xZEKcS3dteS3pVilOj4t
	pDC2jWq7pkY5rmH4qGXyP2hinv3VXFXINGiTIAjNaQzIhq+dn1nj3RYV6TgYvCC4
	LQyLO30wYeCTXsyrWO67PIlJggjoeBQZwSW+kp5y3OxauqCN/Kt5xz/VgB79iQ8o
	US7/I+AHwstF7FS87xYn9NnzV6fQ8EoeKHQColiMafVsrkkqZf4XgvdDm4CaNLG7
	MiYTQQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4uqgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:47:52 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1203256eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 04:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792583272; x=1793188072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDUHLGZMzCPAMAt4zW3HlLbP5RBvEtH50ODDFpz13Xw=;
        b=UyZZd7KalNZdjkocZdXb3PkRCzwUlrJqRrUGVAu0q7jX4lfAbMgHcFzkORP1zHiMud
         DC3fozXs+eIs0mG8l9AtfJSy3OGnUpH+eVfwsJXnbIsr1MXvKJD89gQwmf6XGucjY/+n
         eGZTHzmZiXYGeqkW5h9oEvybU70WRq7jSNbX/HBa1QYuyh3akyoFFys7OHJsSHVdFuSv
         mnsAe6/nFcHwi1X9cXXJKbwUSPdG3H0vSdG4cLwZeB9W+UkYvVSaZnnuCPyEqPL/7Fee
         8Ol0CPqo9cBgzdkbpf4xb23pFrbYN8ecKfC93aNdtZVxOcjGFF8h9vHw296ecnVNzAyX
         G0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583272; x=1793188072;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NDUHLGZMzCPAMAt4zW3HlLbP5RBvEtH50ODDFpz13Xw=;
        b=OiO+QoqVGL4BO8te/lsZhRcugiUOtRuuUn+3Wu/R4vzVHQeUfdWDuo54jzFmwj9XPG
         /HBNn7S5CHU0DTuNaI1TUtX/1bqOsLI/J0h86RxVCKZn7Vm2+Zgt9ZMIfDZcm3Um0gJa
         9u4FXgQzmq7t5FpXtNa3Dul1RUs4CBXoylTehz7ivMPpDTSRCOuuDOax0KM+gkxqotTj
         6HyHQ/u7w5iHWVeVj5wGQf2Ha5UxIlX7Y2a0mhn8/LKg+++VfNiOXK/Sg1z21R3hwE9g
         Wd7wB6Fj83zkvFn60CWAdpUQy3kQognXkJvFiMYwCuxzutiC0Bs04VXTVECj9iJUS2VO
         K0sQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH2pCILtcoaLObOp4uXPY56nLfxZRHfv92DJTA7o7lGltnapnohy0Ll52PnZ9pTJWI6pqZvaDn2bo1@vger.kernel.org
X-Gm-Message-State: AFq9FYLl0dw9PxyNLzU9jyEJZLs2Ll3zXy72TDRDd9dfnZx5IEzpC3tB
	KMgnxzfkCjVIrT3MCseyei3XQLgDXVzSf5/bSG65t2S4LAheO8CKGJtHPjrK1jzq5ntkFI5MrBu
	KBizC7RZYhoBzF9IWM94fsnow5ncOYfrrQxjbWWOWZWseS02gul2Gc0m7gTepDg7F
X-Gm-Gg: AYBFou19ju8jwfjbhoWz/xrMOeXyyYQo5qPBj4a3LZP1YpyAmB4UjlFwLvM+w2Yj+Ox
	GBE3izMAFmzgLURZDKCF85mCBpz1hdIdBHHumJXfV+zIbZ9lUNUpuYm3nkyv2fq06VFXFSuafZu
	ehFaJTtz+5b1BwNiW3G6f0ol4va85UDE6d864qARAQACeilA3VSQ6WME3GAtdPCAu7Hfx3nWCUn
	NbtF6IqDdmTZqt4Bh4AnkWDXtZnghSt5I6DTjG4UTQAQh8gNf8P2CtcvfQone0MBbO3FSIjyRMy
	mY9JwRUlNPccT84JjI8svvLjSsixDTtjS/dV4xJjwyvYR6uM4YUagpXcg5ykML6SopoA/AxQ+gU
	RrvGA86JRm/K3FOQLn2XHCxxDZRqj3zSzhQ==
X-Received: by 2002:a05:693c:41ca:b0:35e:5ca:e0df with SMTP id 5a478bee46e88-3674eb34d50mr2703873eec.35.1792583272171;
        Wed, 21 Oct 2026 04:47:52 -0700 (PDT)
X-Received: by 2002:a05:693c:41ca:b0:35e:5ca:e0df with SMTP id 5a478bee46e88-3674eb34d50mr2703832eec.35.1792583271578;
        Wed, 21 Oct 2026 04:47:51 -0700 (PDT)
Received: from [10.217.240.81] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673b1d0ab7sm7077539eec.0.2026.10.21.04.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:47:51 -0700 (PDT)
Message-ID: <162c8c6d-800b-46f5-92e4-3a5501ff9d12@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:17:44 +0530
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
Subject: Re: [PATCH 1/4] dt-bindings: cache: qcom,llcc: allow optional second
 interrupt for LCP/SRP ECC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
 <20261014-master-v1-1-aba3cfcfbac9@oss.qualcomm.com>
 <20261017-shaggy-funny-pogona-69fe36@quoll>
Content-Language: en-US
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
In-Reply-To: <20261017-shaggy-funny-pogona-69fe36@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uv2ACKebW11iXEcVfGMGd0wrUOLxuA7E
X-Proofpoint-GUID: uv2ACKebW11iXEcVfGMGd0wrUOLxuA7E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfXyxCN0Wi30WSh
 6AQ+N3ZO4y/yaUB/HgpxnQdk4nbFgfiN1WRpjXXkL5QZ8BNMVMiFEY9wk8lQbqVsVISQl3w2kDj
 +b5kpYhYK4TbRvbPTCBx49K/kRTAMYY=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad8a668 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=79Y9q3_J_5CQFoj6QLUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX3a5Ph4FEvIQE
 c4uyJobUa5CXdKBOQmbUo5IFfCYWZU+2323a/Uj+gZ6vWK/gqOR9Z22bhJhGmbeHBFG4FnHYbeS
 /YbUQLWj6dF9f0HddbLfBXArrG7FmcZ81yNPy0tMI12Q6trryAqr5IoN2aP6BMW5JJLjeKa/ZYC
 M1bk2ZaKxD+lNKAE5UheaIXaLUpRWTDhC1jtarK9qiwfyk5voupx/H3xmvCS11eQOwceYK9dNat
 4OVXeqnEHRjRFDOO6q5Yo5D/pEeb4d0bef85IqCkI6zouYM1T0JSOuvVjxEllxuyI4d6yvxwNWf
 3MRz7OpVSHO1pKE8FBycZmQq780AmQDAQiaWUoXsDpxs1T+2Cq4dsbLfFhL8/KYRptIf2dbaR1l
 vjSCEstsqSZKiucv7vXjGdbPKklmqipgJ6afa5PdF1bA4VYIvNZ9FPX3qDIX4bl2lF9JTUthG+2
 XdGhmNr5otOjwkg5BZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210046



On 17-10-2026 22:04, Krzysztof Kozlowski wrote:
> On Wed, Oct 14, 2026 at 09:26:16PM +0530, Faiyaz Mohammed wrote:
>> QCM2390 (Shikra) has an LCP/SRP block that signals DDR DRAM ECC errors
>> on a dedicated interrupt line separate from the existing TRP/DRP cache
>> ECC interrupt.
>>
>> Allow an optional second interrupt in the LLCC binding, add
>> interrupt-names with "llcc-ecc" and "llcc-lcp-ecc", and enforce both
>> are present when compatible is qcom,shikra-llcc.
>>
>> Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/cache/qcom,llcc.yaml       | 26 +++++++++++++++++++++-
>>  1 file changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> index 2141e5d4de63..3546cf7c2519 100644
>> --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> @@ -64,7 +64,17 @@ properties:
>>      maxItems: 18
>>  
>>    interrupts:
>> -    maxItems: 1
>> +    minItems: 1
>> +    items:
>> +      - description: TRP/DRP LLCC cache ECC (ddrss_apps_interrupt[2])
>> +      - description: LCP/SRP DDR DRAM ECC (ddrss_apps_interrupt[1]), present
>> +          on platforms with an LCP/SRP block such as QCM2390
>> +
>> +  interrupt-names:
>> +    minItems: 1
>> +    items:
>> +      - const: llcc-ecc
> 
> ecc
> 
>> +      - const: llcc-lcp-ecc
> 
> lcp
> 

Done — renamed to "ecc" and "lcp" in both the binding and the Shikra
DTS node. Also addressing the Sashiko finding in the same patch: added
an else clause restoring maxItems: 1 for all non-Shikra platforms.
>>  
>>    memory-region:
>>      maxItems: 1
>> @@ -234,6 +244,20 @@ allOf:
>>              - const: llcc1_base
>>              - const: llcc_broadcast_base
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,shikra-llcc
>> +    then:
>> +      properties:
>> +        interrupts:
>> +          minItems: 2
>> +        interrupt-names:
>> +          minItems: 2
>> +      required:
>> +        - interrupt-names
> 
> Please address other comments/emails.
> 
Done.

> Best regards,
> Krzysztof

Thanks & regards,
Mohammed Faiyaz
