Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD0A37D136
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 02:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774839229; cv=none; b=ILdx+gtb8RHMnNPrWzzo+nlsWNvSS+QeGvYt0qFgBhOpRiYuHXVDOERYVRKyazhH/sml9gSztUkN2a2yNFmWzYZoPWRzZqnfJHfRLKBiVw4qGCz8IRGHLJBUqZE9K6g7MhMQhIwJEXPPVTaeoCIM6qyPlKMZRcYbh0/jYcI692Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774839229; c=relaxed/simple;
	bh=kO3eQCsk6J6Ohcop6WwGfpKcDh+Tf6GnhxsGtu2Cai8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iOOt7I0GcH1F6spGSk3IleebFdhn8LyBvdsdkHAw6RspdgSVZ/sHT15u+6gVO3yrUeGoGis01BRf6acXCYno2svwwFVgMVEo6MQLFmITeYTi3okXRCXWkAZnwxdGbP13onsdzXleBJAB0E6gleZEPcAWReKzTX+JTXJp8H402YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MiVZtWd8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aqjbv8jx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MiVZtWd8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aqjbv8jx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TKo29A2849068
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 02:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/DFRF/odqbOxh2tCL6vwXMBXde5IDEYB6yI2sTVJuXU=; b=MiVZtWd8LKoAYq6X
	eVw6CgoG3/1Xe15H5W1SWuuFyfcKuVPriAH+7vBTe7kDSp59OkmQoMOlUlzf+RS0
	Jctj8mzo+SV2M3P1a7BOdQDaFlZMwzFky0jBLJq2l+jxNmjayWyu6ENp1dB7Fhfs
	D/40cOhoCi/LRhVeSvGmG/piMvxOA5vTwbE0DuRdymfN2cMAjXKgP3bj/5g6sEUI
	4/O+hXjVLfQit27tPeEQImowGO77B9zysBgStbkMb9ubhPX5Y+rB4wPmuLltWrqk
	mQysgfAOfbzRlyJH/F516hbq+GNbEdcIuLEfMHLCDBlZlIDKQTM/lW2NSHY/BkSF
	1yIxtw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d672uc4vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 02:53:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35d96923dd2so1709403a91.1
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 19:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774839226; x=1775444026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/DFRF/odqbOxh2tCL6vwXMBXde5IDEYB6yI2sTVJuXU=;
        b=Aqjbv8jxr3tsbKuFU5WLlbBL0LUlDhuRbjQRk/Biuw0F/eH4EMGgV9LDimuOcPaRwq
         zGckMPqufh1py6kq6rbRkHliJLU/7lqeDHTX2OziZ2maq09S3lZu1vu1qTuoRVx7/1Lc
         y5CG7k2vxOJAHGqcbQIvoQsoGq8fhBYPT4R0weMzFIYKWlc3xdL2rHVLul8z2MeU4cWQ
         6NdTo6NFNoz4UW3AuI/M+QchmywIrCgo+Md+rIJnJuTTZaJdKxpnoIghx6EihfkMJ2rv
         Y49V/VDSKOXyWP+1/s5H9qanCD3kQ0duyTYotIMbuy7sZIxN5t9Gq9+kU6jWJI/GHH5I
         fm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774839226; x=1775444026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DFRF/odqbOxh2tCL6vwXMBXde5IDEYB6yI2sTVJuXU=;
        b=W376UBKQshYHBSk0I53WfrV1oQwAZEyNTaiWe5d5E+q3kZk9CGZ/TYyfu1ooJuVXbr
         becIzZFhBEP7hA/aUmPf2z6mI71TZcb4EUckjQzfBM0mwVzX6i+0MDlNCsSBVRGzloky
         7VYgdYVvvLio4GXXLWBnxBc4F6NJ/7bsNduFKcin1cqcBDSP1/ppdeK/Iw2Pm3yZOOgz
         agHz0cl/jZqeuicAGApj+m18JzKTZ4svqyisbYYtDrDf0i/tryD346MKBh8n0a7L5dKq
         eVO4SF4hTXPV1uDK2CJWcebjCTzTJwGZaMv0QoQnE8YlbsIb8+0MKTmeV26gB3MBTAUi
         31qw==
X-Forwarded-Encrypted: i=1; AJvYcCWXI9cq1wAlOU6O9R7Kvn8qda5qt5IcwG3AWCdYB1XPm2y3QaEXRVd5liydfUSrlq+oqDk+VbWT66Ab@vger.kernel.org
X-Gm-Message-State: AOJu0YyYfY27NgMH4kNaZcjKxcuFWcSiw1HTe88ERSfb8grbf9KEp9Zf
	swmEUPwIIX1uxbkjw4WWJMtiVqpTuh65wUbfE+7L4nk39JDDweJHUZcxwuPI5S98wn7ISk+Qwua
	d1Hw+87d7FCFf5pI/Xj7NKP7p+/qUl9qIe09szVtDBI+r8Jrg2Vp09ZziwJzcErQU
X-Gm-Gg: ATEYQzzcn5inKkUSk31pANOQHSCBHJm1Z2oKWdXVREOU+99khkOH197yHMxdgaEuwHA
	IGUGVghuo80j2CWJTNhZy/Z0JKgo/PCbkzOh1akBJVcba3Rmf9WlvaxiJYEPsCWzoxSdHmXP/is
	jdbrXxCPqWqjiBREo8NFZWNIRliuTK+Pf0QF7oTcztiIXMe5/ana5DMRSUrELeDsDg7Ch+kKsGJ
	XpIZtLMgqDNatJQFblSn4rMct6cS3JlgEFsJhoH3LuoNxHrVViXF2sOAlsZAyP1QRkw79UitP0z
	vpZaPUECBHS1QFpG2I2eqdtNWLMNBvXgStuOmQB/7+4gOSj/VS0zp8IHco0gdUoruJKe97+giIv
	w1dME3ct+e3S07YTE/Nni7ImXOcsPObk1ldJ+of3mfpBnNkOISDDdncHnaYRvK3I4PLNik9d5Jq
	CpQoyBX35lhQG4GQo=
X-Received: by 2002:a17:90b:2688:b0:35c:812:612a with SMTP id 98e67ed59e1d1-35c3010ea58mr9892384a91.29.1774839226203;
        Sun, 29 Mar 2026 19:53:46 -0700 (PDT)
X-Received: by 2002:a17:90b:2688:b0:35c:812:612a with SMTP id 98e67ed59e1d1-35c3010ea58mr9892355a91.29.1774839225740;
        Sun, 29 Mar 2026 19:53:45 -0700 (PDT)
Received: from [10.133.33.43] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dd72sm5583906a91.12.2026.03.29.19.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 19:53:45 -0700 (PDT)
Message-ID: <816ca5bd-239e-49a5-93cb-8df6521d0097@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:53:41 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: kaanapali: Add SoCCP for Kaanapali
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com
References: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
 <20260326-knp-soccp-dt-v1-1-a60c2ae36e9b@oss.qualcomm.com>
 <ac75a339-ca20-4264-9295-d7290e218bc5@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <ac75a339-ca20-4264-9295-d7290e218bc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tBV3UbGroLmiEfY3oor3g0K6WVyBNHke
X-Proofpoint-ORIG-GUID: tBV3UbGroLmiEfY3oor3g0K6WVyBNHke
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAyMCBTYWx0ZWRfXzbCLJoypY+us
 njYdrguaBp8dvYGhzeKTPFzXcgI7sWGbOzmpogLakq5/gzywM2N7iMW4n2WvfR1E8n+Tmqb4jQ8
 /dIsIaFQHElNuI7oxnPsBra2pmXb3eMRDq8cz4a8jEcvj0+Ss8R7Jls6MwamuXgZZfYMSP9+tJj
 yfpzmanDekVE/jLYrmhgJDFcZllqZnAtKfMhZvIiNiyNRlQ3A4Ikt0J2WGrt/e/U3fx4ZL7dNt2
 BulMjf9xyE/v0V1qOBzP0W9RuOuIOgYSlipk3lzm+42lvJTkVilVpPK40Y0ZwjmIxZWxZZowR0v
 7urSSnbJWZDtYN0mk+JPh770nkGR1siUTliPifOCA6KdITw1t1s2KDo9f0GLfvTVzPcN9yR0Oke
 ylIbr+8u9lvPePJAF860A4oDY9yiOxqo+dnNYBy3L8PNUi/s5JBJ8Ak0HXWFX/VWGNjUGp8Qa/8
 6jANKrTKzBWmSwQ/uJg==
X-Authority-Analysis: v=2.4 cv=Ae683nXG c=1 sm=1 tr=0 ts=69c9e5bb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=C8bOAEPEEF3gcPeAhRwA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300020



On 3/27/2026 5:52 PM, Konrad Dybcio wrote:
> On 3/27/26 4:20 AM, Jingyi Wang wrote:
>> Add remoteproc PAS loader for SoCCP with its SMP2P. On Kaanapali, it
>> is brought up by bootloader, so set the status "okay".
> 
> Simply remove it, "okay" is the default if the property is absent
> 
> [...]
> 

well noted

>> +		remoteproc_soccp: remoteproc-soccp@d00000 {
> 
> -> remoteproc@

well noted

> 
> Konrad

Thanks,
Jingyi
