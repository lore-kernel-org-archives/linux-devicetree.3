Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CC438E100
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 06:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782975219; cv=none; b=eNItfzq4oYLUnjQrlfK1mKVjTJkGh5BZ4+miMCop5CIf16e3XwaBwE72TiNQHs39Pxps6zpqhXQvcek86Pn3mE8pTyCtF6Sx+TIvmlFnPmnaU2dd3TOl/fCl1GLiX7qq+/D5F6OOK7zVhp1OZKV104rML/Xi8v9gV/cI3tSK3OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782975219; c=relaxed/simple;
	bh=+4b3w6JmV1B0LZJw52j1qed3WNOp/NfO4qp3OK/aatM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WVvrJrhUEonRG5OfiFQVT2Buj8dnOmVE51qV8fyaoCqhTG/v2RsDbVVMPYKg/Uctg2sGtySvCDyj/tVxDAtSE878IQl4kViDH1NetRA9sawZUAAiVMfE+kz3qPWjdvnumRGuQpyZOxj16cYDpft4lgprIE21B19Z/xELAb/01xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1aSo5Fj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TNQ+Itdf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1aSo5Fj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TNQ+Itdf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KQrL2957656
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 06:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BHip0Kz7buAzWxIlIF8kUD1bXgXidWDoAhK1k+rP8l0=; b=Q1aSo5FjWCvGe4xm
	t/kmK2wpQ4rvcpgGyWYAh6HtsmUmb+YgJ/CrV4dsNOyzFTM0UGngY/ztD3R6lBfO
	tQ6IMttWxrdEi9/qGIB34BDYQyFVVT+obQguohRSyVLpVy1L1NkZ+H+89nRzGUdE
	r2ZQuFlgrK0xHIUoapaL27LxMX4F8KRytIYl7O0HDnMqc/P8IYY90It7eA+ZFS/l
	T86FauypaGcnnJEgKqA7EmDuD1BxBS6OBpDT/SQla2oSRg/I6TQ52enDvzcUQ/P5
	Ixh9Tk2irHT3BIneZ20/gjAr/2Ra/CKx0BuPFND+cJmp0iLJhMers92901A99gR9
	vZ2wNQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5630avry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 06:53:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-380c178acfbso898460a91.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 23:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782975216; x=1783580016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BHip0Kz7buAzWxIlIF8kUD1bXgXidWDoAhK1k+rP8l0=;
        b=TNQ+Itdfn3OB51EKHyfuW0JaXYuB7tfapNsW2WD7X5Tc9MmlQ5WmnGtFAyHnEXXUWb
         nXkx1u3NwzatgYfYkPNwg+EpyW63LgPoQHs+acZX9Wyy0AzpXeLSni3zgNCxLr3IRBzR
         JM9Yohx76QCM9qW+3szIfSSoHq2edegqwHpXYmX4UMvAjj26wYq4GMJXNSVv7v+zsJfz
         8LlfjzeeT64MBTN/MtWzcr9Mya3kmkYZvwCEhaZb6okDPcLOusPWE/UKNGnCVoTdEonA
         lZNXXHH/DDgi0Xmg/BZKUwtQdmCICy0mfYNzJrshiqQfD96gXWunQzgtgAHCCerWI6Ba
         C79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782975216; x=1783580016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHip0Kz7buAzWxIlIF8kUD1bXgXidWDoAhK1k+rP8l0=;
        b=djAjf+ftSLCw1W1+b4sytjI15owlB5hnGIEEeX62WSEeHGe0qGTK6wrLDKIyFSHTkr
         HbWYG1ZlGL99A95TZZGHvY+CTlITKLyTdY0Siq2LlAmJnAt/ar+2H0UkU/svwO4pSpvj
         NtVFjKhNrYErCLcjO7fJmkHeqltlSV5xn5sJz21ym/E+t4Hc6FpN3m80WKf7yfunKchL
         hjvFug5HqaFqH5o6GGZTzgj1/xo6R+FUbDfPKJxLKwP6dE8jmQyeB3PEQgCVl1n+mTBM
         yNyAkzm3UWiZ11QvT3fGvwEbdZ/L55Znrl55VDxCCNXu+nU+Prnk3gTaLaOK6FPxF83W
         Q3sw==
X-Forwarded-Encrypted: i=1; AHgh+RpDciX95/5s9d8+mrb+jDNry9d4S4rL5ygAUI0ZlRfboGpEJL1U7tnielUyfziX3PRADhI+SRV0r2Ff@vger.kernel.org
X-Gm-Message-State: AOJu0YzzgdQpEtVpVdGPnAA/znmjizhrqap/B10xisW+ElCGepP+69Qe
	dItt6kovCYFPlYtySnkcTKt8MOyQjAEnVrhJJxgiqLYyfZvKHf6nF8v/v68lkOtAzf748KhN1nN
	YR4Ea17WV+m7t0SO0luyrElgzo+nrM8Uxql0aWq+VFikEwVsSlxk+Cjkrn4Wc2vVU
X-Gm-Gg: AfdE7clqNVuiLK9FqdpWjtsVNO4aMDxSLz5gTdUuY2Jz7PcCxsDFpBtdDAhcTRq1ExR
	9doeV0TKZMZL4IxInn/HUnQb35K7RmiWYiwc0cFHKBrm/IGxdtnyoSI7iNTacHOqPxTm+5keLja
	tfidMdEYANsHP0uBogfNk+ceNVlGjXdJS4RaWIxs0O1Rk6M5bSy2VuVYolsedeJ0ZPYFpLuA1no
	JAjbLUKFsljFjGED0jE9Yo9RRUCElw3aL6HKJs9apxPwh6pjgJ3B558e5k5L25QI9S7ge+STcWl
	b9SP4/dD9WONup+wos3q3CoiPVuLx1jdspMkYthictZgimZQ3t+Ki5Znvn/iyPJ5mVgF2x8HU/6
	43p6L8TR/OmVR5SQN6iCzKDTxau6h6T2gxta491EK
X-Received: by 2002:a17:90b:1844:b0:37f:c2a9:468 with SMTP id 98e67ed59e1d1-380baa6b497mr3981917a91.18.1782975216276;
        Wed, 01 Jul 2026 23:53:36 -0700 (PDT)
X-Received: by 2002:a17:90b:1844:b0:37f:c2a9:468 with SMTP id 98e67ed59e1d1-380baa6b497mr3981881a91.18.1782975215737;
        Wed, 01 Jul 2026 23:53:35 -0700 (PDT)
Received: from [192.168.1.6] ([182.77.29.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e1608b23sm551730a91.9.2026.07.01.23.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 23:53:35 -0700 (PDT)
Message-ID: <08ed6b4d-5549-4aae-9967-1365db0e3aa2@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 12:22:57 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] arm64: dts: qcom: Add SD Card support for Shikra
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
References: <20260630165700.1886608-1-monish.chunara@oss.qualcomm.com>
 <20260630165700.1886608-2-monish.chunara@oss.qualcomm.com>
 <b43691aa-6d1e-4df0-9d1a-cd5c4b3e3dff@oss.qualcomm.com>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <b43691aa-6d1e-4df0-9d1a-cd5c4b3e3dff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JdiMa0KV c=1 sm=1 tr=0 ts=6a460af1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=1qKOYMtCOh3zOq8T1Y2cZw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=nutul9sAWFEbEiaF5vMA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA2OSBTYWx0ZWRfX8m9h2ZQqpCep
 1dqJBW1gDa6odxuhL3Fm1BUXeJnqW0SN7dih3bBFt3Ar6XLZaJ2t5sAusY+V0Kv4/bt/2Yn9Xgg
 AKegZIVpjwGsCpJe/1/DYwkH4V5xch4=
X-Proofpoint-ORIG-GUID: q3QGWsbDE9_Lv1z-f0pCA9WT6IPL6acn
X-Proofpoint-GUID: q3QGWsbDE9_Lv1z-f0pCA9WT6IPL6acn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA2OSBTYWx0ZWRfX1lsPjJkkrzu7
 ZHg2vr3pUtTW78uG2sTCnmGmWBX/OlGorIeScyJju3njI5XsRaGqU3Dx9mNCK6+4jMzuACNNSk6
 6FYj3w81VCg9o2cVffRY+xAWni5iDBeUI2jKZfpwuFGdHsv6uD/GMLTeBy8Z2CgM7LDHoH6efcw
 /JYCFeYGNTrAvtj59URFTf1lf+BgKN179t9Wxhlp3aFNB5DotRTHJojQg5FTtCUjy2kDqJLDu0J
 RvLCL97U09PkyvwW6iupqzUBChd7SwQxwToTIT2W9QrRchVbruIE0KkgCNSIIW5UA02XkyNYo1O
 N/7apsuJVcpaSY1l1uZB4WfourI3Btq74lxYxt74rHQiIwAibY0vOvHYq73CAgJrgGK5osQ/Feg
 UXfFlDbIkSWRGmRmHA3vCkOWeqb28hJGNJ6i5ottpUJdN4Rv6tChxdpATyOWsp+8oePar8Wh8mz
 1IpK9YNvX6dO8k4hGSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020069



On 7/1/2026 5:07 PM, Konrad Dybcio wrote:
> On 6/30/26 6:56 PM, Monish Chunara wrote:
>> Add support for SD card on Shikra SoC and enable the required pinctrl
>> configurations.
>>
>> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		sdhc_2: mmc@4784000 {
>> +			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
>> +			reg = <0x0 0x4784000 0x0 0x1000>;
> 
> Please pad the address part of reg to 8 hex digits with leading
> zeroes, like all the other nodes
> 
> otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 

ACK, Thanks. Will rectify in v3.

Regards,
Monish
