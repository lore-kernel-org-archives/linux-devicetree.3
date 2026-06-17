Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C6D494A0C
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 16:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781713263; cv=none; b=lxhEvnkJarOzSViR/iPTMefsjlCoU6JCH12J2QBtqNn6Yr/HBuB8ZjjEzo10P2+9pF3Sqcklm47JHRri80tibdILneIkXFz6VoAnQa1LB2jpcX5SzeCp0g90Ts+l70T+wPv5JKJmW8SO1lvpPWzG/9z0f31S9rqcu8vddBMogus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781713263; c=relaxed/simple;
	bh=mQL3uNLDtBiRA6dMV1diarsQjL8zJFnVODKJvmajvLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHiOrPrfphwLq7XDUidvI7mN93j1iojb04i2YY4cZUbZyVHxLaAVONVg3bAtv+m35rTBnyMF4Rw17yXkKh+VJ+vOXOV3/+8aRcxlabW46WNe9RaX7Uo+GkvMdU0JkfEIA5AeOTpOXzzTQHdVEdAqu0btLmep8V2xjacK0Ao/4Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f0pnPqch; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GShwZnJU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f0pnPqch";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GShwZnJU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFpWXE3284324
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 16:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	losT85IqK/EGuwOmznCnocjfeG/q92lYBlNczhHDlvs=; b=f0pnPqchVoogz6/I
	7qY7Zy0N0sPnMYAGbR3Ni/JchJirqBjSIf0FEFAGrYXGHNjJDUNQRXY0O3dxxlhQ
	D9z2LPFkwQ75jW7TKH7X/a4KRNXTk21TLCie/tBmkJje5mJ3rh5h+M+DcdSHQF7A
	GWW7VIoEFiwWZmNkOh2Ac6+PTZUCyartF6XC6T2WyDcCihAFjk/0X1hFnV3lG1jw
	vzQuTOws47CjxLE6DjewKykJIS0BM+YLdvWiQCRvgceZZFIuzESEqck+e6T6a5Qt
	m3DViBp3zGi6TpHjVU4DD06jY6agaXMxoPFb55efKjd6inBTF/fmZtNcvqrJGXCC
	5z+5HA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevm81d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 16:20:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85c530ddebso4318a12.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 09:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781713257; x=1782318057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=losT85IqK/EGuwOmznCnocjfeG/q92lYBlNczhHDlvs=;
        b=GShwZnJUeDLeA88zjmIPzVyp+JiiofRRx654PqlNWbkF+jK6kdGZNfnj2wbY3aFFMA
         B1tmToa4d59VYAnSwd+5PkcQcqKq1iG0ChYfCo4Pog7O+lwH5HCr3bzHvTwycLod48U6
         WvvPaCrQWDUcwhaqiyt+6l/XzzvzD9OAjmufRA+G6sGcQMND1TwRRJoRfrzuZZCO7dxC
         reZCjzemDhoydydiWMfuUlyS2IG17wwUP6CvlmO3v4s9Cey/wviXm/lS4tXZMW8DNXB5
         J4AGwAWupr8Xo4U/LprjOjQlLjz0iO2BSyqK84BnbNggofb55II46wlleAESbRjXg9Qn
         LEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781713257; x=1782318057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=losT85IqK/EGuwOmznCnocjfeG/q92lYBlNczhHDlvs=;
        b=gr6NN2WPca4cg4dj9DC3MGMClvEh/5Pheb12b67CCpD5Zf3Yqis7ctKDY0vt7dko6u
         5+KKg7jpShr+vzaRMSEyk6b/hQbvM/9yOdj01sF/Apx8xBOkTOylYpHXqavWerLA+CZp
         zjyPXabw3loD3xAVMc47IVsIjEMRS/p3IUcUGvbfe/p7M0lQZlkULG8dZ/FCp5E8Voyn
         Z52C3zeCANJry34eWjknLO9reu5l1dRm11w2Ct9A6XlflPj5Q6KS73bBYHjM6EMQIh+2
         4w8ZT4HNVHzNvytU24o2/KoAiIW+yY8+3btD0zjwy1u3HdNQYUBUzI4d0NaXnaRt0Qif
         3I3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9wbdQCXY0iCYh5EiRmDGFhnkynP0B5xBUxpt5CV1jsqJ5rgyRXIvWsJ/Pm0rjGJpbQ2/A35ffcmfZU@vger.kernel.org
X-Gm-Message-State: AOJu0YyMhMsrBr5N5Wr2q39rJ6rNmWeDWkycQwIE2VMfP5XTjHDOtZ1m
	DFRntdNyS8alW5ynLl33p0rHi2W93bC9mqHUjDBTpEzQo9cO8DIGWtqIKQaacB5pZTp/SEomFXv
	IBZf0e6/r7h1WLCjZzGTavpY+dBIi+UaA+0W4bHGZHNU+/OVoWFbsisQlBcTkRj9P
X-Gm-Gg: Acq92OHTNXyfdfw6YqxhK502d9xOBHnb4YawBabFAzEhN3SnQuGmRZqCLIy7Mi6fkap
	Qjnn3sEv1uh8ssNC1CbBxX0t7hnXaH7hIKA/9U9l1S3MjskS3pCpHLU9sIfclAdpvYu1aUo5m+r
	g+6fm7mjzXm0/XkP2nZ5yuO52cU2QN+SHBcB0FNoyuZZezV1aWXv2C8qt5voKSFGBaGeNPflaW0
	khj2Mz58m+vda4HhIrTeMeuiis2IA6TR6LgRM5aVqYqGIC8m0JoJpTvzvTTHGM/29kDU7BpDcIP
	+AjE6hhtYWWnXdLxyDQmoQ8F7fzAZ/RuncIM9ne30tAnq3jZPMnhAr0bh2pZNmei49m76uhRt/6
	JjLmhKHTYfKzCaTHljSkvnCMolSppqQA0Rv5zpcM=
X-Received: by 2002:a05:6a20:c79a:b0:3aa:c93b:6266 with SMTP id adf61e73a8af0-3b8b64824a0mr5231209637.19.1781713256372;
        Wed, 17 Jun 2026 09:20:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:c79a:b0:3aa:c93b:6266 with SMTP id adf61e73a8af0-3b8b64824a0mr5231159637.19.1781713255883;
        Wed, 17 Jun 2026 09:20:55 -0700 (PDT)
Received: from [10.219.57.228] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661b5b207sm15074358a12.5.2026.06.17.09.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 09:20:55 -0700 (PDT)
Message-ID: <1bf2708a-bd2a-46a9-97ea-8c1ad96e7ac3@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 21:50:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-3-2a6d8ca30d63@oss.qualcomm.com>
 <p4xnrkcpbufkkbv4kq5civbt6hiwv3warrz7jiyinsfkihfedh@jfa7sgyzot6j>
 <26d51cbb-2d87-4564-b3c6-cc61ab900e19@oss.qualcomm.com>
 <zhdacu4upv5kyvyqx5hcm6im4p7r3z5bsnup7hqu2okxyxmeib@snpseurpvhtc>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <zhdacu4upv5kyvyqx5hcm6im4p7r3z5bsnup7hqu2okxyxmeib@snpseurpvhtc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE1NiBTYWx0ZWRfXzrm574CGjjN8
 uYgWq3rlC1J8FXKmsQNgWD6Hmef6yBoLTbQjVShr1XX/isbcgftLAC70+z+1OOlYKTr3ZK2LRkK
 lViEaM335/jx+mnDvpEWIoxVjd+F7dwLfp0Eqg1AiLwHN/jgbnm5jJkyZQEnW2ORykKcgapbLen
 BjpeD9/0gxayXT5EVgh6ERVzqxI+rHBlG2tSmB+6jPf86UTzdpJMmtCtw0YAkntFkQc85SCFhVY
 lAaWYVt5onraX1/EBMWWYDMHm9diW2nfTQcLP/Z094zz4rH7a+MLAePDkEYVT4GCDn2d/8xb88i
 uD2o278vD0J18s9nvMN3Y91pRycEcWTT8R1IEz7Zi6pknVnNGjiebraPDTRb1OVBSj3QfQxOSE/
 R+u5fRFFKn6BDoVIg1k44pRmA0Rc/8X6uOAJ/GOMTLPLlvId+Bes6XLakdcOUF6KCtlkyE9YBpQ
 CZzr8vXe4jWgIwn03lw==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a32c969 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Rg3GaRgnNXoUDx2UCPMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 9iJxd9ojePIp0ppEkze_x8ngWg3eN_o7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE1NiBTYWx0ZWRfXx1atMduOwQFI
 veIjMOGeLWkme3OBq6Iqa2NKBy5xgHnI3IrOFnLTYn1DWy1sj1k0rhFXhT03ERll8I+5ki39qZh
 SbqgK4RIzpTM5FAmj2hEhvOWMyOnQtU=
X-Proofpoint-ORIG-GUID: 9iJxd9ojePIp0ppEkze_x8ngWg3eN_o7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170156



On 6/16/2026 5:49 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 08, 2026 at 08:07:07PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 6/8/2026 7:27 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 26, 2026 at 08:12:04PM +0530, Bibek Kumar Patro wrote:
>>>> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
>>>> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
>>>> are accessible. Without this vote, the SMMU may become unreachable,
>>>> leading to intermittent probe failures and runtime issues.
>>>>
>>>> Add the required interconnect to ensure reliable register access.
>>>
>>> Does it only concern the GPU SMMU? What about the APPS SMMU? Should it
>>> be voting on other interconnects too? I guess so, because currently I
>>> see that TBUs vote for various interconnects. BTW: should apps_smmu also
>>> vote on the power domains?
>>>
>>
>> This race mainly occurs in GPU SMMU, where the GDSC can have an
>> independent vote on the Adreno SMMU. However, the GEM_NOC vote may
>> already have been removed by the GPU (or any consumer of adreno_smmu,
>> e.g gmu), unless it is explicitly voted by the GPU SMMU (which acts as a
>> supplier for the GPU). This mismatch can lead to SHUB timeouts or NoC
>> errors.
>>
>> Mostly this race reported in suspend/resume cycle (when gpu/gmu devices
>> moves to slumber/suspend state before adreno_smmu powers down
>> and the later doesn't have explicit interconnect voting).
>>
>> In the case of APPS SMMU, such a race is not expected for any known
>> use case. APPS SMMU is part of a shared infrastructure block, and its
>> power is typically kept enabled as long as attached master devices are
>> active. Therefore, explicit power-domain voting from APPS SMMU may not
>> be required.
> 
> This looks like a good part of the commit message. Please add it where
> it belongs.
> 

Ack, thanks for this suggestion. It seems like i haven't explained this 
specific info in any of the patches in this series.
Will take care of this in the next revision.

Thanks & regards,
Bibek

>>
>> Thanks,
>> Bibek
>>
>>
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> index fa540d8c2615dc02d941eb16bc7253204c2750bd..eefa4b836a81374ff437ab4bbcbc3fecc1590ab6 100644
>>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> @@ -3386,6 +3386,8 @@ adreno_smmu: iommu@3da0000 {
>>>>    			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>>>    			dma-coherent;
>>>> +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
>>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>>>    		};
>>>>    		gfx_0_tbu: tbu@3dd9000 {
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
> 

