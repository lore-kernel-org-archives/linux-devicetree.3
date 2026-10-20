Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486581;
	b=vK7ZNT5vnce9zhL/mOE552skX+7I7vasjH3RzMmP6ibdWRgIv8DScnhyS/HhXK5VD+e0
	 21cyhIcK+4EsZtUfOOuCeLrFsoAW0rJVS452Kna3vEOVkovwPdNU8E98MocHopth1B0CJ
	 RcLXEEIef15/FC0W2e8fMzo9P3lJRJNNybUssS+gakpWVv2SprUQqGgs0tTwlNMLlxjoY
	 VwXAoHZfPrr4xzyXPzUe1sHniC6aCEvsIWQcY7bSKgLrRJacsZagqpvL1GHfRfzM3E+6C
	 0ueRGn68zFH6wi+ATT9pKSAJ47ypKA/MEaDXCKku/HpSz487MujWWMRswKCniY+eKBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486581;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BvkHiyeYubNkphK+3iSkbkxhjPqzznaVKMsZvin5s6Q=;
	b=eUOwudtWwcO73a0gt+AKl4GtvS9PKTIqB9rqMhBcZtnXAtT8lkvKRGuI8k6trq+UlRh0
	 6hzjNKPh9OYUIwtzf0IvlriGL1LJymQsPW+nN6G+X2DxDzCkVvix0xHDLrB6t/I4sKHBv
	 SP2jJPZSIUk1VVeLcDRVQ/URBPvKEuf0T2ycCx3KESpSvyl3/vvuGf1Svl8EkSJjcG5hb
	 YzKxZb9l2JoINb965OoumBAhK75ggOAMb9eHJjId/hKZC90W+jwus8UHDASUgAweBXjsj
	 CafdTPsLvbs1Q3+Ry0fNLLCpDd7gikfFTCxgnKSKifUiR1FmbhkrXf8gnwLR68/J5pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TuebpQC0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dXmvX+wn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36392606A336
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36392606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TuebpQC0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dXmvX+wn
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8LLE74031765
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BvkHiyeYubNkphK+3iSkbkxhjPqzznaVKMsZvin5s6Q=; b=TuebpQC0U0UNIRHD
	1V8mdIu6HgSxSNEgjIATRpxUJPiK5MhPlXTYyCjuZU6XR15wFj5mIVhp1XXm8f0y
	ZX9twAhdIxIPlADfQ3wgu/EsVVaoxQQrL91jYadcqBbFTxxA1qXI/uv+vz8UTb/2
	8wEMXlwL0tMdyVyGHSS//CA5PVCIyzfzxU9N80eU34Z7zJiSANjYY+aZpTqVQeGI
	Oj6Aa6RwqPKGmZGpe2p/GrEhrsJI/0dbCyexSOBkqcKkYAoaG0/ZbMSe77yiuFTT
	VDp6wJ2IYFNyhGSUJfzEhdiBL5itTbWTysEmmRSJWF/yeh+hlIt7PrQr2FKLaeSL
	+mRb/w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5q9pfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:56:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9178ba8eb30so4026006d6.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792486580; x=1793091380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BvkHiyeYubNkphK+3iSkbkxhjPqzznaVKMsZvin5s6Q=;
        b=dXmvX+wnTKv0X8+VSWcrlbxSEGDFon0yb8iiXko8kYTefbE8eh5xBfw1/rRFRIDIfm
         YBTjAkAAuk99gcSuAribX/zweewRKH/a1kFELZ1taBX4ZZHsVMdSs0Xg4m+cAY1otPDh
         I9xHMo7mXwiSih7gbfUZ9ugI/IR4fUkTozuZQDVtW9rmBljAdI/3DfzH1yOahYQ5/lPm
         G/fCGkMZX9rJRuYSRxx25xyPxSz8Z7U47C4SkD70OE7P4fcZJtW4pCl+d4lhqWrOWFDy
         EeKc+DU6kbRI/0uflls+dCwTDx/Pi2A8GdJNFlaCg5Ttgwag+xv66vMgnd1JaV1fOfqC
         hZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486580; x=1793091380;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvkHiyeYubNkphK+3iSkbkxhjPqzznaVKMsZvin5s6Q=;
        b=MQr7aOWP0N/TCiKbnVcd0HRCNsmx4WxZ0ci1Wd1n6vY8PMxIVjUAku9M0SAhtTurQ7
         z/fvnjQbXVxd81Dz+CvC8zD0ErPlSeBhXWtUT2s3PZtkcTtR9FgaCACGM+GNc7/8YID6
         +9TZZSYOL0G4n3jQHxQY8aUzogujCoat1JqJ63NPMZ4XHRGce9P+bEZiSykkKEgaq+9s
         Z0irefr533+B8d/KPTD6VuPadi0EbhAAX/rtaB4eD0rZk7tcIpJj7QlU77xz5Ag0BVDI
         CNrVr4v9bNKNZeh4CeW3kcajTKdnWQwgEsDv1CB5Kd5ylNmfyRB9GSWYIBJOnLPPswE+
         KE8w==
X-Forwarded-Encrypted: i=1; AKwUvBzlU1cKe1fV0/r1uHyFvBqOJR214bfcXS8fCLsD2P3bOcKatWUV48vD2K0TbmyhAhKmmWVR+MK3WhDr@vger.kernel.org
X-Gm-Message-State: AFq9FYKJzQLVO6wmOhosqxQD1d9YMqGmmMC42sI6aeNzXaKNOgLjsWht
	94/XzDUfB6tj1te58+94Uvlg0K3gEzI2obIb7cnfuYOydS3wnzS23j7wSNLhTxbdJ/naQCMZkNz
	c3UjrpcrarhxYEGbXpXMaMvBxmrM/XCkjtUXEQH1JbQ6NhF/lodt4s52913uNV3aj
X-Gm-Gg: AYBFou3of5DjFVbef+huFvoQcG0ptHu17NQGEnCIK8eumtZtl1PWu1e9ysXHTm1PPTr
	e8mtWlZCCWiGk4aVCoUQTUp1ss1xr8K6I9DryWCbGIgCGus2Dr/4Llz8QhaBuvMahFXtbPJqWPa
	TXQhFqj0f6mXUShNBW7NmRsg8/B6elBO1FNIqVJWMQT3qjLoOB4o5vFg4xBJg5uoEu/InnrP1l4
	7g2uR4Z8gu9ZtbFnh8nc34VgEooDtY3zIGNqWWScsc7hXCN3T5C/rYArhZKScgRXMwVQerk6iOx
	yh5HmppeiJI3alnpSvDRXB5MJIkAPUJaT/j5GHpYyCxw8dq5sN3vjrYzHS2LXBkqyIhxfMSx69G
	6dlkjy/9jxMAAzkrvb8JvsA==
X-Received: by 2002:ac8:540c:0:b0:534:f411:a5ab with SMTP id d75a77b69052e-53645ff6457mr128003711cf.4.1792486579640;
        Tue, 20 Oct 2026 01:56:19 -0700 (PDT)
X-Received: by 2002:ac8:540c:0:b0:534:f411:a5ab with SMTP id d75a77b69052e-53645ff6457mr128003561cf.4.1792486579189;
        Tue, 20 Oct 2026 01:56:19 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32bc33sm462325466b.5.2026.10.20.01.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:56:18 -0700 (PDT)
Message-ID: <0975b38c-381d-47e6-8894-0493e0daf613@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:56:15 +0200
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
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sda660-inforce-ifc6560: fix
 ADV7535 interrupt pin
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020-ifc6560-adv-v3-0-5da1a33fdcbd@oss.qualcomm.com>
 <20261020-ifc6560-adv-v3-2-5da1a33fdcbd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020-ifc6560-adv-v3-2-5da1a33fdcbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: C5RJFEdgi1oJt4c-1cLBSTx3CYHPxh9C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX6vS8UZdH+8lt
 oussk4oeIQ2q3ZNWf4xSnWnKvpoZhzInkLbrav0oq37BaEskNKB9mZVHL6UnxBSHE/qR1w1MUEH
 eHboQHcdkHfaFYUhfR2hLB6vw8eAHFbBR+V87hChj78OW7/jCOQOIXRq9RgC3BzIWUiaNbDPf4w
 THtQxGdKK/410Inscs9rq4K3iYdTtFXNZZh2dIVwwNvQw6dq0qlCEu4s7wWVI6TwgANTvsdDzg0
 yCn0Y2qL1xAGoOyhsuGnxYTZNyRCpittd5KW2gV4KVPTWZSJR5ZvHPz+wMCMzekz5iTVH0pHKPj
 GLl4YGRNkTbxhd6t7ZSpS7ETtDukM+9eka4YLUTMJeFhuQItEQ/rcIf28EzyKmHULb5umomOwle
 DP3OIDHh91o0/AYTN5i5pV+dHnsheJuxm/gI4XBN5vnFYBdmCdKDX1jPS5QNjWLhMfv3CWtM0sV
 roOE0+I8PuBkY5W/mtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfXz9wEo0OKWvTf
 spofWRvqqTW4HO8uEb3jQ9kO+06rcicMscDaZEX2eKe0+Z/uT0t0HEouFAVRgjmiPJ3NIl20MYT
 J8Ns/2OCpp1zgG2b3NHrdbYWiAl2dAY=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad72cb4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rjRgt0PbdpDDpmAIlJIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: C5RJFEdgi1oJt4c-1cLBSTx3CYHPxh9C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200035

On 10/20/26 10:44 AM, Dmitry Baryshkov wrote:
> The board never configures the PM660 GPIO11 pad carrying the ADV7535
> interrupt and relies on the state left by the bootloader: an input with
> the internal 10 uA pull-down enabled, working against the pull-up which
> the board has on that open-drain line.
> 
> Add a default pinctrl state switching the pad to a digital input with the
> output buffer and the internal bias disabled, applied by
> pinctrl_bind_pins() before the driver requests the interrupt.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
