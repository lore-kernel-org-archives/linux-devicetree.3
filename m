Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299D8386552
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776941479; cv=none; b=Tw/xYBe+MDN8jcFV0CM6oZuLGFPZH4oVfz7Qt3/rWf6AiflCEqycWydHR/6AfauiJbe/NyxyL65DRHUkGCTmuuhizHxbEo4RGOyal5Uy3lI2AoxeBBp2JuRuwdd3CQqt+5z0UXSP/y8KOO9WF0nYD0sAs9ZobEDMgWlrxM+ywOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776941479; c=relaxed/simple;
	bh=cIvHu94OlK/VxJqhDMuNfUW0Ajkc5iyIvjAm7xvvlPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cHoIbj8sWacGo4tEoHnuIZXPjFYtv6rMnUN6cTYjc2qjC+YFLTjIJuOcrBWEKxN4661EJaJy6uzVa0VimSE85nSzfT7Y9enftB4IXf7B+UscSXWGEs9b7/NHvb/mxf2elDTfiMyJCpxB8gysxp2vKLt7+gBnKsUSlaAHhr2zOlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GjM+Kzcc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9CfQrJf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GjM+Kzcc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9CfQrJf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8u2Gn366232
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 10:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w83ZZ3NDs84zER8XEdkG1ZCAzD0K73Rh1Eh1mwK1mlw=; b=GjM+Kzcc+f0QPt/M
	2zjgkr1R7mcPqniR3cY+PVff8FpphOstoJtdSgV9GjvrJ1XndZg1sCdzlUYWdJ/7
	EJmRE3eZmjuCEaAPEIFMbQxD6IdAGxikRAArYEd6BVPLJIC+olOq4XHDnxmiBmAT
	LMKSBlYp1JTYPEejRl/Q+XZbUUN3F+lQPp0Ix7C0oSZTTVQi/p5TtuarQdQtT/sP
	SgQgh/iyZ+80awSw7F7p3kJngWZuJlLQoTAUdB4pci1V59aPmcbOWXDtz9Qm8ND0
	5oV24vVtPq7KL1pjGXTb6mTi5QaEmWUWrgfT83dHX02uvA121SmNDo9+vmDxEMHX
	LKdmFA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq35rb34a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 10:51:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e5d7f4b63so13220421cf.0
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 03:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776941476; x=1777546276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w83ZZ3NDs84zER8XEdkG1ZCAzD0K73Rh1Eh1mwK1mlw=;
        b=B9CfQrJfcy39F8nxIOp3LueP4vBWeXJfn/HePRLrvEaOXr8r2WIqTBskfmjjKbOiqV
         h3Byy10jXVR10I4RFnuVqyAKFJ5n/XLiJ/2h3l80Bn9L18MSHTxGxlz2sDTRIwHjs+n9
         keRSk0dnPgmAuasvKwGzcOotjTbJD9RmI/i4gKVnXTMjyILa/JFTIDCKOhiI8Ek2XKyt
         DYIs0ZCk/HVaxAwBT5cMAcPFaOmRfCC7gUG0FSEkqQyHpv4egAtzCeBxT4M6hzgGanLV
         ZEtnoZPLFfrxXX95oCLZkZ0PfaJhVop1ApbJjWdsRVEGYN1TiHIzQdvOMEdghxi65O2n
         OSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776941476; x=1777546276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w83ZZ3NDs84zER8XEdkG1ZCAzD0K73Rh1Eh1mwK1mlw=;
        b=J+V2Kdc96sWgn8gcRjv/1RbSQuT0V7BIsyMjIQvDaaZ6JB1z7T1hHhIZuxPKSOd3Z3
         G81/98JYyT3BCtOVEbb67gLWSaOdRzDPHcBw7pAtXKq3YEcn+wh5lOFlsQkuQVCfpSB5
         GEri1YEa99O5q6vJ+GFwQsHD5mtf9X8scKBZH8cZhj55wSddwW+d1pD6FNq3ltie5nzg
         AcQ3wLVmcuH1YBqknTUu/4UTH2c+wVIISyPWNKootRWWZ4GMe0mhFQE1XmrDW7zkXFRf
         4ruxTCZrOkW0oMUFTK03zzGG82m5bxVHZXJXir9KS9y9IMhbyF/cnoBd3BYPGp0/pe5X
         iYEg==
X-Forwarded-Encrypted: i=1; AFNElJ+wmPpb6JYUnLhFCWzcKy9yjVLCJ4q4xeNnDTwoIeWPYFDd7r/1vkn73vK1NDZTWhrRTGmzQAWnSJju@vger.kernel.org
X-Gm-Message-State: AOJu0YzNGkc4pQ+7w8qhzpJmA+crHywIw7FJSWfiY304qLw9XLIo9SpT
	WN+/AgfgNkwtlPCxwy24L9V4oIPq0nuOJXPUB3rZ0eZU6rqi0XWtGezPI6Q6g+oibctPQLgJiTW
	bV5l3YpGDWs8jJbt70nedBjByVaFoqbCcNVEAip1FDjcjR92vSFSISJhLs8oQmPeA
X-Gm-Gg: AeBDieuxoPZEahNPbiOFu7jfFCX3A20RvrZwRdz05ddD+jFunVd1aRip0FCiLDlfVtc
	5u0FBrOkMxf4lZF3crHbbfwncKLs/wF/D8Te57V1IV8Xn8nYYtmfXRp9yT1+aCStHbS/tfUbA8J
	wavBpM0HUVpnMUFf+yGodpifK4RSlvBGuDWg3PsSSr2SYYU4lxoZfMrr02XXMDcxnWPi7LxqBos
	Czve0LZMPuDprwaI+JSJdm4c+EmP2dw8wgwlcNOKn49Zh81phG1RxWK3DqsoqOV91+JTrRixNJu
	KHP7gQvprdxRPRFW9Czzln64j2r87reZ3KhABHquyanwHq+hYIsmEascbSzXbjIHlYCZc7VGT7f
	kQ6iE9e26T9Khcp8rZbeuhqQ5LwOdfsgM8tID5Ey/go/JbxRmGrJLfXNWrCm9XMOmAqAbAk8x0h
	MUBla78HTo3ZWleQ==
X-Received: by 2002:a05:622a:a06:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-50fad4a0f81mr146970321cf.5.1776941476322;
        Thu, 23 Apr 2026 03:51:16 -0700 (PDT)
X-Received: by 2002:a05:622a:a06:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-50fad4a0f81mr146970031cf.5.1776941475940;
        Thu, 23 Apr 2026 03:51:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba53297b1acsm573805066b.53.2026.04.23.03.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 03:51:15 -0700 (PDT)
Message-ID: <be874611-4318-405a-886c-4a7e434b3d67@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 12:51:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100: Add clocks for QoS
 configuration
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
 <20260422-x1e80100_qos-v1-3-bcc2afe4cc78@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422-x1e80100_qos-v1-3-bcc2afe4cc78@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEwNSBTYWx0ZWRfX6Zi4orAswqfm
 A7ZCbuSGyNqO/N83c+askEDSojNarYWlZeyb8IqS9l/uFF2jviHe6lNvxB3AHjzPh6WVXrrj0nN
 5/6zWDlzCL/rSr8VhCG5wjPu8+YyfEGIfoCmAyzJHdyASqnbJEwk6FIItxiI64TIe9fAz/850Hm
 MiBcGbgtCFBXTpv6nd9mqojuWBrKffUALdxsjO+aobmLbrMSFgCSwYKc30KPRo3iegJCOwntFCG
 a7iJ79ev+YjUGt2/IVNvZPgn+BIavlNezFKVvztDwoawXZyVeEW61m1sYmRqzw397CWGUqV/Kq5
 VdJ9dUA94YtSFx7zXWlFOUO/7HJmxviJiSblkvOEFj3cK8ygXk/vqTMAqTXuaxhgxBkq2dDGolN
 qRhx9LVXyWNq0E+TdJI4/WdgT0FjKxGHjAkp7UL5eOJhll5wK4agugGdVDgMBBwdQpBb4w+y3zd
 fq2rkqgSMdGpR6NiXsA==
X-Proofpoint-ORIG-GUID: eAmWUd9M9K3kBPLWRcsXD0P9ZETe_S2D
X-Proofpoint-GUID: eAmWUd9M9K3kBPLWRcsXD0P9ZETe_S2D
X-Authority-Analysis: v=2.4 cv=f5J4wuyM c=1 sm=1 tr=0 ts=69e9f9a4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tiNWlLPGnZEfyRn2lfcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230105

On 4/22/26 4:05 AM, Raviteja Laggyshetty wrote:
> Add clocks which need to be enabled for configuring QoS on
> x1e80100 SoC.
> 
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

