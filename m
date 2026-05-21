Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8297D22D4C3
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350775; cv=none; b=gmEBtr/Fq+MtaUlXHqkxecjD7XTfrosevQj6Ca99a8p1RM+/DLC4EkB12nYfBZMjzjdDAiiV+SsrWfwoeTBktZR1z1bwm+McyIDdb2fYG/Htlx+qhST1YWAQAdnjBED7QloaOucue0ZNFcs4/oMVI1x1IdBhaTS6TrsyO+hiGmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350775; c=relaxed/simple;
	bh=nZvRi9nGtgc8UbolhfDcq+EKM61hTa9t4ibifzm+CMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K9la1LUXdeGWrRCh0QlStaKZiuvwN0zg13pdKXvGJLqmrChTBXX+9ZsyNoDTLfl1SyNELiv61X8jCqHTnabUjdLPUZHGHDt7naGOpGEHfpoyfNNUNX5DzlUr/J12pR/mgMeXPeu6PIqqDwbOKBj5e1tgxC+Qd/ZAphspXUglVVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hkOPJh2D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QESG3y5R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkOPJh2D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QESG3y5R"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6mIJG1798612
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xA5Jyd0bE4CSTeCJfYza5be9s1I2J/vjj3CgcVwjj4w=; b=hkOPJh2DBHih4+gT
	8AysJEmhoBwEzbEieDlbGDJyNEjZf/G9m5v6JZD+tSTbmKMX7osyV4NdoJOTle3Y
	EHo4YDkxu+d84bqyewXSg4hrMrPMHaHdCnNLTNd0tHnPi3NiAR3ojQmbVCw2x6Mx
	RWPCAbxj2C4sv1pCkV0W/A1OuJM9yGiWXVWUzPEurAtqm8GlhrTXSHe9d/hYzNhY
	w6FH7Y60RJs5aI0+cRMSMtKdab8Sfx5zRTE3ZLc+ugNxHjM342td1xHq4t/dzX4o
	u22N7w3v+oYpL/GZF1Sbcx0EdGhFYMf1zl9NgldEqS2yC4XCM/Rv6EFELupD8oFK
	FRVJZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu3w44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:06:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90d102884f5so144198185a.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779350772; x=1779955572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xA5Jyd0bE4CSTeCJfYza5be9s1I2J/vjj3CgcVwjj4w=;
        b=QESG3y5RDk5XfBKhsUwMoz6PIt1QCuqRoFoJijGXWukKoqEyXfzLjFV6pSuFjRBHLg
         6anBuP0hs4Pbl++L44kpHXOpIoWhoFy89ttyeXU9JICdf9pAbWPtAtlOZbwQ51u2SQkg
         uv9ObnQTlyTPhD1M19ZRFjNNOah+AQe7BBXH89rKUR+q8QV5sdZLxBgb7KdabCCzPtIc
         wsrW7rO3D52L6ty2IAp0HnMVzy/BHEn6PRTyXtJKMNfoMyxssyqKSddKppbRe1pCVU40
         fSm+O5/KBpTHFiG3hlaaloCbpz+ET71rnCOd+egS0Qxz1JDTYohwRHDlY9u15EzHCjzb
         skHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350772; x=1779955572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xA5Jyd0bE4CSTeCJfYza5be9s1I2J/vjj3CgcVwjj4w=;
        b=qTTYu+O0C+0p926C1D6oq9OH0S4mQuumrzHEUCkGT5NNyIeQ8VtDgTEuK2OIg9y/Vi
         ogdkRituBmwau8rkp4mocRjcbPcIU7c2QosGCcgImiIMGSJzX4BkbvblkqP7Fe8gjA5G
         0lzDpaK5ZUEH2b1MsPkCjn0RblkZU7uViue6xeKUaNM6qh64QMPnscAmTlzuB7++ny/X
         Z2IdwCdUsj4MCc9R+azMS3VRDnhDNwqSbX4bZ1o1BX7+2+elVJeGXwekH/OHYBf/A+RV
         7D8A2RmCDLiDlzOiM+9Z3IW61xzR1PPoJMyvO3GGSJnB4tRgWpvsOl5fZXvMcXhLVPnU
         SwOg==
X-Forwarded-Encrypted: i=1; AFNElJ+PDKErTDjhA3bOV5Hx/V+y4ivDBSUQtTOnJRCt2MfA6IuLcy6Qz7LDDNESHjOlsHuyRWt4Dt6TuqFB@vger.kernel.org
X-Gm-Message-State: AOJu0YwC8fi6M/2u5zDB3dMf8kZqI6FkdERr5nV4XjJdlaRrzxmC3AzF
	NSS6sdILpLqzy83DoFrAEQnYjs8/MmMoJG2cewsB/7f2YaGRs6fpk+ravFLXIVQ3tJokx1KymMO
	LWXnUOikWHPKO9NR+0Db2ukaGdRaRqzw2HU/JFbo77WyXRYkXRLgMciDOJZuztXjd
X-Gm-Gg: Acq92OGQzqzFU4b4xLHgkHEiBJ5PaBGdzlFb3iGcFeo4cPD2QPdxsNywLwSWuottHlY
	PJZKbSlj0p4PQZNzVwamrDBS6+t3n/NEBi5nHFqsxbCm68xCWlXYayMNkEPPILB2p/YtqiCmNcu
	SQG5K8yCQZGEI8rutNZXl1pmbwr7qIfO2GAL78/rwhEZPHEwFH1Hy3xHO/S5wLjADomzLPUUGQD
	B9tYYpMbhemI+EspAbAy2JIE1/M4AjNL5uLtu2jmzlTlH3bEzyA7OE0DCwDKxPXTdG+WFfWr2P3
	ygE2PXovzKqVTIgXNTV0V58R8dcHDQcKXhgM/P+dNelAhUnTtW/r5v2ZHLhF2IuTxfZVqfZEHTg
	8PgEwbTc3tAU5bw5EPMhTig+mAwuPm1LS3bz0LIeDgh17a4k7JPHDk7kvXHvdARjjScVOD3Y68K
	/jOv7twkxiY7qBDA==
X-Received: by 2002:a05:620a:d95:b0:8d7:3f45:b95c with SMTP id af79cd13be357-914a2a33041mr152268185a.2.1779350771781;
        Thu, 21 May 2026 01:06:11 -0700 (PDT)
X-Received: by 2002:a05:620a:d95:b0:8d7:3f45:b95c with SMTP id af79cd13be357-914a2a33041mr152266185a.2.1779350771340;
        Thu, 21 May 2026 01:06:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc87890b23sm13584366b.9.2026.05.21.01.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:06:10 -0700 (PDT)
Message-ID: <209c8586-ca93-4105-9f55-8a3e3464624b@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:06:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Remove sa8775p-ride board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
References: <20260520141457.988130-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520141457.988130-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA3OCBTYWx0ZWRfXx9IPERvGMm5z
 IFLbSenfga1zOa7WkvqBwaVmPUzLVE8Ki4T9D024rp3pjnOR/lfTawSN5SJj7Ml2RJ/bn/vVguE
 36h6E91XzSpXHFImAHDGSQPaKg6zQo7rbGcM8I2bOMX3MtGHnlYj9CdQcPr4Z/bn2g5BXfgxMyL
 w6n3dWcuJuhmYuDL/3CMszeS29vYsVLI2PyBoeNZv99VcU0TpT1GHP0QH+ZVuLcHwvRM6Mc/sjM
 ME+3xtuwKS7Jdm8MmNwVgrwFr6j4I94o4AGmguD8vXbrBrmiOBGFnojpZQMBXFSn6jSwdufqzZB
 PvAtYpwUzKXQjXyEAYYOacu9Y1Rd8M7S3Jb08D/8ZJeOU3ZRYVCbhhcDse+gEpjtgwhxoNwpjqo
 WzRYSQCiFycJ+8CT+BQW3XRiYj1jtIH27070GCpsl8mASIahT8e3Foz55psnmE5TZ7XQMLpPF7z
 6zI8ywDdaiMUSS23JwQ==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0ebcf4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=jATPDVabTivWjG3ulX0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: QGEkkgD_8maUiTEpRhUxYSCP7fj1-bDT
X-Proofpoint-ORIG-GUID: QGEkkgD_8maUiTEpRhUxYSCP7fj1-bDT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210078

On 5/20/26 4:14 PM, Shawn Guo wrote:
> The sa8775p-ride board development mostly happened back to year 2023,
> and it hadn't got any major update since then, except Wasim's refactor[1]
> last year which had no functional change for the board.
> 
> Propose to stop maintaining the board for reasons below.
> 
> - The Lemans development had moved to QCS9100/9075 EVK and Ride board
>   for a long time.
> 
> - Qualcomm stopped maintaining Meta Build (NHLOS firmware) for this target
>   years ago. There is not too much point to continuing maintaining the DT,
>   as DT usually depends on NHLOS firmware.
> 
> Link: https://lore.kernel.org/all/20250803110113.401927-1-wasim.nazir@oss.qualcomm.com/ [1]
> Cc: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> Cc: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Cc: Andrew Halaney <ahalaney@redhat.com>
> Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
