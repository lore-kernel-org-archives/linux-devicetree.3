Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660054;
	b=BKuVxWDoSilsnfS15j6SgMRU0Ea4WY2rdrUS7jHo+QNAClcP879JbgweJP/+D34BAcZE
	 akn2FjMnvCtRX4jpwsT7JcrZfb0yjyimxtDecZyiq4ENPaYM95wrRizfAJYECRLMAPyfP
	 GqzRfFMNZqf1FQgbAi/RQLTTImgzR5gbBDTw5aEapB6wIdPZy7Z+eT93ojnrqKXAX6lz9
	 Abbune5G4oMdRDVhcbrsAmj+7LA7BYiRSux4FAOVxMzUbuO/X+TO65UHVa0VtdxpcCg6w
	 Ozjr72/XEoiD3CQOEglL0iExBqk6EeU89FkC5gCyr2kxfyn5fuYS++RiTKD6+mPbgQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660054;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T9mZuQQYoWWsPIv3lgJNtkF+nm2oQ1HULJ9PRpgeEvM=;
	b=zBvazDOfgGnRK7mKDaUfwA2q+YDE6jRUgJTFmF16XBBSO3TH2xGZO1Eu7laWDOXmd/DF
	 f4QRvxIIZSDpDt3VCsdDT66PSk0kRtYbSOKb3SrGBnh9sCucDxCFM4sgQHB6SvE2T1kcb
	 hlgS7PxcFdgA/55gvmviktw0+362Gi6rwpy2+13jbZ+++KiI5bqob1KhnFUtzi9fBi088
	 FRTgFbLBh+Ww5ZF44GeWiMKHqynJ/r6PQxfgQA9zp10qlWV8WYs8IqLbCw2tFXYx81CSB
	 0zSI9TwKlRJGDp1atUUVRbU0RuLqiGtyAZsp6gIVEM0B8ywhaur9Kj+5/Nn4R/vDbeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M586mBLx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LfhM2e6R;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AC5606A328
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2AC5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M586mBLx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LfhM2e6R
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xxlA3076283
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9mZuQQYoWWsPIv3lgJNtkF+nm2oQ1HULJ9PRpgeEvM=; b=M586mBLx+FD4X+tG
	R2Mk1TD2JkV2EZL8yi89fwMORGIse03JH2vFQSH9fImFtbxrK1C4QJDwi8c7EW7z
	HkKrxUS/8pFuTFkbNYrBO7PTzp1TJFJqN85FeTZVtkLBr8r4OCyAwIPSz6sahtEm
	KK5qXqiGl5dE0Voj0KEydZ5cVu/D+FUa8o2toyysfRgvw7Ma8HpH7q4oQYFQoRxC
	zR7m4j/DMD+wGONv4fxhG7KJlDpnG08roqKcj4ZDhUZiMWCHbtmGxf966hYrUGwl
	pQ/S8ITwYeRR/1CzVPPPk5LtucaHCebknQr2I2QgKLKapzQx6ACNEnR8GggRm8mu
	lduQGg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a1krb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:07:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3960dca5so48855585a.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660052; x=1793264852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9mZuQQYoWWsPIv3lgJNtkF+nm2oQ1HULJ9PRpgeEvM=;
        b=LfhM2e6RtHdQ0f+DWGwJRSFel2MsfAdRpUu0ZzFipI2hKsOfTXGcV5fUy6ZFlwnhjb
         F/DqiZ7bpJm41DiVto9Wm0gkZ6vZEwiVJQECQxob1BVqA5Lr334hkGd//OQcJpbP7x1+
         aS+eY7LWk1Yd5Ai5jjdIDClLlb51XWShMTa1lOuD/8JfnDijykR35/rgIkA9Re2/0KY4
         CsL/VABoP/ac8skzcSNmjwVCXuphy1noGZfEgUw7ILEejxuEgaMR3NFF7RwuDLTl7Z2m
         fwainCJXQjbYY26ujCbRjQStJ01el830G+SbW2tkxXVNznqvcQgSVcf2lB+0r8EoEP8U
         KktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660052; x=1793264852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9mZuQQYoWWsPIv3lgJNtkF+nm2oQ1HULJ9PRpgeEvM=;
        b=buQL4OAdGHqhQfC+rMKGyENCiYK7YKHGOHd4XgQA7vYrR7HoMZ+qKfXt5vHOH00Y/5
         6WgY9irk8nbbBPCGcvYCalcLtFo7sRXbzWl48qPEQkbi0cxZSWP1dBmQ1uHwERPD5LhI
         Cn/VEOV33Rht89L2gwta49xkCTrk+wDEb3R7pl4qEDenSmGPtRiYn04OXNI3xvgP4euH
         8oY5bEgrJhKCWo9QTRMrY8nEQSFpHE3AqymHmvIxg8DDoz6KE4p8oR4txshFt4m86sEt
         oKlkl6h2xWJNz0TnUHVuYQtl6wpsvyVQfSPo/vcDmYSOOJEgDTUCDSx0mxmvyTQ2+VA0
         Sxsw==
X-Forwarded-Encrypted: i=1; AKwUvBzGjH7zcwVv3wQqF21Z66IFPgjJ51rcAfZzj3wPNwCclnlOlP9JYhpr6af4Rv2PH4DYsvsRm3HJsW6F@vger.kernel.org
X-Gm-Message-State: AFq9FYIFYZ94IerEXbFJdZoQzhfs+FxUAxGtMvvf7MJLsnEEKey7TkrE
	NlyLveS7n5E4g1WyCO22Zhdvb49MD1Ot1vZWzj8BM5MoopdhYuR84FlSogYac7xrAryL7subr0j
	wlYoLFnYD+CJRajARfGcizsvl3KnCO0sjo4ijzayXDxIQZYqeQ7dIzXoyA3EQBWOm
X-Gm-Gg: AYBFou2PWR2XoZ0K5Hms1BMrGARawgUaLQMAcbcFYgLSsofA0vewbYuIGLw5/QiCoeV
	BYIcP9r6HqDaC9KhXUsdfTkS2Gi3gBbvYt2Xn1dDscMcqiyOF+6yjKVZmhHUKPrdgi8AQS4sQm6
	vtQ5cmn+RCwFCJHXwz788X1vvqus9/l8Rozkld8bEgoWjl7luuQ3wG4KNOxEUywFjzKDy42kSUH
	W7Gb6pnKvHMv4G914sGyA9L0JddHSL+V1UHPljPRVo16CTEof1fcInl1mvKBS++/8hM4DkLTn3q
	m2JoXDnA/eBdiMIEwV0/X9DRaHjMl+WRyMsT6b17RCHIRZuZ4wCXBdDQ3RZhdA+cgSvnq102yVP
	gcPWDKIhzICLswvHN7FcF/A==
X-Received: by 2002:a05:620a:450e:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f57faf861mr1017574585a.4.1792660052310;
        Thu, 22 Oct 2026 02:07:32 -0700 (PDT)
X-Received: by 2002:a05:620a:450e:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f57faf861mr1017570185a.4.1792660051883;
        Thu, 22 Oct 2026 02:07:31 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55ffb2sm81973866b.38.2026.10.22.02.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:07:31 -0700 (PDT)
Message-ID: <aa18ce17-4169-4f3e-8e25-c088c69db0c5@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:07:27 +0200
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
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: add device tree for SDM845-HDK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
 <20261019-sdm845-hdk-v5-4-4aa7e22cd0ed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-sdm845-hdk-v5-4-4aa7e22cd0ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX+hy9RCMNfRxN
 nUaAmR6L9v4Jqdub9WgTf0fbT5lCKpvvyKBJxTqDvrJOqUU7gnc5I9rdvEGNChQJ3ovcVEwl3Qd
 xmtwXEz6thUJ1J+IW4ML+YlGG4zPA1IBksrvtomy4Oqp+h0QuOnAtv893PInA60fKxnwv0beHL0
 Tu2JFUJjA1FoU42POgB3+2ldbaImoTZO3RmzmgWXrpO87lBlpS1IKv+Qp0Igtw90puDURsqSdFY
 GVJCgfhrrnu6EDW4nvQSH++dMspQub1s4b9wd8p5ekEKwenExDK2GWEXYcL4O05SGdPJJEamP1L
 1mY42UPAWSIsWMPRgGKI88zg6e9ZA8hd7jKtSuqmEnOOqls3sHFqltWc8oZ3gKkWz9b6Kbb916z
 dh9Qb4FcY/PNZAHc2Wgmvp7OaIfZya4OZ4++EdoqrJH5YI/fPrKeoiz5VkaQCPD8tgzM02LgAYR
 qt26G1qs8gjJZYAyS1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX3LboQTLEZ5Wt
 ocUA2yztPWnallMc1Tu9fPED6SG1XdC7EqVtTP0B/UFc8bc8uHOS18b2oxEZHa4L0z2Y1cnqVYR
 B3E2A9060YWZfRlB258cKoBvcGJbXws=
X-Proofpoint-GUID: Y0TxMg_6lDp4-axSoIAtEkFBgTvhggH_
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ad9d255 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YDUdIes_syoG-XcJBr4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Y0TxMg_6lDp4-axSoIAtEkFBgTvhggH_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

On 10/19/26 11:18 AM, Dmitry Baryshkov wrote:
> Add device tree for the Qualcomm / Lantronix SDM845 HDK. It is the
> development platform using the modem-less (SDA845) SoC, optional onboard
> DSI panel and a rich set of connectors.
> 
> Working:
> - HDMI display
> - uSD, UFS, USB
> - DSPs, WiFi, BT
> - Buttons, LEDs
> 
> Not working or not tested:
> - DisplayPort - TCPM not supported for this PMIC
> - WiGig - requires power sequencing driver, doesn't work with the
>   current in-kernel driver
> - Audio
> - FingerPrint
> - USIM
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
