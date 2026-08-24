Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D4742CB1E
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579210; cv=none; b=Ja9Fu3OxteLymGHUnuK41gix3XJOccyHqWDMaycDgg7Xw21QUg5/v89nLTc2PCnFo7DI6ar3ysIsUTfEO6XcMtXA8Zsq+HKhYSb2PvRO68X4fk+qpjrGNSy9qTpnZG5zZ9dV5GGcDOCrkKJWNfqJKWPV3Kvn6tBMzJH9h74zLbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579210; c=relaxed/simple;
	bh=u7ptXGg46h20+ycS2XTm1WSVKz2gZ9zCx+Gra8HyM2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZTE+rOK37qD9D/VZ8MaTgR0gC4m3yequ2yf5AqrrixxtdRl9l8fuuZOb/tXxNXjBeWj2bJXXGujkP3uxzIQnBYZIptzxo3EPTwG80qi/Tt2Qx38dp+dGXruC3x6YIwIVuZAQ75dvz8QBd0mpSMVqdomu8DMT0rOTZE52XSliku0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsyQI/ZG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b3hDpFi+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsyQI/ZG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b3hDpFi+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCv9pe2584220
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nns8MPtsNp7ny0utoj3zguksz33o1lq3WNM38Fnh1Kg=; b=UsyQI/ZG0RP0lXB2
	C/BDMVKmfhmKljREkvaPmhueQWqkkcO8zS0r/DVK25iHTlV1/o9EM+L78j5Is/Sk
	I/FjcrsnsIino7G3J9hSvjvNSGbey78jL03naR2/PpBLg5fA4DDhzITqQftU4iwa
	uzNK0Ta6emu6QSAc/jUunr6aJzzjb4g4Ja6gEjzGurYg9jioCndfMWrWUhwAUqnE
	cET/sAfYE7HGe4rzjLBY2xZ55FvOtdftGbv5xzx5ZBMAWQfBbe59+OYeRAuXcuFO
	79FGzq5LMEozefIuQegxGqz7o7gq/LaAXRoVcGraIxsY71+JZfS1IfPDYyhjfxFi
	hKZEEg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hbthmwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:46:41 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7530aaa7212so105944137.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787579201; x=1788184001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nns8MPtsNp7ny0utoj3zguksz33o1lq3WNM38Fnh1Kg=;
        b=b3hDpFi+PQ9CHD+UBmF/iaoWvXrwdfZelEFPxwOe9ceEsR8jUsMEjMB3DzN+AgOij3
         uNO0baQYRT9jcETW+wYjtb9Qys9yvSyceGDnDMiW2AfSbs26aVZ2Q8kFf00JTTMRPxIw
         q5cBZ67w88+E3OXjoeFF5mEjvmiKcSkESPHEhehTzifTRboVAY1qwMsAIlwOQzRVdSNR
         /08sHL3HwFRf2btjGbrrh119DUO1I47iryEgp3Eu2DFTEHqkiyDim8KWPhhqxtIIEPKq
         pc9f9a9EBDmAuNOc0Ds4Xmwt884mPdzpWiPuYJFYQswkdBEO/c71d6PX/nne86GoqsOT
         MVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787579201; x=1788184001;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nns8MPtsNp7ny0utoj3zguksz33o1lq3WNM38Fnh1Kg=;
        b=cal86Y+i8LY5j17OI2wulOXZ0bNUwm3GXCuxM58gWfEBdCAqWAaNMzvnrr3xC6AzDH
         VuRL5NQR1EDVPUiTW4K6dZcxrw7QxEKg3iqm1aFvPtFPwPFIAEORnEzLNC37GNynXbuE
         Kr7IWzOdUl1YGN+OwMm92kciXWxS67L+BraMWabJKEg3A6/agdNxcSicd547b3RXXz4F
         1WtcJgTzazFmFpRl3KPXuEOt6ki651SxR2RonAZYmJASW1zvpjno32KWuZEpqfQEe82c
         84hNZau3ZVbYAWZM9nGkLQvczgx4+BTRKhp5pDbNOhV43vxKh0uM/xQK2beQTXY4VOow
         Ep7w==
X-Forwarded-Encrypted: i=1; AHgh+RpbufDjMPurNO2KDjp9vNWfklK3aXYk4Tk0KmMvGjdAwZftKYn3SL0Bda9yiRL0qbrzMXz2lsUhvxGv@vger.kernel.org
X-Gm-Message-State: AFuF++nkyICAjfHgqB5ZnGfG/nWnLfi260rdEkWdHcgWMF0JH3IL+VMv
	/QStr2ZrpXtHA1bWyk93xfV8IFcYiFzERgzWUItbX118Jzy/f+/2UAx5TaFFT7l7K4/Ib51jLhV
	lxPCBt21vv6NCLOzinFy1rphA+h5/luDTEB2kTO+Lz38j2Ra6JNPYsSvIUHcyo1XM
X-Gm-Gg: AR+sD10KBaaPshodfRISvslFZFpx5g9cTyYYM3sJ/fVxbzr+SUn+4rQHRuHHg6UR/xn
	XFaoZZgtr64JRIXQfMh2Aydb2TQ1RaqIMFDO6tiw/AapKWQ5Xd5aDml7+l10eDh+I1nDH34zRcK
	+52h4dH1aAyaDaRp5FtnHG0T38XKsplOnRvtzgtsD09KsV5g3Gq7018uXLBeRqrBNSiRYfqt7HC
	W66/9SpHJehUGV0WLW0sB2WvVkoyP/3feqHDRc78FTj/qZL4sTfNfy7iuoXsho9W8eqxgBgu8En
	ntt6IBSxuThrB091kUkAEEWL2VuUR2vaPGZjar413fiOcuCbQ8gPClWChtWMHQYNAy/pGgH0gKH
	5/Mbn2Dzn7FSXb0A0CnzomzKf
X-Received: by 2002:a05:6102:1594:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77a5f2e70b7mr3427927137.0.1787579200620;
        Mon, 24 Aug 2026 06:46:40 -0700 (PDT)
X-Received: by 2002:a05:6102:1594:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77a5f2e70b7mr3427912137.0.1787579200146;
        Mon, 24 Aug 2026 06:46:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e00108asm13140614a12.2.2026.08.24.06.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 06:46:39 -0700 (PDT)
Message-ID: <c3b857e7-3f23-40cc-9e6f-c69c7b368e1b@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:46:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] usb: misc: qcom_eud: add role-based EUD control
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen
 <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
 <20260811213610.2956147-7-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811213610.2956147-7-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfX7Eo7rLvcb+NG
 lazbAYKXqw4lQ2vcGJqQF/5M8fQWYVjEhfgLNcJLOjk6wBzyWQ7WY9vkuaGxnGeNcsjzGY+bKa/
 4gn6GwLRNOstE+cnwCyFF/HwIPIBiEmmZTFep3ltsEKePEv6Ij9pUBWDmXEZvw3RLdrqv7ewNtd
 0FeaY3Ap+NEwgYc4qgEYx76YA89PBwE3cpiXIIqanXBEn4YIoyQaOosgzYGf/MnXcwk2drvdPGu
 HPtMjl4ymPS3K4TU2AqnGhQt6PLqEHlXymzxmVPNAShLUHBIw0+3JJ4pb1byIFklKHVEZWwHlVX
 W7R8Mff3cwtZtb+FCFp1fcHomD83AXHADKKASEir8xdylGyX17UGmPDCGh1cA8O6CuK7CNkDvig
 sIv3m373okswLxZvvJpE6ks2oUDGeuNCApqPOqfOKYxfNDc0AFV23AL3vCk1RyUA3cT7Yvx9+n0
 TKNjlk/+sQlHflGRPDQ==
X-Authority-Analysis: v=2.4 cv=JL0LdcKb c=1 sm=1 tr=0 ts=6a8c4b41 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=X7E0pNrBJpJ0GBZA2WEA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfX4DNBXo6OotWB
 cRTiMs9XQvkvX3ibnilaubvPEIiceKCbmHINuSY30j6InTVdaqm52UqK7FhZjaGQAjcct41u5qR
 7R3tIteTKYkFTYW4nrbliu17j89MbL0=
X-Proofpoint-GUID: iwQD7lKT-gNS7QlwtxtU5T8uwFJ7Kase
X-Proofpoint-ORIG-GUID: iwQD7lKT-gNS7QlwtxtU5T8uwFJ7Kase
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240116

On 8/11/26 11:36 PM, Elson Serrao wrote:
> EUD functions by presenting itself as a USB device to the host PC and is
> therefore only applicable when the port operates in device role. Keeping
> EUD enabled in other roles provides no benefit and unnecessarily keeps
> the associated PHY resources enabled. Furthermore, enabling EUD in host
> role can cause the USB controller to misbehave because the EUD hub
> supports only a single upstream-facing port.
> 
> Address this by treating EUD as usable only in device role. The
> role-switch callback enables or disables EUD as the port enters or
> leaves device role. A sysfs enable request made outside device role is
> recorded and honored when the port subsequently switches to device role.
> 
> Reviewed-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
