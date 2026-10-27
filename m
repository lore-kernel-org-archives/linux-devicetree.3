Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094577;
	b=zbAZVonNxL8Na/gl/D81QOFByaEyUj9EatJGVJJr0/nf4yRP6w+UoWEIgpyvA2KAkyuG
	 YpovkMii59e4fn4ixaaG1w2INoO7KffCGcz45Y+DglqPleMxJP3rdyPKN0Zz6kZzF1/iP
	 dZZ7OtiuCLyWbc1zGqkETiYvz5afouYXPJGuZeRil9mxZhU7296LcBzflOMSmONuKJQV9
	 ugNibfxWGs97pYj/D4Y8vZKtAWtFH/L0HQzcLQYtxMC/22+z7g4XU1wnrx6Q66kLYslnR
	 E/43QqwdHvHfZqcxM6qqmwoJDWV5CmD9LsH9KYOGpKAbddjAvoyLYibK0DE90Rzad7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jt/QmsAqJV1uP8PozVMgbYsAMzltv04Ri/WJZgPNi+4=;
	b=RMgKGHMuW+Aii/JhhGhqK2Ia1rWFaIdUkWnkHlp45MZaVqY/ODzzhmuoflWrEztPTnMa
	 nNzfjScQ6eXdt+qfZgluurtHHsEh7tXdTuurLPHGeouYMFyMD2QvL5W1ppVQitK2lyP9W
	 Ro9lAGQNFTiwYv729a7yNqf4XDLgK79O91FH2inQ74V3dGh+v1JWlN40Hfy+E/QiFo2/B
	 FgSAPcuk4q23CsDoU0Y/ox8pKCpR0IGSVaY21J+rKMSRdU315M2tB2yKf1S8ttUcdnicU
	 CuMtCA8jxMONoACGZT7zoT2lf3e0+qZTuNraJ/iLH2rlYeMutJxHzJfEo5sOqEATtxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FP0sJ7tE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hl6NNdQy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD11606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 09:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DD11606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FP0sJ7tE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hl6NNdQy
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8g6kh2761018
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 09:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jt/QmsAqJV1uP8PozVMgbYsAMzltv04Ri/WJZgPNi+4=; b=FP0sJ7tE4x9HyrGl
	jFkxQXdqYiFLQzzSGStG49wobrGZ7NF1p3Aba6esfC4PTOoKrQSeksTrz8pogcUc
	MToInCj7y3yt7Xe8gYyPSBJKbII2eGYiaG69direbwkZWcdtSJvXYsRvw6J1Intd
	87Buv7yDvfQnwlU6zi1sEo56b918cTiEvsRu5fI5p8/w2J3OV8Bqa8miV/LQWYad
	LyuLM+zow5AupnviLSNuBIBLHv5IVh+7YamG0+d3wai3hpZbWCCcyMAP/LLkHDpJ
	HLXwMcfsoFBUv5KZMZFNEgCNdJgRTq/lxY+kaeKXDkZCrME9qWfcF8R+gj3MRhGl
	rOWZGA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh919u4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 09:49:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a05c820ecbso5780860b3a.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 02:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793094575; x=1793699375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jt/QmsAqJV1uP8PozVMgbYsAMzltv04Ri/WJZgPNi+4=;
        b=Hl6NNdQyuH31wKXzChGGoe4LJOAFWnl88VpMkQE6yB1fNU+UZk+choE7EhbjIL3VO2
         cwRI2gE354XDtJBbspbOdbe+xZ/Lox/8Dxwg/kOhvoNnxcW+KqS/pr1OZZN1xHXDDuZr
         YJgZpGMM8Fc+5OoRGfWuISeX3DsqHTJi2XdM8nCJV7lpjyPibXrKLCmg1ZBQfdkujO2P
         mXof4GFBMYTLwb7jyJuGSsgkuTxf1MkQP3kI4iiu4DKhq88D5RGyKttsjMTZoh0j4f5h
         I86rTFbqfwNreZWFUT/kDcQ9rRpyAiFmntZNOZMa/PuK8DtmxO7NrYU+oedckilAo8I8
         vHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094575; x=1793699375;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jt/QmsAqJV1uP8PozVMgbYsAMzltv04Ri/WJZgPNi+4=;
        b=L8iV3s3lblPQML/T2SJNeVdC0P0gUNkgQexLs3S10YgxNeIaYcLA2mcm1vc2wnsc+q
         1HyPa4VrcrOMe22DQs5SKI4p5mNuOtMwW8xhJPuieqh+0COPUYhELQvNqw3cuqJ9mvtk
         AknLKvQnNqvgU7KDq/Np601Z3byeORcfI5GDy4ZAICH+Vq1jbiHyjM0uI2QGV79RrSsx
         Jsmi9lYq5J4OJH7wjQGKwbe6YsiCqM8pta3R/h9XvfodVPt0o26MJrRwGvR1jwob/gYr
         XlP6RNqK/QfAQfafxINjoPV+BJJSRuypHg9W+pQD99X3Wv9aA17D6aLn8ipqGUAqMnh9
         T5aw==
X-Forwarded-Encrypted: i=1; AKwUvBypTganXwCpXe0L70yWoN8V9rjb2B0EeQPJssWRTs0hNJZ6fE5g8Q29iDinznEoX6BNDiAIUhQng7E3@vger.kernel.org
X-Gm-Message-State: AFq9FYL+/pxhIa7W+DfjCf7rqQJ42MW1B/w3k/aGVTcL52PLvujGVon5
	fCE4hztP7zCa9umcNsvemlIXQRnG0bOHw4ixZ0vjYO2GsTZZWR3aJ/g8slFrYFdfCRwmq79Vgp9
	O2udSXsgHLI5Uj5n5++EO2J9sY5z6qX1Y/WJWMcNTRy41s3U2sB0QJk/5q6KG+zVi
X-Gm-Gg: AYBFou07YPZC9C/BUS6nZSleS2SbIKAt7k6XHLYPytE2Q6W7Nzqf3C/8/ISzUVZ4Fb8
	cPhoPuy0P1X3mLw18j9DevZTLKjckZh98kwlOF4k8y4lbISPI34bU2WfZLXWE1boBHmEYhETGw+
	w4P8/loEpNdtW1DlWRzCnl8wBW65EmhRHoPKzDlEq3O7B1/A2W43z5P3RkQFS0p+zAs8mh9gBP6
	hFq3smM/VgmQ4TwJSo+tD7rXtFysh6weQbSxD9MdfYYvexdtm495xx+yH3LITqdOLHA/g0NsuBL
	0qV6v4MsldCu6SNNpmCCnMcWAKkWr8fKeV+Agg+jiAUuMgbvzw389COhbt4hhGtEHvDu0o2aGGI
	mW7Y3qTrLgVYtrDBqcXyijk4Qd0HqDOrea/mos8jyZDl6yshJ4CrUeQfgUKAuue5EljuEct774f
	E=
X-Received: by 2002:a05:6a00:1382:b0:870:c2db:da2c with SMTP id d2e1a72fcca58-8a366f6724bmr7261011b3a.25.1793094575098;
        Tue, 27 Oct 2026 02:49:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:1382:b0:870:c2db:da2c with SMTP id d2e1a72fcca58-8a366f6724bmr7261001b3a.25.1793094574626;
        Tue, 27 Oct 2026 02:49:34 -0700 (PDT)
Received: from [10.217.216.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c0fdfefsm2076232b3a.50.2026.10.27.02.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:49:34 -0700 (PDT)
Message-ID: <b63a7285-88cd-431c-9d66-98abd3ecad3c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:19:26 +0530
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
Subject: Re: [PATCH v2 3/3] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-3-fa4364e087ef@oss.qualcomm.com>
 <7a6ef006-cb76-4e4b-bd31-886af708b375@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <7a6ef006-cb76-4e4b-bd31-886af708b375@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: i-1nxlZztc4Ydmg-mFgdsoDEfjfwdpDK
X-Proofpoint-GUID: i-1nxlZztc4Ydmg-mFgdsoDEfjfwdpDK
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae073af cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=EDPTx0FvkmN4Oe4_Fv4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzOSBTYWx0ZWRfX0XF9JhVaNA/f
 j4gyiWwvINIej6eA2lXiSlPSUYFbiw2yEBrPEzooFgNBx6XyOKIWRu+yVVctQ4HY3z6YqRIS6VS
 P576S96PUAsF204NFp4XfDFu9tnCS4yNfdQtXkj9llHJryIKuPv0RrzKB8HW+r3lOoztB6CDq6E
 04vk905kC4nzC00MoRjJWe1UAKCT6q/gy6g8cpZpkkr6RcTwLiAXqZ4RZhGWMSlKCA8lCw08JUI
 8nW1o9zRpOxeKlHpP6mhGDSeZIH/BHmCCPeB45A1c9R+6jM0qMfRX2qzcAwJ5WxSK4i2P2SrxAj
 NlmOIjjLWxGY9qjElQHhPlSeM09tVi8zyyerJeyp8HbFPVrKDwkGuKJ/1EQ9yfEm3rEIhsksDWX
 cGIBjmMIwCSOqQcpIQJiHyqcYvswHiaBuxTYFtOjE2l/w1uMzsv73iDks00RMpCucMwIhuebJJC
 F6AKuMx4JMqn6wxSjyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzOSBTYWx0ZWRfX8PtVARf/Wf3E
 z5YVKl6GypdEFNgTB2Li8uXzZxOBFb8yQ4pHjzWGcKSqQUoSPH561sXFObCHW5G4Y8ZbIFDIBFE
 ZRWQVyoKhNteLcrPURiSL+exMbf3xPQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270039



On 10/15/2026 7:51 PM, Konrad Dybcio wrote:
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> [...]
> 
>> +	/*
>> +	 * Configure cdiv 20 for core aud and 11 for core ahb clks of DPRX CC
>> +	 */
> Nit: this fits in a /* single-line comment */
> 
>> +	regmap_write(regmap, dprx_1_dprx_cc_core_aud_div_clk_src.reg, 0x13);
>> +	regmap_write(regmap, dprx_1_dprx_cc_core_ahb_div_clk_src.reg, 0x0A);
> Hex should be lowercase, but preferably please define some sort of a bitfield
> that this value is written into and run regmap_update_bits()
> 
> You should also set `.use_rpm = true`

Will fix in the next patch.

-- 
Thanks,
Taniya Das

