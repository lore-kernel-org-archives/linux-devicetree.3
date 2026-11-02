Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632293;
	b=l6IVD/eAH8TaPoKp5he7JVDAdqwNhC+uBLlPDhWI7DBT01ifbMDrCW6xDtZrFVyjIiac
	 0ZKB0Jqe83rb4TBuS+Mf38uBdkcE0ONIx5g9j4zEUrG1zsTcEaAUk7yuMYtvbpXsj5sOl
	 4bR8yt5/bNVoV6t+dHb0n+ebjcHQ+qOJlVfNTgwYbw0LObGh95XAzuUlK9h6uGHyglr2t
	 j19WSDKhI4fTXBRI3kf+iBywMZuZjqpr5oDeUVThzizLnbxxMMBMNjsgcaTreFhUp5LGX
	 yKw5WyWDDWFhb7AjiOYI99LMPPX4pWkQIMKYQOkV7UrxWp/K+K1Z124NkVNuZqqOegw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632293;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FZiomICv6/OF+OnXrNCXeEhHc5Dr231L7EIS0MH/Itg=;
	b=Nv9PEr0E8dwmlpmO2JItCBHlnzWO6LyOAXtZdfCAV9Zh/hlEJcbHDtQrDJJz/DGlXKrX
	 /KCAWJCZmo3T6b6oWW4dH5CudD3f01q9V7AMKblmvVjv9b7YoPs37JZSEhSoI2lr7If4H
	 aSLm1sG/AJWIyyagOj+ggkil+fxQooEt3s4eCY8K7cqjgiVkC+40GZYfTwLHuYllaWcjR
	 WA9nQnucswt48ALLs0kznCsIbUQMDi9hFOsXfLPxR29XSi4IrwDk+TpU85SdlZyLKv2eF
	 9SlODCJ7L35cP6wj1KKSL9X2ttQhXN17McFOjPPg3C4UQ18aTKWgL6XsyEEBxVFP2mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TBfs3lE2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A09NWiOz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF186091546
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 15:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FF186091546
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TBfs3lE2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A09NWiOz
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpXeR452694
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 15:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FZiomICv6/OF+OnXrNCXeEhHc5Dr231L7EIS0MH/Itg=; b=TBfs3lE2P90N+Km1
	czkS7Ppdxyazmbpd8rBJm8hVRNzXd97F9kKDAAhOf/T3UiaMV2bfSRscnwsCGO90
	qKdjJ8KrGqvR9c4aT3t/9Rcw4ynUDSw8uB7nIj05qgoOuWlij3vE0MOEk9FZRaXL
	/6FL0V6zCj7bUeqpZviAX0TOWrtBGIbcaIr7kf/RIXZQbudaR8JR2N0aX6RUF1BD
	ZTtjiJoX5n55myL1S1XCEWKetJnk3WJQv9q1Zm3Ze9KV2f3T/EKOytfLGdN7zw/J
	nuffWBFwVxGq5uJE448Sqhj6qd/ECF6J1oL5VpVMtRlxT9VE8aohpRcxHdZ6b6l3
	HZkkFQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6rwmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 15:11:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a1e2485fdso8166719eec.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793632290; x=1794237090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZiomICv6/OF+OnXrNCXeEhHc5Dr231L7EIS0MH/Itg=;
        b=A09NWiOzLAm4AndA+KA2rVrCJvIdXKS02rfCvnkuGHDUi2CCYHJ6Apnqoyn+TVmPRD
         B09jUWYtEuU0zEAn3auwt3ED5mY2zZ1BdSTaM1lRMDWGH0b+wWAmXK5C/oP7/sw+UgK0
         VCix8kYLLDc3vrS7OKyUDZrt+rq8eeyjEZje+V0oEUJWgQ1IKru2nNVsv5zjts/lmglV
         diu8C9hJ1/0Ci281Ibtldh2nlpnZuOu+9CMsopB/ie+x0dcCYBDKwg1ujXXpLIlw2rym
         u0ArxFoSh81pJv664aSvmwjrqnCuhQS93W/sYIEyYaqJ/owSiOfsI5GS2jb3FF/t6u4d
         QgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632290; x=1794237090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZiomICv6/OF+OnXrNCXeEhHc5Dr231L7EIS0MH/Itg=;
        b=IdpiT73c6QYmCN/ROX+km78YgbDwq/ZnSiTOToZTLnquNE1+aM4JQI5hncd2NdVIzZ
         sR7D1mFarQsV+w/Dyebo1vfATfHjuUTcSh9Etujp9z/QUQ3CJTnAjC6AxahDezGzQwnL
         uyeg5mzuJKVabw2zyaBYDGvzhQSzC8MnRX1zGcm5JqxKl+Id0eMu8399UWc+wvvQ3p79
         PSrN0O1eXc1AQnk4Mdov0QCNSBMQkvuLY6v8+vsz+WiG01gDelCGYiuya6FB6mSbwYFb
         l5SZERuWW9fc/FsNMD43iWwpGiH2FgRkvRubqvzE48XVtOYtpFsL2+HEuUDOPIc0cOfe
         zsFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKUsCMB1spTEF3evjJr480MC3P94Thm+KHAomYSDcVadluoqXTL5QMBR8R+ujwzpMa06C9TmO2gzfI@vger.kernel.org
X-Gm-Message-State: APuU4Z+nfltNBsg9TZB6kOssmPvMwDhUhaQsxMctlg0hUHbF5ZLVykjl
	Mv5x712UVqap0iLVRvAdxfUdR16lfuk5pD8Yz11JsJSm81klj7ZBSjlBa0glWiMuOcrw1iJXq/R
	M89hUlSAMqmmKPjrBinctcUNpwMIKreWEfFoKAFgNOq7i2EfQTigVvG3Imv1oLjYH
X-Gm-Gg: AYBFou1g3KfbwynHahfIicgba21FB0mMcavEX9/GSto1qzxxY8TH3nKxxEW71mOvSrJ
	EaiwJ+q4JMBo9Q40lf6gtBbmhPUOItjy0SkDzBq2Kz++3pNXpjXuDf1MFYJTDndGoS3qjD76qqo
	lLl3OPz/6w0/FPIITck4V4m6ZqnDb1pfkSQe5n2pW73m8WVcPGx9CSRPvtdEflEjHD9gUyQEHOk
	CW80RfqTE/C4R0onmW7NNiPEWJd+viDEg9tx732V6+TlysRMQQGo9pPx+R9wfzyAQrkQhELrF8J
	i4cU2A0wxBZxtVP7KESyXtsjadsj3DFVffd23+ctOb3bAfMc+/Q8Bhqh6hVCVJwIHUhikPynlqE
	b752b40LS88Of/IxhAd/8bTuFxmB3gucjSTxpeWaGEspiaS39fYuM2egwlbXsISMi9s5UkA==
X-Received: by 2002:a05:693c:87cd:20b0:366:fbdb:2070 with SMTP id 5a478bee46e88-36a424de53amr17249106eec.34.1793632289684;
        Mon, 02 Nov 2026 07:11:29 -0800 (PST)
X-Received: by 2002:a05:693c:87cd:20b0:366:fbdb:2070 with SMTP id 5a478bee46e88-36a424de53amr17249058eec.34.1793632289035;
        Mon, 02 Nov 2026 07:11:29 -0800 (PST)
Received: from [192.168.1.7] ([106.222.229.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm38816044eec.21.2026.11.02.07.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:11:28 -0800 (PST)
Message-ID: <a11e2565-3885-4476-b399-2f62c390b483@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 20:41:23 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: mahua-t14s: Enable GPU and GMU
To: =?UTF-8?Q?Lukas_M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org
Cc: abelvesa@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com,
        jie.zhang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX/fskvOCX/sxu
 3UvYTaC8v6zavxQ0mBPyVexEIkg6MejpP+/XiToTdC+Rp2opNN0aCEraayOhOJ38aKMWsNPxGtb
 t457HcDA+XopLJXYZXmButh1baIFzR/+ZE9GpG2+YXAUz8xf9F+c/rW4ywSFufCN9T/TSZe4j1D
 iNB1IU+AHzIOfLOgYBQ793qCvRGUGakNBhHlc42y324W/4e+Tx2ANivgxC/nRET6jfzqD6jTctc
 K0HfC77N+nzcRQmpFF+/rDG98SP9hh6DpZTfz0W9gICnMEo1jihhWm5Z3ndcLu3f/lUa4BH9ST7
 zNe3S3Srwf50egDRH+8DumN5WsqEAs4RiR8b0VquBqApMVfBfW+AAP0mbNv6Je+LTK4vLa7+dEY
 S2AvRvrKkUYCDOphBfC+Z2W8ATnScNS/8wxooUN0ICD1sSR1rBmzIxRoWIH2l024Kp6qV5ycFAF
 rT8IWsQPLVAkf4jlWXw==
X-Proofpoint-GUID: Vvc3S8YFFNl0UJRQNXCi_iVYRO5iSkVB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX0ZDQEoibAWWb
 iIrZOUfPAvKEktjt4zRzxr5DiinZppDEIcICLPj0o/XwnTeVUXWF76qteQhdQjDs0b0gYfv0tUG
 T54nc/HEDiBLUVIl99GQw1l3qbunNZE=
X-Proofpoint-ORIG-GUID: Vvc3S8YFFNl0UJRQNXCi_iVYRO5iSkVB
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae8a822 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=+m4bPbj4bahp+20XAXQLFw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tpWDcApjDx3U_qUmb_gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020060



On 11/2/2026 7:58 PM, Lukas Märdian wrote:
> The GPU and GMU were disabled when the ThinkPad T14s Gen 7 device tree
> was introduced, as the Adreno X2-85 found in the Mahua SoC was not
> supported yet. Until then, mahua.dtsi inherited the GPU and GMU nodes
> from glymur.dtsi unchanged, describing them as Glymur's larger Adreno
> X2-90, which is not what the Mahua hardware is.
> 
> Mahua's own GPU is now described: mahua.dtsi overrides the compatibles
> with "qcom,adreno-44060000" and "qcom,adreno-gmu-x285.0", and the msm
> driver carries a matching Adreno X2-85 entry. With that, the nodes
> work as-is on this laptop, so drop the board-level overrides and let
> them inherit the default enabled status.
> 
> Tested on a ThinkPad T14s Gen 7 (LCD): the GPU and GMU bind, the
> gen80100 SQE/AQE/GMU firmware loads (GMU firmware v5.2.38), and Mesa
> 26.3.0-rc2 reports "Adreno (TM) X2-85" for both OpenGL 4.6 (freedreno)
> and Vulkan (turnip).
> 
> Assisted-by: LLM
> Signed-off-by: Lukas Märdian <lukas.maerdian@oss.qualcomm.com>
> ---
> This depends on the Mahua GPU support series, specifically
> "drm/msm/a8xx: Add Mahua GPU support" and "arm64: dts: qcom: mahua:
> Support GPU and GMU", which are not merged yet:
> https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/
> 
>  .../dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts     | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> index 255857cda9b..189dc3fe542 100644
> --- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> +++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> @@ -693,15 +693,6 @@ vreg_l4h_e0_1p2: ldo4 {
>  	};
>  };
>  
> -/* GPU/GMU not fully functional yet on this platform. */
> -&gmu {
> -	status = "disabled";
> -};
> -
> -&gpu {
> -	status = "disabled";
> -};
> -
>  &i2c0 {
>  	clock-frequency = <400000>;
>  

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil.

