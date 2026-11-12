Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471743;
	b=yyI8JsGpXrRPYVCTP/P9gOI9iWR3faSTBMvZL0vxi2/oR4hsaSeeHxa/c7S8tiuD0Zop
	 zndpOFhrGmkWqkb2WLOJdDNZ2g51y32Hryr9UZ/chHzRch4/g3kjFcaxOI4TMSwNuq0r0
	 mm2la9iBg8aZ7LjE7e6RseXTOZt9yeb8/o5erQ90Wj7t6T9LcijdiSxwNkRAAwyyTjzDo
	 uyBSDeHeY+B0nL9qOkJxjWK7+uJifZ/rmQyIAQX1XoWU97qHY77Yrxaa9JXPM+1EI6tWu
	 guUd+yFnET08FsYaVRPhihY/BQKJY8Lvbb9/nH6uzlWlnI8jujOmg9GNdKi4VeIrhJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471743;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AVn3WXTCePSez5Rn5noeCdq8yUKomZ/xweK/qX5fOHo=;
	b=5M0h6fpUWS6OmEwJ+t9JY+DRqGiaSlmJGdvV2CNa84HnzGqSv4uKpnKCvSjpBEmPOwZl
	 fNbPeRxYZJjbW9MW5j9d6aeUUZX1LmkKpFrzU4wPpe3Wa8uGRpOlPtcZHHfPdm0C4UPN7
	 aURIryHoq+pep9va3qDFoZ+WsY4u3gKl3vm8WUEhsXaun+uh23O5x9ohgfP+CGTgJ2N9T
	 r7cDFlsZkkUIeeSHTMMmTU4SjIYysHhD7BPbYDXWVNtlri3061uOp5XlsmDQ+oNk+JbJQ
	 QqvvxGQCIkYAkyYW7E2UdWIclIRe3pDlhkODF7H8MbWVhbXZQOABRnDzLaNZnvDfvHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gcrjIu7i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qz71xTK5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD44606A330
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AD44606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gcrjIu7i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qz71xTK5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7j2Q5126333
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVn3WXTCePSez5Rn5noeCdq8yUKomZ/xweK/qX5fOHo=; b=gcrjIu7iJ/yFq0D8
	tnf/bIqZRxIaI+rObX9zTYE/88v6CZeImHvG1LHH+93xtUWfUyL10VkfoFi7sAkd
	hkW1l0clQxGmz24CHnOIrxvnlhBmKYDDCCIbthgPxWXkqeUN+KMLjEmzenLw4fg9
	eeLbB8Im+ej4JAdswvMe06nb8RDsdAGoBfadaDZeo7fwGRkqXW5K+J6GD/ZUlczd
	EB2Jox+7lDI//NwfnG1lNM6G+A9/bsec8KxI6HTKevmk6rrFmp0lXBUeQO+5W417
	rMMGUeZiv/oiLatKTxOz4zuFBDN5OfZVX088TwcPMW+qsIKILVJpph88MMj+PArN
	hu2eog==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a0851u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:22:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so3384419a91.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794471741; x=1795076541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AVn3WXTCePSez5Rn5noeCdq8yUKomZ/xweK/qX5fOHo=;
        b=Qz71xTK5loOYszReJvCsgieR5AKIcTJEzYIX7HeAOiTS7VAkmj/+u9GBz2mMLr4YBY
         Znu+6Yxc0Upld0CvcFqUMe2JAIUfvdgY32crtZejiYy7aMBOvlH0FVQJqjev0NmawrIN
         ebj+OGLtthqZWPV4qaDlOvx8uW/QXOgAdlxnRmPdqhQD5Q65fRcIhHygF37R/97gFrMP
         0/JhBEjMNb/fPEMhYflZICcJYQrAzD1uLAMPNFizEtQUaLlnj5wHzzq95j6wWB7z82i5
         pMay/tdRdclofc+s2/oT2baHeizprnZPQjmBRwG30yD5raq82ueqt3Mmi/yVmYovWTDS
         Tjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471741; x=1795076541;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVn3WXTCePSez5Rn5noeCdq8yUKomZ/xweK/qX5fOHo=;
        b=E8TUdV+3SAkAYA7ZTkdSS6P2UjO5XbHvKN0jO+AhQBV6IJlBsc/oEseEzkTTa7xdJA
         YOF22tO+/1AZLv1SuxbO12/lt0tkCRRVrQmGQrAQUWjjYwrAmZ8PBopy9gZ4ivUnOHnv
         tGHUug+hk8f9kDwsXnUcnVfA8kM/m0fBp8LVOjth9updrr21ulpOnf/Gxzyth5yQ8dgW
         IDeS7u8ZHwLQzuFyg2zV983LKlBddVjANDZ0TO6n8mY2+VlUtUkEsvX1Ig1DTsBDMAWq
         KlTJP6Nzgy9abBWXgsTrJn/mPPIOpTFfjDVWjNpVObcYityvi6PTvHuWy2KYEIda1JlN
         LwSw==
X-Forwarded-Encrypted: i=1; AL+hErGIcCnac68jI4XdSIZo15vcFSDflf6HxMS7m/HA1yly8PFceIqsNdg1ednq3cTYjqU8aY6BYLDJEpiH@vger.kernel.org
X-Gm-Message-State: APuU4Z8jIgFZcTwRmVC8EMOjLwvGGc2zJ74rK3UCrXcftJnq4JSHE9PD
	jAS5euM6eNaW7eiuPEUlcaLg0ULLlp5Ble9zYoRFpJY20DYL98e0LF6x3d0QsU0VzoT9hC4xBFK
	YDWLrBqKvvBMY/cHsrwY/GyYxMd7orZEhtAIwMvc7rZvnAzuzBBT/YwR+sLQ9kF3Y
X-Gm-Gg: AYBFou2DvQnNpubc5rIJwly4oWPc0OoJsf7qybNAcNA9PKi0v+Uysldy4gF+G1Koomy
	2L8k/+lOfCxtTTdm2qYphyUr3498qfbHbRlnfAoxq5j1S3o5WtAEwb1u8FA1KWp5wNEJfwn0VnJ
	kByehvSzR4b0QbughihYOJYm5Qv5n57SOsm16SXBaNdfssX/oPBddSrPeIvSHqLrY6AcucvzzGw
	4wOEGnuQeEWVU1t3qKfVDahfAfnqEAUh4wtmYwOgdZGulOuyyjDgzzDGiXzxienN8DYOzzeG9zh
	XrOtZPyJcZ6fOvrbf/AIkJmCLFHbqdLzvApf7ZvpBriSgJ9zemQ+WZZaTD9nGZIDccg3RRmFetD
	oW/kk27+NO+QRfcsay2RCpVoZD8KMZ1ZVmbQgnD/RvYdEyAZlrGgqYGXnOQiuqCm+b5zb/oy7EL
	Dz
X-Received: by 2002:a17:90b:2250:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b182f57211mr5338916a91.37.1794471741216;
        Thu, 12 Nov 2026 00:22:21 -0800 (PST)
X-Received: by 2002:a17:90b:2250:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b182f57211mr5338878a91.37.1794471740510;
        Thu, 12 Nov 2026 00:22:20 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182debb54sm3082736a91.2.2026.11.12.00.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 00:22:20 -0800 (PST)
Message-ID: <2ac0ce9b-f54e-46ff-9d28-511c07a4fe18@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 13:52:14 +0530
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
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: glymur: Add camera MCLK pinctrl
To: Jesse Casco <jesse.casco@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-3-e7b1f403146f@oss.qualcomm.com>
 <20261110221232.3883-1-jesse.casco@gmail.com>
Content-Language: en-US
In-Reply-To: <20261110221232.3883-1-jesse.casco@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: y1hTru3fjolPP2idx0WoUl5zCBeoz_xr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX+I2H9hivfZkK
 I0Ybxk3EnojGQF4pNFVLdrGNcPb1Rk+9jCFeisE4pnzanTASm1JLRUR7nJ/IY77+vBpYHu661AE
 2cKkMvWf3PjcEIf+rjnvKYY0nEZuBgGyk/N6PDnU8TXNCSs41frMcUARhiwco+qdpenfl8T9mbP
 6lYS6nTf/W55kcaBMzzghZtVvziPN0iOKJJZ8aoP5w8BU7FbiOOEB7ShdufsWEXMmsiIj2dTH5J
 plA4haKvY8NU4CZp5Y6AfgjRQDoZvmVdjCoYPjy9c27NYBeNlpWPpc8Vr2XVI07WaHu+udaJnNR
 9j7WucU4g54LVjcVq/nakhc/FwqBXcCdvdbL4e1dTYlDc3xI9Un1t93OhDB/O28gxHAsrYka+1F
 OWN+ieW6jIqNSPi6mDMTVnyjhv1lWhhihovkii2oiCsgnbO94bvo+zl+sXg2VFBKUWkkojr0w/G
 dYWLVCIYGRw8BDN3l/g==
X-Proofpoint-ORIG-GUID: y1hTru3fjolPP2idx0WoUl5zCBeoz_xr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXzV/zU7U3SQEM
 rG5EZEwa18FqThtW7wEbmwXR0gB6UZdxbLHcSUd6kDecMedotl3iztqtHJQPR+f5HHGH7kcpCa+
 sPxy+ij4Oox2zE/1RcD2mH//qvT+ah4=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5773e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=smo19LPPzjqg-eG-KNYA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120033



On 11-11-2026 03:42, Jesse Casco wrote:
>> +			cam_mclk4_default: cam-mclk4-default-state {
>> +				pins = "gpio100";
>> +				function = "cam_asc_mclk4";
>> +				drive-strength = <2>;
>> +				bias-disable;
>> +			};
> I've been running this series on an ASUS Zenbook A16 (UX3607OA), which
> has an OV02C10 on MCLK4 at 19.2 MHz. With 2 mA here the sensor shows
> horizontal banding, and its frame period stretches by about 9%, whenever
> the internal DMIC clock (LPASS LPI GPIO6, 2.4 MHz) is running. The bands
> are already in the RAW10 frames, and the sensor test pattern is clean,
> so it looks like the MCLK pad itself rather than CSI or the ISP.
> 
> Changing only this pin to 6 mA fixes it. A/B/A across three boots, same
> kernel, fixed exposure/gain, row high-pass RMS / frame period:
> 
>   MCLK4   mic off          mic on            after
>   2 mA    0.96 / 33.28 ms  20.44 / 36.17 ms  1.04 / 33.27 ms
>   6 mA    0.89 / 33.27 ms   0.90 / 33.27 ms  0.90 / 33.27 ms
>   2 mA    0.95 / 33.27 ms  15.33 / 34.37 ms  0.93 / 33.28 ms
> 
> At 6 mA the frame timing holds steady at 33.27 ms and the image stays
> clean in every phase, including while the microphone is recording,
> which is exactly the case that couples interference into the 2 mA
> clock. Normal camera use with the mic on is also clean at 6 mA, so the
> fix holds up on real hardware, not just in the capture script.
> 
> Could cam_mclk4_default use 6 mA? If you'd rather keep 2 mA in the SoC
> dtsi, I'll override it in the A16 board DT instead.

Hi Jesse,

Thanks for the detailed testing and measurements.

Konrad, what would you suggest here: update the SoC dtsi
to 6 mA, or keep 2 mA there and override it only in the A16 board DT?

-- 
Regards,
Nihal Kumar Gupta

