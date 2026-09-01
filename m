Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4283EC6B9
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 01:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788227573; cv=none; b=Gu/Q2ST+CWRP69G0JGrDnvCMUwJY7UGWXmxoJAL8NtObnqO/azrYYFSxFCnsyk8QQlAZERpV64WgyYRbzf2dVeSVnJEHpxLtOAycfBmZvuAifezoqTl29c26PfZl9EH+36mpZZ12W6Ye+OxYhHW03xA0q5tXSQ6pp+0dieTcjU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788227573; c=relaxed/simple;
	bh=gC3rAUisz4qhWwbHtv3xSR51wQUzfyVCKvBE7uMLvlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQs3KuOLaJjk/3TrSf3gOWyq+5Sob2BlgC1+6hbhr3oUTRKz20U+eJeDuULm7G1wJ2iEMM/F7/F3yAbZkD5QfZNjqVsfHNDyGBQu0vMbADpOgZT5XV8liSsVcfOLvoYlEm7Cx6FH0b6Z+/ZXWOg5Z0v9KCFoUWnvnpmnDCr6YCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oa5Zy7+V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IrFLl+90; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oa5Zy7+V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IrFLl+90"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810p0e91487681
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 01:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MLB8BcqtseItV55bGvx+qIYw26TP76TQUsHtl0K/n/g=; b=oa5Zy7+VBd8W9e3S
	gR4t8pLDJ26qZWgtWUoJQg4p9U0ZxzeUpd+dZGjpWArYLnnuqgHjRSkTMqWHNvI7
	J0c9DoKgEBPAE+R0RtAjzg1TvnPCcpRpRyMmPi/evGR6oL23QEaRPao1NOzFK3E7
	aRI9eOLT5WA+I3TA1lAk3g0Ax8MfC71/8iZLxXxVc1UfSH9iU6Le5Wb3iESe6D4I
	sAQ4Goj4MeNNOycA7wCTY+Od4sXDqwKIs779dNlxIVvuf3mays58IFN6VxyzEYbZ
	jrPnb9i5+FhZKF9ZfSStCaVTjD/Hp8El5d037lv1gBewJuTDLpaEARVRjA6ETy/8
	9fyYDQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfch9f7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:52:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dff6253so4818555ad.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788227561; x=1788832361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MLB8BcqtseItV55bGvx+qIYw26TP76TQUsHtl0K/n/g=;
        b=IrFLl+90lR0YpmjPQrSIj5ffa27WZ+qIwWTq3UiwtRnqvawG7XmxcH+Tf+NC1+AxbD
         7/dh3d59GY4D4VzLXaV5rP2o7lQ8yjfvy1uaBcLrcuwZOrqV4IKejumbw/UoXOFKkyMs
         vTpOkUh9lJbGc3A+jY5i8PbOluhLPPePxrLGMRs8KPKKOdluQsNhNMlCLsbEojjktBKh
         Svd7DfX9UpBazEG5xtkC4m6NoTS/uX/rzOehK9h1pRGEYMa/3d46DALlNK0cP2uMArES
         VsmjlAOjDu5Mt+qdWe3zzlFKFDI6nFucB8a8eOwysscATy11z5CKiczQDw2uHrPLDUHY
         ln5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788227561; x=1788832361;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLB8BcqtseItV55bGvx+qIYw26TP76TQUsHtl0K/n/g=;
        b=CC+oyfE/bhXELOkWjHZqmUL+za3zqT9nA2QYaIGRIQ/k1L+nSi8m0VHOy20Yrkt+hy
         3YzRjM2vv6fF8WYNx5FfKGlcqbb/x152QURR4+b8r0lGvXTWNvBw9kBOgMk4yHB7GZx7
         u11GJjX/dIsgQT463CfwMjyFhfccCjD7JKseYwgD7eRwuoTUev3y+ykr/1nheprmUXKs
         g9J5qujouVZ71WqikylOfzCg09mk508dhAT2gZuEDASH22bc91qAP/dwbYZp9TR5ctiE
         CBmziJI04ECKaQb4B8A1KorKM9fmk12QZwSexbECGxpJhlvee+LrHJzWE/nr+Wb6nOWy
         +uWQ==
X-Forwarded-Encrypted: i=1; AKwUvByj15xFxe+jeTj3IgHPJPnfQTdeEgyNoIhFHNntxHEc8DNfPoQsTbvI4e1owGkCmpxATZCypb/5x7ap@vger.kernel.org
X-Gm-Message-State: AFuF++lmEasXGhVL1pBm7ddRArEUQBdLXSQfosntoYeeO6tKWSpjuQPZ
	U3s6pWdo/bq4WJL+Iinz1sDRO50griDrnf9iv4hDF6Cr4JHWDiIRPLpGBayXX/NMgRI75Hhb+tn
	9UWHX/1JKF2B5yIFey8Iuegh9AKLtuMzeok15qhPCBUngBlELEF9f0uAlBqx+Uh3f
X-Gm-Gg: AYBFou1+ML7rhdOpG+fIZdJApjtZCDy4C/Drjiyo5B8/PhbBMNPKf7OGrFfzhlF7iVq
	LA7z2foU0A2yzLcxgbbnmiAVR1y/4t8NUzxmZHT+U58mtvUHj9xLThjbRaiwEXQnf5gwozmE6Gw
	lyt0zcX7ID6vKu0d7iCux0FqE1S+5NZ5xddWHcVr81RrwcbCEPoby+3Dt55zZ5SazSklTpDdpKj
	t9o7hz62nZ+clyhAjpsZJGf4wLbzcpRcYXaMbiqQHGZEhQit5pI8rcGGhvAyYwNy3b8R5fJdiJD
	BMyVbP4GFsaNL2m2xT4EtNblCIjKl8LMeOLjy7oxzA7a6FW74FBnnZfUlAY6Jz/QAS0F90xNzsN
	aTWVONEjtBe64ssezxMj1TFxxIrD45V/Ha676EdkKDnE7D6mOJLzheZK8J4frjO6Y/jAnlJR9
X-Received: by 2002:a17:903:37d0:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2d9526d3436mr20524565ad.3.1788227561307;
        Mon, 31 Aug 2026 18:52:41 -0700 (PDT)
X-Received: by 2002:a17:903:37d0:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2d9526d3436mr20524255ad.3.1788227560883;
        Mon, 31 Aug 2026 18:52:40 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7598bfa51sm42590745ad.78.2026.08.31.18.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 18:52:40 -0700 (PDT)
Message-ID: <5d6fab0d-e31d-4a81-a592-30ee1c6f295b@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 09:52:36 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath12k: support calibration-variant from
 device tree
To: Andrew LaMarche <andrewjlamarche@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
References: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: scL9usCPCBTRc7S1HlG0m3O6V-V2k4OA
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a962fea cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=erCTOyO-HGHO-QmL5V4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: scL9usCPCBTRc7S1HlG0m3O6V-V2k4OA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAxNCBTYWx0ZWRfX4D9O+n4ZJftL
 Tw9QGPNzNC+/Ldmvo+8Ahp/bAV57E+c3ucwD4u8NDEixnNr3OR/8DnIofXR+yraYmpwlNkmBIXX
 nxD7bchxDxlJuvl6JiGXfG0coMhUjFU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAxNCBTYWx0ZWRfXxSmZDyJGfiFi
 ZQ4o0LoxdC5weFtuJ16yiWN/4FjtfjxqXEucfOL3fcI7+SEdJRkzG0W7sctMDlgeevIaHoMlXtt
 bW6Z3s2t+/nRSPdwe7HXOECNm9z7IC07E4/q8ozgwK4VmVKPlm4XJb+i+bFdXTHTuT20NFug8BR
 YzHuZvjbolx9r7vzwoAy7oRZw+nHZMk4SVD2v0o/dqAcolA+zuhVPxLmjtP8T0n+3MFvuKfJvpl
 ZqLPEYCs6DToxjUvyOR7TlZyKb4vTRta+g0wV7qPmEi2TwXfPuDmMYihct4lpLItMPPTaXFCMkP
 fpiKJNB6JflQg9/Wkuu1g60bxyU4Mx8swkZmkDtiIuKJ57nEwllrHgdIx4dsYntPtnF/tCj7ror
 txuGbfXvfb4rkl0Fe2II0eBKbTqPxFbc+oBFu6x7ISqlUSaKqC6tjSbw8TAz39lqXa/s93AL2UN
 RR+rVZ7Lm5Nf1bTsdqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010014



On 6/30/2026 9:30 PM, Andrew LaMarche wrote:
> ath10k and ath11k support reading calibration variants from the device
> tree to locate the correct Board Description File (BDF). The ath12k-wsi
> binding already describes using qcom,calibration-variant but it is not
> implemented in the driver.
> 
> Many ath12k designs expose all the radios under a single phy, each of
> which typically require a separate BDF. Without this, the radios may not
> come up or will not be calibrated correctly.
> 
> Fix this by parsing the device tree for the generation-agnostic
> qcom,calibration-variant. This allows the driver to properly select,
> read and apply the correct BDF.
> 
> Signed-off-by: Andrew LaMarche <andrewjlamarche@gmail.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
