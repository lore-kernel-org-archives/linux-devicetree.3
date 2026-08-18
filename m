Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7993E276A
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056888; cv=none; b=hqeVsip4aA3pUKt+5Et761UIPIF63xIyHXDi4f8hlreUPaB6k3zkEoI2W8uyQu8orphkXvg9iZvcgLEZdm92bnMmYG3H2fKp1zG6Jj5zpTeAM7L8EI+oMCZaCpHYkJtuansABku/DOqmyOS+Oni4s68I0yC2V7FRjH6Ca2VtCko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056888; c=relaxed/simple;
	bh=6QSkho6K6D4RepOlHx3goC1YGgDnUBI/Uahfbn4C2C4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Usqj3ghddeItXRh/hRdOlK99XdxGXQplOZ58kYSfBVcwZsMlAyoexqvKtpBcXhr3ikvjiFPPLHzNlflSAhwPu+ab33CyduwA5GB3vC3AyvfWFLo/ZW4+4pzV4JZs/C2mW03tJLO35t/oW4PZ1OUNcHfh9hKKWBU65qAMZgPtZf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhvHLXgn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXqfMmCH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhvHLXgn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXqfMmCH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABWoJ1021660
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lfFYp5KxQ32tNseOFClbJYn6i0Vk+UFQrS6NM45qp7Y=; b=KhvHLXgneagenG7a
	TJl2JpqPHsu5Z/eDKgyCRQbfOeg12kT/Twe9rQZNkq0LmAvE1MumCePkthFm3joP
	UWYMd7x5bMKH0gYSDBUl2aB0s4rpvV1g/6ObFBjlA0xXR7LzeNx5wGTK7VRzAGre
	bAynitKFD11n8EKTmlr7gFlTQBap31wCvuua6f8HPxoilviRQJwa7DyRXZyyvIbS
	XJLduckqkE2daAJfZh+rpZB+EjoKiP2J9UqLwVCYRIN707KlGZ0xLr4nHz77vIdG
	/YyPgOpwpUtQToYmndD/NtDBBI6hnhfs/jDIYP9VQfnqS+WyWwUBtiSzKmZ3JgyP
	JxlmLQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g48q0upwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:41:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936bd9b045fso6747285a.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 05:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787056885; x=1787661685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfFYp5KxQ32tNseOFClbJYn6i0Vk+UFQrS6NM45qp7Y=;
        b=YXqfMmCH3SzT/OZls/daNAkvYXsDpyG+Z/kNXFXYJdRJ3drNYVXhIAWCgRU/A/OAno
         lO5GzDBUGVLuLIUcc8WOocr048tYwuyzH2dBMRV0Hua21yiwmS97CguwN8KD+V9fR379
         odDAEw8nkuG5J+4cA+FW9wI3JL8CWV8kSFkG/UGnTDFg6j9A5h40klPSRw1rwefXMJXz
         uNomuIHqs4EBrnwzOxBD1R4TGV9hW/4s1Ps2ZvRnDyvlVntB/hQ1Umikwf+cWPlBljum
         8YOYKC1vgAPG4cfaE2hyT3bXcE0c3CHwIdR10kKiKlnIhNS0TTbeyn4k1vgfE270qQVq
         zBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056885; x=1787661685;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfFYp5KxQ32tNseOFClbJYn6i0Vk+UFQrS6NM45qp7Y=;
        b=s8BCH6/eUAtgfTB9pB+BjSUasYR/Ecf8Ub10mRDBUtlRn1Tz3d2yNIbn+MHb78dFgG
         JSvQQlhJK6GuidhIe3xpIXvgspoikMym3YqN57CKWFEOXClKiOsgEzUJRbs8ThqFWIBI
         w7DvNnw0DgmglVbsN0sj4zqoPND1tPg23HSW2re9avqEygtR1CZlDO/RYPgkBcY9lNYv
         7dS+8cexP2mUSeGVspS2cpRmVBCDENW+n3KdOvGY1/VK/DKWdP/ktOW7UttFybL69IAY
         CBz0kcq23XypHCzvoLFusVcNLnOMGGRKw5pXJ71n+hcZI8t9PfecDB7g7skwqKQ4Egm9
         PKhg==
X-Forwarded-Encrypted: i=1; AHgh+RrHnlOKMiOjAab3EgJ6/UBw2rAovDCNCAx7llLMiv6P0JHgysBMelkLiE6PatNuFvEaPgvfKCJLXsLW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7b2v4Bi97rpk4qy7krWvRGoCCLkJ8qM6EViPZi+QaCSxSL5bY
	axoWE+bxNIvThATuHgJLhSt2isK6g/mj62cwuVe6WLzd+caHPJgLsi5uMsODukkR0xml4ooa6PW
	E29y4Il84VGuITI8fuAKAEOlkWKob/UEUyrujWT7OJv0BJ7WqT1vX4c3Ns7dVxOpM
X-Gm-Gg: AR+sD13cphM6W792aAfrZ0EA/r4j9aIjylwvjIlizqtqtMZQ4nnp67WyqH09EQkccXK
	nQrYldkDa9HORLDKCHH+k7xNQawiKJzQSFa5jRMxJkraMTvDB/7jscBhPjQDUe4pOM8am7mp7Bp
	N+qz28eWk26E+A9kb6Dqg2f5wCtWCAYJdbQeshuxrcbKviKMdecoUsrucRW4ziydZPJ5n4Fz7pZ
	IYnzmEXI/ATPo70UK1iI50PHOUNOBc+ueKruDwo/YItOvS0U+7FWbH63EZcJqwCtoSWwG4fq4h4
	4psp9/aAAsXFFxc4g70Gy0rbItB60yKzyDKTrga+SanMo5zE4iURu2reBuKXFCGHpQKLsCE6xpY
	C/wuQKUv7yDOs6AsvrcsuBQKP
X-Received: by 2002:a05:620a:600f:b0:931:23a:83ca with SMTP id af79cd13be357-936d23849admr2611789485a.4.1787056884521;
        Tue, 18 Aug 2026 05:41:24 -0700 (PDT)
X-Received: by 2002:a05:620a:600f:b0:931:23a:83ca with SMTP id af79cd13be357-936d23849admr2611783085a.4.1787056884066;
        Tue, 18 Aug 2026 05:41:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b97a22sm140036766b.42.2026.08.18.05.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:41:23 -0700 (PDT)
Message-ID: <1ef41a49-dcf8-4252-acdd-f7f3c1210c55@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:41:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219
 camera overlays
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260812-rubikpi-next-20260615-v3-0-06e21232d8e4@thundersoft.com>
 <20260812-rubikpi-next-20260615-v3-2-06e21232d8e4@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-rubikpi-next-20260615-v3-2-06e21232d8e4@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfX84Dj9WlLizdH
 mDuqbGaOfG17D3JITRBFzUS64FCWEjUf7yFdl4FA+bBpb4llNcKr6mcRr8gl+tXc2ppfN9VINci
 j3UAfe1955KnqlrQxhwGG9aaVHUtJ8c=
X-Authority-Analysis: v=2.4 cv=VuITxe2n c=1 sm=1 tr=0 ts=6a8452f5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=Wdb1h0LgAAAA:8 a=UnzNPPs-tNYotgR03joA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-GUID: HHqsiBfB4y8ut-WgXncfF6XnJO0nWHwX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfXxMOZhaQW5ZjV
 FR1Sb9dHWy8Y6wvhwBPHSOmIhV3kp6TPaB/uKUCakw0Kk4QZ+blfvR004c7mpvn2RAVJvf9geGN
 EXXrMPLw3KlDpOBflDghPfTa0PGzskCtZk410lHA2np3QFHCuhz9Tm0K/SZdqB0PBgiN2xniJ0d
 R45BpCKF1Hs20fXHNBBx26u0aFjtkkmkJ7KVtYZL232C63oRlWlzGvPpbIGDpVmfjN5cxpDM4xr
 df2u3YVRJTMh5Lft6JeWih1hRyMPlxnva//hRMMTYmf5bivZKFfzGyyPMRBdj4FZtXkmh7r+82Y
 wkDnCOQ7EFWiDMXoZv1fUW+2sXtGOqoAkH08WZL5ZhzEKgbUm+OrRZFUigw5W7mBrZQN1Tjw++O
 ywnsiioObA0wOARAHHTHHtPBnlu4HLn6FgKmPnrnbW3vTHXrSyAgMZsB1hny45DyjHj8Q4dECTZ
 /ckxGE4cMvgeMr8lCtw==
X-Proofpoint-ORIG-GUID: HHqsiBfB4y8ut-WgXncfF6XnJO0nWHwX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180093

On 8/12/26 4:22 AM, Hongyang Zhao wrote:
> RUBIK Pi 3 ships without camera sensors, and its two connectors support
> multiple modules. Keep module-specific nodes out of the base board DTS
> and add per-connector overlays for Raspberry Pi Camera Module V2 IMX219
> sensors.
> 
> CAM1 uses CCI1 and CSIPHY1, while CAM2 uses CCI0 and CSIPHY4. Each
> overlay describes the 24 MHz sensor input clock and models the module
> power domain controlled through the connector PWR_EN signal. The
> baseboard supplies VCC3V3_OUTPUT separately and has no per-camera
> regulator.
> 
> Describe each connector CAMERA_GPIO signal as a privacy indicator LED
> and associate it with the corresponding sensor. This lets the V4L2 core
> control the LED while the sensor is streaming.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---

[...]

> +	camera@10 {
> +		compatible = "sony,imx219";
> +		reg = <0x10>;
> +
> +		clocks = <&cam1_imx219_clk>;
> +
> +		VANA-supply = <&vreg_cam1_pwr>;
> +		VDIG-supply = <&vreg_cam1_pwr>;
> +		VDDL-supply = <&vreg_cam1_pwr>;
> +
> +		leds = <&cam1_privacy_led>;
> +		led-names = "privacy";

No reset GPIOs?

You should also have a reference to the mclk pin state to make sure
the correct pin function kicks in

Konrad
