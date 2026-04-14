Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A8F3A257E
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 08:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155077; cv=none; b=Bt0JB7CMvu6u3B/JbdV0K2V4yhsLu5SCCgGOSwgJZCtoO6TNRvA8lRTGj8q/OPOFSrqa0m6Ao+s5O4Zg018vJ+HJ+52u3rJ7JcXKEJ6PSqw7qUDb4Qo0mUlHCc8QJIUKbImscV7GqOuCr1EkPjlrN7FTXL/ogGBPjKQE1FN5Rqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155077; c=relaxed/simple;
	bh=9IF9m1mKLVzcQNa7yd1qS+gKQCjkoMgglb99+nR4csA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SuSrLnhNOPDIigr5rwlSFtMIdtnPnMQiz+V6YzJroDPXoEsBNzN+sTDmZlrPwGIU/+wDVP4aSyFYC6EYIvA4shC1j246YKZRxx+hvG+pxHCiNibZv1+WhsAB3Kvr0xYB7KifOsnkMAYp2M+SN0JboP/QZmzqBJyh7yYlqSy/qMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R7Se93AD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNe1n/8L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R7Se93AD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNe1n/8L"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6bxlu969091
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 08:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aIMSYQ0X7vND3I65jUYYSFUk
	nWvgiYPlHx2DQST0cP8=; b=R7Se93ADokkKnwQTqrzGYCGmgfCsHHcNAYh3ebmP
	rl9XNbnOZGCrsnG1yD4dluHBO9erC1T8klrNo3afg//7n2/QlYaIc0Jh+QFV/PzX
	FiqAgJBtWgKEtwz2CWviItqBD78GameoxWi1sOWR97B/WO9dDQwucrPOC2mFGh3x
	dv8Zm8syqY8F2N0cuWPTDjaaR/gYEpUy9bVMyD8E7PEwGDDqm4Jd54DNFjc89xTg
	pT8kBD1fiag2geFEbRVDstutB3VO4U7WQ1jKbk0fCZH0zMYlU5cSHLKf75P2kjOx
	4rXpLkua566QR3jOQI6CsuKOM3UbxHugQcFPybP2iTSPpg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v1qtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 08:24:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24af7ca99so75030265ad.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 01:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776155074; x=1776759874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aIMSYQ0X7vND3I65jUYYSFUknWvgiYPlHx2DQST0cP8=;
        b=HNe1n/8L2wh4sR4k5oIX9XuxtMFt9KJo603keulaYu7EeWYTW1oBHu3CRPQbuKqgfn
         XbGd5fFD9lwREjn5MtzKqSI2V8dbnQaC+4rr1P23LoLKSSFG0ndZiuyzXHZ5S4vvIMSM
         EDgEHVVy4siPhM4kQf7Pjsm6eEw3ms54uMfuz6hI/OSQZkSqcq7ArN/uNoWGbA3GFjSl
         dtHLlEoIRtpjgVoesIcjJ1Ogc5K3bc/cn6jvSNFn7Za4pFU72GXS6THTsYLrVVwCIMjF
         cmxci+Ev2jNQX7owcJuceAfAvDCjufciB8q7Ark4PTqsAGe7Rd1zDayD5DUQgeqE1jBS
         aygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776155074; x=1776759874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIMSYQ0X7vND3I65jUYYSFUknWvgiYPlHx2DQST0cP8=;
        b=IVF8QLv8ZabWt7pgL5/efyB2PjCwhaXAqGlP3VUTIe0DEVIdsmsjqmuO+pClZDvsEa
         Bjz8n1ODfib011vkG6yL67fMsGDOceN/DEDfXoc3hdL9e7Sag6aHLpcpns0PvkEp1tEB
         29APioo/ropXogU2b0YNy5+Xifpal0hj0NiamWpxczYD9gIBB+p3/9ok5JPOLfp6a0iH
         KAGOTLVow64F6O7SgTr7emU7+cKzv7fVdr159iDRSf21DWG02UVMEcHMeUIudhmtcju2
         SDCbyLHW2QSO3lC4iql8PvT96WPC+z3IfMot785kKuFnvz0WrNmEmULCa2aSxfvc9+T5
         oWkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+bQZs2ruTkD8xOXP6vnuB+oiFLrGz3HKw7JyoUkC76CqkTkelgfHQHpxYyxxa9A8ac9RdiJGQnqImu@vger.kernel.org
X-Gm-Message-State: AOJu0YwaWwAnX17L2en0OdPk0sDJtoallmMZDS8qvKVCkyLGPtbI/A9f
	FQavAUTFuCshRcAPniC4l18LeKGopHKJQ/7TcHtTNrxq40xCAFSuydZSAEa86t7TcdN9z+0hjBo
	kCqg1lST44QYy/n5/UHYpufU85qnVE/4VJth5pGFG5ghWSbQjkMMSOZwcQ5/GTRMM
X-Gm-Gg: AeBDieu+9Ji2czj2FYT8qoluEdcwumdLHo/X/P7ZeBxJ8Yl4Z09cLQVilxKhFmTR1EL
	KOG7s1RTjPZR4Yj+tDTHoTylY2GWv9HfS6KmY8H/fhzgQR/s/A3uJMQIMocSnIbik0n5mU2kfxQ
	w0LV+Iuy68uMNBVnNFMTWwvwqUpSIJXbM/btVxYM9xVgO+NqoGYUG3dCVbbKnRU0f1NBU0F/VKs
	j1LKGb7ErTmL8tV3IM9Qiv8cLr4PNZ7gz7xWSXyYHV5kmcnrmim8G6Kz7Z+TZtu/K5YiFpbAn9V
	pQHA23DgV+9lJQiM5ke9eq9pu7oHpD2r4SBzEzUbqT0T0Aoi+SwN6+0vNCs5s9gtgGhqlCqb8uS
	5524/hMGrn8hRXAiTPc+3msw+WhS23Yu+30lFgrDHo3JcRL12
X-Received: by 2002:a17:902:d504:b0:2b4:5ff5:e51a with SMTP id d9443c01a7336-2b45ff5ed39mr67690165ad.19.1776155074139;
        Tue, 14 Apr 2026 01:24:34 -0700 (PDT)
X-Received: by 2002:a17:902:d504:b0:2b4:5ff5:e51a with SMTP id d9443c01a7336-2b45ff5ed39mr67689695ad.19.1776155073576;
        Tue, 14 Apr 2026 01:24:33 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4dabcdesm146235985ad.2.2026.04.14.01.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 01:24:33 -0700 (PDT)
Date: Tue, 14 Apr 2026 13:54:26 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/35] dt-bindings: qcom,pdc: Tighten reg to single APSS
 DRV region
Message-ID: <20260414082426.fhkgwpjth7a6hzxe@hu-mojha-hyd.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-2-mukesh.ojha@oss.qualcomm.com>
 <gd5ixcfablbyyyz2wdacrvg43jogwg425na6utsgfcterm276k@tdko64tn6gwh>
 <ecb75ada-60c4-40e6-81bd-fc392007e9d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecb75ada-60c4-40e6-81bd-fc392007e9d8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3NyBTYWx0ZWRfX6uxnEhG/YnpU
 4PTUD/XiFhiAXaeMmLioqFII+IBo5eMsiBKvtmd3IrF8M7vQ1i4q1bNsqUQvjiX9hm0vbnhwNYE
 Sq/2M1KPITYBPVTcI1FqnZC56FY5FbAlQ/bxLBMR4rFIp/ZECZ4JGcoqXTz/tz3kau5xaa+jDND
 Kx3L5H9mEJ7yaV2AJ6HHAWWuiwMPaijeieWIIr2054pH0wh+bpV4VrnCnZtKB+MsWmIf3yNVMPd
 ay3h4fjxK4ZgpuZ70JWG40QlEp7dz/2du++/WigpcFPqpU9SjYYGr7CeXrKQFJcOXSFDWyCSRhq
 IlnHCSY6+K643AJafZBkcmMPXAbXekD6vi0ouCYJLoYALZ+iLPrke2IT/1atUJFwVJLXRFa5gt8
 AKHWwemONl6MuZuE7KIlE843H7HvhPUpQLzFyzBUxCPxH3RHBAs/UBDlAIedZXv5GJoZG2ggjKT
 B+2A6IWodCsS4igOTkA==
X-Proofpoint-ORIG-GUID: J8e4A2Op_Pk1OuXm1ONduB93bL-BNjAT
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69ddf9c3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=5-FrFs3OjuvqJegpMgEA:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: J8e4A2Op_Pk1OuXm1ONduB93bL-BNjAT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140077

On Mon, Apr 13, 2026 at 10:23:59AM +0200, Konrad Dybcio wrote:
> On 4/11/26 4:32 PM, Dmitry Baryshkov wrote:
> > On Sat, Apr 11, 2026 at 12:10:38AM +0530, Mukesh Ojha wrote:
> >> The PDC has multiple DRV regions, each sized 0x10000, where each region
> >> serves a specific client in the system. Linux only needs access to the
> > 
> > Nit: there are other OS than Linux. Would you rather point out that
> > other DRV regions are to be used by ... what?
> 
> TZ, HYP, HLOS, CPUCP..

Thanks for pitching in..

> 
> I'm wondering if we can make use of the HYP one on e.g. Glymur, to
> parallelize accesses (and whether that would bring any practical
> benefit).

I mean, Ideally, It makes sense to utilize extra 0x10000 to use or just
to use the hypervisor one for Glymur.

 
> In the RPMH architecture, each "client" has their own (GPU, AOP, DISP,
> etc.). Then, each one of those clients may have an associates RSC
> (Resource State Coordinator) and/or anyOf BCM ("interconnect"), VRM
> ("regulator"), ARC ("RPMHPD") voting interfaces
> 

> Konrad

-- 
-Mukesh Ojha
