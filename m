Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B691C84CB
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 00:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775437198; cv=none; b=OkpLAMMFXQ1+oStAKe9A4VBrfi9Zh9CTcWwOfZv6Ub0mVYLicYkKZBx3X9O02pOMIcWAABBCKrGWUY3XWoE/QK5cYwM/iUY2zbht6/FDGY0uPNNHMXjFzH1/eVfA8MeYYM8SQ32lPUwOYgXyqC5CHiJQ5qHdgyxdzY4A2YeMEJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775437198; c=relaxed/simple;
	bh=QOXmw0yAcw6uv8eeBeVzE+uDcdLFxQ9fp1u21sG4oOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVcQeROIZYAiKgx2aGRrusTnj4tZ1Dz9gOzYdB+ZhlAdN3HzPKDQIg5WH+ldMYer0FBxZngcVXc8IEmRNj+xLJFFTZSRA1buBtG83PfAOv+7frdBT7JVlERNhQNFwOFTBK6It+/XRZU0hncQwkABh+qq1ZxpQjHKyCYfghhjjQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OpZ/RM01; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eBCDEx4a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpZ/RM01";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eBCDEx4a"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6357AXqt2936947
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 00:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jJ0vIYrlGNsQyBLBU+pIF1wA
	qhZv+f4tNLozhqTFUjs=; b=OpZ/RM01nVPcVKb6Q/b8G2bHN7kKUFZty5svTxeL
	UbU0QEGi5ry3/UEB2l/bkmpSQNiTLy62aawr5VmVtOeXAxfMPe6pu83cuouCzcRz
	iM/9fBCi8D7A2ihXDBfCiMMxSyAPGaWOPAoFUVDBUJeH6cwHugmOyGwnQBB/xkPP
	J/4kl8g/PGhHS8CGLJES7ccBcUKO1FeawHdjE/7O7+7z3ATNGLnzuMbbNXMGybPb
	qAR2M7T+kvRIo4MKu+W9f7WzX0GZLZRDsv1k/kXYs/OgaApZ6CMmSX/p1mYdKkWh
	K+N9Bv4MdHQ2hmwP6rWu4f18u+7x2QeVjWYpjqsYEAvD1A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daudd3d8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 00:59:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d826ed6f9so25143421cf.1
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 17:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775437195; x=1776041995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jJ0vIYrlGNsQyBLBU+pIF1wAqhZv+f4tNLozhqTFUjs=;
        b=eBCDEx4a3PLXgVV336MQg8lMe1gHF6zQTjFCJ/f+HOrCxc10XfiuCIrLGUHp1K35nY
         /rOx/9JUURg/pBFDJrqfpoUeLO6altqY26m+NRxHNGSjBQa+RPoRuGERh5kMv8dqb6Mo
         /dKLD31ruYEWs/ZnjchlWXjgGSI60MlK68VXU0lhkx9WFh+Or1+tV4M6QzlgFmF8VB/c
         L5DDg8bxCsaaj9q3JZ5Tv1Lg1uTpxhqTYJ099uM1noHK/nZ9lhkF6aT0Obr3aUr9pJQF
         4Fc/X+VM6A6gXRf566oXse7H5+HCANv3/rxitYy2ljSsC/8NnQsxDqeFgcXIIn9kwKf7
         thAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775437195; x=1776041995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJ0vIYrlGNsQyBLBU+pIF1wAqhZv+f4tNLozhqTFUjs=;
        b=hb9KOLrVmdgnWKBS2msjXdfNMBYZk0eaN4LsMsdxMRpx4IFzzPDjspA/Njd9rNi73/
         ZXRe53dBvyJpPPkX2vw7RqWPHz/+uQGsUTg6DIjMy6PD42H4SJ9dCuEmIEf0vdMt6KJZ
         H1a4HYOne9N/KJUfkiMeDn0dKbpj25MOhDzeG4Ozfow8FFLmFg+hMWm2K4k10agoeE9M
         2LdVYLf7ldrJELUKa/RXMp0CVM5ELgd07AugX93eu+kLzgJbuCG0UQXzbP4i/iltR2k9
         PBAsWHrY48++6nxg2BR/aCbBPXF4k57l2v9DeX59AM2rphGMKQoHEYSkOe+iVJRSw9EW
         1czg==
X-Forwarded-Encrypted: i=1; AJvYcCXbkHXGTCyecwI7/NdNa0ao7oYGocRJD+ONbx0sSi/jC5489p/zu5okUCUzG7Ill3equV73mN9leu3u@vger.kernel.org
X-Gm-Message-State: AOJu0YwjkHF6ZKZnM6SYDXNHD2dTWM6VM8BFyk86Otexp5lcUWkS8yJp
	B1k4cpDjUSATsa8OwUpnXa+WZiDADeiquNcSxhm9qB+JFwONIUp4zVlsxYi+c2Ry0O+DWwn+zIW
	ztAxiiw9THaneVQcQ+aOu//n1LIVlVjWYLpa1Dpg9y91ezcABAmC7HsgzPyQcmfU1
X-Gm-Gg: AeBDiev44mXRDs6A6TEK6Ny5i0GB4PuFkHaJ7lyNUIZuflzjP4GKEpoDp2Ndq4rJoyh
	yKcwDh+xc39/p6GqJnbpSFhZf6j5B2L5KYEaEA31iZrwOeMKtq+THEisx8MMDrniVphJnCcLPiA
	mmzI6PxXSSalJgBX2X9E533XeyuxHEq6xzKojweUe4BPli8LLf/s4gPJBDvz1Jx2f0L5s9pH1N4
	M84WWGzNh2iqEkXKs6q3rUYV0yEe/firtL+jOIKji3jBmiqJK4+yJAaVmBJenKrf0fC0OG2Qpw8
	dSc+b+byGim0Dl+QsWdagDKDG8dmY/fXntqQgOvPSaHY+AdFvxEDUW9xEcwDe+2dzsJ7lekovBC
	ePZxLKn5REVH4G93HbDVJRLqJ5pT7E6NHG1laWe1hvFpQFA1dZUyoKO0pdiVJK2VXhub1Iv7/TE
	hD3oYEWdiaxmerxcJ8XCcts5HtZeOoSLkOLb0=
X-Received: by 2002:a05:622a:999:b0:509:4410:4487 with SMTP id d75a77b69052e-50d632a0bd5mr144642331cf.24.1775437195267;
        Sun, 05 Apr 2026 17:59:55 -0700 (PDT)
X-Received: by 2002:a05:622a:999:b0:509:4410:4487 with SMTP id d75a77b69052e-50d632a0bd5mr144642071cf.24.1775437194806;
        Sun, 05 Apr 2026 17:59:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd3509sm3058813e87.75.2026.04.05.17.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 17:59:52 -0700 (PDT)
Date: Mon, 6 Apr 2026 03:59:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 5/8] dt-bindings: display/msm: qcom,eliza-mdss:
 Correct DPU and DP ranges in example
Message-ID: <z4chv32egqvi5nf3kemron6qlibgjl726c2joauld5nt7smfo4@eqbpdl5glffc>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
 <20260405-dts-qcom-display-regs-v2-5-34f4024c65dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405-dts-qcom-display-regs-v2-5-34f4024c65dc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: wqpNwCskW-i3n4kk3GVyAy5bqctXgmxK
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69d3058c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=bHnmLuETDjlIWUPFTNkA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDAwNyBTYWx0ZWRfX4WtLwBxlrZj9
 WBe68AxEz5keoGfQ3YDUksoo9yA/IQ6XUqAgGPZADX1+k0VYe44MLRfErkRByGnYazMmgUNTZS8
 4jyBjKb7pNdFm9xd+XWJuxmfTsjLz02DfJxy8vNugmJ/ZD+CcogZxznHCHD/I/djRMUut7zpJQg
 ggbnYVFAPgs0S8WJW6ETYRLpYodjsgjDGKH0vzevWE4rLq2AE5Grd7O37yL7q1ezDgWggXgL6dt
 7TVXw+PpAxKnS0W2l/5alKBoEbsDlotUPVFsAiKsXhTQw9uaAq8kCoDvWPAnMXjMX6P62g4rkSe
 O8GcakgPP2lRUwE3Z/BbASfZx1GAfQDXh0FX8OSARtcV3V/aehrBQFu2sNH8j/PgsoRiZWEUjHp
 XZfzUJdqQBHE2Ed/RlYhusoA5UCgCZooM/xINEWiQXKoX6dIeF9QyI46UdosI79p6iQpNiky7L3
 +Ju1+8byVL3XOAMQC6g==
X-Proofpoint-GUID: wqpNwCskW-i3n4kk3GVyAy5bqctXgmxK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_08,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060007

On Sun, Apr 05, 2026 at 04:34:01PM +0200, Krzysztof Kozlowski wrote:
> VBIF register range is 0x3000 long.  DisplayPort block has few too short
> ranges and misses four more address spaces.  Similarly first part of DSI
> space should be 0x300 long.
> 
> No practical impact, except when existing code is being re-used in new
> contributions.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,eliza-mdss.yaml        | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
