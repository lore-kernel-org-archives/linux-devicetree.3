Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B8132E12E
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 23:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781219472; cv=none; b=EHUR77DXFpwSaucdZ9PoLwQIRcB9o6mlrD3SsFGoJavGvB60sjYMo+537qu3qXQtuxFFjxDpQJXCNGQDCx6D/qF1UhuvpyFo5Yjvf81IAYvHVd2DsoS1pxBc+tNZ6pMTcPofuRX0qV+ZWr4vLyZ4fQkhyQ5E1P1C/pXQrjBiDT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781219472; c=relaxed/simple;
	bh=7llc2zU704CZuS6wcMO/gSnF4DuWhD/d1CvuLJDTGr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlxPU384+06467AEbvnkeSF/6UGSL0Sgim8piL00zcokY65YNrRAtLLlR+Xn0VYcabRTjjpAgtQ63Nta2DprTyOV3UAR83UqXvuOtB7+m3aScda422tL9bS1HRpcfR14WbyNxsHwvoyFTq+tkVCOiKqKF3sk3wzuk541lo70278=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WpCpPe6x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ieu+8VxN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WpCpPe6x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ieu+8VxN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMSXax1891828
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 23:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ra7DsXwOaiwrHQtA1SnHHFQrkE42atPpkf17mbDUMI=; b=WpCpPe6xOrIw3GJw
	OB2xOx5k56CxaWchG8ZoWn8Tp92pVo73Tlz5PBuM6DNP3QWC5YObQT2m78CfBNW3
	uqAdeWVv8eCTzXjLNUrtH8HlEtmyT1E5TepGS3twnH33iRZCjB1Wn8mKh659Ii6/
	VdCctGfdTa36CJivRtBjUvApbvG//xJj5PSbGgy3g67umUwKPlZMdo2bDimh2Ums
	lokv133+AAFudw+8dQlvmlYvBA/Y8kaIm9rNV1zDVqrAXLwkwOR52cQ9StYG6Jj0
	nAh3D/aSgA4JgAjHsR1xGYzMYnl7mTVO+YnN1+yzVVuyJqeOfVazcFS+4UO3AI+d
	RHntVQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r5rvqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 23:11:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84238e83851so240220b3a.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 16:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781219470; x=1781824270; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ra7DsXwOaiwrHQtA1SnHHFQrkE42atPpkf17mbDUMI=;
        b=Ieu+8VxNigLKj2pQutpJHiUwFxktPLUaZUNXNkq9f57k5FCF6ZhvZ1rXqLa1Fya5Pm
         Iv7mT/HMUJ8ZlAFxfLCuF1aA3zK0I9ve2Eab2P3N41ClACslJ6lm/vRR6iqw3cbuGTZf
         rYHkP1x4/GLgcyfHy6wEyk6ABHI+DwtOrbz6gJHDlx/vcmngDJUjTAKwktcvRaMpsq0C
         MkswauyDN8oDfalH76JweNGKKq+3k3X1TSqNf+D3OGKU3Jr+a6H+CWQeDsknKIHDwhek
         NhvOpY4zg1xe8DdVZa6SKrkENDpdQAqJDToTlh9VPBu1eW8/h+unbh9gXb/un3b/tCBz
         +mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781219470; x=1781824270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ra7DsXwOaiwrHQtA1SnHHFQrkE42atPpkf17mbDUMI=;
        b=KElnsepxwSuQtWe/Dx22jh55xhE9VJ2eRJRQa/7tfoUnUHgH8EgpZT0DBrZa/wDuR7
         fPYFm63HdHS3aJIE9vqnD9nDzApyFVEWJHalePEvklCxLQpF0IGfRs9AbN+4Lzrl7OFW
         89svQhwe2PxwzaXIYv0z5HF4xZkOj3o9VGfPRM5QoHCr5Cb+oXJGW4LtefvRn4NXT7pT
         BQsr57WN+NBJdT1e1e/GIm7hfc0HF9ipfwW0MIBbLam8gH78DrtXcfg9JjmBpkMJkeOb
         8O074HTKbYTe0zLWKBwZ7QQ1np99Ww12LGxKcPAnGl7624H/fRNbi4pF8zLUejGxCn6c
         HKUw==
X-Forwarded-Encrypted: i=1; AFNElJ9+AFcNlEjuFdy885xEFRcBjB33F+BuQKgIoK5UPf28qO3GF2T02gg7BwMvcgaMANJwxzPPaERyS0yF@vger.kernel.org
X-Gm-Message-State: AOJu0YzWL7V9QdNsy8JNQmlzhDsokcN8ofLL49x2aUjLhDEtwDO6eAb8
	tjRIHIWWGaufSSK2YRgpPDV1S3iIvu7hbf3gneEGUBlsKfhphszX2RY380wdIxYkMyj7XnEwAgg
	ORh6BL53fzQwzFOHej+i5vTgkK6eZkDzMYd+oONNnQuGuU3ZlHqREiR1IfTiUjoKi
X-Gm-Gg: Acq92OH7vsVfCR97r789kRH+6leRJ0eDoLNbGl1HcYPHR/EHFnvVkF66xo0qUhRznWf
	Jmbo+o0L+MBdv6RV2AF1p5diW5KPIbwC77UI6GmbfE+r/7bLUzeRH5HDKij/Ui7C2CVxH8QpeUk
	ZpJitiE9tJd+5O2DQrsBg0bHObtpSQTCAydhEhol0OIAlB5lNu3MstSR+ZLW7YZ8aLCFmd2A4Ir
	c1yTtHhA/L6h+UjAcLRXELMLkSn95Fz7RnTgkGBRABKqY8soweTL/2zgGoQqlxMuz3O8q1syWk8
	jDp32Yk2AkyP0ByGMzNOtC9ZatkCRiWDPR55DSIPc9YIvCjO827e0rkKSEd3xTUqQ5cAH/+RHi3
	eobW3S9WtEhVAPYEC6xvCYuZe61OWHxT84vGBqVDwrn+hg2LIbvNfC8kYNiS3UexhtILqMsfgNU
	9GIyFLu4J2Z1M=
X-Received: by 2002:a05:6a00:1c97:b0:82f:48e:241c with SMTP id d2e1a72fcca58-8434ce95df6mr100390b3a.23.1781219470113;
        Thu, 11 Jun 2026 16:11:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c97:b0:82f:48e:241c with SMTP id d2e1a72fcca58-8434ce95df6mr100361b3a.23.1781219469634;
        Thu, 11 Jun 2026 16:11:09 -0700 (PDT)
Received: from [10.133.33.228] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0112edsm177647b3a.45.2026.06.11.16.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 16:11:09 -0700 (PDT)
Message-ID: <a8bb974f-4886-4adb-baf1-9e6c352bc6cc@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 07:11:04 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: qcom: glymur: add coresight nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519-add-coresight-nodes-for-glymur-v5-1-3dad99fe31e0@oss.qualcomm.com>
 <3c2fdcf8-957b-4b28-85b7-3a50ab8ee485@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <3c2fdcf8-957b-4b28-85b7-3a50ab8ee485@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LFBi1wn7QIVQs0l5vEHpUrw-mQrgfu8g
X-Proofpoint-GUID: LFBi1wn7QIVQs0l5vEHpUrw-mQrgfu8g
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIzMiBTYWx0ZWRfX8CC1xpPeKrlB
 gkcrWVHjOR78nMxQkugMLnwuJEmlBJ1SXJMuqlJOXl0rOd5NwIPPumJsspg1OuBX1l0jB0ukKAi
 Ve9EJyUEKJ7DvE3/xXy0J1nPTLyD4HA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIzMiBTYWx0ZWRfX2pF+UdrrScFY
 9ulO0Q6DAtz8oMeoI7UMSQ75OWbX3x+u/xDZjcm2wHZoiZ85WRMDKSXYQMIU0Mc+jI67vzje0c4
 dHHcWJ+6vEfvp8ZPIw8jYF8SVlyyM/8ufy6pLzIG3yBvGP+dbIsejrY7Sbmi9+hK+3NdhNmT+CW
 pNJSGI9NWf59B35fCLrGGXXozI56E4uZwZIyXewl9elHwA/VD62ZpiUJnN2kSJlZ+y6RP8PuAx7
 lRb7Oo0Xe6wH3cNguZdhm2S5f9gWeycCzPVaUdfqG4+9tgQgNy34bjLpqx/csvxWe83TwL4oWrj
 4CawFODQltkAwOWCia0dipz+Og368dhxb8cv2FKbe1hFrVFOJ9Aip4tBSdoQC9C439Ah4erglbs
 ZLYSnpY/YbxgFt7jD518yLaBMKEfjB21e5XNFk8BJyYQNtwizMnNK0SKMBgrhDchY7B9ECTkTTn
 Mf2lPkbvQWtX7ySm6GA==
X-Authority-Analysis: v=2.4 cv=M6p97Sws c=1 sm=1 tr=0 ts=6a2b408e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pvX1nSozBNrohX3L37MA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110232



On 6/11/2026 5:28 PM, Konrad Dybcio wrote:
> On 5/19/26 3:14 PM, Jie Gan wrote:
>> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
>> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
>> some small subsystems, such as GCC, IPCC, PMU and so on.
>>
>> Delete cti_wpss DT node on Mahua since this device will cause NoC issue
>> on Mahua device.
> 
> Another good explanation is that it simply doesn't exist there!
> 
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
> 
> [...]
> 
> 
>> +	tpdm-cdsp-llm {
> 
> Nodes without a unit address should be sorted alphabetically
> 
>> +		compatible = "qcom,coresight-static-tpdm";
>> +		qcom,cmb-element-bits = <32>;
> 
> Do these other TPDMs not have the "DSB element" as the driver
> calls it?

Depends on the design of the TPDM.

tpdm-cdsp-llm here only supports CMB mode.

There are three types of TPDM:
CMB only
DSB only
support both

> 
>> +
>> +		out-ports {
>> +			port {
>> +				cdsp_llm_tpdm_out: endpoint {
>> +					remote-endpoint = <&cdsp_tpda_in1>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	tpdm-cdsp-llm2 {
>> +		compatible = "qcom,coresight-static-tpdm";
>> +		qcom,cmb-element-bits = <32>;
>> +
>> +		out-ports {
>> +			port {
>> +				cdsp_llm2_tpdm_out: endpoint {
>> +					remote-endpoint = <&cdsp_tpda_in2>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	tpdm-cdsp-cmsr {
>> +		compatible = "qcom,coresight-static-tpdm";
>> +
>> +		qcom,cmb-element-bits = <32>;
>> +		qcom,dsb-element-bits = <32>;
> 
> Some nodes have a \n between compatible and other properties, some don't
> Please unify the style (fwiw I prefer the one with a \n)

I will take care of it in the future.

Thanks,
Jie


> 
>> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> 
> Please rebase, doesn't apply on next-20260610
> 
> Konrad

