Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B813F342515
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 07:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063827; cv=none; b=f70tz+QD4PJFVp76dI8Y+sq//Ma9azp14WUnJzZWDPn3WzUhxVZkYP4i2ZN2ZKkkHD+IjZ90oQP3CjtRa+5hVLSh7r5kN1uN0YnRX/e06KArj34fKs2k4+e5Xi4BJKJJuEhkVlvuuU/it1PbDkSMy4UpSKGkkysxFcEhUfvj7f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063827; c=relaxed/simple;
	bh=NxIOBQqw4GdqqNxy+UV7RTjAVLmJJi/DZMe8MQDibEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MT/5uYVDYoMvron1WwinBHFStDlFyY5A/UYSQag7qXdAtk4EISeFTcLBPhU30WZ/JqEONSdIZeS+X5cbScgoYzMeNXU8rhrAYomHoHAePQp4ye1zBRL/SlM2v2694qesSXrG1i9ZwFXYPXxjO1iJ/WMIddPolnyvVyFKakoArZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0ct8c+B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VcUx6eIA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0ct8c+B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VcUx6eIA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6636gxuF3144230
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 07:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZbmjKhc7zOTfSEw06CDNOZpVsSHHj1w1jZrWO2sW5KE=; b=U0ct8c+B1MJi1uA0
	ClE0GxQezzCpIccuZz++Wn7yxkjl5c9H08TnNZ+ucENTp5SrvaFU3KJ3Y27mwPEw
	O9YI3ZMwmgaMooo53oXetMbeKI0rnx9ujFVgNeWpE3XD3Ckh1gQOlZwOQCVU5GJT
	voCxbbU7r9EqKIPHLkZSQv3N3wzuxyPLetnMmPatwCaH5wbCkyr9KvZVWRovF6Fn
	jifX+Ct9jqODj31Ql40pn785y8cdL5htgiKE8Wb/Byi69MPAYrNTWJH49mEyHA9n
	epIpjEjZswyS/EyCmfgGGEsZREdjS8EPYwtSnV8bTF32iLcPswu84Zt+b+t+/4DF
	TN5s/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682br69b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:30:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfd1772d8so634001cf.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 00:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783063825; x=1783668625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZbmjKhc7zOTfSEw06CDNOZpVsSHHj1w1jZrWO2sW5KE=;
        b=VcUx6eIA08TXZmZH2h1nH/ofW9LHXumLguI2BD5QRzvaB+6LUmtFU0LiHPH2638uds
         uQSvrtCq70WOJN1v+FQCP4WtoX9PDoOsrwblP6o65dIwdGJH+SlFihFvRFvTaWerIxZF
         pUzgtILor7PS03QxR8M2aZnazV2UhyI70v4PG3NGMk9Ddbb6wKq54AHlL8gUKSXac7Wy
         RH+Op9PbeXFNz2tXeGnhO9OcEe7SvetNvwPv28SCfxcQbCW1oY+IlAxm2rQwJ1mg7shW
         69NtlERU3RXAgdpMk95w+kN5oMU/C/yVTgIR1J2KiaXTcmFRfGHipm/hT8cOs5n9FGBp
         kAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783063825; x=1783668625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZbmjKhc7zOTfSEw06CDNOZpVsSHHj1w1jZrWO2sW5KE=;
        b=ek5cnhAuHfAfhkXOSG744P5M5j5LLYmJKIW3cSxHMaDcoE5jEyPMyOl7et9Iql/bMu
         Cwv6jkqKYvGwP6NhjltKmKyrjGGw25xsZkiCtxB2Bt+XOWPFCeZoq0Dz1ec8KQgPFn1B
         ciiGnULwpJuK0Xz5r/Yqnahg80oskbZ53X8JHJ6y2wnHMd2wmvoWkt0QdSjw/CtLxW7J
         OdWDSz9GiUGGeJH2cqQ6GAzMqX7xcgJKIa8jFqGx18E3mabmAsWguNaGlIGvAP7pA5bp
         hqROYO1JimPguud6yBkvx7/fanZBhPYajxedJMD8c/B5aRovwCpegj8ji0FIF4HcE3tg
         25Lg==
X-Forwarded-Encrypted: i=1; AFNElJ+vB0bipy3i5N2K8Ui0rcXEWDgYcrBMFCJINFHdFw24CYTe9D8H5OKFYXT1ak9ApOmmGOXa0UVbVfDX@vger.kernel.org
X-Gm-Message-State: AOJu0YxNsSS5QII/p17Lz78tFJCYlfilEAZRdzzr3ccPF9zHF698kOFv
	GVttZqgnJKfq+lQYKaZzN03J8prLwSjwyGOAVXV/C9jt4QxoBLANhdAxAgKNFFx7lGbyxW2prtF
	DL8ETekQ1jFTOI3cnaNEg8zNu6qAFtim9Z1X1SCF8s9JuAtCeJO6Q2s3oxpYl1osm
X-Gm-Gg: AfdE7cn5dtKEWnUx9JN5Q5a3HdN0JzyG1/UlVXRjKMV2pNCPW8hQYICRi+I30xXCxzt
	vxFXpYHb58W2ccUiUOdmQcV5730FYEbIqeuu5tmHdYcrGxmAMhYzvHQz1cWnLr9DsVw82KARozo
	fHH8iFyIOqm6NwOy2tYFEdwy2RTeqnu54n7CFiQ+BkdignqX02kEiyd65sRY3lzPvxOFgjEk60c
	CSRAtTkR9grLrS+41lMBMu/+V1czV5IOt98kJ+/pxnBXt+8igelr/Q/yN5BgCnNSQI+pmN/b45J
	yvODnCtucv5LTwD9vh605JGYTF+151yIgSCFEpcNqXcD4F53kJh4v5VD/EzDA0/BEQhhw+e7k1Z
	iHM9WT40Zq3FCE/X/BOvf+ELEbLJ8Ofuyovs=
X-Received: by 2002:a05:622a:487:b0:51a:8d32:f796 with SMTP id d75a77b69052e-51c2690658amr70423621cf.0.1783063824864;
        Fri, 03 Jul 2026 00:30:24 -0700 (PDT)
X-Received: by 2002:a05:622a:487:b0:51a:8d32:f796 with SMTP id d75a77b69052e-51c2690658amr70423371cf.0.1783063824331;
        Fri, 03 Jul 2026 00:30:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6095b7dsm239906366b.19.2026.07.03.00.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:30:23 -0700 (PDT)
Message-ID: <221133d2-758a-4dd0-90d4-ac3f3525ab42@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:30:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/19] clk: qcom: gpucc-qcm2290: Keep the critical
 clocks always-on from probe
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-14-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-14-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX4hnRxNBxCQsV
 3F0UQQ9gkfGE80qGCby5BWw6yAdsf+BzsrBqontmbqXClpfr5rKdH/cGM5rgPo/i0v7kzRuaSMl
 zX6D9g0QUiphGE5T8JqtaciY2jGgfB14Yb9N+GbrULGeOyKtVeOynZdklSppdNIHJdSgg6buZ3u
 8UtZzSHnDnIjEyoK2wCUu2ogUUMr+m24mVhpIyZg3OKTHEGvp1BEKDzoAVkST1wnL3HwiKMIbpT
 fufAUqtIGHceS+oJyJPh2r+Z1C/2BymTY4kbSE7EERbEk3l8ZQcL7EdC4cf+HdLLPKffWVhFHKP
 SvBa3MjChQE5dsqQzYanKycQPhOeJ4SH7Lnj17Re3f5HCb8q3Gy5KL1uPC6Wn2XlRW2wn0+SMwo
 LvnOyH8X4Hhvk/0a/VMM58s74argGa6cnnN+z+9MyQtDuOcH15lFPnPAWoFwyS1zFbCMBb/vE/O
 YdWA3AqP1ytlBhWJIiw==
X-Proofpoint-ORIG-GUID: Nnvf-FeMLuBvFr__-dQUIeDOA5xQLdoZ
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a476512 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GABpISGgAy3S5f3vv6IA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX0CMs1lbFlnrt
 gPNHcgHksxXLZUcd8XxuLq76pNeGYUBcVN0fJh+75ndCjjNND8T0ns2TtLdAuqTixR4tMmJCziL
 U0jO0eX1FwRHGNOCHGCBoiy5/bdpA/E=
X-Proofpoint-GUID: Nnvf-FeMLuBvFr__-dQUIeDOA5xQLdoZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030069

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Drop modelling of gpu_cc_ahb_clk and keep it always enabled from probe
> similar to other critical clocks, since marking it as CLK_IS_CRITICAL
> causes the clock framework to invoke clk_pm_runtime_get() during prepare,
> which prevents the associated power domains from collapsing.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
