Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1313EB0FD
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787725; cv=none; b=V892dEdR7xr39jmb9D3okxC+cp237Z9+uehNYqiiXYUVC6+LoZZegpk8lt4rIM7LRDkHOMPiOudnLXaudd7w153LZmlqBAO6BCGzS16vtOz3WEVkREKIxpvw4f2221zpCHud0p3eiDQlvtLy2+prIijVUY2VIwB+y2WmnZ0b8zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787725; c=relaxed/simple;
	bh=OiBvJGA3rcBVkwv/W5Exjcj+7CrWvutuFaR7iOPWQ6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kXVVl1n3tGu+8Ezrsh2Ob3erGE5ETJ0vgdetJZZ03MHBdl0Z7ST9f8lhyomM5hJ595Ra2ZmIroKYds/EcLIl6EwN8i9eKOEwQlu0XTzgzrlIwUdk4ZevXkVYmQSgj9hrhTrFK8mGIc74sfq1cZ7wPL4vtYDweTQ545TguqEmM8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHVLGIPg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCTM7+Es; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHVLGIPg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCTM7+Es"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ICunPI1780638
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	drBtdZI1GgQ6oz1Wq7kAcWt1WrFzuxR5m4b03USirw4=; b=NHVLGIPgdZ+BBsyb
	fGjwFfMjLWbk4ynHrjgQJju4rivyvZp2sPxy50Y7WPlE9XIKqnAGhfgtnO8nY062
	++GAlMsL1C1fcy/FR3HdyYSYeR5Vmr8XIdnts4/h7j/GHJG1nr7dRQmTe/jYliC7
	cUJcTvh+XBy4xosXU+35p1rqdLIDJVx1mpBkgrd7mtwPf2RYK2sL9dsXbjyv+R4X
	Icy3Je4RAjq7BaTbdJvy34+5GyeORQY6O61cOZdHpVlDUZqysQ8qbZNtv9koFZz2
	OGSl043JFByRmP1BO+Jo+i52+a+YlVLH2fIO/De46CJ7EQcUOVupin4Ma7x8pkcW
	RrXjWg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev19a3dy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:02:02 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e7062a8951so240588a34.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 06:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781787721; x=1782392521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drBtdZI1GgQ6oz1Wq7kAcWt1WrFzuxR5m4b03USirw4=;
        b=kCTM7+EswPia1x2lIpFRtz8VFRCo0qvEegKwrKash3c4F0TkvAfQSjGFrdoHhfcYQt
         n/YJdzUC2ycdzv4L7dMeZ0yPOPVDGCCAX/E/CLRpVPd4L5T657v8fgoGUaQnmUD0FuE4
         KCd2Xg0z0BfBa4ZAfcEe+d63mOU1lp+LhKyD9S0OOSFDBBFf+duw2vD6MmA9b27o4Imh
         PN9JaN+M5mA681qZwjFdQNWKvveLQhM8ya5ab4lOvZZ6Ir9rnDQ97WK129ZNrYbwlhVp
         TAlwlBn4bRyidwthezLS+uTtvZx8HHl9PWnEMEOu3w4Glz55kccpwgRyojUE04K6qAF9
         lElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787721; x=1782392521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=drBtdZI1GgQ6oz1Wq7kAcWt1WrFzuxR5m4b03USirw4=;
        b=or5sZc1jh00R4/R19AmA+XTn1yMsQEEC0v+NdEo16j3Xz435NKs0yy6M6wmDfi+AA0
         WYrH0pv+5ExaaAZxBMA6nn0tabv/EBhIxJ69J8MnSPhiAgwNHpslSVeE372FYThreAfk
         Cp+7EmQwsVMnGOjcTrWLZm/67M7c4mOPSWk/f3L2rhiSFueGOpfeN15FY9RdRESVqSd7
         YznnJy09xOxtdYjjV++oHquf8wJU1Hmpdlu9osN4MtLTQGX5ztmdu0s7xw4TlJetZDLM
         6KqsbrAbLVN76tIyGeRJ4VaI/W7bPchXmzM7vqrci5mbI4y19A8qJKNNxIS7TVghuYAO
         vlIw==
X-Forwarded-Encrypted: i=1; AFNElJ986AQNIeWJqLCqialF8DkB4fX0ou+loPMMp3pbWlvPNe56CI+xXauGLEUnKh9fbdz763BhCGpp4f5j@vger.kernel.org
X-Gm-Message-State: AOJu0YyonVpaKNbv5RLkjtfgF1Tc7Sunq63bVgWG3DG4lqkhuFf8l0Yw
	QOHDeu5W2lA40dlaMvtnBnjN/1dAu8aJAr9qSM6leOG3F3fW4Xk96qQftl4JhTSSKVNSb1ANia6
	VGh37r5aXsdb0GESQphJ9H8q0YDxdP2hk34uxn9K0mN+v7VLNNt3gl78+ejbUzplE
X-Gm-Gg: Acq92OGkT1a4xjkVG+OFcEYUOBuKigypCOiIf5zBMupYJ/YknXdMtTXwxkeESa0o+rE
	ma815xqIltFR+Z05YO005iB36fgoZj1Aeqg/INbXJ6ui4ebacS82PGSmuA/FFiSqSSoaaD9H43i
	pvBC1j7BAAn55yow+vBDoUI6baG64QtzYHGcO9fpMjzlDcSLYQQs/leViYEbL/PpbJYb7pmJbGs
	E8aGTakNUG+hNXEQo+bL9af0z56RVtVwYpPw5wL+zqhSLjUZf5OeM12q/F0mjtI8CeKiKBtm0r1
	yWCzNmS2EhyKUI+4EYDktAwtlmBqkN6nyOcpHEbDvSTgbaHSPDHg1kNI+0GMb3mlNxss8bj5ULD
	2PeJVlnQopQL6uxdGCdVzUM/APp0UeaEIGC4=
X-Received: by 2002:a05:6830:8383:b0:7d7:ea6e:322b with SMTP id 46e09a7af769-7e91be85760mr1719048a34.0.1781787721265;
        Thu, 18 Jun 2026 06:02:01 -0700 (PDT)
X-Received: by 2002:a05:6830:8383:b0:7d7:ea6e:322b with SMTP id 46e09a7af769-7e91be85760mr1718455a34.0.1781787717537;
        Thu, 18 Jun 2026 06:01:57 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4420570sm954142466b.11.2026.06.18.06.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 06:01:56 -0700 (PDT)
Message-ID: <d1232243-2f23-423b-84ac-4463eac79f9a@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:01:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/6] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-1-1cebc8b3275b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-enable-ice-clock-scaling-v11-1-1cebc8b3275b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YbmNIQRf c=1 sm=1 tr=0 ts=6a33ec4a cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nM57NVUx0yqqE4FGInsA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyMSBTYWx0ZWRfX6FFtG/mHM0eg
 gm8oM6iYlxPfpSUYVEI0GnZsx7ihV8EPhHNnbALkkgeSN2cohcCEeml78c+CilNX7QQpqRNAys1
 hdMRabktD19QLjM8ncHcf+Q9hnhEDxM=
X-Proofpoint-GUID: 2nU0lkR90G3u7mG8H4UqNu7O2My44M4w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyMSBTYWx0ZWRfX7mKgMCJNRrX6
 5ukpWL5JZiO8SrincYwSKjvVTfrd5GBSvKRGjJrAxyfOI3hmdjFrk6Y1th2Xt9ZBvh3VIBRMP3k
 otgCEALwQ4yOsSZKsQuDGqDytaV6R5P+qAqLhiWwcsuPyO7GF06l+XS0cye2Ae8IN4Vy/Le3nIs
 M95F/ENZB2GCsSNkbHVvhJMPyAtcQmPt9c/iexGveMc9Bl3/Sb0bnKPxSv7UyzINPwfJV1cDnm9
 QuSoLNSQxXcJctlEDhW6Wo1LCG1KQ5b19HipAoeD8j3X5Hud502ZNAnv1E86LP9Wrl+PF0pDrfS
 6Y5kCo+vIWPYzhh0EnM4RhA6XyAm8jv0aXrOwNyfWTJie6hx9UYzGNt+h0YR96Ilk4F4zLFa4Eo
 F2AcufuYrLM9vHy1ZK/gF2KveUL5NPuEIYoGHl6JrKvSjL957sc+Fe4hRmniixVDTWkofByViUT
 I1EOoOr17QpWjF7Gpmg==
X-Proofpoint-ORIG-GUID: 2nU0lkR90G3u7mG8H4UqNu7O2My44M4w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180121

On 6/8/26 11:47 PM, Abhinaba Rakshit wrote:
> Register optional operation-points-v2 table for ICE device
> during device probe. Attach the OPP-table with only the ICE
> core clock. Since, dtbinding is on a transition phase to include
> iface clock and clock-names, attaching the opp-table to core clock
> remains optional such that it does not cause probe failures.
> 
> Introduce clock scaling API qcom_ice_scale_clk which scale ICE
> core clock based on the target frequency provided and if a valid
> OPP-table is registered. Use round_ceil passed to decide on the
> rounding of the clock freq against OPP-table. Clock scaling is
> disabled when a valid OPP-table is not registered.
> 
> This ensures when an ICE-device specific OPP table is available,
> use the PM OPP framework to manage frequency scaling and maintain
> proper power-domain constraints.
> 
> Also, ensure to drop the votes in suspend to prevent power/thermal
> retention. Subsequently restore the frequency in resume from
> core_clk_freq which stores the last ICE core clock operating frequency.
> 
> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---

[...]

> @@ -335,6 +342,11 @@ int qcom_ice_suspend(struct qcom_ice *ice)
>  {
>  	clk_disable_unprepare(ice->iface_clk);
>  	clk_disable_unprepare(ice->core_clk);
> +
> +	/* Drop the clock votes while suspend */
> +	if (ice->has_opp)
> +		dev_pm_opp_set_rate(ice->dev, 0);

The PM core will quiesce the vote as the device suspends, this is
unnecessary. Similarly, the rate restore logic will become unnecessary.
Especially since dev_pm_opp_set_rate(0) does not actually do any rate
setting.

Konrad
