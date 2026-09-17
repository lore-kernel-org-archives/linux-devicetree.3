Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12114E06DA
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646719; cv=none; b=bSyO5Hl0oOcYzyJayADRGoTvqb0IGyk1wZ6h0tFCHmoH+7twtH4CjQRNV7oovGG1FkxuS23549kTa4KF1yoIfk5StlwbNCQCtUFdbAwPQMDGdI61nhuNvXbUaTaO/t26eXms5fgm3REios7g1goDSlx1WYc9OM/4JBzgaqFT+5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646719; c=relaxed/simple;
	bh=SC7XYX10hWebInkiKKp2nmH8rixCWV0tK6vU6OdjXv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYXFwGEbDWHY34Y7rs1CwWn118sqB3IBGz9+e9nhiShqOMNAlAkYBj3ownLsc4u6fr68sncsGFy7nVTP1u9h3tj9jiaCcgOP9g+MU5vgO5sZ+2NLZk5iZea8pHWeQIVbzuhWHUjif0HjRKY5GH6Iy1yBSkTDmZPdk7LxnjPeF+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NITOPt+v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NB+WMAOi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NITOPt+v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NB+WMAOi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HC0J7j1853529
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vRTy7m3So/X94mzU1zPkSfnnEoWD8/O+poGSv7zNk8g=; b=NITOPt+vi/kcel29
	ZME2jUz8gizGO9Mr5LqfSaccVNmQ/o3x/cwcf05Yq0reFKaVVLIuFEHTCDV58Bps
	4K38QyCNuYs7fb0hHW028Au59HGYeqznB9Z/zaJFb9bVwAwV97px862p0sfuEboi
	8NECFmiRpx/Ugbx0tTf0wYzs0aqF8H3C2yAyP4GRzkoYRhaH1vC5ZbP/axjTdrJR
	ucCUQHfeRmt3cTUbOezxTqItvku0Gm4ECNAdxBgY+rHHuSJuKMKNxpo03OlSFlhs
	zoEauNwJMAdkHZXAEeaGnie9TFyLR3zgywkQqJfr+QDNwM7Zn5JI/LEvwutlEZjX
	FuVHoQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfu400ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:05:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfc52ddc55so11373805ad.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646714; x=1790251514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRTy7m3So/X94mzU1zPkSfnnEoWD8/O+poGSv7zNk8g=;
        b=NB+WMAOiBqNp51TS1LyEigUc2AOceYxRmiz+i0g7akQxHG5eGXAnT2RgIcqEyDFXSZ
         NxhcEVnJ2jPFXrCs1bLD81yrVGG4pZsJln8A0PXWcAzq/B5s3gA0NbGvZx2irJkYM9J+
         uLJ8Kqk0f1URGrfZxwOM6fXaqG8Evz640Yw8PyWsIviktDSDtVPEUpjDqIZPN7alQA21
         FVCiXxgCz9k4GhkkPZ9IdArUO7IXBQUMHJaDUqlheOovW0bPmO3yqbj0TLMGvq4wyJZU
         zy1nibEXlaE89x4JqzSgrsyke61i0jW23OuV16v5U6xgF59m0vvYe1SZVO2Qu7XIS0JB
         gnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646714; x=1790251514;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vRTy7m3So/X94mzU1zPkSfnnEoWD8/O+poGSv7zNk8g=;
        b=de85WtBDo1Ecsc958KDvVHx9j7aPBLwZYJ9+UWEMp9ww3nKVccMF7vybCVA83NEM2H
         UeQmPURcCLlDdHO+ZqGaIN34xA+hj4qDbET5GoS16FIhqt8ej7WbMN8dlRoN0S0H/HKC
         1Lo3KJBsIlMAT/KvMXHjOVQ8VeBTeiwqhoiT8ASGr/PR9hUx53k49ZQY2u9BKMAx7f/d
         m9HpnrH9uvudAAoGHiIiJ+ns4v1zg4GAFx3L4OVQA5uTJYLIoCFFhJ1Nf4kcqCILqG4T
         ppIsbszlnve18AX9h2Hgh1EEASRPTQ1j58cObLEbKBgoM8o9KWV6f0nnVG0r4S8AvoVh
         MhbA==
X-Forwarded-Encrypted: i=1; AKwUvBzhcgz1BuVXsvFkni/CZKHQkyFeHNHRNBU5U9PUDJDN8FuceBhsRouixF32lXjXU1lSKw1ko/uUwbbH@vger.kernel.org
X-Gm-Message-State: AFuF++miGbCO9Yrz9EqpUwTMmQ5JiTgEm4MQd/dPsPjdnoVkVkgxoVMM
	PGNsEk0y3H3OLskNfSjJ96u025HAIV+vZLAUWSItJ/w5f1K3pwpuU2BWoMiHW+FfCOd2BB37uZK
	4fanYoXi81G9uPrksDgviQ1SNI6Wg96ookTgyKdj/BO9BdfJnDCeTVTcr0a8Gq9SZ
X-Gm-Gg: AYBFou28gQFxNZdHEGR8TV5x1GWZEmkJFxn9izU7yR8xjzL2TNz5LrBfPwbeUgJDzoF
	hZ30VlHS+5QQ4E0wjXwiJWalHgsY7DkMnKSi4sz7UkDUK/ovzU5ZJyvBFTvePn4Mwi74rfoLPiO
	GlHPk6rvKcwVD6zqXK9dEOgy9lFVSLMlISyc3bigfIkVIjWpnBMbzHDGPHV4isKBh1PM8sGtd/N
	9kmr4qMybb92gRGbpQnsf8QysrRnEuPCVmKdj1bYbB9WJVvvvPWMsQiSEwC8KuhNYqjXKoAH2Mv
	CPue0tskFHEj2VDyHnq1kOMbDry2/SRr27kxiKeLRVY4hUHg+nzw+MfoTOp/EhYGSPgGJ8qh3d+
	Jitfmlybtm1zlBTNbDTaa6lsHTQ==
X-Received: by 2002:a17:902:ec87:b0:2dd:ad74:ac26 with SMTP id d9443c01a7336-2ddad74ad8amr40015ad.24.1789646713035;
        Thu, 17 Sep 2026 05:05:13 -0700 (PDT)
X-Received: by 2002:a17:902:ec87:b0:2dd:ad74:ac26 with SMTP id d9443c01a7336-2ddad74ad8amr39205ad.24.1789646712588;
        Thu, 17 Sep 2026 05:05:12 -0700 (PDT)
Received: from [10.218.25.214] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89eb5618sm25348115ad.32.2026.09.17.05.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:05:11 -0700 (PDT)
Message-ID: <ed2cba23-5511-4787-8cb7-7c8207c21f25@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:35:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: Add qcs615 lpass lpi pinctrl driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908075854.3015560-1-karthik.s@oss.qualcomm.com>
 <20260908075854.3015560-3-karthik.s@oss.qualcomm.com>
 <83509feb-8776-4f61-9bc8-aca27d7c234b@oss.qualcomm.com>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <83509feb-8776-4f61-9bc8-aca27d7c234b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qlpkQWRIYAQ24qKBCUu6pRO0kRMVBfWy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX5Xp3fnJ0sWLF
 8XXctaTgrEq6YNPzb4t+oVwl2qbGeZsYuaP1P9JcLJNOgBASU/53k/jd3Z8jINVb/N4uYS30f4/
 57B+i3aBz0I23oeO/oxx8e+IoO9LY/A=
X-Proofpoint-ORIG-GUID: qlpkQWRIYAQ24qKBCUu6pRO0kRMVBfWy
X-Authority-Analysis: v=2.4 cv=LbipeTfi c=1 sm=1 tr=0 ts=6aabd77a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Ck1oJWCqvmENqo9s2LQA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX0QhS+LpaGS02
 yW0M/RwATOUKQiyfW/lBtp9hg5Yvuzulx2K6UydnVcLxyWgjSL52EMLzLPlVWHXRy9+xQETF0IU
 LArRWpm72Noy4UoXWaqjekJxUqwCtvagCurPeA2G3nFa9RUov8FM53Cv8r1ycpRXcJ3Np1eftpQ
 hX9HDXgnXURq3xIJHteh6bSsntEmubBIHfEsmPzTuEOPoj1RO8mcCc3SBSVHBeQgDWGZPIdGIyc
 R7cvazDh0DXpS5sP+U4NsUYNxsAkyeJJRhn3yvwM8TCs85lTAWGtHrckbPa2R1x0x1fyvVqWc5x
 Y2iZWfj4VAGtfbIyvBm5K5Ct1kfUusjPVcdXSNu4sqtU5TRrvO1G0mIvuda66tn/0csVyF1Hbhj
 ABGvW2jPLJjE+EhzUTrfPnhDVIKPb/NxRSbb3BAq8ZjWNznZjHZLQbeq4N0V+OGgEHsR5/rtBLY
 U/my2gp7cQGEcATD+2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170169



On 9/8/2026 6:32 PM, Konrad Dybcio wrote:
> Also, it looks like the data you provided here is a subset of
> pinctrl-sdm670-lpass-lpi.c - is there a chance that the block is directly
> copy-pasted between these SoCs? Are the extra functions present on 670 also
> present on QCS615?

Hi Konrad,

As you suggested we tried pinctrl-sdm670-lpass-lpi.c on QCS615 and it 
works fine, the alternate functions seem to be similar between sdm670 
and QCS615, we will use the existing pinctrl driver and post the dts and 
machine driver changes for the same.

Thanks and regards,
Karthik S
