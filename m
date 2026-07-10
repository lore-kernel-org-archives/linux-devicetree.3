Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1663F3F8245
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677000; cv=none; b=RwXK9qzC8qVte+c/5S89BDfG9QxfpkhD3WkVhy1t6GLtZaUst71WyYF2EL5jZYKVXar09//Cs5SjRNT4Gw3rE4doNFYXQTU9naReX9v0t+v64V6SBcDMfRr2Z6jSZJjk8W3AyjVqNBBk6nmAmDGUDkH8uMlrG6MRytmMZhGhLgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677000; c=relaxed/simple;
	bh=RhxJbcpXgBSaUpK/h1HSni04pNwZDP8EkgCuXeGlEIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LMG24e8raKPev2B46/PT5tHzoztGeiU0gGUMXbOdfwGNOmua1I1S9SxRIDyHR+rUZUW+Cx0/RPVnAckEHlY2Q36s37RbyWky7Va9mS+FAI0+2L6Y4xm3cyTkZMwyv07yy26vLA+dHFvTaKfhxEWT3yP4oichf2rHjpfiMN0HOPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EzljRyu9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFJNpLHB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EzljRyu9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFJNpLHB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dIGk172012
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ACdAIoPvTw7MJeEGWQ5gQrAGBBm4PKCR94WLrVheI3E=; b=EzljRyu9CKZgoWSZ
	9zKxxekBkvBCOONa3+P1NI0uyR8++doKqAeNC5kNco7k9ru0twSsNkhxUf2bjcKx
	zkJrdfwnuzvJEUxjnqRg+40VsEOMTJ5fbkGcba6Hxmv/4z8k9/iGxV18bZhuvh8X
	AfAiFcxzZZxG/QroPJPIgERYD4Pp2WR2fAIlr0iyEbu7SQaYdma3RxJWyV6CASfj
	9SH50yrTlETaFgnrz8fKsWbhO72bdBclhUWk4nijCHdMyMj1pagwu+42CsfO4hWl
	VXK/oBhAthqIRb8bjKO1it9KBfxtawLUD9ImCEjIbvWV1ywseMqi+YSicvvx3+FB
	/ihVUg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanwe9wbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:49:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e8e83314abso2722796d6.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783676997; x=1784281797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACdAIoPvTw7MJeEGWQ5gQrAGBBm4PKCR94WLrVheI3E=;
        b=SFJNpLHBMiig3eTZxuZ4TqkX1WAEkkthXAGzDFMjpaKUCxvm3gYauF2wa+DK3HFYPr
         DDN7KzxcsxR/TQ2IolKiUGwu187rwtPObXEfG3KXSC4k2avXkjFktmIr0ng88KsIeIIn
         qAywFRT317M6f4ko0ZzfnQiTd1zntDJufgp+KRewhxr3NmGoW0RcgdJwuo7eRhnYhaVp
         C8LVey+1UJWvaxgNNHyZ1GbOwdFJc7z91qfB2Ugq0cCIYsz1gQNUJhESnXOrvy24HkPF
         ii7xB2yNap9RynjW+NrCF+rPiDHo6ekGw7MO+Sk0c++SWE+xJFModAaVrOTNHfaZk8lc
         PqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783676997; x=1784281797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACdAIoPvTw7MJeEGWQ5gQrAGBBm4PKCR94WLrVheI3E=;
        b=j4BCEgLl/RP+b/gKl2DK+bxIpJIKNpsr2BB7dGpxJEd6cIT1/rZTUHHjc8/JPf3Vgu
         oTkUMREt5nxvXretpq3RDG61Mesa28+om3O+Dp6q97M90acQxKAps8DaCl7wNUJ/9C5h
         avfRem8h3DtGUnwkZbmHL1xY/5eUU2hOcF9U2Pg3nsgfeo90sps0bSf/mackQwehTqxm
         Dy+oohJ3t8Yxtm1sveeqMr2npDn3sZQqzuF+avBmgH2xrV+LP08iHRDTg2b3kx1i6V1C
         eF4BwWzQdhmvVf1HjZhcWxTGIpGNSvqqsZJBJCoZtVLkURpyG4GB638SqTezJ0y391Of
         k5ow==
X-Forwarded-Encrypted: i=1; AHgh+RoPCVd3lheHk/2FKslc1bDFMmKmhcc7A3P6L3+N5BiuPmvTKtIjTHcm22VdJjfy1nR2hrXa62F7vAqY@vger.kernel.org
X-Gm-Message-State: AOJu0YyBFlCWgtJJ/jwVlOOLigBPmtOV5o+iSOSpBE8cFbh+zbbZpvpY
	x0qLqroOHG8aEeeYWTiKq+In6pPeUBmD4hqLNjT8NKQDZLKAKlhlo1NB6WDfBWsHeRGgqXwx08F
	HpCtzt2+ZQmaQ/BDGt3WAHEbWiX/S0gi/3/vqOzUBU04426jH2eqCv3nbpwquJplp
X-Gm-Gg: AfdE7cmllxZBL6obp2ISyFVgChtYyq5RWegNKflIDZpQAKsgcxcnKU0H5oQDMdeKmTl
	CjOtU7zFE900wH7E6RdXIyLjQeGV9akuX965QC4hTlKfnFB424o1hCxRXliVi6HLQj2oX/fK2HZ
	2XOSkta3LmD5cslwoVEuKefFJNb9HeFMi1t95nC6WuP9MV4LpunkHK3l4Wl+8QfrrrB39oP1YDd
	6mlXTqNAIAcDqQMv0WjVOC8XMgpWKQeD5L9VjkEdhg1ecTffyDDAB9ZII+NYbjCY+91Z1ZxrlDW
	nuq1ZOXVNdlZA1XQ51b5+FYnDicXVVmmJSSu30mFSgp/9eJUEcIOEvDc6RnhnQJ2PAKQoF3AXvX
	cIqCW6C5x/u+7yyzvuw1Bg+xII4feH9qtlPY=
X-Received: by 2002:a05:6214:27c6:b0:8fd:c3a0:3276 with SMTP id 6a1803df08f44-8fec8afd64bmr91167866d6.10.1783676997315;
        Fri, 10 Jul 2026 02:49:57 -0700 (PDT)
X-Received: by 2002:a05:6214:27c6:b0:8fd:c3a0:3276 with SMTP id 6a1803df08f44-8fec8afd64bmr91167556d6.10.1783676996924;
        Fri, 10 Jul 2026 02:49:56 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4b4fsm10518512a12.10.2026.07.10.02.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:49:55 -0700 (PDT)
Message-ID: <298bd947-6957-4a04-afb3-a6394f05a506@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:49:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] arm64: dts: qcom: kaanapali: bind traceNoC on the
 platform bus
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <20260710-fix-tracenoc-probe-issue-v6-3-41eb36fef8d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-3-41eb36fef8d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a50c046 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gkVCdKvAZl3yu2NoW_gA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NiBTYWx0ZWRfX7MPp4m9pZx5r
 PdJN4uvY6X+f/ul8k3xGEZj+p2MtmCuXTbOzb7AJ36ATFckRsi/vLhXIGOgBLLsxiCT4donfKDn
 1cJfTNvkP2kCCXsEhaeDHvDK115EFcjHE0ot8xlJ33yBn0PtQTXAFoXx78H2C1mpBfOBF5LLZNg
 uJ1qBA59r/zToDUEjDK9xSdw1sXqO36XX2DJ8xnqKBJPwou/CeTEuw6LU1EsouZ2fpwHGzt/tx5
 bxuJqzhipAUcXJhcNklKLCYz33TnpokXw/bdarzhxZd7imAvuYtfj99Gy7ZqcV3h+zI4QYQwwpy
 fhkRXXzsxJNbHz2yKgpFvES/QPPWQRAJr2xLJ16AkVHViC68K4/L6VdlcDQ5gZvUmVvJzLg3Mi3
 SifngksfyL1zApKn8WwAYDsIZ7v7wCVlCECdZJnGhTToNudv0zekBWzLu5Tng/MywYifDmWXZyQ
 HgTMqHAPPZRsFqTZBsg==
X-Proofpoint-ORIG-GUID: N_1WQaViV8GTjPvX0WkMZFSptTcOUaom
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NiBTYWx0ZWRfX1WoGN/GO+siQ
 7fCB/wYhu/neeDSnnqabcjIZS6+DVjFk2iUnuwTRMfwfNBGEpP2189Lbdeo0Ufh0qQcmxemmQhe
 VlaSvHJ+6eaUF85ymArUz+zUzY9qmTo=
X-Proofpoint-GUID: N_1WQaViV8GTjPvX0WkMZFSptTcOUaom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100096

On 7/10/26 4:39 AM, Jie Gan wrote:
> The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
> compatible, which places the device on the AMBA bus. To bind an AMBA
> device, the bus reads the peripheral and component ID registers (PID/CID)
> at the top of the device's register block and matches them against the
> primecell ID. The traceNoC exposes the CID registers, but the Component ID
> value returned by the hardware is 0x00000000 instead of a valid AMBA
> Component ID, so the match never succeeds, the AMBA probe fails, and the
> device is left stuck in deferred probe indefinitely.
> 
> Drop the "arm,primecell" entry and use the standalone "qcom,coresight-tnoc"
> compatible, which binds via the platform driver by compatible string and
> does not rely on the component ID register at all. This lets the device
> probe on hardware that does not return a valid CID, while remaining an
> Aggregator TNOC that retains ATID functionality.
> 
> Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
