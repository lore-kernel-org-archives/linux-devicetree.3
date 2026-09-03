Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF52367B79
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 09:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426988; cv=none; b=NZPs8Jn/5IHBP54voPq8XeorARklAjRLpSF5yGNVk57ke76iOE6TZGgR/IqZmFHv/H+MB/gr4KU/3XFdlGIz9gNOiYOX5MjsSLSM2RqjFPIozryKKOimt+qIV9Y3fckydZxL/nxkQyUpjKrXQvDYPHPnNoBNFsubW1dWxbEAuRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426988; c=relaxed/simple;
	bh=EOzit4ePQalFdhj1u9LWkuxLUtPDhNk9uR8Y3CbHhOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=exTqyHBb3UpzLAO+3Jkd8xZXMy3lUa3/SojNueC28nQOw9E2pDOj/HqqxLxznd/l6iiASmcJUM1gOg27lM+j/+fC/DcICmnTtumgK5HFXBQopvVuoNfj2ubOvp73whsgqLeJU1iO7e5/cwXkUbySSAsbJfcAS1+GlQ6jAafxpZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DX/VigvI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZF1c6q+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DX/VigvI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZF1c6q+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6839248n764050
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 09:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s6CA3LvUMgf0CwPU1omfs/ySoc6PX9EgIo/ZHobgyq8=; b=DX/VigvIrJ1c3uQ2
	bVW6Hdoxjfca3hhtERWJ+reIwguqN1Pu4Tq9mdarPgjG65zPdknlUbo9vU+l5in5
	eZluYcfew1Dpo/MpwbbFS2YCGjbb/RePVyO20JKr8Olzr7OW7c3K9X9pjPPIn19Z
	7jnnhqkQZ/aMFyReQvRHWp8zJyeVYClI+IcVhBRYXwepM3dpmQB5QbA/cqy9aRHY
	dB8kScArQWj+pN0UbDyD9kyCp7zXgMpa5Qlxn15z8EQh8jEBs8Do0d1ev34Ds10o
	OcOXt8wIPllDcgbKFPG2vzJy7/QmaVBRcBdjzRzk5k+oXR7ihYI15YnUFXgL+Za8
	eKjd4w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdnbhjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 09:16:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93821883e26so54826685a.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 02:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788426985; x=1789031785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s6CA3LvUMgf0CwPU1omfs/ySoc6PX9EgIo/ZHobgyq8=;
        b=iZF1c6q+uPyPKIppdVfeaVaLnuGogfKTPmI0U4Sd9x9ifYztaAbKg/wZWyNqxbn3Jn
         arvzkgSLZmrmi1VdN7bV24bwx3awbWrjJ//XfuNMXzgCTFs9qRNFQAcSoV+eOuc6jf2g
         GYvl1Y94+wPvJkegoXhf8dj/rZarE/H3CrJZiq9wxmj2GBUe5dtjuucJBFtw5/vhSOgW
         NEK6T8qLaivIUtrykjm+mnUQ68IxRbDQX8Uv5MZjmu3IWxVbqcnmMgTjULdVEUl+maxy
         ZcFXBj43V+/wbRBtUl9goa/h5hYY+8QqcGtfxuO30L96FubIcJ+epSuVaX3JcWwHfGDk
         5+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788426985; x=1789031785;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s6CA3LvUMgf0CwPU1omfs/ySoc6PX9EgIo/ZHobgyq8=;
        b=R/+Ey8DCMXpv5FM+N56DVBeL0G5U2g087OGSuRGIWHD1YebdZLWJINMa3hrECt5xun
         ZwEKv/3G2MwTcA0GUAZYrnsKzMRSRWpL5cWhA5GtJzvVBqhBpn6RSyqzrBDZuFaZGaDQ
         AQ9qfZivKRDpUsJDgCr4yBYQUVbu7POi4ir2T3WsFRTJgpjly5h2Jn4WINtyisLaeKZH
         /oxiG1CfYLnHShrKTOhRDL18RN9F5l8XrPW2+AdYwgkiQT65doZbNYS2l8tyZDyRcaxw
         tOx1S0LIWXJ81RAf0DM4o/DRZhCFEfOz67CTXXTbzs8l81ugiAhDiEMjdh7lLOKco1tV
         mzqg==
X-Forwarded-Encrypted: i=1; AKwUvBySokcpnOla2dgFAIQKJjMXW2OA94z29Oy0NHMxaPDb/TLLxrYm8RwHLidAccfcAaAKV652r3lvEE58@vger.kernel.org
X-Gm-Message-State: AFuF++l6HGqe3afpJQl9kDDl04pAfdGkjTNaISAf5N2wLVcDqruIJlxP
	lx7xMjgL/BMsb6Qa++E/s4TZpdMcvDSJA0B5EX3BWT2V7A3kyhkDGg+mtf1AZ/tpErmv+7DEVGy
	r9r9qk+OsJx69W3xU+kjehfbxdPggUf//+E7d02yo6RhLGMeC3jI8RfEsV/tBNu6q
X-Gm-Gg: AYBFou38gBmhkBkmzlyCCiEJ6+pHOMxFlBNYLqwv07r/+aCHsLAeAZ0Khvo9C9uETPp
	vspZAnN/8wPvlpcf4J5mHwBG1Ai7nVpFMD+8QUqv1aaR33Q0aS6ellIgYPBQ9/UGfp6qUrDKm3v
	9X96FSKZfVMzBGcq/kp9JFeINugpEkTSL9dvoiBT3bS4t5HfIJK2ZPwSFIzyQJjkaDrzagBw6GQ
	iQezJc3doOA4vLpRpnlc8J46JfwYxwcpMP8WVz+Lpr5FNadgLpoB/o/vZapU+1uO4zMOPpQr4dg
	SqFyKNMnUcqSOOWurL7iVoQfzfbQ73+6U9j8Mv25/xkrDFnsUre34Igw0uBq/R2q4chhKPSmBR1
	JqDXAGAIlVeT2+OaBEz9trw==
X-Received: by 2002:a05:620a:1729:b0:939:48c8:656 with SMTP id af79cd13be357-93960cc57ecmr824992885a.1.1788426985463;
        Thu, 03 Sep 2026 02:16:25 -0700 (PDT)
X-Received: by 2002:a05:620a:1729:b0:939:48c8:656 with SMTP id af79cd13be357-93960cc57ecmr824989485a.1.1788426984928;
        Thu, 03 Sep 2026 02:16:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41ebab0sm71905466b.47.2026.09.03.02.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:16:24 -0700 (PDT)
Message-ID: <182336df-b505-4ae4-901f-e09c0eae80ed@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:16:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] arm64: dts: qcom: x1-crd: Mark the EC reset gpio
 as reserved
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett
 <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-1-f4ab7e4bb75d@oss.qualcomm.com>
 <3f26bf2d-19de-4cc3-8af2-c26601da2576@oss.qualcomm.com>
 <ygyu3t7o2p2xvm3j5wrxp4svzo2rzymvzgod2szhz4z57elc7a@hznrw2e35oen>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ygyu3t7o2p2xvm3j5wrxp4svzo2rzymvzgod2szhz4z57elc7a@hznrw2e35oen>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a993aea cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=QOIhewo_p7yaGBQ4SdoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfXzpbkvik7vGTr
 M35AlUBc6b5nZBhSr/ZsoP7wZOCFaC3bsVi1JR85Uo2rHGQDifD4xz9j8laRJ+yrzsoQqYRziH6
 +ptTQZH5qmKGtU8ew58k4RlWTKeeTs0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfX7mGTDsCyBtWW
 14F48PIKd+2L0AmGBeizPOdtV7hEOEhjftTX/EyAlGf/HFjtC6y3t50u5K/lDL6fyIkkgiKiVaC
 7dJiGbAjM8Q2qDtvRaKVtyxgF5zl6ghUrYf1nMaNQE5JFWRbNIrPVXft+as0WaK2O1HlKrdSnOS
 ymj5GXsYAdmXUfSwMs0qT0GzA7WrqnjzFPoGq9u5uHBriAFNbnz+RfmbBMspiKKJKbwRSA4RqlS
 SF5EoSibQJw6j7Mz4r3kyldd/n34p9+HU8DQQSgRNxRhhYQNfXKkEq1+0rTQNmYzxh5ZOhrb3K3
 4o3orHmruI+PcPcmrie8SlhQFuQ3OHA4rMFcuLB+97C+HMyuy/Z1qTMbcXPVbcGygyOreL7Zwrk
 TLRGIYCwQJMFSOzlgQadGOF8rKBdfZnR+MkS6pkHCCcv5C4yA+jB8Gsoa7CSy72ll4DtN0Yt0Cw
 VWRQ72fJNC7IgE+3YmA==
X-Proofpoint-GUID: XDaENlZKZH3jrGNQ2Cl3AgseJjUX0obW
X-Proofpoint-ORIG-GUID: XDaENlZKZH3jrGNQ2Cl3AgseJjUX0obW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030080

On 9/3/26 10:34 AM, Abel Vesa wrote:
> On 26-09-02 17:53:23, Konrad Dybcio wrote:
>> On 9/1/26 10:06 AM, Abel Vesa wrote:
>>> GPIO 65 from TLMM is used by the embedded controller as its reset line.
>>>
>>> On some devices, toggling the embedded controller reset line makes the
>>> device not power up at all, unless the battery is unplugged.
>>
>> Have you confirmed that behavior on the CRD?
> 
> Toggling it does nothing observable.
> 
> However, the documentation says this GPIO is actually tied to EC reset.
> 
> I still think we should reserve it, just to be safe.
> 
> What do you think?

I believe that contradicts the reasoning you gave in the commit
message then..

Konrad
