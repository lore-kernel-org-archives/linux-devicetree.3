Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610538;
	b=j5gAq5ZBvoU2ZjvFU0ZQuC6a6Ofxf/jHSNty2GA1o0a9Be9OfkEvQTzCmc8VS/8y2ZHI
	 imFq3d5iyqHEk8IHELMwpfMBFGSMtZdSNJ3/63z7jsBA0oTexxykwy8ZWI2/EwxwyyERo
	 4CstUBIrvtYfwNuMrQ0f8KrTVxyy+7UnjjwfDXwn+hnAra/vCjGDPDbNjszugOpaRmplJ
	 jGfNOD1qEf7rq7WcOvGldG5N6Qx8MfCLGGaIkkaNJ9J/i4fxTYNrN7FJ7fj/GpE2wsdxr
	 kLATBRxjw+x9QTQOCop6SBwoq6sD/iE2PC5HWo6QAbfdJez19nKrIfLnq8rsv3ddhRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610538;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C6GCM2V0jKSRe/TZ9SpYYgKb0vW1cHE30CX742jw7Y8=;
	b=e5SwCV3Zzb3qR2AEJ/U7ZZbpHwhc1bMTJ3XfzROAUCfVO6tNpXaPAo18Gg8QHtpkukmH
	 5T/4Y4mX4Xf6LfSsxdDOJkzRpAUzA3aVAS3XOZ9XivjJG6uWanXXok4I247SScUmfMqDL
	 9Zfs5nvnK4GVI9iyyU7JIn8arLFVHDR1MZS/PG8ZosjDoFg6X16z532uo2kT6INiJdPRw
	 Av5XUpKStjO7fZjfljNtMSqb7N6TVwyw1C9F9VNJv1MfJ51T0QXwld//F+N1h6afdTbze
	 k1DFw+kysXYR587BnN0JHyKs+xDRhceg5ucHwg9Qz/rQtxCRGdjzpHn0SZ2cab8L9QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YoMp8Q2h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z5DLpbee;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3605606A327
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3605606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YoMp8Q2h;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z5DLpbee
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mO4A2121226
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C6GCM2V0jKSRe/TZ9SpYYgKb0vW1cHE30CX742jw7Y8=; b=YoMp8Q2hy6kKxcBG
	1umjIj3ZIBP0C2iyyYjf/pcpCSgxuP9/4LbWPyFe9EMMnjmSeZ2vGjkmw0vA+oIa
	7RdtUeu0ByfL5KL+hRXG+xReQoMxs5yvsaYBZQcVTnxN8nHsMhmNfUNb7ilpJlis
	eEmBEH2wS2TDyrmxqOfBqTrv8wvrIP/gOa5DWKH1gbfUEprKyOdfHtRlT7FP/0Ci
	0R8yp9evZnz2W/CKFJ4wJ9//Ga/FxzWomqLNhyW4l29TE4WHbWAjIkl+EKZNoEll
	vE74L7TCi2AjzrTa2/ZrIx+CHz7xvUfT2Q2wODABSUXURsBrHAc2V1XwafU1ARLo
	Ss4TTQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukrutm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:42:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cddf142187aso2816492a12.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795610536; x=1796215336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6GCM2V0jKSRe/TZ9SpYYgKb0vW1cHE30CX742jw7Y8=;
        b=Z5DLpbeexLsDWoVF+K6UoC6rbHBH7jaopku3Ou6RNk5BU+iQvwUoOnDYqycoSRxi4V
         3K84+A9gz0zeqbB+rfmwJoLs5ZRarw8tMqSwfYSK7k1k3G3qtHFCLkncfUoXSqNOV/wf
         lCR7AOgYv261i3L6oAR0eXjQVG/hHqLLt33x6CH4GkerYtXJtNltFvRsL9fvHcXo/czN
         akCy9PAnolfyuEBfHaYtgf91i8ugwQVSZxt01aWtt2WmwBop12cCHYVHjWJ4Gl8J1U3a
         JgSwVOfb8DxQNN4BdXiCOPnE4FY7cMWsFBn7zn+OcKtClan9wv48TMm+M2cqfXhhf9xy
         axhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610536; x=1796215336;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6GCM2V0jKSRe/TZ9SpYYgKb0vW1cHE30CX742jw7Y8=;
        b=plP+iWmCcd04Pw2QfbhjliGEG1pc+J4Aal/bJ2jUoyc8ebvp38Yd7DyCP++5xzVw9c
         ae1m2nBq5OCCvz/OvV/pI8UXPSNBbw69KkoKjLspWqEywdUGM6P0iWH5sKobBWeuWSsx
         ZyJNF5UDrbRt/VMMs4TKEpyMg1pHfuRwT/0pFl7cXveEDJ8ANPl9ePLyt6TDPvJcwBx3
         0/9/IDVDtkm1l5zO1l+TrjKeTMHNShrK8dezsy9G/syqq1gBG+PKVFPZV+8LpBwBKMpO
         f5BDM75EIQIbHKWFnxcpYJ+UUJx49vYDrV/jGHqaCh4uXuDJQy3gwwL5/abANHMC2Asz
         RG3A==
X-Forwarded-Encrypted: i=1; AL+hErFoxmuNFKKTyRdfEh2ZdEyVnh+IBhbLirMvEHqLf30fytzdlnBNc0owyGhJV3P20wYci7epDlzSGnxT@vger.kernel.org
X-Gm-Message-State: APuU4Z/PG9e0VKgaxOyCiHzu9A8edBJBwi8qAWoF8lwyCsqP1HH/XyeZ
	QbfSeCoVmDb+5rQJ6JHrYDkf58H3wPX6pKp/nTl8dCl0jOKg5hjRjxfDiFcOXhkyl8QwDp8yOjB
	NjWgEDrXVAmdA1yJoay290pyK3kbuCb8/xP2oGhJ6xtgMKtuh8gs7dGUFB/Aq4OBoV6wvjMKD2F
	w=
X-Gm-Gg: AZFdTZey86TJC8EXgkhp7aaGreTsRMzUIBlE6tgBtwW9msrenqla7BBxXFHUJVIFoYc
	ktLl4BzY/45yQzIrA6Hek33kqzfK4d+21AuFmNX3NKeXRVZnj94Ux29OHwiKsI0peNaYDLLPCiM
	W6kN2czBiDeFhF5uANCeHgUg62GXXdZNathnrnU2zrsVZAKOkfeiUchFhPydRkZdbeewttt1XfJ
	pfWGJk/cPYzawNaAnf2FwQehEfba491opNsaBfujdsphvMiGh3vWrcu1vYT/5GU9KexbNs74wdY
	gJ6S1V9V0LkAVYLpVJiu53iJnxRRt0FDlEmYCTEwniNljhZsl9K/8RIDfs3B6vtJcSZXqpYworU
	VcTv6aQ4PZLUP2aydykEGQlZFFpiyZx768XgPjnWFd4Yio4Cp0x+BbcTRmLJyCbarUm9tF6Q5Ho
	4eUk2ZJbBzNQkSM1R0LaWNm+rzdCzv3i1xhENaykEFTTTKGl08jUNlkR69MgJlmxI/dw==
X-Received: by 2002:a05:6a21:898c:b0:3fb:5a07:e08b with SMTP id adf61e73a8af0-4014e255372mr13799960637.80.1795610535681;
        Wed, 25 Nov 2026 04:42:15 -0800 (PST)
X-Received: by 2002:a05:6a21:898c:b0:3fb:5a07:e08b with SMTP id adf61e73a8af0-4014e255372mr13799939637.80.1795610535285;
        Wed, 25 Nov 2026 04:42:15 -0800 (PST)
Received: from [10.79.116.36] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077fe3fsm9140199b3a.4.2026.11.25.04.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 04:42:14 -0800 (PST)
Message-ID: <30910eb2-1bff-4f3c-ac3d-45628292c466@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:12:10 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Enable pull-up bias for lid
 sensor
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261118-lid_pull_up_fix-v1-1-4bb84dc70067@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20261118-lid_pull_up_fix-v1-1-4bb84dc70067@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b06d7a8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=OL9AEtDY5FzCUqsNUMYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: UR_WWy8vhZh_Af8yrZuXu7pn1umefytO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MCBTYWx0ZWRfX4SOEB4zDAbGJ
 g09E7SjxeJCrQpZRGJbV/EqyhO9MpGwubnm/NFeIfVLKm+c9k1hNoSkVb6cEbn0hdPv50CiV6oH
 NFWRS6DKVbsZicvRwPBBsPoTtKelcyg=
X-Proofpoint-GUID: UR_WWy8vhZh_Af8yrZuXu7pn1umefytO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MCBTYWx0ZWRfXwsQFen8fo/Uq
 q4PbTtvflX647Wu7l6HmGE3wQ9HlZmjC4w41Q9bR9iVlDkNWzlJHYvjzUDapAFeSErCeM/qChbY
 DcSldkc7mFPEQIdvB3dlaRKcQkus+c4gU8n3DAA1SkyqnnAUPvl42Vcr7mXWSrX9xW2wn2tmGp2
 5eQ5LOHDFpCL9O6TJWdi7jpK1TTGQe9alsWsC5k0lOwzZgankx2mGA/C8LX0KJ6ICfbGzVwoius
 0VGHoO8Jc98epP91YnyzXqihawIx0C2j2xbz5BHmvugKIixwHzZEQAR+i5GFIFSnjSo5vnyajr9
 NDtnFpJc6peWI8zZqxCdOPvKEQqvG+0pSZ6IuLh2/LOtu4Yn4Z1Wa146VDhWaiBDq34DO+cNyGA
 l5vlOXacS7R+o6jgMk918egvh5e8N2YIvbADGPWK6bRYAXyv13PYRV+DfAIELq57uJf2VqxZjC6
 Cnq87qcAmrPyz4xOxRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250050

On 11/18/2026 11:52 PM, Pankaj Patil wrote:
> Hall-effect sensor on Glymur CRD has a 10k ohm pull-up resistor
> Fix the hall-int-n-state node to enable the pull-up bias
> 
> Fixes: 627aab9bfe03 ("arm64: dts: qcom: glymur-crd: Enable LID sensor")
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index 3a9cd5f3ec2b..74588f4f7a86 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -819,7 +819,7 @@ edp_reg_en: edp-reg-en-state {
>  	hall_int_n_default: hall-int-n-state {
>  		pins = "gpio92";
>  		function = "gpio";
> -		bias-disable;
> +		bias-pull-up;
>  	};
>  
>  	ec_int_n_default: ec-int-n-state {
> 
> ---
> base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
> change-id: 20261118-lid_pull_up_fix-123aa8c6b744
> 
> Best regards,
> --  
> Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> 

Please drop this patch, the additional pull-up enabled did not fix the
issue in it's entirety, we still the issue but the frequency of hitting
the issue is reduced considerably and not consistent across multiple devices
This patch is no longer applicable.

