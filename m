Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0460B34C140
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886230; cv=none; b=o+ZIAs8wGBgJoC9zDLedDEEi8HMEFwAW7A+UbPatAnQGr3XnWtbLkEXZ5EFWZKDcqqRtq+7MmuAr4jxBAf9QrlDivKaVqmrUxjr7GcJiwL36lhZ6MEYiRXhIbTH2Q2MATC6M2blErba9FwAbwSnGFsrpJcdvA5FojyZLbKRwTK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886230; c=relaxed/simple;
	bh=+PMY/81rPpy21yXKZXoy0/UH4FJLtbQW777OaKV8tHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JykYjt9y6WxNjdam4yQQzINW8tfM/Es1f+60XvaXmSuR3vrxi5NQN2YgOQxZf6bVU2s9gOuSUEyQBkd+EKimtj6UVrW+sUAStz0aPadfejD0v2EnkX4i8NciFS6MvCJNwAHv+ctqX9eWzNQTlYDr+87MUbCbNk1hlib/cF9fvFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2tYKyr8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=biLqTe2i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2tYKyr8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="biLqTe2i"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8IQIr922903
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JaWEQZWW26qUB0UpQWigzCRt6cE6lA4BoKS/zHeTD8o=; b=f2tYKyr8upCq+Mcc
	2UPh3aLmC+nVXmBww/2aIzDlz5igVDv7ahV1ouVe2dOJfzr0iDMTih/N/apdPHOw
	T/Klz6WE8c9gOERHjh1Dx0qqdquyyR4AhHvhsY/q+hOvKW9P4kgcepMbKI6uo6x/
	YpnXLiwOoaZmg/MGuVNNJUhJQ/Fv9DM/ZJzshTvEP5IMyF32V+kyWgLS8V853jJ2
	Eup1HI/4yBaH5DbmSTDRvFHlBEWc2ioRLc9qiFHmMoHuwXS0oNyN5zHDn6SpReOB
	AeLxDS4WC2aLnxGhGHLqo3qHoMh1xzOrYTLxpQ9yfd5u886XQ7q7dTtPHLfXPtS5
	m/e64Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1tcew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:10:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5350d8a2368so6214501cf.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 03:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886227; x=1792491027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaWEQZWW26qUB0UpQWigzCRt6cE6lA4BoKS/zHeTD8o=;
        b=biLqTe2ikpLEyLd6DJr32gw3hSB3wIzMVIwEN5CAro4XqQ6HURnH0DYsJ9u7jVp0tZ
         QJUz6aaYk4g1vjio2qBm7zwMSgjYyMP1yUQ+MXF3aNiOd1o2cZXhqYY97VXt8arnYPlV
         egmwgHXV7KHpR8effcXWHClEZjBhGdVUmr8IjdKqkA3HPzvnOwntIh9J+FJFYVwW15IA
         QKpUX/JzBc8rh0QwdpZzLl+LysH9kMPBKqgO1enYC5hLapU+0/iGE5v3oKERkGZsg0a1
         /VU5OtdMYXdrNGa44QdvSJbeCFxBU/OXOV1Z5TLqzJylds28UdC5os9xJu6yO0+Vr4sn
         DlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886227; x=1792491027;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JaWEQZWW26qUB0UpQWigzCRt6cE6lA4BoKS/zHeTD8o=;
        b=ZrYM6PPk5nmyWcFGYLtdAfmROBSqlxOc8T330HefHKqI+GZ7nfmYVQckO0lKn8Bj5U
         ZLLvpQKzuVtH0R4CO5URu86DjSQ3L6bDWzjr94U1Yb7sNMTsy0IpqqMj/sYb9HSpG/6X
         H9kU9yfoS61OYaR0ph85AMoN5WAONF9KrwKSfs/0o9CARVJnfxtxBVrVMiYPZ3qiUlm3
         4q4k1t0FMYVJ7YeAp18NtEwK8OtjQQvzieZ54/aqumdAUtVi5Q5y3SgYVcLaGCJxlSJw
         WH2GsnZOBaW1dLpm6I/w0XNi8uCGy8VPM9qwi10stOzv6wPqxPe+GBWxqjxgrJRTEZdv
         rDjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbytcRdtxVNIZw35R2BH2hbc/2659g7+sqK5unHK4p9klkG9HwOpvou+iL/x9C2pfSTqQkzWjwRikI@vger.kernel.org
X-Gm-Message-State: AFq9FYJt+xwEIToH5hSo2kkVX4jWCdT4Za+XgBMpGUp7xNybwhJTFmKx
	GFONvvhiQ++0sCX33fEghNJ+N7N6J3soKQa9/g3TuVYQPpp8+zjxcLPv1iAKuzfktw+ftA85xjL
	wGCKedQchyuVTCfHj72Bcpr8b89HcgrFbwFxf9Kn09yFaNo/DBp/nAXyns9xMVCPe
X-Gm-Gg: AYBFou0RrhIA+KD5ALCEIrdx8qLKahgUvlGwNILaCAKEpEpwgFtV/NpR5+CHMpLg+5T
	c0A+tNp4swcVEsO6S15Tij4aVnMvtF10nYx5EL2BsG2AcHQfvdNO4XToErpUtafzyVRWeUEBxwh
	C4dXhKGuznGOQvPQjwGaK8SzSt2NHmVI9AUItxU9Pe0oG2jc0xicrKBMKtpG+lGAf/dk/eZFcmt
	44L5bo2PeEXpZY4xHVdzEvcG4iKhPkRV7S14TNTqw9QhIjHgWOfgfbD1qDl8n4IjoGYP7Ybk8/a
	MgQ+8iKpVEWQilrkRG4vrZrrZyWfxsDRBQaNp8ZU4k9QlkcRrXi82YolEVDXRaIwdpDrunPaNzG
	YV2uAXDHeZhn0Q++4xcLe4Q==
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr2138499385a.6.1791886227102;
        Tue, 13 Oct 2026 03:10:27 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr2138494285a.6.1791886226526;
        Tue, 13 Oct 2026 03:10:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3350fcf309sm353463166b.39.2026.10.13.03.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:10:25 -0700 (PDT)
Message-ID: <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:10:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
To: Luca Weiss <luca.weiss@fairphone.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jasper Korten <jja2000@gmail.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Luca Weiss <luca@lucaweiss.eu>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace0394 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8 a=6H0WHjuAAAAA:8 a=RY9Homj74iP04qnvyqkA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=y4cfut4LVr_MrANMpYTh:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: CGug8I6rHEChaH8A2063VBazS-UPXAoV
X-Proofpoint-ORIG-GUID: CGug8I6rHEChaH8A2063VBazS-UPXAoV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX+BYxxpaUVfTY
 YyPs3veqYN+64/oeXH6DeealcH2foyBPXIJj9Yn6pfbDZIwL+C25+CesMhcPT6xeTByj+kNP5Vs
 nbDxEZZZpuqT6kXI6IcSOnl1aMN4GCs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX6TgqD9FCwnew
 HcnrjIweVTOyPDg50m2q7KemxtbGoM0QjMKHQTe77XmJs6iHkDM0fsnzrRo+4L8jAVCIgGr5VT6
 c5nQuLxOe+yRTopIfVoxMB7wvzv+S98ZBs8JAFBSST0aM/O8myCdDvf27Rr2NpzhPYKg9YvqykT
 ieSx2NBBKeph4DzRKpnaV8L7kN86xi3YUF7c+86+Tc/zNjAg855Pkk6yYpAgPnykWQFZU4jzAm9
 XDXeEKnantbxgpPATM2bguNIVP8XhVHFgyo8uf9RbtqUyDgy3+uYl4A8Bj5ffa0dnxU42d5YA/N
 BYYrq3Lgy1wwE3bGNnoTIQyJroS1hwz+DUEvLB8OAc9kPKSNWc+tOuMlDZk2uDbjJFEBL4kgJKQ
 65djXYu15phnHmF+8hKdI+EfliMcKuBO18wz8p3EQquYpM3xSI7hpWSS3I8nYsdVgkLTHXAIUmg
 9mj9/W4q3Iqu42fSZhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130040

On 10/12/26 8:11 PM, Luca Weiss wrote:
> From: Jasper Korten <jja2000@gmail.com>

[...]

> Signed-off-by: Jasper Korten <jja2000@gmail.com>
> Co-developed-by: Federico Amedeo Izzo <federico@izzo.pro>
> Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
> Co-developed-by: Luca Weiss <luca@lucaweiss.eu>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Good to see the Lucas are in agreement ;)

[...]

> +&pm8350c_gpios {
> +	pmic_lcd_bl_en: pmic-lcd-bl-en-state {
> +		pins = "gpio7";
> +		function = "normal";
> +		bias-disable;
> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +		output-low;
> +		power-source = <0>;
> +	};
> +
> +	pmic_lcd_bl_pwm: pmic-lcd-bl-pwm-state {
> +		pins = "gpio8";
> +		function = "func1";
> +		bias-disable;
> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +		output-low;
> +		power-source = <0>;
> +	};

Drop the output-low, the consumers already take care of the state

[...]

> +&uart7 {
> +	/delete-property/interrupts;

Let's add a space after the '/'

> +	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
> +
> +	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;

And let's wrap this line

[...]

> +&usb_1 {
> +	dr_mode = "host";

Does OTG not "just work"?

I'm assuming there's no pmic-glink on this device?

Konrad
