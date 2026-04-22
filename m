Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D932A3603C3
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776852579; cv=none; b=lAmAh0fye4kAFn6S3Sr+rItBhOwNEY2GJXJFPnb+obRCfgXpucGnCUx3am+sSexJ+4Vsm9Ybf4Mv73OXfBhyZT+j51tSp5Su3P0mluPgCUuqNnGnN452zJHihFaRpHIiOVZ7QulOjbiGsPacW1Tju6UGn/uZm2gbP1vAvxqn2+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776852579; c=relaxed/simple;
	bh=aSHRNBc30UbrHywNUN2ejbFNA17rHTFw7ydibc9FC7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDrW2YMacNtd+7TJwoKs8Gv1qZ/P1dAl2REoldcCa/tOM/uzk+3hjK1W8fVr2vUE9OBOjThb3MJoLB8qieQ4JXn95yHUk7fkhfrSqF/FS7k+ayrMWpKxaIeKNqetoL4MUX/fjHY93gTTVVg4dToi2+tSb4ZdFgSlkpQwZvt4WfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ehF1sogR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UvUZyrQO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ehF1sogR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UvUZyrQO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M51gFD976178
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E/w7YRWP9KM67Fs0cZqKRhWZnFRHSMbKTOmClIpjy28=; b=ehF1sogRoX9iSCPH
	ASjVtLJ9JnOWxepGlFL+4T793fLysehTcjRNv4xekjGZnoI0i/M+AGjuqiRx5WVp
	yuT4EE8BxLLgj2qg0QKvn6lGVNTNcm1kiKxkWwI4Q0NMTlFjg5tYrwiou5Xeyj6p
	qUinNMMM2BAfqztkl4oz3LGq3AFeP11DpUe4Q8////n7trD4WsoiBn8UKMbkBD6I
	jJwm1qF+Tpj4e6liBVI3JD5BVT1Lz4pO8j7rgrc0VzqetI+98WAlPx8KwRcObFMH
	HX2VTwCFaX3d+QCsrvCSc1L7tSRXXQ1XrfJTp13/AuCgyU1/mYlu1oE6CrnEnEBS
	Oh264w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeneay4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:09:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8aca5b32b89so16443076d6.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 03:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776852576; x=1777457376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E/w7YRWP9KM67Fs0cZqKRhWZnFRHSMbKTOmClIpjy28=;
        b=UvUZyrQO2fDt6rZTcPAEKIl0FmbZZzxDXq+WVJw6YI7iOlph30SIXpLiit22y3wKlv
         SnivxptQHPHjHxOu9xBAjT2RVoZ8OoY3RTg8Uo7LI64aB1Fi1Pt4j6/8kxvhTFGE948m
         xhJLWgH9vxTo8yXtwk94b7B74vt8/2yu92tMmwnFN9kz6pK+Uya52E3kRWb0Ltzc4d8X
         r792+MjTNx4RNOHhr2EqFSPN1pt+S/wi2AmahOb7+24swdJCV1LAzmreW3wH3Tb0bM96
         pC4NVSh5hrjEwNZywoXiRkNVeTO/Me9AgFSmfH21bMIL2e4l/1meCYUURLAUKvYaq/mK
         OSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776852576; x=1777457376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/w7YRWP9KM67Fs0cZqKRhWZnFRHSMbKTOmClIpjy28=;
        b=WuL+wNSnRisWUFIqeNnrMFT6Aaez2WpeZnqenHSDMOcvUIkXEOrX6AfbgK3o+BN8Mw
         8SDfwlC++0A74YbwEpWyA01XR6qhYEe0+BPoP+jW+bzWNex1l1wdQFEwgBdK917NWi0p
         Shdq+uGZTnvr/AcKQ9bKu951JnuDnUjchyxryvE+Yv4AjuNb56xYt3VxFNH7GMOotsFl
         2IZ0NS1sRNqT5o7vVLHOWpAGVADH1X+ePor2HtgFTpsZ6T3MuI94v5dR48YBG1CV/a7n
         yS0ZknKeDc5GmjzxvFPRetdqHNCPChL9eXofeLazfdnKS/bsNy8A4I0Uz5eS3dJjYLNs
         MY8w==
X-Forwarded-Encrypted: i=1; AFNElJ/s8htrsZTDguWXf0n1XQ7bkAsDXTx66qrR8Zz6JXvz44RLQfB6MezkEVhm9Lc0ddvG/OZ7N45ZuREV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1YtVwgKlg80kkwpzV+FhE50RicPHRzuVRUwmDwtcYHIBp83hd
	20ZgWqEWDfpxCm9+84nvHc1jU9CWRaMkVTvE3hqXyqLQ5rTx5WkOqvWkP+rYp4YFPMe195cGF+k
	xWP85O+OB6JbhjxIYReXNaf4sJwzSJ+rkfSk+WMVKlmAk8WLFDPt1WZfgEUATYCQG
X-Gm-Gg: AeBDiev5BkkBpP+ZGmapId9vV+NdsBVpBpna9x6BZrp9gjduqZqswHCqKtxdutRfr+T
	xsLumZ8gNeb877QUBq9108gjc6So0RB2wszmf/bLAeVgABpdRWBi5JRkzOzkOrgV4tyIVi1FxNW
	b16DTjhciPIDMC6nCMSymff226x2wwI7H0gUfVezxNnVXqWEic0RSdryTKMTjYQOcgvZB4rwKkz
	mCh1vEwh2z8Wg7jJoAAPpLCw3v1XWLqE1SXxnMPuNnY7jfHFOm/Fe/JGdsqW9B6NO/dfQntAm3X
	zqCQLCHgSLtYc9FZIlbaYvJB7QbKAXpSYw0/0Ozxo+LYwtiYupGWwfD36iAHlxoSvhH3BGMNC/N
	KFuOTN7CnIB1pROnf8lYBWmPDzwYR+W8Hn4Bnj1UkJ0MTynVAVrAsWVMgo7KOqXCpb+P7k6pW7+
	DQ16eGwZw25MHyjQ==
X-Received: by 2002:a05:620a:29c3:b0:8cd:86a2:340c with SMTP id af79cd13be357-8e78f059175mr1855211185a.1.1776852576158;
        Wed, 22 Apr 2026 03:09:36 -0700 (PDT)
X-Received: by 2002:a05:620a:29c3:b0:8cd:86a2:340c with SMTP id af79cd13be357-8e78f059175mr1855208085a.1.1776852575722;
        Wed, 22 Apr 2026 03:09:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c47fe8a0sm3182799a12.5.2026.04.22.03.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:09:34 -0700 (PDT)
Message-ID: <e0dacc06-432f-4924-89e8-f5fafaee4906@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:09:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
 <20260331-eliza-adsp-usb-v1-1-d8a251be20c3@oss.qualcomm.com>
 <69d644bd-d64e-4ef4-b0ca-b47103e84764@oss.qualcomm.com>
 <p6duntiwahnmxwit2qgegcmqerv3or3h36y5cel36ekw4vkcfp@exmgriqkkqqb>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <p6duntiwahnmxwit2qgegcmqerv3or3h36y5cel36ekw4vkcfp@exmgriqkkqqb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5NiBTYWx0ZWRfX1DBA+XZ+DtP7
 SfMTO2e/tQH50CPz9i57gmFZ3+jbYFQ5Q1CElP09lhbpUyYpyzBeWis+RvbO49d8YdIhrd0qNwe
 KtHn5GbmrYhHkqWmWyctS4kIU4pgkCtO8Q5z5vtieMQRb2ARv5IR14w2vbz0MsBt4XZuGRDzoce
 BWPfQEfNktr5dv8j6uSm+F30fteNDYJy0vfvLMOB9N6/VarCXo3j1+G7Uy7l45+ZYpM+GujcIRT
 3Z6V7xLQxp8VBwhCMYcT9CSnaU/7NKiQLQwuy/DzNHN3CN/qwh1u35IcDZb+ZIQ6E6OjPz5d+fg
 JfaX+wOkm5vvjD78QK4lr8vY8e5pgzseKN2S7Pdv6SAuATFz5KKsmGS/hHAbixjFPAMr2YGDE5W
 1l2otTPXbM0boEAcdAOy84avkcEgumKdeQSglzV5I2cG+doV+ych7Bng+PlVeIdmonGdX+03RaX
 pFIo4ywNmgrlxHGIY+Q==
X-Proofpoint-GUID: 86PLGst1Bd3yB_Qchdq-_7xwqxakFw3f
X-Proofpoint-ORIG-GUID: 86PLGst1Bd3yB_Qchdq-_7xwqxakFw3f
X-Authority-Analysis: v=2.4 cv=RoT16imK c=1 sm=1 tr=0 ts=69e89e61 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=bmElyp3J9_oKZ3-6flcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220096

On 4/22/26 11:41 AM, Abel Vesa wrote:
> On 26-03-31 15:37:08, Konrad Dybcio wrote:
>> On 3/31/26 12:37 PM, Abel Vesa wrote:
>>> Describe the ADSP remoteproc node along with its dependencies, including
>>> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
>>>
>>> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
>>> combo PHY and an SNPS eUSB2 PHY. Describe them.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +		usb_hsphy: phy@88e3000 {
>>> +			compatible = "qcom,eliza-snps-eusb2-phy",
>>> +				     "qcom,sm8550-snps-eusb2-phy";
>>> +			reg = <0x0 0x088e3000 0x0 0x154>;
>>> +			#phy-cells = <0>;
>>> +
>>> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
>>
>> This is TCSR_USB2_CLKREF_EN
> 
> Good point. Will fix.
> 
>>
>>
>>> +		usb: usb@a600000 {
>>> +			compatible = "qcom,eliza-dwc3", "qcom,snps-dwc3";
>>
>> Does the device suspend and resume successfully?
> 
> Well, tested with pm_test devices and it does suspend and resume
> successfully, but there is this:
> 
> [   54.584126] dwc3-qcom a600000.usb: port-1 HS-PHY not in L2
> 
> But if I'm not mistaken, this is valid accross all SNPS eUSB2 PHYs, on
> all platforms that have them.

Well it's not fatal, but ideally this wouldn't be there. Maybe you're missing
some DWC quirk in the list, although it seems pretty long already. Perhaps
Wesley would know more.

Konrad
