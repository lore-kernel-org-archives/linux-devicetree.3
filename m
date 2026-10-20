Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485343;
	b=SjMxojtB+F4RMqIY9S1y/gcbFoPI1t/sHGp27h3FzOm+j1vCSiYCjk5HXCpiu1FuWh3I
	 5FoKQpcKArwaBIkRLgpAi3885awubgcmCVWiAbOQecPmLb9ayYI662LKUtX2Ut1SsPe0C
	 SbeyWoKvrg/8+QcCETsCZrpuqyN9NY7Of3WpyPxLlniyBp5ds9TJesSybehrcqaCXJ6BP
	 i7Km8c6zVCoAUA/W2Bxtbeh6qoDXgeWwjp9OOfUQ0AlGOQdmBdOG9+A2gYpRITeGEyCU/
	 aFFzeMRkBKcKLoh0AbVZvULZsZ7YgMlrxak1KZOYeCEEI1TbO1s2lHVYbiINKajWzDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=66+gStrT+StV7zXT9UJMTjajLq3qUZbhGhADbacL9UA=;
	b=znzbg2nKJWhcbyrU0V4+RyV72x9HMmuA3qu4tRl+gNydo7hnQfFZcoYK+fh9uGXeSpkN
	 Kg3MW5jgyTee7BxcSOyvOHu/0CNg7qum7OuRq+lWpmZ5TGGyOUuoxODjkA5Q50QT++YdC
	 DjePWlcEZ2sLJVrvzNWqbJ9qcTBvpU1XTwXbe6sKPuGp4c9G82cq8siUaTqwGNB2gT3Gj
	 1kxI1dBivSx4wSc7WjgvCcwJC42/99buFG2SQwix4W9jIuBg1zBYiCS7gY1iRFF6yQ8Ew
	 VGMbQlJe5by9VvG5cux1SLZMidUxVrcV23HOdYKBip6a9KFu4K40JPyNMdE2ii/ku2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="g7h/aEHm";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V3HmpHLl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E57606A31F
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33E57606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g7h/aEHm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V3HmpHLl
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K894fb1210952
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66+gStrT+StV7zXT9UJMTjajLq3qUZbhGhADbacL9UA=; b=g7h/aEHman4Gol6E
	CvpiHjeAH/SLbNfmctNUpdPbVFcEqKeaYquVqQ7tvJ81dTk9UuUWq3OwUZCfzwum
	Yr56PXCEuHp8SXPchbM7VjBTAtXEi8M8hNPRWkiIe/xjKdEZ7edA9nXHcuYO2leP
	26Ij0z4Iv4fFvJeoQ1WGP6iKglkKcBHQmVYCedulvTjgWQXw7gKFzYAx7HLGT5Cc
	B9EFiqbZ1jZnxpVloiLaBFX5geIjp/AKdS9d+IhbLr3H7kyTUibSpdXtvx/hQrMe
	WK+jv7Y4+nhN7d1Wdhtf+kEoH7zDz0CGAF0GYWDpzwg/b9KZZgUEbZUK164/+Wu1
	PyAdug==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p1n91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:35:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8a9cfe6so107099385a.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485341; x=1793090141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66+gStrT+StV7zXT9UJMTjajLq3qUZbhGhADbacL9UA=;
        b=V3HmpHLlMCSE85ynyodSY8ojHW8pgPYitAF/AjbfLAlasNx5wWzQ8K8UQl3bVkWr9o
         wjymIZL/VAtPmnIHTORcdMcfDPRTV8EQodYGwsRMWtx0MrAqeaR1UnOGI5fwkIEaDcrO
         QHkxMjbDvnror7yRU0X/iAArXnZMytcWfrp0uXChFKzDt7eM+9YAtJlditoZGiCvPLoc
         Ow8paiNXlVgf71zRQTc9oWKUgIEtDzOB88kS1gJNjSGeMlHtqMHubJEPu5yP9a88512q
         6YcCsKeztv1iiKIj6oMTPxRdfZxgi5T4eI1P0eYPu+xFVUWXqwzrBdoWSz20uDqRxFsF
         qRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485341; x=1793090141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=66+gStrT+StV7zXT9UJMTjajLq3qUZbhGhADbacL9UA=;
        b=fHyvivZBJ/DVotbl18SNeUVff8U4ynQFWH3bq/Cw2AQUvKbtLbRjVJTozbqxEtK5LH
         vmOYB/44/GAyMuXQUVD5aKLNzqL7TRX/ihDr3RdEmlkEP/dfXiCrB5874pZIAV7WOVrm
         eQYs5Vpun8ceY8ZvFwWUyZjMPpIvYJkbVWgxnslO/eJSVydPqcxmeGHJ5PUI8k87DshC
         rbhKkTfsltcPm3KkHU9PT6sndcImCcrIekrqWmJkOEb2PwhUgK8fbDB+3/nMRA+nZHN3
         r7GuHUux/sGVwQBZ0SNlRC8Wg+JszuXPBC+wlK7XIywwH5ibpNU8JIPEotd9jnwB8OYv
         Rj4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxln0ShwYCziSZv6YH9g0WxNILqcoEZfPQtCu1GxZJGBjDKvC450t1RZarBus2XpLdl0e7zfXU7Tj7+@vger.kernel.org
X-Gm-Message-State: AFq9FYIjhxSsifVJNQw1Wgvq9ih2hSDV3/jU4qiu/DpLP/RUzqlQ1t/M
	ZyAAFiQZbmqvKDnZocFpAi2sAqUImwO2RJeoVuLw2IyIEn+He7EUYh7Vth1em1SvrcUnAAQ1S4G
	a09T/GRIrjWIODzfSmlZvof3itJI/dmLdJNSaVgmkDeeQzQq0BCmQ6+jdGL6j+IFZ
X-Gm-Gg: AYBFou0vpEqKTY00n5dFJE0JSpQr/aJD70raf9GoQb8YGWcAAPenwDVkXKDkgUMMssQ
	f2f6yqba6/RqQ/BKyt5eEcrPWWdpeebJn0ad+85Mb0owaeAaE7K/r2JeO22bcQmxGjqh8goAvJu
	GS74nTsLUERn78jEjUI/V1rP2fbtCezfEUC+R4BHdTuuUcItzL5M/ByUfk4x3rNV0ZxHmwoRQ3v
	Kw1umrb39eOiwJ613/ruLndPuW0Aob142sZHvpibLmy0MjYqWmfnhXait62wwAo2r1OlNXlzCVC
	fA24QZmxYunbJ/PFC1+zvzRV+UZBWDNnuiM5ZW35l2wyZEI6LEHPAHhrPZRaSqCyvu6nYrt4oNT
	fQZRDmXP9rcFnn7o2iCxiIg==
X-Received: by 2002:a05:620a:2948:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f29dcb869mr1945703285a.6.1792485341300;
        Tue, 20 Oct 2026 01:35:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f29dcb869mr1945701585a.6.1792485340917;
        Tue, 20 Oct 2026 01:35:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d5262sm5053676a12.22.2026.10.20.01.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:35:39 -0700 (PDT)
Message-ID: <3de40458-7d7e-4cd8-a200-746e4c2adb13@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:35:36 +0200
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
Subject: Re: [PATCH 06/10] clk: qcom: mmcc-msm8996: keep mmss_mmagic_maxi_clk
 always enabled
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-6-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-6-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ok6o6B__R3Dfy6WRShx79GQVxfRbElbA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX2Lv9IYW8KWFa
 kodbOVBYpWSpiLMcuiHNE/Xu7Pik1+pqQMJh5yg/6/lUp+rTWmUEFutikeu9Qf8B7h/K8a7G3Q1
 5Y5fcUkZsgSVezObMkXgbWuHiPrEZyY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX54bbfRdqyC3g
 +ByQtLrpW8phmTnjnbhz7Og7PsMQP6TlVpDfwCQQJ5GsD7/XICPaPBZSWJ2saOghLCDcJ446qbb
 ynTRlT48yLxIbIdEQ0Dtz9kViMTy9CNDEfqV4mj2jGqf/5zApqa5trwU/xlKPDHkHRH89NQMrkf
 O4ov8N3+fh4tumKDdgxtW9IAUyjzpt0ELffj3S2VLyAKkKwQrDetLPhwzoFPwvXRqzSrf7lHKXK
 YhurAlNL7W6DjRPDVZmmMZTTXvDj/GO50wp1gnzeJR8FXtMykZd8mVWKUlDJao/hKSpcPptowI4
 mQXcxcKZzCNzfmS01mtDfbBoCZ33m8HuX50UkaByTSl34wAwDOB1Et86JhX7zMdTW7/CWfr5/Tx
 Jp+rocZF/qgKZWbUVAa7ALawgwZ2q7BqUmCWk80lYjaxCCyXUX8pABhd+fvcXS+eWbbXEyhXG1j
 AYq1fEfvF9B/k0Gc2wg==
X-Proofpoint-GUID: Ok6o6B__R3Dfy6WRShx79GQVxfRbElbA
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad727de cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KiQJPOv1UjsmjKsQXtkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200034

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> Enabling vmem_maxi_clk fails with -EBUSY, the branch never leaving halt
> ("vmem_maxi_clk status stuck at 'off'"), which makes the VMEM block
> unusable. The MAXI branches sit behind the MMAGIC aggregator, so they
> cannot leave halt unless mmss_mmagic_maxi_clk is running.
> 
> Commit 7705bb7176b9 ("clk: qcom: mmcc-msm8996: leave all mmagic gdscs
> and clocks always enabled") marked the MMAGIC clocks CLK_IS_CRITICAL
> because there is no bus driver to manage them, but missed this one: its
> siblings mmss_mmagic_ahb_clk, mmagic_video_axi_clk and
> mmagic_video_noc_cfg_ahb_clk all carry the flag while
> mmss_mmagic_maxi_clk does not.
> 
> Mark it CLK_IS_CRITICAL as well.
> 
> Note that the halt bit is truthful here and must not be papered over
> with BRANCH_HALT_SKIP: touching the block while its AXI clock is off
> silently resets the SoC.

Will the right fix forward be to grab a handle to all of mmagic
for MNoC and activate them as needed? CLK_IS_CRITICAL is obviously
a workaround

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
