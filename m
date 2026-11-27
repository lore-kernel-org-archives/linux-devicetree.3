Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789995;
	b=QDh7AMjMbekwV8ZUBW9ln0eXiXetS8EBGe1wMmHm9nBnFv9thWoMbyznYrjYjw5zz0nl
	 8Zjt9jH0Yl6xz5Y1djz9GRES7GjjvIbY64G77hlKCeeMprOFMJeWODriRDRGtE4zP9H3k
	 /bUthq4IZr5+inDPX534RdGf+tS097O73GqvTktcXn6LQRmHGTfQj8tMbd8g6lhTgjU/B
	 ii7KD73bJyHGAFZNuEgm9ZVgbEnUTKctC2Y7XmagSb7y+cKIQBRknr2RxRdunU5zv043y
	 ueEmjL/E5XbC3uJ/QUsYlrTB5T5od93QnD+rHoSjuVIYkAs1LSPrkf4f8Vf3f+CFSTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789995;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iWP69hNRNmZLA6SelaeZpNejkx3pRxxJb7FKwEEnVIE=;
	b=aZtqHq6wVZdtCSsGoMaJwmSqWHgPWMcHTDiMand1W05YPbnwJhIPnaUcaeDV65f0ZPAH
	 1IRTrafTpeD3O3Wy3Fd4g/VnR7pak7cbOxkIF+mnXtsV/Tni7wtUQXUvuz/wK43hIrhGU
	 ApOkFOMAqtuRFe2h7KZsk/zFDQ5JJKSmCRiTlaCd6pzaE9O8FPHBnCAQ+Er+0ij1XsQ8W
	 GJ1YaHVma2SmZ3Lr82VtRuchhfqr604mx3SGnC43xiUa+PvvNfWCWmjOKOjKRpPeW20gI
	 keBwn/D9fjO4RCT8o3Oy+iSPigqmuu+WbBx42ahzvcvQzCBTgtB1zGJ8YwIWytwP/1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMNucjW+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=guoj5dBg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899C4606A332
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 899C4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMNucjW+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=guoj5dBg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1icq2097855
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iWP69hNRNmZLA6SelaeZpNejkx3pRxxJb7FKwEEnVIE=; b=HMNucjW+xDb1S/AB
	Y9ZczFPd/ZYrE3A2AJ/8Fu/KLc9r8wkpQ1maqb/nTeWTQiKpURMtVpjzAmorngu6
	1Gss6J+nqHdibemuvtvF7+5yVSYZoz1stcwgOksirfcySiNYRSKBfk4YdrhcaUqK
	+e7BAN6YQJWNwj3xOsAWgTmFh0hIk4MUr9EgGsIueX8bVMxB8pIUTr3AIsABPdQU
	zlFaj0b/earxKA9LL5j1Av/ZZetrhd2da4RxjAKFbbECl8+1UJQt6psQZfwiFxF6
	VbBySedEHFpslbxpY1ZwC4SYyw3c6dkVRYA17OKHF35JFZQjzL7g/HOvXUPfO0fI
	fzEMLw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k9p6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:33:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495e11a684so44087185a.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789992; x=1796394792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iWP69hNRNmZLA6SelaeZpNejkx3pRxxJb7FKwEEnVIE=;
        b=guoj5dBgrHSsIJp+Jmu2CpwoKGM19tObEGPQNiXAjRHv9AcBilHEdSi2H3vnVyP2cm
         U4hFV1QmBrQOgPe7XmAY25FybKyWvai+1g3olEqaF/vD320CgcvBXDvHPeLZllJsx4G3
         Ih7buufim0uFZ/ENj/wwVr6Ydg2/icNt0FUy2WRpBVZmh1NGoRF8858bHg0AIRzyGXVA
         +cKU1R9tzhe7EFmzhcMJEukQNurm3fq2G3UoBlKlALDKpN7atJsRs0OAsHLqFibKQ0/n
         cFFiXp39OYXcXuKiarANk2J618+WHMK4k40P2ctihrjXGmpZWJuo3+XwcD4VugVKWNAw
         70gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789992; x=1796394792;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWP69hNRNmZLA6SelaeZpNejkx3pRxxJb7FKwEEnVIE=;
        b=LHxEyboza9fma0+Uh2ch13R0IhvOp8YSepA0EKa5QLQZrcDsbL5CAQa/K2VrMs1C6H
         N/owNRM3ghgYHoSeK7fTswaUIvMNgaGOnTkg5BTAM+dmazduIqzx9q6bWnd4E/L4DfdP
         z3zWiIqsd1mpZe6bJqUJyA7zUnG7xDmZ50NpzmmFcdEp5OmhO1dqNthSkq6gk+Iy10yj
         5Q604psukK/nywn754f+ly3VqsNM58pu2hbblNQCooqOqSLvQ8BB10dgZSl11lKjviYv
         VA6G+J8i2zSQZkQPmmk3P5i05h9sHWwTCplavTVTFj5nnYEqgZN0kv37q4hVsEcyCU9g
         GgYA==
X-Forwarded-Encrypted: i=1; AL+hErG5dj2L7U3dnE7A1sDLQRH9CWHubP0KvMPoquqBGUURPFCmh9b5CcT9RmbCg/YbUvwm1iv5kxVA2enm@vger.kernel.org
X-Gm-Message-State: APuU4Z9f3YytyliD7jkvVV0XD0SoYLleJNggORoUzInDLF5XbHvFdTCV
	qLixbYyuDVcCxSpwrOWEgEgc3oxatAwNWnBOJC88qtXDFkn8we1Qqvlr2qfxky0FhctTitBp1IM
	R+Vc2lnG4aR+WEfqInmLolXDPRfGeAEUkDjE31r0rDR2JhkZwBLym/82jxj44LxCS
X-Gm-Gg: AZFdTZfyKdx3QTMdqymlN51zMFJg9GFpOfa6c4wAR8ic/oTs7XouXNECsY29VFZeqb8
	AH4c11Ou0uMdgXuUpQSCY16CIykX1ri2QrL7laylbOpnd5B9F7ZEYdfxQQxypmfyU6AF/mtAOZV
	noW0O+8UKtGB2mRNzpjdz6VJEX07A52ZhfaE0SeE8WmVTt/MOXanFQODPOtA1ra2UGC5IkQFCnU
	P/8gvM4RztjAiFCk8o+Y7dPYlyPkiJ8ZpQnWAcs85ytbuzt6bwzzzKHweCRCx9rX6WGgTFapChr
	uN/VBZfMMQFgonlu3HkT9IclcV/K4Wj55VrAPPWrHG1dNsfg/oWN3WTaJeRjakRSMZdwwn2Ksue
	1rcPv4gXrhElGvnguzHOiJx/rJmwDE9NdkzV5mqolb2HENNty3YJkVgVK2c8Wkh+Y/YxBTPk=
X-Received: by 2002:a05:620a:6e93:10b0:949:7fd2:6758 with SMTP id af79cd13be357-949ba68c353mr4128045285a.0.1795789992478;
        Fri, 27 Nov 2026 06:33:12 -0800 (PST)
X-Received: by 2002:a05:620a:6e93:10b0:949:7fd2:6758 with SMTP id af79cd13be357-949ba68c353mr4128039685a.0.1795789991996;
        Fri, 27 Nov 2026 06:33:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm859572666b.32.2026.11.27.06.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:33:11 -0800 (PST)
Message-ID: <1ef797ee-131f-417a-b473-52e4dd965470@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:33:07 +0100
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
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8350: Add the inline crypto
 engine
To: me@fromdisposition.org, Abel Vesa <abelvesa@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109-b4-sm8350-ice-v2-0-fd5e84985e90@fromdisposition.org>
 <20261109-b4-sm8350-ice-v2-2-fd5e84985e90@fromdisposition.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-b4-sm8350-ice-v2-2-fd5e84985e90@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX9BYoMasZe8Yp
 S4iIi519YJCR6n7SKFINRKnPbbumiyNZQE9sug9knNGp0CdYoh3VYjhuC87+xpa2A/Je8G7hQj/
 Gz/K/xzX4XqSr0VTlI1S0KMpJ+G5Txq0SV6C2btJDyNTRzb8Sz79f5x4YU/QMvnk8zCtmTMIk9p
 lWrSpSZ4RifeXojQmk1KAslOD8o0IA6UEA/lTDyzfCuuZ8qtqObjhQAGbCLMLVSp6sbCIVTXMz5
 MSJXfzLYgt2XLAiQDCDC7swBIHWIlmUyE2e1aeWtd6CL6qxIcbPoYJLOaewf6Q1VD3S2i1LXzXi
 PJ47ZVLvTJ/XZLl2BbC65f/xXzoHqaEiY95sY4sXCHg0VeLMfcw+s4GbR9NRZJbWuC5dofcGHJG
 78DBaqW5h/JnPfPn3jQXjESw5QJBZJd4319QAWJq3FvNxwFqpC8oPZ3/kIHUXNm5OicPIel5WtB
 04i55I/q263E6fcebJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX0jTLAXxU2I2o
 NT/cZ4NCByG1F7Q2sNo2jX0wLwRpRJp9FvhucEaxqBfeMfQxzRAKpq/YZ9Gj2i6gwBAdWp2163j
 iwA4DN/yshiwiV05H0OUmF76oxxajtQ=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b0994a9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Tt5JBQAfAAAA:8 a=R_l6ZAkWQ6Pq_YTnY14A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-GUID: kAAX5Ldf6TRxQsT_2olnv6mhNxyp2tVF
X-Proofpoint-ORIG-GUID: kAAX5Ldf6TRxQsT_2olnv6mhNxyp2tVF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

On 11/9/26 2:55 PM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> Describe the UFS inline crypto engine at 0x1d88000 and hand it to the
> UFS host controller with qcom,ice. The region covers the engine and its
> hardware key manager (0x8000 + 0x9000), as in Qualcomm's SM8350 device
> tree; it is clocked by the UFS ICE core and AHB clocks and powered by
> the UFS PHY GDSC, as on SM8450. Without it the UFS driver logs
> "Disabling inline encryption support" and fscrypt has no hardware path.
> 
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index 55b32050c..2b258c4b4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -1782,6 +1782,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  				<0 0>,
>  				<0 0>,
>  				<0 0>;
> +			qcom,ice = <&ice>;
> +
>  			status = "disabled";
>  		};
>  
> @@ -1807,6 +1809,17 @@ ufs_mem_phy: phy@1d87000 {
>  			status = "disabled";
>  		};
>  
> +		ice: crypto@1d88000 {
> +			compatible = "qcom,sm8350-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg = <0 0x01d88000 0 0x11000>;

sz=0x18_000, please

Konrad
