Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ABC42C518
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 13:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184435; cv=none; b=rKb2sYMZ9+dNUNfGlhxLATS19t14coLndJzLvFUzByFM+nnVB8Sk3M9Z/+3agSzJ5OjBPKqzvbP60AFd2EAlJOKCyTRtn5tCakqd5LwONnD/OePcxRsyt5SsYMA8oD//5ZM7JU01/5vuXyChnbHZKmg/bxaZm/5JHi16sHkJhKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184435; c=relaxed/simple;
	bh=AUqh2X9awgVdQ5KkHdaoibkAOyLtmCtEGhzRBJfqysY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=naxBW1Lf6cGui5HPLVlB2znslYd6doe+iLj+fv3FzAGo9D1+d2epnbBqiPtDV3/in/mkyoWgO7KuXdBB80dPAMB4PuBQO1Ys9+IFlX7ILl9a4jeTVxkT0zvPx31Kj+095UPuYSgkS6o8ECIkFKCjZewgxCCLLn04c518yJYBGBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C1gvb/DH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GjtjwcOo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C1gvb/DH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GjtjwcOo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBAKbw3600902
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 13:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AUqh2X9awgVdQ5KkHdaoibkAOyLtmCtEGhzRBJfqysY=; b=C1gvb/DH6TlLc1AZ
	iAepWOve9Aa2BzSBpYQW9XFNuQbQIzzOgtB2ZiHWIyY/ZKKySSR0Eiz/u0pb4BM+
	638PgobIVBl4w+kud3x+1X4kg+BFSPzu0VVMRfDGQz4PPyHo13LLLbKFdEQcNgkK
	Pgz/rG4DswvK1euBuk+EDrYdrFCUB/HRZHz98q+cxUPKwAfEVuCCWnw0RppaMUJr
	o1ioTrh9XWqoize9uODLrJmPPNI+a/hwKPh1DG4ijNeczR8lgJE7y0jB7ZRqzNzM
	KZ0WmH7S1A49B3yGLPEXovTGoIq2pzUleAvV54CnC2E29N4KiiDYX3BxPy9X4KH7
	gnbe9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6jgh6u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 13:53:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so883130085a.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 06:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788184432; x=1788789232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AUqh2X9awgVdQ5KkHdaoibkAOyLtmCtEGhzRBJfqysY=;
        b=GjtjwcOofCjoIw8dQoSPEZRp4poxvn1itKKdyfXQOWDmxnlIvWCqgog0yd76hyRZtN
         kccx9B8mphvyfD50X7hs5Jek9V0zEZi/lAg9guzvlAh378D4OsuwLBoRYWWdeC1ZjYTr
         9q/Z39WqD/L3DSYmA9wLo8PIcOQ4BfNv+8ATqxGWPzreVpg1xnhc2335ioZricVcbuiR
         TtmTbY7cmLapLo7yALi9p/rYKrLrNLTtyaV3HTzhRd7V1LiytMvfJUpb278KfR9PZoWm
         0MKIBh5jdYfQhNEz9FOIUlpqC32GFvIycSTBT+icptR15T4Ga5hNNuM5nrPKlxc6XB8o
         GwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788184432; x=1788789232;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUqh2X9awgVdQ5KkHdaoibkAOyLtmCtEGhzRBJfqysY=;
        b=p3zw3U6vM+JSTqWeUptjhFxDc56fOEhNqQX00CIQbkhmnPXXyl4gX2Auyts8Kbd9QS
         nLQ91UQGl2KG0FYJjvDVxUt2YubO8KY1rTqLqIgux/h0tyzI4jrnPhpkiv/6Ipu0Gr3K
         SUwJizl+Por+jK0gwO6Hgptr5CMLs3970Z40vPXnJi5Y2H+JFkQqxdVMff8bDknLzU65
         XN/hH9XVfuDXWqmzqwHsh88LGA7kbS3zAkyRYhO2CeoLJfFQJw/7LbqgZ0JRaCvxjlAV
         734Xi4TdXakmTWMOywqe/hMkuk0kTJ9QoTjE6W8TVq1ZVqhEs5F2j30GvO2M8Xw54c8X
         0WNw==
X-Forwarded-Encrypted: i=1; AHgh+RpVYNuiipilQwyvtNz8+Lq7STVj1tBZNrJECqHzPpLQU8Bg6JIyGvdqZBwy9xKs2T6r8WfLnN5qjwKq@vger.kernel.org
X-Gm-Message-State: AFuF++nYYJCAiEyGmMj3IHy8HEK0UIyajhviMFW8TcSlw2jCnmjQ4YTy
	xeUXy6XBvVzoAg/LRiDPcMrwzsp3NFDP4LCpt0N6bwRMbozrPRaho1GfWmt00rgDdIvhCzyDpYE
	+MfLJrQ1gvbjDSwHIZtg9gmYTBMzoQETE+epaC7TtXyUiy10Rbpr6gbfveRhZ/8PF
X-Gm-Gg: AR+sD10Ii37lVTakoswsbe0fRFTPkEAn31EfGX0a70f3jFtH6I7mLR1u4cb+qdWoy+7
	HqJ8piM/Sr7SYD1+M06yeuewgaRULTMjfGm1LNudYY1VJWZNnqpzQdQO2qVDFA9Qty/8oen604/
	1cMdvBIJ+kj2hTEIOUmD7Jd1Z+0Wa3ZCLChxbnUXDUBVANYCYiqHn9EQLRCnHkJCaBWAufe8zA6
	3Xb1nwxcZspphBUjUjC6Gqrcu+RNXB8/bBiGxSyc7IlflwLKxgDytVRRkyK0PZ++oQLWTaOdMUv
	7dyLoVlhOzAQzfD0ZGN36WVzZ6lqwPoNwoHGWJGZY93ranNedV/79GND1icwCEO6dObrE1Mipdd
	NIQfnAic9MO8aiUkm787JNBlzGl1W
X-Received: by 2002:a05:620a:19a8:b0:939:f89:3688 with SMTP id af79cd13be357-9391397dc88mr2712198785a.42.1788184432053;
        Mon, 31 Aug 2026 06:53:52 -0700 (PDT)
X-Received: by 2002:a05:620a:19a8:b0:939:f89:3688 with SMTP id af79cd13be357-9391397dc88mr2712194585a.42.1788184431596;
        Mon, 31 Aug 2026 06:53:51 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49c5a903eebsm181458645e9.4.2026.08.31.06.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 06:53:50 -0700 (PDT)
Message-ID: <4c9c442c-b1d5-45d4-9a0e-5ae7c10945e1@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 15:53:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 05/12] dt-bindings: display/msm: hdmi:
 Add Eliza HDMI TX
To: sashiko-reviews@lists.linux.dev
Cc: olteanv@gmail.com, robh@kernel.org, linux-phy@lists.infradead.org,
        neil.armstrong@linaro.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, conor+dt@kernel.org, vkoul@kernel.org
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-5-67843277de17@oss.qualcomm.com>
 <20260828141223.1BF821F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260828141223.1BF821F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -TidVfXBwnax2vLSH4aApJyF4OZ6Z6c5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyMCBTYWx0ZWRfX/L0MwqfvFZJB
 FJ1D/csllqC5f4IpAmotirbQq5iZiNUOgSlkJqnYbC56Nf493wrwsVUOVvULEaymVxTEoMOCULK
 5V5rjGkw36NRUIUQYY9fRtmbizljUOY=
X-Proofpoint-ORIG-GUID: -TidVfXBwnax2vLSH4aApJyF4OZ6Z6c5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyMCBTYWx0ZWRfX8AGqppO+C7ub
 yLDA6ZbO0zpFo/iG0Zx2cn3+qJNoNL1XMSj/sSb3WploUg4MxfWkujBqhm1XlmKOsi86kqGdoAd
 3WUaDFn178Ni1vZRW85SE7qb8t01+WVxP0VjZDCITkv7bVurrXRZkWLQWbAHQdlDeJmAGgYrB+q
 60TpowQ4/Ai9cqWZ2OfbtiZvlT+pocMr5JPlh1ymdCABFIGrQY5Hu3VnfmVc/84sUURNL2P7FVB
 7wg8zUpuRmqtgpDrwUwQRqK3p02Hie6NzB8GtGKG4n2FyrH8eYJjPNvHFBFKY3cftoXl6wQtClV
 dKYGxNgOpfLYbKuRmjE14zDcinZSj6B6/WjTZKO6nGJkpZk+g2ppyn/DnYNM/l3rHU7BE64Q1Dz
 +6bbeUcgF0H3KEC5T2VXdFjC7JEzH8Bb8FuN7V+e+pacVwCVUw4ppa4+qImvaEFy/jnazNEGvJF
 evev4htFKEDZaVsJdnw==
X-Authority-Analysis: v=2.4 cv=YsY/gYYX c=1 sm=1 tr=0 ts=6a958770 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=ryD-1BP75uk3LzTGFywA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310120

On 28/08/2026 16:12, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The conditional `if` block for the new Eliza HDMI TX device uses an incorrect compatible string with a duplicated vendor prefix ('qcom,qcom,eliza-hdmi-tx'), preventing the schema constraints from being applied.

Ack

Best regards,
Krzysztof
