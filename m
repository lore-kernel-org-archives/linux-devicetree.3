Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219592;
	b=l5GqBIcGGz5FmHZrF19OV/Odzi/w4SUdbJ1wJxXPur8rNn3f2CLMfC1xRQNWmvNz8vr7
	 o76XqxhOTu0s8aF1ShwLLzVBaCLNrPkpBvbvnVP0FQJkcn7FesQA+9WDEFBtT67HA//Qj
	 2vL5Cl8hE8kzZKNV0vD76b2C34xX88SGnhA10yVF/TnFY/WWHBNfRahDix9N/ArBRphOP
	 v3XnEVNjNlgfFCVlD6g4116rrN8UZ+oncO+G1JZT23EbC9Vm5d7QI4xprLpsS/A/kA+fv
	 /6nPkwR1H3Uww7aqanGeQ2dryLfSgALZDVDo+MxCd06tYJGCkk7mQJI1DuOvVtyvSjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219592;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yqUT9ShqE141fGMH35+gRcVtxZeKmd2zqhiyjQqkbnA=;
	b=szJMH04CyjMKsLb8CjrGBV9tvz60Qz/UhhEFN3TqN6ChwKXbelrhbrlekqiradkurW/E
	 J2+NHwxKXwyvK6PJc7o7cQA7PlJMgMh3gKNwFNNQRiaHAdsjGBAAsWlwRH0t7FIt03loZ
	 Lrws5CyJSi7qa17ETHPE1130OaxzSgz5tjxTO/ZS2wQnHU5kaKUn/di4qluadJFq4tuTx
	 KIhnubi+4uY2jU9SXhQh2bRxBts5u2QDyoXWb0okdLUQ9sH4e0L1CEs6EI7XsFleJxtX1
	 v7UyHxHxZJ9K4ijOoiPD9Z/2sClDqHJpZ5C58DpLX3WNia/ZPcGsaXEf5wik0sLGk0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lb8IhuSf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W40OHsO1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695F6606A323
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 10:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 695F6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lb8IhuSf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W40OHsO1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99vDLH4107895
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 10:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yqUT9ShqE141fGMH35+gRcVtxZeKmd2zqhiyjQqkbnA=; b=Lb8IhuSf2GJlUU39
	6/SxUsyX1AB986J1wjCqXviD6ihPbVZBOgiWdgTU5gEC4GpIdt/n0tbDKmadVgyC
	qLFjUGVRlcEEgawNthi3DI0lNwZzCa85V6TMRCn/kOrijcB06Iu0cDdVazgnAIBo
	4yxjCqyhYtgcIwHJZxARKc4lTojNE+PhqbGG6IIn/VXLzIc5vbVTlJCMVprgeOqM
	KSAWOGgLvFAfG3N1pMu4Dbv0kxydAp/iV+ZEmqHVa1K1nFvoJOnLOETK2bMV34YU
	Nf+0TRyl4XbJa32N2hjLr+HIoiy99C8q0R2kMnkHXrC+99S+FrPvZub2UzHPxmRR
	Ci40bQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnx9dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 10:19:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9460411fce4so11775585a.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 02:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794219590; x=1794824390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqUT9ShqE141fGMH35+gRcVtxZeKmd2zqhiyjQqkbnA=;
        b=W40OHsO16Xr24Nja67bwvYPmWNpPdDk4nxeqo7GERIRZBZSInquSkhj9HyFNhfFlmq
         8TcmsqUN8Gz/1NRFlN+mjTVmYW8CiWmbEekqeprQfkpJN3vxFrsl1tPYxtOSn7PmX+cR
         pvmU+rYD2FgDGbhJ77om3Tsu+2os6g75aTomyoMWvJjMOFXSDFMktEHNhMmx7hKC8m8M
         JNzOirk9iSffXOirvU0ztCExImOpXW6MtzVp3GHUH1ictAfI8VBahp6dG1QrMWMzpAbN
         b6McIQlq1u9zIbV8F8mFXfA5KZLB1a0dsgRPVJKuLyuJO1kT6X5DV8mToG4uEB/wnP2D
         tYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219590; x=1794824390;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqUT9ShqE141fGMH35+gRcVtxZeKmd2zqhiyjQqkbnA=;
        b=l48vxoWWsEUi3WY6rIxkHISsMYncah1nGkfQ1Pei2ukDLSvN85F8PEO4fr/ewYAhp5
         DHdURZMu+T13Kr7lHZzqPMzWmGYYoR4Cei+OeOoRiB4V/P+BCdWrNm7JTlJJ4ZBBKMyp
         IY0Ke7Jxb0gQTzDIXbbZzIYe2cD5yMF1I4VV8fWEg2C2Qyetj4T5rPGmOrcfVe7icE8i
         6bzANTEfp5FuGlNLgurm+HMZ1capnnZYuF0tfIQuzck3YIEXU5qO8mNJKPClqGpJu+Gd
         wzDrwb9C34+ETcNt8kcRwvU+5Fomyhk0vp5BfSZfBzUSuu1ZCQeSanWp2GlyJRor5S2L
         R9cw==
X-Gm-Message-State: APuU4Z9hUJVL//EvJMgU3RYrIgDB8ZkeuPMHziCdiYhZWkIPQOUD6Ffu
	qOaW7Nfl6J8qo6Y2ZBG0VVEaaNKxgKxgpR2NTgYofoaE0kzC/uoT7l/2otoCMFAdgWxYDMcs0ea
	wvj7tnBFdfXl+gRZsbKDTSD4ad6/+osL5evzukDRG3GjOKVlRUTDNjbCGmJwA9KZB
X-Gm-Gg: AYBFou13/epEuPogcya7N719yAETnxFpIHhsoh3pi2VR88kk46oOtUdYkRZnuWpqyaj
	9Rm1Z6hPGVv1wAiW5du2xYs+eVcr2+lL06lF9BDXLHUy+nbYj2Cqq7aDkGF5Ckmu1xO3JXceGy8
	3gG9N9zY4rb4zrobNusMr0DLPAgP17SSMmcGurotimuUvlHCqipSxwxI+FRoZgKZ1pB5Nebzoij
	xwsY3flvMJxMy9t4H77ugIc2wTdTmT982H2OK2px9oG4efeB2H6uFFHVaHmlJ4tG92aTqzJ3Idt
	TCgEOr5DXLCuCeQbmzEEvkSLxPavXnrYCe2N+UqQKSeEGuTMyCGusHjhz0rn2jVO9SX2ua1NrLT
	VvolAqZBpIU8Fu2mAp5SofSeveCbR2/HPN41TjeMkkHf7RftLdTVpiGItvB4BKu/A3EvJdA==
X-Received: by 2002:a05:620a:a897:10b0:945:dc04:c4b6 with SMTP id af79cd13be357-947842e6da9mr510547685a.6.1794219590603;
        Mon, 09 Nov 2026 02:19:50 -0800 (PST)
X-Received: by 2002:a05:620a:a897:10b0:945:dc04:c4b6 with SMTP id af79cd13be357-947842e6da9mr510545085a.6.1794219590095;
        Mon, 09 Nov 2026 02:19:50 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a4af502sm146889866b.55.2026.11.09.02.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:19:49 -0800 (PST)
Message-ID: <7dae5091-6d51-4bf9-9a94-bb2d98e2ad28@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 11:19:46 +0100
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the Embedded Controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
 <20261107-t14s-gen7-ec-v1-3-f4a8edaac447@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261107-t14s-gen7-ec-v1-3-f4a8edaac447@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _4XwBOBLhy89RP7ztvobvxtBV3_xD_pX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX+WFWKwp58XNQ
 e6MtcbpK/7LYtYDwbQ3c+r531n7yZlQSOzAwZ0l12XMCjULEiD/tU21ulx4Kgpx4GH1hSni70cd
 GlvGT0LPNddbwV/lv6SNKrqW2tnNs8rWkxJ47yfyY28OCH4gSnAuL2pLwtKfTaGS0ANk8aWhtgl
 RFI8Ugkb50FIkGd/2Q+SMlrIFK0zz2TZHN5xdY8utcY4CVz56MHkVnXKRiXZ8FftAPoiGDpCu7f
 lWBMT6lXMx9dvNFMdG3nwm4uGuhwHgS4DXxArKFs3XrlvkqSYiEjEWbJkp7FY+WGj5cD6CxgYXd
 7F0wzcrTRFbczBzC7jU8sv0wN+5/aAbgsRDbTGYYMVvQmZQTjqAjIMMvLiqopurNJcE0zmx+aYJ
 OHlxIdDOCIBEc7eNqTWDTUANaIPiSFKFmZf3Qzt2EjXSmIw5ZkIgOcxBt6lP5hsieKwlbKFCRpo
 6o3cxQ50JyBkhspj0yg==
X-Proofpoint-ORIG-GUID: _4XwBOBLhy89RP7ztvobvxtBV3_xD_pX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX/D+pnBhhXa1/
 XF3TE/YFySREKgXy0zvNcBdz1TjRsGPwoeSyw+YEwNyBVUPsK++SouAeoH9VYUHAnszQBv2TS6D
 pBvyT7P2YYKnUf++TPkrJcPO22oLLxU=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af19e47 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=J3gOo0Kj3gncQIyMurkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090041

On 11/6/26 11:01 PM, Abel Vesa wrote:
> The ThinkPad T14s Gen 7 has its embedded controller at 0x28 on QUP
> i2c9 (ACPI \_SB.IC10). It uses a different command protocol than the
> Gen 6 one, so describe it with the Gen 7 compatible. Its interrupt is
> GPIO 66, as on the Gen 6, but the firmware describes it as edge
> triggered, active low. Using a level trigger makes the handler fire
> continuously while the EC holds the line low, with no event pending.
> 
> This provides the EC hotkeys, LEDs and keyboard backlight.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

>  &lpass_vamacro {
>  	pinctrl-0 = <&dmic01_default>;
>  	pinctrl-names = "default";
> @@ -987,6 +1005,12 @@ &tlmm {
>  			       <44 4>,  /* TPM */
>  			       <139 1>; /* TZ trigger */
>  
> +	ec_int_n_default: ec-int-n-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		bias-disable;
> +	};

nit: please keep these sorted by pin #

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
