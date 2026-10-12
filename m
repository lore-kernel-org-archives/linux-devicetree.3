Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8706D1C5F13
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788390; cv=none; b=rHepTSSVIF2irrU2nN6Ll4geboglUjyLbAQihX+y+AfBN23RqwzTORASo2YojMdXshdHtRBJsPV5vyt7N548KZ/8roYo8e0PMAVjVVakraE8Pd7JGp4kYWvdZdXa04nqZ2Wv8bK79Xnk89LobwtwiR9v9zRwd+u0PFCJLVKGK7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788390; c=relaxed/simple;
	bh=XyNUnqIeGkrl2sN+87qAS40ppnV7noHEstsY3QW47jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NyY55SOFfeXWQxo7kEn2DorPl2qBIblw7BlESAEJ/M9FJwsLOmMTh9S9R4GesLyQTCNwEnqVmW364LlJuiYQudjdX2U0kh9exnsbEsLl7RTrFHVSFuf8ZJKcmnlGRqv7UVetX5khSg2GIOy4PzKwy7x2VRUTApxnqEf7oHwvD7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aX+Eoz0k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bBIU87ad; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aX+Eoz0k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bBIU87ad"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55hu02436504
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JaW2KGhD8Vzo1irLVSwbI7B2RgRHueLNyNGlF/CbcPs=; b=aX+Eoz0kjufQEhsV
	kW0OtNreGrxBpIbeB1qWSlr8Is/d8vE07/FyqD33U3zWNrnH+L7ck3hEFkFeIeMC
	imTfb/irx2SiOS66yDMw+fmYwYj5xBJwrd2+wXkjJuks1cenW16rvNP3ToedbpmH
	7gqSL62LAz1v6EObv+sbF6xtEwoMS7QQjKGmLyMnMUOKDEpYUECktvtnk2aQxKQv
	mp9dB0uq0eYVfBfUXuS2nhxFPc4Yc6O8H5q7NNhP1qMRK4bIwXM7zSs2KtGrZKmA
	794WVhayetXuTpbLr9MPSiOvc5Jh3qR1TYNZbAeOWSL13GQFf1+t4DbPvW6sActb
	s7Dwlw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2fdkah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:59:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso3748580a91.1
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791788388; x=1792393188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaW2KGhD8Vzo1irLVSwbI7B2RgRHueLNyNGlF/CbcPs=;
        b=bBIU87aduz85W8bXoPtqsaaaCie8CiEu2IU4Wy/IXLvckE3Uw76r/VmrmU6palTmsw
         qf4/LXbgAhoBggXK+M0YVUFGngCfzovXfJS9yNydGoRXTkft4/3hdFRFO6Xmf6mM9qGn
         j2yRn0ZpOxbYx8ke23eIF4Imc2JGZZkZvjRepKBUzaa+xl2b4ui2K6klzhbPlJ0jxQxx
         fmEmEWcu0qhBkETpyUtsbwXriYA9M389bgNWyQFxcxUmOn3dw96BW+HlzIRwdZs9zSuj
         Zwce1Bg/Y638xvyGPXaRBAbVHL9FCRRdiyLIWI2PvdhvjKG9eMn6oK5+4sIzFo+sgYHI
         qvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791788388; x=1792393188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JaW2KGhD8Vzo1irLVSwbI7B2RgRHueLNyNGlF/CbcPs=;
        b=gl0m6+gkMnRdmneFq+q38Tk2zTwEcfP0wbXWdT5iYOoJz12sX+zeWv8+3ZZVPoI4nM
         pnyHy54fnq4U/HDDEHHvEyDPmAMgfKG5IxDeOuYdb2JZxjqT79z/iNNHEQkSWe4TO20c
         EeLe5a5Dhww/cz3OTgpyC8srDdCnp5h3Q2tYr3Dz5IHlLvsjFTDziZR+PXT5fCP73UVm
         NM3raihLcMR3XtyTHStOmFBzTf3gArPYAiMxT8g9Ce8DBOiHpG4vfStKXfGbkTOYXgXh
         cdFexERjqAFmJq5bu7ufj1xeviwnWik5+P7SHg1LnGzUfwz0G2JJsWMSL2h1klOeVzV5
         hU4g==
X-Forwarded-Encrypted: i=1; AKwUvBxODmX1a3cGrb0mR8izvNpQRXoaCsta7b14hUYMoUGTssg+K5MleGZM/2J8szi0h1DMTE4hokJJENYB@vger.kernel.org
X-Gm-Message-State: AFq9FYKTAwv8AFvzj1c/CPsfS8pVmDidNSfH6DZYNPglx+KIMP/UbAmA
	eIGKTa4mRm3+pIpEfKH4d/YfnNO++SgzkKAnTiy7EgyzrwRl9j6D1huZDeI4UMGQkTyN46DKN+X
	jkjQkm7H0QbnZ0jNK4yo7/x3xqDPTfW+Ey+6Vg/ISa1DSdvP6RAu0rFCr3VNKY0m5
X-Gm-Gg: AYBFou3Si9VDXA+p8NBbJaqv+YPwcbjkqfILhInZPYuXPT2vryDr5wac76EhcS5hMvt
	uUMFQ3SulRnb0Kb8ES9a7q0JiCgpRgEqxuhIch88C9A+xMg/8izWmetrkcpa3ShLz4BylBIj9OT
	RfqYVBhArKwN63UuwgT7VGGQ2CvqfxQpGhtF42njU9L18Otq9Wf2pStoKBjKjfOX95IEYiJinas
	JSiEbdv8qcbsFSxdw22h3w7SK2YZWgqWzGMiwc/eiqeKHdOUXl1YIQ90UazqNxkvCpYNH/Fqvgh
	B25yRGaB9S8v66/URzqSVFdrxDBMVBpH0sMNVXKAAeU8dWlywB5CgErjepRg9z5mY54GDWjuRpR
	8tZKUW7WBFNjHMdR9dnWQrnvSnkd7gHDELmrcC2aIX7FbEtj53YroHDXcpnFANN0=
X-Received: by 2002:a17:90b:48c7:b0:3ab:8b2:72bf with SMTP id 98e67ed59e1d1-3ab3a928525mr7530717a91.50.1791788387837;
        Sun, 11 Oct 2026 23:59:47 -0700 (PDT)
X-Received: by 2002:a17:90b:48c7:b0:3ab:8b2:72bf with SMTP id 98e67ed59e1d1-3ab3a928525mr7530698a91.50.1791788387341;
        Sun, 11 Oct 2026 23:59:47 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm17720151a91.11.2026.10.11.23.59.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 23:59:47 -0700 (PDT)
Message-ID: <6c7bb574-74c9-45e3-954b-b572342f9946@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:59:43 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 14/14] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, media-ci@linuxtv.org, robh@kernel.org, olteanv@gmail.com,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-14-04fd28d815c6@oss.qualcomm.com>
 <sashiko-outbox-167757@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-167757@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNyBTYWx0ZWRfX6J/YE3X8y2aA
 yIyRhrHOYOlkCZpp4fzK96v7aBn3yJuAziItAxj4+SfFOYN+rThP7SV1e3qan92TKoL7J+bPV5C
 zWA8XGeLECyezMHgH8se1dtxDHseNdY=
X-Proofpoint-GUID: bDLTzshgkhXp2_llo8CPWDvaMoEIzqCv
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6acc8564 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GJQVe2W2MQrxmwjxaooA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNyBTYWx0ZWRfXy70PA62wtucY
 lJKJeMTOtUJVbUmqx7bWg2pTRWcX2Xj3R7PNnqvWEfHtkdwEpT+H470HfN9g2f1z4+jQjwNtNMZ
 ucvDr6Isk2Babas8DUYMCNJeCiA/Inr/MpDBA29Nb7tORR/J/zLjT20EtxdFFdDL7X0et+hTjId
 QZ6QV11NKIXQUJvu4ejcIczsN5z85KiyWcvVBkuiBXK3ybYoR7yJDa/DLi001rNZIDzh2tMmCJ9
 DuHvpJAsLFYZTeF3CqlK0nfZ5ahUcITS4fcyfEhJgkHiBOm/owA+e39DeZBZdPL5ViN8BInB1J4
 BEMwuQfSSQ2jvIMJ82gEC08Din5XOmOouKlwi8lwZAOCUOR34NMQjT20vgrpmLQMuxsU2qCE+EU
 xDtrI2XBI1gbYQoQoknmfY3ooTKCL3peVW4Lys5cM/YIpz2CVpTTDImiU2rRsBkDYJnb6dDh1WD
 FDUeKRCrt6e8jFZSZ1w==
X-Proofpoint-ORIG-GUID: bDLTzshgkhXp2_llo8CPWDvaMoEIzqCv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120027

On 10/12/2026 2:57 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] dts: qcom: missing vddm-supply in s5kjn5 camera node
> --
> 
> commit c1df83521b79d78bdf83d4c496be4b0e82a9f05c
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5: Add DT overlay
> 
> This commit enables the S5KJN5 image sensor via CCI on the Kaanapali MTP
> board. It adds a device tree overlay for the camera module connected to
> the CSIPHY2 interface in four lane mode.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
>> new file mode 100644
>> index 0000000000000..d0e39855e0e62
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
> [ ... ]
>> +&cci0_i2c1 {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	camera@10 {
>> +		compatible = "samsung,s5kjn5";
>> +		reg = <0x10>;
>> +
>> +		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&cam_mclk2_default &cam_reset2_default>;
>> +
>> +		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
>> +		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
>> +		assigned-clock-rates = <19200000>;
>> +
>> +		vddio-supply = <&vreg_l4n_1p8>;
>> +		vddd-supply = <&vreg_l1m_1p0>;
>> +		vdda-supply = <&vreg_l4m_2p2>;
>> +		vddio1p2-supply = <&vreg_l2n_1p2>;
>> +		afvdd-supply = <&vreg_l7m_2p8>;
> 
> [Severity: High]
> Does this device tree node omit the vddm-supply property?
> 
> Looking at the s5kjn5 driver in drivers/media/i2c/s5kjn5.c, it
> unconditionally requires the "vddm" regulator during probe:
> 
> static const char * const s5kjn5_supply_names[] = {
> 	"vddio",
> 	"vddd",
> 	"vddm",
> 	"vdda",
> 	"vddio1p2",
> 	"afvdd",
> };
> 
> Missing this property in the DT overlay will cause the driver probe to
> fail with -ENODEV, or if the regulator core substitutes a dummy regulator,
> the physical MIPI PHY power domain may remain unpowered, causing the sensor
> to fail to stream.
> 
>> +
>> +		port {
>> +			s5kjn5_out_ep: endpoint {
>> +				data-lanes = <1 2 3 4>;
>> +				link-frequencies = /bits/ 64 <1248000000>;
>> +				remote-endpoint = <&csiphy2_in_ep>;
>> +			};
>> +		};
>> +	};
>> +};
> 

vddm is an optional power supply and on this JN5 daughter card we don't 
this power rail.

---
Best Regards,
Hangxiang
