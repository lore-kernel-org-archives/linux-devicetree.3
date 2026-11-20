Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165958;
	b=kkLM7Gym61a1mKNXw8ACHc3w3K/F7lZ892hIXG6P6XjqokG4p6+CLZQ0OLQCcHOil3eA
	 fAetAEzOXmfoB4XHCWdZCwVPbv9GF6gtMKHt/iyU1BSTDP86zdJmjvFwmcVNoaBKXPgtC
	 JQykOGMOHhObCZ8DCQF4ILtf/dTBB+nu1zTGsIIC875quUiFFTb30Ndap82mAEn4MVxm6
	 w4n5zMbp2v2U6iAyvYa105vLbLSOsqSJ3+LE8/dfoKadC9O+asRMmer575tcMaXwMzSXm
	 hZdMe0Aj0f5z5zHJw1uVX4d3dnojQhy7PCefEy1t6SYRCuEJQjX5EW5GHS+6+bpAh2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165958;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d3BZ10q+BZiu4ItFZt5tvNVcjVf93WkrVqzDz3UjTWM=;
	b=BMreSYRH6xEQx29+nVTHmDkqO71PDwsIqFng35yGlAfLVUrW+95b90XC2pBmme/I3pzW
	 nQNlBGfRu2VQLiCXV2JIhW6JNju8Uu5yhfOvoKexTlfSg/77KGkBEG7WCdc1yJSSuJTjB
	 FR3TW3/b6r9B+wmBw705SfPTisJUSEkDa8/PXtvk1jy44QIQEF8edHUeowkhf6TWh0lAI
	 HHdZKlcBE1Xk9p1+qjii6454ArgcM3GRHzeBICvxUzLnV4eoOh2Sewjr0ejPxTTkmk6oo
	 9NLx3PM+lQjqry3saimcpuowVEshAyKZX4UTc3L/mLxNEDcTpkSjGrK87z8RDlBif2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gVmAKGJ+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eW3Qo8ui;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3115F606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3115F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gVmAKGJ+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eW3Qo8ui
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7esWb2019486
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d3BZ10q+BZiu4ItFZt5tvNVcjVf93WkrVqzDz3UjTWM=; b=gVmAKGJ+bahJTHDM
	2Q5EMVxlNljNWHr5+3+5k0Kj/AS+2b+xDCkX7V3JNA26pZfiwl5qg+zSYgbuzCra
	T5F+/FhO2o1HuwI8Q3VQh7Ygj6v9U9rg+x5DYySeRj2ocL+oA/ddxmYQfAeDPrI0
	fI6zq2cvljcn1ONBrR1dCE8bhD4Et8tjGNVpLcfJkEkodMvxaju+ct3EXu5FkY6U
	ZtRsgNtZE352+kkE8H534/8c8XW3HgBC2CA6YdqWHCtZ3vTKzLPBKRbBaQ0DyCg4
	nQcZXCbuZqSFHMMq5IdXJI08/e4decKvfpkDYEBhfC3E4Y4SVBSfyjtgqQN6aiMk
	Y4QjDg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj90ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:12:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3a9826f6dso792384a91.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 01:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795165957; x=1795770757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3BZ10q+BZiu4ItFZt5tvNVcjVf93WkrVqzDz3UjTWM=;
        b=eW3Qo8uiqxjMDKgH/wEW7yBPXsyMvciW2yMkJJ2z3R8UVdyrNa3aIZZs9vop/LfnSL
         9GKwYGY5TjrVDuer5mP3X+CefYs5IFtfVPM78GxBLAbFjBhIKoXrtj9NbnI3nGLxsiV1
         F2H4Ihy8rDlId0G0LmQ4itX8sOEIjSFw2QVXEHQk2rjgzW9iRQiqInMx/4hWsYtQlX1x
         yxQKzwlypTvCtiZTC8BsalFv7YO1+rzJ8YNvF7Np2dPvJnNzNIwSdtyhW/dP90Hc8DsM
         4EZYg5JOKGm9UM1GU3WqugNBhnQD0Q2Aoq7ENWlwhNqhYvIw+jp6ueOqnbqw+lJjoRv8
         /+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165957; x=1795770757;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d3BZ10q+BZiu4ItFZt5tvNVcjVf93WkrVqzDz3UjTWM=;
        b=0EWgijuXX1dboeWYagpDDDNCLSKIdyFZ5aSWFFQLRcHX8SY0li5vQp/jZS7yd+98TC
         6D3XpqJFlgq3jqig4G8r/OS2A9iQvcbuFYXH6POnjc6fFK+yaq2Rhw8Bps4X6MZGNaQo
         piwCbnb3sYQ0Vmz8bbDT4Nv+aQE6uhNerNqgiKfJV83/ZAWMAOKPBEZWrAKfuETlkpqT
         RUkIxazHkVg4j07skuYFNZV2jOEl8yjOcMQkPS83iQBcx3KaIQq5SUqQ1N05QrnmLdu4
         5CPhJcLebDfA6GmctL7nfBtgjDCbtGN/SQJi2DXgp+97p4Lg9TZWRq2gxsRCwFEzOW+z
         yJGw==
X-Forwarded-Encrypted: i=1; AL+hErEFdN6bLTLLLc3Gwpjx6jmBgBbIqULfMGuJJL0EdxAaYwYIgP4wTKYWyD5lFLBxLHb39AfW/Hcj721i@vger.kernel.org
X-Gm-Message-State: APuU4Z/A+ffB8fE+thh41yWURyovfNUa8VpeQn5gOyP8Ls1yT7C4fsj4
	NaGTYioWOTCc9EMQ6g6xDpLbQvqgfBDQyRRI9VQrTRgd0weqNiVp7LQpgUk5wt34CtE3LkOftu/
	MziNjkSUykAE2G16RR0JgWpGJJkzbfXxWTu7z0JEQ326zDXy0H6YIAkewI9cMFxwA
X-Gm-Gg: AZFdTZeEl99d4HXqJCYGEnuCIv6CV7PM0PPIThWscAETtTuYVafvKeoYzfUzO+eyPQn
	s6BhVQ6G6ebu5RfWWwsg7eHQOxIe7iuXtByGiAn2/htmGmBBHpj3qpc2cyKRandB4g05d7xWqix
	awjoQHABcmdZw9BfvnQpdh4uYjZqtJrvA4vjZIZFr1i3900MxKwqvr6dojngyyF9V1aZOtVWXfy
	v24Rb3x8RQt+Cwbfo4lFfzqq01eO2eBFJ3KWUSfjHJnniQrlKVFi+6cWUebHt+4QcmXjWmAL2E9
	fRkZX085D+QShv3cVa4Gwt2F9rRGcUM1hDUvQ5XhWhyuZ4+jGYJRe/NKtn6NocR+hoIEIEEr8l8
	Uv6ZN1LB0Hv/tbkHMNht7Tldl+l+z4ff4Fis6PpTkHyw19arnymQSM8vlP71Y1m5I5rJ0SYwHh2
	PUxkJpnA==
X-Received: by 2002:a17:90b:4a48:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b41c7d5cc7mr1980976a91.7.1795165956818;
        Fri, 20 Nov 2026 01:12:36 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b41c7d5cc7mr1980952a91.7.1795165956350;
        Fri, 20 Nov 2026 01:12:36 -0800 (PST)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm3483495a91.13.2026.11.20.01.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 01:12:36 -0800 (PST)
Message-ID: <8d7db2dd-6338-43d2-8eca-fd6db3e7c512@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:42:29 +0530
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
Subject: Re: [PATCH v2 2/2] clk: qcom: segcc-nord: Add I2C and TSC clock
 support
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
 <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b000f05 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-HzP2oy_C0ZWqF548KoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNiBTYWx0ZWRfX6C+vxBO2skg4
 Yntcj9GxYkRUcq4Gey44V/7ZJJ7jJ8+jRBM/ZImO2BzsX6EdCodfVgyMo7dyn6RXbMTfMcPI07d
 BMNyVLSsShu6ssTHXlUxMEurNYrq7gA=
X-Proofpoint-ORIG-GUID: hKGfceG3FvYs8EuoWoRGTKNljbVsySNe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNiBTYWx0ZWRfX6CjO00yJZuFE
 DD9kmrtKtTR3f7z2V+gfCIIcBxWFP0ZhGD7il2G2LStG84BJiFzVC+3C1B4e5UfKQ1jOchMr5LH
 C/DefAv8CAHkX8ajVhcm0qdx7DpP04YkYBsJ1SpNRQeH+R0RvwaFIEp/k3ZNYc0lQyl2o6fMG+S
 y5NhEgqI+kfGtnPbRpOSsShhvEkE7CKXNmm4zgI2mfJHdXkZzLbjKj/9SaM4Fd5q6CVdsx/DEQO
 pdeq48LWwhX9w3CDzKBpzWs7s+zWwsM48iChR+Ohf3UavWeR3ODbkvcVamLZCmY1glBylFHNLvY
 /RjmPD+3XjKu4btktoIbetAoSAUTDrsqejorpQV4hD2AAS5axpHO6b8lAQcuUYUuB/f3lYetebr
 ZklTmwR0P9NUlH/BOrBdrdlzdnu0NjWGDcWx2h7AuhCvXppYZiX6RayRqdnYq/C6QxPpRlKe1I6
 FPMxdxIMNOC919/LB8Q==
X-Proofpoint-GUID: hKGfceG3FvYs8EuoWoRGTKNljbVsySNe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200036



On 11/19/2026 10:34 PM, Taniya Das wrote:
> Describe the I2C slave and TSC subsystem clocks, reset lines, and
> parent PLL needed by the Nord SE GCC. This permits consumers to enable
> and reset the hardware through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/segcc-nord.c | 135 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 135 insertions(+)


Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Thanks,
Jagadeesh
