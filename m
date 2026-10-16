Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88082F616A
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 04:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792126095; cv=none; b=FvvkwLOBF3WuvFQL2B4If8rvv06C9ieivUutCLp+s7Th16r7jOKKitAHApYewf2OOH4nyM53J/G/9aCmwYpOGh/8bRaL97buIXnwNPPZfKGX1OZrmVhv+xSqgQ8YpFDRe7LEughxXwOt9wuOIMiIcEltSI5CyKdN2r0K1XfTcJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792126095; c=relaxed/simple;
	bh=PY+mguwkhJfjayVlC94WM+vz9MeHyZawDi4qHK2XeNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NmfC+8BXbIDfQEKaj06dKNLOWq4QthtswR6A92kADNA9oSXpLzBw2NpVyL1o6YF8xtGyJ1V2tuTL+o1FA1tvo8HnQ5q6iuaN8tB1pNtOtfgQt4cXz3OFS8v70I0cda6ecUpfcD3MvRNvoIpdm6y4CGgesx5k2F75oakFgqLtulU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICDJ4j5b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DU5QNE0m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICDJ4j5b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DU5QNE0m"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2Zu7x405956
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 04:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K7MGnk2r789SM+4xNeFuWfXYOB994eVYLUzQReboiik=; b=ICDJ4j5bWCIwmJOQ
	V5khTEnetsj7M5M/eOBr7hWqmi5k8RmCEuXgC5e/f57oQFarfdCp7JQGBTo1Gq+k
	7J5Lk+hHkc6oVD+1b7wRQnlJqD1OjBEORRLqPyItqZeGKpxKCheRcSJZhM8Gin45
	VZ5vg86FgdVHlhmI6e7dYNu5YQumZ327Tqx/dLrg9+l+kVN5N9NOoE/J6ziWWOZv
	G5IgV9mbyb0pjGgaZqIZBLLJ3tnnNYyZuAdO9QBpna83Ch7K0UZoXe+p5oPLODF4
	c3ZdcfK3Et4ZeSu38EHYbRWVtP/KEc7TnD5a2vkANMCrB1gf/1tr9O6YTQq8Wxr6
	XswU2w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa21nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 04:48:12 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-147be78cd56so23452754c88.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 21:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792126092; x=1792730892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7MGnk2r789SM+4xNeFuWfXYOB994eVYLUzQReboiik=;
        b=DU5QNE0mqyifnyL5chovk/vZM6y3d+6ysqSmr3dPgra+lMqos1Rcjz3QvrI3SDKBfD
         uj1RAUIjn7RJXkJ29HI+gThclusDJmg2j1RWCM85xPGn+50Lai0WN8LIk2mEo9TKSOnu
         /IrJ+ws4/Fo7EioLv0ju0YX+bfIJRfi8D+b+JrnUl48C+9MpDWxIuuv0ffKTTaexfYFS
         yVNRs+jG5Z/RpdMb895GPZWApaYP6aJAJDnNf8Zpgm2SbspNcL4OP4qYlmwOfXe8D9jW
         24NiZxieDEtkWxyFZ3Edrtx26KEsqFLW+UJD0ejYE9Y/ia4NR5ftbHDNWr75qngVDfOF
         yvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792126092; x=1792730892;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7MGnk2r789SM+4xNeFuWfXYOB994eVYLUzQReboiik=;
        b=jALqomskWesjcuxY3G/zjcIK7BjpuRNuQDKI182Z4AsE+2uC0ziEJ/BFS/6U7jBpgb
         MW1LANk5o0bvHRlWiWCzGTqQJmP0+PDtayYTsLOc0Xr5NCx85mHLe98Y9oQj3lZZUAbF
         ToB45K4Sb+du7fG7RmQQpryD4cLbko7xq44IMbnMBA6f+BnCcjTlzXJxzqOb1hSpayF6
         K3E8SS14gMi7L7T0OX4uE5UeKLhHxq9bNhpXIzAJGWhHAaiKDacEysc2/rVnrNIwpGyA
         4PtpRQB9IVuQdzWCq7PiI7PwZJai1DprMvW4kjYdOiFZ89NSoIrcmPb5YOXH4AbSAHSY
         RRaw==
X-Forwarded-Encrypted: i=1; AKwUvBwhlIti9z9gLKYKJnq0Ug/woZCpJVsjWlheQsqMzzY/TXpSoocUqCsMnm4oSHns6g9sRyMdn01jbaMC@vger.kernel.org
X-Gm-Message-State: AFq9FYK2NOyILGnTjtMZnJj3Dwi3sbjN5+oROLpARt+BdYexgXc0LhJ6
	n2tDOWxteEnN3KeORSmtQU1b9kTe8Maz32hROI+buUsx2NlwXV9XwkjqgbpQ0n0zQgld5WLW8H+
	KY23+tKBKZCDcLNYKsEA9mlY7Yy8SnE5THVBI0nyJ0HIzMBf+ViU+Y/TbOD0LpEzM
X-Gm-Gg: AYBFou2JdA77PbnZ+p+nNtm1/59bOgS9DvLSV2OiefcIAXINK3ISvDcNc5+2aoIAeX1
	Z68VNq8lNN/8wr0vWGpR2Rmm1oqyghoJ6a2IPDGerjuugXRzl1YKx4GsLVgeyYbO+3aG0PizeFI
	2IMYp1GG3H9V3SNZV3m61uYPzfmDeHJ2QvUanq7uLes9z6YvIMCGdFzqDSzuY+Hro/LlmhoZgMy
	k1CM3f1B2T8+Tm/00QqsAulxQxhvAo5El7IS8tqYC5AYlz82fzjmRRFImOZDl61aaj3Ff7MBbwJ
	K6LXUuqofwkCcQlU7eFeSHA8E2CU9uCiO5TA7wshOfO09bURkKntkp+U76b0KDRZByctfFx0m0V
	B7l/+zhSUjyUAR/zfJv1RMb/yHH67YQ==
X-Received: by 2002:a05:701b:2309:b0:158:7ea9:4a76 with SMTP id a92af1059eb24-16a6187f08amr33405251c88.16.1792126091490;
        Thu, 15 Oct 2026 21:48:11 -0700 (PDT)
X-Received: by 2002:a05:701b:2309:b0:158:7ea9:4a76 with SMTP id a92af1059eb24-16a6187f08amr33405214c88.16.1792126090833;
        Thu, 15 Oct 2026 21:48:10 -0700 (PDT)
Received: from [10.219.56.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm3044571c88.11.2026.10.15.21.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 21:48:10 -0700 (PDT)
Message-ID: <22b729e1-f592-4312-b2d0-d08965c4b808@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:18:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] arm64: dts: qcom: kodiak: Make the ADSP remote
 heap no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-2-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261015071511.977-2-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfX+I2LQRaaruTx
 S1EUORnkapJpjwT+HFnh1oavWu+EYmZflT8xCQrA0/1Srwws6A/aU6Qg6nqmYOe6Fl7Vn6yOf1n
 8GA5Jzf7y7FFWI7vggwTZDojrv5Aaaw=
X-Proofpoint-ORIG-GUID: If2OSC2MwfPuTIOrZMC9Yy8emTMStkmM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfX7OBCPxDQ3G+/
 /fierXoRW1ussFRBjLyJl19gc0fX5ODh28Q6DgtaBYAtXhVANyj89oWDNFSbnqQidUNn4M8N9sY
 oGgH9eQB8G01ZHTkoDIGg6GYND9rN0NACzN95dU8MTCXI2B3zKnCFH8xUHZcQJ6PWWE8RsbxF0i
 yo87lMd3TEsopqWcHORZVh4qNRYT+OF1lsIizVOzLpAUdZyBaaWXliobdK6Y7HqlBxfxoN2uWie
 dO03um/OLNeMR4n5/zumtpaCvdtqDVAH4qGiPnzq4EjmhS7N8Aq87ymvfpIuhTJrgxKw8gAaRfG
 7U9fW9oQOOHVivn7rn4WOhexEt43+i+2n1zd/Zrb7X3zD5nma4YFsDp5A+IHwFxo17x4pNRwLQ3
 t38/tKtF5jQlVTb27jG8YFbCauNLlhCJcfbpmRibkRSBfisNQBF8riFUTRVHSQOJng193Ua6fe7
 2OyOdP/Ksqd+hmAmjCA==
X-Proofpoint-GUID: If2OSC2MwfPuTIOrZMC9Yy8emTMStkmM
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad1ac8c cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lyEmEM9vGBA4pv7bqbIA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160018

On 15-10-2026 12:45, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable CMA pool. FastRPC
> assigns the entire region to the DSP through qcom_scm_assign_mem()
> during probe without allocating the pages from CMA. Consequently,
> the pages remain available for movable HLOS allocations even after
> HLOS access to the region has been revoked.
> 
> On Kodiak, a synchronous external abort was reported during storage
> testing when the kernel accessed memory within the ADSP remote heap.
> The faulting address was outside the HLOS stage-2 mapping.
> 
> Replace reusable with no-map to prevent the region from being reused
> for normal kernel allocations and exclude it from the kernel's
> standard memory mapping.
> 
> Fixes: 9d7d847ff1c50 ("arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP remote heap")
> Link: https://lore.kernel.org/all/20260423063502.484-1-
> jianping.li@oss.qualcomm.com/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

