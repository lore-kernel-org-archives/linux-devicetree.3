Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380D43D75D1
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717950; cv=none; b=HPt5WFJV0dXRhn6AmwEulPWx8Fadf/cDVoXdiwwIHg+P7yd2H4Hw4aiS9e+mnIj3UqriKon7BlDBHIkEj7ZXGm5UpJlR5ioEY1h73GJkYHdVWFNm0ZRTOz1DUftQkb/1vm5zmNOxZBM7TeGSwlyxPDURshCu8apbWHGZ67+G01w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717950; c=relaxed/simple;
	bh=5atLXmJiGNptA0nCAYPVcdIamemZWgjIGDmgSZ+vNFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MDIoOBqTeZkjisnldoMQN0CQApMNFSiwjySRDpBxIaEgUVqtipe1UmZF/2ski9F80UDdP3ILlggHniLrOljODuL1TYuqajjJNMnc6/CmtDGSZ2k84W8xIr4d3Gayw6pdPMopeLSfODjQ8LyVFh7tJXJ6d2IFy/f6IdepxTN7v5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwKHfml6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C3T3gMZ5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwKHfml6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C3T3gMZ5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rJ3B2101574
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gWqYKRPbpU+v7Juw2eWCAbJw3diM4+VtSUICkDNF+Ws=; b=GwKHfml6NFeFC9Sl
	IT9kgUMXf2yRSJ76sBo2n3e/GGTeQGFYmzrqcvLpxy/l/2x7hgwmj7/RwysHbnuX
	xIfQcBYsOl9wkDwhXIB6oGYcIm/HuTd7yKFI7PeSA55HznBLV6tBRwoJ8ck6bouC
	ZKevZGsDtorP0xAl+OlFcsu3ddTGGM0diCnNDgwhkT+fhdj7jaC7X/rBuJ7V9L6I
	4gSX8mr0qQfPN2xM/KcPVu+hzn0typIFJ9IRkcaykE/LYIxCn2uHOXBhtv8GNdIQ
	jVuyAGTMRfVg+xd3XIoSFX4heTCeP6ejmY5uZ+8VxxjT30yliObu4l1fqYnCVH+8
	RTxXNA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279cn4qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:25:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c916d17dd43so3070410a12.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 00:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782717946; x=1783322746; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gWqYKRPbpU+v7Juw2eWCAbJw3diM4+VtSUICkDNF+Ws=;
        b=C3T3gMZ5kXadZ/Ld5dhL2KKNOiKCCZpe7xnZSrHtHyOLTQMacCDPtXlakSNa84+nmw
         z0teSEcP6vuMdQj0QGpGzDr8I7KfOB/K6+Eb7/2zryzWus3NewWfUVMhhZprUnpnQBKj
         vl7GMuYKd+Km2/XeEvlIYJfov/VeRwae/O39cJE6l3PaH86jRagqto4wOUEuJ3p+bJs6
         JKOIQexzg+hNW1aNAIJh6jUfqwWDEzlRmcgYxWnJjUibp3/YvGOjk4n7j2KpHWTWkJn6
         Aj67m2OFbKNpLYieevB/lHHLyywAgMmbeohqwCni2igUIRPBsbEk6swLPrwJsJS6pWO+
         PU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782717946; x=1783322746;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWqYKRPbpU+v7Juw2eWCAbJw3diM4+VtSUICkDNF+Ws=;
        b=dIO95s4AtUuDjmSYrS+Vcp2cJq0TTvAhrHv5ELx4srD1J7/R2cOU/fRAOgjJuEf4Fc
         YwTDQwXjULH2NmVbpdG0V2tjoOvXRokDwaCup/e8cr6+tAb4bQZBluM3ymov3omfOZZp
         I2/yOqIPOxI+vraBNWU8WATzNgS1fUABenFSEQerGs31L0cEz3Tjz6rUtbxuE1H/nEOU
         7IIx0bsBjA6Eax91rpEK4r26mqY7p5TxCxpGvYifSqvufdQZBzb6Y6WEEB4CR6BnmOZF
         aZDpxu3oqJqKKybtc8w9tVZUN6lSvY8enaFgwNrQoNALljJfphgbSB/0RG1TJeFcTn06
         TSHw==
X-Forwarded-Encrypted: i=1; AFNElJ+P0VriSMkK8c+jCQfKUkNM7g3KHvr6AOm6nZGPJpA4uokeKblB7U6QN3rzGIiFJ8lrHrxJaJsdvlzo@vger.kernel.org
X-Gm-Message-State: AOJu0YzEd7riAI7VCgUHUuJ/Y8lwoP9n7eXYe85/sS7ftqbW50mL9yFo
	l1SYWiw7rX762sDh3jnjs5MAER6XJ1ED8Dhty7i9VXr8NKwb/JhcdHPfizlZtmyp24QFHnR4wQI
	BsHJWyZethg4P/PlcYuFUJ4lY2WAJ/wLaHa3M+QUOzKGkCVaG0CrHAfhhoJx4uUfi
X-Gm-Gg: AfdE7cnWJGGmOn2L7jNSECk6d8zRylcZhPMB8VvEhyEryXGD/eSn7PPrpNz2osbwaHH
	wWv9altpBnY8DpaiZfuQB2iuvSUe8WByOO3De023i+5Osbi9VA2DCSaONnzdQ6ts1y3UQzS2SfA
	hgsKpDKLIBHUBHV+fXdMiFUOGq+8hLqnY4vpfCKBwcG74445ymK6UcqfuJcsTi1YZXm5g/FCsJ0
	k1JPs0SeJSfjpHPdHIWfxy5nwr6hsipTgCona5HTGswv2/+aE75OuctJILQ2es0KvxaJK/93U1j
	uc0/wDQyhM9BaajVXuj27aG1A22N76cyLmDPoqe8v5BxbhmoGhIiQNix9SGIAyGk0+eXJUqx1Ho
	9GXMtOrXgMkcfwbd8Zk3aTS5c/qbrobgTls2/3bk=
X-Received: by 2002:a05:6a21:8cc7:b0:3bb:21ad:40d8 with SMTP id adf61e73a8af0-3bd4afac2acmr16932459637.39.1782717945594;
        Mon, 29 Jun 2026 00:25:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:8cc7:b0:3bb:21ad:40d8 with SMTP id adf61e73a8af0-3bd4afac2acmr16932433637.39.1782717945055;
        Mon, 29 Jun 2026 00:25:45 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c965b30bb75sm2954440a12.26.2026.06.29.00.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 00:25:44 -0700 (PDT)
Message-ID: <276e001a-00a4-4822-849c-f1c0879b81d5@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:55:40 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: shikra: Add MDSS display subsystem
Content-Language: en-GB
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arpit.saini@oss.qualcomm.com, mohit.dsor@oss.qualcomm.com
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-1-449a402673d0@oss.qualcomm.com>
 <hwn2kjauk3xt35cwmv3ludr3sxrwklf4n65p2tziox6m7req5o@lldl2cztbqi4>
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <hwn2kjauk3xt35cwmv3ludr3sxrwklf4n65p2tziox6m7req5o@lldl2cztbqi4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a421dfa cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=C4UGVmGH2tmKGqTjtowA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2MCBTYWx0ZWRfX8yc6Oeptilhk
 WcYJ+oE/wWueTpOWJps9ncRcQz7EqD2pPncEYPOAFb9PqlapoWIjbExaBLXJ91b2AimjIX1ODTw
 Wc6Ys162Zxe2YsC2gXLAGnQiCApD3wE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2MCBTYWx0ZWRfX6yNrx+UuLMAc
 Qu6J5bjFJVRIHtyKh7m65sZshD1MJ7yvyHXE7DTGpc1u8Si46tBr8slXMfqXMUU20z5K3qPpBSZ
 6LshMaD381BYK0QUQoHLzNBLpSAOIXzq+YpFfvkMEZef7ZnbvD9awmUHqnLz0r21aaGMuVm3OzD
 aNNwbZt7RYVeyV2M8H+Bo5cij3sj4TgzIUGIgs/fqrZ8X6s/vBphYLloTfTe2yDVvpWiPtCX2oK
 UAFBVGqp4igfC1XH8yBmYQCpQQ/7LnyB8rh08aP3NOHpng2NFmexSfqrhAqrQvRvg+ta71n7Owx
 taFmOvNT8PG2NILz+NrXA8ZynSmSd8T8982jjmQQPsXFC7BcJFEE9tosD9iTQqgozyyESjeSh5t
 Zr3rQxCnxyyg4v3SCgccrYClEdvGG2o7qLPEtZnnM6WRhu/BbNH78wATSHmEYs709HGlxSSa6co
 32XzSc8xDSj05y/to/Q==
X-Proofpoint-GUID: sln1D2luJIL9QPjxVR8Ky5QGt7MLciAM
X-Proofpoint-ORIG-GUID: sln1D2luJIL9QPjxVR8Ky5QGt7MLciAM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290060

Hi Dmitry,

you want me to use this generic power domain index ?
=> RPMPD_VDDCX


Thanks,

Nabige

On 6/28/2026 6:05 PM, Dmitry Baryshkov wrote:
> On Sat, Jun 27, 2026 at 03:31:35PM +0530, Nabige Aala wrote:
>> Add the SoC-level display subsystem nodes for Shikra: MDSS wrapper,
>> DPU display controller, DSI host controller, and 14nm DSI PHY.
>>
>> Shikra uses DPU 6.5 hardware (same as QCM2290). Platform-specific
>> compatible strings are used as the primary match with QCM2290 fallbacks
>> to reuse the existing driver support.
>>
>> The dispcc clock inputs for the DSI byte and pixel PLLs are wired
>> from mdss_dsi0_phy.
>>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 203 ++++++++++++++++++++++++++++++++++-
>>   1 file changed, 201 insertions(+), 2 deletions(-)
>>
>> +
>> +				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>> +				clock-names = "bus",
>> +					      "iface",
>> +					      "core",
>> +					      "lut",
>> +					      "vsync";
>> +
>> +				operating-points-v2 = <&mdp_opp_table>;
>> +				power-domains = <&rpmpd QCM2290_VDDCX>;
> Don't blindly copy bits and pieces from other platforms. No, its' not
> QCM2290.
>
>> +
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
> [...]
>
>> +
>> +				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
>> +				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
>> +							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
>> +
>> +				operating-points-v2 = <&dsi_opp_table>;
>> +				power-domains = <&rpmpd QCM2290_VDDCX>;
> The same.
>
>> +				phys = <&mdss_dsi0_phy>;
>> +
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				status = "disabled";
>> +
