Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665278;
	b=0G23tp8vhvuaK8LdfrQEBaAiUMOoCxN0Xkc64WOtq2t7MKRcWGzb9TRIxRaPiw91R7Yd
	 s9Ea+8Bj+LRJkrnOTirsnw+KwHFgVv4/a4LI0iUfp/z9gJYovl/Q4PlKiA8fPnNiMUggS
	 PXy8K9peUwYk0g8Dqqr3zuWmfC/nV3ST5E+UjRBHKNAw89RbpsVBt+6Y2fO9vwewiS5Wk
	 6Ll746SUEtrOH0/FfPiodqEkoZORd+KvvdGIzpVvgVFfjjgAF94GBH8fl0NpYjqOHRl8M
	 MkjIKS1VS7Oeb6ywO4kBB3YrAtToA9hfJBK7ZdVR1PRIe4eaqdDfEB6aAWPRtvhYKTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rshDlqNejxJRqysNErHRTceLWSA4tGMQL8Av9Q+N4/4=;
	b=EXmpalnews8RNdqgN27p6oXfR6n8gcQtiFWiBToP3FjvyA4cKVN7hni1nItURCVlWz5j
	 qvBHHEP2VLFBP1drYHSwAvVItmQGjdcqo0RGdF7a+sH1Eal47AiH4tQSklUxAlvj04K90
	 h+FTJSYiJlVFlSmyBgMprqzT0mW+DnNNNyN6Dy19vJpwE0r49Z21dueBpyEvdTHZcxwEZ
	 kMhAMIV/wxKGZi45o++qcAof6zSi1Thtykb+2PVVYjq0FbgjUp76cJO3d4sjMUX9K044y
	 2bOQKknWClv8QFrVhQWKBpe86l2PKWdSK2qbRJqlL6VoQzxelh3HeGMl8IRZwiH2Z2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DF9e5OOz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=juehq+nP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36614606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36614606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DF9e5OOz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=juehq+nP
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MANhas4047715
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rshDlqNejxJRqysNErHRTceL
	WSA4tGMQL8Av9Q+N4/4=; b=DF9e5OOztgxDFBfoNZE41kJRB6u9wLpmPK1XzOZg
	oxLaxAl0b1ueQKf3DNODFKVFJ8MAkm4pdf8WFCJ6WjADdknDxIvm9UBMJvBBQ357
	wQky2aAKhtAsGUTPpmtY1YC6w+NuAlAfGF52yXT4fW3w4s6B/QGaQnvtcVd+7CV8
	fPykJt85SxqvASAV9tEiX0gccsQDSVFEpXg2OxuwaAcA52QCf3nwmYe9vfkKV0N1
	3r7wpiahDDm3aXpJvvDm/EJG7m2R5zmE19VnbhnZwYyg6HnBcE/E/7oWnWXjYOXA
	eWPnPkLRxjz5GnlBMnG+vqLGh7RF/+G0R6yx52GQowNn9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ca1wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf6c528aso285386085a.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 03:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665276; x=1793270076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rshDlqNejxJRqysNErHRTceLWSA4tGMQL8Av9Q+N4/4=;
        b=juehq+nP7MT/cbJ/3m4kgEFz/QpT4AG56cXY6ag5yN5huxsuP8TxHocCgNpB0XRnRm
         CNr47TBXY94VbFHh3VkUHQxwfsZMs0vkXNTXWjo6k9566M3nKrttfvQdAMFKu/RyQ/Ii
         Tl6iuSBNygxi9OXHbhb8Fh/FBXrDrkXQPci+MkVpnsPtoG03JBWVWQ+qzcxvY7P1V52P
         fvpIZ21lXtQ7Wl1ry8F6RO576bPTGOpVC0wd6ClLqpg0RMMP5dTAD5z/YCS+MBOhprrw
         zg2CIibAXdhDOTCORD+RzbrGjoAAwDEY1HljmUxlmYR05UlWYEYcwCR3VMJAWTJ4s746
         jr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665276; x=1793270076;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rshDlqNejxJRqysNErHRTceLWSA4tGMQL8Av9Q+N4/4=;
        b=gpHPbKM8pcfHfSoUuJd+VUMiMx51oFd42ymOhpo8QKIlXx/CLbFcmLJChJygcjbVRG
         +s73zv2Nu7rqX30Dwomta034flTrSUQ7PMY76Oc/9VHnqpBf7eOkWSN7qiUV1N7Q2i0/
         zvgm5a23i8kzcYySOCP0ZlpqZNnjRBZGdCygs+nmCoFNGdSPKk9PTiguNgqi+HIPyTJg
         YftBvujWVOszjsWVcULCs7Xr2P8LjxM9JRt9iNfaxs5+tuZ5PdPKdYUK98PxNTR2XNob
         /7ZpYK6JwnWHcbjHMYuuU3Jit/pvIFuUlhiYdGDrLLSiOqtfSjRzTcMAfBDgS4lIkO+7
         ZgpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcFOQ6yQfwLEuigifL/XKyw8t8cH+TO3Ejjrt2V2tUuK7ksT093jMe9KPg9M45g8YDNiQWtR/+2hPP@vger.kernel.org
X-Gm-Message-State: AFq9FYKx/pRFoWnrZQJLIkK8NZSEFzRQLUiV6vYkiJll0plzXoobOIzv
	zkAUxmfZamYShexioo1flcC10TbitMcYhBzbKN8BgtdXERCPb5iv2GfMPLRsA8KHfcGhNGo7lwC
	oNlQ4lY84qYZgolX/gDYOLnecWlqAx6x3CmDgMeMzuyZtU4o4wiSzqy3kRh76TxrasmkXC8jQ
X-Gm-Gg: AYBFou3ZCPY0dcT9XME6TWD9VEy9l0b6ofx9+Eh8GV+cT6P1dn7tmAjs5W/2jNpN7Cc
	ijsy9sFzSGpHkfcMml9KqXzfGv21sIwpM0dsjrQdToeX1lfvMWP1GSazzDVasNXrmWxr0TTVcA4
	II5CI7FKvVbfBl6TuAdg7n35m/6ji0HPX8B1dOLuvwmLH8I/2WjI9HjWLQm2ePApDaCXQzDakJQ
	4o2TXP6+SKHUunqDhq/5qx4QljYAd37o3IYY+OE0t/h4mrgLBEgscjTfZnlqjkkwe8os9P1qxRi
	37NZVx3TFysr07ztd16/6zgP71VbzlKCSDq8AbiHQXVVPVZMcz9DPinmCTZqNpdc1MBDZ425TMf
	9szl+Yci5vghIpvPcDMVwUxdfXLy8M8GHwH1L/GV1IDQoomt9wwo4HJ6RoCFFuRRK8i6t+UVPMa
	djAKzvskwE7WOT
X-Received: by 2002:a05:620a:31a8:b0:93f:3d2e:6bdc with SMTP id af79cd13be357-93f57f05947mr842711285a.16.1792665276325;
        Thu, 22 Oct 2026 03:34:36 -0700 (PDT)
X-Received: by 2002:a05:620a:31a8:b0:93f:3d2e:6bdc with SMTP id af79cd13be357-93f57f05947mr842707685a.16.1792665275869;
        Thu, 22 Oct 2026 03:34:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1227da6sm1020083e87.64.2026.10.22.03.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:34:34 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:34:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sm8450-hdk: add DisplayPort audio
 playback support
Message-ID: <aihlxadn6dtiskx6ge3li7h2ixmmio72zgipovlnllzjybilpl@wiwzt4dkw3gl>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-1-8a189c71938c@linaro.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-1-8a189c71938c@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfX6LgXdSsnIo9J
 4kFVB60obLKX2tD3HMqD4UxIS3zcCDk+i2uo3ZBZVtYq8iGYPxToMuKkzruqKjUHmKXMrCWv86d
 9WKwitCEqb8bVZIVzDL4u055g+W7fzo=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9e6bc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=DIY0J-lBf1P88TKvtt4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 5trcXhtmrKRCTNLlwCjw99XHzG6ELaGo
X-Proofpoint-ORIG-GUID: 5trcXhtmrKRCTNLlwCjw99XHzG6ELaGo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfXw5YHBoLP78Ud
 ZK8ud9LUCLJxQUdNIBQx+0eiQcUWznzp9MgGru/4HKiBgUF/jVLYfuZmSxOxoFPTS4PjeqOhx0V
 mNoleRJMLeKAVyjzcisEhEG2PAcaJUfBnLCLBusF9Cg5akoRu9A1L/zOR5D4NxIhrRPgnYlLvtD
 HfKH1vfH/HQY2VjLjQycEDLHvS7uuI3mU8iqUJoBVOgsgaB32ZbIktr+q7CGi7oP6xQY0BJXztL
 bhLFJGSJxCBbbTVMMzNHXtSah3fjXQCLz9tIdpDCi2Turi+0xy8O9cFcDEfyFrc6GSdyyDoPyke
 +gpoQnE29xttYb3pSvl+9CWAlWq3hYhCChG2QyLoR/ZPHH+ew+fgSrUEgHJor0kou9j2QyabUxe
 BigbtRZH6A2JYevr0u2ITfriv21FVHrwtVkUgOpzw1W6fOYh8Cd4bIb3wtMOI9/9AeJtDDgT8uo
 fnma97VEqe84L5BWqSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220041

On Thu, Oct 22, 2026 at 11:36:21AM +0200, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
