Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795410618;
	b=MjTt4GVKdZ2NjeQy1zy12aBAsoDaBDPXTfLd4DbxuFXBj5nvClIC6/UWnF9Mrkkt1O9j
	 TeYwirJe6X4UeQKimMQlJl1nqz2AS7fnSq758Y5LM53E0mpQiDPsfvE+WK8BaIBs0m2EE
	 xr3GDnxtfnUtPh0QFieYuiLSb117fRyPnVY06c8LNdGTFSeF8awFqqXClNyx9gpgqmlU5
	 35DtTu1i5LvLj6GkTv97nUCodHZup3Sbc8/M1gztdGCnagnoCe4J8tBN4PkawbP2foCFs
	 YDDN0sV5EhHY2xi5gjly9LT5tENWuV/Jyz9Y9yzdPy1X7IigyUH5acNMqqum+cBD28g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795410618;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dcTKXulzRQhqk7SHUdDgxKTnOqSUNRHcerQerqP9It0=;
	b=tqMDH/X+4BKrI+5dJBVqgsBCHnQtpPfsYRFFZY6/EmtFgSAjuyfmY2yfHjJe4J3Wpekj
	 CwjVJlWq+qYOQJ5vyS6ZwpbLk6VtESTLao38c2uMR+Dwyf88JCBlepxHJ6lPT5pZdIAnN
	 RiaZmRp4/M9KMbJ31nLyiLJiyCbPJ/NsjFaccy1JU0q6OlLQsvcZXq8jdoBEVcU5+ff9t
	 Y52DgbVUOjL4+UefgeIZD+x1jbZOI8kfXXQ+EwynBKkFUX5GEPPq4OgR6prxSbNCiv/99
	 7SCbeAQfTu3D20MJfdPYg52TjXNN3GJtRafzGzpwl58wY2e/1IfqpENfl5JbN+DMUTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="i1VWQW/Q";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="GQD/TldO";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2447606A31F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2447606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i1VWQW/Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GQD/TldO
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN51Vq72924768
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcTKXulzRQhqk7SHUdDgxKTnOqSUNRHcerQerqP9It0=; b=i1VWQW/QBB1gv1A8
	RKIwklZmxhkyOWOs8cD3B9huo+JZl9t4+nHGhd4M5waCSTsomMijeTRaTIxQgwL2
	PHSMb+DJ+ZkUWmUMAEfIk6bqA8r7suirhjMCGQoCJfjwt0yCi5dIwF2PLrn4QiWX
	PNM0Ln+DKiXOdxRcTlkj0b2HXBunuTGDEL2+r3PY2q+U9Gu4sQ8DGz7IxDhEj/X9
	3XDWjA/C0mKXyF0nVeplx/Gis8kEBDbTXgEBn2JwWgZjPZkUexJH9RBWeqhNfPiw
	qGbnQn+LQyrgCGIOWqdw7a74ffYpNMwW/Yuq3LQurRjIXmHvG7VjFhFWuzo3PtfD
	3rOz3Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsg17u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:10:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so2380833a91.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 21:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795410616; x=1796015416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcTKXulzRQhqk7SHUdDgxKTnOqSUNRHcerQerqP9It0=;
        b=GQD/TldO7irpuOVoV+abuYYVJNO+zzMhyKjO3MkcAVnMexlGFNwQ9IMSWjeJAoiOJS
         S6tSOarR/xP5K8C9vx3bAI1r3UMYa6TNYDR93BKHTD+G1ZUV+c/xZmLCDX5A4DWX8VUp
         yipI0A1TL+O7pDFys96UCfqJPAntYbOleRiD3wJ7lOC0D33QQ4tFXEniRYXn4cAbZytl
         aFwv1PT+LX65Ckjs12NUjRP54GVlhQrqcI7uKzMA4c+2svuyhmYBKjMTZ2y4SgLrg3Sz
         D6gFPvag51NF8CgMGyhRyo0uCQIWKE1S499FIVz8t/kuEgeDSQOSLv73jrEO4/b3bRsF
         PDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795410616; x=1796015416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcTKXulzRQhqk7SHUdDgxKTnOqSUNRHcerQerqP9It0=;
        b=WUJy5WeB6A/PPTz6z0xiQeEpvEaVkIF2AlrWJfc+YxaEViPcqtWagrVS50fSQcycNH
         NqiZc/xo+v1jj3xeqz37bJdbQLAbHnz52craVZODke1rBTKQ289uzGMPVeADwQjo41ix
         pJWXAMIrWHnvxVuxkPpX86ShX3moYafv/t9IV4487f/LzmGshkmB/mFntfTvpF64v5uH
         SScqjmmeQQnp68Q287ohHZ+t6Sug+qRLDg5z9opqYQ9AKTcGBgVXH88WFvvm3tW05bu7
         uC4ceFZyp+E4RPmIl7tik+4Oi01XO40+Sf9PwxXnN1MhJ7d/sv0Ga2rgFIBAH4Ouelm7
         hgAw==
X-Forwarded-Encrypted: i=1; AL+hErEmjK6p6GwNgbO6QBbLjNDwelo0Ybgb0Y5L46nADwD9SWoliDqDQUEM9ws2jHQYYQzhBpFISmvejp9d@vger.kernel.org
X-Gm-Message-State: APuU4Z8dduBedt2lpaHw5uJh53I+W1YEOvxcIutz7D5tzhaO1c67CbYC
	mI8ilDeYSIBPGwp9KOOxzTaIxlmsizYFe5H51YHqJCOT0r9C3UhOFbidUi4yITCpvKSjxNKuQDy
	i9jhRDUZes2/q5F0mIQyq1ZwO4jCw/QePiK/NGiha+dk4u3SG2qwD0Rbzj/SB5N6a
X-Gm-Gg: AZFdTZePjP830CEPfKxS3H2K5VR2OwLUvurN77XzbQE1NQ4l5GClkX8yEloQeWPcqDQ
	HCpvxqdgO6QbcdhCeQBpo+A3Arx34QdcMgZ1LWXa9mesMe8cwAyuru2kNHv7/DroWvT3EDOdaQb
	qW7rpFCOw0zEVTiBbFon7odbZmnWi2sEyronwqLiUqsJ/rirwfI5/M4LgKKjWDZ9W/i5LWv604a
	PzANWiWB+9AK99uKhr2cdghlAchOo8MRTbFEbWeFtCAfNwE7AvYhq3t4WFIyPFMW6PglyiveHb0
	SQyh0CvGc7DrVpkrCfdRZl6sBl+x+QqKpuM6b5b7V9X1OzdQrlFVNlpH3YQZl/qX0PpSoBswlLW
	bKaamCt6DfV6WrHIXqjFCVGnYQY0A/x829roXNJ2DmFqihGiaUI+1vXHOcypt72tN3ST2Hbz2sb
	8Gxxa+3Bd1JOw6eFm8G2Ix5EeZloTkrQQMLQ6k9WH/iRf8
X-Received: by 2002:a05:6a20:a108:b0:3ed:bfd2:7e36 with SMTP id adf61e73a8af0-4014bb52e75mr11192647637.29.1795410615636;
        Sun, 22 Nov 2026 21:10:15 -0800 (PST)
X-Received: by 2002:a05:6a20:a108:b0:3ed:bfd2:7e36 with SMTP id adf61e73a8af0-4014bb52e75mr11192629637.29.1795410615177;
        Sun, 22 Nov 2026 21:10:15 -0800 (PST)
Received: from [10.133.33.103] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e456a7sm4841567b3a.29.2026.11.22.21.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:10:14 -0800 (PST)
Message-ID: <07a533cc-80e4-44c5-89c9-8b94b0a255b2@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 13:10:09 +0800
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
Subject: Re: [PATCH v3 0/9] cpufreq: tegra194: add Tegra264 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sumit Gupta <sumitg@nvidia.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bbasu@nvidia.com, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261119111217.902071-1-sumitg@nvidia.com>
 <2698e091-17e9-4a1d-acf1-19981ee604da@oss.qualcomm.com>
 <20261122-elfish-amusing-muskox-d6cdef@quoll>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261122-elfish-amusing-muskox-d6cdef@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b03cab8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=K9XYs0MPe4wYk6c9fc0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: EerdfsEOxT_uGfZAPeC8X2hzovAvV1TU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMCBTYWx0ZWRfX5aU7CUvselLX
 Njg/W7fVveC+T9M2gd2vEMgcArCmYXId/Jg970TDM1WgBbL4VNrSzuRGinG093UoHDQyVWZ8xqN
 4vFUsGgO8Ok1BfYEkgJeYFJMlfwdq0uDU6AWXsb+Whmu4FpxbjZ6zkyPoLb3p4v+RJK8ZNOdSWa
 Qr2/We1unWNlq/N2fy5DAXd3o4kVTyfR3pPIsxk8I+7YUxzB8uLKSrDx165FbytjUQ8DEqRrEEH
 65yX41xcoPFLcBOae9zhj23tbxNXSRA5yBinp8XFZj6PtytKHfQuHetvY2DnBhCW4ofUrCHlcaW
 YaTimYoJTJDECcHnCN4twysaqnxeOxMzhrl5X4rVgfAwhoImNNbh7ubbpaeYF/T0UKB+KDasmkn
 4I/rQejggoqhhkX/yrd8DCZrBKp2iByF7KLg++ObDPX6gmOTcsYtNSxaG4OKbfL5iDqAMnRrjPA
 EcwmjDMs0v4GQndJ6kA==
X-Proofpoint-GUID: EerdfsEOxT_uGfZAPeC8X2hzovAvV1TU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMCBTYWx0ZWRfXy9JIew+IH+6c
 V0f/xnjMGJ7KVeuWpXTJQfUyTu5wC4tFFo8/7NIQa2xMpPmmBC/chQvPFG/1BSkfmzU43I8mym8
 mAZ20tVhI20Ze/mbrVB4f2PykT/WzyQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230020

On 11/23/2026 12:53 AM, Krzysztof Kozlowski wrote:
> On Thu, Nov 19, 2026 at 07:41:34PM +0800, Zhongqiu Han wrote:
>> On 11/19/2026 7:12 PM, Sumit Gupta wrote:
>>> This series adds cpufreq support for Tegra264, which joins the SoCs
>>> already supported by the tegra194-cpufreq driver.
>>>
>>> Tegra264 keeps the existing model, where BPMP provides the NDIV limits.
>>> The driver derives the current frequency from the core clock and
>>> reference counters.
>>>
>>> The main differences are:
>>>    - Frequency read: through system registers, as on Tegra194, but from
>>>      the 64-bit architected AMU counters. The reference counter ticks at
>>>      the system counter rate (CNTFRQ).
>>>
>>>    - Frequency request: through MMIO, as on Tegra234. The driver writes
>>>      NDIV to a core_freq_req register in the CCPLEX register space. Each
>>>      register controls a clock shared by two single-CPU clusters, so both
>>>      CPUs form one cpufreq policy.
>>>
>>> The patches fall into four groups:
>>>    - Fix (patch 1): read each CPU's MPIDR from a CPU hotplug callback
>>>      instead of at probe. A CPU that is offline at probe then also gets
>>>      valid cluster and core IDs.
>>>
>>>    - Preparation (patches 2 to 5): cleanups, mostly of the counter code,
>>>      to make room for a 64-bit counter and for an MMIO mapping without
>>>      ACTMON counters.
>>>
>>>    - Improvement (patches 6 and 7): group CPUs by the generic
>>>      "performance-domains" property, which cluster-based grouping cannot
>>>      express on Tegra264. Device trees without it keep the existing
>>>      grouping.
>>>
>>>    - Tegra264 support (patches 8 and 9): the driver support, followed by
>>>      the device tree changes it relies on.
>>>
>>> v2[2] -> v3:
>>>    - Patch 8: read the AMU counters with interrupts disabled (Zhongqiu).
>>>    - Add Reviewed-by from Zhongqiu to patches 1-7 and 9.
>>
>> For patch 8/9:
>>
>> Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
> 
> Why you cannot respond to specific patch? Tags applied to cover letter
> work completely different!

Hi Krzysztof,

Thanks for pointing this out. I’ll reply to the individual patches with
the Reviewed-by tags in future reviews.


> 
> Best regards,
> Krzysztof
> 


-- 
Thx and BRs,
Zhongqiu Han
