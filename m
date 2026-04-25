Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749292153D8
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 15:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777130035; cv=none; b=aCoH0z0B3vkuifECGmFaTPerLtM80aqFiw1jW46tXDa8vvVrjNUFH2EuCKDG+E50XuNI2dU7yNRrc5I0DtcqjWHvSFmdYWIR9WluImFfPqd8RXgwysmKUeFCHgsBUaZZF1VRKvb8NhDCHK/2IigDrV5GNzZkv6fHPS5zexVfJE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777130035; c=relaxed/simple;
	bh=q7kw2zvOYOZfIrQVu43Q9rg+v3DOzSEBWRSlSX0yqZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjfyYKeOsa1P9VRGcDNIaLBQfxSHipPtPyY6x05HKKUxh70KqmfwLxS95zVXbrVlU+fthy1t5NTtZ0yURWj4MwXagTDpbkueHG9FvkFUP1F9F2P0ORZ6JOd7cYJO1Gc8mxHjyWFFxNzC+Q0BNvtWJClYcwh19sfsVa74wUcx30Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R3ztoQWy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VpYs6G11; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R3ztoQWy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VpYs6G11"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3N9jO207455
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 15:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ISjHcJxWlHfZdpd8WBKSKC6d
	k4V5pw+EOv5nNsZ3e3Q=; b=R3ztoQWyg2GnhG71qOaiKM9hKYp2rboHkSmABiiT
	Rm8ernq9x1nuXZT5P3AC3doT9IL8OjICCPI5V62I3gPyhkEon1i9OVmXRY+eUute
	p4R4wyYuFNgbwn01CI+CRoLJNFyrx+C4deS/bJbwiArraMF2OTDMRmAyVN1ur6dM
	KkHpeNSBVvsmfdKAfX3R0Y5FDnB8IIRPfIt8AtufYq/wNlc3wF8XKKt8c4myXr2c
	6ZpW8KQweyGQoOZxmxZTnBgACeeEq6phVhcdZGDUrwAQ2k/kXWWxj2tel+S8ZK84
	kYlRchvmUYfiTMqDnAD8/+rIMe6y3I2V4xOaHq5MlOJQtw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnnf15sa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 15:13:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8acafc224a8so218095786d6.1
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 08:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777130033; x=1777734833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ISjHcJxWlHfZdpd8WBKSKC6dk4V5pw+EOv5nNsZ3e3Q=;
        b=VpYs6G11LFPTWHTkgBumuWOnYjAcRm/HZwO2gY7/+xVR0QNn6nLqeCJDWb4SL9kod1
         pxwOEQsZHXLFgi1bFErqPRvZBGFMQM7JmIEMtU3wfzLCgWtKFoMGPpxUsj6prlDD9mNq
         GJCeIlHjsjX6V24Larcy1Di3Q/XV9Iy4Ijgnf8+wtCdTFueMLQTpVP4put76qPqiMSap
         CViCWqD+dkbfZGRcM3zuVXJg4bwlpEAyIXFiZyrztW3JeahQ7AmS2o4/iEp7zjMpuO52
         0f572QjtoR0AGZEO0uUkqe7FkkptZcc8cGYu1QB6mtF96yKW+uBu3jS1Rh59CsL0B3TT
         OZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777130033; x=1777734833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISjHcJxWlHfZdpd8WBKSKC6dk4V5pw+EOv5nNsZ3e3Q=;
        b=SCxuyaq8W8VqZYsmWYhvCCOYhw6K6u2YNZL/c+KGWpG6Roihl0rV8Wwv7/yItYSo8j
         FZffLNgvEXDlTEM1+1tQJancyQrkzjipjHpFLmjZdpQY6FL8h6jfE+poAQjPo1fI1GSa
         wwL7dW1D0rabyYXD1rW0s+MAN0fyffvON8w3o9XZKm/gS6Bpvr41ZqlEmbIjqzRCJEbH
         SvgFAdJllhXB9gH/nrsJaf1LLWdHHPAoir3t28DZjiDEitMjXLvQsmUzkyzyAW/opCJH
         AocD1zcYUu5L/zW/p/spp7rBeMayO1yeekhWAyLXGb1UqvFEwWWndTfeLvHFJThPMcgX
         hg6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9EY+KXrFFKhiUpnbvPTZ3O9/wPy0/xox0S1eJmpQlemLqhFTWe0cX1OU1PdDqnYY3/me213GGJSQpJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzE7Wx1GLIb6K3KeO5VVkRHIOsCX2WRwUrH99TwolmgXgj3Fni9
	mI1QcmKnN/sJdFOMYU0cPPXmMznfjEzLyRRmk8LjOClcCKGR0505ScIEhPjDV0Pfxz2uUfl+4Cl
	ey9dZ9kOhfMxVe5V4Ff0sEnPiG5Tems0/AXrF0QlCoBj5JwWufRWXGpGFtVOQcCcr
X-Gm-Gg: AeBDiesJ+Ths0yCfxR3ankBxfpW4weREIGT8BG0ZgJdfl6WD7PKFHAfjD279zl/V6io
	u6j3YGJWOSnf7FJtgi/qQ2f5E37jOP09ICsAMlIdlvkPBAx+uCrmaRZFb5SIb+aDDR7F/13p924
	thLDL35WMb4uAIJwb5ABmDcKFpP2vs41xD4N5EGNxvgMfjh9G59Bd2uIsELV60SygXy4byMhsaC
	yo0PWlahcZtvO/XvfmEsIseT5mqVqx3X9BKLD45weZRS27DL94nmSxVAnVXu3u85XiBBk9mGyGo
	GpFX7L8XWkVDTR/FL4ouVvXjsoea8N8GSomcEg+eR1oxX/23IExqzdEADSe0pYkmWtxxoWEiL/4
	VvJD9jplwSMiJowEcNupERDC497Ft9WUyXZcRytKaenqNnKkgKLcRpsZwg+LDW4i2GRLQln3K0Q
	FqJF/oHWNbfD2QfKwOoD9vwRNLbmJgHyNR3HhREBrlwlasHQ==
X-Received: by 2002:a05:6214:8008:b0:8ac:6f8c:a9b with SMTP id 6a1803df08f44-8b028059d56mr474099586d6.17.1777130032723;
        Sat, 25 Apr 2026 08:13:52 -0700 (PDT)
X-Received: by 2002:a05:6214:8008:b0:8ac:6f8c:a9b with SMTP id 6a1803df08f44-8b028059d56mr474099086d6.17.1777130032338;
        Sat, 25 Apr 2026 08:13:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7b22sm6760693e87.62.2026.04.25.08.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 08:13:51 -0700 (PDT)
Date: Sat, 25 Apr 2026 18:13:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ekansh.gupta@oss.qualcomm.com
Cc: konrad.dybcio@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: talos: Add memory-region for audio
 PD
Message-ID: <jjnciedre42mqllwoe4mkmi7a355itmbcmuhc3oyrpdjyitnkj@mntkm4zonfdq>
References: <20260424-talosaudio-v3-1-9e2ad5d78a2e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424-talosaudio-v3-1-9e2ad5d78a2e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9trPK_0l024ANovwqincxxg_MEGuPkQK
X-Authority-Analysis: v=2.4 cv=Y5rIdBeN c=1 sm=1 tr=0 ts=69ecda31 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=a1fqm2Evnh9_vTGrcMEA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 9trPK_0l024ANovwqincxxg_MEGuPkQK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDE1NSBTYWx0ZWRfXwUnfApDHZjfH
 McqQ2OxcS13sL2vdHT1+GNMW1aexiU2IuWq/Fw3/9mrbHHT2oy6yf9YnaSyQHl8U3/EdJUoPci1
 gAMKMgn4/rZsh2IlkEn0EB43UTMzAkaW3ySjXSkiWsudTFP4Uso9+tAWGgpbEekGwowjNz7eCPr
 0EIhC+62iUwugKXgMd9P+wLPcpZBFvcwlrXFL9NS/2lkEyoArhRHvIjvnwY96FOxKw7gc4B+u84
 5CgkYvOkNfO+u+KBOcoFO2UH/UDuy4lqr++why5Fi731jw/LrhEssNaViMBc/iFQuR2yXo4emCu
 I3hJ00jMBbgBbHjryYRFhCHHbtoThoVJVoV1POMsz3vgznL7yTHIFDnGX7aOjNY3G9IGfTknS6i
 BH/j6jhz2ckhnu6RuC8GzE/Abwb5ugvdQOeOAoCrdtyiPIIQbXU74Za5fSD/YX16lHgdJudp5DG
 mHuba7qNMeKFc9fg2FQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250155

On Fri, Apr 24, 2026 at 03:40:22PM +0530, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.

And what happens if there is no such region allocated / assigned?

Also, can we please get the remote heap set up for all the platforms
where it makes sense? I see that it is only currently set for a very few
devices (hamoa, kodiak, lemans, monaco and SM8750). Checking the
downstream sources, I see the remoteheap being set starting from the
era of MSM8996 / SDM660.

> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

-- 
With best wishes
Dmitry
