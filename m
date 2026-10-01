Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC07D419FD2
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 08:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845106; cv=none; b=ujCt8VmvTsmB6oGxyBCtDZYIKS/K4tMcdvAnzYKHmxqkXvug7eV/Ay0BbygtcyTl62uG/SGErscwQBVyh91VUnk1zcj1Ha3YKuQyczCENf3dDUWVsf6nJFlFArnfpJfTJlCDi3GfyIvqp24IgymlWmJjVnt2+uJE7VTwciLvdbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845106; c=relaxed/simple;
	bh=+E2iJBKavpqK3ygX0v7QgiQcmKUSgfghZvHlTvBum8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WH6nlHT79QWGqGbHNiQs7p78mrCzupS6ogV1eBImbR77C02wSGdYj1EluI9HCF/v7vDLwk8gVNzH8qdoS0vRWvLrJ1icV0U1c6kfs1wlY9Q12vIt0kLytvUrGbbjK8Hd/LL5CId+tSVQ+8kXYmwAEaC6SZEnJ1s1hQo5tmlCfmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P1XZlNCD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0q9KcGU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P1XZlNCD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0q9KcGU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xSv01289152
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 08:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZnV1hJu5ZYk9qMVUaRyv/ic+YEuX9OQI6jZvHgxtYDs=; b=P1XZlNCD5eLHy000
	mCQ6hbUJAy0icA53m/ijvv/BDPqLEsc1k6cuICvSSOR0kpkflgzR5OCUimszQODl
	mcy0DNPTd2Mt9YDcwWJ88Xu045pvwmp/dHhKNmNv0+4lj1YiuBNFv/XRvHV7BsvY
	crqAQevQJeSR7whMQk1X05psfxgwMxNAOfhgpSEM6WZldtZCrJLgPK4dRRDWj6Yo
	XCY2ibxS0eMEiXPeYcEaioKfVPRDqKS6Gav1ZcxhP/C4x/7P7CvjrGicEVpRL/gw
	Ha5Ty9NQMNQZ1zpbdKS/TYKkurN3Y3lSLrNFObj0i4bX5CSkah0PiZGrUKdhCO1L
	hUVdZg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pjaxh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:58:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d02df2bf09so44377215ad.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 01:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790845104; x=1791449904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZnV1hJu5ZYk9qMVUaRyv/ic+YEuX9OQI6jZvHgxtYDs=;
        b=O0q9KcGUw5f6yqnAFlKkMzjjrAKOF83CSihjXVbwBP0S/WGaRSJOVlF3lpVG6mKVAv
         5kQRBoA7c9wqoLv+Bzh9Q7SJB0g/2jkbNzIvZ2LMPLz0P8KsWkuS58DoXhOyNeibvqdL
         FcLugWakz5HFFsD729+kgr7tWdlYmzY/MukQalBvQP2Yp50zalTLZiKJ5HCzuN/gTALa
         cNSUhW4SLB83TrKmCVziwbxF+Ul5Nheo7KP1iH4iilf0hew1vNLZMmPsc8WL0yvnbqf2
         RIeJUUWwxyKdgFKXb6rnHdJzY+v2LZBhVXdVZDZIG2fsD/5yVlU8o8utUx9tK4YH0oH8
         9NgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790845104; x=1791449904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZnV1hJu5ZYk9qMVUaRyv/ic+YEuX9OQI6jZvHgxtYDs=;
        b=wJcp5gkk0gKxGvPZFv52scXvX/yY5urkjVGWAzJRtpPiL3Rpaxucob/gzvkFNccp3d
         radfSjaj+AgWpsK1IKaXRlD+vWUpw2+AiO/T8rYk5lif7i2/8Cc7SzMNVwNJM+YnKxYf
         7OsBwqw25RDlsp13xDvDrJc0ehEvSbPmYdOClfE9Buf6sIesOvmABijtjE27a5n/4vrS
         2UrxYLWY0BkwwgFBmte67qXvi/1+HRd/Nouo3UOVaVoYqTz4QzhVR48bRj7+OLBdY0SR
         jjyqKte/j0N4GG81Tm4u7H8juWIYgv9anUmJT98TSl3saRws10RUF6zz5+xHgTGinHcN
         EFQg==
X-Forwarded-Encrypted: i=1; AKwUvByHT+CD6pfkTPmy27sXDWRRqHr48554jDJuzLI8jUQ6ihtkie6nCYgYudy9o4O0zHxMjuhSe9n3/a8a@vger.kernel.org
X-Gm-Message-State: AFq9FYJy1pf950mWRUIgfIKUVXi9NYkILhMQ8W9+ehn3yeiUeXeqxCMG
	5YdI0OMAk6A6FPb083mRX7u7LvbFx+jLDmSnA7WITyanxeEWGMllBimZqjh/Sv659g7pXcDT36E
	MD/0RCMI6sKdEchidYo+Rjcb4IoA3jKtRyixWVrW3EACjlBQzavySyEIfTZ6dFsKX
X-Gm-Gg: AYBFou0SyDzCPGT3nvjeEAgXI8bDiz03dbHDkXm5AOTq5JFXI0qTSCUwzYfer+P7mIb
	UlMFEGTz/QgpIrmHUplmJ0UY8C9h1ObUBBRzafUz6T38vBfAWbjRMAfdDdunZYSjz3G555gsh9x
	7+xEyU5bFYkVzNWeY93HUTVnqWXTZ5S3saOrcRuo4ehXSRNbsLJWhyNEE0KK4mDdTgR7nLh3rim
	HRVBE8P4N/iZV4Y1y82s2+L0dWUTj6+fm0HG45T8W1HH1HdxWdK7cESfEurp//kyTxgOEuB107a
	Gjo+AQ+9AP25w4Mz/X/+ke5kh36CEZkorbrixP0vOmx/TuiJSpLpZa9ML2dIzZFnEeVHNarHPTG
	LuTU/74SmOWT6+XUBloo6dhqyRoQ=
X-Received: by 2002:a17:902:c951:b0:2df:ab73:7e94 with SMTP id d9443c01a7336-2e2e4b970ecmr34381345ad.51.1790845103731;
        Thu, 01 Oct 2026 01:58:23 -0700 (PDT)
X-Received: by 2002:a17:902:c951:b0:2df:ab73:7e94 with SMTP id d9443c01a7336-2e2e4b970ecmr34381235ad.51.1790845103223;
        Thu, 01 Oct 2026 01:58:23 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f46bc991sm3358904a91.4.2026.10.01.01.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:58:22 -0700 (PDT)
Message-ID: <86303eb9-a3d2-446c-b7f8-24061f838f06@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 14:28:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra-evk: Add GPIO expanders
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260929-shikra-gpio-expander-v2-1-98ea5808c4a6@oss.qualcomm.com>
 <9c4cc38d-6cbc-4c87-9946-904b3bf513ba@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <9c4cc38d-6cbc-4c87-9946-904b3bf513ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abe20b0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hvJKFWt8HJy2S05q1K8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: kkmGdkTpZqerPD6bAh9HETFml3oK7TRD
X-Proofpoint-ORIG-GUID: kkmGdkTpZqerPD6bAh9HETFml3oK7TRD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNSBTYWx0ZWRfX+BCJoel9JY6E
 Jdsiu0YhgvF3ZzUxZd58PokS9+y2Je96Xwc2l+07vojtr73B6J2esdvDZo5LDCjQ1qbVHeLabqy
 4NwXxiRvqkxeUYLlZsYYCiLInZ5Wh/E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNSBTYWx0ZWRfX9ZH/FxfkhLgu
 LG2YO3peMHQr5ifAcPnNOCMC8sql/VDSDkLktiiGs5OPn7fnCR2QQ/aXW0Y0/4ESMPFcNJTClnq
 Y9nJmoxMC4h3LU399yYv9SFzWC8al/qPqAmooNYz6khZfdft5iGFl0oTmvJEkFSd0Jstux8vik6
 fGpl6IQbo4ssr9m1y+y9qthlUaERPIBEdBMFy0W0s8gft8FCRjBG9eI5U6aKZMRxCAX4HnVpbW2
 uwr0jSjMel/1XFwt8yEz1gUFbY+0hEYr+TXEfpDC5aDNw0tvOQfKfpXEVv7jV5jMretPQk4CPw5
 0JDh7mzSE/ok+ACmMNaZcZ7eU+XrE3Wgtu6X6uw5tPUzs/vPdYEb8oceb8VlUPcQHM7vybYDh8l
 DkwMAhFRe+0oYsUBFzsKVWVffTg9y65uCKgyg6iqLNqmFq7MtJWrHfGrpX9UfykBaOxXvd8rcvw
 dFjopE2srTpBUPE20Ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010035

On 9/30/2026 3:22 PM, Konrad Dybcio wrote:
> On 9/29/26 10:35 AM, Komal Bajaj wrote:
>> Add the EVK GPIO expander definitions on the I2C3 bus. Describe the
>> TCA9538 and TCA9539 expanders used by EVK boards.
>>
>> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
> [...]
>
>> +&i2c3 {
>> +	status = "okay";
>> +
>> +	expander0: pca953x@38 {
>> +		compatible = "ti,tca9538";
>> +		reg = <0x38>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
> Please keep the nodes sorted by their unit address

Ack. I will do it next revision.

Thanks
Komal

>
> Konrad
>   > +
>> +	expander1: pca953x@3c {
>> +		compatible = "ti,tca9538";
>> +		reg = <0x3c>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
>> +	expander2: pca953x@20 {
>> +		compatible = "ti,tca9539";
>> +		reg = <0x20>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
>> +	expander3: pca953x@21 {
>> +		compatible = "ti,tca9539";
>> +		reg = <0x21>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +};
>> +
>>   &qupv3_0 {
>>   	firmware-name = "qcom/shikra/qupv3fw.elf";
>>   
>>
>> ---
>> base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
>> change-id: 20260924-shikra-gpio-expander-25ff4a29c848
>>
>> Best regards,

