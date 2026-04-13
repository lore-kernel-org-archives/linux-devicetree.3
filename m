Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8C2392815
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069241; cv=none; b=lAIUn1CfjfnkhGoOmBnu5TGlOi8Psr9Y7QctpH2ZevRomXxKe7vdoICB/ODTSa8TNk+1X70dSdGe2nt9L9JFfXKpqRgVMO15aUfh4ZxpFyqRZ567Ag4QLhjTuCYM/9KO4jAidr7vmiU/xVFs52L9XjZpEg+hxxU8AEd8XOSVYuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069241; c=relaxed/simple;
	bh=Vp/qnx/z2Eh83IcTjOE5i0msDDzO8eFXrBlxexR6NGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o62j9XTDlTT7eUowl8cZlTbIrHWLC+fE7uqVY461rk209KMP2vz/c4yF4n9zFF+3sjIXU4VF1e5cbVJ3L+wuxADrLbiQks6Hp6ifsWIRya6lNy4KIZZr9+p06zE7URiTF7pK5PkXx3H6iNyKSqPZIKTbLnS0k+9CemPQ73RBgfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/UgrM9S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEMz8afW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/UgrM9S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEMz8afW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5HZG73560579
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jmfro5oJ4k2txPZx60B7uc29WXlA0tTdgImnU1cMafc=; b=A/UgrM9SxPYh9x2+
	AE2iGBmTxC6YQaqdHyi15FH9R1U1YTk8w8f586RLcSABdW3h6PVMILCzncnz0AYa
	bKQyG8TxMlu+S5EAQSCdGVxKcVe+rEHIvECiPkVBcIMyjZBd/InMQadOPZ1dxB6I
	S21Y36nEN24KR9dGh17OMBAZSCx3YWd6GwMacmCTOl2I3XfVixuUbSiUA3ttJyQw
	aAIWGfLlasUS3wGL0FL9rxfTds3afMHbXMktQ7oMEGLxo68L63ASUUystDzljrqs
	gH2bCLO/gtoGR3i1x/eftBSvac5Mr4ZAUzxIuyU5kFLydJE6WjuunXbOLDMYDFYZ
	6UNZIg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0mdu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:33:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aca5b32b89so4542806d6.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 01:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776069239; x=1776674039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jmfro5oJ4k2txPZx60B7uc29WXlA0tTdgImnU1cMafc=;
        b=XEMz8afWwb5UWYHIWoO+GEnUcUDahMzpYSfEvT/GHhZwjJT3znYp4z77OzEcs3ZYMZ
         ObifIlUCNXJU8yDMybhJofOWyezJd2TRtTZf+HjcLnczbwhxoXPM2RFDiVohrXbK3ORa
         EC3qr2BtW0Hxg5+0aRdhDO0gyRV3HvsrObaviGUHTSXfszjACo5yEvsfERyjAPwgdrHL
         BZ5jmvV4jck1RusjyuqhK5pDDWM7MRLnY1KdBHT/mnOJ/ciLRw6EVTRRvGz8elXuN3Ni
         qxg+/9/RujP+1J+NXzGrzZoVf96u+udgXWeuY5nKpf1wkcvdmR6DUi4r1nB5hONr1kVH
         KjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776069239; x=1776674039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmfro5oJ4k2txPZx60B7uc29WXlA0tTdgImnU1cMafc=;
        b=N+FmGZ2aEAlxAidVgY8Xl/1d3ChDgHBKuTDcYSQWapgKkNFXCqbXA9K7sBCMCdJ4WJ
         Z12lZU74e9aOrEAEEKZd912SY+Um/qB3EpQzHId3dQQfsZw67/nbY/gmXdqLwBhI/Mcb
         RfZCmd6IJnX8oXYOfEHdL5H0b0+m585jI/pQiHj4shcQ4SbISwVgbDX0yfcAsDAlqXYr
         MPKvFPXN887GrXTHFHTp28CL0kY3Cs8UnRwKffSOmUqBu9/WSVPFIq7piiegFBVDwqDG
         4ySQgWc35wBaPkqDdKjSWqXRY3Xnfs/0MdgFdpwO+aFcKUAHokcOYW1V6vtDEl1xayGm
         f2UQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ob3LYkh2aCuRx8WaysU4bkbbLXXNm/HsewR6cfROh36EGP0majFSp9BGR2jYv+QwThpObow1V9k5W@vger.kernel.org
X-Gm-Message-State: AOJu0YxBoLMGh/Ja3j8MuTjICtGhqc/kpE8Q0QZe7MqDf4mkLM6+b2Vs
	LNCgP1EvOua+FxBf65ZxnnUbigwbllgTOd28XAUVeB2l6yQtZZLwBXWXohgJ8mZG9dvkDwSFqB0
	sszo787IjrgIQPfV4OwFrY6vDNEAKfT3+iXdueacdyH1tlpUTs38lyNEAVnE5iUDH
X-Gm-Gg: AeBDiev4HWJ8LTo/BAe9UFDc1gq//wBxfJOCu3bw8iT4FlzwxJcB6qoeAByJPq+RAhG
	a/7sfgxpf2b/9H7zCLJ5GP+vPaG0SXAyDhOTku3plFdbNyUhfhp8L3mAs21zKmK5TOOsrWJNQbJ
	uVDVmsgzjfZ5yeOGX+vXg/slyzhX9iMQhFI2xPkSgocczqgQdEn7j6X9c9brNUHGDriccxboDaw
	R1QVwKoXJhKrTHyaM7ZZjEc/CKKKfx2a7/8HygsjsnbQrgqbX0vSLQ8yGHfkbrlnkbebooWXP6V
	um/KrbkEZIQkmmpAhXMaGA+hc0puH+ARrTVN/3WsUXjVh5Q7jS8kQi6eczNlR0wiR0XbghjoPqS
	1waSLtrMqAYcmO5ortTAdImKKhQbL7SHkN6Ftk12TAG08Qh3HOULm2CEUQMsJBeM42eltmZnPCI
	R/S0A=
X-Received: by 2002:a05:6214:1c83:b0:89c:e075:9558 with SMTP id 6a1803df08f44-8ac861c0889mr146927576d6.3.1776069238674;
        Mon, 13 Apr 2026 01:33:58 -0700 (PDT)
X-Received: by 2002:a05:6214:1c83:b0:89c:e075:9558 with SMTP id 6a1803df08f44-8ac861c0889mr146927476d6.3.1776069238264;
        Mon, 13 Apr 2026 01:33:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd76b8sm291173766b.20.2026.04.13.01.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:33:57 -0700 (PDT)
Message-ID: <bb18fe25-0207-465c-a2e4-46b577f17725@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:33:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
To: Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <adyfWzVHsg3qo9cH@prism>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <adyfWzVHsg3qo9cH@prism>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dcaa77 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rioUKAgr9yKdZ4H-ZIkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4MSBTYWx0ZWRfX46owqPsiwmpP
 QWl+Gq5xw9zvBq9N8jRK+zcp7nw8dQqV8p+cvs9Cm/WLm3lrHzKeaqxWBBeh1qMXUpeTgHRuUkA
 YlQEIHVdnn38vLRBlO/aWRgLJPFzQaCYipEssFHo9DNSiUjumOvyjvP83vXdoGZ4iFA02ScI7xS
 1yYINDW15QyKNfdMDV9ChhJOI5oHpITibinzu1fW12pgLd2ke4I38R6P2E+NdDO7CWAN/OFVDBy
 VlzcfPTLmr1NkYD1DoVnG7oQk/iKWsIXnwC6D1kzDXdpRxNpnRR/LjVJteM+/bX3VlJg4SYc9oL
 u3k6sa43AxknGaMMRMfYy+xSYE4W/O9GvmDnMILZNV244v7QJ1+5qFseuDQZXD5gk0ek4Nn7D4n
 NMfdja9OcSkbDJbRw7bBo/B8+DN9SaqjvtjeOsuVoZ7AGjh//1VFCgVMxaxBzSDc8xjIMq2u6JJ
 Xz5Sg8IAjtZm/dQJspg==
X-Proofpoint-ORIG-GUID: E0g5_Mou8xV0xj54ADPlpdXVtDLNUJmT
X-Proofpoint-GUID: E0g5_Mou8xV0xj54ADPlpdXVtDLNUJmT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130081

On 4/13/26 9:52 AM, Alexander Koskovich wrote:
> On Tue, Mar 31, 2026 at 01:37:24PM +0300, Abel Vesa wrote:
>> The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
>> routed through an eUSB2 repeater provided by the PM7750BA PMIC.
>>
>> Describe the port and repeater, and enable the USB controller and PHYs.
>>
>> Also specify the ADSP firmware and enable the remoteproc.
>>
>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 83 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 83 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
>> index 90f629800cb0..c31f00e36eee 100644
>> --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
>> @@ -6,9 +6,12 @@
>>  /dts-v1/;
> ...
>>  
>> +&usb_hsphy {
>> +	vdd-supply = <&vreg_l2b>;
> 
> Shouldn't this be l7k? Looking at kera-usb.dtsi I see the vdd-supply for
> eusb2_phy0 as l7k. I don't see this being overriden by anything else
> downstream either.
> 
> Just bringing it up since I copied this part for another Eliza platform
> (USB 2 only) and USB failed until I fixed this supply.

Looking at some diagrams, L7K seems to be the right one indeed

Konrad
