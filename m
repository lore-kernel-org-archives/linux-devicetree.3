Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600399;
	b=EkzheE/qI2BgV5pZOl4UxEk763+A3saETwi0tkkb/Yyf4wK5zUBPk4Ysn6lnY95vzhk9
	 7l6FUFCUrMJVwGCl0kFzWqDDT0L33fwmLvS9YJJXR4vO1+KOI1zSaTi3UEmn9OvhMah1c
	 u5fkjBGPthkt78wrFJJCmD57r6KM07kzCSNe9v7qcRQVGqEspILsThTNEXxQY7NcGmgBv
	 D+R8Oen19epqy2JG+qPIpUALclIOUQnlgG0Fz+xly1OG8aPtbw2CeSW+rfu8VZzcev4Q+
	 XsPnUt3fjRapS6yOtRCnH/OCJ9zevqfI2KDnV47uPAY/s+bx5saKVxfo6DZiWnfQLqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600399;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B9V0PzERPQ/DZr9vQmTdOy6qbAlEsvFj55AbXqdY/4M=;
	b=0KM3GdU1L5Y4TlZpUxyl941r55g6JLt7EB/fjnCwHHcicNBX8NuV//CRm3FYE9fyraOi
	 o+ViG4I4qmVUBbcc04ym+AGUB8W128O49Yn0f1MB/cMTuRrUFenqFQ8J2NrrpcsACv7+w
	 cEG53tecMrAaR/Ado+kOt16jrwwgUI67SyKE/eQng/O0EtFxlK3oFralsn70mpsM0IrSK
	 7hwEzV+qwqSsWbjf6sSdSjwDAGE6s6NZzydXdsLYCELt4AnFsHZg1DtYT8XVoBiMTAUHg
	 cyuGpv/yiGS0vZSrVZvQ0akgBQX1AS3kafakr+d7c0nQ+E9AXA8DoQkrx13suddN4Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c90SPQ0D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7EbDZjP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3EA606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E3EA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c90SPQ0D;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7EbDZjP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mdUe796830
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B9V0PzERPQ/DZr9vQmTdOy6qbAlEsvFj55AbXqdY/4M=; b=c90SPQ0DmhnIfA3r
	fBrKNi5CwIVs9Q8Y8e8HNHuZfGGLUTD2ALfns6N3iIW/vOOtX7VuYnZj5H11z8CC
	zw6ViY0s1Px6n7wqZlubqL/Wa2dOIJhkuhnIyl7ZLROz+HFrWuJfYuH2oekxqtRj
	5ioWP54l+lu+gYEHXfKxwZy0SeDJnMPLAZa0I3GbdpXiseygAHC5tej/p5sLK6/E
	fS4s0bp7PoCZgum5wnkiAzhWNFtktcXCHYSYQrhgsQ3lz00vazOJPXSEu0MbdTIz
	yYBAEo5sJswRwCP/AUxrb+tlJS/RMRLWRDCrJ8BplFv50zlyUIwZFaeFKDypjQb2
	+sT2Iw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rt23q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:53:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94964828890so70288985a.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 01:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795600398; x=1796205198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B9V0PzERPQ/DZr9vQmTdOy6qbAlEsvFj55AbXqdY/4M=;
        b=R7EbDZjPGaEBase9KgRYE0IHmnWVQOwuCZ/YImwh36sGP4vesRKRgQCV9jtegfXoXn
         tdWHE9TPqkQK79g8jh+Ci9nxN4Yf36BtVPT4YtpkZHuaRzyPWhDLEyV5o+B4UdUxTW6a
         5uP6Ji5oEepSlVy7aZipzvFEWl5wagXuBI//5PK9zCgpk6tPtSe9dVzWSeH+s+3g//fv
         9Pr4oU6uLkAeGW5F2IlXJbrCl3RVyEgsY6tadBwv7lx2GBOgbOUgbW6AWzFSsqsEgDzY
         T5Vr9bBtWlApPl5F70Ttjnso1NmgXXe+6Lu3QmSUte2EVWLn/Fg5XujPp6ILAQGbDBey
         6zZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600398; x=1796205198;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9V0PzERPQ/DZr9vQmTdOy6qbAlEsvFj55AbXqdY/4M=;
        b=Q/rFkIPvLEExKshoi0KHjVYbQZNC/qZumA9I8ULjaYlVjjwgeqHaQ4kyhJ0KXY02QA
         jkckOeyGEFPuR4cekNZNFR6owrU6mbXlNuu1umyhBwhUjG7/2Pc8xajtVsETkjCN1r5d
         cbvB+jrB1nxxJfVXTFqBr68kTvBxL98V/D9/3/xOHEFH3Lc8ZQS1BGAhTyY5CnDIi0XQ
         r+FqKt0JeEq68JGrTLh1FUZi/ysMFAqmB75jA5IRA6jMRrXOGNMUKYhRyHNh+HLX9wSO
         +YU7GEp/AsGpkLkGvVALdNZgkUhG/4x+CktIhgnvyj6DL9jhEIT4Q9njKLVEcy2Mb0Cu
         0jow==
X-Forwarded-Encrypted: i=1; AL+hErGH1MEe9QKzw3po/x4FbiktzcFk9sBDnR48P2n7VsWIiV0k5BBRz7zmkLBKkdFJdHuHfPM1xC60al8W@vger.kernel.org
X-Gm-Message-State: APuU4Z+u/5qrw8wmbFBbvS9EUvazQWoYrlzlMsf7VY6p6Gb8ty85rnWH
	kiNBBgvnAx2n50kU+p8h+ilZnfBt4gf9JU8xmLOiA6cDz1CI4+R7Lqpc7JWJ5wEoThSSKiVbULt
	bdPm7qM7mjvWfQRD4Uvag2Ns5DyWRXOOR2b1sQ9g8VhY5vwLqozxM1BtR/OP8CaA8
X-Gm-Gg: AZFdTZdvlrvhHNofOf3c8nfAMkXJWGxRcJ3uX1LQEMRtQ73V1QggL4WxpdwbW6gSDN3
	yNoMaelN9kW3L8V4tjRfYtjlGf78CWcaYXbZbLhs4x6IKHRqzZ/BaWrQk2c4qHSWiwvAeqzEuJY
	iNNHW+HQbphTAcXTRV5ITmlgwdjRq05lWPmOrNiZFi4bFYKeot+5iAQ02IrIwct+RnWU7hKj9Ni
	1D7fAAT1/bIO80tEhjhG537yD/6ZKdLRekj6ExavCVuvgs3IyfmEcHHJqoBUSjoa5F/MspRQAly
	+AJLgXlcH6hYJrS2hOxeqQ6Tl3g+WVwIv/INzVifufITuQhBWmR7EgXbZMVq62B0eOZcNeIUi3m
	EOYMBUGwL120PoQN+7LRRAiDdgzv/5nbjVkYq1/DyEap3EGLYrkkDtEqWdYlxxjZ6HSCis+I=
X-Received: by 2002:a05:620a:6f8a:20b0:945:ede4:d247 with SMTP id af79cd13be357-949ba82824dmr2847963985a.1.1795600397704;
        Wed, 25 Nov 2026 01:53:17 -0800 (PST)
X-Received: by 2002:a05:620a:6f8a:20b0:945:ede4:d247 with SMTP id af79cd13be357-949ba82824dmr2847960185a.1.1795600397077;
        Wed, 25 Nov 2026 01:53:17 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68802sm622707866b.28.2026.11.25.01.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:53:16 -0800 (PST)
Message-ID: <30485a94-cc85-4c64-8593-a2218a3aa59d@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:53:13 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark cti_riscv device as failed
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20261116-disable_riscv_cti_for_shikra-v1-1-d7cc81f901e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-disable_riscv_cti_for_shikra-v1-1-d7cc81f901e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX/fRzOEbYoCzg
 vvSYrx0xlffpNlRe0EEVjTN/gmGyhYL1xa5XmjMRtd4wBdWQ47FCAJYFmBWJJND4uvX0mk/Ozji
 3Pb5urF2HppodC6AdrTg0I2uskxsf+WTbqj7qVQKJ+h+pEvhQM2bRv5OQ/E2Dkz3zAJhiupvObs
 VSI370QDxPIodOGcfvflSu3ggLOc0TjqPy/88Vt/77rtFZ5M6P1u0VhHOk025gYwTED5ANuQ5Cg
 /Vn79QYPDNPu8LypL3oURyRJDYMnyKfG5HBdgJcanuxhZccZlM0hn57yUIjOUawOPyW8nXQmcgl
 n+7L6toIfXmeI47p24utwACoZSKMj5JI4bq0p621eM6YmyvOX3w1ONUlFNHwNbODdAGMO1o6iQB
 qK8DIEhXWO5HRn2NVfMvZzmI67eWjU8h4of4c9W/+oI8Mh0Hogbkz/fd24xjGC4lb4wyVz8zhZ7
 F5psZvK4oUcHu9nfvTg==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06b00e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=K9kiO-SBJ6ozCPIvxsMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: i0nBDj0cjcN1-VaBciDHRANrypkzFIyo
X-Proofpoint-ORIG-GUID: i0nBDj0cjcN1-VaBciDHRANrypkzFIyo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX5J2gv6STasbQ
 agxDUqf5xBIKGXm+RzmlIgaGiN3C7UbK/XeAwy26/Wje1FXJvR3Zq85RhrooBfqtMW9NWyX6+xT
 8Y9kcoemnnHe/N+uBGE0qdlRHHet0x4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038

On 11/16/26 12:03 PM, Jie Gan wrote:
> The cti_riscv device is suspected to have a clock vote issue on the
> KVM enabled path, which causes the device to crash during bootup. Mark
> the node with status = "fail" for now to avoid the crash.
> 
> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

That would mean Gunyah is enabling some clock that the TZ itself isn't,
which would be solveable through a clock driver patch. Do we have more
details here?

Konrad

>  arch/arm64/boot/dts/qcom/shikra.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 0a95ad5a5582..5f5a786fbd2c 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -3996,6 +3996,7 @@ cti@982b000 {
>  			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
>  			clock-names = "apb_pclk";
>  			label = "cti_riscv";
> +			status = "fail";
>  		};
>  
>  		tpdm@9860000 {
> 
> ---
> base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
> change-id: 20261116-disable_riscv_cti_for_shikra-574ac8895dea
> 
> Best regards,
