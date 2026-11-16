Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810521;
	b=ncSWCu1C1CK762FcN59rk2z9f7/EAckZZnTs3fy0o5WpmG+8y9q9jJJzuA8nO/H/aeTf
	 175J/Ryo+k58wLj2DyPh9546kw4zYiu1G0ySDUcz7sho8niaMqB2Tej8aMcPGmi5ytJ9+
	 8bxN4wZjRShlupmHvJgQ8h4WO0k0mf/9Ji0h48RU57Au55YbLmKVyYSy+2+/1Yin9q1kH
	 CZWQvjAnzrcJqNFxufbYs7NUC7ATUTr/vFD4Im0sEYDkvLL+wWQXws2AfJK9sWlq12p+M
	 JdtgKDLOagwrigcpSEdjRstd3FXBmBXCxu8rlkjsqF//QEbSE+V/PPivgTwaEr1cyNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y38/cgs0IXFwvCCxp54d00JDAtVXdn4TENZYiDeVtV4=;
	b=gPc6Nw1XUe1noLeMAUjqCWD0HuMkpM5mH/KSf6CoYET10J1XUu+4soUPozWofID9pi7u
	 wEL4Et8gWwclsfGnx1XQRVCxWQsWxKsmDFDV+wNRDjX9u97YtOXTBaZ8whk8gzg8Q8/Bv
	 +x7B42hzgC5q5e+iFzbDVlhn338UdgKatjFDoLx5B1690gn6U36b+vRM5HRGRCbYllN+l
	 mKbhFu7P0zYi4eYP3dadJQ6xdhu1zHXKD1Z4O/qCj6A+B8LuLfgr94T/FvTldmr9XuxnF
	 z72leCV3l0WvzdKC0fEjuUu3F0IMqJVylz1JAnXPq1Eo9kFARhp5iN45jHaPmvNWVAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hohA/HTT";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=awbFHGYX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CE9606A32C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9CE9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hohA/HTT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=awbFHGYX
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LoYb323069
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y38/cgs0IXFwvCCxp54d00JDAtVXdn4TENZYiDeVtV4=; b=hohA/HTT/gEVRy8O
	yiBC1lblRlVc9X0hGjmSTrDD8E15JMqfl9sgNhBkwrTtHpwJPoooTUVMdAQL00qk
	ITc4ejlRtZpSvfo62xwmXXCR00fikXna53E/DIPgxrKPC0sbys6cmt5kwfKH2YDu
	3f1wZROjcbkbdzV5fWpiH2fvynSrexO3ypmBlMGrNA7cEP+idAMt5vzXIK6eKads
	duFBXOwiZG3tQXZHPMaCi7LEJWH5TKrvxnQfa7QkAnG4TF2+oJqc6w97QgXZROWd
	BgfGC8x+K1d0rrjs9zXDjpNcpYQ9WZJi58m2GORPS1Kg02fWhbMSEHiYBfefu/Uw
	19veoA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx57e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:28:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdd9fa2a558so3257818a12.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 22:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794810519; x=1795415319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y38/cgs0IXFwvCCxp54d00JDAtVXdn4TENZYiDeVtV4=;
        b=awbFHGYX4rRO1SFd23H6VsDQvNMWat4muwxM9lujKRUKZJo72tHOj7jBJX2uKPzrJo
         v1gdZfUW66poxUbkF9qmPXvKbEtJ6sHWTZxU1WhiIXobt2TsyhjFx5qXJ2S7vNQSrAgB
         ARG8zn26m7hQADYtj8IE3XDP5MGoVWgg6XcEMM/hINADwTBkLV07pve03O0soTqblLOA
         upFy4IMwyH2dS7naCc961ynwt1W9Eobi/YdEUWDmO/1qUZGDnNRssGnBvEwwtw3z/Qcd
         mSnwWczamn8t74r9tE0/iOhg2uH9Dc8YtUiR9S0jXDVgZsC1txPpz2R03jgvB8khaQFA
         Tnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810519; x=1795415319;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y38/cgs0IXFwvCCxp54d00JDAtVXdn4TENZYiDeVtV4=;
        b=Bs5YcsZnjNXhaoWd9AXv4nVt+I/vaxtTeTUjRnua1328c+3OvFaf3tVdZtCM8bg3Fr
         B6Je2oHXsTRGBDWrnCjTS1czUuT2TjxIRFP5xgMY2EO2Y5PsYxQHXIHUhNHUSDudTJ3i
         NeAiTmClDYyW+SOUhLbQL66LorKr9nuUc4907KsJZpE9MeWaSnn0mgYBoAwicIMX8jon
         /21zvYCGZOPwy7pCd9CSdbzeR2AAZuFb9WTMLm/sgHJRwLyPrPYPOtwKy8k7JRuK3xYd
         zh/NCe5NG2llV/4cGqjs04c3V22fb+VJFbjHHDUApsnOOn6K9fy19+WJKVFE6sE7hsPq
         dotw==
X-Forwarded-Encrypted: i=1; AL+hErHBB0++O+Il4S0d60NgRgX4RmQGhpUI130Th21x/ybkeWckFUiWwClVR7vd6lgPTb4z+NqCf5vrsUOr@vger.kernel.org
X-Gm-Message-State: APuU4Z/e8F4LimEnsPUknIvMfkq6oguDmJU/txqOC//ECMcFidKf2sLT
	sV74MhWZUTcOTg/e82A6sGpn2fObdCCif5jKEbvjOXVND9SVF3fHltlPpkiv0NiOiW/tKKiWIF4
	PRdFGr5VeiLVvQSQUH01T79B3RcQ/9EHSLbn9zMtfqe3EKr5AksAaCXjOUbL0xPdb
X-Gm-Gg: AYBFou1uUFR0KRgovcMUvskKkYis+O56W+4IaiVo4lYY0qMNHJix0pQo7mCgfDriqol
	0kvPdEnbMhFDcKufBrxzHAy74NV2B7GM6Lxurb2q3kpuDACVq4qtDMLYjfzSYH/nN0eqPaJmd8x
	4ng58Sgl9PGQ5NqfvHfF1i9FGDOxIgwcBIx1wInPJElSN5dR8S5hqMpoaFHl9RBi6H/D70LbquR
	9s5Z3aFZUcuZMyLS+0oIoQJ8H9eRUARn6u0GbTBQrOPEDiuh8IESdsrOHL23trJveLTobUwmFGc
	U0In3Vk/+vBaStrx+tQT9q9DxFPxr9s6eQ2geS9WyahOMbWoZS3bt2LILWIxkv6v8C6FNKpkAjy
	uOJ7tXkeJ9GnaFT1K8UJugFADOnfgZsjDP4C5a32ATBhz7E3qTaZaoq+TyHH+Tqpu/nfSFTm7My
	WEFqA=
X-Received: by 2002:a05:6a21:4847:b0:3f9:c909:ff6c with SMTP id adf61e73a8af0-3f9c90a14ffmr3773253637.13.1794810518585;
        Sun, 15 Nov 2026 22:28:38 -0800 (PST)
X-Received: by 2002:a05:6a21:4847:b0:3f9:c909:ff6c with SMTP id adf61e73a8af0-3f9c90a14ffmr3773237637.13.1794810518081;
        Sun, 15 Nov 2026 22:28:38 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececce013sm3370713b3a.6.2026.11.15.22.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 22:28:37 -0800 (PST)
Message-ID: <5355782d-8ea7-412f-9b90-886ad995633e@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:58:32 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Enable the Inline Crypto Engine
 for SDHC
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-enable-ice-sdcc-for-lemans-v1-1-1f25debeea49@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261109-enable-ice-sdcc-for-lemans-v1-1-1f25debeea49@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNSBTYWx0ZWRfX8/qn+9BdtFjm
 DQa+o2/McGXCLCYgXfL90tFYPdik1YI3UespbwwCcZXiQHQjVVfLwADH9FhowjLHvsn2Fa0cDz0
 s2DCnfy4wZPN/UnSoLNYe5NAehmbqaIkbkVmEfcxVJSna0LIck7BuALgYi4MnJ+Fbn1zLrW2cpH
 /0IZmbr4Zt+BH9/B1SgplQJV/1SpfqHlr57i/eVdygCz9lr7AeFiPQRCg5QYoXgI6SYiHmW7QEO
 PElE7lcN07V1Vz4elOVjLOb/lPXgbFKLB/N4TFZU4Wsp4NpgluQmTOOjYyTWDJFp3BKG0NibuR4
 G8FEEOey+rfN0EKqBKg/ZaqWOfH04ssSthOKyDDrzanPEBic+cdvWQqmaF6TK6BSTpPZhm+4Pwq
 7kTL3h+JWrpU8j1VsoQuCSEuKx2tr8zANqwXItEGbrb7D7HK+jDCMXJq9n+zPE/jljxiS+s6j64
 +IwvhoR5GBACtdVMY9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNSBTYWx0ZWRfX1w4A3hACCmgc
 weDj6sMODyYEVF+ZqQCH9pY1CHyReJ3SAvfC9txZjxFYacpdOxpm2EnOCpnDtNPuWTaG6KqPF5P
 PfIxjeO703uikWhv7FQiqvtBi6IqRRw=
X-Proofpoint-ORIG-GUID: 8H7iDDi-xwJS66u456Rm5ygrGBnfJW9T
X-Proofpoint-GUID: 8H7iDDi-xwJS66u456Rm5ygrGBnfJW9T
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6afaa297 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mGBdCwITC7C827Q3XjIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160025

On 09-11-2026 14:29, Abhinaba Rakshit wrote:
> Add an ICE node to LeMans SoC description and enable it by adding a
> phandle to the SDHC node.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
> This patchseries enables Inline Crypto Engine for LeMans platform
> for SDHC storage.
> 
> Testing:
> * dtbs_check.
> * Validated on LeMans-evk with custom Mezzanine board for SDHC support.
> 
> Dependencies
> ============
> 
> [1] Enable ICE clock scaling
>     https://lore.kernel.org/all/20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com/
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 1fdb72fa5518446ba2ea582e8362e86bba75c379..dfd41b613523fb85eb122488e0562447f7228e61 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4327,6 +4327,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			qcom,dll-config = <0x0007642c>;
>  			qcom,ddr-config = <0x80040868>;
>  
> +			qcom,ice = <&sdhc_ice>;
> +
>  			status = "disabled";
>  
>  			sdhc_opp_table: opp-table {
> @@ -4348,6 +4350,33 @@ opp-384000000 {
>  			};
>  		};
>  
> +		sdhc_ice: crypto@87c8000 {
> +			compatible = "qcom,sa8775p-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg = <0x0 0x087c8000 0x0 0x18000>;
> +			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
> +				 <&gcc GCC_SDCC1_AHB_CLK>;
> +			clock-names = "core",
> +				      "iface";
> +			power-domains = <&rpmhpd SA8775P_CX>;
> +
> +			operating-points-v2 = <&ice_mmc_opp_table>;

Can we follow same pattern(sdhc_ice_opp_table) as following in other
patches in dependent series?
https://lore.kernel.org/all/20260824-enable-ice-clock-scaling-v12-4-09271f583dc6@oss.qualcomm.com/

-- 
Regards
Kuldeep

