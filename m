Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E6B368D4C
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 21:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790542943; cv=none; b=Qrs8H5Dce6kRQqLGifd7Ft4tP0++poQzNsvCWpp0apQNirPO/IkXoBosrAp+8Lty4kUHVkfjYc+bffV+5YBaqN90GUxYf7937YiD0tFPWL3SRdG3klpVW/4CBHSJz4/Gq/YYbP/ZoQimNtX6UtFuR2DGplkyEIe3ASigXCQnMSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790542943; c=relaxed/simple;
	bh=6MRmg7TJJKOuasZ7OvCb3k+fyx6Wxm+AQcUJedDC5Sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPW8oj7StpgYvasZY7W/C2y0vKIfcxaIkaO2kZwX+DPPbSffA7yaUqnOJo5biXNim1BADamoLEfvYDgqcSShkH0QYImEoGC81reNVTDxOPk7tgEYNBxZ3Jl5VhiQT4bgZ4VcZXaK8OiNOkWmWX4S1G3XMld4QfKL/Hilu0LPyOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WbJHK57V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GL99gx7s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WbJHK57V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GL99gx7s"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RHiP4r2496062
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 21:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A+GSdpW7yBfyGaRyjGVl+CKeobMIXZVKjl5ykqCPPeo=; b=WbJHK57VxFDCbeSW
	UlPYowC9ghazJ9CPI5Mqg0RUR3QeSJm3536wODZB8abuF786xdLH6myoOSP332/O
	2Knf3fSqIFcAd9SdPh+Y6mItvramFK+cLyALEdTcb8GCdk7bbNO+ZBuWSIb+ZmwW
	crnn3vR0v/r+wvT47/L9330m0TUHFb4vW7k5KmAXoNaq42JufPBMVDkkZPm8ND5V
	MekxDTFkZ3tUky/Dwyd4lEZ5ml3g58IFuI3rD8SJ0hj0wcPLs5vXFQ0XRixCe5dX
	h9UZW1zPHnn6xNbXCVs19D1V48r9Ulq681Ocdr/oGGSi2KhAEKLKQU0tyhC6vbg1
	Q74/fQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx6e83mbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 21:02:20 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9855e11e5b9so2449534241.3
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 14:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790542940; x=1791147740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A+GSdpW7yBfyGaRyjGVl+CKeobMIXZVKjl5ykqCPPeo=;
        b=GL99gx7sB+n9crj+gLU6diHLhrK06bAP90+jw8ncW0kahJQXzNnlZXMmuk71sOTqtU
         AAtVVnbBPzP92qsqcy8Bx+ixeFF+BWWH139geSa5gRV9czjyNuw0FIbfME3ooG92I50Y
         KUwC2h3Ok/9x47DSCsJID4qwUBMDc4cag2g16aT4xvtc+NGta3kPGN9DFh4R7kXKgbg4
         BCng0jENx0HLVIu6bI+9KpS7+wyRwOQUzOkvFZsdUw3au1GCsGSz3S9c2vm0KsZ8ORLK
         dptq9/d8OwgjjphxVbVK97dfCZ+oCCkjXaEVMCO7/bh2jsYhN9ykJc8QdodZXaaro5M7
         XksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790542940; x=1791147740;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A+GSdpW7yBfyGaRyjGVl+CKeobMIXZVKjl5ykqCPPeo=;
        b=mUKvMWBGk7aDmi0mEmwl3fjYqmpT5sn67h3DwbqrhcanRUNjV+dxS3xUIYPeim+0ED
         17S63tLgZfR9TPEz9+7/gL0pw6vBrEWdQ/FodgKVO7A5Tid03dKZ8wv1Iog9kw78UKx3
         LpO7FsL/dckjxTEB/0713/C9HNTa8HXwquXxbsjQQDKKiS/RC+NfJHdKSWfrC4CItPlc
         O4rLIwfmMZROBJoWiE+iNVv+z6titJKacU+WzzoRm0pJfqmc7YAhdOzk5SGEBFj9lAP/
         3FKw1LUrXSfhx/bXBxO7pIfmWHprmJ0YziABrSEEcK/l2zBKqPrOH9OAjA1ahs7zg2Li
         SaqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxK8H3NsaNyWigzZxb5lP7ce7MngaZUP2SQtFXdJ+VX3dE7B4skyam5Ouc9Xf0aWfaYgGUhWDUBgZkm@vger.kernel.org
X-Gm-Message-State: AFq9FYLhbctCY7XGVnA9podtLjRw2bkNSKT/F3afODRPPnhEpM5q0l5O
	4gx93xsFuASJAmSUBKo792vufsucEux+8m8V2aRGH9LiU5zgw50EO1YQqjVm0JoqHxgGhqvOh6j
	FvKY/lkTDzQcf1t35+GAgz0OnD5eNLCte7zTTpR2C1PY3e+qls4bE5J04NtKjs9Vu
X-Gm-Gg: AYBFou3ZxcTZLHN+8jYqUO85Gz8dSrZdsyZK10PyBFOKi7dG/sLDL6Ur9pWTQpIcr+X
	iFf6DvC85jMXj/E24Play54lRx4Y/20KDTFr47Q0r+LL8rdEoTwSsETrg0RtbXp6B8Es61F0xLY
	emKqeQGmzpkbsVfmtQPdkfg05G8gxxwocET4oKLtBj5RwqHuJgkvcgTA7Lh7o5MObLFG3QLsfa2
	Y+TRaYsrKb0Z8ZTpX0LAMOZFUd2kPcCIn8L+VmFkRlRZYtxASt5bTZ/EKXEMBcppTJwys/ycmVG
	RsMyQBE9IWtkRbhvi11Zs7eJdkMsGaM2cBS57tH4UDLv8IV9oHHupfxQtF9S1bTu9pbsRzGSdRO
	0v2FOog6okix7uSnO0B+fpuNBYty/JiLGwYYOaDnme/jSJX7rNOzDh19cKeINTQ==
X-Received: by 2002:a05:6102:534a:b0:7a0:f7cc:5045 with SMTP id ada2fe7eead31-7af1be75fa3mr4656530137.9.1790542939826;
        Sun, 27 Sep 2026 14:02:19 -0700 (PDT)
X-Received: by 2002:a05:6102:534a:b0:7a0:f7cc:5045 with SMTP id ada2fe7eead31-7af1be75fa3mr4656514137.9.1790542939367;
        Sun, 27 Sep 2026 14:02:19 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a354c47sm23726209f8f.15.2026.09.27.14.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 14:02:18 -0700 (PDT)
Message-ID: <8b8f49c1-8d91-4808-9a51-5e02b3ad374f@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 23:02:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Add Renesas RZ/G3L TSU support
To: Biju Das <biju.das.jz@bp.renesas.com>,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260925061617.127349-1-biju.das.jz@bp.renesas.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260925061617.127349-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gbCUAXsQ0jjD_Xfc1tndErpiS54cr09_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA4MyBTYWx0ZWRfX/xMnCIb9Kmnv
 4jt65n4vkwRZ62eNYmelIIdm+6X0KzWSNN+C14FzpOJYm0FE7hW5eO1scNZoyIl20zh9jjbEm8E
 /WvLw0Frivoc/pvyNOOSnDNjgHK5bV6BG5SSrmh/L0SnExM2Op//8MLRk5PdcDpIUq2zuojLXUE
 Uu+0qCFXklR5ShlnqdM2WJ9S4g4ylHrIEPlwVB5GeWfsYuSXs0nm6L7Wcht7hoINqV5Yxj5xyR/
 iMuobjMREunFIQZN2oNDgXfz9F3b4a4gwSvN+z7MEr6rP846xKUW/ci6xdf1TSJsgS7oeWqyLEC
 8s0hHey+AzAL014zBnyp8mrKwD39d6b+76mPWNKt/ZpOuU8/L9IUVmDZDwPmyIHblikYXXw1rBn
 QQ+IdQoTQNfUCf01izd0utLUm67+7RxLFzNHl4ZIC0L2pgddGMIJXUJeQbU4BO8Mmu2cWgMtwuy
 hBoMaJhdClImIw8BCFA==
X-Proofpoint-ORIG-GUID: gbCUAXsQ0jjD_Xfc1tndErpiS54cr09_
X-Authority-Analysis: v=2.4 cv=aIFlOr9m c=1 sm=1 tr=0 ts=6ab9845c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=7_ijgtP9sPRt2fg7aQMA:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA4MyBTYWx0ZWRfX0ZApzkVPiMJA
 Z3dBtlIm0izdCM6pw4pbwZST1PdY+YLHMd/4UpHLK1IIbUAMzVbF+TY+Srh7l5z35S2ZerNoqQ0
 67G1Yr3KwyQyxV4hc07AUB3a+Q8mebQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270083

On 9/25/26 08:15, Biju Das wrote:
> The Thermal sensor unit (a.k.a TSU) IP found on the RZ/G3L SoC is similar
> to the RZ/G3S, but it has different calibration constants. Moreover, the
> TSU is connected to A/D converter of TSU (a.k.a ADC1) on the RZ/G3L,
> whereas it is connected to ADC0 on the RZ/G3S.
> 
> Compared to ADC0, there are no A/D conversion result registers(ADCR0 to
> ADCR7) on the RZ/G3L, and the INTEN bits in the A/D converter interrupt
> control register(a.k.a ADINT)  are also different.
> 
> This patch series aims to add support for TSU along with ADC1.
> 
> Merge strategy:
>    * patch #1-#3 thermal subsystem

Applied, thanks

