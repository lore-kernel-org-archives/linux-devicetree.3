Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECC433BBA2
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520287; cv=none; b=TkN+kBrjPUy6I0TE6+I+ajhUqreV/TJgdIblzb3TxCiO8VuUfkqozG23mdr0uxD+cUm4xIFnpmmbas8OlcEiaCKX6gSU87Ee+DSq4f0ZJwWcZcOXhkB4LnlXQf/ZKdEG6YtkqpbL1Oe50QQEJrLtol8PMYuKDn+wa9iUGdqfdM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520287; c=relaxed/simple;
	bh=68/HTyHPR6KVGQpmVIWbzZT7PDEyrxaPs8vAVZF28lA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VrQUEOYZ88+6lkVpkypK2mY5URdFNsWLF/kiI+cGMNbRiXEyn1lCKZjMTkqFDG2xYPQUhxNblSI9FdBVtovEA0GvHbLtvEaYQr4LXEOsyM09B8/Wv67S0DwNkWo4aa77DEaVf7Z/3JA7lqlEasaSKNLHJjQ+Q7I1XymZVT1zpcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iwx9c5eh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EKxkDM40; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iwx9c5eh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EKxkDM40"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAMcS9268296
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3L1aoItvXKgSKcXjoUT8ZFQKPYF1tzuxSSufM8weEwQ=; b=Iwx9c5ehwf7NA5sY
	S2UVAgF9R04vz16jNYGptgnaZUIov2r5+bfxWaSSjZcRM5lQsgKkWv4mgcj1D/ro
	9LpOTTORjk1pB+ueUvI3S/0pdN2t6uJb2RngR/5EMYZvKz2/KDY48UvIqKuh9Xvz
	/2mpIep3hNp2XpiNoWqzWLBpvSwveu2V6R0mEQ7spq+py0B5/Lw7HbohEadhUenN
	DQp3hUUABbecLoTvqNDQuIWxIWwZs95FFpHdM/rS4/g5cKpAJoC2BztxYiNCQDVk
	pqdBYEGRvCahSEcVtNVAgZMbvzqRjNNT6Q0Vs9rU565iU7sxLvZIc14H+b7NfCke
	94Cwdg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wy045-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:44:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ccd9683350so13083486d6.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 03:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781520285; x=1782125085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3L1aoItvXKgSKcXjoUT8ZFQKPYF1tzuxSSufM8weEwQ=;
        b=EKxkDM40QleuoNB08yiIJfcycW7QhytnMlJv1NRJSbcihVGyu03CiTVPVbnde5Catx
         hS5KMu9kBJUqIlQFWzPge/tTWp4KVAHheuoXW+tvtNU31U6+U9diF3iuaPgP/bF2v9Sc
         lgI4p4T4FQRHW4JIZPgmmg2m6lfYxZJOXeFIY+9qKaipmBEHdL3AjJ7xDOMylIS5N6qe
         KLF/XVhjoq2oTL2R3j0lD5hL715SKAnLRev4RCdDVjFbopQMibRsNteR+252CqTP39id
         rATVkFHdJLhC+w5VxmTYeDYwLY00kqVpnMKELPnNx0sViHZQhLDENn00Ul3jx6s2wOja
         GLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520285; x=1782125085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3L1aoItvXKgSKcXjoUT8ZFQKPYF1tzuxSSufM8weEwQ=;
        b=nAeuWMC0r8OUC0RPAv9iAb9notnPPK9UQ3h+HwtHsgr1fQerdcOQW1gUjpjMJNYjja
         IW1cBTarWzOwodqHjmYFZOQO9o/a1MScx6Nh5bAyGd0LRZ437MfW1R35lnjAYzsrnzId
         TD/SSa8iMKU8nNuXJOqAGZer8yhQZxSg8srh0vii961x/S5TKcWdzTt/iWWe7WUZ4dMG
         KSphimMdGN4MYoDBxwsy67BxFwPa8HdPRNQ9WAyPiBLXGQB9yM2ffrIe38zBax7E6EwK
         THI4/rA8GlK0LVqXHjGPkLHe5FyCPl+lCu1mvF7U8dIV1tqAbdUA231428g4DC8DEcMI
         SbgA==
X-Forwarded-Encrypted: i=1; AFNElJ/qLX7JfE2fm0Q4Jhqs3eMwjZTLHOU0a5/X5XoDM7ihkBPXstf428W3F6FV51dVhdme4Jh16f3d8lYt@vger.kernel.org
X-Gm-Message-State: AOJu0YxO44yMqZsbA3GCjXkw7vzDNeYr41g6NZC/m9fUAlIDUhgabKLy
	6hgrfOev3atfY7k9MnuHd0qt/xBchJ757iB+UbvgKd83NOp41EmpfSxvnYVBwOwmL5942ePCR87
	aPrQVsSXOOGW1FvJ1dreI3+kVM7or6TSIVrgV+/LcwyGGfBmarFWoNlRN7oSqrgFj
X-Gm-Gg: Acq92OE1HsRDzwIui0yevQ+H+pAwYqjLkQ3/2exSE5EGI4dTqcAxi6RnR71xto7pAct
	AyqOJAvoIWT3lr1PEsG8V+GsXpiNNs5q4k28ERoOEf8cFgPTEldfRHxiGsjQrloJPMKcUmxmPAs
	am8dMBmyEdQqxh1D2/13LciFtOLuEFdYZr4N/pN7gIbfAsbPnMYAiOg3r/xzT4q1ahLO6j38awK
	4wT9MmkFRQOEaWFq4qHjgYmKDXS+VJYJG2cyIMn5R7FxCAvGTvaItwKaTKwUdXBFSVaCYXoUMeQ
	tP1fB23zPSuHq+ayUDPTx7plA6qlbYa65x+3RYMj+G5aViaDHfcXZB+LutF7f34pKkFRSYbemWi
	LPYYfAy1ZBaQMgyceGvnBhXs7T09yC5phRxgwDv6smICKYQ==
X-Received: by 2002:a05:620a:2892:b0:8f3:5988:f97c with SMTP id af79cd13be357-9161bc9eeabmr1256416185a.3.1781520284835;
        Mon, 15 Jun 2026 03:44:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2892:b0:8f3:5988:f97c with SMTP id af79cd13be357-9161bc9eeabmr1256412585a.3.1781520284254;
        Mon, 15 Jun 2026 03:44:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8341ba5sm444685566b.42.2026.06.15.03.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 03:44:43 -0700 (PDT)
Message-ID: <a51b6333-cd5a-4a38-b748-b6623c6a1078@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:44:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] phy: qcom-qusb2: Fix SM6115 init sequence
To: Iskren Chernev <me@iskren.info>, Konrad Dybcio <konradybcio@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <20260610-topic-8996_61x5_qusb2phy-v1-2-d7135980e78f@oss.qualcomm.com>
 <5b474af3-f651-4a64-a5b9-c18136e589eb@iskren.info>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5b474af3-f651-4a64-a5b9-c18136e589eb@iskren.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rhGA41sW8hWX0b8AXvlSjEMjHBDQbTNi
X-Proofpoint-GUID: rhGA41sW8hWX0b8AXvlSjEMjHBDQbTNi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDExMiBTYWx0ZWRfX7RFR2eOsLLO4
 aD1tQZDhhTZ3zAGx6TuVjVsX32ohYobt1GvK2c1yupFofbuv/kyN59AwGW+QtRAuUi+if+0FhC8
 TmwLLX+piViVF+N2mkM2UWNKnI3uWQs=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2fd79d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=H8nO66aeAAAA:8 a=sh5-wexBAAAA:20 a=EUspDBNiAAAA:8 a=MyJ6PO3ExZ6mTeW_YjAA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=29nWO70QIcuf0NxZitda:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDExMiBTYWx0ZWRfXz5YEUJnT4w4g
 Tz6tFsXBrV2XNTujfXe9YPdmhZLlIuRW6EOPBokxwNZMArfnsqCVdkusgn1BX2LhA+3jBsdrCiM
 Ns8oMqe30fdADIP69u+cq+Msg8qk1fbqXMhtwa9PYnFuz9uzWZAIp4JDgjMuem00B61wHD3AxBC
 DpGKEE/rxNCmoyXPDUZAZE8smZJeDx4N+d0yAuhzbHmYFb7hm2amwWpcYe/CJ0I6IE0ZopvSKa4
 NmBejI54/8DGhafWnfuKO+d9YiCI9/vcqnnZt9Bx7oY8vnpZhXhBQ2plHXvCKxK5RaZXnW3heEN
 kxepXTVW0SOVSz84f1tqFEwBSFBrmn5zVpScsJn9T/HwoGUyheSwjkV3hhVFW0z0V5IBcS9Kqgc
 gcL/9n5ekQUG4wwxyycA21CtmUrE/fnBG2nlCkFoPxJsq3qtpxEEe/csfgPB+Qr80BzdmH7ddCw
 +2TwF1ZdqMz3Pulmxqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150112

On 6/14/26 2:29 PM, Iskren Chernev wrote:
> 
> 
> On 6/10/26 3:04 PM, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> I don't know where the existing one came from, but it's apparently
>> wrong, according to both docs and a downstream DT [1]. Fix it up.
> 
> They came from DTB extracted from a running billie2 (OnePlus Nord N100):
> [1] https://mainlining.dev/wp-content/uploads/2021/02/03_dtbdump_Qualcomm_Technologies_Inc._Bengal_SoC.dts
> 
> The phone was bough early after launch, so it could have been wrong/updated later.

Good to see you're still around!

Looks like vendor tuning. I see that even the initial commit for
6115 had the init sequence I posted. And the OnePlus sources have
what seems like a project-specific local copy of the DTSI:

https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250/blob/oneplus/SM4250_Q_10.0/arch/arm64/boot/dts/vendor/qcom/bengal-usb.dtsi#L145
https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250/blob/oneplus/SM4250_Q_10.0/arch/arm64/boot/dts/vendor/20882/bengal-usb.dtsi#L148

To support that, we should add a new property to override the TUNEx
registers - like e.g. qcom,hstx-trim-value that's already consumed

Would you like to look into that, or should I take this?

Konrad
