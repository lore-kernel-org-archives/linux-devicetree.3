Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164872F7F01
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 09:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637145; cv=none; b=KxmiG74/0+3GpAykeiliHaPXnZFd6iXdFNWsRBmrV49AKPlSV2wtbN8ukGCbal6MV79Piogkf7fbOw2CFFUXDKPFfcAgjBF1NHCCoUnY58eWZIIB6oDOhbsHVGAfRyr3/3xghv2jxCFpeN8UP7gM+A8oh6sTWDs0rimFXin5D0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637145; c=relaxed/simple;
	bh=wImfqcMzA2hutdV05gMXWCl9C8YAeHAtDEmm3ZgYq3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLbnHtGW6WBVb1n5HUh9PS4KknrSfeGJsRbiXEDRzlFix5i5bMTu7QhGWd/eGIecBJD8VNXiUNfv10KrXkADWNWDDtmL43syWWU98k71v+n7uWF4rTosQEG5NoUQ9ctDkRyBTJUqZ0lMECZu6Bk88UBXuUrFgM8NJYlfRLqBrzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGTIZaW4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPGl4TuS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGTIZaW4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPGl4TuS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60J2g3702385
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 09:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bCa418cMIIQpTdgZsvi2uq+5J8yQEDdEU8Wb0WT9txw=; b=MGTIZaW4ENReRMGz
	JfeWV7Ui92RrfyLqfNhCV83iFmUM9jq44MvA5pZ4wpOREoKyAQVUUoQjPyRYDVLo
	rZ0+AfsnxlOvk7w7Cll0TQrgkjQsysSWWGfqqGh6lJvN+XrglAGl1lhEc4TCjWDh
	B9kb6+JG9jTa0aNrGymM4mRTV+KgZKNx96pvK2MK/eZaM6pb/C0buw2lCj1ayCX+
	dNHv4ya5PCHXrJ7Yss+Xj02VbPRtZEqVX33taoHi5iPT1/AnNWTkBmQ2Yt+5m6yi
	wo+gqVgN9/+sU30n2iOAt7elaoFGfYFNIR7SlxLj6QjTbh6xqghMv27JDlq8G3hk
	Bg2H6w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uc9efd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 09:25:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a18b457bcso15268485a.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789637137; x=1790241937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bCa418cMIIQpTdgZsvi2uq+5J8yQEDdEU8Wb0WT9txw=;
        b=BPGl4TuSm1k1xwdhTXVybM3J4Zhq8h1ADqje01j6gai3K5VDflOXMFMpi6TVO+NGBq
         MwtbRxcpvvm2COzm7lPF8ZSGqCHBy4uEfzJl4HwXZOzQsHoBHglrC/aYpAGgMgJVs2lR
         1hcX4BLrVMvOAE41DS4mXbU/+gX9Ca1wseUgPMAfl6lecLrO4PC+eyXhpOVY6LLfdBQ+
         /TO1hEa4a8UNRS0o47bTSvYidnC28eolG6A5rtyDfFi0Ha4qoxC03gsbR+C+u36G1K6+
         Y1HUCrV/cnEHPumgNsecDBYIiuSoyGEJDgDncIXZ5eXzIZuFJb01JyHvT3NYE/pTog4j
         XWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789637137; x=1790241937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bCa418cMIIQpTdgZsvi2uq+5J8yQEDdEU8Wb0WT9txw=;
        b=XI0L+EUIEL1NKurBYEm7b3LNzPEAXW7xQ5jO7xlNaAe1pCCarbpiIR3jwui0VpJcgs
         RPRYHSA5P7Nzatoyr606jQQuYnS9klCI8TzJpuhR9z9Nk3BEw8y3FyLSAdi7TpzxADP3
         f0fjC1ZMaZwc3XJPRj/DjZiP9qF4eNYUjeigtG0Fqw7AOLiawRxHhvXLD2ycpo5mJLXn
         HKyDgXoX+10hCK7urvtIU3M/LpsDfUzlfvzBBAwJxMfJvr63vND/updx6xZ8N/0c886B
         LJaKSvIc+jfaok7rz+bgoUGLD7vCLe0vIhtj8Zx1n0dEEDdEIX08GNcnPDTZE/I1x5Mg
         pBpg==
X-Forwarded-Encrypted: i=1; AKwUvBzz3F1BU5cFifwInNPjqsfhjSQ62A2Ce0o8aZGEV/ars5uq5Vm2kgaucndet0oGLksI/RKCbzfWIBFg@vger.kernel.org
X-Gm-Message-State: AFuF++ll5uAYuRvq8XC4f55czVJRRTem5qYOCb1o+HOhgFyKGxIgBqde
	uC1ScFrps/NcYEyZg22S4khHmRJldnqlUNZ5wfo9fP9UtsvEk4bH9mlsHG7xwOWnTAkYDEdm/4C
	p09xPASEPmxYyvgztPs1gdZF3jFwABR5bu1/F3aRDToZvyJ4p1PEUoTQmRfRs6Al1
X-Gm-Gg: AYBFou0ECSboZM9L58tW11V2SohBKP1rd6brLE1+Yr67bFoVQIcqDMP2EQzVqKDOjIv
	GnqjpyeEoJtH1k/Ytog131FsHoC4PzqHr/pQDDNeMRK6uxRMzymot1fsQaRzo1v3vWmjzoqgJZ5
	WBq7hzbzgpu1xRzfzuhXV5AOs19AkeTLmXT2t76xBprPQIkW89tUtdWgXlorksdUtkPYWEaFukf
	2dp5QpAjaNNA4MJSgrAjXNsiruTBgNY69k9UQbgZkMH4iJzwAtruMCFNH/UEitu3ohpyTipNmlQ
	9zomVM2TpocBBJxaAuLnIUAaYfqAm2youRTZhaNQ/uwU4I4UF5Z0g26rzGdRjCNrqcdm4qVgkk+
	xRHGumQFhElQwhxjy4nFM4g==
X-Received: by 2002:a05:620a:6502:b0:931:23a:83ca with SMTP id af79cd13be357-93bd3dfe95cmr24674985a.4.1789637137463;
        Thu, 17 Sep 2026 02:25:37 -0700 (PDT)
X-Received: by 2002:a05:620a:6502:b0:931:23a:83ca with SMTP id af79cd13be357-93bd3dfe95cmr24672985a.4.1789637137049;
        Thu, 17 Sep 2026 02:25:37 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de4879f1sm268554966b.32.2026.09.17.02.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 02:25:35 -0700 (PDT)
Message-ID: <848a64de-c120-4f61-be03-181d4df92ad6@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 11:25:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695
 haptics
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com>
 <20260914-aw8695_haptic_fp4_driver-v1-3-156f7549149a@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-aw8695_haptic_fp4_driver-v1-3-156f7549149a@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEyOSBTYWx0ZWRfX7bfWGRaC40q1
 xZdilV9xN8nzlJ064z07YgN5N5aCxfzrHPp4a5mIbTPR2ovN6OI5nwz8DgPalutx0Enb7b2E0zf
 SxJrTUoKXtkQaHhDGGMud8knimVz6a0oLqSULVIdUJTK1qkTweynbt/SaqvMz4GNbACO1Iivlfx
 w+sEBRVlxP4arX2ylvvNWYJMosqQXwWJ2y0OM+nVjOE+pP/nnfvpfWBBNCawAHnrc7UMCNZ3n4A
 /QClJCW+r5020BMLT2eKlDakoy5rBHeL+vfCvTdoPqwChclYDVo85/VN7UsuEq6XGes8HcI1bO3
 byNNa9+cz7XUpBDjP5bS9ifkaBjNWeOTIXa0j6pzR1V4aIbEbIXaMWyRo1fQCm8lZL6RKtOtvTB
 pjK13fSBjDkX9tAAMxiWgq2UmFrC0hRygr2CQ/B9/aCPqd0a2VIjkiCRQHCzx1oGhSUwUyYFOur
 EAHc1pa6+R7flBjdZJw==
X-Proofpoint-GUID: T59zc1Ah4pYHpbAG0lNCO5KljSoxFiZN
X-Proofpoint-ORIG-GUID: T59zc1Ah4pYHpbAG0lNCO5KljSoxFiZN
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aabb212 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=aHkRhLIturER-sMqCjoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEyOSBTYWx0ZWRfX+//24O0jP8zA
 nrPCOZWSI+t+1KcdDU2EpIvejnpjhwxG/lqZ69cjHu5Fz74+V+yLymtgFQMTuuYV6fE0uW1eT/C
 2uCfZkHW4LhF0Hb85FBkLRpxJjbvwYA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170129

On 9/14/26 4:37 PM, Griffin Kroah-Hartman wrote:
> From: Luca Weiss <luca.weiss@fairphone.com>
> 
> Add a node for the haptics driver found on the phone.
> 
> Co-developed-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

[...]

> +	aw8695_int_default: aw8695-int-default-state {
> +		pins = "gpio85";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	aw8695_reset_default: aw8695-reset-default-state {
> +		pins = "gpio90";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;

Shouldn't this be a pull-up if the reset is active-low?

Konrad
