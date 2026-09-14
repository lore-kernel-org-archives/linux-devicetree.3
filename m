Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570E844E67E
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388914; cv=none; b=rqCZzyVuVUqIsxc0SuqAGErUz5e5AII8NzFoz6bxMkEEZmDoU/KBZvYxsx+s4Ri/WHwsbSVg+gAHdLtzTextyOaoKKUf//xTeJnI0fef/gSkUNxi4eVin0iwbq4CK8pZn9W/OteYmRcn+xRLPIpCx+5md7lXrsiCsg10LVgvFFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388914; c=relaxed/simple;
	bh=9DL0kYRPp1aAw5C12Omv4zJnYSX+EN6BhsllZoa07R8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h5+Mpk70agA5jTQtRTwPD9OpXBB7S565sLoyr9K35E+r4QAXPK4hnosUxKFmOQnnQO/R4vBBM3eGG9EI8Pel5WsesKC4C5bbkJeqmdEn2NvLkmnOeND+DcHXGQt7B8L9uyPS3D7oX4D5dUTPBY4IHohBqnMgKfqfrvrylVy8E90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmeNuqhf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BETfhcmi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmeNuqhf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BETfhcmi"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm1sr727573
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fVRiChZYr/F9P/d74sBkacRr5i+5ai6D7md1w2IZUxE=; b=XmeNuqhfb5Iy7QlQ
	MzsyAC4FVsVPHbCsLxMHNqeqwwnthia+TawigQ+TgzFjV7mzmTXwBDa46Y4DoS3q
	SwgWHAhI+sRU8eNicDrpqVpCxxGtUcZ+X0Jp8tkU2MpgqnefDwwI58wTCgQCBzXl
	fMYSoboKQAdIzzMtr9szjkYoc4DfR+yybucbmj2wZcZOiyNLc3RvtxLnubKgLonm
	9S5lQmC7enmhbW/GEsT8CtF9YgG+SRkWWNcvdex1XfKwQuVc+h9gUdawdhVLrW38
	JH0dA+xJJ2ISR6ofhuZoRQphSSbZEKsiadOGXfTGvJ3RE/xoPaDJd442/BtCoyMO
	4/sVJQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5rve7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:28:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f4002c1aso40578285a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388912; x=1789993712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVRiChZYr/F9P/d74sBkacRr5i+5ai6D7md1w2IZUxE=;
        b=BETfhcmiVi7h5wVPY95ojyqVfTBbuAJ2KAJXvFyaz15CUNpZ3IKfbiAe0Za5mtkNyQ
         xROimNjJRe9ICTOF2FxWdv9d3S6X3TQTpf7Sh48iFLj6yFyI8YT1eBnx9f2os03D1WEP
         eIfvEwEuDYS3B6M7HfPdGgkpEXlbPXHlsX9X5+hMlc8xQJjJ6v/EWuvm9XOB68kMVVNG
         p071sNXVBmvM4I1slRPMcqbkOShNWHfPplFL1d1j2S2XRoDSmo73agQPNIBApAbcG3hZ
         deaDEwK4II4quTi9x/FIb/JXxSluwDNnwxesgGJ8epveSq/q/ydxubbvH/2q1iG6ftE6
         xqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388912; x=1789993712;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVRiChZYr/F9P/d74sBkacRr5i+5ai6D7md1w2IZUxE=;
        b=Y0peHPWdMyrl74eYqI5nQzbqnepy50Q+SL0LNDoGtC6grpdLzgOJRmIHKjo2jgs2cl
         e8cXhrE2BiKfYX9mOi+1+dh2CyuKFhpkhuRABwWjAzAXPBX1y5GiQ67t6v3s9cPBDpMP
         ocekrc2ipErBpXFVeESADvIbqCxlPGgQcvJSkhfD5b+1WqTjVQsZ2B/YwPEX5ZEjG2pD
         E/gBd7uG2M+lsDGsdm0HlFAnLfSBEHRJCPv1zphk09RyApvxBV6kU+Yxn90Tvo/ejei5
         ps3IaAahtQ2dYCZY8IkHDtVrrD9nGdyPaIyPfHrw/voHSE/DspGzfe/RpIGEcTWw7O8y
         vWPg==
X-Forwarded-Encrypted: i=1; AKwUvBwJ5+AYOIDwNgdiPpDBM9OVZfyFVA9Z3BXl2GeoeaPOR+VHK1NVPTZVT8QqrnHNIgsuiFCXsJAGm5zZ@vger.kernel.org
X-Gm-Message-State: AFuF++lbeFU1rfBK04NRpt3cQHiJAnPv/fFaXegjI9FhjGcBRnlOTtv8
	xPJaIAZqwCqHOlJ18t0CBGhup05Z/619dqteOiHNLrp2NfPMplHx6G5A1tPKDD3YthTqR8txq1G
	EMAeLGYIlwmPubYUr9x+6AEcfHbKvxIkacz6Y8FGqW7H5yNTsIRtzrgtilQHVgWKF
X-Gm-Gg: AYBFou3F3Cq0dTE44l8x5M7LqisYFahaeih8xcSrmKFtgSgyWwHMMPiMc5q/1UyD/5d
	agUxgLb7Xn74UgK0KQWhq2+9moJU6T2m1sFiZk9xkeQQiz9ydcwvNmCfB1aUvy8k8fpNqNbMfCs
	l2vQz1MBcEckFxMskLqPh7o1XTc4HCKI24JGLPV7BiCOOAihR/ujkW50s/gkuC0QHzKH2Cb8zjq
	Y5mZyPxL7BAZG5V222pvHrXGOCLa/aKnV800ufELtTpab7FmZxIu9/ACERcmZ5yIRQK7CkSsfiJ
	Eflx2TYijp4nf/QxbD7t5h4cLrzlsvQwf38ScJmyUb59WISu/CRPL7k+pA+ykzWmF6m62jbRfoM
	G4HCnBFpnp39GM00aFK14kw==
X-Received: by 2002:a05:620a:4806:b0:93a:19cc:107a with SMTP id af79cd13be357-93a297c2f9dmr279733485a.1.1789388911388;
        Mon, 14 Sep 2026 05:28:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4806:b0:93a:19cc:107a with SMTP id af79cd13be357-93a297c2f9dmr279728785a.1.1789388911045;
        Mon, 14 Sep 2026 05:28:31 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm425149666b.1.2026.09.14.05.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:28:30 -0700 (PDT)
Message-ID: <ccfcfd57-3adb-4a50-bd15-6e2eb64555d7@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:28:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/31] arm64: dts: qcom: sdx75: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-28-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-28-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXw+sKM1HJo/YP
 eTtuLoxM2S3+FbLzeAQ8q/5jBnqzMLNTV9Y0BRxDplCo7IGBQ7jq5VPjMfQXUukdbwzwBUO7Mt7
 qb5GxXFh/BHBO4+2hkCN0QSh0qKvsjE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXwBXEZ5AZgrKm
 NVHZsNeCaBLfeijHtAS7M3RWx3990DvqeVHwd03Y8fOtdclQDQ2io8mRF+7V1CcPXEQhQMxScGm
 MUY5a092xyzt/GXNPaCtIbj0N7Qwz2aYNMWpCuRwMPm5WH9/AHAlAsrr1rmVgjtso4xHShsiIOp
 4H08Wq9986dnZxZ0xrPklAA/uK1Mwf3eqrpo7801EU3zp6C8Pk7D6VAoaHXGDQhX6R8rdar+DIJ
 yarvU1TWixHvP5dG3zupW4q1L3ev0+jVJSdN/i+s/BAMmO8CpfRIArIQHoQ1VIVwi5xI4VsmAEF
 dGkyFPa0FirjKUkmVksX4epLGgpyhAC9GPjWQOVS4R2/iXwfIKQqYYyMw7tC0/X7E59gOTz2CW7
 TAUIg9So/CZtCDRevCjKALLJPBJpGAoWwlYoWNe+7200nywaPJa3cPT6IBXcNRCGZ9149XYr+oM
 EcL4gO37iQjb6vt8rsA==
X-Proofpoint-GUID: 4sBLWFB4s8S2ve0jcNt5Da-ZKkXHL96b
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7e870 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 4sBLWFB4s8S2ve0jcNt5Da-ZKkXHL96b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140177

On 9/14/26 9:00 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
