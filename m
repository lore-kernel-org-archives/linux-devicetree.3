Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E676B2DA749
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058168; cv=none; b=fxK5m2v/qnFQWSY/2Nc1+i2qvlztHfYuKPaQ2mL0b1hYE90BwVNL81BiNaA3LquV8xRZrHhiIQUrAGortPYae27buAatj7Br2hpl/p475BiMUGc//RmIbpMYXFx2bsxrEWYOxmF+Zx8xFiH+HerJ/j/x5u5kk8+kotvHvwi81to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058168; c=relaxed/simple;
	bh=rHI1hDvc2Vp6XEjc9t737k+B0Ytm+7+QTB1UZSJPJt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KrmZncTC2yLkiW7v7X7crtJ1fdRejYNxkLrw53Ua37DXIOJ4Okdpvdt5c+AlQalJ0hE1cImxvKXUrnjbVdMmE0Tp3pTiK1xSNFCu/pgpgf9jS1uwpiLzoFxrKKeOpctmv5HTnwTO6Zm68fBSSHK3ISgsqANvfWpLyvcuHZmpkBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mgb4fQGO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XWUpncwh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mgb4fQGO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XWUpncwh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABWi0068516
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cNikD0teKMGEVTly7biL7qUvgCtvS9pd20AXWsYAtEc=; b=Mgb4fQGOg1UtuBKq
	DcbauUH7WsVw0DjXCmRgWGZbVzz7bZlXs5kbka0EHP53K1kv5XnDFTL1c13bHWfk
	g+QhGj0BdO3L66KVFHB/+eH90vPrjhPI8uQDUGDlbiB8PGJf4CkwoAcoZvaTgMVn
	QunMDQ1dvJYGhJ6bBUCv+wBHEhanC6cWyPbAIt2xe9axlUckf7G3/EGJmQ5OHycZ
	sEt4pcWSoLUB8UeGVjN3ihU6oKyCujzDY+iPpBbKzYEnZkf0H5rP/biEvpeOA4GM
	92ukX/D08rOl0++knKm7yQsz5Dm91MulmZPYXk7rIQIpaaTu4emqOHuYt8r3KhLq
	uHt0sA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4f5pt9gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:02:45 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-756fd28d906so134296137.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 06:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787058165; x=1787662965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cNikD0teKMGEVTly7biL7qUvgCtvS9pd20AXWsYAtEc=;
        b=XWUpncwhPsuWG8vHuxRbh0nW9Z3yJ9Yg7PYBpeyeDJBsK59/0Seh2rNycw+TgASFV3
         wHsHRe41+BSAemOsMKMzahIlYRL9WWa8wM/MqXjxl4KHzUanx9IlNNlWquqnQjrs2Igv
         pte0fqhdtJIZLh7euZ1q/TxVUJI6AjmmmhY6l8/QubQtR07APp11eYox+V2obWqnWBgt
         8zC4vlQg1Ubm70CM7A7fBMQyYPuyQFgDIWSTnHq3sUoMUVHY1y9zaiKekg3fKOyCrU0F
         HFyJeKYcCMoh/c/4hQxeJJObnJajUKjgU5xWpcU3hrP/6PNo+Q/qmnj4Tvf15QKaVhQv
         C8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787058165; x=1787662965;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cNikD0teKMGEVTly7biL7qUvgCtvS9pd20AXWsYAtEc=;
        b=UxAjYI6DJ420LGgLDouFyh6jeHp3qC+kk1l+6L2xTtbmxbmeDUtgQxVcn+WiKQPNVq
         UG0X8jl1JIQ8WLDs/7OHPjWH0nvNvnBa7pMkjastlbflBubH4rT71Mp0f8XimYA6fbon
         PJFGaZ2scGtveTAOc5USzmJi3iOCerJ3u41cttSG8IgefeVcUGB7GX+J03KiAGLitWMm
         B+ouCmlBxw3AUGo7ZNqezHhr2kDFpiPJ+8ETvwg1MACvzeY/NR4MYWzSmqH0sfjbC0gO
         TP+h4cJK5elrBv+5cQ5lCDF44x4bbRk8GZgVzIc+lsJA7vT6FBGtu9yNa+ohxT1t1HPa
         lgQg==
X-Forwarded-Encrypted: i=1; AHgh+RqrqSbimBAuVdDn/RBZAtS76t2cLHMpEPwRU/2RmBo6h+3SGFGM+mb2b6BfxW/LYCgw/PWL69dXn69o@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4G4ok+Wp+hAIQuWrW888UqYbIOLeZXD3ALTiqqJhsaUIS6NR5
	3unKOex8aoYzdeknITQSlLSMArTThqvM4V5P+GOK8SgtHLsE0/D/5TsrQc+hjbDSHkWjLe3HCDd
	boPgL6siy8gQ1huZHGq101nb8FvWp+5STYZpINmmIpGuMcUJwTA9pnGtpyJ89M7GNgJQW0/U2
X-Gm-Gg: AR+sD13pnexW9GRPDQdDEDY6hGPVc3s/9XnVSYZ599SgK58qDFVUgnnDeWIYTjrSBbb
	7+MiZiSBcE2/DLcgaM5mpW9abAMAPDIPFxHmro4vU6VOq65BuYfCUvymHyZefjhN7A63BtPOQlm
	YrRjgCAH+NXGHxOxgHhbIqveZITEMTmaJzcE7NRB17/bsKI08X7UkzvTPCy4jOLlaCO5yT8aK6y
	3p3yl17VFhhaj/gjO1K2tqUFeW9eWx+H57Yxkp9+TwqqoZ0XwxyaBuY3s++IaVZQBIUCTT8QbIM
	PJZmuY6GOQt3ITq7EEUFwRUDWvE++x3x1/KigwVwivkgBsRwYgZPbpCNyh5n8Mr35C/5Y0nVAHG
	GZ767rOqexNufRNOFDHiEW0qo
X-Received: by 2002:ac5:c888:0:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5c591991adbmr1898597e0c.0.1787058164872;
        Tue, 18 Aug 2026 06:02:44 -0700 (PDT)
X-Received: by 2002:ac5:c888:0:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5c591991adbmr1898567e0c.0.1787058164503;
        Tue, 18 Aug 2026 06:02:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46d00c8f2sm1201214e87.68.2026.08.18.06.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 06:02:42 -0700 (PDT)
Message-ID: <2deee675-e82b-4822-a43d-4264ca8cd512@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 15:02:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco: add PMIC PON with power key
To: Milosz Wasilewski <milosz.wasilewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260814152610.2039318-1-milosz.wasilewski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814152610.2039318-1-milosz.wasilewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+/pBosP c=1 sm=1 tr=0 ts=6a8457f5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=m06SbfB4c-ITf_5klgAA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: zK0UUUsuR3IiVjb3e4F6uuqb2NpNob_d
X-Proofpoint-ORIG-GUID: zK0UUUsuR3IiVjb3e4F6uuqb2NpNob_d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5NiBTYWx0ZWRfX3vjHdYAvyAqt
 QSEx3G9kAYYNx8Eh7vXgoVP98RD//hV+opb/blnf4/Hc2Lq2dQGJ6YxxjhzkGARL9+OBtMJCGuS
 TfqR4gnkEVvxkDLDE+4GriMLrmVciA3CcIzzodmEpBSCpKCwhZQMbDXtA5Lnq5YEfVUEPXDBqDg
 1RbiTV53/n9r8iandM2UjeJH42ONSplwRHk89v2tJ7V2/bNXalejzVTzIFnEwXqTkLXIxVdLNBT
 fn+k8xizbgjlQQeAWvLJhQXwmAx0IPNuGXmU1NWHm4aQcOyAOcXEmDFCmzynzApgVLBvT2/0nMg
 N272bB3pC3xnBaR0fWATjA3GEDejR+ODEuJC/rILM2BrKI45vF8+g1WabP1KKx6+htViwkgYV7y
 74IOsnPzpvJkoT6GrZtquPdJ5Jka6Z6Y3kM1HWfW8Q48UH9kcLgQWPAgrbBEQRg2pjfbArWS6ZC
 gKWGc0ZMsOlxXUfmn4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5NiBTYWx0ZWRfX7TV0I40w7PCy
 xEZwhWLtFIhiiK63noP9c4Gv5lP5671Yo8RnDSk9qcMgcNwNpVLBSPIdDm64/vWFRDqMuo+ycCd
 ClyBcyk1lXc426cqqsCpjZVIkg2hxeM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180096

On 8/14/26 5:26 PM, Milosz Wasilewski wrote:
> Monaco has no PMIC PON node, so the power key is not described at all
> and there is no pwrkey input device.  More importantly the board then
> has no power-key wakeup source: the only way out of s2idle is the RTC
> alarm or one of the PCIe/USB/remoteproc sources, and pressing the power
> button does nothing.
> 
> Add the PON node with the power key, modelled on the pmm8654au PON on
> lemans, which carries the same PMIC: the block lives at 0x1200 and its
> interrupts are on block 0x12.
> 
> qcom,pmk8350-pwrkey has wakeup_source_default set, so the driver arms
> the IRQ as a wakeup source without any additional DT property.
> 
> On an IQ-8275-EVK this gives a pmic_pwrkey input device under
> c440000.spmi:pmic@0:pon@1200, and:
> 
>   # grep pwrkey /sys/kernel/debug/wakeup_sources
>   c440000.spmi:pmic@0:pon@1200:pwrkey
> 
> "systemctl suspend" followed by a power-key press now resumes the board,
> where before it stayed in s2idle until an RTC alarm fired.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Milosz Wasilewski <milosz.wasilewski@oss.qualcomm.com>
> ---

There's a parallel effort:

https://lore.kernel.org/linux-arm-msm/20260724-b4-add_pwrkey_and_resin-v6-0-41acc214d93a@oss.qualcomm.com/

Konrad
