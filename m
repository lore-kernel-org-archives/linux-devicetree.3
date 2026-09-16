Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD7A372ECD
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561801; cv=none; b=bCj6GHNC8hwuui3SU/lYFsrtPwyhFWTsidVAcq3FV637EMfXloX+iDL9fobRfx8PIwQMlkE3LWslbgZbZqo9m/B/QAsQQDfBDzYy9z7M40V3yq7TGujwFriTX2p5/Olm5Gt424W4W787gZui4dByNwPTn1v/LgpyRUctsnHg/JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561801; c=relaxed/simple;
	bh=VV/ZxcpkxyDx6mlCeBCzzhp0o6+5/SpiA7NzDJ1JKcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lSqPtgoxU8io6TO/lHxBAT507c3C9xHoMcB8tHHOeHvU7DK0jrkScu9M+v9464FK6no/e0UBEE9NRgrA5zDkaHFuP3qYpaAFxszXV+LZiRjKbAb/gSTl+M+ueZ7tSpkw0MeyD0LPjJtaKZUi6ITTUoAyls34u5FAApsHBL5SQ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dP707TW1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VY4kpfSo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dP707TW1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VY4kpfSo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92ghW2477689
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 12:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fy4R4SqF8jXijlVWnUPUTEknCsWxR9i03yH4i+tHqNA=; b=dP707TW1UpgrbwTA
	f85h4lARGOVSNaL6AoGJPaIGSa/dgvtY8P5biUxeEeGinIj7xvmq++s6M+NWSC2D
	nyCczuBCWqZ1Z+FV56f8gM503+f8YNRRyOz7GP+TTKFI3U2zMlx5tkSwU6RA61An
	RNHwkh5OmdWq56FmO+D47uqzpXmyfA4xXNpjYq98Aus1UJnp0afeCY2UiAcUQru/
	1VNaEY1IsmFufkTTeT99e+up2TSu1nmedOFyY50ckVf8HLqzlxlqb6+SGT1ymgvo
	PZMKossW3z+4YHyus9qFvyhHo9IeYxPgBYmugwzTMI3+i+zL4AQhQDrODl7Kj459
	Y1XZng==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjcktbbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 12:29:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9349ba88188so104567985a.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 05:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789561798; x=1790166598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fy4R4SqF8jXijlVWnUPUTEknCsWxR9i03yH4i+tHqNA=;
        b=VY4kpfSozyowKdF6LHrxHjwUZWwwxQcdmGU3nqq50rRlbkHkXgdk9tlfefZ3BwW6bk
         JxYJfpLWLDGYGkGx9ifYNDH600l88cbhzE2UwLD33tmS1lQWs1p5Pwyjuox33LjPcaSJ
         eH8kBlufBq7JBlCA+HF1gtBwe5A7kmCeC0HecCd6HKdYmWQ/JmXtUI4hi/dfOPP6/uEB
         NcOkxYKAO660gKSezGsyDftxRBruW58sGg/TXHgrqEU2MoqRvhxaNe6osSggUejCykCP
         GNQe78arA/8hdzbvlLxkLFjD+TunFtLJOLWHb1e4CbJgi2nymWtYwSlb8+LBo8k6VYWv
         RwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789561798; x=1790166598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fy4R4SqF8jXijlVWnUPUTEknCsWxR9i03yH4i+tHqNA=;
        b=DZf/BIMZuNEf5gDRoQaQWbFiMbxQSiRkXOvwJUR7CCGMVnyp6/BgH3I1TYmvkxFJBK
         HBBpz9BuZu5lHWXpuulij9nXG57ql1qbyDbMNL/dwTYJFYAg6aR9srSCLrUR1E6ofsZ2
         hp3xHIbwe+iZ93zPRB0gwWfGfrdHMdMQ1Tc/0YjeWbZ5P3/qBDovrMsfqIvQAM01oFBC
         L8Iw0YKXuvgfcco7PUACFagpy72gtC3/79IyEvxsVq3WcUIeykNuk5fD9iGo9OMQnZEX
         OXg/1IGj/PmXWTb1Osc9csBaBQ+2JUusA+KBW6tE1d53KogU2BaK3PAdtLQN6wE4IuM0
         QeXQ==
X-Forwarded-Encrypted: i=1; AKwUvBysiuMTvN1zPg+mSIIF7kU1bFyA97YKI63uDiz7O1CBbqeGz7DW5ya3x6safrIfV6nHh/XPfsyWnECD@vger.kernel.org
X-Gm-Message-State: AFuF++kX5G4FjqNlcooRgFbLbgJEXm1V48Xcp3EJ5d9hGJPPKqB5inW+
	vq90EUVma1jsdZDkmae91CEIATjvz4rcmY6uElEBT4zIo2ZovLBPR4ABdmWlw1ZMXhocEJjJ0sV
	eEn/Jtn2hZY+rPmx8e5eAh2wDDGnpMzBTo9k4pDWLeBza+VXY7i/9M6zWmfBqvYD7
X-Gm-Gg: AYBFou1J3DYKQYIwCqRwPN38Aw22GnLlvilJV2W6Ya/qxCeJQx1rNLnTKBcXHyRyMsQ
	UbGm82kh9sOUDP3MniRjqcqT4VTr6svbQ/aJx91M9RSH/UOpRyCksVcrqayR8d4FTNVt/ay5Ujq
	aG7Az6E8GEiaOwo6AOEGEgiqY6tsLUjHbqtJkfl5Q4IjKuBHUE2vMFFHljvF7h2+aXOF/l5Oj4s
	lAnjZKAZmrVpHuwm4zNQ57f8BLjPvg3wKEG2c9Hc8pPSGNtso06s7k2IKIeUlJo17p4ZG13lUiZ
	YwlEILaHsrDqMRc8dGpwUT7oD7KATPAYis4y2MELzQXUc5ro7n1PDTTYM8GyEdf8f22DdTCGYd2
	3j0vEnWjKpJo2Dg7oUgDhiA==
X-Received: by 2002:a05:620a:700a:b0:939:94c4:b799 with SMTP id af79cd13be357-93bb796fd75mr298860285a.5.1789561797859;
        Wed, 16 Sep 2026 05:29:57 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:939:94c4:b799 with SMTP id af79cd13be357-93bb796fd75mr298857285a.5.1789561797372;
        Wed, 16 Sep 2026 05:29:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de63a7c8sm128217466b.51.2026.09.16.05.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 05:29:56 -0700 (PDT)
Message-ID: <85d212d9-533f-461c-8af2-b8771a4c9b8d@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:29:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A14
 (UX3407NA)
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nicko van Someren <nicko@nicko.org>,
        Chris Pouliot <chris@pouliot.me>
References: <20260915-zenbook-dts-v2-0-41de8669a7a8@oss.qualcomm.com>
 <20260915-zenbook-dts-v2-2-41de8669a7a8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-zenbook-dts-v2-2-41de8669a7a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE2NiBTYWx0ZWRfX4RVWGsmgt5sR
 1BANvoWo4WAOlYAC9IbAwCdhmj2Y2Wkw7VVJ6ZRulECY+koNBU7Lv1QxP+F31w3GL5Zg6qMdrkG
 IgAo8RtJPi0c7ml0yN61f+canIRTczo=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa8bc6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=iJghmAGICTQdFqE060AA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: PiBISlgeZePIsrTBeD8FQmqdqmqHzcy4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE2NiBTYWx0ZWRfXylwp5k/F8tST
 olViubSfHhLFZV48SyU3AvgzEYmvYipFUypAqFN5HNh6N6G19frlKFlcmTRSqddVWITDYMqie8E
 REFB8+GaV6IATZeHdblgb1fe+LKLhbvWMm2QiYDzfXgK8qWN3PNtNt8juJTPgl8R4KfFecdYxiO
 pk03LWUccFsS5/mJewNqfDMCpSWyTJRK6/mAw36VA5rl8xrH9+fbV97bvqk5mzrocjGB0ajbAkN
 Qnkd4p9kxh0NQhS7Loi0qq3e5hNiMd2bII1RBHEGTLxfn/qhmdjHRPQdTMxF3DLLf0owsyxjq9m
 5vJY3egjcIH4zA0yBaHzMpbPbXbZJ3n9WxKpfkEFU1kdt0FgoK4aQATY8rPcoXE65IjL7wvKreU
 06EzikCFESbKGQGcN3D/8hbeiPSCucvxSqoME2pDTeXt0SASNoMjH3ASuH+CDmC48SR7Q7Ufm1g
 OQohJAX5mWgsByE8PEQ==
X-Proofpoint-GUID: PiBISlgeZePIsrTBeD8FQmqdqmqHzcy4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160166

On 9/16/26 3:54 AM, Bjorn Andersson wrote:
> UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
> Glymur platform. It comes with an 18-core X2 Elite SoC, 32GB DDR, and
> the other typical Glymur platform capabilities.
> 
> The Asus Zenbook uses &pcie3b for NVMe storage, the screen is WUXGA
> OLED, it has two USB Type-C ports, one USB Type-A, and one HDMI port.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
