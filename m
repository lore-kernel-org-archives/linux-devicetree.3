Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37C43955C1
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 10:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790417861; cv=none; b=UfK65o/Fn/BdxnsniO2o3hKLW1POGwdd/qZPUDIfsHbTYb5NB0S9yP0Sj58pBYMvDCSzRjwlIW/uEm/SNDMjtsgOh6ajoEk+btnOqCUF2V4fUuQ8Vr3tLp756ni9B7EE2d9nPUx9ImhKUBkRDiaDL0mecSXC/EzcCVnE/rzaDHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790417861; c=relaxed/simple;
	bh=X5RkfFFV+AFGSn9CszSlCjwY7JCl58Q1+kNw/V+fl6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5dcvOD4GOTNpIaAdtCQJl9FxoGm104bIaAh+ldSE8zNqheYpOwewPy+T+3WbLjmaT0/LJ6uH2MgjHhCsgVOYO25A6r6UpvFGCr36eYGo1dVJxZezMhnkxdVhF68hSnfIXAF5WpD+nzTZnUi2Tn871v3m2DdOP0qFCO9ycg+Abc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bAbvc5Ws; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZtOsahen; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bAbvc5Ws";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZtOsahen"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6Pd5P3138008
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 10:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nanmZGf34wh4kr/Za9LmBgqP
	zTlqkmiOre0C9JY9j+c=; b=bAbvc5Wse2DIxmoz0spnmNWm8lbLmLL1KM8ufTAc
	L+sb9GHNvokE34IXpoSE4zIZshJt5iTWdPtVsb/q9QHzmkDg06X0beWNVzyUv7PO
	4ayCxgMxAFaaoP7DkW6OmVxJh3f7/L0tmCvq6TRt+9j/TXyO9js2G/gk+EfsMirY
	vm9MWYLpay1rXMONBlWqQ9MxI3zbrw2KbiHJDk508HRz32ejo+jPJIREl2z7JxuS
	QTJ+2chb2680j+f+GFSRegSnQVx3f5se4GZO8j9f4gfC+Iy2uywO68xpngybEfOX
	q2tzAH4XBDDFN74M6ErtfNHZ7//5B1yqArRVd2ts9g0tjg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5cggqjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 10:17:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93be1861d2dso273545285a.3
        for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 03:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790417858; x=1791022658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nanmZGf34wh4kr/Za9LmBgqPzTlqkmiOre0C9JY9j+c=;
        b=ZtOsahenZdlTSArma0PszJ51pYca5s4V+O0ssmiaENFTCFs/O6BJmj1vsRwdbtbrGn
         k3Ew1zMIgjjKknvqYkkAK+10rc7peXklte3yj4FZoW4XhvmkaMU8ujD+lm0l1VR72xQj
         1cZfRS6sjBIX/pLZLKezHDDpyPrRFXkXg+38agiFI7OlWTfOvJw2B/7Xi7ATz5tnkroQ
         Ry9AejQwxFOllNqP1tg5ZEWauP/pOklgEkVCqKz2OeL0z4B32qF77hi7ZPR2zWSPgkIP
         5G7YuaD+8Yg3lq4A+6ZVKofb5AFd2Nx2vL57yV3qKTLdwBuS9IWHVeonDijmuJINThwB
         SXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790417858; x=1791022658;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nanmZGf34wh4kr/Za9LmBgqPzTlqkmiOre0C9JY9j+c=;
        b=bX4A/mfxzB9iCqYPFGYNp3Nrmz9fjR3UCFMnwm6zv8jJJKPAaMZ6Vjj2ON8y9JLAOF
         R7P4/LUUc8ybDefFRVKO7n8670SabUPspFWPTbkX5EAzjkOAc/QC3BbP5iOUr585CyWy
         rZCRfNpGy/Rmgng4bnn3cnJCo+vN3OwP0YRVv45X+1PejM4JzCyhvYuH2um9betQKeJJ
         HOD7H+tc6GCSPN6WUC7Lnybs2AQCvqciSSRqpUT97abW7ecjDU5vEpB5rQvSEK+MVe18
         5VoDd6a9rIDP9BA36PjCdSpigPYSDtNszNcyYvPncj61kmNuORAAnh5WIa/LhccxQv7W
         69dg==
X-Forwarded-Encrypted: i=1; AKwUvBzF3KdlNwMZtUqlE05PH4YFI/6+xfIj5kwwF4SGo4xS47kTx4YDfSoABJ4aFdUL7mKHsegPxXNNyRF2@vger.kernel.org
X-Gm-Message-State: AFuF++n9upqYeUciCjjIZ6H0afLSO+FHuTZKfXM6D/ZesCAV+Ou+EKX3
	Cb3Ddv76NqJVlBS6lXI9u8ve22gLhR+xNUW8JIo3CLnEasIqTSBaE2YkxKSrfI577pCvMC/raQ6
	KZuIpox97WjicJmatNSW8pReWMOG+iIxeoLDSBodTptI1chwxEco7U5uGJI+tvLAl
X-Gm-Gg: AYBFou3d8h6YZ6Dkp3uqvBkCNOxqOQHBrkm0x436g4+7Rq8HoVrB9+6VRhzaH1i6yh7
	7DqR/bLNL8rdMzKQI1vehk6cAXNN1cX1p/UVWdfnpCQfWasFQY2GnapLZr5MVP5WvIfxyipgGaQ
	b01ZtqUZzjpBwqXhUZoLQmzfPUj3+Yk8FZpnDg5gKPdYa01l5K6IP9u7nIK0R3V6G/uFEtD6lSy
	TD+V7l6kaHsx7zrTc0oYn22PtvxlhI1cJein8DuAIh14azE+ifmxayDLW8W7QX9SfkfWRhfiAPm
	LA3sZfjWxJdtXITFHpiHpVJOEbqDDzYH4m16MWa61KH7PMUrlYcoD+74IAEeF4e2BBpuRfmAWQT
	CPsruJiCVoBZQeh0=
X-Received: by 2002:a05:620a:471f:b0:93b:d7a3:45d4 with SMTP id af79cd13be357-93c43d75b49mr972630485a.61.1790417857608;
        Sat, 26 Sep 2026 03:17:37 -0700 (PDT)
X-Received: by 2002:a05:620a:471f:b0:93b:d7a3:45d4 with SMTP id af79cd13be357-93c43d75b49mr972626785a.61.1790417857053;
        Sat, 26 Sep 2026 03:17:37 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a76fsm13579679f8f.7.2026.09.26.03.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 03:17:36 -0700 (PDT)
Date: Sat, 26 Sep 2026 13:17:34 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Liviu Nicoara <lnicoara@thinkoid.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: add the
 front camera
Message-ID: <qmc4prmummwwwel4zukqh5fy6jy2f6qke3ygdnv6a7ygvsowkq@gtmznsipiyhb>
References: <20260925181024.20352-1-lnicoara@thinkoid.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925181024.20352-1-lnicoara@thinkoid.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA0MCBTYWx0ZWRfX1QmhWbGdbtkF
 1yqfc+4+dVYUm9ikz8djHRSWgMRuxcu6lYze/LsTPZznJH1uMWpNHIpmJRhZgmy5+ExiOB66/c0
 430fXYD5rYXCD7jfdcLn1xGEGSTm3TXTYKxdGh1tmKHEMRVLIo7NlS/XAJy/RUTUY0TO7YrEt5E
 awgkVYkaKIfkytlb3+vthB3+8PrCEZZLbrfVV6HuaLqyasi448QEkdW28UyTdFpANTNjUrfcFz8
 O9+VFqf1iL7wNdzSz3pTL9tlcU4DB7pBJpzgJbn0B5qFu4UyibiUqOC4l0uyKwARA7wyXKiFhPe
 CwtOstV95pco8DZn46dmr1T1D+OY7dte62HryUUlqNzKgoF3oartTP+ycTXI00M8TnLmn7h7Q+q
 EOfX1hTfgrMt4aY1jqSB+e/a008hJgU3PjWuPr/c2prGkKYIfNs046JOTPaRoqNimNx24K+Dp+7
 c3EYJzLMv9fLHsidq9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA0MCBTYWx0ZWRfXxK08QpK6KPW8
 Fm6x29dKe6QOI//UwWDWljaG7mMDg/QV+GdnKlPc86TCiY8DeU0eZaMkx0/GsW7SDAjzZvZMMaa
 yD6zzxfM9nWKfEiV6MBmcva+FDJrMDk=
X-Proofpoint-GUID: EjTd0zHFJaN0leEK9mS1-3fJOhJLrnjY
X-Authority-Analysis: v=2.4 cv=QvLLTlyd c=1 sm=1 tr=0 ts=6ab79bc2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KOsBq0R2AAAA:8 a=iu6A6uHwReXJ_BGCYJYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=p7IlednmDx7li90OXeev:22
X-Proofpoint-ORIG-GUID: EjTd0zHFJaN0leEK9mS1-3fJOhJLrnjY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260040

On 26-09-25 14:10:24, Liviu Nicoara wrote:
> Describe the OV02C10 front camera on CCI1 bus 1 at 0x36, fed by MCLK4
> at 19.2 MHz into CSIPHY4 over two D-PHY lanes at 400 MHz, the only
> link frequency the ov02c10 driver offers.
> 
> The wiring comes from the Windows driver store. CAMF_RES_QRD.bin
> switches a single rail, GPIO 91, before releasing reset on GPIO 237;
> GPIOs 235 and 236 are muxed to aon_cci there, the CCI1 bus 1 pins, not
> rail enables. No camera resource file votes a PMIC rail for the
> sensor, so avdd and dvdd are left out and fall to dummy regulators.
> The CSI PHY file votes LDO1_C at 1.2 V and LDO2_C at 0.88 V for the
> PHYs, which is vdda-1p2 and vdda-0p9 here, as on the Inspiron 14 Plus.
> MCLK drive strength is 2 mA, as CAMP_RES_QRD.bin programs GPIO 100,
> and tested streaming.
> 
> The module sits upside down in the lid: with both sensor flips on, the
> picture is upright and unmirrored, so rotation is 180.
> 
> The white camera indicator on GPIO 110 becomes the sensor's privacy LED,
> so the V4L2 core lights it while the sensor streams and takes it away
> from sysfs; the comment waiting for a "camera on" trigger goes.
> 
> Depends on the x1e80100 camera DT series (v7), and on the CAMSS PHY API
> patches (v20 5/6 and 6/6), which read the CAMSS endpoint's data-lanes
> as 1-based.

This shouldn't be part of the commit message. Drop it.

> 
> Assisted-by: LLM
> Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>

At some point, there was a patch from Laurentiu Tudor, but I cannot find
that patch on the mailing list, so I guess you sent it first.
