Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F0023E342
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691448; cv=none; b=BOrSJzpfEMRsRYCLKYly9hqZpIxZxBlwvFb+1+avUuR1swmKri0b7LyU6jStVCusX79WfiLkcZxayeCxgK9OELQlEDI+ZUZ1pT89zfDTWomgVsSq5IetjNr1fMn3UQyTAcmRN0NmUVS5OnCUwFEUE1plQalLQUtkev1SYSUELCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691448; c=relaxed/simple;
	bh=xH1xh39y8K/9voN/rwyDLcQiZ84Qo7t4SMNVdhnEKJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HenNxyBeO28bVk0gMuW2XYLwqZtmjYu+3jKieMnSN6xTKotZLQFFuzeSmvyjfqBLBiGd778iDxGY0dydrb2YwDIY8Gc0CSAr7q6TJo6dX7jnSpmrPobCj9Sus48yy5SIc1w/8s8pgj17ELQWOimzmy8gggV3WWq5VN7RO+PVOH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMh3ys41; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fr5xezbj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMh3ys41";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fr5xezbj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6lgL730850
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6AIQxvcRx21RioxQhZDbiYJ1VNsBCw2h40lSC03Og18=; b=TMh3ys41KU3gbhm/
	vr+T7ySZQJvD7YOYzs+Bb5Sz9GUZPEo6JmxpQc09aLvo0+qi/kg6wgGHizmkStZM
	W6e7R2Mw7Vkd459x9ll99zW1qxDLZu3sXYRPJXV7XBz/uvMQ3nnZBRmS0D+e+I2u
	Mi72rS3Psl4VGTAC7/Qvpv6/J5B974DSuVlxrejFr2uvVc89wKUq+sbDkmYJTAqW
	iTxwITLqCQFRbmIhUgK9l1eGyQnH4Z3l9KGCpX4ZM5fzGDxQmekXg3nw6iNOSDL7
	rB/risaTQu8Tsq3e0KRAwqlKCEhFWeE42QrRk+REEL8aKlUxjYnV0/RuWIkISFyK
	GI5PwA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24vgq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:50:45 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bf259655cbso39680e0c.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691445; x=1784296245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6AIQxvcRx21RioxQhZDbiYJ1VNsBCw2h40lSC03Og18=;
        b=Fr5xezbjSQDRuyBXSRyaRfbhp/Uq22KrkWLYgxyFcg6SXCNlufhyL55YrLcEln40EE
         HyHXKph4n0NJpvuvoBQ26LrYu0PT4eOn6prFxDRFNyNPM+0BOtJnMpur6PD3BIkdLLTk
         TqOFJslpGJkNqAz/sIeEn6qoiFtF18TxzPHjk5Bg5xdd5PDRGHlC34lSu0Eu9MV7yR/I
         X/MX4tuiBvu+zCzVnb3JbfwuEyuE9F42sq2Z6Y7lFL8BKHE/NJVGjLhGkaT1xM7WdyO5
         pc9aV8SpbbJRAwzsO6Y+KftirdYjXGCHUblvyDiz1o1x+TsuI/3AAKlge/Io/2XlhXiQ
         hx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691445; x=1784296245;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6AIQxvcRx21RioxQhZDbiYJ1VNsBCw2h40lSC03Og18=;
        b=RJ/ApIbRaeMnEA2fXMsxfyQznI3GNCfeEuD/67APmRlrRVnmYgxAL5LUzkojQQlO0F
         1LQNcFm6ep4DuvC0MbzP/brFp2IwLEgSWhgWIdMGL76Rq/cTzSL2zUL9bDB91/+Wk5vw
         tEVau9tXgnVIlUPiRDUgMjQ1N3/WgmCAIJKXqXH6vKFt68pJkOxn8kpyIXdprVQ94N9j
         vsGQ7Ep85ZN+7VNMjDU8xDcEKti+Z/df7aXS9jBKFtG26gSkxg4cjAYMOTXs4zoDolLH
         D5qOZpi2gaZqX28SwFNJ8stCch1hZo+T8dZQzJeoAnHeb3YuTg/DUuBio0PiozPCHCsu
         qyIw==
X-Forwarded-Encrypted: i=1; AHgh+RqxcOXR/PBy8QosmUTHXfAQIScJK8oSUvnca/LiKf09cT5N5i95Vzmq6qjzVrmy34mVcdBnDaZN/T/C@vger.kernel.org
X-Gm-Message-State: AOJu0YwFtEXYx/9C94BSeLytaBwbiHunejKDYoZ0L3gYVpQSo00v1+so
	XVcTvlrHB5gJTCDVOpINeDSnhtSKAk6+hPUZU3dNXBR7Ax8FUZfbikTZlOLS1p0sUXd3wdFTYUc
	r57Q21RHqtCAswMAYn/mUFI9uEN4peR9S49Vu8Du9kCs/dptARvD/7ff8rjtt2m0cC+Z5+dhH
X-Gm-Gg: AfdE7clvtgLxyZefX4VT2lR2/NTwL71CHVHptQGzcRq8YfS+1Mk5WnDPVbYLOghQXQa
	7lo8UXnx/9wZlFjaVVOt9/u8rMNIpxdSg8jWG/XKwm2aBuOJJAobFhVGbWKBbL4r9izkFC1wqNQ
	rzyId4H4HaMd9CRcmEpeKJdL2SVD8SGDBogyCuE1fWYwZcMcfGCa78Oh20VZ5PKDwe/QAqj6rMi
	RgwAQO8ZsKO4LNdKM5qJjHgMCWg4CkRGmnU+TxiG/WS3m2KvthCkxuny7uD/gnYmPUcwB0ct6Fv
	8h8UYIcfnxGQ7vVXti6jYFHwALo55Gr2455Ui3iwfACPfr5xCEWivvWdQOLfXwdPTtuaGlERfMZ
	O9yMDCcMa5FHK0MUE8fa3xFlXYmHT4xMisbY=
X-Received: by 2002:a05:6102:a4f:b0:73a:322d:1bb3 with SMTP id ada2fe7eead31-744f0ab5277mr2225556137.3.1783691445250;
        Fri, 10 Jul 2026 06:50:45 -0700 (PDT)
X-Received: by 2002:a05:6102:a4f:b0:73a:322d:1bb3 with SMTP id ada2fe7eead31-744f0ab5277mr2225535137.3.1783691444637;
        Fri, 10 Jul 2026 06:50:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca54e25sm615052e87.30.2026.07.10.06.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:50:43 -0700 (PDT)
Message-ID: <63643fc3-3a3b-4aef-96b4-de42498cf47b@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:50:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe
 M.2 Key E connector
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, mengshi.wu@oss.qualcomm.com
References: <20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com>
 <20260709-fix-hamoa-m2-w-disable2-v1-1-5e725091266a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-fix-hamoa-m2-w-disable2-v1-1-5e725091266a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: igADNYugo1tzmjvhL_4bGQR5mB-4oPFE
X-Proofpoint-ORIG-GUID: igADNYugo1tzmjvhL_4bGQR5mB-4oPFE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX2WZhcmKWUo3p
 bNzTiJ3g5+sVhFS9sxYFLtl4NJNj4PrJvfNare3MVlRqvk4dyrN5UAoQYT/KCtfIRBOG2L0pySx
 Nc/lR/TI1v1Zz+e8YkuzkGDZcyv0oXI=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a50f8b5 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=MVNNC7U5w37-LmZrIMoA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX5e3R+1e/5W/O
 2ezZko1DbFraGrcE3T/S5q6C2zmoBO5reD4Ia+7zzFY2WoXX6kloaSjujeqPGd3tQ/iFVCXFXMT
 jMVt9+NEilwUSUveJfFREO5euseNl6BenefpqD1IFE7NJxYD0nv0gtrqSzy905hSy9xUv/Uw6Q6
 ZSiGswc2sw35u9Va8AFCfBonJyhGzOZlExF8egzkcq7gv29Kx0CEqLhazKrs1tXWqQCjXWjVsEl
 aAgBgnSGoeadwyQ13X+ph3Su6nDROZzcfVrz5OLG2gzBTQvVonhCWOmUw2MAvGxxRkSXUGffeiH
 XBhWrFZN8jrQvmRnNjF9hTBTFK3a7qdYXP+LFimk3p2+Hi+NJRyC/SSJtll4eehEJYdFDBjAXlx
 zUo8H1X80GetybwNlHe2of2RFm326B3AlGGXYs1qkV+oTYWw7u0IXsv15whkYG7uV8D0ody1dBs
 ywe4zyOo2qGMPnlZsnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100136

On 7/9/26 9:29 AM, Wei Deng wrote:
> The hamoa IoT EVK has the PCIe M.2 Mechanical Key E connector to
> connect wireless connectivity cards over PCIe and UART interfaces.
> Hence, describe the connector node, link it with the PCIe 4 Root Port
> node and replace the static BT serdev under UART14 and the
> chip-specific wifi@0 child node with graph port/endpoints, allowing
> the pwrseq-pcie-m2 driver to power the card and dynamically create
> the BT serdev device.
> 
> The M.2 Key E connector is powered by vreg_wcn_3p3. WLAN enable is
> controlled via W_DISABLE1# (GPIO117) and BT enable via W_DISABLE2#
> (GPIO116), both described as active-low GPIOs on the connector node.
> 
> Remove the chip-specific wcn7850-pmu node as the M.2 connector
> approach replaces the WCN7850-specific power sequencing with a
> chip-agnostic one managed by the pwrseq-pcie-m2 driver.
> 
> Also add 'compatible = "pciclass,0604"' to pcie4_port0 in hamoa.dtsi
> to allow the PCI subsystem to associate the DT node with the
> PCI-to-PCI bridge device.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

[...]

> @@ -1025,19 +1004,10 @@ &pcie4_port0 {
>  	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
>  	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
>  
> -	wifi@0 {
> -		compatible = "pci17cb,1107";
> -		reg = <0x10000 0x0 0x0 0x0 0x0>;
> -
> -		vddaon-supply = <&vreg_pmu_aon_0p59>;
> -		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> -		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> -		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> -		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> -		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> -		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> -		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> -		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +	port {
> +		pcie4port0_ep: endpoint {

"pcie4_port0_ep", please

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
