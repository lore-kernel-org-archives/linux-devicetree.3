Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952B34418FC
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 15:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786982357; cv=none; b=a75964JHMKSeibg+4DfT/tqDRvok68SiGijGUuCy8PRoIlJbDCyMmj8V1eaWDtslZIj6yklilC4U68L/ccDyWUl/JNnCSEOr3SFDiSDlBP4cjFgaulgDTIfGwcaeaisG5OCQKvtGLiWiev2oohNfikPZtV9EuZHGr+ZLBg+oU0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786982357; c=relaxed/simple;
	bh=aaH9lbVuJj0q9BWXv+5Hkwn1QmGhneskXi8mbAoYU5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PrrextmEDlkPjBs9uqyB+9SpFRJ6588VLGu/1Nx1RVU8DGNOqdCm+J38vUwt0DSafvCf71WSsF4nLgvf4xk01Khod8ojeQv4Rc7/zs8hQfhLvhMQuqETvkHsyG5uc1dkZE54z1nfdEHYCti5giZDTFAQIH/WNvh/SQmzq+tJgss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IrcC47oC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DrOko72G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IrcC47oC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DrOko72G"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFYb383790476
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 15:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ACldy0aiVSHL8k6IBZhXMiInAvqs3SiE9+icRfANvIU=; b=IrcC47oCgczwrEfb
	ooUgjXIwljq4P96rWO2Noz1JZFvdyV1g5px+AImCT9D0glgVslNnjj3KAl7eBeoH
	RCEWKameg6JQF+lUJE/31LASyusw9zGQOcAH4o1JM4BmWu0pSM8XOajJpu0KnvZ3
	VJa/jjzjWUBBinjWXOevcpau47jXXHQh35AyMMJPWANFnGOkezLRIgKBX+1qm6h5
	7V6vsNHbS5W8fInJ7oM9kAWZQ4ilQF9wd4N6ZZNcrj6I5CS2d+oWq+9YAJ32PCxH
	+nTxibx6e8geu8a+tVK68JzQYpmHlF6AK+hTZshyQUnDa6aRGwKIF5a4i5yZxfIY
	iWDezw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y7ksn8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 15:59:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51e9d892f0dso10473121cf.2
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 08:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786982355; x=1787587155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACldy0aiVSHL8k6IBZhXMiInAvqs3SiE9+icRfANvIU=;
        b=DrOko72GfYuPgAN6Z3BT3OJfLHQ++xOD/2wQsuvTLVbCiFTZlM3GgpmDeTMhqRfrTv
         8/K0rd9XEH4xzI45c1rZMe7SHEqwo0vDffVstskWzDxKWHUZmka+rpzatI8Q0vR7rqAo
         bdRMLCBUBrRsUFmrbPSTdLVjCSx5ER01/3USJKjrK5rQbZevqvGerfEweRnS2b3yqVI3
         Q0sACQJvUFPz9dL/Jb8SRrsxZOVIR6aLiaMMECbGMiVkhpQDoD+NJgxXY6DYJzVd87Mc
         6vjFmodiCip+dqLvSKszh7qG//tsyTdQpIB+SlOTKukS6mnAx0ojEgLBzYPEdlJWeo4/
         5PKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786982355; x=1787587155;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACldy0aiVSHL8k6IBZhXMiInAvqs3SiE9+icRfANvIU=;
        b=IOr9FK/fUrgegA+r50RltzZ5tX+tR+UDgTTiSRtBQP8EuqiMZJRVFda1cmgfvJECPO
         y1GXWISGi6VJ7XRQSk4t9LmohyQ4m0GbjENo6r/7ufqn9oI9JL5BmvUcwv0jE/sfLeda
         3VO5wrptwhoJMA4nVwOxCgvuheMs+uK2uLzM775dTItVMjT8MPEVGi/rpGOgxJ7j3njK
         +o1k9CTD9XVfidXMN7WT2XVIIcmoX4JwRyRi1cw4o6mB/CWm1w2yLFCgKIPjuYxcBOfG
         DTGY7x5K1BiGvpQOWkquY03ISN3qETSHe2cz/4mbLk4krwzhgVMzf2gpXDpNdaghi+1D
         T/Cw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+i2Q3OzG34FcagpZHMMDVHDi4J/mFkE7yApzOceDmYhtR8AKr8Oemw1gC8SAOndssEWnzDUVlJk76@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3hy+hQ0XkvT76TH2m6/GsnJDLT5Be0WU0zu9MKQtiCjtXJURg
	+SJs02EDUka+fIgGtXERtKvxy7Vj3XASU2inH246txUBN0qOmU6u/f3ul5DwkVakerUJxGTo5Uu
	SWegB9W4cSatKNC3Mp+BJLzywg9dNYe2stloceVggGRxQ3hLhTlrOzHp9oAciww31
X-Gm-Gg: AR+sD113Cf9x9H5mKSgTS3KpBPWTZSA02cver3GGtZOoeO3uD8acJGwdX4k0faNGzCy
	8D+06qcAaDgTSmelixC02//Fs52A7T5a1Ef36d2UCCmSEt/g4LquCmOo40qpoO+2iJdWWdhx/F4
	XXnciAHYinlhV67V4bxIqPIeCtMewodvdrekT8WMy9W8aism+miQFhqOnDM0w0C/chTwd36WKlD
	r+lXYUvv4mcW+H2PJVDPAf8vXW0dk1GITK+OhZZ+S4rvTznfntFOpWMGvajd7ztlYMgLLzPKbBb
	rCg4gq3t7o82FFHMPo0ch09XzXqaZZ2jjV0ZxOX7wkGyiOFGr78DHa4ZKC3vbpZ1TFK9JGtrMYl
	Xb2KfsmY84umVxa2UjQK7ylnb
X-Received: by 2002:ac8:5fd1:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52d852d4f3dmr190512641cf.1.1786982354397;
        Mon, 17 Aug 2026 08:59:14 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52d852d4f3dmr190512041cf.1.1786982353825;
        Mon, 17 Aug 2026 08:59:13 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b74059sm45883166b.38.2026.08.17.08.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 08:59:13 -0700 (PDT)
Message-ID: <db394200-2a29-4f17-a2d9-61d5ab15df60@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 17:59:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: Add Motorola One
To: Adam Skladowski <a39.skl@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260810-next-patches-v1-0-79a779d76173@gmail.com>
 <20260810-next-patches-v1-3-79a779d76173@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-next-patches-v1-3-79a779d76173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mPpZEQ3dCEropQAz4Y33yj79qnCyg-Nl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEyMiBTYWx0ZWRfX0ElsWKl/mQXZ
 uh1M0xGLUbAh3RsayQthT5lWt3JHKliVBscoqQUV7fJajcSknVYT+dU7jBkNFGNvpppDzd+UALK
 mRGhZds+ZhrOVM0tDyGJxtzqapQUDKU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEyMiBTYWx0ZWRfX9Ef02kTdPRjx
 j1ibVAJFxhx8VIoYqELD0udYL2clCwnPO8B5W4c6DfceKK9tJxYQ7ufaCLts2NgYIibahuK0aEf
 zbUfMn2r/lf6lANutEW1wNoAjwQw8mBHR+CKBbw5U3KyWGBu+SJmU5tkemF5oz9VmzjtG1SGnT5
 U+ECehSWesXnZy3cGj2xZpN9RgWf3KQpstue33hGrrsHU3ST0MHsJjNfjpxKhKgrg/rxAS7Lnsh
 xX8UwsnbijHJxEM2UKWRSGhOFyK4t9IZ2XjOsBbdg1Fk5amt5PJ8tVvQ0wV4QkiNVLtVVx1aawY
 667n86uvd12htXLJM96zPMsHtENBYGIfWTaBRf+sbUqYz2ukF/F9vaXvrJzoJLShWNLoCTXIxzM
 mFLrFkAM64Ih24UUfTTIckjHpzmg0OLAHMG/DyW8VQ4s55umneNvrqBqP9TtHA51UxPl8tTjmKu
 EqKrOT/PCMs+5Z2uSUQ==
X-Authority-Analysis: v=2.4 cv=HYEkiCE8 c=1 sm=1 tr=0 ts=6a832fd3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=kDiaLF9t6-FkB4tI0JsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: mPpZEQ3dCEropQAz4Y33yj79qnCyg-Nl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170122

On 8/10/26 6:55 PM, Adam Skladowski wrote:
> Add a devicetree for the Motorola One smartphone, which is based
> on the Jacala/MSM8953 SoC.

[...]

> +&i2c_1 {
> +	status = "disabled";
> +
> +	typec-portc@22 {
> +		compatible = "fcs,fusb302";
> +		reg = <0x22>;
> +		interrupts-extended = <&tlmm 9 IRQ_TYPE_EDGE_RISING>;
> +
> +		status = "disabled";

Why are the bus and this chip disabled?

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <96 4>, <111 1>, <126 1>;

Preferably one a line with a best-effort set of comments describing
what these pins correspond to (see glymur-crd.dtsi)


> +
> +	disp_reset_n_active: disp-reset-n-active-state {
> +		pins = "gpio61";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +		output-high;

Drop output-foo from TLMM pins, the consumer driver should set the output
state via the GPIO APIs

Konrad
