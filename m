Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1014A3EDACB
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 19:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777922229; cv=none; b=KxSpu6PESAMaijBOaqq5lDi+C4NIrNqFaC1wq4EKFGnVRK3Ehvxsb6BRtjfWz75sP6+Ix0xFPMf/WqOXGKU1OLpYg1FTCe6h4RWX5OQ5Sf3Gv0t9cW9PzU1AonOwVE2NF1Scc0GfRxisPZnzJwWbAJdnSk33pUA2IqreCT1WCbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777922229; c=relaxed/simple;
	bh=76NWrhjV5D1g+WyrjAXtwxC1OH2IXro77m9hkYo0r6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AbgDycp28fjHhJop7p6N5uB2dLrjnlIyvhXtLe0Q5zOAZ3wTvhKjgMdVOe/wlzjd1/3JL/xLm75MYiwv9Kl8ClrT2rZAfyc5kut5ZPMtJ/n+s3KJGyQvDGFhsyiPBbTPUW3r3UfUc9kIsuS6dSK6yfUg2DW1ejPJjy802ZsoT0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgpBtGTC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/KNx5kG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgpBtGTC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/KNx5kG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644I9l8b748927
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 19:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W6G83rJeBMT/sAZJvGczsYskezYbPGxNvoCtVNAkpoc=; b=jgpBtGTCoYB505HP
	zH4Yy6irAGD5XrDcWezuhlx09Qr6g1rcUeJu5jcuJvFhtM5Pdk4+eEumSyQHcLmy
	+nZnJe56NUCEALh219F4bg6KhhdmNkmPWU4W/w9B6HsjQQJiF+nizik6kqkT+ZV0
	VqTTWIlwhsgKkfC+eauEjYDXgUS9wB8PAaL4Y5FxDJn6Qpk5IyJayq/FeOtmOMDo
	EhiXsCEiWAPOBtMOmrt3G9xtMo35NU7pZLjirkppF0dlZqGOXjpudTiXDW+mmsYd
	MAzsFoHOfQ0OXZD3FynYF27AP5pRU/Xz7EFh4UPIpFLeMGR1HS2TiFcC7mSDC5c6
	Aaf+rw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscf1ybt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 19:17:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6e8fc8af18so414678a12.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 12:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777922226; x=1778527026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W6G83rJeBMT/sAZJvGczsYskezYbPGxNvoCtVNAkpoc=;
        b=L/KNx5kGJFtUP4/vLtV+cjn12aSC4ZTLETS2tGmMiGQZGdRtEt5YIAWe//0pqKEkww
         +Zd0Y7fEMPObckyhZ06pSYA/9UPdplqfFer7s7yZYA+aynf0vd62n5vmGAzsQq1hNnyU
         rgk6JPERVNoto44GtoPvehixv/tNyK9k/cmAAwxeJoILLJXPBFCiMHMlEdwUQ+geHp4y
         bhRnZjijXNNWaFSxq0wvrn1v5/a5tBhy7LqRs2H/PdZRq1eRdF9PPIrkQ/4ZtJNVOpiO
         KOrtIZiDvwb1OTQw1XDAzNqPtEOd4tbOBf5+pbYDoW4ErrlMlMPOgWhTkuIiLimpdXtG
         y49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777922226; x=1778527026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6G83rJeBMT/sAZJvGczsYskezYbPGxNvoCtVNAkpoc=;
        b=lZyDgJjqrQM45FQl5cTaTcrswoWu1KC+u65i8mm5fgw+JlHvw4J9YIDSPQwu76wcpm
         xPIsxSO7hIBhZbJcVmsWj11LWYll1rOOT0vU/bH72usWzCImZPktoctfdrdfjyzSRmkq
         RL7Lvt64A36p907O+A+Inoi77BhepzL3f0GfWRtUu9jZ6+n/OX6/iDAAdcQXntPqSY0E
         pRIUfdO7FhPMDdmFouSE5Br6mEvlTlnYan+2gDhOO1sKlMtG/0o/iXtzomXWtRmC37bX
         HN8luLvbKBpnSDj4XrcmqqMrff7I8xgOUrG6VCzDrhLolfdntn1ra7+XEJBpBB6ue5Rm
         t99A==
X-Forwarded-Encrypted: i=1; AFNElJ8pmjpFOEwGAP+Hf2Htffwwk1SBHI7pwEJob+ypFceVRlHbABuG8aw7csyWQ+Pe4fF55uxipKsqhYJD@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb3U/4KUm3m3q+XzSgjbhPPBkbVZzJcBvAUzQ05u/y3LXNoIn9
	uliTBhgbvE/h0txUkN/w9kc/+FbMW039aBHr0gxRjlB+/ohghFu8txF0cDOpmU5blaotBUvd/Ch
	BmsrvzAFzxfxNgTIQLnHWIHARNRGpUonmV6I+wwAW7+ClC+Yimi4Dxcwmj+MUkQWd
X-Gm-Gg: AeBDiettluMCi2ceCSz78nB02wpG19duZEPncK8dBQEh7UJz8LUTvQSCkYkqna0x+v2
	B3gF2YPEoqLruw3E94I9gX+VIhIagG7VrYRzHlhEiXv5LxYVTz9rfubLm5Uwwr3knt/+lVL4xCY
	lhsyIqNR8QXBYoEmB3HoD/7tt7ljOakBaYe4BA8+W0draQc51VRPp0rKRZuEl8wERgm7Y0DNeib
	twqhq2jJ6jw39s6gdzLIoklNfgA1gFBcAjzFThzZ+fxUFCEMWj+kO7y1WtD+CGpJ2XQv5b5mzo4
	2hyTxX8ZGVY8cru9V/YqRa+QQQKpz8wMnBO6DGa6QzolXLPVOIO52zHFNF/OlrL/V4AfSMOl9ZI
	1W00kRbC+LY3qcS1lUnKgaUIDxUfGIyZK4b2pPb8Zqn/liOHPOUUcP+CvUa2K
X-Received: by 2002:a17:902:d2c9:b0:2ae:cefd:18ce with SMTP id d9443c01a7336-2b9f252e30bmr58939905ad.2.1777922226003;
        Mon, 04 May 2026 12:17:06 -0700 (PDT)
X-Received: by 2002:a17:902:d2c9:b0:2ae:cefd:18ce with SMTP id d9443c01a7336-2b9f252e30bmr58939615ad.2.1777922225378;
        Mon, 04 May 2026 12:17:05 -0700 (PDT)
Received: from [192.168.0.8] ([49.204.27.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caaadf8dsm116520485ad.23.2026.05.04.12.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 12:17:04 -0700 (PDT)
Message-ID: <b734a099-b5db-4ff9-8b75-265e7f8194a1@oss.qualcomm.com>
Date: Tue, 5 May 2026 00:46:58 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: monaco: Add monaco-ac EVK board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-4-umang.chheda@oss.qualcomm.com>
 <0edacb23-a132-4f9c-be4f-ea3326c8d8a2@oss.qualcomm.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <0edacb23-a132-4f9c-be4f-ea3326c8d8a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BcvoFLt2 c=1 sm=1 tr=0 ts=69f8f0b3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=U0tfe/lGaXrCh4Nw9m/t+A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=4d7jUEtvsScEJznLE7gA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3NyBTYWx0ZWRfX/Uveddt3ZfOe
 PMcqrioPNCfR8P9Q23ug7S8mq4DZMo0w3r2BhvCA3otejnzh5a8v+SB4TyGIaemsCKiEQ6RGBVk
 vwL3t0mbWonNusQPYjAi1THVLp9piH8qk2fwFrMyo1J1EYH60me4bLIW28oN8d8xsrPgtFcTHrr
 gVC1R3ZrRhzzwKcXJ1fytUO/za/kJ0DjmVzY42JeP7jyf7rY3SofCqId+5/cvFeAoWVq1DI58MD
 O9miE0MiL28ylIqFPfzmv3LT7uQoEQUcOCDFqe4+H6jY9c5OsYzAiPDcqOf2vZ+JnjFp6dWbdHf
 XQduqRZucGWfcXpu+FfR4OetxXGAG5nQi1/suro9Bi1eHp3tucmgjyAFvmwQgYIOlVpwRf+0QPa
 yxQdOANsF7pYS0XLLuB4uDHturU3ZK9IOtUeJFBXUSbJn+qoeJ9UHcwqdpHO4DgDLBbBq0ZziUG
 rzhbki9mzdIa33DGgrA==
X-Proofpoint-ORIG-GUID: TtFCbx9kYLpehtW42fKGdzlqkTe21z9R
X-Proofpoint-GUID: TtFCbx9kYLpehtW42fKGdzlqkTe21z9R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040177



On 5/4/2026 6:23 PM, Konrad Dybcio wrote:
> On 4/27/26 7:05 PM, Umang Chheda wrote:
>> Add initial device tree support for monaco-ac EVK board, based
>> on Qualcomm's monaco-ac (QCS8300-AC) variant SoC.
> 
> [...]
> 
> 
>> +&apps_rsc {
>> +	regulators-0 {
>> +		vreg_s4a: smps4 {
>> +			regulator-name = "vreg_s4a";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1800000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_s9a: smps9 {
>> +			regulator-name = "vreg_s9a";
>> +			regulator-min-microvolt = <1352000>;
>> +			regulator-max-microvolt = <1352000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
> 
> Since these are on a PMIC that is present on both full and lite SKUs,
> are these rails also connected on the other one (perhaps with a
> different voltage setting)? Currently they're completely absent

on the other variant the power-grid is little different and these rails
are not used by any of the consumers on HLOS/APPS side - hence not added.


> 
> Konrad

Thanks,
Umang



