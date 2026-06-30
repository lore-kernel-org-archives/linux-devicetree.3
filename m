Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CB83FA5E9
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817792; cv=none; b=sBT5QvrJ60xYf32z53/0/eH8YsgQtj3/T7kMl9fFRnTYctpHm1qiNhDxkpjt9VmxxhTKbhyzLrnYtp54GLluiFA+bItCSRq6+TQEJN/UEqwA6aZmMjxGC16jIeB100hTQxyzJkoxiHPR2aARkOWnupv5XOPVWQy88bfqqE4P964=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817792; c=relaxed/simple;
	bh=cRwU7NFBu34DY6s465Lfdt9hITXAUx02A/eU0OKwDn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Evr2NGspAM84p1P2Yj5ll4RHRCuXAzdZJfHLLwQ1THgLjT7/DiKOvcAkxAXjYcNtOd34HXFiV5lwDXzV+0ouaxYJr8HCwhIi/po/Q7O1Gqey/Obs8MWUvvZHRlRsEHR3mZh7CtXaYt3kAN7uPKSmgKeq/3ulfBU7QdC/YkPTyyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lypd+3tn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXqj+dcn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lypd+3tn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QXqj+dcn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mxCH1604773
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cRwU7NFBu34DY6s465Lfdt9hITXAUx02A/eU0OKwDn8=; b=lypd+3tn6luViu5U
	4orYmLHMSdyPzJ19dgChuOQbXH6oiTjEszCBx3OkDppPwcWaQCsjJpG+eqK2uDF6
	SGQtoSzk+Ec0iOV9+jKjYgarlBBGIHHF2f+tpX499TnylMcaFf79S4Q9oS2damsE
	fahu3cdIbTDvslA1u2/zZhMtGCKMEcKHKQcEdZH4iaMhU0I8zYQAz8/hRU5+3vYX
	SSd0HSi4HTIpz9WfiXzDMHSUVIO3euQi7b91KE41V4Je3Qywfnbe7c1xtNeDgVTk
	lozTokxaj90vZQ38/0t11tqMyAo0WwqSMqsNJg4o3YjV5ipN3Y89SFYQ+U0SNmie
	A80Dhw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f462fhv2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:09:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c069f73e4so3225931cf.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 04:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782817790; x=1783422590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cRwU7NFBu34DY6s465Lfdt9hITXAUx02A/eU0OKwDn8=;
        b=QXqj+dcnCFq2FXtojVkGhUaJDPuB6EHAXxTCYTSdfJYqrZ0nPd17Mixcc34qywreKP
         9FkTXQsdPmP6SUT8O/t9W/KHcJujaezAbiw4lbKsC0ofRQ1iuYYsCg5TnOXYpTmNt8JY
         +fw+mvI0pDbCRESZrF6YaOionoEl7zW+RFwl1xdArZ9Ql1vkYY362mvoGz+pVk1fTYF3
         N3xPi3G7uTnGGEH2fZp706MoET2vESRXs5+2YyELMQmA+CwGLv/vt6azsGBHBPnCzcKe
         LdYAj/C7CYz/3fxUGtLXBYiLFCFBU5pFuuBcH3NhI1FD1PX0d3pLSAFDNmyP8hIiP9DX
         Vj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817790; x=1783422590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cRwU7NFBu34DY6s465Lfdt9hITXAUx02A/eU0OKwDn8=;
        b=PCaZSr1CbfkYQdydMZ9hnXh7RRiYN325DqLxtYDFm6j+4VgAeBoAXrM2mze1IKobo7
         D4KAPp6uYR6iet1KzX2moFcX/h9gMp2TrMR23nBb81bp0Zcwg4Ghb+lhSaFPFJo1fwRt
         dUGNK/2BZHdWI2B491z1GpG+hjA4pUcnTXjsiLwQ8S/6+06aueeGsgu9iQ39tdDd4OTJ
         eylc/iIXKTJ3i9HVzFgLnQZX6PLaeDpvlimpxmnmZFs3c0Al1sPphqoVoTuBQYSFyqiP
         yATKHAcyPk7Ce51+u3pLmnEwafE/2AVrT1obQriYsVOjKUFJMjf5QoCCajdEQpFEV4ok
         kZ4g==
X-Forwarded-Encrypted: i=1; AFNElJ/58rXFv59PaITxNRTMkCJ1n8CVMmYd7kwN497+7DVFmprUNKCVylwaRI6dSyT+4Q4cQdyDw2LNWlzS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhv67y2s2gS0M4cWZykPZCnf3fLqrjUgM72Swn9rz+Pb6PM9HO
	Cw/JZLEANQEGUE4SdRuALn5ZpF0v/8wl6pPGHjxumcWhaar7Shc72ngIaysFmXY7zwdgySF3fUs
	hU3u00zP2cCfx5khveRTXcBO//dhlxnys+2U2z0IEJTuSWsM3c5jLhTISdRrMHM8k
X-Gm-Gg: AfdE7clCcXkfeAaZbk0TMUbJSfRcfVbjwdg2pPz0fXCF+B7hKy/172fc9ZXrOSM0hzT
	sRHQ6zRHyRmOjhk7V2gjT8rbLoQgfypMZUNq9aY+FxOKkqHO/YuCN0IW4RvE5SCbVR9pM5s4cxz
	xpzfhSlplhignpmuvc0ER7U4OdW5MO7t7Xn1nTXb20cM30YXSlPk6BPz6RCd7nNe29x0wEsgGDq
	7oY3h6YIUN/GGCBddhDPKOJtG9VQJ8OVh3tvr8i/MFVLMNRrqPgOn+n6Qm+auKHLzIwwh5HKG6V
	2ZFzXmWbx7O9m8BC7q9HcIFyOzsdhJ3mx4L6SYDyTKBuw/i/8/FjBwLkVdrXNvI9NZoQ2SYqfQR
	qMhCAWPGw1//0nmq3dkdfwraM5dliZkocMY0=
X-Received: by 2002:a05:622a:144b:b0:517:8999:6c50 with SMTP id d75a77b69052e-51c108c7170mr26921461cf.8.1782817789768;
        Tue, 30 Jun 2026 04:09:49 -0700 (PDT)
X-Received: by 2002:a05:622a:144b:b0:517:8999:6c50 with SMTP id d75a77b69052e-51c108c7170mr26921141cf.8.1782817789233;
        Tue, 30 Jun 2026 04:09:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cc89sm106550266b.36.2026.06.30.04.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:09:48 -0700 (PDT)
Message-ID: <c9f7b597-f083-4438-bf9b-a19e2f39436a@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 13:09:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add SDHC4 controller node
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        William Bright <william.bright@imd-tec.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ram Boukobza <ram@imd-tec.com>,
        Tendai Makumire <tendai.makumire@imd-tec.com>
References: <20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com>
 <e0731edc-81da-429a-a12e-a1d1b75f9544@linaro.org>
 <aig9licCxhtZbHMq@will-Legion-Slim-5-16APH8>
 <5a5cbf8f-07ef-419a-8d30-c1b0b2786312@linaro.org>
 <aik1ZYUT-cnpfdQn@will-Legion-Slim-5-16APH8>
 <00643a25-040a-4bec-8324-f52b30d84f9f@linaro.org>
 <aivHs6p28uN3d6TI@will-Legion-Slim-5-16APH8>
 <aca9bd93-9dff-4493-a1c4-daf9ba27aad6@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aca9bd93-9dff-4493-a1c4-daf9ba27aad6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwMiBTYWx0ZWRfX1vXSSRie8/u+
 iNft2ajtkTY0WZl7fUaeMywbTtWjzG9yLxaOM9tSrG/LkrBupnY9c5NlWOZc/Kn2L8qQ0/jyC39
 4LNh7WdiCh3A2GAUBzCyXkmcGowUpf8UOPc2G0tzWpWO/GywGkSQroYKFuaXqrDytvBPBlQ5f1r
 zSrwGUmtekRHhceKgyJ7sLaZRPCHiL/dqF2YejHBoqAxFjrP3S2kve5f0nX34br2Fl9/6btZUT1
 ZPDfJc5AFs0ihb6NcUQju73psUYm3phxp7mNWrPQvOuM4h313KhGpvHRrrgbuBPjqhq/BHBqwGy
 9Fk1LWSPyQ60hmTz1FGCCFtYMrEtNjEC78bhFvKk49D5X4VIlaB7X0zoZbICmITiyZtwmUljCJx
 iXMd/EIQ/Xj031fpQ2Jz0hZZNqK1p9UvobA9VY0vhvgy8yaR+jJrvOWMVQeHQBNmnDaUsXyatoz
 N1GfHYz4tRCr0ah/9DA==
X-Proofpoint-ORIG-GUID: IzwOBlAeM3vz2yDe5K6txvr8ZG8fYesK
X-Authority-Analysis: v=2.4 cv=JqbBas4C c=1 sm=1 tr=0 ts=6a43a3fe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gNcS5RXMAAAA:8 a=IaU93oFJTrkeP9POlkQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=VeqYHxXNbGx7SVBbL1V1:22
X-Proofpoint-GUID: IzwOBlAeM3vz2yDe5K6txvr8ZG8fYesK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwMiBTYWx0ZWRfX3JaVC1g1rFN7
 Rs41WO9b5s1duPAeL32nU/H2j023sB0JyTAIOJK0llouZGHdHLul2QTneBtO1NLGU6pX+b1mhim
 B8P1DN9YYN1mkH0Jl5dvKUJACtz4xWg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300102

On 6/12/26 11:11 AM, Vladimir Zapolskiy wrote:
> On 6/12/26 11:47, William Bright wrote:
>> On Thu, Jun 11, 2026 at 10:48:34AM +0300, Vladimir Zapolskiy wrote:
>>> Looks like the SDHC driver behaves expectedly then. For me it's hard to say
>>> what may be the rootcause, I believe the lower bus frequency should be fine,
>>> so it sounds like a hardware issue, but could it be PCB/board specific one?
>>>
>>> If you find a chance to copy the SDHC driver (and its small dependencies)
>>> from Android and test it on your board, and if it also fails, then it might
>>> be well concluded that something is wrong with hardware, still it won't be
>>> quite convincing that the SoC SDHC is to blame here.
>>>
>>> Hope it helps.
>>>
>> My colleague Tendai (<tendai.makumire@imd-tec.com>) had the same issue
>> with dll-tuning failing in SDR50 when working on the downstream 5.15 msm
>> kernel [1].

I have a "feature table" and it says SM8550->SDC4->DLL [Y/N] -> No

no wonder it fails the tuning if it's not present (or that's at least
my interpretation of this doc..)

There's some notes about the frequency being limited to 75 MHz in
SDR50 and to 37.5 in DDR50.

The supported modes are DS, HS, SDR12, SDR25, SDR50 and DDR50 (with
the caveat above).

Konrad
