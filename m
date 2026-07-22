Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A10A2EACF9
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784700937; cv=none; b=KSX3G9828IthgiPi0Rb5tuwwJ1hiOGzdqaNEy2TZqcjmNXxg2jOg7aUCznis0t+KBCnOGu6i7HFxfDI4/lbaBXOuGGk0eDlzcBNHj1dSIt0iL/pf9y9XNLwGuUxXP7eMNcS/nrPaaVhLKR5MfBjOBLfdRQmhTWrfSVSaiLnUPY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784700937; c=relaxed/simple;
	bh=qbmS55a4/XsEyhh0g0JM08u+BWNNaItpw+EELnt4P78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nc1RLRUQ4cd9r3GnPNxe6tk1hrmF/fd8/RNGkiZmvQRNG6AVkxJSfywOlnT3gxYo88uis1ytaVd6nNJZu5cSzQWyn2pZZsDuAP5HeA09p9BofE018n1mGTaltSJ7aXi+NnoaTbXnOt53jxlWvvGEW2rTidkWodu+IM5BWQ1Yy8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zj0fP83T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H35lZRN6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zj0fP83T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H35lZRN6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53rga3917829
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbmS55a4/XsEyhh0g0JM08u+BWNNaItpw+EELnt4P78=; b=Zj0fP83ThECWDScu
	Splw+uXGIh8idRDBRA9dw42YzeadaO4GnZkXSnkjap48K85AFAxBYHNN1d9s5jBf
	V5jm/zffmmzUvh4oLpPRjnwNlaX93OgRC9mBnrwLD98zRrc1r2sfoYhyPbcFcnvF
	odQdssDozPseIO0lXYCeFrSvlRmu457oMzv0IJMkr9tahp6Psp67e6vugSqi77jc
	yNKvVwelryZNV1vgP8jPHh8aDr3kp+FB3UVLAnJ5qTAF1Hi3f+FLRcKvB8gbANu8
	nnUfIZTVBIPkyGRryNmqOms0NpzISGolYefA1HhlfLGCUwd+KrZuBNGFgOPYz1yD
	f55/xg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6aaf68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:15:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c075c1e25so173263721cf.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784700934; x=1785305734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qbmS55a4/XsEyhh0g0JM08u+BWNNaItpw+EELnt4P78=;
        b=H35lZRN6gngpHP/7XYXPiey5V+moCgwu4zr+CM/C2uYQkhw4KYZY02YvR0VhIBCXUK
         mhyVH/28dDGnmG8SsIv3GAq37xUvmWqlOg236IHN7a02NFFZs560rfc7exmJx5k+Quhu
         tF3X3JKNqJLutuh7L/7/WhsB7Z4t0zsba2Gdyw115SyTjpB0omX0Mzy2c+x70AhlED/G
         +R2TTT9BmlkEPEtZL7/K5QvOCmaI4wW7QoRZvGqZBMcOWp4sbL0FSGiBNE53iwl5avKK
         m29tU56rJtX3AxVfx1ulVMR+2B0T+sbbNcYkjWQei9rmd4wg/j2SgdTNvSEdi2EvJIco
         jMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784700934; x=1785305734;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qbmS55a4/XsEyhh0g0JM08u+BWNNaItpw+EELnt4P78=;
        b=i5KL6WZRmvutcU2DcySKV981ubEWaiIV0g2PApnR9a+hFsxWqp182t7I+H6Hz0Fm+o
         gzNgOhhtYMqsq6zZjKtb5Ugl2BfDHf1maucEzFEJROYeRb/PyW9ELv//fgSXlxAfm4z+
         9sVLUEYnio1wsazrVpKhxEESJ5MJ9XVbbKhnYFZ4GqyHQafCIK+onzKzmSep20W1XPUJ
         Q0/3qaSPsDJNm/RPRunCdw7dHYCnVBIGaGyndEbpwtEsfgIW/mqL0vFB1+Az6GeVlDXB
         3S4hTIWO1QFaa6nYZX5O/qefuqDFcKFheYyMVh/8QWkA/9Ce8Bz/Vw5vMirYcNBmcD8E
         aFHg==
X-Gm-Message-State: AOJu0Yzud7+BMCzAJwNh0tEobeHW7HTaSyU0Mj7qYjAgMQbaj16u4HxE
	mL08kWB8xElm1+/Z5YA1b9j2QyvKSBFJzt65eipjnwyX7SeblrttZerjS3UwP27Oe83hNOZqqIm
	GcD3lhEDORXBOFQ+HMOyzsiWuriJIC/ThqtmU7TtbSG81lUFQCNfKlwHGf/ROXjOH
X-Gm-Gg: AR+sD11y5chyPM68yKgn1oAgNTbOGUJOVrWRaoDFHlh3e4++06ZuZDZythfyEY35YL2
	LIGKnX5K19SBWm7kAhRQFjtxyIuYVKEJwD5Tq4DA15hySEmE/yDb2BswP64OqN9gyKp6VWMg3Ed
	Tmx3WBdlj40imajd+s108K+VjEQaa7zNmtqKYpQcMkkk2I0ccYCQRmQZSyP0jqdNsSzcqIov7Wg
	kAc1T2je2v5OAEGxYNUdbXV1uKA/YUV4BqeNbFgF2RMyKaS1vPnhIxI20/io+NWBEfEZ/kL3PZp
	/2RXoKjIYDN8M55Azyqcv0hJrgRfPPF/ezDeMjswB0+DFcF7LzcLMUlmlpBIC6c1VqcoWqBbMyR
	0Xa5xBCxjOUYV8X3RVEicoekp/dWAlg==
X-Received: by 2002:a05:622a:e083:10b0:527:631:8d6 with SMTP id d75a77b69052e-52706310c66mr35464521cf.25.1784700933691;
        Tue, 21 Jul 2026 23:15:33 -0700 (PDT)
X-Received: by 2002:a05:622a:e083:10b0:527:631:8d6 with SMTP id d75a77b69052e-52706310c66mr35464491cf.25.1784700933258;
        Tue, 21 Jul 2026 23:15:33 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c9d99sm124219145e9.12.2026.07.21.23.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 23:15:32 -0700 (PDT)
Message-ID: <898004b1-45dc-400c-99e1-7ba109e81265@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 08:15:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: qcom-soc: Include Eliza,
 Kaanapali and others in SoC names
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260721-dt-bindings-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com>
 <20260721-dt-bindings-qcom-soc-naming-v3-1-8f275c9d3412@oss.qualcomm.com>
 <20260721160317.67D1D1F00A3E@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721160317.67D1D1F00A3E@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1NSBTYWx0ZWRfX+AWixVG/KYb8
 ar9rYjZyN1arC/mV1lnn6uAPk9rhNnag2fHf8EmM+anmHp0VU9lvrOQqlSi/e7uMNmNugUUArWB
 uywZgJJrTPKCShQGcVKDg2kaU3ekD78DkxiTq265UaNm+o897CFOCVx4PfQx6ieos51c6yALwOE
 6a/r0Y74mlDcY8g2WN6llv5zJErkb8XM5A4T/PNsYSPlFOHsxQNTl0OF/L4G1kXVKTiPGGvcw06
 df5E8eGzTOkwO6SdFMUHAUzvdaYMhYBV4CVXCMaZdjI78Sf4crjICGeQl2ql5+vdhBwzbmAA+vb
 gfcZBOcaJuqNtga2XdkknyJgd41DBQ+y+ASnrYzBrlSmU+AcSjrFVubgbJuqs1HtybngqNm4nXk
 r3EemPiPD0Dv2KWW+MNhdZK7phF6m6e+DhbcsQHxWMtIya4CyV1DJH09moF0Vdc9agNhc+2Soh+
 JaBMhz9JPY5Ga2xup8g==
X-Proofpoint-GUID: 4pe3eoY4rRpQPJH_53Svq3PnKmOuL-sz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1NSBTYWx0ZWRfX/iwHFdZWxn9G
 L9JAtHaeIKRTLcnzZGXnmAcLHjWtYpiAEcFuGPeWAGttY1IVX49ezf0Dm4ywAMzBeZUkL/GdYhW
 1bS1NzFxR2+Y49EuqwLXQhMVg5zNX+M=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a606006 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=n0SlpFEdo9-6FWldBkQA:9 a=QEXdDO2ut3YA:10 a=arBHhYMabMMA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 4pe3eoY4rRpQPJH_53Svq3PnKmOuL-sz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220055

On 21/07/2026 18:03, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Schema validation regression for existing legacy compatibles using new SoC codenames
> --

Looks like false positive.

Best regards,
Krzysztof
