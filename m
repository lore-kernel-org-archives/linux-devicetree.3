Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66593F86E0
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785155754; cv=none; b=oi0Fd0132GTPOHMIwYwHvoFKqUzqSYt7G/VXpHGOv7DmaB2IfgLqKCK9l208/4+JUTnZqpFVxAZ9T6BI/TzsuU4tq6GPRGG0tA9ekVyTyHbzEhzGRaTdOy2hMzn4V++cDx+ZGoXOL4mFBRSBcFlfiugqXsY00GqBqA3oYVZadO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785155754; c=relaxed/simple;
	bh=lXEuzB3RYCL5buhFHGgoiK/09Sqr7HNhA5jgzs+/iac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIIMDxrqwgR1H5kxTzSRAQJ81ugj7FJJ6R6LPI8QgZnkGtYSORDRCAK7VTJDeK+p4qMQx6+Qf1bAOA3o7qKXYV25d4G+JyMMtKKeJLGbde5p7Bm13U7euVLgqiEmtRCBXwyrvxbohp8cPB0BrtCf9Aogi9jiGKIV/sWcDwP61QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OvlEfZJa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A4tKCqT8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OvlEfZJa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A4tKCqT8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAM8gb3322319
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:35:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=44rzlthw92Pyb3IiSzSQiDvH
	WraFwPuyNqv1IZJTnr0=; b=OvlEfZJa2Gb68W5vnOidmz+1rY7r3EwR1TsK6esL
	APGXdea8+9tVyHs8yQGHF79EJ9vB1o7oM5tkOQbg2VmmnAl4g2L4Hogu+o1Jq0pQ
	Hl5xDaNCJtnQAqTl9BQpU1p+JlYoPGBbeNABgvpqZErCs29WsCvuUmeor/oc774y
	pQl8Kr02kzLsQKIdnv/2FpP9MtpyWiVwdzAE+LE9Xsy2J2FngW47uTv/junf8/M3
	KWWbLvr9ssvqfhwGLZK9wtPcEb279z0UiEgMeBg3sj48POOil+FL6h1l8RtmuE2i
	8ePEY9kzaAlWC3Aaj0oDbw8IpORtKdSOidkjSr+wAaktKw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp3v2gvyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:35:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso2015851a12.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 05:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785155750; x=1785760550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=44rzlthw92Pyb3IiSzSQiDvHWraFwPuyNqv1IZJTnr0=;
        b=A4tKCqT8bDx3qmhRALtjliEIJ3O45sFgBf1ln7o397LMEuaTEV8ABMgCHvSowFxQLK
         inO1mc5BaGUSqGkibOW5WfHH7m/LZrqxR1NABdiku7nH7ALqvWz5SP0XQHJPuuab6dSL
         1n1cZQ/CEnCCAsd3jJ3OrA0PNBDkCQwbHHOUIlwLizpeI5c5LAqyIYjNA5R8zbfGLSIY
         AIVE6+LPJY1L9OPx+JcywyygVLqQFBp47VzBfodH+ekPEfLXtabq9t+/AVaiPPacZlXr
         OZ8TaUYe48l/VbtyMn6McY3bLwb4grfJY89DvqNepekLT5bIznicXGKl1UKnSkv09uAE
         Nnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155750; x=1785760550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=44rzlthw92Pyb3IiSzSQiDvHWraFwPuyNqv1IZJTnr0=;
        b=c22lmr2+vxhK2p1VjH4kAO49aTOPdPzIk/YYLhsHvygMfRnT4/sv7c774flTGd01Rj
         gt/s02ulxDrQ/HaBHtzihuN5V23jEt+lxCoUM2ZAOHez3ek3aZTKvlRRu+R1fRsXhY+X
         83BrX4tkR3NXXeRTdR3V7xD6RDKwF2tcT/IoylqYtlLlmZlk9/al4j2YBit7blIyZXKc
         XcADneAQgzkFro//7TcGL/a7XAjq3LeiQ8ywoELunAWC9c5CsYL/VQ24G1Avqt9szJy7
         Rv4luHSEbms6B0DkhYnKdX8RjF1I048HHqeodcTWucBTgvvvpyYE6fDcytbbXEDDjvDC
         AvLg==
X-Forwarded-Encrypted: i=1; AHgh+Rq0F6VOdDOoPmqOEP94dFkQxLo17mgTg2MkDFLgkI53OB9Od6icDCFG8rZD63Z6uMN6YKi0VdbbCcT+@vger.kernel.org
X-Gm-Message-State: AOJu0YwxwM1OuSy/d9RpRTVb5GJK0SsDcfK1K7StzS/sLOtzm8nulHiD
	XKvqNK4PqLpezIx+dpN7yjF0YpWaN0X+O0gt7JZ8cStc2CZXafxfCA1n+tg+jv40YW6Am5J4Vc5
	fMF+zQJ2PaWo2/WuvSUbt3lJ3f3qYxZiIBtA61eVQ4o+pL9J+/8RBbl8ot2alihpM
X-Gm-Gg: AR+sD13/qGgWhIyTjnctwqFD9UidVV1UV6E8pAzT4/mFkXVSYtcOclvlkB6zCanBxD9
	Z0XiXoApFu9w1VQJmIE76OtQ8RpWU4GoFsC5h4dEU5PB/tJK/6/aOmc4W35Yt3C1MTyIgo8uxN7
	cWS2IiyeZZqefbk/5vHPfr0FAIj7Gf1g+2qHdjCXqDhwsAWCEjsTk/qfLwxRZz2ipcocLs5zl3Q
	zJ9LbXl49CjNk7pzeB8c7BrDMyxQqxFN7EOZ+Er7NMTVKb+JeDyc1tBgpHGBsyiB15RXTYJi9K9
	fiUsfLtZSof6SgNDvgn7cG+aoeS5N1ByLOna4bjBSCPloF2oid0GA/LyOBd/1A3wNZHMSBvs/2J
	bkgDZO0P9XT50HYua1omMc4o96Z4=
X-Received: by 2002:a05:6a21:3990:b0:3c3:890f:6d75 with SMTP id adf61e73a8af0-3c67d9b4670mr7490828637.2.1785155750465;
        Mon, 27 Jul 2026 05:35:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:3990:b0:3c3:890f:6d75 with SMTP id adf61e73a8af0-3c67d9b4670mr7490750637.2.1785155749813;
        Mon, 27 Jul 2026 05:35:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a04b2sm29439425eec.28.2026.07.27.05.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:35:49 -0700 (PDT)
Date: Mon, 27 Jul 2026 18:05:33 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/3] soc: qcom: smem: Use 'unsigned int' instead of
 'unsigned'
Message-ID: <20260727123533.hz53oknuy3xwzw5z@hu-mojha-hyd.qualcomm.com>
References: <20260727-topic-smem_dramc-v5-0-66188b3e338d@oss.qualcomm.com>
 <20260727-topic-smem_dramc-v5-1-66188b3e338d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-topic-smem_dramc-v5-1-66188b3e338d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyMiBTYWx0ZWRfX035iqcRoupkP
 8simBLP3VkwyBD5yKgfU0MhSB7Cc25WkFMiIsC9PN1NNHb3PcWYEese0RfSGnSTm87eTOCoCvTi
 BOQ1Imm2rh+AkGLiZcpN3WrVsn8zRkU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyMiBTYWx0ZWRfX6Go/y3EDqqj6
 jwre9V+2ZQFpGwUUbSqRkqlYt7aNGTVbY+4YrFSlfzRfP9t1ksHi5k3yApQ4lEOW2jaFRxd74dk
 0btqUZ3YuuZOdosF++K76Pmux2bLsEjhM4aRsC3vHYiHKlmPTyi9PsWW8IB7Nmj3JoJ/3nmV5EH
 ik6PiVshLVD2qWDWzcRYy7/XzifvkEz2zR+mPWTyWboeSQuFHQFcl3p34plwtkIFtdAM6QKzwj2
 /MPsgnvvS6yyDrgZtXdAnCxNnvl59tmE8xMZcoRwXzV42N+r/NbCcHoDQ785GqqJskVHQ7aOkxL
 1AWoVTJ+cbgTAlfLqSLnc/a5/duIrSE8GS+b7iM2eYAQ0vaHpxs/GDBwgySpNsxOYiNDdXo7jlb
 q4ZLg+8K9BZPvHulAPu0QetIgTcoaxJfHQH2IHjj+v63ASpwGB7bMF45ZHLDycxcp+yy9b+SFhd
 FWDwOAx51n6I7RtPshw==
X-Proofpoint-GUID: 9Ji9rwwvy2EsVRF0giiHu02c1SSTP0SG
X-Authority-Analysis: v=2.4 cv=KJ9qylFo c=1 sm=1 tr=0 ts=6a6750a7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=EZmpetop0t0RzpqVzL8A:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 9Ji9rwwvy2EsVRF0giiHu02c1SSTP0SG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270122

On Mon, Jul 27, 2026 at 11:59:27AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> checkpatch.pl reports:
> 
> WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> 
> Convert the SMEM driver to use the less ambiguous type instead.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
