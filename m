Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC86225A645
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789346753; cv=none; b=oDQMJVh7q57hyHkOpDxUCCelKsUe5TwWIuV/DQyp/OuPRrvCY3zLl6Oa2KO7nMqWuNAgbdzQ9bqHPp9q8nuF8lt7kF6iskfu/MgsqCGmmcpriPZXob2136ScDgU+fudDTudFaF4ri8Ma5Frr5jjDdOzCxHYYvZ1E9w1NsU5ta7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789346753; c=relaxed/simple;
	bh=11XAC7IHohnLExbynXhQgqZRwfRLEUClDfxcSWmZ3EA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m4uMpmVoURi6ur8OTQs2Oh+bcA6iNIKZEQxLCyMe7MIbuZkyJuv6zprQ3lfnDTvUOVAR96hoFpDwKKP5BICwHr4NauxrZ1K8xRyDrJYN39kX1CTH3oRxF2RTXtdYheR0lbojz7O9XgsC0NkWZIApU6JcdGDY63wmre1lO2p8CXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeyTfrQW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLpxyiXb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeyTfrQW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QLpxyiXb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E06V3j3027126
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QODTxX750UA4HDn/zUk4Bheg
	1ca4Dh3QMwnpyqlFlbw=; b=WeyTfrQWQtxC7P+0lvyYoIAo37ADFwFqHxG8VhED
	3p5Vkma8T5Sas1eGuUM0PzPhyhMpNBrXUcKhwgt0E1Dzho7Mspo0XsJW7/SkzqDE
	NeqvMIY4oHX9vaLwxqSMSBaHFa6PVAM95/aYhak4r2HaMlppf2dwDqUMM4d0rKkX
	S0omk2f0Rq+jRIbq1Lf8yzgZMafTff8B7+e/CBHn+LOgYI3z5K+p8un4C2+7Ia6a
	cmQyhItAqar78egyuUSQVKx0V9aqqGYQAQ0uElefmuDzAO9xxBFOsaDbt5mdUDjW
	m0r5ngygOLIRnzTV19TJ9hTp+eoqw2YR1vQWgUchujrM+Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dcedq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:45:50 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e9e1dd7fbso2145844241.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 17:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789346750; x=1789951550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QODTxX750UA4HDn/zUk4Bheg1ca4Dh3QMwnpyqlFlbw=;
        b=QLpxyiXb389DgTZPqyACu2ROyG2PBr78/tmWDY8jqe3uxPqBBe3Cf16GHpRX32yUVr
         SC6ERndbH2AT1v/H6b9Gg3BZr7RTg5osmQPd2OfN04cGtC2KkzI+twqxodtZklO6rJa6
         nxPHyr1+GB89Adkqa/0rUJF7nAUBm7B6OaHhjy1ILv6Uw5ELAeZQI7uhmu3Wwy6/4E83
         szHOcu8tMxJa0H7Li23i4jg8V4Hh28rybMA4KDxdN8YTVPp0CM0Bc2BtDTmEcYIps6hY
         XnT30MwmbNRglVF8r2zUIp+NgkKnFxq1ACnssdKarbaARl/TvL1sPW31fPAfkOt+d0gY
         xaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789346750; x=1789951550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QODTxX750UA4HDn/zUk4Bheg1ca4Dh3QMwnpyqlFlbw=;
        b=bhzddLkBfiapIbV8ZQI9BOUkYpgCI76u4wAyxZxQ/J9TmgyMHftLmPHzza7/bcKTT2
         9outsJieUYw+qXTfF4fcJe5jgUvno2tLIpFHSk2qk+QZzRi7RfotOSNKnPCO1OzC18a1
         Cc/+hYuCAeDurnPkogdkajEtHWk7t74LowCZb0Zb+FUR/slCcehEpAQko0N5j34H901a
         yyb8Occ2AKniOitfAvkAcFsAOM0LK2FFd4dqF+0WLhsNQApPJQNMb71JToznAIQN/GI1
         9SjnUq27J5/RPzTs5nYtqXvrK/hLZYetqhjWXMOvSlw5dqEns7rwZH/ShIrGSnz2e2Tm
         H+vA==
X-Forwarded-Encrypted: i=1; AKwUvBy0HhsczGFV/8nKJYJ+/fr+MMKv0UjyQpXKT1pyQ5bmIJB9swj1gw4qGfDqLQMdWsxpyhiaQc3FFlNQ@vger.kernel.org
X-Gm-Message-State: AFuF++nIA1UFNWqneZplLJ+1POLg2QmkksSzu6r/lNBhphEz6qAo1Uk2
	lbPdp6x/OU5FU2F8/CWooWXZOT9imc+JVMABacVWRo38CIe7QWboqifB9mqBNile2O+oFiZnQhe
	oa49xs1oHJ8oujJZXzOHgLKZ4yP0lVSDlEWQoGs6I802QyTvyTimN5ZL8xP1O0rfr
X-Gm-Gg: AYBFou3aHuU/73JpsrcjkjqnoY4R/VExZXnjMXgWpwlnYurb9zoSprOEPwlCkbQ+PP+
	LBTyEBbILRaSdsP89RcnfZDJcAg7j+usmneGMG7/XRuSsnS1ShAmcqCN2m9+68XwJqJNs+9bHXj
	kShYISxoG29YX7U5/tVyTLq+3IuDwHZVb1FSzgtn4N2meR8f7e8TaMCKQ+bWaIslDbr2FSrqqTd
	5jlqHUbBDWZZ9R12DvPK5RPQQlGhZRq29NqRs1dk3eyZBM8cToDeXoZnfSwr/Du9djzl+cXzroZ
	P752ZOou3Y37ojAlkcpJmwReErUwE4j+bnXmanwOhI2KfrO/rTbSucZtMc+qztTqhhq4Oy3ljwD
	sxQ4tAVq8aXQTAGamiz0zozRLNcQgWl0iYanDhTxb1twfvFdwtVLjOfDiKqvL+OADbFuk37Ssgq
	Fbl7Jr53FqiJLx
X-Received: by 2002:a05:6102:a4a:b0:77f:9278:af6e with SMTP id ada2fe7eead31-79b5b196caemr117941137.9.1789346745146;
        Sun, 13 Sep 2026 17:45:45 -0700 (PDT)
X-Received: by 2002:a05:6102:a4a:b0:77f:9278:af6e with SMTP id ada2fe7eead31-79b5b196caemr117928137.9.1789346744772;
        Sun, 13 Sep 2026 17:45:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a03a86f2sm2002489e87.4.2026.09.13.17.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:45:42 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:45:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/7] drm/msm/hdmi_bridge: Drop redundant
 initialization in msm_hdmi_bridge_init()
Message-ID: <vzr4mqf3opzusmbz42fwr4m5bbmpu7imrwzsuhhmxcz4klklme@anqfxjg2a55h>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-4-87bdb9f1987f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-4-87bdb9f1987f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwNyBTYWx0ZWRfXzmu9Xzru5aOi
 PxX5++h776Y8uNvexLOrfXXSlsj5J9JHuC9Gdzoy0ytQnMBxHdY8mzGDrmPsxFSTY/gSyaP+iU+
 FPvSJMzoQdbmfxiFs0SvsOBulfEIZGsDv5AXPUwD3RKRn5+nN0v0T+3dk9drPqE0aETilDhJpRD
 0jVkIOKpDjpnz6A4CqN85uxS+dJxlCC9Lu/TuwPUg3HkeMeadFT+1xGrvrnAHtnpjOBwq+GByZ8
 rlQmPOZjj1XoHVuFMPKrBIGJGc8jB4cHy8QDc4aHqY4S7Z8OWjpaDJ/RIyggtwNjt2fsZ7TO9qW
 oR0V3jgUcGLqn78ySutCjPUw4GI5XJxbT3qKv/g/ujz/UPF4y0AmgiJvjyORNso8agdmHjRW37Z
 lbAVUFHwx1TeXZHhZJ7taACQJZDUCG8Z9Oc1JPI/sMsYrRuub5uAJPPticN6BRD2C3HpwwZObyZ
 Skjs1twmYZagcSjzKRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwNyBTYWx0ZWRfXzVL+JlIVfTIR
 SKTPtbKzNSr+L63RP8XxEg2xfScIs5v1tr4QXQoe5E5sME621pYJjUOp16NfvEJ4HHu16QgHiJF
 lbk4KEnUzV2y4jz/zWMew7IVU4ikfDM=
X-Proofpoint-GUID: pWc3AcEn2_jnpMnJi-IRCbv3jad26D8a
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa743be cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=P84uMFOcKlMy4IiKK0cA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: pWc3AcEn2_jnpMnJi-IRCbv3jad26D8a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140007

On Fri, Sep 11, 2026 at 12:29:37PM +0200, Krzysztof Kozlowski wrote:
> Local 'struct drm_bridge *bridge' variable is assigned in ~13th line of
> the function, before any first use, thus explicit NULL initialization is
> not necessary.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
