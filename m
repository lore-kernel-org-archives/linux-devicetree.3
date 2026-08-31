Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57A23C3F59
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160669; cv=none; b=YF18CIg/FcNp+n8ZVj64OSCgute5kMHYYm+imjd3SqPrt/sG/gSTyO/HJYFznPmPCexdzaH0m9717u5eSYFtDv/1ZdoaYtx5F+by4coRdMEDMwKRn2e39q4SE9mFct0SGQ+Yi7lnxM+eQ+EvVVJ7q0HSro/RCKCoAR5DehCgeXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160669; c=relaxed/simple;
	bh=No3arZkb7GS9BUfPj5yGniRYgwn15bXy2rIPMwW8mSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UN7BogzchOWXFPJaZBWWgThpwcrTHV9KL8v1k5hdMEbOudSA9z7hgq1j3A/L52recAI/CX3PNKNRxEcScG8x9pL7VlK+/wwi7lveNJCzL1NWgGAEY3KixQA+Ls/iu/7QTmxPbxt7qjfLlRBo/yMhCm59Y1uJ7IO281x2UUlpQt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PATFg+ob; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iibC0QGG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PATFg+ob";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iibC0QGG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52p2J2522792
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	794VzWlX7I18XqBnq0FNJYi5numZyllg0oZt0/y/SIw=; b=PATFg+oblYm0y8tv
	2rQyngQZfdh9buU8BgGsGB5pTM2ORc4rmPaTBIiMGHMMGlZ84bXO89R4BFqHjcR9
	7iM50IBkmAqpBRGYJkFU9Hia4zlauRGpKUhJW78EQ3Itvsgx9MF/HVCDtwkRWCyD
	7k4u9ZAV+DiGE57vPCdDaFzHMu/gYf/YUVQXUGp3CYq6m2TdyWdFyXPBwADjmOv2
	ylE7MJ2mNTMg+CIXuBLtzJem0xhUumnni47ePizj6h7y52cv8Sm14l8GmGUXBkBR
	mA+OA72dT28Fr8/g7lYplxITDng3ywrOpIRnQ62ghZIQl51I+AW82mVLb5EfwXxF
	4yhf4g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7w9dkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:17:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e8a6a2e5cso1242056d6.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 00:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788160666; x=1788765466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=794VzWlX7I18XqBnq0FNJYi5numZyllg0oZt0/y/SIw=;
        b=iibC0QGGFok5YtIVLv9VQEN0tmRwAmZ3joFHpx/XhVLuWItjkC/LOGZ5rlOZabcW+j
         NHqwMpApWSZcdrVDiSc1vs6+Ik+sWCCjTffRVSwmZrcUOZ1D31+EZjGqo/tcAaJmh3mC
         mRm2ro3aNWcT8NFvPxmxi1O7vvwreVASyjzhY0Jpjigc7TUUyGmo1Tb4QJN8ivqlxdtC
         hw1Iniq+2sLJQ7t6feOQMmSZz4LsGa7jGjNJFsiy1yl8hjK0Dd6IoVICO9EdQq+G9aF1
         TiOS2JGEZkU3jEkHp9xEsdcJ998ytp9xyx6w4GtNgqrxD1AM7dnNHd5Qs92r7m/oGgLU
         pJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788160666; x=1788765466;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=794VzWlX7I18XqBnq0FNJYi5numZyllg0oZt0/y/SIw=;
        b=YPqwnhfvSk5RMWOcztIPERz1XxVvNcSY0ykSmgeuzZeipBdpTgqTnJcCa+4yOQ5jxR
         klPrY6VVjKNnhmKCiagFvFwAZhgEpM22fD1ikPH0SqvbYAzhboVXkslVw8QVQN4bw1ds
         0igeIH/ZQqGXBdmTWDj92vkpU4aW/Pv7LcxCiaJRnQs+9ir6dPM1WZnHGzfUnGNrRCPe
         iY8+xQy33goCvKzZyCYkwivGN0spufo1CO+vS4Huw6YvyG5hJto3fJ4+QnKtdVo4f5O4
         ygdeAWYpT/Zml2bTxMpzVm92j6AKtP+UgKE53++WiRYDGpiTn5pVIoGy4cyd9KStH/Zi
         rCag==
X-Forwarded-Encrypted: i=1; AHgh+RpLZiYZgi3S/+QOtnWFN6lBlY2tEyIQjFBwyCmBqbKFBxasO3T53uNOAExl2tIsI9zre/VrP8Om01Qh@vger.kernel.org
X-Gm-Message-State: AFuF++liQuWU+YnNN5FySjKlAWZ4/QYb+5UDSFM8FbuAI346Fchwn0xR
	zJq8KRiEL5NgMYUimEi3WonraktvBoerEmHn/WSlr5T/zRHDqIhkS/rwDkElvXpjQY77EMitPAE
	GNA68Yjr/BAprRrEvlEIfcaOg1oqTIoyccPXow+Uj0fZ77OOjc4MbEJ2f9EoeM3iH
X-Gm-Gg: AR+sD12I5nkpYuVVBzywulCgQh5wrC1Ni+daCxF88/RwciJqUSqx++g5/wkuzaRFCo7
	iNaHABJAQt0fPZf5Tsdkqyj4hlDYG40M+Rka9DTSEeeuRDNPkmhHSUzQ4mrVQyskxP4hiD4YDdg
	9rgXVlhHLKHBFQVsLvqV/p0RLbQV5509URfQFC0tkQHYPpPxrp9fC1yHNZ2r4sbNuCXHh6VFOh3
	leqEWnPENPfl5KWBf6WvziysQVw9o+wM4KpJIpWsPWHnbWvBmyNK7obxKislbggAbreQyqQsWYd
	pz99cV5Ecg4g/YO5EpNL9vGmbg5n+b0I26owR+QVnUipd7l+r+lGso8eF/7mQHdTy10nyGcgENV
	FPyhOfkUJkAWXgrV1A4Ciaw==
X-Received: by 2002:a05:620a:29d2:b0:939:288a:8a30 with SMTP id af79cd13be357-939288a8d25mr765030485a.6.1788160666010;
        Mon, 31 Aug 2026 00:17:46 -0700 (PDT)
X-Received: by 2002:a05:620a:29d2:b0:939:288a:8a30 with SMTP id af79cd13be357-939288a8d25mr765028685a.6.1788160665503;
        Mon, 31 Aug 2026 00:17:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f29a9dfsm398576666b.63.2026.08.31.00.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:17:44 -0700 (PDT)
Message-ID: <735301a5-3685-42ee-81c5-57c9a04af856@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:17:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
To: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
References: <20260829-glymur-send-v5-0-a11bdf6a4b66@oss.qualcomm.com>
 <20260829-glymur-send-v5-2-a11bdf6a4b66@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260829-glymur-send-v5-2-a11bdf6a4b66@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a952a9a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=UFs7FDn9XIzN9GNbEyIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MSBTYWx0ZWRfXwAePvhqw+t7s
 BpRID5FxMQYlkcqyzO+hWdTEgoO3b9+x8pjMuJQoOJ8TbmtYIdfJYVv6PpzR3uNclSRBah8NxHZ
 t/e2SVkJEQiDNeX0Y4yaIzzb5rk+oi0=
X-Proofpoint-ORIG-GUID: EBBuaCH9HzxgkOQRmtwfeqlBrT8OZnxh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MSBTYWx0ZWRfX+c4fDsko/weU
 WlhHI3a9DTyX5NFK7J3EeTRuSctJfmspc6s00QiHgWlUos885ay2muv/YdEu2Ffmwpsa0EdKX5C
 jhWjBsK0iowSSn858Cj9PPk4C6QUbVVAKdrZieeguny8ftdQGe4ACQDbxoQ92HH6hDAh68W5m7N
 tTvVdljakyTwQpy5hjgIPtMoMluGp84FjG59m6RF3OPmN5mOEi3iOMjrX1klY3zIUtNyCIN62I/
 9/67tNzV9JqkvQXy2PD1tau6cuD13ZjE5gUrBsialsfhQTbWDiTZNIV3TamLbHyEuxvpL5tH3wl
 l5Zz4RoauR6WsZaUP/iV+I7X8QdtT4iw1e2xUAIBNSUiJ4Q/uxH4N3NM6w3rum4u3Oj3kwFH8Bu
 YyEiQsSAfn/Jwvva54pV8/B7KJSBZLd6YbjIvaZSpcRjaeGiAxVP681osUBPMqArBmCRyUx5ElL
 CQ86BwbJrmvcZ0eh19g==
X-Proofpoint-GUID: EBBuaCH9HzxgkOQRmtwfeqlBrT8OZnxh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310061

On 8/29/26 9:08 PM, Jason Pettit wrote:
> Add board support for the HP EliteBook X G2q 14" Next Gen AI PC
> (product SKU C4JG0AV, board 8E91), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,elitebook-x-g2q" / "qcom,glymur" compatible.
> 
> Enabled by this device tree:
> 
>   - internal eDP panel (samsung,atna33xc20)
>   - 2x USB Type-C with DisplayPort alt-mode and USB
>   - chassis USB-A host port (usb_mp multiport controller)
>   - internal eUSB2 host with the Elan fingerprint reader
>   - NVMe SSD on PCIe5
>   - Wi-Fi and Bluetooth
>   - HID-over-I2C keyboard, touchpad, touchscreen; lid switch
>   - Adreno GPU and GMU (Freedreno GL on Mesa)
>   - audio playback and capture
>   - real-time clock
>   - compute DSP (cDSP)
> 
> The DisplayPort outputs need the Glymur DP PHY series at runtime. This
> device tree builds without it.
> 
> The chassis HDMI jack is removed in v5. It is driven from the usb_2
> combo PHY as a DisplayPort-only instance, and that path does not come up on
> Glymur. The same failure was reported against the already-merged Asus
> Zenbook A16 (UX3607OA), which describes its usb_2 combo PHY the same way. A
> fix is in progress but not yet available.

FWIW this paragraph would be better suited to go under the --- line
(the part that doesn't go into the git log), but it's fine

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
