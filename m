Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578771;
	b=CI6VHllIBSBfQa5Xx9mAVSciPIc4d2IA5otb6eB10xAPY9fpqhr32I+6oL0iKuivxwl2
	 HGuF3IuYNKrc3/PMhRHgQRCH+i/nd1iIf4MvbGbQwf+XSnk5HaeCBnJ1dBmACVbMBJGYO
	 sxN8OwuqiPiG+yF+qh+24cJmciWG3PJCl5/J0hhcqHKoXtIPp3DTpi3KAry6ZEYNJoT/I
	 fr8FZ2u+GPIIPp2ZldbozrRhaw+KeyY/k5+CrfdOKYzt+shmayd5FdTUPx4lC/LpPyfDu
	 0I6SRfNWBfLzUr9icxj6IvFrz3YI0DfBxiJ3dMqnl08MSD6/YAu7BgLBdX7Y9uhcXfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578771;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bN1/D5gJcuLuG/BXpkvhkO5R37Gw7h7tdNN2YmaIlgA=;
	b=yfYomvuuQ40qesm6IaEYoHCnd56q66t1sepKG3sU6Ev27xSP30h6wbyQGnyb0OdYk6rM
	 ATnZcONJPEZENVpGNT9mxZ1nHQwxoi5m9yqBK/jjvLoDuGzHPfRgkg1kfeK6QwO8J6VwG
	 b2CJFzSIevllc5q3RAWE6y3lCxTXqwX1rz7fUqlzho61v0uYdc9SG1vVhgFPc1XFJ1Z+w
	 RYf6SLVwOMuRAyPEXW6WTL1BskBorNK+wUwbg+KOK9MF51a7sncDGDDzduG53SkXBfL4q
	 nMpe0pCF/S/4cUVgRAQ+jOVMtSSQ1HF3Yu0B5PjGmAIe1pfrgDiER2q7iHj0bq89qeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J+Do3Tvz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="CcYiz/xE";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD9C606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBD9C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J+Do3Tvz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CcYiz/xE
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6FOQ3958634
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bN1/D5gJcuLuG/BXpkvhkO5R37Gw7h7tdNN2YmaIlgA=; b=J+Do3TvzRelo31wG
	CSr1OmhSqWh/F+mnq2lljzRjUJBo+QLUwOcYHmOKO1+d8QewmJIkURQt6WcQZNO8
	pSOPqI6aZx1XLJZNQ8mmNTIQgfyf61vLsIjRtpL6WklgQQ49P2Scy56Elvldss8T
	DbAUeWWsNxKQ5JVS4gfHBxffUZrHah9cgq8uDafvCIQYQ4ZEAyxnpAIU9d4Fsao7
	yKIeqEoPHSGSVi1A8JlhNdM/4kFXoVZQy0BIY//Bg9/huurKwx6CqUEXqNmBo862
	Lz8RFPvi1YiDoD46lykzngEClSoojubMSEx4wyVVUY9egnYVW1vJ2PXcgKWYyU5+
	Tq0bnw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0kfcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:32:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8a9cfe6so16153085a.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578769; x=1793183569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bN1/D5gJcuLuG/BXpkvhkO5R37Gw7h7tdNN2YmaIlgA=;
        b=CcYiz/xE4UWL6WMi6+A3sb0rwRrZqNsqMRNqKPDPW5tY0MK0X0f6N33XqIcHts1KPz
         mqWLCyJ9Wlva4Z3pN0kc1yxiIJTJPGr33ZYfiCCyQtowBZeaihFjyKUcLmmd7tL1vwgF
         OisKcE4lMAWHC6kR6MBM5hzAybn7fLTncRHbO1gRKrmxhTKQWYcmMFFKbqfIFAfh4ZPi
         H8FgLJjY52bY4GdrecPJZGqcWlLGDGJPJO9OD4it7xHCg+QNYnVub/xNw784hR42TW09
         M2dKFEMo8yJ7v394JbkdrRH4aAx6LTiQOoyZPE/0vf/1S9pAp/v1nLXwD3xRYrdzD/2x
         ntog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578769; x=1793183569;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bN1/D5gJcuLuG/BXpkvhkO5R37Gw7h7tdNN2YmaIlgA=;
        b=JPjaSLgWHCyXGdoCFPZcMjrBd4pzZyxjzpjxZq3CoF8H0fbQm6bVoHrT3/hWJY0cAR
         mo7Qs2SYvPVo8wHx14vAuat7Sp+Txk1gYT+vJ7OI5YepyY53i0mvyBKYy/2dJ6If4v4V
         YMf+bL32MLpkHcujymI+kEO3+fiEpduE65ptcEa/4RDlF7///Fc35g7OHxp7HnO7RKdL
         aK8osC13s+VineycGuhQBruBv+Xlcslu2H8RUfkjmCqO7r+70Dgua0VHbXgfVy2i4z5i
         ax/HhgIUWyJpYpS1IHaRCaFnx55Ry1uaSLJHJRyuzldO1CGj95/dgSdWHkMUAj/ytej1
         yo9w==
X-Forwarded-Encrypted: i=1; AKwUvByCHuMZ+dqJ0DvdwH66JgVpAJ57U3fxBWLReM/xINWU2hk/0/tYJP30D9wn5ufyqLl6HfpxphkgfXkX@vger.kernel.org
X-Gm-Message-State: AFq9FYI0MmWXs6RDDnZX/Q5VGa16Cbk63/bZJXXxfjmai4D9zfWwdwir
	vGpwz4fVYFu70wWgerHR02z9z7KbJ5bxsA5lGjda5WbtTusF9Kluv53deZYKpBgM/9FxAtlVgze
	yUBjeW48a/U0zWBEY9O4z87rxE5rx9813rXE4ZukxziVHp0yKIGglhUyoFYYwlWZu
X-Gm-Gg: AYBFou3T6dKcplhxL+SMcoRd1lyafBx60adf0kvJjnCXLoO3rGp/L4v3wxvTNpvqQrr
	iFywHKzdKQS43jjL7XqpQUc5U8yRhfvkKb2DfRvKO/X4ih/QH/rKTUmDqYK+3AEG1o3iABwSVjS
	Mz4ZGdFzaJ6ySp9KOGTZwVPCat0yg8oncY5IUvFIROWuS5BHfBiAK5pnRWml6T57JJIvu33Xows
	GGz9HFvoU5uymPv9bXIVNbHPPCGVUBDGeCaMeYcMt5Mcwkuo/xRV2tQSgCKBBaVOglXwyU6tdQa
	jcRpdQ8qO3BVZfBgMpQwMAN32cFVLaS6rARoRBk/5vYasI5FRgxR/Z7jB7K2gFq+R9VKpZnXgxM
	8vQ+8vw+zhEKsVk+psDdjDQ==
X-Received: by 2002:a05:620a:6087:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f57f5510emr410245285a.4.1792578768840;
        Wed, 21 Oct 2026 03:32:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6087:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f57f5510emr410242285a.4.1792578768327;
        Wed, 21 Oct 2026 03:32:48 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4031306f7sm671030a12.25.2026.10.21.03.32.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:32:47 -0700 (PDT)
Message-ID: <d5d28d79-474a-40bf-b511-e20fb0897b91@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:32:45 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/2] arm64: dts: qcom: Add a minimal Xiaomi Warsaw
 description
To: Zhang Jiaxi <Z1529105815@outlook.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261016-b4-warsaw-minimal-usb2-v2-0-1b03496396b4@outlook.com>
 <20261016-b4-warsaw-minimal-usb2-v2-2-1b03496396b4@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-b4-warsaw-minimal-usb2-v2-2-1b03496396b4@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfXyF3c2aVLHhCf
 WD7zbMYDZ7qwjsghlotjE+FDh1VKnxPpzrNoJ+H1O4wLRTHIie7dw8ekKkQhgR/gFnKDxff1s+U
 B+n1c8Wlzsmnb0/eyAqGubYdF8CdNriPi12pMS5+ELjbU5o7wv/P4DYP0rrXWvjsv+twFmOAb3x
 4ls3aAqxxnKPCjvxoRWsl4qow8FaASwnUkRftrBvYYBVhh7vRRlq5o386b1y8AjqAkjUtDgtp/a
 IZy8iOqlfikX1Fdr7Qgi9YL7fcL1e5dq1/THi3gAKFao4PgjEexIC1ZTJNd3Ht0SHli6ZTqlqlm
 46/UxSmlUvLq+AVGYvxBuqbubE5m9TCxd31uV29iNcz+1jqc+VvGJ+04968+mKMaQonrBmkH8+O
 XZ46ONF9j0FHXZVglfUroLYwD+fPbAKYCoLCRqEGtZ6oM4eEUdMOGOub6yOAQLPV6VbCWl2+kiM
 SfNqqonzXZCwdOrftRg==
X-Proofpoint-ORIG-GUID: 0srNeBXmfco09h14nlZKj59ZtJh89olb
X-Proofpoint-GUID: 0srNeBXmfco09h14nlZKj59ZtJh89olb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX0bgVDy49OfVQ
 s79+E4zid1lLc9VJ79BJrXrufA/roCoQ1aag6kthMWEp+yzfI4BtRYTUtV2J2I7SB+PcxaxACBo
 Huc83IhAls2XosawmIVb6uW7iGwlSw4=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad894d1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=cNoKYFeJyS4W4/1HdvzxLidmn8o=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8
 a=ApGinhq3U5Fw_ERVFb8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210041

On 10/16/26 5:53 PM, Zhang Jiaxi wrote:
> From: Jiaxi Zhang <z1529105815@outlook.com>
> 
> Add the Warsaw board identity, reference clocks, PM8550/PMK8550
> devices, key wiring and inherited debug UART route. Describe the board
> from the SoC and PMIC includes instead of inheriting all MTP devices.

[...]

> +	model = "Xiaomi Warsaw";

Google suggests that's "REDMI K90 Ultra", we usually put marketing
names in the model field

[...]

> +&qupv3_1 {
> +	status = "okay";
> +};
> +
> +&uart7 {
> +	status = "okay";
> +};

This node (and apps_rsc below) is out of alphabetical sorting order,
please touch that up:

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

> +
> +&tlmm {
> +	/* GPIOs reserved by the Warsaw firmware. */
> +	gpio-reserved-ranges = <36 4>, <48 4>, <74 1>;

Do we know what they correspond do? It's commongly NFC eSE, FP
scanner etc. If you do, please add a comment like the one in
glymur-crd.dtsi

[...]

> +&spmi_bus {
> +	#address-cells = <2>;
> +	#size-cells = <0>;
> +
> +	pmic@7 {

#include "pmih0108-kaanapali.dtsi" instead

[...]

> +&usb {
> +	phys = <&usb_hsphy>;
> +	phy-names = "usb2-phy";
> +	dr_mode = "peripheral";
> +	maximum-speed = "high-speed";
> +	qcom,select-utmi-as-pipe-clk;
> +
> +	status = "okay";

No SuperSpeed / DP altmode on this one?

Konrad
