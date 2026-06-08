Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E931A2192F4
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909444; cv=none; b=sSibaV98aGbJnu0HhY17oJphTkC2XyFRsHLL8FlIQiEJBkS9A+YDpeBNzAYB6QDdS9a9GjgkIAawgKhpDdjvOEPjsGgVTsLsoVFhZplu9JVQHFr+ns93zyscDZs7Rtv2STaZrknY0o6IJaw+ZUl7gZh2R3mgy6qvNm/Fhl5jbGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909444; c=relaxed/simple;
	bh=6A6btgmpIa3JacfD/8nNjTQ7RogYW6UV3lMsUOlPX5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSKApUGkg1wBS3iASD7MwLmoZ8IWhX3ezc5KtkCQHoQ6gfdsMjZrEEbEze8eOg5ox8Qp9cmtFnGN7QSbgReT1eKfBZLP60R2H3MOrq9oOuRB8o4rqFaa9cC7QWcNMM3JDJcKMME+Xvhhek2ZBtHtQKaiq1oyc5Z4jKlRmnRV+io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HMKkh2SB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iC7lyTeQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HMKkh2SB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iC7lyTeQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OljR2347164
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 09:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zvzlX9W5yikFyCEaTo4XqK1r8wv4Ou9Fa6viAVAc6jo=; b=HMKkh2SB2+h5Sh7L
	8lcvK52V2z6yR4AwrY20SBtGyT0h1Kn5wLpAVBDNIL6+u3crh4QHKysJF6B/6sJD
	E5UCenyqyuR+e2U4Tc1aNgIyOQHT/p0qJTGd/KCY+dPYCBX43brB4ZyAM0vyEtiQ
	q/VURLlyDvnVm86a1Ygp4kN8sdpJ4YqXc11QcW3T94ZmGCIPnu7p35u6l8h8DYs0
	kdTTNNagy4hikFgzOOmQxKF86BWeZTqCpe0aO8AqiT7or/G/+CSQFYHeJB0KsOlS
	Kgk/Xj7Cb9JkXD+h6Bzhi5dWk0yVsAIB9vSMoZQxZzvMyAfKEoH4TDN30f97LjtE
	LH8Nhw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrf805-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 09:04:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5176ff55dc2so6515061cf.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780909442; x=1781514242; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zvzlX9W5yikFyCEaTo4XqK1r8wv4Ou9Fa6viAVAc6jo=;
        b=iC7lyTeQbgCh9t9U2jhmpVmfHxua0d7KNWZQwgWbG9qOMSht7vPqlNDSUFALRIYV5h
         dVCqw0kyjOXWaaUe99nywFacwPCISlfA6gVcYpYc+kfrgmoy7LMfMtlWWrJWKOn4e8AJ
         laVPgSqBDa7ByRSqFjbef5xFXZ1Bxw1MQ3b6tcXF8bq6WZdOBKDeztvTrba4lmlvH8dn
         hdl3/JKCH2f/QORG7zeZoCJ3dfddsPUkXwNi8gUXVA8wx6vjCVAIC24lVna2VEbK62AJ
         HiZb98o64cY284aOZt7dbOLlG4mKR3V4e/WXJQrEV0g+08zpbfOwYhNrv9FGjAPUpSh/
         K2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780909442; x=1781514242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvzlX9W5yikFyCEaTo4XqK1r8wv4Ou9Fa6viAVAc6jo=;
        b=GPGRU/JlzdJEcwDrxSXzGubF4cDHRfKRaUg0fRR4HH8tWy4ACdVDMjZjz6TvJXXVbV
         wgjzDyPdpExKzBlTeMXlHuxibJLOff674khl256EOv8GDUSFUtrs9R9WpGmd6mT7xecZ
         UMenS8lIZadzOXIPVlvyI+Fa7/I56seDwRqBcZy8LufcbaFFwk8G5+GPMriPrlktptrp
         tLKYdVgD/d5ii8yeKdTG/u/ZAuyA2NCHdCcilW3MgZjw6U0XVsl6rxMIwekf1HHnMK0U
         Hk4d/vbItQ7aifo5OH1JBkoNlqyxMWRw0vW4+q/ybilKO7nOQVBWRPjAK+M1dirKP2YF
         gYyA==
X-Forwarded-Encrypted: i=1; AFNElJ/LicPKWk44iuwjSsk/M3RoafLTlTnWHHN7G4RvXCn8dGkOGX7L4W3qZYg2ehFq9luoBzTHC7I8jHfR@vger.kernel.org
X-Gm-Message-State: AOJu0YxyNcwGB3xR72pU6MZzMHFIi1p3Ovjkjojj8f8APj+Mk8Vppcee
	6PHFUp1GiSNcs7ARrHUlOhh870ytKR+j7UIYSkJ93DsaPQyMXu79AV1tct/L4B9nS/PQu5krofa
	OGgU5TsepuNxM4BYWyPBg4PmxD/H6exsLyD4w7F0LbuimSg1AIeL+xwiVvjhQ/rI4
X-Gm-Gg: Acq92OEFrwn9kM0X2kkCQl/06UvTv6wdS9ujfu3+Yl3Tdndz+Uh4al5PlQ8RQbqs9CC
	qAzKrStgyOumtYpZeGBN1VbUJ/fnRbZACTRBwWZDz8mXnXlWi/xTWlF4/VhEBZkOgZHF25x8SH7
	n3LVcaCpl5OEhGQGi8rL3vfb6EJ+cUUwhgLleRXqFSquJfljhhvgtrXX62iezA66cS/jOZv3OBo
	ryoyCeiYh/UldCy0q+He+iSj/UE05duHr7hkfUJcImVRf5/KWOoX8wiRIqrCfdye3Go2YcpuFXj
	ZyXo+hEFSIJr8WYgKvcIwc43CW/625tGTcfTFUfS0NJ1QUSXP2C76LORJWElaD5hMX44dTicvWB
	aRqgAZN4vlLVkjmhfllyPSbolT+2z7MTWoxPUH+siolNL11kigDeD2Nwp
X-Received: by 2002:a05:622a:5c07:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51795aa8c57mr143239831cf.2.1780909442181;
        Mon, 08 Jun 2026 02:04:02 -0700 (PDT)
X-Received: by 2002:a05:622a:5c07:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51795aa8c57mr143239501cf.2.1780909441801;
        Mon, 08 Jun 2026 02:04:01 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05177150esm833003166b.5.2026.06.08.02.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:04:01 -0700 (PDT)
Message-ID: <67c404d1-6188-4a8c-8243-6827d4a38d87@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:03:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur-crd: merge duplicate
 &pmh0101_gpios node extensions
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-merge-duplicate-pmh0101-gpios-node-v2-1-251107b3d9fe@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602-merge-duplicate-pmh0101-gpios-node-v2-1-251107b3d9fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4NCBTYWx0ZWRfX0Ke+Jx43fZ30
 HyiTL9x7dyntA4WeXwc/QdFTCSlL8MnDvYFxkpdtnkSkkkRhie2pQUEWDgQEfIR1qiXyCxwpT41
 fXcLceTQjOeSsWvmHkckh90rzRSk4bn5UGk+A4xT0khJMRA0qUVR49x1H3HrJ8GB2ikMUraPO73
 luDMgAsBGYrP++2NFq9lvMZHuJGpl9ng5aEJVB4XxnbqlVno3+kDltSC7qbSVUM9ARgwjiabB9U
 6+mZ2VxhOeAm0K8Uc4nzW91SR03oKu67Swaq7Ln0OzUFWSoUBvaXGCGqQY7J1lSdNTp2HvlR+pS
 11hZ9VfKtxuyzB/gQ6RJSXvWQu2MvLZXdqSgZ6Ubfx9AIIijBeMaWt36QYWDjmDyRv8lJGcAnaG
 EFAaO/48pLbB40JXfaOLtmOPLmTxts3qke+JHyAx5xDwx+BC4qr+0u7/nUD6rhgitOwAOZbvuWf
 HMic96g8vUKg2WaW6DQ==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a268583 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=LoXqgms-zDgafVaz8s0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: CqSHzDIau86ZFhPs4cPcbJLe1ZOni52F
X-Proofpoint-GUID: CqSHzDIau86ZFhPs4cPcbJLe1ZOni52F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080084

On 6/2/26 11:48 AM, Gopikrishna Garmidi wrote:
> The &pmh0101_gpios node is extended twice in glymur-crd.dtsi. The first
> extension defines the nvme_reg_en pinctrl state for the NVMe regulator
> enable GPIO (gpio14), and the second adds key_vol_up_default for the
> volume-up key (gpio6).
> 
> Merge both pinctrl states into a single &pmh0101_gpios block to avoid
> the duplicate node extension.
> 
> No functional change intended.
> 
> Fixes: a5ad8a8e473c ("arm64: dts: qcom: Commonize Glymur CRD DTSI")
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
