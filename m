Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010838;
	b=EUtdlj2H0OE2Gsb+v3vZOgBYKKn9B1KrYHQ8672tYOUyNZTO3kKz9PeDcldj9knhaatk
	 hOtA5P+Clq8lVlFw2LRrRbv9e+cclHQhdJfgObCkRCGqP/Sr+gGpEq6+885ADNoR6uBVB
	 ARF15wJoRHhXC/GfHMfcwroT/RpI2e2xqQp95BWINKLclBF8TIxTHsmSz/9pRDUtIm8D2
	 ZhLWd8szVTyNiMaymbNqpDyU1OOohpl6+bY0l5k5VoMFejwGBMAQ8WuRAWj65zVH6rsQq
	 25QL8IlXcXcuo4TcDlHLds9S8mm/jWCEZVHA5fCkgBYrIqo57wLZeN3CgL1r4qJ3Rtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+PNBpgjpi7/qrYdi32lyRfdAOZDa8x83xqfpzeO/qvI=;
	b=3nxfm9MWxcm4rFdurp0UUXNTJ4MbVN0rbLQJRV4Y3RavYdc4ASlL4KhwAUxQWilsSitz
	 L39sZNS4MQcMM9uxNatVqgmQggJ+J/oFWxqq+NC6+ydhnXoqGdvEH8iArRFtGzdg9BMHN
	 wfvvKKWUI8UczOw2zY3X3SiLHWiitpaQMngu7gnsStauetkqhzlsluamcPVUDOw//yDF7
	 AKEOnGfYY803H5YPFd04JF3o3eN3SnVVGdtp7bBCd4Ba1hePRzbjsUyZYQUy28xl3jj50
	 lND2Rq/ssM9UVpHFNMZ9dRuUH4lBdiwsBWq1WQCPVmTaaJUlCsC+ljX3Vi1g1XjHaow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=efqPBj42;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X5CLsUL3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F0C606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0F0C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=efqPBj42;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X5CLsUL3
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q9aYgC2560630
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+PNBpgjpi7/qrYdi32lyRfdAOZDa8x83xqfpzeO/qvI=; b=efqPBj42DvWp68QC
	tQwCrDbi6t7LRFAf8E6X1hSi4442mMaqva/7TPbCoAz/hyQJhtQSA8JpEyAvtOH8
	6yujr3DFSVqMiDC/uZBSRdp8s7XFWbPapYEiUXHEZ/Cf8xYPVG0V7OlE1QRyDcNp
	MrkpLfuXMmiQ0/vzWrAM9o7+e5UMqBGZxXNVUOxYI8hDGx3RgkoP9tNHd8A4Qqo9
	6jL6Pan/QDV/3FKzje/XIcbh9MxcFMt4XUohTFXWb017edqcQi5qbVOeBBtYo4sH
	cOG5L05lrh6yIXe9jiKjbyHt5+Ya80FHJbbIEOTIZARNYzFLP1aHi9aJdvaaQBWm
	xUiCHA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp875p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:33:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc50fb0d2so45223185a.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010836; x=1793615636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+PNBpgjpi7/qrYdi32lyRfdAOZDa8x83xqfpzeO/qvI=;
        b=X5CLsUL3Zvyu1h2hGlesrWmTgs1x/c8t713g2Uk7GKt3LRAHX4hqFtLYe/25XS2Wfq
         ixHl1lm8vC/cSibFfssPr01Z7ksyS780SbrSLXFObqNnYB6ba/bPa4K6mmm/hpDLbvk4
         Ci/QHfY9FkTq4b4Eufo6fCYoKKkZUiP4rNEsy4dtC7TyrXufHL8tFETzmnypin2FFoZt
         VDb4Vzc8YE9QE/GE/0C8lwYzmSGswYn/AxabBX+3qbv9A8ExCwNZh4MdyZdyMpQCzUUt
         cKZDp0dHSAMMuR0KYDmmcVhcMaln50yUlhqUOgr6KUz3QofLzaHxLaXLHPJzgeHs5XVw
         4yhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010836; x=1793615636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+PNBpgjpi7/qrYdi32lyRfdAOZDa8x83xqfpzeO/qvI=;
        b=huEXSF5bPdwIcgF7u6nwI8x06EQVeOeUoWJ/r/EbOgR4yRDlP2jtsgor5u29xvNbmG
         2FlFPdHPNYHaJjsuT7EnByxsjMINwjN9v8sjBHMoVItmIRJJbmwmOQQWtPNaFiltt0+3
         MRmwlgcTSf24y7CqGHqCsH1tAws5GkCUtqNbbsDmbu8b72v883Oz+eRwARLvWhkrEByG
         S//vmbxms5ZOs2Hxr1KthQjpMqWl5TBizdR0clmVNtVvxNE4FUD2lEEcJJ7BBuEENSFV
         qVyWQnh/yh8uJvs+9qjgvd4NJ/8l+sUVnidW2+LNUltAN5egtwRiTTcm+kbkjia6FNFt
         EsAQ==
X-Forwarded-Encrypted: i=1; AKwUvBySkdPJ8qqLY0h1pnAA4mwt8R8hIecFiWew22/3wog2jDRB5Gea+XChf4qpOLjSoMBIult5MKqmlyqd@vger.kernel.org
X-Gm-Message-State: AFq9FYK4KBPK3RbPIEuUIHUC5UE8Za077qk86SAPntfWgtDiI5fiilz/
	t5Ic7plIkgPI1wELY1VviGndcX+rOC8EAIkr34K1qO30tdsOUE0gUui9JJmL+G1cqnvNaJoREWY
	fitwWW/CTWT465fUhBe3sXpAvljaD8PDG5HVdNDOl7qwZ8t/h2rCL9YxQIPo0QYyI
X-Gm-Gg: AYBFou3RQB5e2mX0Vkm8d3ECbYZCqLPdSxTy3+kjIvu1HRMYsNO3JjbfmLjX0th59N8
	NEGZLmTKfjt2U6elmHT7pCL7Cxo9JKml9KmpVTGJ4E3KKAPmvXF0g/22xXipQs9IzkFK5teFoCL
	QNGqup/N/p3RAtb+kCn08zi7pSsA0fuY0zinlHHeLqNHazPtDwm4JHkTkZiyJHLUJNA+gNebIct
	GHE4Y8ua2rGt92oh4LFWBOAmqzSWbTJwQDjHxFMZefbeivmSLct0BTY+zFFhQL8Slc06P46TM11
	/9cAqFsHravNvH9M/pKoK+SA0OB0oqHDIyoSWoclQu+9bYxpbyGcy7xPXz/KN+xpCtfjwq29bEP
	jcUpspbDuN2Z+80iCRkNF2g==
X-Received: by 2002:a05:620a:8794:b0:93f:43a4:a48f with SMTP id af79cd13be357-940ef96b4d0mr926285485a.5.1793010836183;
        Mon, 26 Oct 2026 03:33:56 -0700 (PDT)
X-Received: by 2002:a05:620a:8794:b0:93f:43a4:a48f with SMTP id af79cd13be357-940ef96b4d0mr926282985a.5.1793010835661;
        Mon, 26 Oct 2026 03:33:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4459918a8sm3369634a12.32.2026.10.26.03.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:33:54 -0700 (PDT)
Message-ID: <4795f0df-bb11-4c4c-aa05-09b7d4896e3c@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:33:53 +0100
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
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI
 bridge
To: ShiTou Hong <redstone.dcity@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ShiTou Hong <dc_redstone@outlook.com>,
        KancyJoe <kancy2333@outlook.com>
References: <20261023072832.2642647-1-dc_redstone@outlook.com>
 <20261023072832.2642647-2-dc_redstone@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023072832.2642647-2-dc_redstone@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfXyVfxrDHjYk9e
 iFVe9PIMqzVkkH08Syp6xMEMWEcqgxQM+0gWFBL+OPQAogreoYYZxbvtjEgS2U5lZfcOBz78WYS
 FNnee4bU5nX+xQ5ZfbgHkpsZqJV/yWTVkUQqPK7djzUvm/9T/GkblAe65OMcOCcr4AfcGwC4xKy
 eI4Wd0QdPeGM+wyDvKOIcwj8DupdNFMe9A0cBFmCWeR+rL7ASUVUB9SJIoCl6lV51zdiJBiC6Hj
 5Mm6eEMG47JslpiUAg+AiNPkeqiEOgwQ2RyAAzRkBWuPrE7ssIPPpkitVAbk3LYD7G/KK4EDix3
 M+CtcTIMW2r3oFBdQ+Pap6ckuKOvQBMMNu+psT+gHpJ8w/YoBDwXI4yncmX06XYzTK9XrdIEJyq
 YirsyHaqdK2BcED3inBL2q34Kj+XggjVLkBDV/okszxMx15GSNGvOZpvU8udkshDjZcpgjWVwkm
 bN9voyttN/be5MYUD8w==
X-Proofpoint-GUID: zC0Cc8z3qEaNMhczw2WmfHPwlLajcwMg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX4+90Bx/byycX
 0YKW1mm5LST35M04QqAYxGirN76J2S5uZK8ub89VPGyS//uwiIBnxHMBxy5HmFEJ62NAZIIGATn
 +cRoKTiJII5Cjg7ViQXU2nEDhV3Fx+s=
X-Proofpoint-ORIG-GUID: zC0Cc8z3qEaNMhczw2WmfHPwlLajcwMg
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf2c94 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=biRb7e_lRXOmE3YyW80A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260041

On 10/23/26 9:28 AM, ShiTou Hong wrote:
> The sm8250-hdk has a video bridge chip LT9611UXC
> converting MIPI DSI to HDMI, which hasn't been added
> in the dts, so we have no HDMI signal.
> 
> Add the 1V2 supply node for the chip and the HDMI connector node.
> Enable the i2c port of the chip, the display controller and DSI port.
> Add the pinctrl of LT9611UXC's RST and IRQ pins.
> 
> Co-developed-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 105 ++++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> index a049d78f5..0bc946682 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> @@ -44,6 +44,18 @@ vreg_s4a_1p8: pm8150-s4 {
>  		vin-supply = <&vph_pwr>;
>  	};
>  
> +	lt9611_1v2: lt9611-vdd12-regulator {

Please keep nodes in order:

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

This DT may need some love in this regard.. time flies, 8250 is now
apparently 7 years old..

[...]

> +&i2c1 {
> +	status = "okay";
> +	clock-frequency = <400000>;

Keep status as the last property, with an \n preceding it

> +
> +	lt9611_codec: hdmi-bridge@2b {
> +		compatible = "lontium,lt9611uxc";
> +		reg = <0x2b>;
> +		#sound-dai-cells = <1>;
> +
> +		interrupts-extended = <&tlmm 1 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply = <&lt9611_1v2>;
> +		vcc-supply = <&vreg_bob>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lt9611_pins>;

property-n
property-names

in this order, please

Konrad
