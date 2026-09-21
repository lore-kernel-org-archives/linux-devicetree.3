Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C29443E4D
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 20:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022671; cv=none; b=cryJrPK/Hi14/gwzVs5gKN94uvg8+hNo+4EONQyKTGnMQ8UK6/ZPcIEQ4qdkIerbYMx18YxpjDa/B2OUL1W/WeLv95t6p7XU9j0S5svJp1LBWmmVUZaeJXKuliWbfrekNL6/J94tqF91CPgnSFSMipaTxu8FVDklyUCXq8fzP9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022671; c=relaxed/simple;
	bh=KYrFug4HjS2poolGnWNstx6F6UlgofBOdMPNGHbVId4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XiGQxETm7sDB4+ziX6bfFXiwIaXLlRqIkgQpGpIxGRY4TOA3OssVs7ETcKhzro9+ifBTFmi6MXqKtO/yCN/n9llnFU6xfDny47RHvoOXG8e3FkIZj+UPlV615TbQV0V8X4kfgn3o4YPK99pd2d/fnj+n33RlPrKDQYbe5H3+Ons=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLssMX+f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B2KtBlqN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLssMX+f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B2KtBlqN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAwDl885359
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 20:31:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/CXT2/U+CRIw/4TV1GykFykopBE/d4y1YwwzQgX0jw=; b=BLssMX+fya6Qb+r2
	qOR3FAbpv7hF1J5bOOV/WTEfUk0LBwwTMDDx9/nqyimDBSP/HMMuTjLuSMCeatIJ
	UNv3mNnYhH42bSOTGv9fMjtzrH3S5NtdRViKSA+UK6Vrh4ibTypEgmKSlL/svvAN
	6eiZ4G9dJ9WgUA+1UJODKrqqpZhxDhRXaJsVDKGerLa3ocxPqING4NT9C3CZwo/f
	qfew/EkyV7OjhOr30gpRwISh2LW4ZkaLD/Amnebr869azBQcyVFePydiWzjYHXB0
	TvCZZ319C04oPRM9szIHcNf+E418RXOdF7Wkxe2ohWb56T84+GYrv6HHMbeR+oO2
	cd5zSQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj33a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 20:31:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so4585405a12.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 13:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790022667; x=1790627467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/CXT2/U+CRIw/4TV1GykFykopBE/d4y1YwwzQgX0jw=;
        b=B2KtBlqNfI54wA/YAEt49cPDsR6o1VpREX+xXNEk7eQApnL7il5LVB6x/JiXzEPDuV
         zLOrKVGDCzbIZIhdgb07lHqDBkfTJ9cDzJQH911eXy2B/42hprUlvcY7z2F8D9/wjhcw
         dHkycNhft9ODipfxGV9DFjYwmZv+yT5W8+jQZmCJrOm9+GUXgfJ3y/poel8IOiqZmF1i
         /70EWdYlvsivm5c9rcdTBcl+xjxQmxvEw3WOqKUHhW2O1Hob7UAFPHr47Z/JKt2zDq2v
         1I0j+A7MNaepU0FR1ahRANwYrhMgrY8eaKfEWVzJuGx31wuxJDEomLov6vEHdFUj18HB
         68Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022667; x=1790627467;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/CXT2/U+CRIw/4TV1GykFykopBE/d4y1YwwzQgX0jw=;
        b=J48xGEROHbU4Tyw89PgB7ebFjWea4yw9tWbOwsAIYFflmF0CGOZcMhJLihzWYRZh8t
         y9RscbnFhhfw7urFzsfmJc9GxysW6aQiFAEoDdfqhT9+W3mNyYfzpAcXAcVYPMsDCGFF
         5v9qEeA3AcPC+gMqP2KfnUV/h1g7ft1KQU9sR3LRjAPDl6wryb6wGIs4pkJL1gDzcjTU
         PAjivapYin3dj2yueZn/qjnz7JR1OraZmCxqmTq68CTRkooCDGPNgF9/nW4AfYPsxn+T
         ISUdTZrbOSThIzzF3ccXaWic0tNA2ioikxocdfnjSSEv8tTUEhHnnGNqLxufq0DM3kZM
         emBA==
X-Forwarded-Encrypted: i=1; AKwUvBwivsSmKCSgrq3cFny/MdO5BgF00m16M8CXvmilLZOpIEHDCJMYijK02+cJUIWB+fUJH4YrEegtPsN3@vger.kernel.org
X-Gm-Message-State: AFuF++k1DRcml5U8eiLxIAKBD3CFq3TD+RAoOKfvwUE8MExDNqLo/cJC
	Q5H3gqegVYbtuZA+NSVL2X2UiCDnHX3SfItzhhEM3gw8JJxcHamQLJiotQ8kOFJ0EaNIbNt2kmu
	oPa0np/Ck1Inx8MW7yjhHOXPEh064u0VqWj8f9JrWvULjA/qOsXu+lGwUatURJW9d
X-Gm-Gg: AYBFou0bM/s6vbCf3Xc+bImrlY2wfcKnC78H9X4ui3zHaUsdLkxFo2AXDt41+qqNTBg
	rgpA7bV5O8jJ8YS3BactB40D/RTHCKV9/NKZ4zMagT0M140GKZtx3HzL5CXZwCFFMYCMUSZVZr2
	SLkZ8UR6ahebOjdwaxIauIc/jKP3sui54rORJcShhri16GjZRuBN0mvncO6/QnTDUTgGxl16+ut
	WLKKiF4uMhzGTEihAvkyjuud5Kckrz1k9z4x+fLUXppjbpihFawjVaSxAn08Tc4hNQx9sIoAjEm
	hrLhKfTgp5wHI6Gb62tVUS9b2FzycAqqdZLaDSvS8mkmxdI1D7n3n1OABScpkCYV0Hw2prQLfFI
	0V0afQdMF3TiHISFynulUO6Plwlwwcjfd/Q==
X-Received: by 2002:a05:6300:4049:b0:3da:c10c:6aa6 with SMTP id adf61e73a8af0-3dd8c2dc837mr20393376637.1.1790022667456;
        Mon, 21 Sep 2026 13:31:07 -0700 (PDT)
X-Received: by 2002:a05:6300:4049:b0:3da:c10c:6aa6 with SMTP id adf61e73a8af0-3dd8c2dc837mr20393344637.1.1790022667022;
        Mon, 21 Sep 2026 13:31:07 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.229.14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f0c96f8bsm172225c88.11.2026.09.21.13.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 13:31:06 -0700 (PDT)
Message-ID: <ea53d79c-4aa9-4e98-b829-cdf6f43cab66@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 02:01:00 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, alexandre.belloni@bootlin.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Frank.Li@nxp.com,
        wsa+renesas@sang-engineering.com, alok.a.tiwari@oracle.com
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
 <0f77f41d-589f-48da-a013-48f48f1dbbff@kernel.org>
 <b7d120c8-1215-4923-8810-83cc0d7cdc36@quicinc.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <b7d120c8-1215-4923-8810-83cc0d7cdc36@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMwMCBTYWx0ZWRfX4Wkxy3hJ63Ap
 0yNXTBGIeQRDKlwnMTgGzBU+bwFTRkyHwOkambk/NpSIGCvxnaXhvIK2ix4fjDO4XpvXcft8D0B
 ZA3cwdWzO0oCH+t7xFBQFqJVT0GGe9U=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab1940c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=LKvw4eQ66EqDTtCUdPbf+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=jzypiudHYq9u_h9wWJAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9tPDfIlJtqMzSagx5W8DCMEfkt-k8cGl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMwMCBTYWx0ZWRfX/TgqGWcVdixe
 hLBdaUTfs6I1kvaWbw7V1/jqzItxgbEIHL1rVnZu71XNfXztS/fdwJpCjhYTg2Z1wUO5pYL6Yi/
 G7uYITnicmRmiEnuEPKvHWECesjgHFu1mbSNk4iO7DaUDwawEcQppk/0rYNWNSqAlLvmh6J41uH
 QQLGTotq1yjVIZ127t0vvU9aKlKlyklj9++e/8tJq19Qd/OwEG1jr0fHySbDTzCpvggWV/HpCMN
 hoUCW0m6x2HkCqK5oatg45IinXvtY8gYBmscGE52vUAxMfWCsZnPafKfSf8qgHRSUDqq2LnV8vk
 lltXVPQn4PMUkYXPj5ITqjL8F24awTJ1KXL3q5TXxnPdgy+y/wVeXJ58ieKcEsFu4TwD8mD9xZp
 Lnx/2z06M9FZaXOtTYc+N7y0miW1gbttVVjhQxCkzCyI1ZYhgx6IQpdZVUv57RMJ7PhbT8tEI4j
 saL4HIojo3FZQKrn83A==
X-Proofpoint-ORIG-GUID: 9tPDfIlJtqMzSagx5W8DCMEfkt-k8cGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210300

Hi Krzysztof , Apologies for the delayed response. I was waiting to 
verify the changes and ensure all the suggested updates were properly 
incorporated. The effort was further delayed due to some slave-side 
setup issues.

Since, I migrated from my @quicinc.com email address to 
@oss.qualcomm.com and could not locate the original email thread. The 
replies below are from a draft I had saved earlier.

I have now addressed and validated all the suggested changes except one, 
which I have responded to separately below.  I shall upload V7 cleanly soon.
> On 7/1/2025 2:03 PM, Krzysztof Kozlowski wrote:
>> On 01/07/2025 09:18, Mukesh Kumar Savaliya wrote:
>>> Add device tree bindings for the Qualcomm I3C controller. This includes
>>> the necessary documentation and properties required to describe the
>>> hardware in the device tree.
>>>
>>> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>> ---
>>>   .../bindings/i3c/qcom,geni-i3c.yaml           | 59 +++++++++++++++++++
>>>   1 file changed, 59 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni- 
>>> i3c.yaml
>>>
>>
>> It's v6, you really should have started testing your changes by that
>> time. :/
>>

yes, clock-names - Got added by mistake while uploading, will remove it
in next patch. Will run both dtbs_check and dt_binding_check before next 
  patch.


>> Nothing in the changelog explains the change made here, so you just
>> sneaked something which did not work.
>>

I didn't made any change into this binding file. I would have added in
change log V5 to V6 if there was any change in this yaml file.

If you find anything else getting added, except "clock-names", please
let me know.

> 
>> Best regards,
>> Krzysztof
>>
> 

