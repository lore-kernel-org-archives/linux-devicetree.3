Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7429A390600
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 15:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780242384; cv=none; b=P3N899hTR/6zb4/dYTERhLMqy6bk2l5uVIHOOgh6c/s4ujTsFxmxZlQXNAVItL4hdLD3bwvuBIVtjztU4rb6PdPs8WZZLI6i9bB2my3qsZm/g/RVEPFi7tD1zhfSlB+1OLw8CTV0jwAmO39dwNgp8udbyXmx2RQKb5H7Jkah09k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780242384; c=relaxed/simple;
	bh=tDRhPY72eH1MEmBS1nOw9h8VQfe8ypT8HiV/251brQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nar1DrKRCwlkCj4ZzO/rN3tV+ICvkXeFJxJ9y922WE8eMu3g6HAGnGfh2567v3nWPgkIIoJ+dFDBUELp5VtLdQXcH94MjtmKGecE0/8751jMN/2cRraYKbwsrf4kjwWy1jmHG+aAQZ/kQcgpjHNi+tg1j0umIcplvfub5YRj/FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FhZHHD05; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cr3DgQEj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FhZHHD05";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cr3DgQEj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UNK5tk106175
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 15:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=epu/m1cvWH/gMxE1VHYbejyh
	UddjLIYqkFTpjmCCs0s=; b=FhZHHD0515LPy1LXnlyjOV+nVDT3mUfKiDOXzM9g
	qUfnOY7do1N2DAm3batsMoalFpce7/Kw1AQalfdYJHaM6SFXZYKOPIXOB3eBamdp
	wKvDesaDkwSIp9LRITI2+Nuvzs0nPIVt5TJKe+UTc+rDN9Tod/XoroOK2OHLR9H0
	JFTIx2oUXmrXaT1VeFGyJ//k8k0gC8pDqfwzNs0eKwMo+53R2dfb3Fgzv3BP8Spg
	KeHWb5hDERAvXLrzkWSdeFHiV6ENNnqddOocW7DUTRr8GiYgs/2Gnv6NcE8VD0lo
	7pXYUAZwVXqEq8EPSZTLE/oetDRne/xDXjwRtHiOU8udXw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efqyuux2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 15:46:21 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cfb918a9d7so818553137.0
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 08:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780242381; x=1780847181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=epu/m1cvWH/gMxE1VHYbejyhUddjLIYqkFTpjmCCs0s=;
        b=Cr3DgQEjAdqo12++XZ/RBCYVJ6Y+bTKgum86LcRgBjpHLdELXQqJ1PnlTsMLxzdamd
         mQvL7gKS1xWx7TZZzXlmTTby58r9BC5FAeUS6a6eaUEWNcjj3URj03h7N7InOIzMNsIG
         9sjgNvhQrOnCdQw5VRXFxuWUHVFnypB+QuBfNsYChA8Zb8ktcy5JE3PYoxNgayDHZr/q
         t7X3TMR6Dd9ksyZOa11sRNY+3hOot6qvpYGjyJPyjqTAwmVYV1q5zeZx9uAlxShpIgkl
         fNOHLqJ9Hk6AfE1zHL1ek12FKt4DD53/N8B7ovTHJk1y7wOYRLIAcqymkW/FBmB0Q0Uz
         iL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780242381; x=1780847181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epu/m1cvWH/gMxE1VHYbejyhUddjLIYqkFTpjmCCs0s=;
        b=APYxPk1eAA85UjGQWGPyx76mq5spJlKXZws/ulTzr0d3WvVTx0WTdTpNTq/EaL/4G/
         w/7a+4OsLhmaJ1ZP9I+4WIt5n8hpho9cdiQmF+u2YCvdcmaOd+OSC9xSh+4HjZ3n7ilu
         d+aqbQLx/d/uwbrp/cquZQbfbPBW8Yn02KZ7UVb3Q5DD8NhhdjXhHbMr+fvoWDtW3CCl
         ezwhphRjlgYhKYMo6cmrT1QcdLFEfBr1ABJf6zx/0laQX2wx+yKU9Bgw0n7BpwpJ9ygu
         AXmNuC7J0mY/bz0HgOjb38EcWRJApa7P94dSwOEL5q8ZLilHL8Rud3HxD7rKE4JfGfPA
         iNBQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hQywQi5hQDYmRSktZQgJj0ePF/tWk10XL7Djv1cAwXkqNOwAQBIHUujvmWevUA7Kz8paL0JJRYTyy@vger.kernel.org
X-Gm-Message-State: AOJu0YxfWk+i5YZCk1hgyN+puNcxbDb08eMF7H1QpEWYtnE7PBVCFc/y
	qZ2PqRSQlQ5k+55GJCqmRreU35zE7xgzcpR0oL3Ifi/LQYFg5HMugBjogz8tR2I1uZODpGd67sN
	XUdXCaBxzkEbwU3TtFNIW8gOYJsV/v6A9OOhBBCKYeaNQWyskQa73JR5Ee27DwEv3
X-Gm-Gg: Acq92OFCww8cWUdViAvcWC1iFxJvA1dGlhPOhxPZbI7yAyC7P9jg5FwYjq81NVEHyXG
	rwVuBLCt4n142R0RFed8GYu1jitSv8hwkDbcdeKN6R+S+n7XQFov8NOXvU7MXUPWKbnPSVVJ4pp
	T+2PPssw8wjw/AOc2C+KiPNJS5wKopymQZSa/wu9TEYBdWL8BvjzWdLaPBTLWYu8nKXicvVfqla
	V8xDh+gVKtON5bpmjsQR5nfAh90wS/dAZa7Kell2Emb0ePTWibYhS2Y27Ey1b3Iq8s0DZl/Y19L
	KszTSZlP7+Pnu2+Rkp0/wuy1UHYDC5/3X2Qb7obSMIV3xfsfIWSD95NPaCutI/ve8S9oYhWpxDu
	2SvgJNc1T0wmizx0Z00ZRIwMyBxLid5HW+DWe3Wg0y5lPqwE3hZp7qIluOAyc9Z/tiqzMHGvF5C
	xRZBQOMbud9bSsxKGnzd8qDnCtaUgYGfg/938MsyNC1qTPKQ==
X-Received: by 2002:a05:6102:549f:b0:631:2624:e5e7 with SMTP id ada2fe7eead31-6c684ad0f5amr3004750137.14.1780242380809;
        Sun, 31 May 2026 08:46:20 -0700 (PDT)
X-Received: by 2002:a05:6102:549f:b0:631:2624:e5e7 with SMTP id ada2fe7eead31-6c684ad0f5amr3004740137.14.1780242380421;
        Sun, 31 May 2026 08:46:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b07baf9sm1543041e87.31.2026.05.31.08.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:46:19 -0700 (PDT)
Date: Sun, 31 May 2026 18:46:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: qcom: add MSM8x60 LCC (LPASS) driver
Message-ID: <vrvmex3zvbwbtobccithsxbel5rp4agpnor62ocadfnwbasq6g@rt7hahrlp4sf>
References: <cover.1780148149.git.github.com@herrie.org>
 <10180e08af4d55e776963932a4c5e60f0f197a96.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10180e08af4d55e776963932a4c5e60f0f197a96.1780148149.git.github.com@herrie.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDE3MSBTYWx0ZWRfX54bU/JHaYv+g
 NwZgpHjJj9KdJBOqlHFGil8mi74XQKPTASp7VW1FlNaCQQeWr1J+hD3pob0d1b+o8sGPcafLnc3
 jcSx6+r4dbv1NXxtbRDZFH934UIPwhfSjqZAdJYbfjsJ8nGIg0Y1eaXw/XnY2HXYUnp2eH4mo8t
 MRW1ThMOIpQCH1u0+hSDCbunvnySFtdc4q9urasAroleP9gkBKLmN1A4tzGe8IRCif6GNNcjmZp
 bAPuoKyM057dXpy2KzhlJa/zEpFiWZ/u1ej2z2/tL0pcVBnBfmsqP6mNRx0LFyQxgtFh8ro+M9P
 xyI8gO1Rb0YhziMG5YSH7yk1LW4mGAbPerq0S85N+X/xzqg6lEFQrg5BF/UUKrcLeyHx5VGCvYc
 xvqskGoQztb3DIcB3wJjJe7IW4zfSJK8I7xgzUFxwrnodrjU7rxH6OEGzCrdaESj7JkhFFzNDcr
 ts3y/HbMMVY23P30j8A==
X-Proofpoint-ORIG-GUID: flrRQTvfdoVGEgFI8Wb67pKtKMRfk5DE
X-Proofpoint-GUID: flrRQTvfdoVGEgFI8Wb67pKtKMRfk5DE
X-Authority-Analysis: v=2.4 cv=B5uJFutM c=1 sm=1 tr=0 ts=6a1c57cd cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=cTwmTnRGAAAA:8
 a=CMVvGDE1AiGxj1kctLsA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310171

On Sat, May 30, 2026 at 03:59:58PM +0200, Herman van Hazendonk wrote:
> Add a clock driver for the LPASS (Low Power Audio SubSystem) Clock
> Controller on the MSM8x60 family (MSM8260/MSM8660/APQ8060) - the
> Scorpion-class generation that preceded MSM8960's Krait CPUs.
> 
> The register layout, parent muxing and divider topology of the LPASS
> PLL/clk fabric differ from MSM8960's LCC enough that a clean separate
> driver is simpler than parameterising mmcc-msm8960.c. Both drivers
> can coexist in tree (different KConfig options, different match
> table, different device-tree compatible).
> 
> Used on the HP TouchPad (Tenderloin) where the LPASS Q6 audio DSP
> needs functional MI2S / SLIMBus / PCM clocks before audio playback
> or capture works.

Could you please merge these changes into lcc-msm8960.c? There are
minimal differences, so you can just patch the definitions if the device
is compatible with msm8660.

> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  drivers/clk/qcom/Kconfig       |   9 +
>  drivers/clk/qcom/Makefile      |   1 +
>  drivers/clk/qcom/lcc-msm8660.c | 517 +++++++++++++++++++++++++++++++++
>  3 files changed, 527 insertions(+)
>  create mode 100644 drivers/clk/qcom/lcc-msm8660.c
> 

-- 
With best wishes
Dmitry
