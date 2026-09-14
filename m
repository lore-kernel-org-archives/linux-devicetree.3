Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8303DD523
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383712; cv=none; b=P34O2/XirxYarlQ3nhcjKxAUC+oqH+ByfxVlIMBaI0enGJ4RXpS2KaEcdqgRN//LN10GIzL/cfHYL6Dfic2lZW97jCxRf86g05jEi5qpUGuse2+C/FsXqzgx8JQn/fxEx/CeBFLY1yH/zj/b7QNiJgJhZtNTnHijzLwNuH7jsSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383712; c=relaxed/simple;
	bh=WAny7QdWQoRZqoQZqKkBz2B7L+/1oBvpxAVPoMK7GUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wm9vrQI2lUkqlc/Ofug1LcKbSYIufhNeLDlxcEdc2Isgehwg+W5PKvTcnzQHIcDVdkthgAdV8wQaxpc/lxlBSWCKkDJl6M8nSUeqDZube8mg6OgwgOjRaVv7yV5dREmWowFuekY+0WPfqG1+NDLT73csPrFklTqtzssGytSo6fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9xWOOnU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JxD/glD9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9xWOOnU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JxD/glD9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlxMC1460628
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kUvvicmf1Pz6OHRfECxRkbI7E2RNpSBZJHEI7jBXGZA=; b=P9xWOOnUmk7QRc9f
	CicOBz1sN8+BOXvw81Eij+o5kkT0/xNYhz4Dk58Q1353yKS1Y+NsPesUFQSen9oG
	v5f8IZvIe+rtBQGfiHqCS7Gj6BpQnTH3p0+dU2xGI6E+PTiCag7wZKOPyGEiXY+y
	2m2gB81sWzRoZOoHyyoF4Xmr+g2LUXeY0umjwJEhNBgFVGkmByEa2NZ/Ip1CArk7
	omQHCHXHy1iv0NWQTVQVkO4Po/XhejVGJ3hOh5ie9s6fF6MnC5Cuf3x8k7pYELfJ
	V4vQfXY7RbMAyHbGwjNHwIms6rRFAin5CqAvU3zcqHfEODsIPIx+iPUY25sd8oEQ
	4BqSPg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8b3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:01:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9106a836457so8763686d6.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 04:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383708; x=1789988508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUvvicmf1Pz6OHRfECxRkbI7E2RNpSBZJHEI7jBXGZA=;
        b=JxD/glD95BRUMjS/EB3znrKpjvLPIODj2aQKqGEehJRZa4SSPegx8B56DHT9DGN7/r
         6tQ6oCw1RcwqJnd17K5OtiRFGPAoykijhqwP8Jfc+Am5qsJ9YzsV875Mu8yHa31g3nT5
         smus421D/+jCP8ObXPbd6LtjB2Y3vOlIQORuuYkbODlHO1SoOukWIa699/cwKQLK9iQs
         H/P8/v9+Y9Jn5oUvjV9Uup7ruPhBO33tWWQcvmY6hcqDi6o+aXAu0JdtN8s+7Z+d6Nmv
         HF/B8e8Lxq2IOHL0Y2402bNo13rNSytIRLX+vLTSVWLB9xMH6Hf/9lhHoRGFaVTLgr2h
         hvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383708; x=1789988508;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUvvicmf1Pz6OHRfECxRkbI7E2RNpSBZJHEI7jBXGZA=;
        b=OhpxlUpkVx8twH5PETbvAWKQsjjjq78gJD0XTtvxoHV6CRaM4GTzp69W0x5rb/grXB
         VLoQMeNYgqx7yshfuYpdLXJre7r86Pdog/9UMp77bEIszQCLibUPHplpuD61SpguzuTD
         uppUWFP4EkHMWJnpoigLY3EYL2vqYcPclGesmSk4l938Q71cYh8mKUqnCJZ9jCiN1UWe
         OayYV4Hg5igBunXgrohTUZ3zyh8j5bg6GLjjttA+O5w1RLqWNBMc18JcPRdOzhiQ/a8t
         3Wi7eCw9y01DMHxzv594/WsS95rNvCDFiJXcpyGGDsHyGtycloLB2QW1OtoR25qAkprX
         JQzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtjo0x0U6bGYWWRhWUR9ZXWanLl7cMfXpybS3aQBMuWKCySziGPgKUUn3h+42NZKZ5o3wAtli0lZ4B@vger.kernel.org
X-Gm-Message-State: AFuF++lOrBfktVidxpggUmrm21a2HeiXTe8hvRpIKiFpj2XumEFW/NiC
	d24Fvuxsfe3jUoU8tJOIDOy6HQ4whgIoWYQIRoQK3BGN+mYMeUiFM90WDN1gw7DlvOpfC5x1jmt
	5Mw7BqF4Lr8TvKVz/TL0+vckDltTzsgi/P9vc43u4zAaccKGg10QvCDbJyywqskv4
X-Gm-Gg: AYBFou38zGrcgM1vfh69ya7PjQNkUo5rYQ/Qv4eVA0OlCkGKN9QJO25CUhKEP4VtHw9
	URPQsHXl4oubDIsbEDaIBWwb8ULlXkHLXmmGm10IbguLrYWegk3YAB3RJiYpGG7lawXTAJtA5s4
	SKL7qiDTtATtIGiF6H2F/oGbpqCCrAKwj8r20g7FOL9Y265MBA4dVuVCtqEpmmcjOz4uW/+vXOh
	wD7QaDbJN75qmraGsYGM0i6s7AtYfzfz86lP9dYCyj95H6bGQ/Dq840k6LcSHkOzuTV4H4ypMuS
	h1jGTT0PDhicJMoaNF2r1sr+/QQibFxZlrRteeL2s6SkCrF9bMfgo8nmmL6SaSTom3V3oh3f25z
	miwDAJRphFOk3DtF8tzCdYQ==
X-Received: by 2002:a05:6214:19ce:b0:908:2053:b57b with SMTP id 6a1803df08f44-9122e6f2b03mr25478296d6.5.1789383707545;
        Mon, 14 Sep 2026 04:01:47 -0700 (PDT)
X-Received: by 2002:a05:6214:19ce:b0:908:2053:b57b with SMTP id 6a1803df08f44-9122e6f2b03mr25477836d6.5.1789383707101;
        Mon, 14 Sep 2026 04:01:47 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966122101sm409951066b.54.2026.09.14.04.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:01:46 -0700 (PDT)
Message-ID: <ba6c9962-afbc-448f-86ce-3e21e609bb5b@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:01:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/34] arm64: dts: qcom: sar2130p: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-23-90a252ddbbfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-23-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX8Aa+qL9Pp3lQ
 LEDSv3M8imKX3OGbrPG90udQrUstmzyJKfkWPeFSzqzrmlPfWA0/K95mqSKUyuvle7BtQLhYjm3
 SxAC79KxpSebKsW792mFsWBq7wg2kxK551Ly6Tvc9EynyXdWQa4I2xfruzrHi4UK3NfgnXXghrD
 TZYyLP26VyyHqy4Pk8gKUxQZbEs6+Sz7hhChTXeK64RnXVH71vGO5KprgN+SUex/aInHsRvWIgs
 BzQKFBZBWVuRkUafb767DTvDz7zDS59GWEr7pRgq0VultqukMzRqE/XcxXWXVxHO6kgmm7qOzaK
 8mWfhQZvkaIRIRkhsn/9pBty7O31dhBPjkLNVWCB6yRSStuo6IqZDM5TwiinQI9jOVXlK4+ADI8
 ux5erfOtyA4N1hQbHNISe7PToTB6qhsKpYg3fSGb/cSD4zc4HjebxuZDgrFijkTSwizXq0L15+j
 Mr0eEaj+/9BahNMockQ==
X-Proofpoint-GUID: 7YjC3FORGWGAhjGC9qkSLhd09e5afpn2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX0q7zJAPm52m8
 zMF43jS7xrVywQjd/6FNB7qbPCNJF4hRgxFbFUJHlGV5NO0v1RE67NJoKZxkifo8ShagEg7WNMc
 1Tz4l2eC0eLh2zewgufUpytflNYnwaI=
X-Proofpoint-ORIG-GUID: 7YjC3FORGWGAhjGC9qkSLhd09e5afpn2
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7d41c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140156

On 9/10/26 3:29 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and newly labeled pcie1_port0, allowing
> board-level overrides. Move perst-gpios/wake-gpios from the &pcie0
> controller override to &pcieport0 in the board file, renaming
> perst-gpios to reset-gpios to match the binding used in the root
> port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
