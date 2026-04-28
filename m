Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC03937BE71
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 17:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777396900; cv=none; b=lfxEC9473Cy/7QbgpRH1kaBaSn7eE1+0ohAKDn9TBAHubfh2T2c4sjuGAOvzz7Nr58yhiLCYkZnC/nL4jkw6PQ2uvWALshf7ROPg7CPRGfrLFrr7QekzDfdx73lxR7Dei1J0tYVR9SPHMehXcW+Ny5x2ZnUx1stVrk53ZofqPAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777396900; c=relaxed/simple;
	bh=mIEJYPrP9BAaq5bbd0ByDxLbcdSgNJ/pySrTIxlF65c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MnQ4SvxMbQ5YQV2yoOOZyddNh/zb7b8sQYGTkiakifCAWJsSFSW7/DiN5DsNltzRvZJxupkR0nLmjBjzEOezb7NpJ+a1U9VdYoB9r0RUAhZdSA/jqRGsPQlJuvnREVY1/XyUfJ8e3jTg7POX84AtcWvpirzM2h0MAjl/3Tl0kR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GswPjRkI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sn46VDh7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GswPjRkI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sn46VDh7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsXr4862972
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 17:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVxM21h68QTpwQXVjlYvOOa0sB7Iufc3PjwXa+JQJ6E=; b=GswPjRkIwjKvVCJP
	rJazszKlY5U4navRZKH8a6Htm/QZGz/H59RcccgiXtN1ZPa8Vs+4UnVhr/uCxdnQ
	2CKaswymZ3u+ZoMsoL1DLN1g2P8P43UkINwa/SRs5Idnenb9/hhwxtIGKI8jBjNI
	YSmcaULRuS2wdgxHvrSA6J8W0s3zbBXYLpBu3N9YfB3z3wvVZv7UZt279XCmTlhe
	e/ssUGmciqXJBxn3fCh2rRRqfIB/hlnn8hqzo6Rr+CnzejP9yh84I0rdx45HIon9
	ighDN5Uk40XJ5LmoG7EQG7M564ftlD7CSPDlwa5AGmZ9MLQmVUBJgydorRVWjOT8
	PwxTSg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtry0j9ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 17:21:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35fbb57764aso44530a91.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 10:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777396896; x=1778001696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVxM21h68QTpwQXVjlYvOOa0sB7Iufc3PjwXa+JQJ6E=;
        b=Sn46VDh7+X7xuT39zdc+MznO6A0pRFAo3iFgKqc8pTVDqduG3v4uQWrwfFrE8VGn/c
         IlP+XIXOUteU3IivDu+bIY1nv77Co+SEvp88EWTgW08sqvP7cIk7QWciiZIl1SuWxzLV
         vmWGJREdQI9mG4b0yxiKmS5oeh4B4r3XNntnkYiWez0GW0FdTH4MCikQCBjAWVAdrVAu
         QakUW1wCA1Wo8hY43JZ7Qg66acWRCAbTMK+ta31NYxADjzYVmKcx6nAlqU8wBXao/exi
         S6CgsSrLXbBrYwBFq9zmoiX3dCb6pDoyRvtqru+hpdr1s/qDfq3Oat3TMLzTCqMfujiy
         hDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777396896; x=1778001696;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVxM21h68QTpwQXVjlYvOOa0sB7Iufc3PjwXa+JQJ6E=;
        b=dTtH49LrqNbPYSxBnO+YJW8vFwgLYggePx73AF5Pzb7JuZymlrXSUtCwaJZ2KqAy74
         RkelSSqobBWyAVEA1Cx+H3heZwz56Y5LiW+Bln341lfQhH+Cn2cMFS3L8nO7nHUub9xs
         a5z51Io2wmkRpRAqyjytVucaUNkmZMGS7QmQZgRiFkknc23SB3ZzjOkdVNAQ4YBIlZM2
         CF2KDdiTFsJ/JiVh+AjzlcvJRUrpRoXkyi9xW1kUqmF0mEk9idJhSX8nm1KI2CuXDplt
         q8lM2jY439FF6kUZLKR7LDPtsCBFS9fhigvOOwbYG+b8RxY5AACqYz8KHukhI2r5jaDN
         xmgQ==
X-Forwarded-Encrypted: i=1; AFNElJ/60aAP3Tn0z9jA6vaZOoytHIromRcbCMK1OwfvbfjPUQisXy21pYgC6w4KDgANwyLw0Bo8+pwTJ+be@vger.kernel.org
X-Gm-Message-State: AOJu0YwqCodM5mmL2QI3ZtEJA5sXBzKLdppOIkJXi0sOfOGo07RVseLI
	IhcYVcVKeUu/i0DWBsULoANiryFNeUmaoGQuS91YUwBp/fl2J0uj9p/M723pid4rXpjp0m+2f3L
	etSheDLERN8zA3P0luIODBdSL82DZPf5eYTYnQdmFbad20lRz2a/no3LrOmGp59UD
X-Gm-Gg: AeBDieuRCN+Anx0pf1QmrYw2CGv1slDcLaE0wUQWVEfrW7KcFl4vul/R6sG6MkbPJut
	bsNOqZppcPMrUGjFP5xFSpcikUmZdUWxsYVAJGXKgmATmiCZ32sf17Vw+XLKPv7aAq+6YMC/tXb
	No53/yKcDPGVRlZy82RDS/yelblHdT14fNxvIRgijsgc2fzQGDX2otUD4A0LlSF0Hi72mJZt9RP
	JYghnGHzR/brBcIOpZp++jPwRd2PRwnqYq79zcgnG7mx5BizDeMETPamKhBvXVKhNyPK7xTCuch
	YYMBnXASyF9oWQ0MEUeX+7eP/3vSzkT5n0fvLeaXYSmxHL6pGG7rVDpQghUUddnk0/mU2sBl+ZV
	djhAd8l+YoCrxvZ+uQsoKxuVMAFbJtCL2qcPJW5O4x4D53+XqYB3yfXEtcE7SAJ0k
X-Received: by 2002:a17:903:1a86:b0:2b2:3eec:c75b with SMTP id d9443c01a7336-2b97bfc3323mr31903915ad.2.1777396895631;
        Tue, 28 Apr 2026 10:21:35 -0700 (PDT)
X-Received: by 2002:a17:903:1a86:b0:2b2:3eec:c75b with SMTP id d9443c01a7336-2b97bfc3323mr31903665ad.2.1777396895084;
        Tue, 28 Apr 2026 10:21:35 -0700 (PDT)
Received: from [192.168.1.4] ([122.177.243.58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97ac7858csm34088535ad.49.2026.04.28.10.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 10:21:34 -0700 (PDT)
Message-ID: <3938070f-5be7-466c-8967-6dc32b5ef372@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 22:51:25 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: Re: [PATCH 02/13] dt-bindings: clock: qcom,sm8550-dispcc: Add display
 CESTA support on SM8750
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-2-eb27d845df9c@oss.qualcomm.com>
 <hpun2wdw3lnthjfwmycufzqrwl5ssiohdjf73kxcpm2reuyqqf@oc672sww2pqe>
Content-Language: en-US
In-Reply-To: <hpun2wdw3lnthjfwmycufzqrwl5ssiohdjf73kxcpm2reuyqqf@oc672sww2pqe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KuJ9H2WN c=1 sm=1 tr=0 ts=69f0eca0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=EwI1ikYXukqkrg4G3Narhw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=uCKRraC37LqDOxPyBRsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 1rQnMbIcPAuEgVsORtUEP7nejCaoF_bu
X-Proofpoint-ORIG-GUID: 1rQnMbIcPAuEgVsORtUEP7nejCaoF_bu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2NyBTYWx0ZWRfX8+LYOaG9j4JM
 uP2WliLbTjpe8nS0pOfmLmgTUA6ZCicrkxh5O2/3iAEeRnvgHf62xvI1VhtzuJqGoN+1lFs7m9L
 Qawol8T84vx6EbhxEZ8bLroef9Dq3lP6h4Hm3rbJijuAKphLvW1axnrTlM+kFr31TbYt/V7TFmB
 G30a+/HZu0NUAwsGeAT5TbrlnqyruJHlP0r+Ka63m8vBtAA7jiMzTbmja0i5IeqxrGZ6n/BzZ4K
 Crwm+1wX2F2ovPGO/g689Np9vbpRzCX8xWaWxFfRl4t3KljlmiGFxk+gFeZFybp7FAywrh9eGHh
 OdeOEzU36vh6SQ9P2E4+U2Ld/MEvpmb8YmJBOQQtWP8RKLxwGfOTUKK9Lo8LPI/t9GK6PUc1xJs
 fdHKeKfd1YlH63u+VV1z1b5DgcdbtEGYB+Dpm8mMMhPt1jJIKQkQNJk9wvM3495wjccL+YHiUbY
 soMize7AmWSqcyxW+yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280167



On 4/20/2026 11:15 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 20, 2026 at 09:58:55PM +0530, Jagadeesh Kona wrote:
>> On SM8750, a subset of DISPCC clocks is controlled by the display CESTA
>> (Client State Aggregator) hardware. These clocks can be scaled to the
>> desired frequency by sending votes to the display CRM(CESTA Resource
>> manager) instead of programming DISPCC registers directly.
>>
>> Add bindings to allow the DISPCC node to reference the display CRM node
>> for sending votes to CESTA hardware and the CRMC syscon regmap node
>> which is used to read the frequency look up tables provided by CRM and
>> populate this data in RCG's frequency tables for CESTA controlled clocks.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,sm8550-dispcc.yaml         | 48 ++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
>> index 591ce91b8d54dd6f78a66d029882bcd94b53beda..3e049b2160a1781c866bb30b29f0da5c9e156b61 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
>> @@ -60,6 +60,18 @@ properties:
>>        A phandle to an OPP node describing required MMCX performance point.
>>      maxItems: 1
>>  
>> +  qcom,crm:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to the display CRM (CESTA Resource Manager) node, used to communicate
>> +      with the display CESTA (Client State Aggregator) hardware.
> 
> Is it going to be shared by several entities? If not, can be make a part
> of the dispcc and get rid of the extra CC <-> CRM API?
> 

Thanks Dmitry for your review.

Yes, clock is one of the consumer of CRM, but CRM can be used by interconnect drivers also
for BW voting via CESTA.

>> +
>> +  qcom,crmc-regmap:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to the syscon providing the CRMC (CRM clock) regmap used
>> +      to read frequency LUTs (lookup tables) populated by the CRM.
> 
> Why is this coming as a syscon? Why isn't it just a register region of
> the dispcc?
> 

The CRMC block is not part of the DISPCC register region; it is a separate sub‑block within the
CRM(CESTA) address space. It contains clocks frequency lookup tables that the clock driver reads
to populate RCG frequency tables. Since CRMC block is outside of DISPCC region and DISPCC driver
doesn't own or manage the CRMC block and uses it just to read CRM controlled RCG's frequency
tables, marked it as a syscon device.

Thanks,
Jagadeesh
