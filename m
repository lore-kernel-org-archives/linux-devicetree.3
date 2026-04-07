Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E936539448A
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 10:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558741; cv=none; b=XRtLlZzZhRzN1RXiEz6n3NJdT/x+xXZgJwnmh6DTKYUa9D2t2kR07SnblAtfV2+MxpI7RRqsDIGDd4pnxI+t0A30lFlCEPSXuLRuFyqB7qAsUc+yLxMql1SZJAoye3hnVDCI6Roed/3GoxY5kKBuYukNxfuMZrRvUwG2WIRZVCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558741; c=relaxed/simple;
	bh=xUUtJfQpD5zq0EVWy++vHQ+5hTS94mPf6+N6g42L6HI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iDejduOc/e1fb8Dc/ps3WggReDHQstPrVZb9x+PXxEBc3zf2cQ5q4DQQdNKEJo+OLl9uV88kVh6loHPlwIVzp9cAEOmUXhH71EOYS2rD/5lWvNpOKLCK4AvN7kMgJLM/Haq2rkMHF108HrDgThNRsaaIhWcIAkN2dHtToVS9EVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JNAtzL/D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=khBRYCLW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNAtzL/D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="khBRYCLW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376gdA11584423
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 10:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oa2xAwC1CNOY/ehP1p0RnPEKv/WP578j1jDUe5fO/RQ=; b=JNAtzL/DHaiddjy8
	2kHRZmVC/qJ1w7j34dXP3YOJ+HdABtxFTSUCfM4ytsyxXjoaZvZwocRb/pP1gM9c
	C+GUQ4VzYW0Pehml9gc3l/W82mxPrMD1G7g5FEtoqXgNBYp/eQ279oCYkNky0/uq
	Ecn0Cuj73PT4csMMCWhkagmDWfL0IQGaTMQR3UWv+ntzDM1BHOazZ0QMhmu4Y/EY
	j++CQ08BHFTeg7vnhQX3p1sxD9KzfgyqCEdGU7pt2G3C5wRWTMLBV8tXJHcWh7Uw
	GVb3woRhvv34tL1EtL6aH232wgda977QverjYPZvbGywwa2vUkbl4m+Z6e6xTqha
	uBfUaw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9tbd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 10:45:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d45ebdbc9fso112202985a.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 03:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558738; x=1776163538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oa2xAwC1CNOY/ehP1p0RnPEKv/WP578j1jDUe5fO/RQ=;
        b=khBRYCLWlB0RW5wnLLRCj+eVVVc1fKzCdPv87M0N5i3+6pTySODnCRDCemTexr5YLa
         1pbbkUOq0MkciMM/Ddy6yAsWda4Rou08b8ws/ATBbUU3+LQbqUeCs5f0Bzo0fqHiFYEh
         cOQR87jPcxHeBqRpFAhz/NdPaVcJ2c1DeroTzTFFVtLBLaXzx0JhhHXPqVslgmAZ4ai6
         edbT0IkAqtTog7QP2KdiZvBx31yiolULyGmQgiiQ5xmFNvVQMrYMnVUM+IRdkn+m+qm8
         DR1Zl7KFONBt7AsZGLSq+njdCyanEWel5Roa5nj3OzTy4WyaV9ArmvL6VWudAhxlpj8o
         p8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558738; x=1776163538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oa2xAwC1CNOY/ehP1p0RnPEKv/WP578j1jDUe5fO/RQ=;
        b=FEXwBORvEdpX2XdSMRM0V+4aBujuB0y953m9I/sSmLgdhvGBVELNPt+xpxjEK6Wn9u
         5lDQqkDuDh6Ssux2M+DHsEYZ7FF0u5Ryq8z219nKNbBCaeOvXdAqMEHpHcdLWBPuYiaZ
         xgF4zCFIYgmtvE8vEkmU+cYxhAf3L4l4ZrgWFI+xjHSAGGQdiopzjAG33xU597V6sEEQ
         MURrzyBgtxe8Y9I6A4tISEa5ojhKkCpSjH8MkyHxz5HGypQWUyIEQlLbWncCo6LHrfSj
         3vfOVUEJQ7Zs6hY30hlBKQKH1Kx79w/vl1PIws5AuPUoITE/nxkZZXx5KxHyzgapi7vZ
         1SzA==
X-Forwarded-Encrypted: i=1; AJvYcCXX7ZM42sQSct27ru58xfZZshXLT2lUO1b9w1qG7RpJCMxzDtvb9RF8dNWj79hMieZFcLqMx/N8VMjG@vger.kernel.org
X-Gm-Message-State: AOJu0YyrXloJyvsSGxOxC6m44CFjPU7Z7EQdqgPUHENtsDLVsn5v3pfm
	KgHPgcRRFKyaLcbHTqglYEKQdY7BBQL064ncficvP7ZoZOs67EEKq2LTk389CxyoxAksqF4ypSA
	XcinI+6QPU4jKIiZ7I8Klsuh13k+LZkecDpg2zGO3I8dvn+f83UkLb79inOqIY0bD
X-Gm-Gg: AeBDietpAbUjEuis7Ite5d8Qc3eBDsMRy4KrvoaDbkLmf/v4KX70aA1Va5iUoG1fgna
	UoGJLxYhcGnMXDG1nEZH2RQPjij0h2Rp1l3FvdAyY2wloYprlEUPadQLPf3thhwES0LxUH0vh88
	nReyI/rCS+PbVXUmDa+ISZIX7Z9E5FreXSYHsqgpd8QyDmelZkt9uYHndSj5IJWjENz6XMOIsSM
	uzH227zIsVsUlrIbf54a9bwzVbHb5Vx8OoQA6VcXGICD+uve9xXEsQvBDEUwhr7xKB+TammPe1x
	XksZZHeCBLY8085IlP2W1Cu6MBmknMTY/vaMEU1+yJ+Nr6vSOJg6WlDpK8slAGq3WBCLnKvj3Q9
	NjWFNgLOpb1WW4wUC924lbpBC//QJCcaHBTE6+kWuaLvCeUZDzsFc4abURi5XN9yhkNuMF02C9L
	d9cgs=
X-Received: by 2002:a05:620a:17aa:b0:8cf:d5ca:addf with SMTP id af79cd13be357-8d41eb0c1a7mr1574812485a.8.1775558738236;
        Tue, 07 Apr 2026 03:45:38 -0700 (PDT)
X-Received: by 2002:a05:620a:17aa:b0:8cf:d5ca:addf with SMTP id af79cd13be357-8d41eb0c1a7mr1574809485a.8.1775558737808;
        Tue, 07 Apr 2026 03:45:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034b976dsm4286446a12.23.2026.04.07.03.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:45:37 -0700 (PDT)
Message-ID: <93cfcede-25dd-4fa5-a242-d52292e594e8@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:45:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco: Add iface clock for ice
 sdhc
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
 <20260406-ice_emmc_clock_addition-v1-2-e7b237bf7a69@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-ice_emmc_clock_addition-v1-2-e7b237bf7a69@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d4e053 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ayDRyuo8yj_178KQ7yYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwMCBTYWx0ZWRfXwqOLxEXqTQ6a
 dM83HRkVoiF+AwScFGTk7t2rECVKNupUW3a6OhERQPXLOMYpE99mYCSvyQkWcceZrRcWZxo35en
 yqzKeXDpfCxw/8FQHAayBvoy0J3XTEDu7+1xZSSFbkO9NhBDKoVkhOAYtjZ/MfpvfookwTdKVNT
 47kza8y9kwzp97/cYTCeWNKASYwBLgFv53ElTOPzg7AuHjYZZ0XEN9ZauT5VSDXjPVqo/6zQWrM
 iM0OWUBFrMMdCVAcn5TEH9DttEJ1BYzcvHbtIaITYLkSFs81N8f0rJBmyBWV7XXakefFJYEltNC
 d+PAspZ82N2jIGmtFeLv96iXYXP/RGTaEsNCuyyVaFNZ3YepS1npmFBVBp6t7jgk2u1VBgdz4rH
 NlrPAVIxKyqhXu1huiv0RDekm+5m4TyG+CWHD92YUTHFoeuLFtOiInEL/8CBvz3SrIQsjMjSuNd
 HzOUybrg3ilA9su3nsA==
X-Proofpoint-GUID: -RfdRzvKAAmk2fMUE_uKPyU4N9qAlJsx
X-Proofpoint-ORIG-GUID: -RfdRzvKAAmk2fMUE_uKPyU4N9qAlJsx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070100

On 4/6/26 6:30 PM, Kuldeep Singh wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core'
> clock the 'iface' clock should also be turned on by the driver.
> 
> As bindings allow to specify 2 clocks, add iface clock now.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
