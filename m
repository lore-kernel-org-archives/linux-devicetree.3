Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F00394E91
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787556979; cv=none; b=i8hhbW1OV1sbEMEGC5koL06c2p8fMp2/RCmjFumtoIu4BkIkWTpobhLklDQMirts9nY31XGiImcwQONUsFlI4k6+YcsBXlVEUBMLACd2+lbKtGrIc1C9HRPjvrlYl6KYgEt73QQb5EuAfHl5AnY56LsYgsdYMjbyH8IPQ5wtrxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787556979; c=relaxed/simple;
	bh=EhoK13uA39G3ZuIb06rgLWCH3a/KsBMSOLhqyqFMQLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UNlF4fhnbpKfWfVP0n9fDEli3uDNFjtvww4ex4hZVjCAhTyK+eebb8Q2Yz1ReON7MV5PdStmchwrGGszRDN3IgNFXWTBApmLm75dPDgQIA8lZ7Cmct4XEehVVowc80Gbm3mDKz64j8wsF/QPojsiX+rzYWcwk8QFzN7Fj3HyTt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DpN4F/4b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W9/3FU2R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DpN4F/4b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W9/3FU2R"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O7BlfP1815941
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/HFgwOqoZ7o1jkI9QMG7q1TX+N05gvQwsyKdJjOXAo=; b=DpN4F/4byQsRuk1Q
	hrDd2DF8hwNoqirBamPvKZSY5K8NMKtSq63sflI8h7kMMYE8gxGamPeTD9576Whq
	UYtsvHO9klOiZZTBTjZqN3/ABhyE+jPTrQ4j7Qh3LC5WmoNAzNtg0AtrSm8z/w8O
	IOmLgkAZ6S7gdtR9UMWQVOMTPECkLtaKIfd4BaOWCNcuXJxbwN0npVJw05LCjhiF
	fss9kaUdL3piT9etvAFRIviF0i+NHRx9kK+o/64QbUmG5PKSwZ4Ke8DvArgqMvdV
	Hdbtzsco+pZ0s/BvCemjqWkCnT/kp/Zs2Zn/XsD2fgEPtmo5mySClTNWyqDYGdOI
	wdwNyg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hbtg2td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:36:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84fb5376cb8so4115358b3a.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 00:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787556971; x=1788161771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/HFgwOqoZ7o1jkI9QMG7q1TX+N05gvQwsyKdJjOXAo=;
        b=W9/3FU2RQUN/KrgqkUCQFoAQH1dU+PabmzsdT9j9xUto90SIeiPg+np9sVdWLL2Odl
         uT8biySvw1s+FuZG4EkLrDyiGuHa3JIxi6xBjPJE9wdlyQiAfQwGxJFOpD6hNicDxlkt
         mJDtjkcjUf7aPoqTaMZatGYYmw80V/dxT79gkXMIvnJWXkTOY7Jg6X2gC1knVsMiP8rh
         MjqS8sl/Yu4p1FOQVYCwGGC+q7HMn+pH1vvRvd5vcortj4I7zYoersg0Jr9+3Y7rUAy6
         mYNYWVUv2/1fMuJNfH3pt1aaaX3SA5JR8eoHkVguTHB9SgYvcIHg/NFhXK0zrcbdaQsE
         XBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787556971; x=1788161771;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/HFgwOqoZ7o1jkI9QMG7q1TX+N05gvQwsyKdJjOXAo=;
        b=DJ9X2tbI79s66GCUFzYSzpe30L4/U+FQyWq1NEU0X4v4jRVvG/nJPa+soXN15ueKyT
         MttYGAJSBMi/dtccMJeqVTakd8UKDs4hvZzKYXM0qAov4aplXMFyQTF+1rTwsOC8gRi0
         mKDPcJYvHBK02zMUi1xGjUOH2b1cv7Jl0WV79pXesnHF9D+8P0kjDFewrbwUyVRr3xG6
         cdSqj5VJlqU43Ow92q7nwd1yojTZx13vl7JADCOtmmVNu4UloWwrjY0sjh/nT3e0xTh/
         Frtgk+mc2rromGHHX4byz1tV7ftGYUcGGgYsRrWCNht6UnkYh/v40vRrGJZFeNy7LaKS
         Ozbw==
X-Forwarded-Encrypted: i=1; AHgh+RrFhYZNXtpZZHcQpgf33iOmXJuQ3Bvn/4h6lCWRL+9C9/NfdLObmsYQNWia/v0Pn7Pq2yJ8AuFW88iY@vger.kernel.org
X-Gm-Message-State: AFuF++mh3dpzyplHFB+QrKILw8yvkvqw7cTGaLlipCFlosJ4/AW9ZU+f
	EDy3Euf3CFpDtgCamlM6xjxBF6W+0cuCvFr6MuorMQHoq5PLCgL3nkAH8vVMPM+PX7MbTIpG6rt
	n4OL473vi7mR9vVvA+vHuDgTkMMpxgznLt7QKj+vgvfx97nY28FQcuXFet95BmOGD
X-Gm-Gg: AR+sD13bsLkjtLbz0OSOhyF6OTG/toDqey9G/JQ3aekjxYcaGfdzvPtLokfczMWZIIk
	KQRKCV/UZmDT1bAXHdH2lbT6HkvqLym/th78HVmb0YpZbTVW9/CBHV7/4byCiBL8iueup8pTZ4C
	ZM/3RktWIbCqJ2fmwzk7AQAg0HW5ZOTKdnnn1Fp1/nn+pLdr0o8gZBYQWe+My3ipEeg01L/DOvJ
	FkIJ7d5IPAq8zt9EbxC4fuiROInMRFhOU9T/IsNhPItX3ZtoO7Zj5IQA7ohm+n3hRapYmCDLavt
	MBur2q88CGgNLFUwB5v2sBgWnwTDIOHKMo9KZ7Tw8ZeFLaACbgH0bOQ8t++PAZd0SxJayRbDCEh
	HTFq1/YwO/e2Mkedg/2ATZQA09vU=
X-Received: by 2002:a05:6a00:ab86:b0:851:8baf:5b26 with SMTP id d2e1a72fcca58-851fa040526mr44114352b3a.14.1787556970968;
        Mon, 24 Aug 2026 00:36:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:ab86:b0:851:8baf:5b26 with SMTP id d2e1a72fcca58-851fa040526mr44114284b3a.14.1787556970590;
        Mon, 24 Aug 2026 00:36:10 -0700 (PDT)
Received: from [10.218.46.60] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f149ef3sm1670216b3a.41.2026.08.24.00.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 00:36:10 -0700 (PDT)
Message-ID: <a6915b60-07ad-49c1-9c44-ab0e07b8926b@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 13:06:05 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: pm8005: Add pmic cooling maps
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gaurav.kohli@oss.qualcomm.com
References: <20260810-shikra-pmic-die-v1-1-b4ba21f254a0@oss.qualcomm.com>
 <f5333c12-7f4e-4a4d-98a1-74d216f6febb@oss.qualcomm.com>
Content-Language: en-US
From: "Dipa Ramesh Mantre (Temp)" <dipa.mantre@oss.qualcomm.com>
In-Reply-To: <f5333c12-7f4e-4a4d-98a1-74d216f6febb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NSBTYWx0ZWRfXwLn8A1nPcOqo
 vBQbXptRBk4YEj09eCI6s1TUpB5I1cbH298ds2dJ4u9TlKI8WcPtHd/Vf2yZ3YGq4HkSI7KNokW
 c4V4kQihksVWtEeRtnjYFFk/GK5fsjxJ6TjdnySRbXPMVR0YCrnvI2si174cd8hit+L/aIreJq7
 LzCHExCtop/I1t4xUQHEIqr7i1iLrWaSQfZNyIauWVSmvnT1p2uDSoqFKdY+pKL8pxqikR8GUX4
 0EJiIEerXo1IffQaKUw7kMWCSjYgbBzMrQoGIU+8jMvlsQiAFpIgTAa3gQzzbp2WwaNS5bzSVRz
 S9xUyg1Dv3EYjbujNx9yB8xamYEKN6CgLgz8WRdqc4FJfnb/Kj6XUdrM1pcZPTv75962WAH401U
 AOoZI2rwwGpUEopHCk7G1tf6vVf6fTgxcSq/3uyqkuh4OyPmqf37P1fSyWRRD5yRCL06OvRRKx1
 BmUBoiZqBRtFoNppa5Q==
X-Authority-Analysis: v=2.4 cv=JL0LdcKb c=1 sm=1 tr=0 ts=6a8bf470 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sarD9kAI3zSQ9mHdOswA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NSBTYWx0ZWRfXxpJcll6dJKne
 CcXW44aoc+IU9W7bN0aIdJ0bzrWZ2xmK4GOmIPCYOmyyjrdRGQsXreVC/bfCAF76SeJOa83Jg1O
 QNWURx/Ya7C5nbrwLsolJ9fYXO/v0sM=
X-Proofpoint-GUID: OGIRWnxx_bL2sr2i3cPMBOZIONMXBjX3
X-Proofpoint-ORIG-GUID: OGIRWnxx_bL2sr2i3cPMBOZIONMXBjX3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240065



On 8/18/2026 2:49 PM, Konrad Dybcio wrote:
> On 8/10/26 7:13 AM, Dipa Ramesh Mantre wrote:
>> Add CPU mitigation cooling maps for pm8005 PMIC die temperature.
>> Throttle LITTLE (cpu0) and big (cpu3) clusters at 105°C and 125°C
>> trip points.
>>
>> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
>> ---
> 
> You're making changes to a shared file with the intent of altering the
> behavior of a specific platform. Furthermore, you don't explain how
> the CPU frequency correlates to the temperature of the PMIC die, leaving
> that to the imagination of the reader.

Thanks for the comment, will fix this and update the reasoning in the 
commit.

> 
> 
> FYI:
> 
> $ rg pm8005.dtsi arch -l | sort
> arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
> arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
> arch/arm64/boot/dts/qcom/msm8998-mtp.dts
> arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
> arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
> arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> 
> Konrad

-- 
Thanks & Regards
Dipa Mantre

