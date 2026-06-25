Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69B83DD501
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 11:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387957; cv=none; b=drh59u+3kILVcrUKsBrKHui87wr91tOmIvT4p9UyO1CLoGPxoFBRoHPU1oZQys7vcI7m73swrZq4N82ZieObbVILLsTRyAC+8r5Q5JHFXzreXrtHr47nlh8TlSq2XKsX8/ob7f4dDOfMZ3jpEcQrL3rgJSVTzD4AmhoDdJQv/os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387957; c=relaxed/simple;
	bh=eDu7KO5wVpXqlpuFQGtibVoKwA9rv9uNhIjqKkHb9+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l6isTAlBiJC4fJAmjv2gw6r/l1GO793Ok/lOQguTKVsdBV8brYfBsHcrvG65MDDRwm+aLgux7KynZf5nUEWZADaTHSfNncWD0pt8gfbeEppkvf93myxHZcstcym368SwQXbjGt/s/tJ5I0+3iMP/srmcuoxWeSrpi5YUpCQQuC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aKCnrjMK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eFmchs4d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aKCnrjMK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eFmchs4d"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9k1IK1921010
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 11:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4BAcSRl1VLBvY+rm1E0QENVPruUvSrRzM9gP5scU+pQ=; b=aKCnrjMKVZdK5yIX
	bETBOhO6H1ZDfQzhCKPjHdfCoAFlqLsHSSXBQn8CC6bl0jSB262dKBMcbQMrvwDl
	jk3lPY4Uufcusa9MPsP6vMSRyDYHRUHz74XUMOFK2pUOIEAg2HYab0B6IRV2SjBm
	u8hm1JrHB9Pw7W3tMKQ+rOUOmPY9ZmE8n/pLDd6oa1l/XwMjbBo75LB4mymzjsg/
	pL7rb3l39mN4Tf0qJgJE/tD7iyWs4AkRTiSun0YIkLt08hKm6nod450jDWbwgSjX
	xSILhatTr3kZA/LHC7DOgshb+asq+zMtsSIk4msLDGfURca5+h4faYr1YhhFi5az
	Y9cohw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ueua0sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 11:45:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a15cef334so2449211cf.3
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 04:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782387955; x=1782992755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4BAcSRl1VLBvY+rm1E0QENVPruUvSrRzM9gP5scU+pQ=;
        b=eFmchs4dDiLN05SAltXK4VnaG6utoEN6wFa5mnhLVzKJEZlhBaHNtJEf5hys6eC95N
         i1SQRMRmipqMNbCLUiJWmOZ1SUEBFs2tXjauhIbK3s/Lcun45dYiGVedJu5Pgjv+rwKw
         womgwcHi2NhxC9BRtnTB4TUJsLtx2sO/U6dq4PfcV5PHXFUVy8atKIfFn19T4pHiwjYB
         2rJBcsEWMtAKWebNf50SwaqwavT9GB+BMdqrp0XdpQ9BqBjTbqMwHal+UoCYlrgG2zUS
         yUSoJHQK5xe0O463Zt8phsOAyXU6TawC37YSc0icvPaBk8/R4sxdRLWIWdAoyA5nyoXr
         lkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782387955; x=1782992755;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4BAcSRl1VLBvY+rm1E0QENVPruUvSrRzM9gP5scU+pQ=;
        b=M+WmBLyGUfmgwUKEPTHZGyew+ufuXLu365auK0Ge9RCT1Ch3WBvT6IcBXZNs14KIsG
         AdIcEqsNkd74zhark2UeVkw48yMBR+T2FL2dH0WLaRSkWfCjMD9e12hpsjPY5fm2sg8o
         TpVhV1LOqPeIJPTZwm4B1cRK52Z+5HYxllGUzZzdhOaDYOCOBKS5XYyR3wVEMNYgfbC4
         eQpyG3yihK2i0sdWDGjSG3gWT0TffOxqdw+4+kj+mwmtwC4asG0UJGHev9O8WW/IXxAX
         GX4uqq2LJas4ywiAZ7DHxmaeP7MEuacgMgQUGOhq4037eQ1cwZ1RxTHXxt5bgHsN6miY
         pgCA==
X-Forwarded-Encrypted: i=1; AFNElJ9gqBUzPJpTcp1PhcwWereO4d8KDt1NluCEuAIZ2WDu291TPLrITHxCs82GSRS3zoseS5UG8s4O89mg@vger.kernel.org
X-Gm-Message-State: AOJu0YzKthN8Bq6yGDiNkF3Umx/LbK4rEk4LoF1LIUaFuJ4f4i/nUrhS
	zj5fMuJwn5wxZ9Lpu2xbGie5Vvl09rMlqTXC+tmvpmyytvjn0u3phr+BYyD0AHDn9roARLIX3gt
	rkLdd1FVVvSUUzPmSAwHTMPVOu+6lQO+cZjfVNI25I3dnL6TD/tixc8BsWRVe3q7U
X-Gm-Gg: AfdE7cnUZxuDW/NcL7LkvJroa6ahDzSnnp0pWoNiQDHWbewe9jshfIadtSr+mNvMppS
	LPPShjidAqRAA1sjjYD8+C3XfTdMVE29ym+nAwdD9GJKsc51W8/h6co7S+WApEaMgBG7sAUME7U
	WUTCjLEnWK2lph7LspcT8ie7CSZWJfwIAW8vUODksLLXrWJJ5BNVkXHepUBJUCEAIkATl+Is8VQ
	WtaJo/y8MLoEiJsjgp+5GZYi6t8+r8GaBs7kyJWg7JJ7hsV12PGusAspDeOZp4QNhRQK5Nf8ksK
	oB10aWHcskxR3zSa9PGJ+6ehO6QuXXuKaZPjDD8NOnM6ugSpiKbzQR00w3RYIAobwE5dxNsR6OP
	i0hcE5JpBj5i6tM8JxwYxqJey94SB2Vmrq5A=
X-Received: by 2002:a05:622a:58e:b0:517:5af6:77f9 with SMTP id d75a77b69052e-51a7279f2d0mr15663461cf.3.1782387955004;
        Thu, 25 Jun 2026 04:45:55 -0700 (PDT)
X-Received: by 2002:a05:622a:58e:b0:517:5af6:77f9 with SMTP id d75a77b69052e-51a7279f2d0mr15663121cf.3.1782387954346;
        Thu, 25 Jun 2026 04:45:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe6220esm165472966b.45.2026.06.25.04.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 04:45:53 -0700 (PDT)
Message-ID: <2c615e8f-674c-4def-b789-6e9c445a2241@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 13:45:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/8] arm64: dts: qcom: shikra: Add soundwire and macro
 nodes
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-5-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616201315.2565115-5-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QSihY0PsEo3ojv9fe49ZLOFhTBdCoUF0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwMCBTYWx0ZWRfX4jg+95+QHE78
 7STyHIpkrtkcDs9o52i9fW3GvBu4BtUiTW9K045rjo1kayN00HDQG6XBuOu/Uxw7S/4jfU8YNey
 DbTjjpJjeNds+vBVuCkeJW3sSFF3F3g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwMCBTYWx0ZWRfXxnoRhb5v6UoB
 Y8fBhOXXHxp3YIREAMkE8lniCZ2uy+OVy+TztVBugflba1118121NDP2ZbwD2sBUOiGskaYWPAp
 2jDfW4P+ScTbjKbno2mP1YT/bNjw3R3/PN0BC126sRaBATqrlbTVamR0QF3HQM+e4K3KXkSC6L9
 5os1PipyJODOs28o5yGB85XhJsZrCt4CervxMxdsbWhKC3EagTdaPZHZW/78Gt2CO9UVt1FUua7
 HOEdEiuo0SJb7+iGnqwzjnq+LB9kGitoRkt6pfgVapFPlPcyvFy9xoys8qw1vwp+yShlVId2FLV
 y2JMqPxprA1U33qayeSlEZs0rzjcSMUrSfzJq5SO/OlUueuhM/dpT+UnZCdGwelMS67KHUCavFX
 cIPRBXk2GotSV0vDRF9141gY37JQfSGv12nvbXOO0gxOCAY4D5Tligt7OvcaAAl43v9VWd/suOF
 VEOOzEtztnGiM32opTA==
X-Authority-Analysis: v=2.4 cv=b/SCJNGx c=1 sm=1 tr=0 ts=6a3d14f3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jzc4C1M-m5MPkDtnTmwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: QSihY0PsEo3ojv9fe49ZLOFhTBdCoUF0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250100

On 6/16/26 10:13 PM, Mohammad Rafi Shaik wrote:
> Add SoC-level SoundWire masters and LPASS RX/VA macro nodes, along with
> DMIC and SWR pinctrl states required by the audio data path.
> 
> Keep these nodes disabled in shikra.dtsi so board dts files can selectively
> enable and configure them.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Just a couple style nits:

[...]

> +		rxmacro: codec@a040000 {
> +			compatible = "qcom,shikra-lpass-rx-macro";
> +			reg = <0x0 0x0a040000 0x0 0x1000>;
> +
> +			pinctrl-0 = <&rx_swr_active>;
> +			pinctrl-names = "default";

Let's move this down.. maybe above all the #cells

> +
> +			clocks = <&audiocorecc AUDIO_CORE_CC_RX_MCLK_CLK>,
> +				<&audiocorecc AUDIO_CORE_CC_RX_MCLK_2X_CLK>,

Please align all <s

> +				 <&vamacro>;
> +			clock-names = "mclk",
> +				      "npl",
> +				      "fsgen";
> +
> +			#clock-cells = <0>;
> +			clock-output-names = "mclk";
> +			#sound-dai-cells = <1>;
> +			status = "disabled";

Let's keep a \n before 'status', everywhere

Konrad
