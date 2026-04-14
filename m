Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF483D5230
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776163675; cv=none; b=M76+yPMhl76n2k8iNc1w6V6vO9Ph3mXAa0+F7giTNf4msr1yjAHrLeFUHBdT99AH4ahDc2kGHmsTEBOgODI9+qE8SeviGMW/7CgeFtXg6cGWxLijZn+WTEj7upQ+XaPzuYERx0PwHtSFxiFw0aQIrojwDcgYvUvx78WYjCm25e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776163675; c=relaxed/simple;
	bh=8X8ReABQu/Q7ftDeGfocltLZS0cZ7Z3MVgZoDwpF5O4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mRGczCSSwL8N9BOJ0Fq6dTjG7k+pBOT0fdS1nOPqOFc3w8NAmTrlqi8WhOPHg3XViQh/sjMQ9URlI7QLf9AvwdQHdmAbUG3kiuhj/mUZU4RrHTCX/QRQgjis4/vAKQzNEDEr7dhe/3ECmx/L4h6flQxLox2cJPcvW6DNjgmfSK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YEa0kzoL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dpEKTeS2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YEa0kzoL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dpEKTeS2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6qoQd3157262
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GuSVl8/d4UX+o24MiptNZUls2zP1ssaJ7h8N9vs/C3w=; b=YEa0kzoLM4iNdUow
	37auQbpc3m/pWut5UzfDUS8Xvn7RulDpm8Z76INyrCw+6TJD1HTwhZY+PCcbakuk
	QgeYC8BTIxVDzk5wJ0XhvUmfXjsi6Lu8qnwKFfVQFmDpv62fzAGaC7sKgmJ3F+I/
	EoxuWT6sWgGwapi2BgUdJWkDO+0haqC6B5tx8sVFE4VzvIGwaCySVf8uFKblOAqv
	CoeL+E9nfSi4755OMdEE9QiGDwad+4/x1Gaq4IMeMFgILUw5qsCH7P1MKFlcklK/
	C0uGPMoiklJZLfR2PwgERfVIfbbbksEzmAC3/vFBKdaMBVNMCqKD5hSYH6eGpj+N
	zX9qvA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86bab4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:47:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b33a19837so16829651cf.3
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776163671; x=1776768471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GuSVl8/d4UX+o24MiptNZUls2zP1ssaJ7h8N9vs/C3w=;
        b=dpEKTeS28hZi+Mo4YF0acBaWd4O9BE04pGsSzNSz3IMMyonfe4vWGWK0dYv8IrpXN2
         qtKzoRBoXYagyO1iUbKkzk/eSjsrLCoyv05+rJfgYRhwwEvtKDT8wok4V1UHGWmrVosq
         SoMeau9O+/rWqz9GCoUq8V0J1NxNtAd50ZgALp0o4/Wu3fXJtoUDlD6sDgtP/3IV5WYP
         zNbqQc2bMTeHcVD3Wom7wolHu1nm+XB98X+PKtC9Vv+JGdMqIrp2Kann5l2M+sf5H89o
         jHQYZk8VEQv4xgJn6ejU6blFvmiQr5lCCfatzGTcLs2sFJQSZC4dpKtEv21JUXZFmuv6
         7J4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776163671; x=1776768471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GuSVl8/d4UX+o24MiptNZUls2zP1ssaJ7h8N9vs/C3w=;
        b=NILsmUcx6zfll2TiVHdAhlPU1WlNE2ZJKj1yPtwEVhXsHaDviYNXkNaPb+DdNG4t+8
         zeIOncxz35cLHMT/PwgNplRABixe+evqqh14XiSzegKUutRHC7XNyWmCrV/wSCh44OO/
         v+mI/SZqDnuCcfd/w1ymI58iUjDILN0G9vXPi1RTIF/utNamq0aaG9yzaSKaPkksqwPv
         whTZ4S1c7gq/+YPWQD0WKpx7E3fWLq9J/DpIrpE9DxpAI60+W9U0UFfJtCktzLKglmuB
         Uot2lxsxfc5nV2WC3hwM55bl0C/DSwU/DPh6BBnWSvpJDGXRX9rq7UD2jTGxdLcrpkGo
         n43g==
X-Forwarded-Encrypted: i=1; AFNElJ/6ZIYaze4sSXze7a2xBKIZ0WFK7xM+ESPzz3mA5gxOFty/A4CZeRsoZSTmSDTd8PxNwNFzHplp6D4T@vger.kernel.org
X-Gm-Message-State: AOJu0YzDUpaFM87r/F7fXjvkrP6GnUkeUIsCVvPnd6zonJXJHGesFpJD
	XaFA4+BRWF+zgvAeULyf18yTKtvJFhSg60PqbcadC/q3Xa7C8TPeZ2iaWd8OvQjFw/vH3FUjSoR
	HqCRGJIFpQ2e5J/159GT9cgF8w230+D3TqeXTlP2+LEEpTtlpuhA/IGJGEvIZ/jwT
X-Gm-Gg: AeBDietyI5eQjthw6f4hEYvKv6Xe7187K+q7TrWMHQFMt9Fe2bMFmgaY1XhlERxa0H4
	IqlfIIRCwj3mDileCljf97sltc7IZQilaCgMYck0MAYLQDNbueR6LtaV0T8d2Cp/PWvlQhFR8VQ
	ljiRgrprUUaOqVUKGbsFir6OUJcGN3n1yyp1es10BaQ2mURsP8C30ljq9x0vYbwL0KWARXzM6Tv
	j/Rx5WA5OpJsxPhCPeMsKnO895PiEXSTTRiwlqZTRPy1q8VEPOeVFEhzVN3kmLhLijcc0MMEAZ3
	7OatsAuTQQkbqB/QOK5cbRSHWE36ELyCkOBH8PpGFTva/4NjTHvlHxD37aWHPUQoMSA4GJH/kX/
	ZMJ86d/VWJBgwU1ugz3m8Nw/AS+Q0lVvVfftwxwdRI1czDePH0r0VZkJNVUjtRqJhfBGhfLYNP5
	9hAWQ6wlTofsdkAA==
X-Received: by 2002:a05:622a:44f:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50dd5b0ffcemr180319361cf.2.1776163671065;
        Tue, 14 Apr 2026 03:47:51 -0700 (PDT)
X-Received: by 2002:a05:622a:44f:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50dd5b0ffcemr180319151cf.2.1776163670619;
        Tue, 14 Apr 2026 03:47:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de8d689sm399063066b.3.2026.04.14.03.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:47:49 -0700 (PDT)
Message-ID: <578eba18-1a9c-4aa6-8c49-58d271b1b609@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:47:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/35] dt-bindings: qcom,pdc: Tighten reg to single APSS
 DRV region
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-2-mukesh.ojha@oss.qualcomm.com>
 <gd5ixcfablbyyyz2wdacrvg43jogwg425na6utsgfcterm276k@tdko64tn6gwh>
 <ecb75ada-60c4-40e6-81bd-fc392007e9d8@oss.qualcomm.com>
 <20260414082426.fhkgwpjth7a6hzxe@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414082426.fhkgwpjth7a6hzxe@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEwMSBTYWx0ZWRfX27zwnSo4HZ2j
 Y6dMRzWs3Md19RqyjesLztGQtBd1RrkMP0Onz2iYfyKlc7DpDeocOAGtvyOgEJf3O3iPIy6X28q
 GmvFc5QEPE32EYuCHaeUd7amQ0hz961vyW/AyIFhqH81t9xS9+5lgcC3s4EkybG1t26lTKQMV13
 fUgJQPc6wfk8uvi012zK4K3BDAOr7zzlfcSwKILRR0DmHpCqPPRSzvU96d1lg7pbUd6VmneqY9f
 orl5y7OOGW5rG83xcgYA8p57lild1chSNSiJ/KQpV2d6BXPel/geZhFx2xF08aRH2V2W7yfG3fm
 psBLVAtByLlGWxQBbFGcc2W/VG1qQaEV4fwtR23DY5SUEJYfNf/8MOwoab/HwsVQpZHSWMvMXqR
 McJsFZoYtkQMssFjwmsX6kycEoC7VXV5rEwuS7hYs4aMysmQVMvzhjkU55locjAj9Sd6PnT9Jrx
 pCyX+XWzCy6Ov76xarQ==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69de1b57 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Aw8xZ2Yx19VhUrNpqvQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: R3t02TEuasD-_z8hI7vxEOtfS8A5Ty7C
X-Proofpoint-GUID: R3t02TEuasD-_z8hI7vxEOtfS8A5Ty7C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140101

On 4/14/26 10:24 AM, Mukesh Ojha wrote:
> On Mon, Apr 13, 2026 at 10:23:59AM +0200, Konrad Dybcio wrote:
>> On 4/11/26 4:32 PM, Dmitry Baryshkov wrote:
>>> On Sat, Apr 11, 2026 at 12:10:38AM +0530, Mukesh Ojha wrote:
>>>> The PDC has multiple DRV regions, each sized 0x10000, where each region
>>>> serves a specific client in the system. Linux only needs access to the
>>>
>>> Nit: there are other OS than Linux. Would you rather point out that
>>> other DRV regions are to be used by ... what?
>>
>> TZ, HYP, HLOS, CPUCP..
> 
> Thanks for pitching in..
> 
>>
>> I'm wondering if we can make use of the HYP one on e.g. Glymur, to
>> parallelize accesses (and whether that would bring any practical
>> benefit).
> 
> I mean, Ideally, It makes sense to utilize extra 0x10000 to use or just
> to use the hypervisor one for Glymur.

Which one does the UEFI use?

Konrad
