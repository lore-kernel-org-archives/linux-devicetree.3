Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC5B4766AB
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131998; cv=none; b=O5pou0NEw4bOmYmLrXTERXDGfrDUuwpnIkZ5HhSouYxNymXWP50yie164iMHbgtgRD0kI8eYe6w4pXI89k/DD0v6cMDCe40qZNttSixcOeTVmtT/s+WB8hyqFStbaSdjCLfUytP3x3NqyX6NL1yNO8g9pEmEwarqaybYAE+rwi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131998; c=relaxed/simple;
	bh=qICWKUu737Ia1EDZlzujjZzNrdGaN8xhxK+YsoZGgjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CxxWGm3hwcUyJ2hIIM9TWdMQUiblN6m/hzJmexDcF3hHvIbqzNbmcHIynAnr5rtSZbgXcxlYzcvxiAH1g2IeAFzZNNwj4yNPDiokNzGya9gPvOTMXc7RoOLull6j1qyYJHrI3Dpy5Kao5h8kIZMlKazmS114gNbRK8yE/luBksg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lF1GvCoW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=it+cGZpZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lF1GvCoW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="it+cGZpZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiTlK815072
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qICWKUu737Ia1EDZlzujjZzNrdGaN8xhxK+YsoZGgjo=; b=lF1GvCoWCkpCsvKS
	9ue1lQ+CIgIApluEwM92BCXOT6vpzqc6JK0lNJujwC8VFNZMzucNtcILzSoJPVdT
	8AirGO4CpufyG49jS2BdfFrSVEPEPc7uhn/GQF53gWKTXlfLAtZJELApv9iih5LM
	aS6XqsEDCXDbBz5poekLiG0ASzvVuo1SZLy2GFD8eCV7E07o+iwoehhOS+fuOJjW
	e2nO5ckeXyhqXXDGgCrhPQjTu6qlxkuJZo7c/HYuglPm5h/qxDCuPpG6819izlSw
	39gyO+Lx074QuDOdHxGQ7MztdTjvMlHu8fgqqPGN29QC51iZQ9Fga0XubfX/Gar7
	Ca0ZEg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd39usb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:06:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so1811124a91.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789131987; x=1789736787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qICWKUu737Ia1EDZlzujjZzNrdGaN8xhxK+YsoZGgjo=;
        b=it+cGZpZ9GWPpVNXRl5RXbHeddXHdZtXDbccp2dobjRhqD7Gtl26Z440eRQjDngVcE
         3/7IJ+vIBqlLVYb38kyCk3kXkwLqa8Z8yQ+aL1LXrFwUlQEC9RE+EL7MKrnMYsia+1An
         K/gdt/jMLF33MCTO9q/ZquxgzhDXSSo5GLpSXGkRjZCOTlSC7mK4AfNDSxkyDg0qo/o6
         cecMOVfuJx51qxINiX66m6wsbKLoVijfEgfBC4z2iORmJUruiZm8btXkgJYHBgitmzY7
         cPjq89xbYCj80qJ6juIt9Cb1sON6/o15gu53TJubeBKd9U+eVmuNyPF+ux4tIJ0oc7/N
         5IIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131987; x=1789736787;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qICWKUu737Ia1EDZlzujjZzNrdGaN8xhxK+YsoZGgjo=;
        b=TMu6AWgMU3QrU1G+MXWuMcwYBSyEoFO1Vl2ZWDXiKes7nQTyjQmFRthY7MZqIkApc6
         s999Q/yG/6/qWWhv8n+tQ523NwKCkWtLwGtEDpDdUTqUEHbwxE4s/kJfjIdCCQiukwF4
         iUFi0Y8dmZTC2epdYVXdnT4z52U+EYxCjTy4oKjEIPVWCAHdtRVqWHI43tHv1MOtxeX2
         TTQLGs9owOmjYzZ6zZEH7JO7u21Ie6AlrnHWx9UNwo1QltdrJd/JXuJobmTtNnLirhKU
         9AMxDBVM/xP86t5JWTDMyGaZM+QFOBu7kOyTdsnPAE0mJWrXPFhNTYGvETotj6Y9ddV+
         ilCg==
X-Forwarded-Encrypted: i=1; AKwUvBzC3zhJZaFlQjLRKfCuJIvuKLQfrmDh2jfSgDSSn3DlpuQ0iNf0ULV3QAkZj3SXF6fRbbn2paIfp/vU@vger.kernel.org
X-Gm-Message-State: AFuF++mytdnatndhN90dzTNXkQP0u8qzgcfq9HKTjJipZahYB3OftyBf
	YvcokUMVE9Q/95F5lhekVJqNGXtczHYEF8jzJg4ZSJMAYRGjBEWN2jIkqT0ce0TkHviUuKDM3Wh
	k4Avm55375VDp0KzDtFOsq5I/bDg73DruoNVDr33mSrKnm3sTXJ2cpzIliMqkVh7C
X-Gm-Gg: AYBFou2OZ2+TkWibSK8sxb3h1srLdrisvtmJth+ppVE2ybsBEJ47ucSRv+9AfyUJp5W
	j4TozWypWSsw85aTB5ITlris5qbG+lacq7+AsVOWVbXGXacYxPZG5xK+3odVGzXqC7Cp7MkJvoP
	MyTi96f0UWRTwvIPs9U9d/+2yzpf28s/Bdwb+dCwfRTEtt40hMKDBdmAyNxw2MKFqn/R+jqp8xq
	W5puuq5wUDYb3WWKacYHODCRF99KRV1hQKzceox9Wi8HPAYOiBge6hPzncDJh8Sog1fG9R19MrP
	mZhMMf/73RAMrClr5mJfasyXA9wd91u39eOXzV5S/2MplmPt61YolMzwMwa2G3kYn5wHGRddbH+
	Urjpp3cmgvh/GVWB2eeXiBGwqArMG
X-Received: by 2002:a17:90b:384d:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39d9c22ccc0mr6566248a91.21.1789131987264;
        Fri, 11 Sep 2026 06:06:27 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39d9c22ccc0mr6566169a91.21.1789131986710;
        Fri, 11 Sep 2026 06:06:26 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98a58d23sm5906289a91.2.2026.09.11.06.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 06:06:26 -0700 (PDT)
Message-ID: <1d556871-2a93-45bd-9e37-d35f48be0291@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 18:36:21 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add LLCC configuration for Nord
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, zhangfei.gao@oss.qualcomm.com,
        shengchao.guo@oss.qualcomm.com
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
 <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa3fcda cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OxrQ4fpuk6iiGASJZ2MA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: jA20aaQ4d0gubzSFl8f4MO9Y4SotNq-H
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE4MyBTYWx0ZWRfX9Z7EouOrwQzs
 u5pmInKdX2uHDaqaigYNke8Z38QegsIfyvNKJtHJTErYLcTdIp6linFVRN6d+GurMTqjWkDdIJ4
 koHrlFrugewRy647RDmH8f0ttplbmP8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE4MyBTYWx0ZWRfX3zfgKa0Kixqu
 GDhEW5hXmSBB2G3WgtfOBiv4ddsRepVtpomJQAGtraPYVicrAQLys91IUacd6W+DtogOCMqd/sy
 hhFbZ48C5ERbhUM2skRkoMgWWtqBRPXZyVZXhhUmhuBXlkvbx/7T4TzXSVFggAonktL824qD+Cf
 2MSYzoXz8VgtLiabiS8ZMdXhxZgvzP2Uksvd8rdRpmlxYfVHnMdmbLE379ZKBFb46xMX1W8V8B1
 0E3eUHMzH7AVheUBVmhvSAJnjpZ28weFi/CnKRAfw1mLsYU46JLXm27uBS8vF4Mz9HtlSrSwlYA
 5puDS/MT4a21MP+fpg+k6q3il0D4ncfS/+tHJXFBRj2YTI6WoVBjCGiYcNIUSYGAzCfvvob6TTg
 71k2zruSeMymu673LhWyhelaSfe82smc4F+RDGoq2k00K3gHUrMn61oGiRBMuf8zgdjmZED8ZVZ
 D+kjmZ+xwP3OAZ5Al3A==
X-Proofpoint-ORIG-GUID: jA20aaQ4d0gubzSFl8f4MO9Y4SotNq-H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110183


On 9/10/2026 6:30 PM, Anurag Pateriya wrote:
> Add the sub-cache table for Nord, derived from the Nord AU (Safe IVI)
> SCT table and limited to the POR use cases that have a unique SCID and a
> usecase ID in llcc-qcom.h. Nord has the CFG0/CFG1 pairs and the full
> ALGO_ALLOC0..3 set, so it uses the v6 register offsets.
>
> num_banks is set explicitly because LLCC_LB_CNT in LLCC_COMMON_STATUS0
> is four bits wide and cannot report sixteen banks; a wrong count makes
> the driver map a bank aperture in place of the broadcast region and abort
> on the first broadcast read. no_edac is set because the bootloader
> leaves the LLCC EDAC registers locked, as on Glymur.
>
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
