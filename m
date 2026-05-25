Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C8937D100
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707551; cv=none; b=rZ+99Hu9OCxRJMN4TWAcP+OdlM/EQGoelB/LrBWF4NDt0GrD9p4+7coBa5hKmYR+b7Wh2XC0Da3m93wsDgv7mFi5ykHiiySuqHMmatkc755oXjgqo2C5MiV9GVLze8tmCilpxopjBfCsJVmctmDBN2ZuGRnyEYUQYGnFvT38z/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707551; c=relaxed/simple;
	bh=V/oea6YVUd79ay9np4Qf5CD3ZT4bLrGCN7+T2AQLokU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fuiBJviL1ppdDRc6loyL+jdz5wnCkZuYm6RoTTlfqGz8mpRX6gmCnD5rTAYAMDZX/OmTZs0tpwKlDcNd6mkNyuOish1pQDJPJNYoGNdw/6kpTub1ByeH6OnfaHox9fybSaH4XXNJdu68GqIw1ChqcR/qTqBz6ZSf/F1D7zcd9Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C/Zg3n6r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VhjcEcla; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C/Zg3n6r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VhjcEcla"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6YKm42770816
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mNbFyNHd6yc6F3SvZBtMoTUR
	fXgxrtQi1GfKV4+Tz9o=; b=C/Zg3n6rQ0L8MoUFWRlOYVxnkaPKV8yxzl83gPLn
	qpSCjIgi4LoaGGV+qBRYhq11ZyWbHBoZhyCZTZ2ge5UqB8VmXL0vbwz2BX2xQnc0
	cJqZFc871NmipAdt31lwABPG8c64qh0zZJOVW0QCbSo0/ZxeKglt5lnfVxyEc9Gv
	vCvzMguAp0WwuRCOFqgBf2ADM53/vYEgBUHkJVZfPLXdTeIcd50e2nKVE5Cp+V9S
	O4SWQgGqKo6Guuo+kzn1gPyb05OezPajqnXnS5Nb1sSRimwEXlHGaTvqhiZQY0ZY
	wHNtvaMb5tm4wvqLLOnvaP7r3hJIuOn+ELNwGLBj2aYaIg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t6jhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:12:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514cbe73d00so271463941cf.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 04:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779707547; x=1780312347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mNbFyNHd6yc6F3SvZBtMoTURfXgxrtQi1GfKV4+Tz9o=;
        b=VhjcEclasa6YhbL02SOzcEwSiZAElhzMTVUz6QOkSgn4gpc6XphVshmlEv7nE0Ia12
         dr8LSCaQo0sKMNxsLBJz9qFJfHGNLel+4Si4LeTmebtNLNFIu53ol8l/sLHasdUIQzia
         NOkycIt0gHMJJQ+1HoHtu6etK72ntHp1Ehg5RgxCKNZgrtbVDR9k7e4RH9JLt2Ixc4Cf
         5ILyaWjguT6l/HIO/Qmh+GbA5whvlPY0ws5hX4SgCHhRDD/+EknXXFB3hhArqEXpXnNO
         DQfjkVmoTpKyUd0HIJ+xL3EJBy/XgvsL5gN9ZGW9nTyqZZEEq1brc2sZ0jjE8p9yo299
         roKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707547; x=1780312347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNbFyNHd6yc6F3SvZBtMoTURfXgxrtQi1GfKV4+Tz9o=;
        b=SJ/GOUauCazHMtVEVZj8k5bJt6wN0Gbp1CtVVMx35rMsJE3CXLagkXW+OwvXFIuJ/B
         UhQOaFL3GfQQpC4d2iW9kX12sRgpbIBUifu7ggbKnff6heXJFNDl4H+/J4lecFKT2P9W
         9Qb95z6NclBsMMdKnAuJBp/2cFNkXzseEdydQao6Fa0zttevauJhM/4ZHj9Qv5KSlB+N
         ZBEwNh/dL6uM8ARjt3YK1NWQkgyYbnQ9KxJtZnZkUzln7c870rP06bXUbcbyEV56UIow
         V5sfMx4MAhjZktEi/eDC2uyO7trWupEEx6ZieKAf3sAVkLJFz2zWBmw/Pqdc1rnN7Y1L
         6ktQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RxG1x9E8NQ76lMWt+XrNl0Q7jp9nwiQkUzE3iIVs+WkhSHP0j0XqBHbG3nlaKgsO58ygPOp3cfDLg@vger.kernel.org
X-Gm-Message-State: AOJu0YyLOHmVTwfLz/O0JTzG8LVHH9oQdVNMJjlzfp0CjthoVardmgdf
	uxEwuDTMEzgjAOAXH8g60csmrJC3VAuumjNBpM1SUyirlKpl96BmtbQjegX8KmTaEzXupltkz4c
	/KtG92Niex0eoRIo9hwvfhuQ67qwGXW0wyRseQuMazqM1H0P2gqtwvx+tZ04bh3WK
X-Gm-Gg: Acq92OGPfn7LlGeuePp9HNLQv2eI8MirBvMc1yeq8qvgSj5zj3HEwqEuz7PZyMLOgZf
	2NCsLbkpKO6yZpCEyi+K7ZVLxltBTeuB7uSUrR6EhJVz63QHqn2WH1uHdcsP4qfk6sEZl3YJY5C
	cz2dOYxU8juIPMO2pQeP3BRvkB6rmBW1IkwKogDKX78rtjZ/ShPI3jZmSQtibzyj3TQmrTV5f7y
	z/fbfnKiRsUtizrBg17o+jUM5wyYrHkN7xVP6Jb/J+l/CpZB6T69tJQSp8qgyuzTBuuVH57p+zS
	udeYaDqBO8Wsua2daC7aeb3z5eH9OnCwM9aL18lcv6MKKHeLMUgd3BBYUTvQoX0MVIbkRvg8QFn
	D/79sSpYXoI7KDPKbrvWzGKfMvm+FQIlL0Wy8id/uAElcCo5jF3U2lv5Wl4Cj2Qj6e9JPqeztiE
	GO1uDd/jKWjK+Fphd+nAYFowzajZPBES7daDw=
X-Received: by 2002:ac8:578a:0:b0:516:e152:7a59 with SMTP id d75a77b69052e-516e1527d60mr118409451cf.42.1779707547096;
        Mon, 25 May 2026 04:12:27 -0700 (PDT)
X-Received: by 2002:ac8:578a:0:b0:516:e152:7a59 with SMTP id d75a77b69052e-516e1527d60mr118408951cf.42.1779707546620;
        Mon, 25 May 2026 04:12:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc2ecdasm22191671fa.32.2026.05.25.04.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:12:25 -0700 (PDT)
Date: Mon, 25 May 2026 14:12:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 6/7] clk: qcom: camcc: Add support for camera clock
 controller for Eliza
Message-ID: <lbixqj4cgausikhelm3iq5kamgmxf6ibhv67p6aya3fyqpdck5@ygy2yzntbo35>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-6-a1d125619a5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-6-a1d125619a5a@oss.qualcomm.com>
X-Proofpoint-GUID: X6FAtOsKqZ5CEO_0Wxu6vVmixWgQmXdw
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a142e9c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=jdZfh6YgxIVJxXzoon8A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: X6FAtOsKqZ5CEO_0Wxu6vVmixWgQmXdw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExNSBTYWx0ZWRfXyjws+NctLj5I
 KeO3zZ/gpr5gwo8uatSiMJxipgexJJD3F/0naGNUvJhIuWR8s4+QSUs1DuT4gAU0sq440fztJgi
 1mwVu7LxFJWp3qTqjeuFcaHTfl56K8VYncjAzCXsVw1fO9Eib0XO5SGZl7GDzJzK2AXYJnSP7Mi
 xkWhlkmsYvCi78ptyn7HrApQlnGHO36MvyB+vccMJ2GrgX57EXmsK6weU2kh5bzVapOeT5DYcou
 sjFA+mzdRS85K2PIBQwIYqQ8KWR2m5m0BnUB2VJToVgTmu2ar1Ey0F8K0yOiX+7XcDWUHwAeywk
 K2W9+olYN4gUvALMUJD6rkNXcSANDlSMO2Gz3C/TbUfek5r8RDjAtxBSK09IR/vT+flEuaEZLvN
 bmknNIbn9zlkX39XDmKuj7lor2/FvdkVyL8nlyZy2hUX/apmomf8Xf5G3Wsus/0cA2BZRl7E0Yh
 Df8b4pO6chLwEZ391Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250115

On Mon, May 25, 2026 at 04:16:08PM +0530, Taniya Das wrote:
> Add support for the Camera Clock Controller (CAMCC) on the Eliza
> platform.
> 
> The CAMCC block on Eliza includes both the primary camera clock
> controller and the Camera BIST clock controller, which provides the
> functional MCLK required for camera operations.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig               |   11 +
>  drivers/clk/qcom/Makefile              |    1 +
>  drivers/clk/qcom/cambistmclkcc-eliza.c |  465 ++++++
>  drivers/clk/qcom/camcc-eliza.c         | 2803 ++++++++++++++++++++++++++++++++

The camcc and cambistmclkccc drivers looks pretty close to SM8750,
except for using a different PLLs. Would it make sense to have common
drivers instead?

>  4 files changed, 3280 insertions(+)

-- 
With best wishes
Dmitry
