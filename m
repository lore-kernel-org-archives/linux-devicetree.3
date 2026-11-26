Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680639;
	b=VAt2TzxTmNL44wOCGWznZbypvKU9EUvrVFllzxYHSDt/d9Rw6jh6dq7fEMoKTo7wyIIi
	 3olSpOpyyAmtOnHEsAONixeA+SXcREQItKdRJbPwhko6LlVmjeNMMccecJmedYAEkLEAg
	 snQ8lvEVGh9lDvvhQJv8mHUoIt+8nM1PQgpzMLADTgKh8t/QYVLNWxMN6gazlDoj7o4zk
	 Lpk+Bwlwr43ybodc5lKa6jy6iHbXI5doE07T59H03o+Q3yUSkD0S+kUE9ZrHRyJ0X/ozz
	 dqmFol7MM4rFPktimF6CY6ukTl4kKBvWN+SFbYtEzbScTaqBfjjz0w3ABQVuRQhT3kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680639;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0oVx9fVa/Ez2JCk7hDN3JGdH21S3GTSikiE4w5uLcxw=;
	b=QLpwYfL1MLGCUM2icTQvzzfxCVgajO8mDqYdb6+RZCx2MWUxW/w5bPQ2zsN85wFH427u
	 +JpiB2HNiQ83UcnZZYaGjhcO7JPH/JfPDQhLoHVxRxpRNo/yT0n1Ko9I+4FWS9gP+r2RO
	 O2gS5ia0f7Fc+q3UDVSq7XDPG/GIUjsAOMFW/IeLOj53AP5tjO5uim282zY1/TxGn8Psm
	 w0NfTH5Xk+t+TZb+X2+08nTNz2hMLBit4O7Bo+SaAKrD6czMJQu3Viiw3ENorTnNmkeKs
	 kVFAM+PpZ9Ctbgy8u1GpVdfudqDLTJVVjSkSssshEdT5YidMAS6EB+Cr1cRZLbI6Jeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NULVhEWK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NCFEVhfd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF9B606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CF9B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NULVhEWK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NCFEVhfd
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4CF2595120
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0oVx9fVa/Ez2JCk7hDN3JGdH21S3GTSikiE4w5uLcxw=; b=NULVhEWK+n351rO9
	hK/XaDd1CtJHafsb2Dfzg6zjEsKxtiInis3B12nCQivv0UIs0mp5HRmEqokAhz76
	qUKy/zNvgYcPvN3cdzUN08MnVJSA+QCoyzMC7MIjhQChhVIfOUHvDD+ZVR+rVrvW
	uaOjcv10GTDZS1nLlzbt9GvOkVJkw8rppbFy37XskcRKJt0vDjK2f62uMhL6pNWW
	JmwvCEc+vqjt/c94uyevhCLwqvRqMBYrZDKQE6TU+UpHwJnBYLsqMwEe9JpgtmSC
	lG5S60Ir6h4sBciyHsSFR9VraknEkRhYeorTMcbOi9ByMTWQs1Lq0T7f6Ye7U4Yl
	ewuwkw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sa459-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:10:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a064f294cbso4964531b3a.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795680638; x=1796285438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oVx9fVa/Ez2JCk7hDN3JGdH21S3GTSikiE4w5uLcxw=;
        b=NCFEVhfd80vqV4PJNKVuxORQoT2TtZMjY/g1NcbraW0OLgqXKkqx7E/tLqSBoKanHT
         pAjYbluulNInC9unPVUil18G6LztJlKmaaHVO22Ix7BFEmZXOCjIOAnwF98nWGHTi2JJ
         utSXGVl9xMtFMsJkzBTqJzsFOi2m2n59ud02/NfNAsdZrsI3qgXaivMO/EssTcDCRZis
         Pi/Yh0WFwz1jlQ6eNvxKP27eSxGmA7JTstZ5pknK/C9d8bGQjZh2i04DvgDzdeP46r/m
         6SPgFqiagI1NLOsq1QJHTE22Ldxz0UFNcgtRz7daRW0Xui4m0XD+UOcRe9xSOn8THUip
         G8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795680638; x=1796285438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0oVx9fVa/Ez2JCk7hDN3JGdH21S3GTSikiE4w5uLcxw=;
        b=JjEGX423LLHNaMp2v84aaJsFXCBtpmHA6SZP3DkhF3kf1o6Lgamh7XKfDjNo2a0tC3
         R5CIwRf+ikh/32yFyXYPRMT34d88Cp76hbTux9lgrOONZBWwwmg8DfBAioZB+8dBLVZW
         CKCybpl5bpt4q3Ka/GMME1CG7BthFZauhfgvUjB4qpVhIeyC8YhXBjXKeJXB/q/kLz3F
         ORz7CEIn5dhezhTstEnZxFpyZDRIPQ3w84RecKCMaRFopExhBB8gpJOo0xqIY3e9Mfwp
         KNKe8Bp8VfMfCunCGJDGdcrgzLrqtNeIBVslTKv/urYnm+fbI5Z/6o9O/+0HadOOqDX8
         kUSA==
X-Forwarded-Encrypted: i=1; AL+hErG3UDw6CWAdv4vPT+oFKJaJZ66QU9jawWS33TiB+t7XJ6RtVlqzFSeZGOxxyvb6C7kPqsC5dEBdhmRs@vger.kernel.org
X-Gm-Message-State: APuU4Z9eUPeaBhAp+GBdctSBcRCHA3DEOxF9c3dmyRWFG4M+YtHr0OO/
	Z4eELCpRkgLNUiYVbou2WU4Pa9bDRCD0t+LiUwsma22qOv85YmRRZ3jlk9j6o4WRiv+44u1L0LU
	zYTcY8SrejbjK/PjAgkzVWSbUgsPoafUnWmUvUY8UA0Y/zaGx0gLP3NmdQR8SGXtD
X-Gm-Gg: AZFdTZfiuhj+w58gpRIeR9e6FtK6mgiPbVWf0qJGslK/0Y4R/qgmJzgIy8YYy10vZTN
	oBycy9RfNhTzPWHUbiMsC1a1qwEe1HaMuwd0FPNYeTs2n9YRknlHXS72PbuVbj+xPutJRhlGeQY
	1lLdndn5AcjWFTnAMKjw7wJ5EQEucfAYczzw3rAXgsfqz53dCQcZ9B7U+Pq6icudD+o7CqnG/w0
	O6xsHlBv6h5pIzZw6KTWWYffWCxI0iiRYIbkbjas401B6VRJbPl8zb4u9ZB8Zn5MpiC1v+gqzqp
	XIUxp6zdURTq3BjAKXbmmEg/91v9HXcRsUoMLKsK6yTKkFmSRi/63jxoP9Q4MrieP1ALDnnlS2b
	OpMjzHBX3kpLbHYXmohLJxmAmYK+/+8pmEBjcm8RBhM4eTm7vuwYyeJnOmOjYdAjx5g7yloRpMg
	PS
X-Received: by 2002:a05:6a00:610f:b0:886:a737:e0fe with SMTP id d2e1a72fcca58-8cd9fe59529mr7520567b3a.23.1795680637703;
        Thu, 26 Nov 2026 00:10:37 -0800 (PST)
X-Received: by 2002:a05:6a00:610f:b0:886:a737:e0fe with SMTP id d2e1a72fcca58-8cd9fe59529mr7520535b3a.23.1795680637227;
        Thu, 26 Nov 2026 00:10:37 -0800 (PST)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077fe3fsm10675771b3a.4.2026.11.26.00.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:10:36 -0800 (PST)
Message-ID: <1c294545-91a1-4cd8-866e-49989343b01a@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:10:25 +0800
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
Subject: Re: [PATCH v6 0/3] drm/msm/dpu: Add INT2 GDSC power domain support
 for Kaanapali
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Danila Tikhonov <danila@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261113-msm_gdsc2-v6-0-17adbce47220@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20261113-msm_gdsc2-v6-0-17adbce47220@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b07e97e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ipgrnOdMhYEg8ZrmRaMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 6z6AYFwOmVl4IIrv1E_XNBrIDaEstzSN
X-Proofpoint-ORIG-GUID: 6z6AYFwOmVl4IIrv1E_XNBrIDaEstzSN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfX+DDUb3kvsLL+
 wRW0o1+tA3UykacR5koPTIDxlup4HlCyRDP5cav8AgXO/6KUpW7xnGpHiwOUO6BfsNpcYz8N5kx
 0xHw775S2YuuLeqbWcwH+Rjfb7MHxLOv7FabRh+yzGQhyLpjtwnvRLTRZ+L4nOt58tGl7cCr6s8
 qhY9JW2mBG1vXlHzu7O8l/UwW12AWMQtYcqjCCF2Pj5yyOf8kwk55A5I44GDvBIAv0rtxQnujcR
 KzXPy0Xg1gkwUTKiehIhOX0lyVwMddorhoxBpySwXvVCUdMSWLm7xy+43YRC9kyDYi/KVerPExS
 py7AXr/sNrVrM48392ClF7vQWVixQi4BVq9JOvP0xIOtFw+o+rg7WHDXlZ/dMNzb76Q89aNPB06
 0FnYkHEp+uUVeNCk3pLsTEAkNGXgFEA5f8Sey87bNgrfqPnAwDXeMI60d3Z3iEapl+A0gHDUOjD
 Hqi/dcSAzFT9Htdsdcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfX5x6E+to3XEKd
 1q1ELT2j2reStBx6rfG+5alQJ5RpYKarbPtaHxwuRef/vQPOmXATatTbkVW3LHDNYErZ2B88P6J
 6bRqcO2vQr4t+zUVoE01UYdYduTqMdw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260031



On 11/13/2026 4:28 PM, Yongxing Mou wrote:
> Kaanapali (SM8850) has an additional INT2 GDSC that powers a
> subset of DPU source pipes (VIG2/VIG3/DMA5). Without enabling
> it, those pipes remain inaccessible.
> 
> This series describes CORE and INT2 as the DPU power domains,
> updates the DT bindings accordingly, and explicitly attaches both
> domains in the DPU driver. DPU performance-state votes on CORE
> are propagated through the genpd hierarchy to MMCX.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
> Changes in v6:
> - Drop Tested-by tags (Krzysztof)
> - Move power-domain-names to dpu-common.yaml and drop the redundant
>    'required: compatible' (Krzysztof)
> - Link to v5: https://lore.kernel.org/r/20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com
> 
> Changes in v5:
> - Use 'contains:' for compatible matching in the if-condition (Krzysztof)
> - Move power-domain-names items to top-level properties; only constrain
>    minItems in then-block (Krzysztof)
> - Link to v4: https://lore.kernel.org/r/20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com
> 
> Changes in v4:
> - Keep the widest power-domain constraint in the common schema (Krzysztof)
> - Link to v3: https://lore.kernel.org/r/20261014-msm_gdsc2-v3-0-f1ed69014416@oss.qualcomm.com
> 
> Changes in v3:
> - Replaced MMCX with CORE as the DPU power domain, keeping INT2 as the second domain
>    (Dmitry)
> - Used generic "core" and "int2" power-domain names (Dmitry)
> - Propagated DPU OPP votes from CORE to its parent MMCX domain
> - Updated the Kaanapali MDSS example and fixed issues reported by dt_binding_check
> - Link to v2: https://lore.kernel.org/r/20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com
> 
> Changes in v2:
> - Moved INT2 GDSC from MDSS to DPU, as it only powers DPU-local source pipes (Dmitry)
> - Dropped Glymur — only Kaanapali actually needs INT2 GDSC
> - Used if/then in DT binding to restrict second power domain to Kaanapali compatible only (Dmitry, Krzysztof)
> - Dropped PD_FLAG_NO_DEV_LINK, let device link auto-attach handle INT2 as runtime-PM supplier (Dmitry)
> - Link to v1: https://lore.kernel.org/r/20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com
> 
> ---
> Yongxing Mou (3):
>        dt-bindings: display: msm: Add INT2 GDSC to Kaanapali DPU
>        drm/msm/dpu: Attach CORE and INT2 power domains on Kaanapali
>        arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
> 
>   .../bindings/display/msm/dpu-common.yaml           |  9 +++++-
>   .../bindings/display/msm/qcom,kaanapali-mdss.yaml  |  4 ++-
>   .../bindings/display/msm/qcom,msm8998-dpu.yaml     |  3 ++
>   .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  3 ++
>   .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  3 ++
>   .../bindings/display/msm/qcom,sc7280-dpu.yaml      |  3 ++
>   .../bindings/display/msm/qcom,sc8180x-dpu.yaml     |  3 ++
>   .../bindings/display/msm/qcom,sdm845-dpu.yaml      |  3 ++
>   .../bindings/display/msm/qcom,sm6115-dpu.yaml      |  3 ++
>   .../bindings/display/msm/qcom,sm6150-dpu.yaml      |  3 ++
>   .../bindings/display/msm/qcom,sm7150-dpu.yaml      |  3 ++
>   .../bindings/display/msm/qcom,sm8150-dpu.yaml      |  3 ++
>   .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 23 ++++++++++++++++
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  4 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 32 ++++++++++++++++++++++
>   15 files changed, 99 insertions(+), 3 deletions(-)
> ---
> base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
> change-id: 20260720-msm_gdsc2-cb9230027a2d
> 
> Best regards,
Gentle ping. Is there anything else needed for this series, or could it 
be picked up for the next cycle?
