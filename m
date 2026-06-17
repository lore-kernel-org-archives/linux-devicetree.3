Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C53282F3E
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 01:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781659860; cv=none; b=VQ+ZRqY5C5Ixpz3lOrsONNU2lZ5yDlRnc+2ITkM/AMvfO8XKc6JLBB4XVJk6RNaTCFiITolF7/SG5UZ8GSqYbo1dSyaZH2DTDnvIlCqaJbqb0xWu4NxFCyVlR9hk9rOcpNAe6x9ZTa08OOkYEtCj6qpJIds/xeDOT4ywkyhemx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781659860; c=relaxed/simple;
	bh=f3QMIYqJLV45dB3OOU5q66tRA/gy39q6iYmhKOD+IPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYXheYdwRMABE2Ee9NDxnoERklbn4Ua9cWRUqPMxaeNXDpESQF91W2D0t9/Ak1Rmgh66xsqiWunCgodvVLP1oKj+AwEo6ei8kmXR7O5xGg5QXBxLHQ/uddxWk86w774aDkkmUz+MDUGdTUUzZXKbVvm7e0OX5p9AOZYhDGt/Mqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpvqCmxV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZQCJ5KT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpvqCmxV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZQCJ5KT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLSwcb274624
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 01:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LFFy8N8tIeg6Ssx2D/z9+qb38nAO75a0/SRz3wzKEQg=; b=ZpvqCmxVyH3L+Cgw
	5EKtXn+S+jl/1y6uT0pA/26UNpa/d4wFil+KiVaije1Qb7WDLlhKoZaIZNlYxmj4
	S9jWXnnDMCk/YjA248gUtseDxZCXfUWUobqgniv9gKTsvScEc44D9ByFu5Q2MhNX
	bR+7d7h4rmeu2AA8LIh72IokzGW8gMCHW7sO8JiB2mkEpvz6ZOw6XftWujQGnpXu
	8gqflYLZ5kwtBomp/DOjdyu/TaXCgc86FFoWJTqTEgEh5J8VYQxLoRlZZa9XOpSK
	gLrTR9Kb7XzAVh3VNrSAV/sq40w6ISGZHdXCs6vyM1/OjXgAlWDrvK2Lu8/9IiSf
	MLaakg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueemgnkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 01:30:53 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8421f5d76aaso3683423b3a.2
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 18:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781659853; x=1782264653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LFFy8N8tIeg6Ssx2D/z9+qb38nAO75a0/SRz3wzKEQg=;
        b=HZQCJ5KTqDBd6UeG5IgshXz+klL8GtoReKssMYBHQ8g1iNeHtE8+X5je6ZZQHy79AN
         bGplfB07Gn7WBcH73+d61xdX7MArjsAm9bzqWErlpJlC9sY84XsILEY0AKgRk8L1Mum5
         rwLYWeDx6CRs+JDCfBBzqWcqTwCii07CTRwDs8p9e/DMs3kvYl2RwKRKHdZxuc9spgFO
         /+jJCTSMzNTlc+ht99i0i5LuqkZU8CAfM24/6hgVTQpazpzb2+bAMSEQZ6zE/kEAHlzx
         FdnptUkl+TC10KK8y9djLew2ek/dYCc3AnfNDRmGGgl6pps7WMbCLCWvv2Zwt/tcdSbU
         87wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781659853; x=1782264653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LFFy8N8tIeg6Ssx2D/z9+qb38nAO75a0/SRz3wzKEQg=;
        b=sEagf0PsPtOrwtaLvkXDOkA5lFjZ0WZI7Ptlgru7B8cIWPPMnUn8XOvMtVLNU8CwtC
         T02YbGeu5RwhglttSCBKgP50xLjIc36ZsOGFPEn8dyYdGZLiOJltdo2xB/msAZVWY5Jw
         gMxG9rQtdSUpHdSIichrSrjVka4s7fRiE7ERpkyvx6Zh0p2P7cjhN+HoMHjw8mLzPWCQ
         +3d8IqxvbEtSdTW7gBFFxxv6v+PtCKgotQHxUSg9yla91lepMtDd3JLxnCQms2/nYzEq
         xPfWiQf+FpLI5Vz52KV18wN/UJDXr/UpVttvOQCwiAJqs1J/Sygr+wlQHMGSPOEEJaNf
         a7pw==
X-Forwarded-Encrypted: i=1; AFNElJ+mfjz6ztBdmKpgAHCqBwCLWHjV/suJfRqQhjv/u7Qwl592vxiHm9g3nZs642mMMOzSQ1dUGyjKSb0i@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs1TVBlhtOTcd5JOeGLaWTZq43/Kiod+E1SDn4PW5Ae9YEHuiH
	C0UJcDBo91RclhjuCgP1SFP+7FIT4LXBBIKD2wjjl7QRsFz1u6vocY9BS4bgX4FMyzvUi64HWoU
	3mhfP9moxBRTCVPiU+wnFlNItSkt76oEk6Fde7NE+isjvsF5naCC9oNv2x3sfXHz5
X-Gm-Gg: Acq92OFeXRnT5hsT/m1HK0vJVJT8xDSPKY9dKBDzDw8pMVioWPggfwFN7ReNvgTouYy
	K3o99vrMkisIuzRvFZtXSX/ZGK5K/nYdFSEXhsaVTSN+bJ38ebKT74fh3vSwZpUkfuC7fGhuEBm
	w2slTa2zTurt9QGL82GoIbOa4Dri/Z5/uxq18TwOZ4EeuEb4fMDxIw2gyzwgll+tAysH0nZC5IS
	m13dm0dd5RJy+GE2cEGJfJs+jIdORBqQRPAdq4Npy0Akf4R8NvJpwL5czBQNTEc7XK0WV0n5luC
	haDnJFj4elBH8qB0Ye6BwMmjhNfH+e3iaFHD26vSPtCYDIuOnWfRf7wv0dGhzKwtTjs3sqYkqhE
	sJ8VpldSfijrJNAsXpdZTtao+KHNrDzGU0ZoLiy2zDKYgcKxnGqc/DRFUZPmjBshKygnuMNc0dG
	VudbW2K7tQqWnM1w==
X-Received: by 2002:a05:6a00:2e07:b0:81e:ef16:b288 with SMTP id d2e1a72fcca58-84524540500mr1574733b3a.22.1781659853206;
        Tue, 16 Jun 2026 18:30:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e07:b0:81e:ef16:b288 with SMTP id d2e1a72fcca58-84524540500mr1574699b3a.22.1781659852720;
        Tue, 16 Jun 2026 18:30:52 -0700 (PDT)
Received: from [10.133.33.63] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9c4c0sm12958951b3a.3.2026.06.16.18.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 18:30:52 -0700 (PDT)
Message-ID: <8a4e7f81-959c-4966-b90c-1ee4ceb9ec9c@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 09:30:46 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add PMIH0108 haptics device node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-4-d24e422de6b4@oss.qualcomm.com>
 <6b3155ea-b583-4f82-8313-7a057fd78066@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <6b3155ea-b583-4f82-8313-7a057fd78066@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDAxMSBTYWx0ZWRfX8xDF7UOSfs6C
 CMzG1xjXdWtjpzQZX4CRk5yhNDIcC3ldQS/zFRg6f5Wy1xYfGTsBSjDMoHkD9nHWpP03cceW/A3
 rDM67bIl5UGfrBJyBZeWj2MxIaqHwVQ=
X-Authority-Analysis: v=2.4 cv=D4d37PRj c=1 sm=1 tr=0 ts=6a31f8cd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kLZ2Z8zhSb2u0Y7Hii4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: lF0OdPtv_cwxIT_Ij2GIWRGPJrD7dICd
X-Proofpoint-ORIG-GUID: lF0OdPtv_cwxIT_Ij2GIWRGPJrD7dICd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDAxMSBTYWx0ZWRfXyBdp4dXTSsq3
 mtXr+MwiEiIUVfKm8YzQf0MFeTzBGI8pzLhdLf00xwZAWh0Kk8A71PnEKQBC7aEix/qX9/airbY
 8Crva0//OeHxF5bnf4rrcrLoXSEQ7e47NUqXwtW6OovFZrLd7ypL9R+NucNYYfmFsFJxpVPmJMI
 IjqcFKTxCXpkMzFlrgJ0Lu/atZTLityqmMMjdW8gugbUVyt9Yzb+dS0H9rgt6hnd4BWFb4aYZ8u
 qLxwWbcT2HGQpzkpy+2UIr2K4L6PNVQTXLz7QQwzf8m6Y2jGkCPOktl1d+UxmiK3YpJvA/HUNoN
 DhKB1lauv1MXBAo+my72R/BNBG5JYLeWqhfQDzNEVu6sm4P7oYRxZZc5ywP0dN7hA3NTpTTqX9+
 i5TuTZn8tMZU92EStWv/IjVaEVny7WNSCkHbkZRg9mp3fWV71LHDXca37TeP+fzrfj7hJZphtKx
 JH9dfqVujKtoB8a4Yig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170011


On 6/16/2026 6:27 PM, Konrad Dybcio wrote:
> On 6/16/26 12:08 PM, Fenglin Wu wrote:
>> Add haptics device node in the PMIH0108 PMIC base dtsi files, and enable
>> it on several boards according to the LRA (Linear Resonant Actuator)
>> component mounted on each of them.
>>
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali-mtp.dts       | 7 +++++++
>>   arch/arm64/boot/dts/qcom/kaanapali-qrd.dts       | 7 +++++++
>>   arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi | 9 +++++++++
>>   arch/arm64/boot/dts/qcom/pmih0108.dtsi           | 9 +++++++++
>>   arch/arm64/boot/dts/qcom/sm8750-mtp.dts          | 7 +++++++
>>   arch/arm64/boot/dts/qcom/sm8750-qrd.dts          | 7 +++++++
> One commit per board, please
>
>>   6 files changed, 46 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
>> index 07247dc98b70..7e3f59fc008e 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
>> @@ -952,6 +952,13 @@ wifi@0 {
>>   	};
>>   };
>>   
>> +&pmih0108_e1_haptics {
>> +	status = "okay";
> 'status' should go last
>
>> +
>> +	qcom,lra-period-us = <6667>;
>> +	qcom,vmax-mv = <3600>;
> Do these properties depend on the physical characteristics on what's
> connected to the other end of the haptics driver?

Correct. They are basically the parameters of the LRA that's used on the 
board. You can find details of them in the binding document.

>
> Konrad
