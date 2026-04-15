Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DD833AD82
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246127; cv=none; b=aLDIbIMHpsyMnUmTe8hZMtjk8s5KIW1jANl6xnCBopVQPfB29MItP7YcFCuaYZ6A1RvYi/MemaRF1x20A7MaPJfziIUjYvo4KSxESXJtwMUE6PwjxBkz/nzWlonOdZB3WexV1RnqA+JMtMDKz8q9nN8oa1pPq2rFRDOuDkTaUTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246127; c=relaxed/simple;
	bh=KboxyMTnclITlovOtCeHt/2q4Az468hfl1/29hD1Bpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tt0pWK9A/KYdHp6YW8pDXrB9Z5yG+hQWkp9SJ3WrbOIAUT/wg+NWhLPQRPfy5Bed4NfC0+Wfck99j5lCTeQeUUIWzNLOrcE10zdhFqW6PklGAgnCVKHwDzmyXCh5OIZUQAPPXRTAgQZCICwKoxlyQXRTF70Aaynyaz0U9fuKbbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCMTYzUd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LRiAOyhV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCMTYzUd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LRiAOyhV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F7tZGu764370
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8au+N/1MLaPhi7Q+5KjJ+7n0ETdu8nJODsL00VdDp6o=; b=ZCMTYzUdw7kLLoms
	3BiS3Nm3C5g4C01oA+Yx8kFfiIUsdntcJ3bZi0S3rVuWnj0tSglRgzViyXTWAyDl
	hjQUBHQcLxEAjYhXSah6NuSc0xG49gviLc9z+N1so3PA0+wOuHvHJn29ozQGaWrD
	1aV62Qu51ut300p2i/R21a5ZJp0+JBJ3vFwVXp/q8X3YgzfRpGFAbGxMkIpHVMRB
	T2RZzH8uKC5I1MPicRBtzBjA9SIU/gXwfKnNMkKrSiVlB7280AanJrp3mtnNIBvi
	jQRN7FM3iB3ShxsWiBB1wL9SySpptpLFC32Oo4O8vrvkE1R2SAlDiFDdN/3FQodH
	32v9OQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj6q7rehn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:42:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d0095b0d80so191883885a.1
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 02:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776246124; x=1776850924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8au+N/1MLaPhi7Q+5KjJ+7n0ETdu8nJODsL00VdDp6o=;
        b=LRiAOyhV8SkWgE1LlsYCv26Rlum/Xo1jgC445etmkuk65ArjnX0VLweHhpgdiRbenW
         ursycaUW/GhTwSMCTq38sM7LQY0SF1/pjSSjhwVl5QxBDCiSjK+Kd05oO/INzF6x/1KI
         b/WojQdRuXEiDI9h6U1U7n67tvHFFmRCvwIifJOwuFrwZn/O5gfu9x9J5R7c6XUfIVeN
         yajRCGNUBTbnJK1kSO7O8ckRmNSZzPMtpmtbHHQ0pemYMToYQY6/bJPDCZJW59N9VaaE
         B+lIcGvWn39HM6ogGgW3fkZcl5h/wpjie54NUYvx4jUof3XbnnTzVFdU+E5uagnwzGIV
         fyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246124; x=1776850924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8au+N/1MLaPhi7Q+5KjJ+7n0ETdu8nJODsL00VdDp6o=;
        b=JzsAeiP1v9Cryu42V+KZ6zN26wVvt/JOkEwKR4BcYbk/IEoRNBl0m2qH8XbR+Os3gs
         nBbWglCVVIUDjJYHXd8RQiTy9hKbrJqmeFfWPJgTmFGZoIDPwCCAi0mN8Kgy0PD9znRq
         dkLet41/ciaq1Xnv6XahbbWv4pXv5x4iqH/ocKkML/TmhoBxwYrz6mwqDk+i90ejsxN8
         MNrOzNGG/JEidO836B4ljS2MlqwqWgzV9W48t6Zll/enywWJKnGsy2Q9Sl+hwTUNBcbB
         nUsZzIl0gJUoCvCx8oGNrzySnEj/APDEBPJPffFJa4I9LmcVPxyHNJJ449VhM9f7UN+Q
         NmAw==
X-Forwarded-Encrypted: i=1; AFNElJ9nldcMvNs6kzB8LZmz8RKMMUFCv7TcoV0eFym+eXx70S/lUgil7Ok8kbnTtXmkX4Hd8mxln+oTeEa7@vger.kernel.org
X-Gm-Message-State: AOJu0YybmsQvSJbnx95+gwMUzg6OYGaoynDwxHrWMQHSibwMYkT2lBIz
	G0mMaL+jWjDV2GRwAjEB1Eykk3yvJRRH5oSXuMyuJRyOuBN0ay2pNCEbvfBKli2VroOS8uNpdOf
	zOO043rGWE79AmbHKHl3lszfuJbSmoyYV+iuJNTr9Sj+JjggqsnMHiO44gShOZ80E
X-Gm-Gg: AeBDievPCmbJ8QOVRU4qMvD4GdAbKNH2nDrftpN4i6ofCpeSKacLe9cw/QJwQi8Kywc
	KAp/QNkFHr2lQlz8WGX1DrQ3owhTd4pcQE60n++27a4FUlHIJIvFYA3CRk8xM8ahGPIp+E0my7K
	gIR/uWQPP3Gm6UTqP+9gcqNEuXoZ7WM4v9mjS7loIGzNU5ZWEJKUKFNZV4X2a0hyNq3gx1OFXRV
	v0QIOD0HnldeUO6w/Kt9CnnY0OPwTf71WvhH76gvVySrsw/wa6quM2GCebWfl8i8f2j+s67FCFO
	WB1gcKDBlXnVScM1+lxVw/jeNJq6sRTdJPAf/GraDAIwSzyTQHUrkb2n/okCtLjyuxO/cnLWOPg
	JwzhXAfLq6hkGuMqQJ+xuImz20d5IbKACw6V6oWUPZDbl/m4M4eRWLAmL0yubDbYaiq7YgBlXis
	qJVS2Adc64Puiqyw==
X-Received: by 2002:a05:620a:3186:b0:8d5:ddc3:a3ab with SMTP id af79cd13be357-8e4cb303470mr158106885a.4.1776246124073;
        Wed, 15 Apr 2026 02:42:04 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:8d5:ddc3:a3ab with SMTP id af79cd13be357-8e4cb303470mr158104085a.4.1776246123537;
        Wed, 15 Apr 2026 02:42:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67238000e68sm249860a12.25.2026.04.15.02.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:42:02 -0700 (PDT)
Message-ID: <5bf3589e-0ec1-493e-ba10-db8237a18d6d@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:41:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bod@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
 <da3ed78d-fb5e-4820-95d6-527d540cf03e@linaro.org>
 <1f38187a-9464-4aa9-b70a-03b767349d56@linaro.org>
 <c5278028-dfe9-4d09-970a-a25977967bdd@linaro.org>
 <016c03b8-27c3-41dc-a630-8e7095db1f88@linaro.org>
 <456ded59-d13e-4b61-975b-97ca48b5e771@linaro.org>
 <RAPaPhpxA39W0ykm-Cr1KaDiJKpRqdQTXUeEmt5mQn4lJBHEGaIS010ejjmhUYEBsHjzrTX41Ek9zLU2bae_YA==@protonmail.internalid>
 <76ea03d0-d41b-4880-a48c-06570eb089ed@linaro.org>
 <0101d8bc-1ae8-475e-bb9e-cc1e16db87ec@kernel.org>
 <U7Oj0BBSw7MWOWSCyP3-GGypXsAALySEpjzoCVQD3P9O_ZWJqO4GVKLhzQn5JD4I3okCCp2F4YFckFRJ1duvCQ==@protonmail.internalid>
 <6d5ebab6-3c4e-4a1c-9578-6e926cbd96de@oss.qualcomm.com>
 <6ea214cf-e68e-44c6-ba0c-38aa0a644ae9@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6ea214cf-e68e-44c6-ba0c-38aa0a644ae9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AvHeGu9P c=1 sm=1 tr=0 ts=69df5d6d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=MidpbNYMP4jx3VwMSCAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: K43366mgQTDU09AMIL1mRyMeNrpGgT4v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4OCBTYWx0ZWRfX9SZqhHaTmzfd
 Dydm+TmnT7spgphJhjBrPqztcjcHqmuNbgOyt3u3wwf7Gix+PKOL4Pbby6AVboJyA2kCNNh0jPd
 SqW+kANmY+pDwdeTuMS5LWiHArIZqeMTqQE7qn7Mbm0pkMICT0xHXzHz+j1co2yi5r0zNcL26ly
 zoFXO/LeYBKQDbSM0WzERBHWNqziQUeohirXfRJPXtFK0R6sgt8xkSOJ8V0wREnUjosUxKAaebk
 LP9PVB25gTALuhNJ73Yct0gaylXe2sMcuSWhWKbUzZFRuqCEGXw+5GWqf/akKAtCm7nUoh6rH2r
 apGUKzVP+0hTK6PD/FoEd+GwVQ3W8Y1hepXLPviM3oRYWarm0TX7j4JqaqlGZ7zzFRl8Tf5tMtm
 O8WRoDyLdTPsHZRI8B2AsBbhjadU1Ko+FCRqRl2ZpEx4mSizwVTslsJQXRr3bcfhs2TLLT11dwV
 xqwAm/4lqSIjHnimUUw==
X-Proofpoint-ORIG-GUID: K43366mgQTDU09AMIL1mRyMeNrpGgT4v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150088

On 3/30/26 1:41 PM, Bryan O'Donoghue wrote:
> On 30/03/2026 12:34, Konrad Dybcio wrote:
>> Let's take a step back - since any CSIPHY can feed into any CSID (at runtime),
>> the resulting nodes would either look like:
>>
>> // hardcoded, m may != n
>> csid_n: csid@1000000 {
>>     phys = <&csiphy_m>;
>> };
>>
> 
> Well that would be wrong they can connect to any CSID. We'd be churning the user-space ABI and imposing an artificial constraint on what the hw can do.
> 
>>
>> // determined at runtime
>> csid_n: csid@1000000 {
>>     phys = <&csiphy_0>,
>>            [...]
>>            <&csiphy_n-1>;
>> };
> 
> This I think works well and actually maps to what the hardware can do. This would be where to talk more about Neil's mux.
> 
>>
>> or we could store them once, centrally, in the "CAMSS_TOP" node and
>> pass handles around as necessary:
>>
>> // camss "catalog/manager" driver/library provides CSIDn with PHYm
>> camss: camss@10000000 {
>>     phys = <&csiphy_0>,
>>            [...]
>>            <&csiphy_n-1>;
>>
>>     csid_n: csid@1000 {
>>         // no PHY references
>>     };
>> };
> That could work too.

I personally think this is the cleanest approach, at least from the dt-description
standpoint.

For combo mode..

I forgot what the conclusion was on the sensor-to-(CAMSS vs CSIPHY) connections
or whether there was one, but in any case, I think that data-lanes and bus-type
could be aggregated across each PHY instance and the final operating mode could
be chosen based on that, at runtime by the driver that managed all this (say,
via phy_configure())

Konrad
