Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64A93955D7
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785430327; cv=none; b=HazoHFo3IQFmHMPQmCTC+c7FyoPfPy1yDdgsezqxU6Q3elLlgLa61K7aMJJlD2IeMX3g4oY1LGGznVMvxhYMb24NJuyjoI3vnuS+bl2PfaD/r4bSJXv9p/wVgcDR79SicqQOns2k9Ggq/y+NO02/d9f1x92iYcxyh48Hk+WuMgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785430327; c=relaxed/simple;
	bh=eFQs46UQW/uUUr3DllhyhJwvo7BmZtEa5c7lO04zZBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ldrIcnmkD/oc1rG6UZTotq9AS1mwx/NplATqJmdtHJ0Ltq+XR5K5uSW3Me0qEg4esF2g8emGTrT/M1KaKLt7M/ri9f4+pKItqgm4skStdl+0etjMky+p1S87qYL/wUx2YIw7uNFQprkY0YumjMIDPOB2tRYPeBuj9IYs9jfJGY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V15SzKm7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mm9uDdl8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V15SzKm7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mm9uDdl8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWZHX1302354
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZvLrjtVbvFlcsElC55z/IL9z/3XvPR4pbUGYj+UMiE=; b=V15SzKm7SowacOQV
	ujD/B1qnxmoWr9Bmuy3+WlVZyaZn4h2PRUrdRVq43801wptioS+SbvZ3TZISjDG4
	ox0nTJRmzsid7tvw78cVv4ieNkziOBhynVR90Nx/1s5/DovNS/+9dWJ+a1gGaNB8
	yS5LOYRpZBHnS5vB7bHInjTFN4G+dZL5pq1o8yz2q7flXJu473P4JrKI+ta3tXGQ
	9xPGkoFpAoKfq6YT1Zt3ARcA8WdcmTSpOKwpQUZHbhkfYEwq1OSG/9ry4N/XR0D5
	KzdibXgO3dKwbQiHT67/WCCPqmhj/KAWIAqoTtzTrfdwCBqSiJK96R4ao+o+nY9A
	vmdT6A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8k60t65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:52:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c07313be5so4348281cf.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785430324; x=1786035124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZvLrjtVbvFlcsElC55z/IL9z/3XvPR4pbUGYj+UMiE=;
        b=Mm9uDdl8gup+IAFFexLSfaUVRTmO4Ji99Kj0ph1a2qqMDT8louQ8bu0C/SoUqDvMwu
         OWWeXMTD0+t4iX1/aLHNdKle1DlJjzrqfDDh8z9LTZIdV3za15K36/suJ/EnCoHHIx5O
         Qec2PY6+aY9YbFOgfYOn+qGv1JeIXCkaYA9Xaw3g2qS5YxhYDYSiw7OF9sYc4BkK1yGh
         2+4MKr78GlsAooriMGFT50uMWwbVo80RYl0DIE6JUklx89fzX+/9nWav4DT1jCHrQb2A
         LcEJnAQs29x92NwUVuveYlf4MGNtKjuzIRltag6p7NGA3r6FUsV3UT1XWGrh4bBfn8F2
         A5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785430324; x=1786035124;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZvLrjtVbvFlcsElC55z/IL9z/3XvPR4pbUGYj+UMiE=;
        b=ENEJ1TyvZZP97ZT1HhAOMnqYXtPMG+bpKSDtZTcOKwc6Nf0mkcccTgarID7OMlapnW
         eM9c1rExBhxW7wwESEV8LN22krHll4bA2/nvnJmn1/KlSoiCnxCJsalf1bjHMjtwBL82
         IgcrDPF9I7zkPkh0YntfRK32xAJdnFL2uFSfY4+2ARGCPp8igDYpVHTSciy01d9j43ZL
         m9w/9qgJ9JkjbX+ss68FeWnjEHeI7i88NKyJw3QkxSPVDJcMgrOlEiIl3hC/PF/+crx4
         U8/VzDi6R6pRiMKcaEdw0kGmHjxCrQr8N0cK91HElWVFNncqL31MksBERVAySA+30ceH
         ztnw==
X-Forwarded-Encrypted: i=1; AHgh+Roy7w4JVq+akVykkDOIp25Ltfej3ZLpR7AuebRzaag0ESU3B2QBQtGipOLj/he2RiWJRIRuosw6WmRj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe8kB8580H9+gSTH6MEsd+NeOkKa6B/58KEGSMOdIf+x4mzLBk
	Y17025v3edTqfluAPVpPuETLIWbEhRTDbQofiQYmWplbBH/Llyz4ysxSSXkze0//FlAJasPxpMv
	TSNgiFJK9cEchWr2p8Tn4PaMwlaMIQwMtMM6qfVhtoImRzcpvgyM25DgE73j5CkE0
X-Gm-Gg: AR+sD103ciSdtldVHaBuOtbOPuDefTS6n/O3VLvCHIt0/K4TAs3Slil05gEt+Qczlrh
	zCKiZZTWkpsH/RMdm01bPG/k91PW/eXgIolbGKxkOu/lYBZd4ysR9N3NGJTSeimoc/9VtvuGP51
	VJSabhkbB/e0ygG5WToIlrNyUnuW1m+k3khV3RU938JZo0LwGQaGmVBWREC5elxD2Ie+VrRBX37
	rlgOzAI/n4cYsG41xUyLgHVywsHhh0Xo78YqMOrQAlyAAt92dpUorDejLC+iBD/IdJQ7N9viaoG
	hCVNVpR6uKFyrXx3KQAtUlSaIVoOKYPIoDzh/gRq214oLa22dI05EcrJ7FK4ZX+ongGK3Xk6WeJ
	0qtW7N9eO/0ilcJbzuBhRMfbL
X-Received: by 2002:a05:622a:a98d:20b0:51b:f40b:2faf with SMTP id d75a77b69052e-52b42cfd32dmr12299221cf.4.1785430324185;
        Thu, 30 Jul 2026 09:52:04 -0700 (PDT)
X-Received: by 2002:a05:622a:a98d:20b0:51b:f40b:2faf with SMTP id d75a77b69052e-52b42cfd32dmr12298711cf.4.1785430323655;
        Thu, 30 Jul 2026 09:52:03 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07cb79672sm971478a12.13.2026.07.30.09.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:52:01 -0700 (PDT)
Message-ID: <29de839d-707e-499d-a90b-36aaca0bebec@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:51:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] usb: typec: ps883x: fixes for older Thunderbolt 4 /
 USB4 docks
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Sebastian Reichel <sre@kernel.org>
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
 <al6-IyyWYRnEW4VC@venus> <al-dJjzorP-I4Yff@gallifrey>
 <al_0LjwmfW-cECnY@venus>
 <41222b67-19e5-4f74-b4aa-928d05db9675@oldschoolsolutions.biz>
 <amDi7e8fqqzCRlAc@venus>
 <47810646-3476-4f5b-b140-77b1934fd5b4@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <47810646-3476-4f5b-b140-77b1934fd5b4@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cVq-PstWLleBaPUBaxxsnh1YCwfLY1Jf
X-Proofpoint-ORIG-GUID: cVq-PstWLleBaPUBaxxsnh1YCwfLY1Jf
X-Authority-Analysis: v=2.4 cv=Wqgb99fv c=1 sm=1 tr=0 ts=6a6b8135 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=XVzYpnm4nMk_FjgVKJMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyNiBTYWx0ZWRfXwzBf2j380HE9
 Gd0J6z1nHmS1eJL0HVYSTo9zWFdmKH57Sqv/CcL0EvQXwe0cGZDV2MXnrKM/cr+OYzeVGVoAE+y
 bf9koOSk/O/5rwGNiIp7s+Poa+S0cJabTHV8Pt/hK0KbTCjkcDy4euX3JbrWR2/OofRBDMnr6Nm
 OlryPRcJO5R+h7ndA1KEdELubOLSXJXxmnRHhinDnP+wVdfXFrsy4Cng4GPnYGO881Ct1sQA7Ab
 pz4LQXbePdPe/0WpOqRiYiV9RtePIWuY4fmdngp7/MkdsjPGHgFK9nx98zNBHZaGqPXZv8Ov4Rn
 d5+LOiGzfrPiSKOrnljkW1fnJqnkRn74j3v383hjMLmnmKtK4PjZKR+2RgwT+Z6Zyy20vYcTlBg
 XRDA2DjlktYm9F9M3VEE4wF733dj3hqp6r+GAE6z2lF3KQJ0T3G6U6xqWFJZbQavyMjp5wwkWHO
 YEYPk3KELAGMJjMW7aA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyNiBTYWx0ZWRfX7NSP0Z0IbE95
 UPl+ePrUAzz3XUlBOIPbnTphk8r+LJ+Fn0dyb7f57NPjGeSB0A0NbSmqTKhWrdwMfnH2uw+wbE9
 LI0Ni6/GXnoOTRbMZXX7GhI6WaLXlgE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300126

On 7/22/26 7:18 PM, Jens Glathe wrote:
> Hi Sebastian,
> 
> On 7/22/26 18:03, Sebastian Reichel wrote:
>> Hi,
>>
>> On Wed, Jul 22, 2026 at 10:38:34AM +0200, Jens Glathe wrote:
>>> I understand, however I wouldn't want to nerf ps883x for the Hamoa
>>> platform until the USB4 stack is complete. The issues you
>>> currently run into is:
>> That's exactly what this series is doing and not really a problem
>> considering USB4 is not working anyways.
> 
> ...yet :) Alright, nerf patch it is. Question is how broad we need to specify. You have ps883x on all x1 (Hamoa and Purwa, like, Zenbook A14, IdeaCentre Mini X, HP Omnibook X14 fe1). So probably those compatibles: qcom,x1e80100, qcom,x1p42100, qcom,hamoa, qcom,purwa. Looks like a nerfing table :)
> 
> I will do this in v2.

On one hand, I would just say "don't be surprised connecting USB4
hardware to hardware that doesn't [yet] support USB4 doesn't work"..

But if I were in your shoes, I'd prefer for my dock to work too..


And perhaps this is a common problem. Do you have an x86 machine
with TBT/USB4 where you could build a kernel with
CONFIG_THUNDERBOLT=n? Does the platform firmware there handle this
more gracefully, or do we need to make this a generic consideration?

Konrad
