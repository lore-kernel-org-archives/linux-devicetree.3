Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974144;
	b=dKDXY9rB1dYJyfCN28zGQi4H5j6gsj585QWqi5yPq2LtG7/UQpM2/hcTZ+oNhE/UonET
	 WCTR9cQ4WpZDlno+uWhskaADeRw1iuRpd5OJk6ad+YE7ASUCd4bKCuPfAEurh0mqcpC6e
	 IBzrEHhgakZ4kh6MbmEznoVBd9hxqMIUc6T9g31VlnTiZZppzqGtybANGzOsq+SVDRwve
	 px+C2B/NiI4cyMNSFDz4CH0yM0Je9JXlfQSNZbIgPwUEh8yWOb3h7ANGD0O5PgHmmcVuE
	 JnmT/Q6OnEBwY6zq0+hS5AFq7ff0xBb3RPUmmlwq1Ld0LEwVFsYLkuidHrDFKOoSDHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974144;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=siGlkVwFK+kAlmr7HRrTxVX0dPih8LkYmQDCGq/74C0=;
	b=13BPHQBv8fFRqQd/prQR+pmzvJgHu5aKvE8WjSXb5JFx7nq7VPE0R2GdkkG4IlQGYQO7
	 rVnbu1x0zZpBclrmLIRDGda37PoRbMVTqm0WPz9KehYGBFaCmgROq5bcwBjMn5FRz0jiK
	 kKAP1yy6/Bd/+e5Y4Euk8jdVH63EDyYLHsrh+Zg1n3klPniwJr4YqBG/d8ez78aRYi3v/
	 rTnMbhbQRnjmZSUGpfpJ5n2J05ZLPaJ8RgngQ8vJwjSMKf3CJcoZSliUamwwPxbgOvsJB
	 5WIiP1W70fIyYHFi+DTKNImw/vIzXuHdp0JIhcGjya2dgHlj/gId6ZSh4mCiQJwE3aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mW2vvBmq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jDNucIe0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78173606A330
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78173606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mW2vvBmq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jDNucIe0
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UxMv2453598
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	siGlkVwFK+kAlmr7HRrTxVX0dPih8LkYmQDCGq/74C0=; b=mW2vvBmqHXZC7iwZ
	fezB4fqyW34Rb4e9IE9D5A9AraL3KfwTeC8T9IwN96u/QDDVP7O9y3QCYVPengej
	0W22Sk6b5JsbeeN/Jd+zE4VPYPpaP33H90fl4xXhwpEhWX18GXjI1RUmDl/rclLI
	K5t1eoPlJ6LIbbugOw6SbRiW/EngOrI4XBLQjbJyuJZsOs1YmMWWY3f5cJmjlPqc
	DB6vHoNI9ATbd7aKZJxkxto+4iHl9Mg6tVNbHgX+JTixGOF43k6ArOZWc0xJYbiX
	4KmWVB0ryp0w87w+nqS2b2WK6tqtdVRwPac4APgZIYd1zk8ykk4rnUWSUDanYH2t
	PBL6xQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv992f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:55:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b930598cf0so694956b3a.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794974141; x=1795578941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=siGlkVwFK+kAlmr7HRrTxVX0dPih8LkYmQDCGq/74C0=;
        b=jDNucIe0Udqg1nARcSW2RLa+XuYo8RPY8jjXFiwryZgpV/O7RETf7nZBQamL1b+rR+
         Oz+jCbms4BBSwkXUfUdI3m2OPNf6v9F1B9o5qBmM3+Y5ZEEpIJxfBL2V86XEQ2AO7tks
         I3G5Ju2u+p8Zcp0KvfMt1/ZVXyObuc8ensJzCghTvfnU7ZbO+Of+X7p+H7X6xY5k81b4
         wQ+mDS2pFDgRIEGK5het4rP03FQJLlZu7OeSIZnjGxQRl+zNJQkh645azaaYx9NDp/f7
         tSUlTgXUvFE4q4EAxaW706Xos72wEpJfUVJd5C8HefQS9jNb1a0PpuXbyFOTNAAGoNm1
         35bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974141; x=1795578941;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=siGlkVwFK+kAlmr7HRrTxVX0dPih8LkYmQDCGq/74C0=;
        b=lQ27gdXXFPmlhRAtef8Oi5Y+5ft2Fy96Arm1AbtZ5mt2d2nOUo4YcjLl+o9TPxXzhE
         8yDGhk8LHqmp6/69rWOtzgaHtY5Mjk1OB4eH558aasQHWlYTylNUMxofCktUl2i2rJ4t
         30EW66yJwBWb3++HNoxpxe0/wr2dGFvYZnwmu8Loa+SJBCK4bcPRrn9Th5IDFhKnjoBZ
         6Qpno45Jiq2ouzZlBbtLUz3tITC+6w6Zhq+k1WBIaMyWpAtAs74HrCpkAXswa1CAxSEx
         s9v/coRSjFbpXkDbkGZWP95/UbzSKMc0eJtvMm7Iyy/EUc76GwwlbaeCoXX0lJy88G6+
         sTow==
X-Forwarded-Encrypted: i=1; AL+hErGvA73TPZI/+sUSvD+BK/YFwXSkz0IZNUQ3Yz7uTN4gQG7n6dtUvmomJZPFYm3HPZUeH2BL9vtC94nN@vger.kernel.org
X-Gm-Message-State: APuU4Z/NsbL/eNkH2oJUtkWODrSYLM1xo/DXTZ0ISZF5BH+sLmSuy9Oa
	BDIqwRI3o1fo9IW3pXqQcG29gKiX/w1cZ7K233wDbgEoSxAk9o9PZpBxVhwMa2roQ+vlG4CV7h/
	ns3r6cGZWXv3bWdu9AIoCY15a39X2xNHObHRLni8oq1ik2qg3tqBYqTJDf7HJMazt
X-Gm-Gg: AYBFou0rblcxImsStlICuGcCfb9jXeELmoUWdXchLn+mu++R0OkPrOdsVWPim6zg3XJ
	1HhiZQ3wGkaROi90k93nVQVOTG8hDqc+rcu0vzCgCywpccKCk/lrX0LxVBls5ZaqN8dVauTGbG+
	1oNluWfS1udJ4iW6JBjHAPaN6a6Zr0LWHOcH0hvQ/gNJxfdI0yFlYZ6SahQtST1+A6Ldkda7vgm
	mro+cgPM6dJ4a+X6qHpufVt/mblMb8SS3P6YbIJagtGUHPdbOWgjC8bRSZbAL9lThyF0AxMQ+0/
	z1CIkg9gd0wV2QqPqG0x+Q3d/uaEnvnsolDLpk7akp8SOhEoF2WEr9ukOAQ+KVl96b05U8bmvpU
	ihDnQFLOJD4i5eaIqVnw8kk9wfqc2p9X4Y9SHDDj5yTs/X5cV0yNwhK/kzyIXkR4HGVhpe5cWrM
	4K+07NURj/674UI21LoW3C2rlXknm055CcNApBt/PK1ro=
X-Received: by 2002:a05:6a00:418d:b0:892:e080:4edb with SMTP id d2e1a72fcca58-8c5d55957d2mr1107245b3a.60.1794974141376;
        Tue, 17 Nov 2026 19:55:41 -0800 (PST)
X-Received: by 2002:a05:6a00:418d:b0:892:e080:4edb with SMTP id d2e1a72fcca58-8c5d55957d2mr1107218b3a.60.1794974140866;
        Tue, 17 Nov 2026 19:55:40 -0800 (PST)
Received: from [10.133.33.86] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5c7f99fe0sm421351b3a.7.2026.11.17.19.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 19:55:40 -0800 (PST)
Message-ID: <77166c44-71fa-4e28-9399-3f7c4b8b999b@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:55:36 +0800
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
Subject: Re: [PATCH v2 0/9] cpufreq: tegra194: add Tegra264 support
To: Sumit Gupta <sumitg@nvidia.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: bbasu@nvidia.com, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261117154954.625126-1-sumitg@nvidia.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261117154954.625126-1-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNSBTYWx0ZWRfX2ET40WRTp2Nm
 Hx8ACLF5mPsrSJuzkG7ZzQLKKwmPFcqLk/bHOKfMozy8jHXajyXM3Osk1nEXjXgx8MsWTX13uCH
 K6E3w1WyuF4WXnP38h6wZYJ956Wt/5U=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd21be cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bIqCZTYioKoOuvliMVYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNSBTYWx0ZWRfXwnyIanLm3cJ4
 hbb7hhs0AHxSuzbifMHcZenH2Vie27hmSx2iRpE+KvqU9+8Ld9IFAotz0K7itDiweIW+U4bfvAl
 D0DVakR/3dO8jNBFZjyQe3kdTkdgqAACz92AFZK711mKs/TZoVsr3xcWqm1Zc/XY3m6vkCZrmak
 fMcS7APck3+4E8ekqnu1wHXr460a/wCtwSPnBb07Yk13kJZ0UHGdrT9c+CuyR04ZABdF86pNwpX
 vrNkQy8NGpHGtWnsSaw00avKKc2iYj8wyB9dE7H8z7Om6aeMs14e5dgj+mdStvSk1tQ2qFWNP8v
 faWNAaGrHB+VG9I+UqhaLs856d87bI+2U9tphaJt/2fFi1W80p4h3Bcyg2IukQkIhXFnxqq8UT3
 dsXpAnsH1uvKcfdCvCqN7ZuC0ovPNm7gcyfVWe3DDY5dS+NR+Y7SBysbqjUtjrVHQqhTRNe5qew
 ODz0wcJe6MZf3/JYLaw==
X-Proofpoint-ORIG-GUID: Ub_QJx8Qv819Zdl0zXl42vFKsRgn6kT8
X-Proofpoint-GUID: Ub_QJx8Qv819Zdl0zXl42vFKsRgn6kT8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180015

On 11/17/2026 11:49 PM, Sumit Gupta wrote:
> This series adds cpufreq support for Tegra264, which joins the SoCs
> already supported by the tegra194-cpufreq driver.
> 
> Tegra264 keeps the existing model, where BPMP provides the NDIV limits.
> The driver derives the current frequency from the core clock and
> reference counters.
> 
> The main differences are:
>   - Frequency read: through system registers, as on Tegra194, but from
>     the 64-bit architected AMU counters. The reference counter ticks at
>     the system counter rate (CNTFRQ).


Hi Sumit,

Thanks for the update. All my v1 comments are addressed.

For patches 1-7 and 9:

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

I left one comment on patch 8: the two AMU counters (core and constant)
are read separately in a kworker with interrupts enabled, so an
interrupt or preemption between the reads can skew the computed
frequency. Please have a look.


-- 
Thx and BRs,
Zhongqiu Han
