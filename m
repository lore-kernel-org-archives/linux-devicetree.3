Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32A426ED45
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554843; cv=none; b=NXgYVOaGjGTmfwYd5UY9qOLs7miuGW01At/kUBNN6xAOQgwoDGRixFaP1xNVrvyfbRD0OLEjFsonLtnrzqoEkqPXQU6J8kiC4ZPHeMFlXcPuI1TWxBRdj1lNhqxU9GHDCPO1MxJj93aFM0ndQKQ16df5026yLYmUZRfFYEeUZ8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554843; c=relaxed/simple;
	bh=6u+jBwuKFw4L2H8BKdV08/AnyT3SkN/QQqCcMlMuIC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O37I4KPvsY4m+mCaxpfdbNzjsDFqSA5v2U2Dc2QwX+G71sWGCR/3KpUfryH21xYYDlMWH0enWNQIIgiGV4/N2gPOnZ2R2/T/LRTzTtNRJtts1z1bxHzY0qrC3kvaQmPx0cDChlvY+e8EaH5pwEn0CU4WCiwkW9Tu+3ScUv1KdqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2oUjMlB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cl7IAtD3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H2oUjMlB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cl7IAtD3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63771Z7n493198
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 09:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ARM5bA9+tOKcd2hOMigoOXpxTiAizwWoEa05WNgpfT8=; b=H2oUjMlBwWViI7rD
	7qJd25j1PUqm/nK6WeeLXqVKX1FQUM6HeXGdVEiPjFqa4v0ZR9y20+/T+/1loPzl
	iS6qxNHSd7Oq6ruGpxGGCMmdpd9gg97YbODTf2x0JdMhAwdgY8XneY3rckOkgHl2
	0DccYqZX4PUQJVR+Ll32Fq48gGtcD7+Qs2nNtb+XY/NxRE0lnyZ3b6zX5I/Miyvs
	b7pGGnWBcvnRHQIjmGeLCywelLjZ1iouIuo5G+UmsVlKEbVY/OOf7reiA5QQIc99
	u8Xt2/eK6xk7987xV2LRj/GQMD+KKWQTCdSc/zv3u79abe0K3Jm8tD1xpYgiTc3t
	b1O6zA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8t2v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 09:40:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8aa34663273so7167066d6.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 02:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554839; x=1776159639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ARM5bA9+tOKcd2hOMigoOXpxTiAizwWoEa05WNgpfT8=;
        b=Cl7IAtD3YT4gppLl2tAsZTiEjRDVZOQ0EUxycD2mMM307N6WCyMZG/BSEYi5yO4IK4
         6dKdZdYk1qDq17gLX+YbTS1Dh7n9yZHqD7no6NiT4Fs5AzJOc6HIUmSOccqx4g00xQXl
         1ChnrFJWrItmeTFDSEc2a6wudoZT6nsZB9fR8geS5rEkjDrOcj69/hhw+f0BFC8UeQ/o
         huk2OPR/7nCYJtGvkICclX44t4sxF3Ev8H5KkV0mvqiHZkKz60lbszhcJ8cz4p09kqcr
         W/RGSUwLfi0QaHECwP1i7bfzCw7m8NcwsLGLFUE1EAhWtdPmFrKfqOwf8hSBv9vj7Dxl
         zKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554839; x=1776159639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARM5bA9+tOKcd2hOMigoOXpxTiAizwWoEa05WNgpfT8=;
        b=L4BqC4DJIrmfv1AdKaWMo52NdTi4e+p89pZObD9kz4XoFarl5LAcrvXzP6yqvmzrQW
         oB878Of+gHjap50sosiobO9moSRZvSjAloq7Lc3jan/zV+4rW7SayZ7lV6EheRWlyuf5
         3A/p79rKLFLF9fgvJER8aF/VAA3XDjoSNKPqhGi6TfkqFMPDj9wgDYsk+zQxX7UiIwz4
         XIY7kS0ioGCAnDQU33lQW+qlxRspLzNwqKKRBZR5Eud6uyadCC6BWJER15Ln7RSnke0i
         CFjRTOUcLfzv9QCnFAz+gD0nSfvOchISRRHG52ulxLlzoDpvomwX/6VEOcl7HxPwcFqm
         cVZg==
X-Forwarded-Encrypted: i=1; AJvYcCVd6XpJx7FVslb+OvNFsvVEbXFCkqT8lfG2elcOT+CyHpB0WPIzeD3Xn/YfjQM/uxqXirtGaflkn9wC@vger.kernel.org
X-Gm-Message-State: AOJu0YyWXktYrfMCFK0X3gOpRs97U+f3lwJAAS0pJjU03d8msUKhD+cy
	/2CH3xdigYHUrHRH2DPKU9nohWjgmHc05vBvrc//yBp+aPBsDgHx/TChfDKIsJUldTeZZi7Sw9l
	yjWqsV0JN56oBTatAyzxl81SG8R1oUw5f4DXrTshiEJjN8xvqrelTCDq+vzJ7jDoO
X-Gm-Gg: AeBDietI6cWEQv60oJ7YJjz3Iaexiv7sEL1V7m7/TJbwonz3t6144yIB2QLiz7780bp
	BJXMrZodjqsgUyElnmRvBrl1PfGbSZXwnt989as5cytEjFUcmFxJb7iFZzlmrAdgi8s9vcZgr3P
	yOvl+ByvkU4gmthLeIpK1YkrDfWILEKxrTXy64mc1gWCy3t2NXDw0qq/acJDkWJ+x/+LZ0nn2li
	WL2LbCMIj1PemG9Vz+L9x7mYNNqFn1Ho03T/VQ4drg8X1Y+SeUBfoLUjFEFaMup03Yhs2OHqck8
	UPx0123fORp4b/TrWzvtDHBi/uWWFlBNPhQpssiK1wc5Vdko9ct6+TFWTL1GwYZq7X1yAkfQXXD
	nZAENis1GaOxPOrYC+PmMv8DO8IgXZlxXFafPVYe1ewdPNud5FHHo1Zk/z2S/okqqbE5pdBpe5R
	dgxyY=
X-Received: by 2002:ad4:5cc2:0:b0:89a:5129:510f with SMTP id 6a1803df08f44-8a6ff7a9cb6mr201346256d6.0.1775554839373;
        Tue, 07 Apr 2026 02:40:39 -0700 (PDT)
X-Received: by 2002:ad4:5cc2:0:b0:89a:5129:510f with SMTP id 6a1803df08f44-8a6ff7a9cb6mr201345996d6.0.1775554838963;
        Tue, 07 Apr 2026 02:40:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d026466sm524062466b.55.2026.04.07.02.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:40:37 -0700 (PDT)
Message-ID: <33d7aa2c-0eb4-450d-8e10-3f335d847f89@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:40:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sm8750: Correct and complete DP
 address spaces
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
 <20260405-dts-qcom-display-regs-v2-7-34f4024c65dc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-display-regs-v2-7-34f4024c65dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: a_j6j48mt2rA45tcG5ZLahCjbre0O_ja
X-Proofpoint-ORIG-GUID: a_j6j48mt2rA45tcG5ZLahCjbre0O_ja
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d4d118 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kR4CFCDnwyPe45QzH1wA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4OSBTYWx0ZWRfX7KOhDbmouNf7
 kmzLT8p4bkeRZg9r2McIdahY/CrPlRUuXP3uYnj3/xWskWcn8DEZYaaIjKSEKbtC12Spgh/SNe3
 AcEDWt8rHXdGjDwJwH9fSOrYAb6mdY24MsKvKDIzA6nGJBV4OPdYa75R/ePXnSDBe4a0PQ7BXl2
 alLtQ99+uYko3wdbdUpTiMqp/KR4XazF0dGtLQqTCnZl/sPt7jEe/cu3X2xqWkzNkB5qs3jZfBl
 z2LHvc33bvicWzQbNT7toeHeP9NDUxgUqn/JcF5z0eyb80L3w5p1zMA57Ip/bAmEB29zTVxO0Qo
 WIp+sd2GpR/H2rrcL9KmJnEAaDTwvsZsmrkS9pawZ2ZqWDdlgmWJ1DAeY/TERCHvwtwxZfYGbCS
 Ds8GzTx0rNf4tsMsbskYasF1bj32LBdpWA4D3Fy26CWlujQlHapwLvI4dKjJCWQFPB13FWZQy6g
 hguE9rCC73EKjRGeIrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070089

On 4/5/26 4:34 PM, Krzysztof Kozlowski wrote:
> DisplayPort block on Qualcomm SM8750 has few too short address space
> ranges and misses four more spaces.  Complete the hardware description,
> which in the future might be important for full feature support.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
