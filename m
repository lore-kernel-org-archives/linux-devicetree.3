Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169352;
	b=ISWBBSxInFsY/7WTeXWvClYyg99uV9N3q0YQ5uVJ8+U5NTLaemIlpt1KXMcasjfvCDWT
	 pa84RLgmQPIFfyZizlXvpZ9AbU/XH6casdSiks9/LMdBz6Q+9nq2LXD3VbLBPpNkyAZ/l
	 y27le6KxzJhIEEOU6oagxwqsX4T1VEXcOq8wnc+XVIZ6zueCQ2VID9LyTe5zg8I8Wlvyj
	 tF8bdCIMOMDPjOttT+ss8Ya+iEu0gy2EklbYhSxm3iWOi2XFIJy74HLyEX76aoi/hjGg9
	 p35NB0Tcf/yWycqxHVNg/ucPjtAsu6l4StCEJ4GRRofSi4l3e3OGVax6GWgvYA+4Idw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169352;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xosECkvOuZ/563n8Xxgz2gyDsJH59waH8UsNshqhV4s=;
	b=bqM0Mlx+9yxeD2dfZxrWW3XgbW8YvhT1Eux54eeliuEfN9EaYgqpKbN9xtEOYih1XDf7
	 OZVtDfA0vmBaTyVHQ4syrS+kedaPTN/S2uqpqMpFioNNRGci6kp9DD1h0kw7dhBKXSn/1
	 9JK5t8rG70r42dVBI3eeGVZ5apFZV6wWE36RBVScBtdRugEzfRq+LC1YiU4K25dJCQ/RT
	 1/Dr+G6xwS5vdea36lKmLDaoWrT6LAoglEuUuXWXqEQMZUOiGrXApbcUS85z5FeFBW/Q4
	 HjWXgOeyc9BYpj5jONrKHq82VxTFlQTr6DPLHWwOyVcM6G6PQmou77T6qOrm6y1vxvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HBV87Y8i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgXHO74m;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B63C606A331
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B63C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HBV87Y8i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgXHO74m
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fDoU3320735
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xosECkvOuZ/563n8Xxgz2gyD
	sJH59waH8UsNshqhV4s=; b=HBV87Y8iA19w95VMXvBhisXc7CBbCY/9XV5ndlQW
	5pHzxWPk2SX5g7G0UwSYAgTfAW3bm/zZKy0Auw9lpGl3tBd4NWYjH2F2EFJua1aZ
	AObNGfX9l8lktP5X+tFN9CRAeNytHQBdgHU9iSJJPDTuy7rMMJmJ0l6nVvmnC4Rc
	mLCDb5JZKJMPj9uSYHvIQWJXkEGBIzhukomEr2ShJjxTuUXi2ZdvHXoir3IJcQ8L
	K2v8EYWm4goWmnNGT8gCo0QU8j2vxEzS3bwlfW9KGlmZb1x3APQ6rLzHTDgqdH23
	60DbW/+hF69FcPkS/kyyPWrDTEKv3Gl8Qq/BPeL3Orv6UQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2frhs7ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:09:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f37c94ceeso345403485a.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795169350; x=1795774150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xosECkvOuZ/563n8Xxgz2gyDsJH59waH8UsNshqhV4s=;
        b=WgXHO74m1uR46QkdPOO9EpJbTHBWy45ZonesB4l+2OSBKpEYyVXChClj6kNIZlua9w
         1f6BGCkkXNM5zSSolEQBYw6xeBcc96tZRmUHtd/7zJciFjx+vomTWBILrTROnbIEac0v
         biR7N6kRLucVImAa9QaOJLjl52e5UdQCyb+14x1Qm5DwODIclF/fT1hEBV54AbDzzfko
         +QUXW8niMkMT6k6wnXssGDFw7yT8VZsLLRLyDrhegU28MXwSOT1j5fbmOsvpbqkt+Xm6
         U0Dnj3HmZ+lNjv8T/AtdKJXhsxiNxuhhQsvRKuV4oBniKE3m9n+qU/PiNhy+UbHEqrBL
         QybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169350; x=1795774150;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xosECkvOuZ/563n8Xxgz2gyDsJH59waH8UsNshqhV4s=;
        b=VVStL/Z2hbnwv2Z8gSxKMEmdJMmwXx8bkJe7gCTiYjTS/LCpOC6AFdAqw1FmsuNZY8
         O88eZbqmxsEkLcWQi7ugZglutEmrqux30ul7ySL+8iie8eHbIrJ4YAoUWSXZWumjEPWd
         WJe0v2gV/dVeLELvJzXZsI/fjqYKq5mG1HXkoVH9SNg30UE6vwe45nJVlQtycKMV2drf
         Kd1rgvpqQ11Ss8EGvTJjUx6qeR/TMWJ0QNukZBOwd4ForwQnMSgxTMT6sa6HJQi8GZS+
         Sukf+VTVTWcRU/554ZQekVefo6GYBvQ4Hp+vbeCVCJ9bOldAOcwgSSKQu2dZKNmUz8cD
         sCAA==
X-Forwarded-Encrypted: i=1; AL+hErFJ7/5mAfRYUlKskFr6yvxKKgHFap8yRsGZkmmlBlCjavrKDGdrmv08TjerrtC7ZlAjqil3I18AXsmq@vger.kernel.org
X-Gm-Message-State: APuU4Z/GysqSsRLTV4rFQuc35pb1FBYiXfrEU1MMVOWST36uHFHByBlv
	k5jy3lQcFF00SnB18j8LylAwpPjRGYE3LpRhSEWsFmsjI78IyF2GRbqwW31Ecqvw3dM5fDBZuwT
	hn+7uUOXkfunmBxlicTOe20eSHKYZIZpvhehoPXgComjrMgeXn0nwsO3UU0+wDb7d
X-Gm-Gg: AYBFou2JHgQtPIEBEfk7TwDFRoe2a6rT5NS5xYfDctuIQ+293FDFhhQ39jhpV6WcFVb
	sb4UITidPTjDgOzavhb9brWNkAumhb4fIEmnyeaBIV3nstao8pBt95VGXO1D03GxfsH7RGxVH0Q
	IV43hr82+YjhsmUOBjM2Y4FEXpTeFnlcryeQfdlxO6qv5XIFBlL1VWTbo42qMskqPtCW8bOK9Fk
	+yUcHGPIs6yOYRoAJk6labNKKPNUBeqLOuTW10FiW30066t2R/ZZBeDJHctrmAC+ON2BSCGP6NG
	bvD0Vj4XG2UdatwWBglptK5v9NEPECWw8AaptC2k4KzKVZltLlPON6qxgCstIPND94SY5/LHOCA
	Q+7Dhdpc3jwPXxrh66aN18eSigSG+ebK7qiVyN4Vu+M7LxY8W5ddPDT07vs3VMIi2
X-Received: by 2002:a05:620a:1a09:b0:93f:22af:ccdc with SMTP id af79cd13be357-949b340223bmr618412185a.4.1795169350031;
        Fri, 20 Nov 2026 02:09:10 -0800 (PST)
X-Received: by 2002:a05:620a:1a09:b0:93f:22af:ccdc with SMTP id af79cd13be357-949b340223bmr618408885a.4.1795169349463;
        Fri, 20 Nov 2026 02:09:09 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm4714314f8f.16.2026.11.20.02.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:09:08 -0800 (PST)
Date: Fri, 20 Nov 2026 12:09:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-shikra: Use retention for USB power
 domains
Message-ID: <yxdwoaan2qd7pwe7ueyxur4nu7zr4fjxix4blqr6qwbw3razg4@si6qol36qa5r>
References: <20261117170854.3257471-1-akash.kumar@oss.qualcomm.com>
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
In-Reply-To: <20261117170854.3257471-1-akash.kumar@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfXynF+Wu7Y324r
 EqKElqxWiK9eClfBv6/7N4rpTO/+GumIXDz3ugwgJU+WE8c6oivTRzntlH8QysVYEKhBje6Wayv
 uO57H7GpPYv3jvV1dyPgCwySlRpMiLE=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6b001c46 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qsmAfw9a2cmmedO3nsUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: gskZB2tau-harfl1Liy7_6-WYsVg7T2L
X-Proofpoint-ORIG-GUID: gskZB2tau-harfl1Liy7_6-WYsVg7T2L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX26dxPtjWIiG1
 VRYyqy14Sf8jvEhyeM09+gve2fgHIKMeqQRvvf/Y9uW7yI7Qm4Uj2GTSDaip5kSMESIoswxBkFK
 BX0dLjEopj9Z78NfrHKsAjPZeYKO1dJMnurqQIMWLNYPMZzgJ+kPlws8DcFVZoAbMTHwMZJIICA
 5Wi/NnpVnAA8i8WQDp+DGj2kSU7ijTklTbSYJKV09FysVmKWTs4GzWkPrb4T+RTyycSTf3fNkZT
 dNNYBGSJBzTvTR9rcwjmIpZtgDRS+e0k7Kxi5MxaI587yM1NzEi21Pw0shJxVg2LDnXEMwCZchU
 7SN5v6OwXfr6ENyiv6XsOA4jK9IgsYWh3HQwQJEBioidTmSHQ2ts3rZNvJhLnQVwvpyJ/gU4/dq
 y8+E/BmSzk36VhBZYHqIp9F3WQ2B13ZlGaNFTUoYUHMhDm1eZuo4fBI4amKhj8nnyYd+KYYxoqS
 Ar48i/OI7q3ZqkxheWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200040

On 26-11-17 22:38:30, Akash Kumar wrote:
> The USB subsystem does not expect to lose its state on suspend:
> 
>   xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit
>   usb usb1: root hub lost power or was reset
> 
> To maintain state during suspend, the relevant GDSCs need to stay in
> retention mode, like they do on other similar SoCs. Change the mode to
> PWRSTS_RET_ON to fix.
> 
> Fixes: 01cf3e27824d ("clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC")
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
