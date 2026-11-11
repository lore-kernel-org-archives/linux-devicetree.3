Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421000;
	b=FEq0fOSAjs0vtVCixYsPqh/5XJVJHGN5ZEeT8Q7Mf1nU4YFCfTVh4n0Vz6Me7N6Ey6/Q
	 UeFPSsv4V/ODGeLZ6RU5qE/87yhneaCqsHR43b2cOc1Yz90Sp54sS8MmnSgodjTsmWnGD
	 IYYWnzFZ+2j68u0t+lAiHQqzornjh1YzFkUwri44h/pasmCtbJoNEiwamhXKKnE5DdBqH
	 yXVIfy3mQrDs4Usda0x86DKQK+JLWC2i/h/8RafIFlBpG0HPYAVS66kYKsItCDSJ/l9Lg
	 NfM6c67bKysoHm1XYbh+E94OGXzeoLt6iPKzyy+TPKrGziCPtrBFh+O9zoDonZZZXpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421000;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TLvjr13IKJDJEa9JzlYzaF9Ctd9oFkXJXsX5JfawbUo=;
	b=F6hn17eNwQKcCNgC5MLBfRTJyndZgj+Xgu85YpHuO9SgaxdkXoMO6RVPebuy4hJ30a3p
	 1sPRqy0vqKCLyRmVTHnIpSQOMdR5cHrzc1cnQwB/7odmPGWPw/8/zhaUA673Y9IxgmEmv
	 xTnMyjdHKFtFFXiYvKdKO9LrfZkQLIuepgduTjepg6za7Wvo4nlEYxJZHLwJnrqG90kLQ
	 IGoJ7Z6kAKSLTB0At6c9rer6AnI86w5Z3+NMOLNSjPZE4e6ygp59SV//YOZYj0M2dkH1E
	 nnrWd5gXmz/eWFYJVfkq+NB7VjERW8LmMNDydqdJCZTwUSVmlPA8YLA0ORRYFKZGQvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OOWsr2Vn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a6giKNEN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF251606A889
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF251606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OOWsr2Vn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a6giKNEN
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtYiU1014225
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TLvjr13IKJDJEa9JzlYzaF9C
	td9oFkXJXsX5JfawbUo=; b=OOWsr2VnYk++zL7ab+bpCiDSHWgjPYre8odEWsJj
	0D/jrVA8HnVJu6uTeKMEUgoR/SoiiXCzyExVur1XTLBu+S8/HsBzIZ2IZGJxKXjc
	3J1LAummLuql+ejpzrm0Mh3Wfu3CTQi5Cnz4tnAFsMHPrBivdIIgCX5aN4XF/X2F
	Msfgoe/fdaJiJ0VorMmqZkjXxqfZeFF/o40MhKpc+nw/EhMB5aV90OyojMTiS0fA
	wa7lPpLrNidjO/LhqX/pAKrGrcJUs3s8G5VXQn8ml08PpSHniHFhydHvfBAppix9
	nG8y8sS7EKIzgxhiYJpSKRkCjSJ4SWCJ4J9Mh+UBCoV0hQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjt1v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:16:38 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eae356241fso864741e0c.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420998; x=1795025798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TLvjr13IKJDJEa9JzlYzaF9Ctd9oFkXJXsX5JfawbUo=;
        b=a6giKNEN1AYUjHnB59jnC05WCcW0Sqa77IH40uWlxsVLWjFKhG8VhcRekLkACt40Ac
         5cT4QbcBQNL5ZiPLGYwoL7MTNOSgAJ6/J9R4eb1mwSdSf86cEaV4ZOvMbhiHfy+j4Cqk
         j/RNbGmqUERxlU8fnOfXnnFEinmnkWcT2qQxnsUTsXKi6NnS/7gdCNFe45g9/yzCaHW5
         XWgEEkKE1FdfemQfHQtBT7E334e68TRBy2cfMQ1A4lH2uM7Ay+9hWoFQbKGhhPAo4846
         MfE7tdnv7rZCYFdP/CK/vMWagqmgYnV6SUF/zK42YYNxjdCN9/QqNfocJrEc3sgjnnNR
         m/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420998; x=1795025798;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TLvjr13IKJDJEa9JzlYzaF9Ctd9oFkXJXsX5JfawbUo=;
        b=F5GC3T9SRaf/aN8iz2hy5WnIdlwPLRFLjCGvOQwq0vWEprhQysbw0JovX1K6BJRcjs
         XYv0K6LO5f3h+dr0OIfo13YQZbhq9Fq5PNy1ODyz5lrIUTCvh/jZl9LZ+x62hlPTgFhN
         OL5uR+OiPnY40qeJReKyHjeOYYi4zXRL1Z/pK1ugMMHPA6Fy7tifD3Zfg5c5vu1rFG1P
         o0OJ+lCfLBB2+gVwFu2tYaByPBdf3koTg0PtfDdeLpB1TxoGObMwTu9RbHVFYt3+g5JV
         AB9l2FPAHQpSFRx4Cgz1I5zDtA2Uu/E3KySCr6XzqAZU8inzxGlQQjcSA2Bxa1QFShWs
         k4Nw==
X-Forwarded-Encrypted: i=1; AL+hErFw8zpwaaKUeqRGxmQoc9SBdzxv5MrB75L+2dt4ravyrXjK/tKcyMQ8pwlx4hhJVxabmlqgWj8X5fCz@vger.kernel.org
X-Gm-Message-State: APuU4Z+mQi6GZGD2+3rtRxqiqKcjjTdHjpbm48j8LBLSElm9mQm4M9+J
	4FlkELion9FLRO4VRCF7xYj1PUpz2CnifwNm6BLp38dyTghaOtmJXnKKiUFSbwvrZvplq7LLE6M
	PoMB/J2nwXsYw/78W+LmVJyKeNUpBHqxmsmyZamAdoFO6B3eL7HciAbmNvqLcjwzQ
X-Gm-Gg: AYBFou3ZpSz3xwGrTYE+tBNJOslcG9i7+NzzJpPx6oU9dKgvngoSZWzE7veolRztfWW
	qIqtcBncH4Of9Tpxto2itAtvMrL6jfCXX2r1EvYUiSsrP7QPAxrPfTKnMYqV5qhHfvC59k4i2hJ
	mgO+MiU284vHVZTK7w/PKcVGJoC4zVvncdgOvHrJjf3sFQx2okl9J3ail9OWMRdgcWxGZkVkudX
	JCkphJzc0PBE2LhiuJiG7dQSZA/ZrU+Vxolr8Is5ULp5VjMyDbypabS7zdvVnBWfmEgJBuVe0Pt
	evBajphFJo3bJ4xZ0UIR7EJ+3nGH1jaGVQ+AdBNQLLPaAzyUMIypkifsFgC1WSFo5P5uzd/DSBT
	WqBffOUZxmLscnqdlGMP0xUvx7NdSl6r82HiNQKrUVLyPnKpAxlmqLkbd+J/BL1QiQ4BSgaIbEf
	8FAMpZ9hk2cJA6BzUDiz02eMDrWwOugkmzWFDKCV783SkdHPMPZ28qkBFGJEaYoA==
X-Received: by 2002:a05:6122:1d12:b0:5ea:bfba:f540 with SMTP id 71dfb90a1353d-5ee1c2a6763mr1196142e0c.1.1794420997985;
        Wed, 11 Nov 2026 10:16:37 -0800 (PST)
X-Received: by 2002:a05:6122:1d12:b0:5ea:bfba:f540 with SMTP id 71dfb90a1353d-5ee1c2a6763mr1196076e0c.1.1794420997470;
        Wed, 11 Nov 2026 10:16:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092053cfsm12797171fa.8.2026.11.11.10.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:16:36 -0800 (PST)
Date: Wed, 11 Nov 2026 20:16:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 3/3] dt-bindings: display/msm: Require DSI graph
 endpoint
Message-ID: <bxmfcl2naw645t643b5c5lomlruhpv73reawmxzgmzn7jvazkv@fkodaq2ga4hx>
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
 <20261111-display-msm-of-graph-v2-3-fdf8fd97f49d@oss.qualcomm.com>
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
In-Reply-To: <20261111-display-msm-of-graph-v2-3-fdf8fd97f49d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX8XIYDZhwzCg1
 9CjAVjAbVjlbwV0uvESqPzJXpvyPG/UJxJGyPQ0n+La3PJmOEjpSJNYD7hMY+5XbNUtY18YRfxk
 ZPCuQhOjv1BOEuSdUrBuDk2b0lUyjG6vL0UAOlOaQTP8BXnIqgIo52RXFOVh/Z5V21l5E/yPIoX
 c8V7QiX2ARFVHBYssQXQruDWxWfyJPN6+IbmthKapGL3AILqKTaO6hnC5nMmvB8A/6PjRuIlYLY
 cJLmIYtVs26BM/D/mD1hkyvBYAxGll5m69blZqJEjk4qbmRjpyunuqz65hdODlKnx8kZfIWhO9a
 6TBVTitvqz0yyVVBY/CFofVChRbyUyWO16NJrwNVGQpEm39Z1j7h5t6ivWXLUtOoPVZBks4z3A1
 hxWfVryraB0K+LZnQVUedGY+CUUa/k3zcinfZZjlR6Omf9Ho8fvmM1TaPOA1JSS5SAFcjkn26uz
 CgAN5JlUkH9zF0bXtag==
X-Proofpoint-ORIG-GUID: _FV9FPBLD0bqsDNOeDJs8GNoCILWcAhU
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af4b106 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lYOVpaM7r1jpJQzodxMA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: _FV9FPBLD0bqsDNOeDJs8GNoCILWcAhU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfXzJTncvJKdUBb
 IxfN047PIfg5boEWOnHw4DWQZI4jBiO3sPOmWYHMMxxsyZl88LsVlMk34D1jo6jimEd9KjiSfyo
 G3CWfvlwTdGb4v+ISxulAIDSF3tM2/0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

On Wed, Nov 11, 2026 at 06:45:02PM +0100, Krzysztof Kozlowski wrote:
> Technically, DSI controllers do not need OF graphs with endpoint to the
> panel and could rely directly on their child node (when panel is the
> child of DSI).
> 
> However Linux Qualcomm MSM DRM DSI driver never implemented such
> approach and it requires a valid graph endpoint pointing to the panel.
> If it is missing, the drivers will silently accept such DTS in
> dsi_host_parse_dt(), but later fail on dsi_host_attach() because number
> of lanes is not initialized.  The number of lanes is initialized to safe
> default only when there is a valid endpoint which is missing data-lanes.
> 
> Extend the bindings to validate existing DTS to match expected ABI.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Please apply after Qualcomm Soc takes DTS changes to next.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
