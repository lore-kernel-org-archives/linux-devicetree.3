Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05169377553
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 20:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774643617; cv=none; b=eTSz+lVf1TqQNb2Iqrpi5h1ihtDG3qtx71SOZ5n0du5C1c4lgHBKL8LJH4DvmBIqBhweQJJBcTLzx8NW3/8ZLBKP4BcclPGu03Pw1nfWknkjhIFGW1p0lvQb90++6QWKyFw56s2rEDf2GqEVypxewpsLxr2w30uls3dgBIi5cY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774643617; c=relaxed/simple;
	bh=keFw1/XjbB7jwqX5zESU+f6p/vJiLEdwKlMIJTnF7eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cN5+XNx1hKhPEXLusVDnNrRqC877sD660fn577wMNyiaOZdweTb3y6Qb1j6CQIFidYkCm1IpoXb31MvMDnue2dfpkcxDabmijiM7qiNB3zKWEya56Hg5lnG6qL4NoWW9Wk87swY0qPBiPIm2wwvAAzYagJiUgqGAyhr8lsNNnhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCBt9pCx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TCXOnD0D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCBt9pCx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TCXOnD0D"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2ZMr1458364
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 20:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rW0LpKAnyyF0Y3CdhoPuNAvMCsetS7o2O7ydNPWwqCs=; b=kCBt9pCxn0HTwQMA
	TxAnHiB86/KNNPHCKrXrk2Ve2IanSLoR1ldkjw8TYfMzF+LgVjMZH8UtBBEsZtv/
	Pm/HHxwS9qGh9uCUGRLIT7xAr7DDAzEpdXu4bFT07etq+qV7i1aObdkMUvWXj5Cw
	TJySeAcQCr7J4Lo8TkUIDN6Hvrw+jhEUfeL96VDfAoH+g4y2ccDpiw8vUmyfucq0
	owklJbFB16ns2kRSZYu/Htz2gkW8/qXeVZ5b96WnIf8Qu2ZyGtR4JPVOSHSJrnZA
	EgNaQgs6dsmdxLh7INEEEDmRYk20/x4w73GB5f1eq0n07JAVU57VsfO/XUqPdclS
	1IQ0bg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6m9vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 20:33:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093025ffecso74678271cf.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 13:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774643614; x=1775248414; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rW0LpKAnyyF0Y3CdhoPuNAvMCsetS7o2O7ydNPWwqCs=;
        b=TCXOnD0DkziihurKzpZrLPkciOvVhgP7TF+XyOwidQWb4oKxLiuKlF0Oet2nFANu6H
         ZGaCm3nIEawlaX6oiQ8IQjWsgSLXrRqkKlfkZ/yijktBbHxBKyGrIT+Kqozr4I1K/htQ
         yOS1dN5s9lS+1E153Izf+kiA6hPSCKIEVMeT0Vv+x9TzdqJxiy1uTsPjy+BZxqwAVDPX
         DO6913aindk56r3Pu0fLb5s+5WobZqj3yqtIB6SgcGy2m96k088Tx8yYNyGLOqkYptx9
         LsXq6k7k2NDczq4exqORITuh3s9mNnItpJxJtexzyS1xxY9t4EKw3w8EVVqfgzRwDsPq
         izeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774643614; x=1775248414;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rW0LpKAnyyF0Y3CdhoPuNAvMCsetS7o2O7ydNPWwqCs=;
        b=bDuwr45MxLLTxjSXtO5NK3OzdGUYr2nwL4yowt1uciLipek/PBSssGt/unw0QyAFI7
         4hGUIIajvI9JUPgaMKKQHS5M/1voigUziVWoBhd93xwqtThF4ARldYIF0rGAnKJd/jsk
         BTRmYuXIaofC02YdKQ5+ySXcSZIYl9zms9320wZf+p2oHcS5T77yRiaHuNKWM3Xkjmtv
         FbPx76reCz7IZz5lmI62YTVGokuq61jaEa6udvbpQiDb85wrEEDP/2hV/x6906Sbh2+Z
         T3uvpjPbv0R+R4D9WsUGIQ4nWr2XRWKY/iUCospjw3RW7oI2PLnEQKkO9G77+Ehw33D7
         KDbg==
X-Forwarded-Encrypted: i=1; AJvYcCWjZOnOPuCPChunaU/i/kWmnhKX1gKTe0hYgcwlLrj1zJzCPAN0SU7MaF3kv1zz3yTPvnnbxEbrj4se@vger.kernel.org
X-Gm-Message-State: AOJu0YxY4PAmiHZIVq4nGjxLQ/hY7Q29kr0QQgl7H8cXLO9oUST/fSam
	1Qc0m2CDsszwcQaRzqNwPv+FKFMrDXugIr2OOcZm1dgs6dHz2njBwMk5z4qLIN0h1+MteBtpQ92
	TFBC243HzdT2FmzhcH+08a2wghkXG+u2/Qgy0iwcBDeW3qEAAXh2UVRr/EyVgn3ky
X-Gm-Gg: ATEYQzwKeW1BzM0PN7TZHX/U+0XIUKNFiQ+XKEkaFKLs956SuIiWgI8cySjJv1hgHln
	M6Wb+xvqk/85ocHwEkdm/AdYPX9CNFASbcqoc5axoE35pthQDPYp8laqttp7YzXPqbtycpZ/kSU
	qIuJxVswJjeCdigp9sQcgksXxTZAPzicNtqPGbFWNJ8QV36/ew65DTU/BplkI+jKYvJRb29G3L0
	uUet+dldV4JhLsKpMDHhGM1drcgqGv690CkzmgirTl8O6bucZppRaomhoC2IbSmV1tSWdAAGJVm
	fmoAAK9fTAfgTPi89xkPP/hBKk5EEap06OU/WEPlnSD0Uycfx03h2MCvi2ZOn2p8Uva+aVOt8ne
	NXCcFEe11BLgMYh548+ED3cMDDcP4qOdUQUicqNtPB0xRF0A4Zpj+vg7yhXLUdKJsmtU0vsCamV
	CztOIJy9SKQ8A+JeQzFK9q1kQwqHlueLPv/G0=
X-Received: by 2002:a05:622a:15d0:b0:50b:28b9:b0a1 with SMTP id d75a77b69052e-50ba391db58mr53731381cf.45.1774643614349;
        Fri, 27 Mar 2026 13:33:34 -0700 (PDT)
X-Received: by 2002:a05:622a:15d0:b0:50b:28b9:b0a1 with SMTP id d75a77b69052e-50ba391db58mr53730961cf.45.1774643613843;
        Fri, 27 Mar 2026 13:33:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1455e14sm6079e87.64.2026.03.27.13.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:33:32 -0700 (PDT)
Date: Fri, 27 Mar 2026 22:33:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/7] MSM8953/SDM632 rpmpd/mss fixes
Message-ID: <lv2ali4zgsfdh54yd74cx5mvec2z5kg7v4rkayyukpjt6juyft@vzprb3rvewkm>
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c6e99e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=4YYDNayrJdHcgVGABboA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: wePgK18p6NkoxPVIHPUiIV2lplQA6DiO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0MyBTYWx0ZWRfXyfyqes+q6YDO
 iU3tTuX4HLVmh2Aa7g+CBSJ2qjFKOotxfDRL6tQ93Azl5ezZ5xWAFpL3Uro4ifQa8u0X2dr7If5
 gN0iRXBqgCmVqTuKURni5Xaq/4raQDrU/8PfaWDtuuFdNwosGCbzX36pjTdn/tnNUGFArqly27M
 T8xHaakxIgLb0JWS5Udgtg1EJ9GRcQL0Gf3+Pr+z1jWgJhxZKgKT3UebgeiGGPBHkn6e62HXIRC
 KxlTk+2HK1Q6C2RqO8uh6rNL3Pi6GW8TSVyopr5k4sro1DDPO8zVjVzcu363agvZseVe3XvxKqO
 Q4OVpqz+MUvHygM0Mkk/EZ9py61wI91A4ObHA2bLrohh08yZz2AKhgXNG+UDitwAH9SkoMTygsq
 3+z5ohMNqn976E5gMS6TPJQEadiYnI/ushITqN6llnr80ghlmatC+ANjxNZQkkY2QFYS87r8nLM
 PtATF/2aX67a4nsb/9Q==
X-Proofpoint-ORIG-GUID: wePgK18p6NkoxPVIHPUiIV2lplQA6DiO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270143

On Fri, Mar 27, 2026 at 09:11:42PM +0100, Barnabás Czémán wrote:
> SDM632 pm domains are different from MSM8953 because MSM8953
> is defining pm8953_s1 as regulator but SDM632 is defining it
> as pm domain.
> 
> This patch series correcting the pm domains defined in rpmpd
> driver and splitting the MSS resources for the both SoC to match
> the reality.
> 
> These changes was discussed in a previous threads:
> https://lore.kernel.org/all/2b057aa5-4416-4fd4-aeab-6bc23acbb53d@oss.qualcomm.com/

Was 4.9 never expected to work on MSM8953? Or did it require firmware
changes?

> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

-- 
With best wishes
Dmitry
