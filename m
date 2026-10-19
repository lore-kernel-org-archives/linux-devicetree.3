Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421620;
	b=ceOv8iAD1Mim8y2dUsF1D3SGm5ghs8BL17jqVFzPJc2NC3i5n9RBfvcG1M0jXO5TFBOm
	 t2VqU24CmLIRTCEPenrdmcmQsI8qQFH8JJ34HtwB9Bhh/iwnNxNufO6794ahuQHW1pgUu
	 lbKQOrlx2UGl2GaRd2HrASqyyEJnXU1bHj7z8tljzlxzibtwDES1lJlhXJ94tsH3O/FEo
	 gut8UaGF7T/LleRRHzyB1re/b0WP4GzaWkTt16Kn6fZjiZ+vpxd82xggvoWItrBEOKj+x
	 jfRbOLzlMb/qpf9LGw6495RJcoy4WZLnBC4DDPia0CdV/YnUSNjfGPZMFzz5XIZjIWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421620;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
	b=juq8BaZhMUxeIJ95Vn4skhpN+HFrAFmBWPgpgD7niwk5jEuhoZWgrfMlnp/+5MpMUpof
	 6zxCIhp3Oarde5X71wLukIeMdu7mpe7vNb45RsWe3kcXLLn7H8Pub4m9XeW+QtcopzWoF
	 3iFP/bby1xinUyu0/iezH4Tr8+CehUyPv3USt7VNIlqidbS2YQUQvpi4Mfggq77nJo4nw
	 SjkFAwTJJSW8LJihZdgclU/rb7l+goxV+eFk5l6/yZweFtG2naytij79G9kcOheEGhqDp
	 3C/At5Q6gjQ52tyGsNKTwZ4/+k71BoRGE4SXIRDXkd6xwU1gtjyMZFoX92w1A7z9ONg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nSi9cEKv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X+EWXAWA;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C98606C156
	for <devicetree.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nSi9cEKv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X+EWXAWA
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E263451CE
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421620; cv=none; b=CO5qsHGLGh3eIibAYticjx8l3gMEtQ/AXwha1Wrrx3HvmHlqXHlPPiWrG191POYRpIS0smQ3aMk8i41YseiB2/JJPziVYzhhTnjqYCd35pSPL+nY7PArvqtkKqVx5e6PIPvGu/DfVso3F0opmSTMb93OMXSU5Sxpd7jqPG5i49I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421620; c=relaxed/simple;
	bh=8QzhEza4cmQmxyVPqaeJPOjfbUX18+JD1Hl1uHqCQBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgYTn9gWAcr1p73HgyVoJYXd8lQOW/3yXGPq4hVubcqSgEVEFw+kbcOTayFJCyd3t/QrUrYkZoIzl2Vhb/lspBrJ4qcsd+ojPnN8C8lj9uWYyNkpX6HFQRDFDQZwP8WPzcS0P5rLE1tDEoggifzgIfdPsCky5aOX4G3AjFSVwlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSi9cEKv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+EWXAWA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0Khd3401253
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=; b=nSi9cEKvrnTAy8UA
	8L4nm0gcCkj7I635NL+UWzlhSkbS824yj50HkV1/ze7J4ovs/mSSkd8mexPnwtuy
	SpmxhvjIX+FOVfxcxdhOyfRgXJvy2V9WvgfNLnNiOUnDXqPiBXg1o0wZh1N19ydI
	cnwXAC68b0LzqGsC9ts81tKYdGOnt+DgHKSeROaBEMMFyA7s4llFFTLdh5KBw/XE
	M4r44Dd77on0iWUgk5O8sWBekt6aFIDYpK/JmPC8+E7nhOIFeTMQLRCQ8C+PInd4
	JfdPdltqtlDKuWv01JIh9FWFDE7fBswnRIVU94elAaoS/0mDzgOnPqH3EOInH89y
	R2W1xg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn1hm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:53:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso75461485a.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421617; x=1793026417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
        b=X+EWXAWAt2WhZMCFyaLKwZz/mHIRka4RNahGCqwCzOnbr2qxsEQ2V+25E54KmYor4T
         wUXFpDNMqXUeG4SYLI+MAk6PhmV2aJddoKVpD+D0nCQBOigLIDMPokshkldwblE8DeXH
         o+ExFvBvn8I5VZurDandZemjPOlyo+c+cVpsNqpe0g5SjF640YBwLbG+5huAIBgZHvq0
         0fuMV+5uqULgNfI54SXHOLg3ZOtmflINuL1TX3ghB9RWTXTdprfYFml0hY0bcR2VBcgV
         k1jMqi9lLg56rdgrtUMdsfttLOpEr1jNGMqzG06Lp1ynA6eFnOMMnd07jaDJwvmV95/5
         Cv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421617; x=1793026417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
        b=Vp9y2EElVYL7VXCo21NAHzyImBxCEvNLy2jgK0j1LtNhgBM5zQ04wQQ9Em73oxfJhs
         0l9UOba/QfXyKpjgA1L7Hd3xW3nE8Sck0LcfT0AhdD5y+aIE/CadEENKp2+4qGR4yDzn
         xjqqnDz7nNqESCA2WrThprdCZXjRh25qJdj6RJf8IRRU3EF4FgUhulVcbMsAhs+aOyUc
         PSdPrXWa5QXWUQJwXyO4FpSrkAIhb9MSdLAyxffFMZtXka2+MyZLroRe9CnxlRn+uJxp
         iqLjuGTCLdpHF/UKINIL48c/eF8K8bXlnHAcUZZukyEUh1ll4EOgs7qCPAYEd4mfYSqM
         k3Fw==
X-Forwarded-Encrypted: i=1; AKwUvBxgTZdP5JTCcXzr8yUikPVCk7UlD0ZWpI5RAoZ14KGJ6gNMDmE0KhM0RxSsjyydbhO4eJGrNTRI3ru6@vger.kernel.org
X-Gm-Message-State: AFq9FYLUVKmyClnzwv0kex49JRMF9RHLbSIRVBRG0TDj69BeGIjwK7sR
	AerYhMksbmoILO6AYTKb/vTbYfOfbbUffTuTsK7J9EfBEPzqZxRa+Q0eLSB95A3QDYorNkVZZ2S
	QUhWZ/R+Uo14bej0Fym5xDHCRiXQvjc+DPK0iwmoI1V3SMk46DckHBwFUcrDdTDCM
X-Gm-Gg: AYBFou30LS1v3lpQ+th71D8xsDRLSFSU2KR6wtkz1J/Zz1AWfwbXkKVHkQj7vowG2bY
	uvuuZzA9im1lTRvlh5/rIkG8RFdPthIfLejRDyRgeNCenuIwKm/FwMuEB53qfId50YgdFdw6rDe
	EMlbXkR5mnuWKbuaRgLZgW8eROSng2WDDxcYVsUr+00ZooGbpuuDgJGaW8g39HlAVqgv44Lnt0C
	TZfD7G62B4e88u5R0N5Nb+UfMiOBxNVqGVoWOv2TGaZbB5sEP7Ic3c1fPybm3/QbXnxkh0cccFl
	rFy5E4stZ6xW/BgcggLksek8D5+5vLLgOVD2dYVFlhTN6oMUP+HVZBTHbUSSeSLudTv1a8hCNY8
	WHZDQXuaOnSA1GW4zw+krrA==
X-Received: by 2002:a05:620a:4041:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f29d7ea21mr1547816285a.5.1792421616974;
        Mon, 19 Oct 2026 07:53:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f29d7ea21mr1547809985a.5.1792421616351;
        Mon, 19 Oct 2026 07:53:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb2f64sm365653366b.77.2026.10.19.07.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:35 -0700 (PDT)
Message-ID: <af21a2c1-f101-45af-8895-daad2ec3a9fd@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:32 +0200
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
Subject: Re: [PATCH v4 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-11-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-11-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXy7b2GhBbSctw
 uqOpIqnG3nEnARdIFgSEyKXYRJ1XC2wt3WMgKNConX6XhmEZaWK+8owt4pXlF4i0NukCKvsq7ow
 pCY1C70yYVTz+VxRUo78/8XYsPFc7wQ=
X-Proofpoint-GUID: amqTpLgWlhA7Tv_4dRVlNyButUNkMhQa
X-Proofpoint-ORIG-GUID: amqTpLgWlhA7Tv_4dRVlNyButUNkMhQa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX6JEPBBQ+OjKJ
 hE+sTD/YeoI1smt5yGjcadcRtXyrC2bgKkkDAxQDifckGq7JoNU0SUWF5xJCk6ga9TJGnbCdmtO
 EGUDL+LRH/TSDWz1dz74QydCJJpE+SrK0s31c7985B6yqk14MlXYM6LtmRlURS3f1HLyC7Lzb9x
 YjEtP+ttMmBMsB0/Nm01Sd/npFBonz5+Ow7K2dokAhxSyK+OwbI+D94YtcOgXnoYLHtbJPPiKdp
 ZWPNcHze9KUUOePSR/NL5KbZR1/rN/zcMwWQ92mfdpf50Y0G0RiYXTsn9ZeIS3rWcStsto3ks1D
 iR0QCqjEwazzm2y3NcXnVxZvjgqsTrSig0dVn6T2DIBYcci4HgAbcVD8n9LY2ehasgCnyc+0kgD
 bLfyY65ejkHtfPXw6s+OwFoymQNiGA/5gjpolB8JuDDSauixGwNqmIMlxVMRtx0NcUsG5Kxe7Rz
 lhzXlSWHBtujHLp7BvA==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad62ef1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_ybYkvnUm3iZRZ9voNMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
