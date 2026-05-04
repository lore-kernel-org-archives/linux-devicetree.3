Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5301C204F93
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 09:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777886378; cv=none; b=eIKs/TFHyK5/mZeZHTtMMtDC17LGuvpWtqyWsgWOD9aZSAQoqhKJj+qXQNnokC+p+vFafAhRFrSFyAxwdctnWArgxXZutF/SI1KsHQ2ksKWM6Ds/ywvutvXmkHgaV9VKog9KW6DWw+vQQBD/oIWK28MLjOEpW72KhZxbzgC+W5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777886378; c=relaxed/simple;
	bh=NaT63HiiVPSLlJtRWFbRO1KrLpXFgIOFG/j9k225CLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cuDE07M+kg7gbRUDA7xgjmAoqyrIljKVyWal6o1PjZBNF49DbLqDopIIKw2le2lyiEdJsvdy30rEFkf3DnSiKWxRYTsWRrT/LlqE5kgX2k57Xj9huj5jx2rhQt0G6/V9UjOBcqZfKL/WPyCxK4gLkgvJzj2Qb33CcBULolC/f4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O7+37Wvo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gtLIvT6+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O7+37Wvo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gtLIvT6+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fvwT1220393
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 09:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/okPSMirAPwB7c8Wkf7mQnxwi+rKP3DLQweZz1Z9ZsE=; b=O7+37WvoeqWlWgc4
	bFXfmFx+gfgnvXhmzyLDyaNZm+R66BaFkNwACv/PCzea0ymbtFtaRYyDlyzXMCLh
	qp2wBHSKURePStj84BCT0WVSPjefAuwigwzFW7lyq6U9uc+dAAC7Z85igkQqbiiG
	2bCPSFHMunEkod3vcdXw0WVD7F4KL5pqzV0rWCTb3+bdnL7NuHIY6gH4LVBKb2Ce
	5bqQbmsaW9Qjgl5VuPZZWP/uHobvX51XnOe0fJi21dSGbFQ6r869sX6QvfId9Fsf
	7oVDQLWdzND2w553WD1o5f9UIIGabwWKh3oaxO2cvmMM4pVpgpeP0pu3lt2fKNfH
	bfgNEQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwa1en172-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 09:19:35 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5751990b248so48508e0c.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 02:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777886374; x=1778491174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/okPSMirAPwB7c8Wkf7mQnxwi+rKP3DLQweZz1Z9ZsE=;
        b=gtLIvT6+mHWP+iQUaFjVL/i+kbN+4wGtN/aA1XmCQ3mZ2PeV0k6hLTdFusJLtffto/
         s5mEmM30oZRHmPLAyh9OXoq/B/qXKEos27PYhkWuxlryeY8FdqVEoOioYYFPM8srHGX3
         XYVfrnt1SYP2mB7FgNVzlvGYhpM5mpzHA1hISvMhHrhn2eoJnYPI+QyC8TCcZMGd+dYR
         Mn4Ydgsm+QLu5abFqfhY1hGCOjq+TTcts+jpf4abVDEWPVLJAJSCwv1U8Ph6bM0x33Rc
         TClhh2we5+ErImWAqhkTprRzEY7yGw5VwHuPaCjSjE1vtxDzEschuwFxLDXvhZvu6kgv
         GXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886374; x=1778491174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/okPSMirAPwB7c8Wkf7mQnxwi+rKP3DLQweZz1Z9ZsE=;
        b=i/2MYssua72EpGKtgRzYqzzO7Y17oQL0hHUJapuvaIc6nDvnktg/1p9f2TJqpQ9ykm
         iKDW+R3JK0QR+tz255yZ9DvFq6NuV2KOCBGcbmVSOxAdMLyVd+QrCvGNZvyW0kzNe/g2
         hXTW7oW7uvPnfcNygam7Yb7YwniRujIobkmb1YtlEETWouYC/DA/TvZMHZErPIMnm9Ap
         gtxlCZg5xwmAmsu2le0r9LdlQH0rUVAH+aYRMdqxuBvHFPXSLoH064AaOOutTeqtsoRR
         2WiUX5nTpZ32gs2SOOqrpxOtDkqHGwZoNeMnC9+A+BZ79kV+M+P/D1jFSHxo3Vjy/7uo
         zJXA==
X-Forwarded-Encrypted: i=1; AFNElJ8GjYh6S537SgheVl3JzMivuRqkeu8AcUcQMcL2Ro96cONNXwiXWZUW12wBwquRdHL2pEcy6QSAEWgE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6kWvf7purI38/gg7W9O6J1db1x8KQ+sof/T2n+V27jQVLDyW2
	zBSWc1tGaGlub3AMTbNOcJgdhUESb8dZdzoJe1Vku1tj9/ipxc55L3B5B0K0ym/WcD1Bqgue1OK
	7vlx3hGavI5uzxwfBrvGjLc1XPm3OtbLt+Xcm0eQwU/xmzWYtUF361vXtU9UUpiyP
X-Gm-Gg: AeBDiesACTCnsikCtxZiOnX62hhugTKX+J8CAc8byCqNxI58MP/HIHPAW3Avc0kUdDU
	EOsCRs1+Cekg/ohcs1hC4y0vRRs39A+Rm/Gn7bplWOnhMf64JRcAR0zrz6O/U5wlPH2Jphnwsx/
	wc0rbbI63wHby+eE2ZbAnt0VY3WLPFNJG/clLQnd822EZRpogkQuiyahWnSFkEGL3zztOtuDu3T
	dOH+mHe+aM8E+0huWcregWjNUwssN4keLYRaQJBQ99eFO5aPP0udd4VJoKrSvwD/BSk/6nm3DdL
	Ye4x5u2jIqM+NObGSVnJHh3c55oYuy9Fc8HSUdFTAKdeKk7hyV5pMhsHzkEBAHq2giYQA+I/ia7
	95qKM01AqgU/wSeM2DatpLCW7MgN3/BfFnlo48uOE/Ul/6KfjJiKeNql2vrIKdAjgrraKp04AMF
	URDDta6kfrS+dCNA==
X-Received: by 2002:a05:6122:80d4:b0:575:24c1:f67f with SMTP id 71dfb90a1353d-57524c217c9mr326254e0c.0.1777886374563;
        Mon, 04 May 2026 02:19:34 -0700 (PDT)
X-Received: by 2002:a05:6122:80d4:b0:575:24c1:f67f with SMTP id 71dfb90a1353d-57524c217c9mr326250e0c.0.1777886374050;
        Mon, 04 May 2026 02:19:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc35c93e2ecsm12037066b.61.2026.05.04.02.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:19:33 -0700 (PDT)
Message-ID: <5c55bb17-728e-469f-8a97-f9587b91183b@oss.qualcomm.com>
Date: Mon, 4 May 2026 11:19:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ARM: dts: qcom: Support Motorola Moto G2 (2014)
To: daviewales@disroot.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260502-device-motorola-titan-mainline-v2-0-c791277c740a@disroot.org>
 <20260502-device-motorola-titan-mainline-v2-2-c791277c740a@disroot.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260502-device-motorola-titan-mainline-v2-2-c791277c740a@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F0UWDCcRvDYusqhcmgTeSanWwRSY69Vl
X-Proofpoint-GUID: F0UWDCcRvDYusqhcmgTeSanWwRSY69Vl
X-Authority-Analysis: v=2.4 cv=e7U2j6p/ c=1 sm=1 tr=0 ts=69f864a7 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=OQN141zOAAAA:20 a=LpNgXrTXAAAA:8 a=EUspDBNiAAAA:8 a=THsjsrCMAAOPAWIctPgA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=LqOpv0_-CX5VL_7kjZO3:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA5OSBTYWx0ZWRfX8G9SqeDBjPJE
 mnr2/4ZsLdwIXjXTV0usdj6ZwV3ey1azQw9t+S6zZSr65INHZvQrseJgfuOFkt9elU86xHuLYke
 mTtELbU/XWNLwlk73rTyBMy7LYb+95C/INrD1a7ivZmC18K26bunxOnTXoRQDPWvnRffofXnYUw
 EzsEpgQlQD2VPRdvGb5I5w7HtfWgvXAfHVIcUN9Twep5LQrMUJEzak1usBR6hw3AYnvXjFFkcY1
 XW498pHgZ2URgb7+Jr+gqSXt3fQ166XfK3XOBoITUWfdLosUJ3RQYLITWXePbyR47Qc1+NTQnNZ
 byNxabSZnzbv/uqmiTRhiCj1PRxL0EY5sgh3QnYI3AKlAVdHr1ZqsqGl0MS+fLoNxn7sDLeI4D4
 b7hGitubb3r2gVqvxTTrItmLfov90XX6wuqNbQMM9SsWk86S9lifcutD6OaBHjKmZkoSKOlEXJZ
 hfg9q7H8NyYcT7U8nqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040099

On 5/2/26 12:50 AM, David Wales via B4 Relay wrote:
> From: David Wales <daviewales@disroot.org>
> 
> Add device tree for Motorola Moto G2 (2014) (motorola-titan) smartphone
> based on the Qualcomm MSM8226 SoC.
> 
> Initially supported features:
>   - Buttons (Volume Down/Up, Power)
>   - eMMC
>   - Hall Effect Sensor
>   - Simple framebuffer display
>   - Vibrator
> 
> Based on device tree for similar device msm8226-motorola-falcon.
> Initial commit for falcon notes that dhob and shob reserved-memory
> regions seem to be related to a Motorola specific mechanism. [1]
> 
> [1] https://github.com/LineageOS/android_kernel_motorola_msm8226/blob/cm-14.1/Documentation/devicetree/bindings/misc/hob_ram.txt
> 
> Signed-off-by: David Wales <daviewales@disroot.org>
> ---

Please retain previously received tags, unless you make major changes
(b4 prep -u will do that for you)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
