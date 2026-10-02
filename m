Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0403531E84B
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 17:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961459; cv=none; b=MZnRJgdlbHI/Gn5bvfEjZjMledE5SWOf2PjXkhA0AcDPK9S0/xmxzIoXyj3gqIcXRVNyrxahf+Vl6cd7OV6R7NKGRgA6E+IJ/XyU+B3HclDMfc2ATIk0sD723mw5swAXXJfnryft1SHCz6AdhP1nO5r6nM3iff2qs8/I6XEEuyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961459; c=relaxed/simple;
	bh=cOSITwGmcb3cfSGmr/b7iRLqk+4E6R+342jJ/eURH24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lr+cUngwSEnPTWI1vmjHSjNlujlYBoTqbGsxga4SjsapGdyi/EjMot+aGOqwFRwfQe7cFLFBOJFP3H4QPWaTXUVI4UqXsf72FdfxTX8jlfKwdnCEXtFWQ0oQldU5L95UeYAqtSnb6o/Lr8sIGclQa8nGuay1F96vSlKImvW/zNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LeyvJ7f7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6laGOy6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LeyvJ7f7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6laGOy6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H6X4v2357642
	for <devicetree@vger.kernel.org>; Fri, 2 Oct 2026 17:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NRmhMk1rJiR28ILluI4xyd5yZQyPwKu1cAuARHSO7IA=; b=LeyvJ7f7HWN0nxoi
	VfuPp1B5rlbqdq0LoaDpuDaHbvUmBwfq89IPBS2DFQcDK+/C9PtFDDVmmac/Duri
	0wa5FzkmB6Hn0nBNXJn4LG8NSalOejtpKKEGrT0Rd/tSMSzNBRbjug/DwoO3dPcW
	wscWeTJoKLsXpsxn+hG/79IfDoE5jIm+kk6dQ3dTTxIZq0UHQ3NTSAVaoHQKKp5K
	eVw5OGOqHIKB4b8kZ+wz1koDndZIMKVLGgO2IKLhxO7z0kJ0uFJ5oQJdommxer8h
	BUYdX3Zggpq7d6+GeMLDejLZ+D5H66nCqbP7TYNRSVkOyVGpNJk87kEnW3LDmLDZ
	EUcFug==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20sh3dv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 17:17:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso4093295a91.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 10:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790961452; x=1791566252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRmhMk1rJiR28ILluI4xyd5yZQyPwKu1cAuARHSO7IA=;
        b=F6laGOy6aI+NVxOsTnVAh/dyMVRc1Ml//c2eRI7NZfwgR2YLuReNgaq15Naj93RKjI
         wt4YZ1uq/EtYFV7ORp9rxADaC4LaoGXm7bA76QlTy5YVM/O1WiUyxvDFkRHd9ICWVxpx
         nhqw0/pKapAP6pMjQ1W+H7sPKnJJp13y2bTr0eMPUspUeNJXs+YpeReVstZ1RR4Ad5BA
         ZGoJckjo7CFDg103Wu/9v1ZLpDIZNTecYClamGPcaZgA2iys5Pal15jX6xlhc7ZhhJJW
         01EZgv23g6F4mswyTb8H/KARIZkIaBPvSFdy0bvL/6W5zpqZgMc+96qv/JrgT1BdYLID
         U3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961452; x=1791566252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRmhMk1rJiR28ILluI4xyd5yZQyPwKu1cAuARHSO7IA=;
        b=NuhhCd7TU2stewzx6d9MA5cil8lecGa7XiwqsmRfqb4og2IgrzvY0VOCzVY7JXc9e1
         eY9mtj954bAZ7wznEDdlKzxnw5/U0wWDMi+QbW6wLGkA9Wj0+EiQn2NlQ/A/X36zTQel
         0ImiJbHsd7e115bwgHLBRYjm+2WwxOgkFzFQ4Hwy8bDmqMfFfbKs/3YW/v+mVUYn3kDE
         vk+cCEx4+BF5o5ZJtPv5nlxfxE3iuXiD9S4YqS6LnQgoP+temTdto/0MkyUbgYBEVYUA
         v9tDukw+gJOKVZlKDtIH2fQ4FeVQSobYkEZ1VYJIS9grLG7zh7/8RMrB16HPjgy4o1Xm
         tn4g==
X-Forwarded-Encrypted: i=1; AKwUvBzOrsjGR+bFXIymCk6IyxexOngWNSRRGhDXJiG3EvCb2bj2yPxePj26y3HVwvd3Z6U21e+0Fibh8x1u@vger.kernel.org
X-Gm-Message-State: AFq9FYIZOQpTXHom2B90kGY6bIIFnBkbcxJGABD9N7kVQfFP+87erIJQ
	x8oIXe1cEz00hA7W5i90ODlB9af2yHD+z4SxNL0ji/hs6ZZud0oBtZO5AMsDTG0Az6Kbou7FxYe
	IF/PBbWCXNxDY2C5kf4jJFZ+da8xugZEERXmKG0xM9C+HJrkXqumQVJ06VZoxwpV/
X-Gm-Gg: AYBFou0YekEg7fHFnby3DiebBPzdH4Pmldd/CQsNofzrA/SiQUsw7q0hqBRH3LnDMrL
	Vpit2pahgGPJRYyvNJzP60X6r9SzoaCQhi2pmuSQ/RNWAMgywU0MbV+S/A0Shiz2g9/956gpFT/
	JJdmrPwJdMnPb4GPitkRzKVprWVKmo99jLQTWAIzPNjLgYkbiJAkf9IwYyuPIdq7d78N4oA3Qwy
	zEcr+leqAsTGMLWL+lxHC55mw/dOfLrHLnsRTu08kUSREGdOpp9t1fUKtqOFDz5NO8zV2wGWFYQ
	NNls4hz9mdeIsN7PKvH3jyLo0LrVmfRAK0XVS0NnDNSYOqf57l41FqGbslKiu41Ivv6e88TB1vH
	UfPzP5lF7n/RH4khgJwdSRKLnwyzG
X-Received: by 2002:a17:90b:48cf:b0:3a4:ee2b:31ae with SMTP id 98e67ed59e1d1-3a6ceadba84mr3133206a91.49.1790961451461;
        Fri, 02 Oct 2026 10:17:31 -0700 (PDT)
X-Received: by 2002:a17:90b:48cf:b0:3a4:ee2b:31ae with SMTP id 98e67ed59e1d1-3a6ceadba84mr3133178a91.49.1790961451018;
        Fri, 02 Oct 2026 10:17:31 -0700 (PDT)
Received: from [192.168.0.195] ([124.123.196.90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd59187csm5295357a91.10.2026.10.02.10.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 10:17:30 -0700 (PDT)
Message-ID: <c5af97b8-a595-4531-aa68-6c5e6187b3ed@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 22:47:20 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] clk: qcom: Add lpass clock controller driver for
 Glymur
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925084635.112399-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260925084635.112399-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2OCBTYWx0ZWRfX/RXeTj7G52VJ
 5Dj/DulzCHFhUqKg80U8ZX90VPRIZbqqsveq09Q8EUwliklOfv4ZfMS1B+9U1OrhrBqZUAdC96Q
 YXPnvUosdokEhA3jTMPTFL5aUjmDpsU=
X-Authority-Analysis: v=2.4 cv=IpmL47/g c=1 sm=1 tr=0 ts=6abfe72c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=3s5aCXBOHJDmPDD1+4kJVA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gMLPUS0fGnAuojaj054A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2OCBTYWx0ZWRfX6dtKxwtB4Cq8
 ab5RK3oHEX+kLGTCEE16SlmelcA1R0I1ajRmzUmW7mSLa8rTyNk1O8bRIRaKGsYNw3z98SJy/yZ
 qmvvai9rQT4Jsyz92qzmLcELrX4fb61cvvRv97y6hO6gB5oIfHsAsYAMANfMgeeTcz8Jyd3Rl6M
 APW1m/eBbhasZ5Foqbxjvnsyp47O0SLQ7MRmGe2qC97dCbeNLfDcvnIcN8moVjAuK1Deb2Akjs6
 +mCaMG/MjOmr9aQVin8tyENUfHsm6shindY6zlAkXt/7JW+ZZuTnkLLK00fRxIKai72RV+8kyhR
 sD3hxSzsHwjF8Tky651fONIEizkGfWb2UwN5B9CzDvD4qFHyr/5H+Pw8hcIvjdzp9KYFvSUFQNF
 CXfl5oaqIX+vZ1yYKcroN2RiuWn8Mw1nyZSghTVqpB2XTpqz+/tyfHvtkriGAQRyX9vc8JXRBvm
 tw7l4VuzPzxsPvG3hfw==
X-Proofpoint-GUID: lhsMiR6qvAILUIZOhToH8cz78zNpCWhG
X-Proofpoint-ORIG-GUID: lhsMiR6qvAILUIZOhToH8cz78zNpCWhG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020068



On 9/25/2026 2:16 PM, Srinivas Kandagatla wrote:
> Add support for the lpass clock controller found on Glymur based devices.
> This would allow lpass peripheral loader drivers to control the clocks and
> bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/lpasscc-glymur.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

