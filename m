Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670204;
	b=MvhUBJrQG0aontRrZd7CZKhNunxMJLkQ+NCnVk5bgwZ/oAnHfc3cdS2oI2Z5MSjh7vMo
	 SZseT6prbgw8b8Mep/RLpBmd2hYzkD2hh4UggMozmNdblFpJclTicjbFvUdpm6PRI4+or
	 dpNK/d0Ts9gimfeE7Mcd9SZo7yRMvMvxGCTrz01295gNw6GP8IOBiy+0tqKoee/cq2ua0
	 K3zbPoYZED6yAgl9kwvn8nwg6wEvQyQTl8cBtc+YvtwnIFDcn8TA6eCF6zMMoXiVnkxNU
	 Rg+nwn7O637LqU1tkym00Qv89S3N4qKbhnCg+9ITbMrLRFEYLI6cp385S6vv+XGOtAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670204;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s7MlXxQ9G55dinwaY7O9f6BqoWldfOEc0cObS2IweLw=;
	b=CNswoznQJSZJg1q48d9iLmBDOMAPPSXrwnp6rYym+r1RZ/FcIF47zDfpllvdIaMlXEIg
	 F9AdlOmX/ELztQxQS0lOLd4C7UB5Z46rlWKMRHQHZbpdCv8z6cWiWA3kNSYOJ3ZIapNFu
	 BbBEcpxRcFuaCebbUKZczP9GJyFSAqrq4mo0tNyW4e7XccIir5CgOzZHIT0YOcET3pNwK
	 9TRpVNApLaDJR0i8Zq+oLfXX06VEIebLX4pqYzrINOkrsyhEWADKEzlR423B7UlqGydNS
	 fLCEOTGyOlZEgwdYfmmv6xUrMrhWRwvXhVCsxdS3g/v8ad4K7lsoAzEDyrIzfWnS8Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pKDUAsOm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IeduK5ZC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB627606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB627606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pKDUAsOm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IeduK5ZC
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MBSfWN032013
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s7MlXxQ9G55dinwaY7O9f6BqoWldfOEc0cObS2IweLw=; b=pKDUAsOmRgKfxC20
	GXpJOf14EZJHKPSU1pXxDcd+/jf7vR5eHpqgbuAWt/kmQQdKj0EAXMuRKsqBg8f/
	f8kGC5KjBGLtFCGyEJwJFjAfhSxr/qzzov1Sy5AQnz/nGBqUFdArTtu/64B23leu
	EHea0Yi7uH7ZvbZslUM4JC6jS0u7zaNJsWrx38MqYrTUJKXo/58HNnfqTLc5Mztg
	k+iOqxYICk8kUyRHDvAPzwIPnYNMa6slFIkkCYb0omTzvxoP8+LCdWSJBmy15UCJ
	y/aycmC9fI85nIHPNFwW9tDWp85Og/dQsJru8UQWnnCjNxCXQXp/EhVzCTydKLg5
	pI/2LQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93caxkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:56:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so49559585a.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 04:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792670202; x=1793275002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s7MlXxQ9G55dinwaY7O9f6BqoWldfOEc0cObS2IweLw=;
        b=IeduK5ZCNoDsqa3A1TPv3k1hxDSTlB1KRzmHlWKFXF1KlV5aK7Q8ybEbX8VdaCJDNH
         Ma2cQR4lRuaDSyB3m04kltlT5X0xyUBWagB3FcYPOXr5yLLFYXKJikIQRQX1tXox6dJ2
         BRoOOqF6cy/DoNKw/lAvLhiIQDFrqnNHs6Vd3MbdGahtjIhAY3Hw3f/ZqmTU7877AtWo
         UsUG4qDXWOwzANeZfTAYpmjFYvvnucdpZ4ksGZmffF1uPta4zuOnSLipix9ucgkjBPwy
         LEkoumMWk/uvT1UX6Ro597nRdWCZdjoicp9vOVz0Q8WWh4t/X/NQt6iuJtxAJGOjwmtE
         iJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670202; x=1793275002;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7MlXxQ9G55dinwaY7O9f6BqoWldfOEc0cObS2IweLw=;
        b=tq8MN1gNNEzBflz3Quqt/dDgbpGiIZS/mrNDLkKF4DHb5T4nLNwvsSXNn1ri4osBWU
         YD3C6qmqvZf9cD4jwUkuXv2UjL+5lzK8bIMj21xhbqcEmfSqOfcJ7jEslq/vGundJUCm
         WoJFyWmMTw+nGpAQ/2P1khcLwXAut9XRhKRwagBvkuEncYFAwmmr+EbPqOA+ygwAVkRw
         ipEojudopHLbA0K4KbIlhFigvaJJ/KGreH3Im5d6yGzkgSQT5z9mTnKPRWbAmrWQUVEK
         pSnDOUwV2C+YKnFGZOJWdk5aXgtPJxNxb1ENpP/bAWegC6T43O/QOgPjhk2jMW4MBNBp
         3r/w==
X-Forwarded-Encrypted: i=1; AKwUvBzCiG/eq+ddY+uu8owKDEoQb7HpoaV43Wfvah21xdV2V9CZnr68vm4f9tmnN7zoXERku+Tdj9vjlOrU@vger.kernel.org
X-Gm-Message-State: AFq9FYLP39NaDOsBf/2iqQbODb9BZsr4lCma0IAUxQolEWv4xC2ti45q
	cfyGV8p7SW5E+pGZB3q6R6wcoaPrRYAJjHs+Tdg1rDXz0ij6IHztSqlwWOlgw9znLB3+QGHTt3r
	oAmq7TUsuKzLXLjP8WWiLRlPrHGuAjbZyQLd8rSSNUGBcOohxUF8OLiewzNsa2rdP
X-Gm-Gg: AYBFou1UtuLYYmonTiU9/2LLhJrgJUAu7SJIJs9sZ8Y4zwbF6hTCH6Bd4ekHd2eYTWf
	WkdZ99P3qcksZShF4Ij35RgovLb4cLwgFlj3NR9xtcjKwbMLaxvruX7YbBlhX46Kvadu6nDHStC
	4DT1UMxV2CcXQuu2NlsemFMpWkXSXjBin0Cv+rMvKs+1zRNhUdW54nEQxMnK8KVd4ar4+dL28Dp
	aU14htjP9V2TZakv3G731hEcOPq2aoopv0zzE56pBSAEiGaeFMLVLteEZ3C8S87lOrtb27O1/lY
	ImxYrIRA/8his5+t4AShpu6CsFPxYK39iETE+M5tXIFA/6yb5H7kfgOe3hJ+HL1Fy+X+0cuuhD+
	NPJn7YX+gKfLRcio+3ZzR6w==
X-Received: by 2002:a05:620a:2913:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f57e5e2cdmr1061697985a.1.1792670201883;
        Thu, 22 Oct 2026 04:56:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f57e5e2cdmr1061695485a.1.1792670201402;
        Thu, 22 Oct 2026 04:56:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5dd548sm97381466b.65.2026.10.22.04.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 04:56:40 -0700 (PDT)
Message-ID: <c80eb036-f1ad-4376-b3f9-a97b685a0dca@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 13:56:32 +0200
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
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2 port
To: ShiTou Hong <redstone.dcity@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        redstonee <1516235445@qq.com>, ShiTou Hong <dc_redstone@outlook.com>
References: <20261022113601.2320940-1-dc_redstone@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022113601.2320940-1-dc_redstone@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfXyqI1Lbdf9n4l
 wT5B1eWf/YSZUKDSfmNU8RR5+hL56JkNBtzwnaj5QDK/zhlpif/+3pXZaWrBf6Md8EXsnm/X4I1
 oDu4broHOSQBY4GZsXuhXLG9RRPaxFg=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9f9fa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=dZbOZ2KzAAAA:8 a=UqCG9HQmAAAA:8 a=hwkVP9_vMjZBhFNB2jcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: gsbLCzOk00rku6eicmtRoptqOQFrfDFL
X-Proofpoint-ORIG-GUID: gsbLCzOk00rku6eicmtRoptqOQFrfDFL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX/DewhAnsgEB1
 8cAmD3DFlQudI//Qm1+1fNtVvUxDHLLEcvxMYS3Tup2FGvDzxVbvfA9NNvC2KbXxjiNQcIjTKT3
 mVrQlj41XdYZehmvYs2fhT+PrcpUhM8aFqRZyXl69mIIOh0s/POhdgCXqDsMTBzrQeWp1upFvmr
 m24MPrYJLrPK8ZRfDlSGbFAEmtzXl/dwUnVTaPcz0spyS0gpmLjiomS8aivuY9uYo382o29lyqh
 7zruRS7OyJa3XJ7m8u7YPT+nQoM8A5D7BRiTAh5s2ulWmxPK+d7sDElwcImVm4EhfwGcLLQbn0t
 p0/77/h0CeoIkH5Qf4AXH08z5pMg9jel5iYj5DNCrRhJJW0Koh1yFNHglEI2bQaCncbnLdmN2vY
 Gp/KIBS9KrGWmnWXoijP0U9B+vOlganROeG+rgHx8UIMUI8Xbz1WAMojBx1irhoxQFXF2yI+ShG
 8maJZGE4H9HNEdOEG2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220047

On 10/22/26 1:35 PM, ShiTou Hong wrote:
> From: redstonee <1516235445@qq.com>
> 
> Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
> ---

Please fix up your git identity, I'm assuming the author is you,
but we need that to be sure.

Please also write some commit messages - see

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

Konrad
