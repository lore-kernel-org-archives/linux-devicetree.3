Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2204477983
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842535; cv=none; b=PY4sdpwX3NZg+Ij55oG78gIy5ZQDnj8jvgEIQCKTqzycJ98vz83n3FKG/vLr14528j0ljFEyZLViWCDWxAJE0OgyjHlcxLfiiRk3xASuW8/5EXJXFGuHbjwH+HiSPqPcpXhg1dIMDbWWcBcVYB5oxjH18YqHKnTGZm/vVSrIBpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842535; c=relaxed/simple;
	bh=/7oiJ2nGzu37EW0OozAn7fioRo5rnaTnUXq1bfx3uFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDgH4qWE3x2R2iGbXLS/VAM/pCLqhRQClg5NY84f7HLeDaVpz7ZVkjNjHKm70P1sYGq6fXypvXcYPj2P/pEBsqVTaq+76hD2+i1dOw0IyT1Ufk93rYMvcvtVkXGa4B2DQG/nSBs5yGwqUTaJzPhO+qc0ue9vKaFxxbHlnHl5Jbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDJzjE7P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmStTIWf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDJzjE7P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmStTIWf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F58fgY3795596
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/GYVEpuq/9FUnUo2IfmJMOgpmoymjr26FmgRRJitPSE=; b=pDJzjE7PGOkOd6Uw
	pHXCf21d22OILA4f9bJZjdN26y8HpDgQzi/fZV2pjS3mdcibOqoBJzrsrClR2+DD
	ngnnxK7Q00qRd3AQjQnpwUFTykjO137LI1gVdGISkWzQKjoDcnwCFPw4BDifxDPi
	hX10YaoQpjoVoUkJKGG7T+YuwTyRwB0Ko0vBQxlwZ/HcdpAumrISuc+dqazRXN+h
	lJmVn6raDFgq9mNpjv9SAaChLPqCiBrRVMyJ0zMZi1qLTDeoMWyqbWXPUL3fUL5D
	Ud3MyRbmzA4+T1oc88iJtkB7H+kPkAAfqG4KjXs5cjrQtREJ4GzIKGHR6fvRCYLP
	5UyqAQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stvnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:55:32 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-575b9b7cc20so437173e0c.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842532; x=1779447332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/GYVEpuq/9FUnUo2IfmJMOgpmoymjr26FmgRRJitPSE=;
        b=UmStTIWfOhI4cWVlbIXLzUz1LKiT3fK8S5EQBRpqNCsglaeYnc4fkFaIbXbzgWCQpP
         lzaRr9CwenDgucK/QBlsdT50PbhwBmUunXuhstIV8CXAnqA3y/zgpn+2mlPbyfB+tF/P
         6NrgV0Zq3zEzGujetdPEG/LsJDrzQUurfd+ku+OdRb1P1fpqbQ2JA9WdxwkMN9uDbzTg
         AfDIFipRHbuXNmQLTLIsuBhn24AQzkeeReO+wE+QaUEe28KMNKeecPT91uWCgUMrtGi0
         oMIwp4e94zkcRIa8mMaUiEPnVzywXjWvSa7ReI5/MTXkxYSBBBRW4yet3pefcWC1bVRP
         c4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842532; x=1779447332;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/GYVEpuq/9FUnUo2IfmJMOgpmoymjr26FmgRRJitPSE=;
        b=kX/3zjuzaA55InH4+XZdgJFpSdjlakuAqgQLZZ6DWsggjrvp4fNBLvsEc4T5cLF+kv
         3RZtDqd/V3T1VSAo7heDgwxskjbafe2s19isAFAJvhNbqOTP27V0E6jhVRDErB+oIP+W
         aKa2UYpv/5xo0ru1757WgcPcXjdVXPCu58xIVz2uH7NsO9xYcz/m+GqegqsUNM1WdhnE
         QszWYWDcMYO3MOHEdJ9luWgNfjrhoj8GW+f2FgM/VQR0HA+T8/FJ8Ise6Dvd6pFBLWXG
         PbvPC6+IYb5C/2v1pvFJb6ruklBtsgvUg7XwTj9hCnCux6HDEDtTNgXQzYBecbX3ApO1
         +hyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xRGFeqKJ/OY3wp1nSMv5cWgV7JPBdynIXb3Yh9FLQfFzH4bP+MjTDGgP//6NgADROA81bAhVe+lYo@vger.kernel.org
X-Gm-Message-State: AOJu0YwBOG0ihr1t0jLxbFMecL+Yda4IP9sgxitQkzJddjPstDYOrKBs
	SpWHiW3yNVMbpumbjbmsX92iYf2bBJTAj4WrTY29dIygyOsLpag9+JgCwZqtfnK3KWGyHXoz5/5
	HNA48UvxTKJVxkLrgS9mSDLdsAbDKv8y2TETFTz3HwPf1VsxAr0gIxvPgXPwx5Td8
X-Gm-Gg: Acq92OGl3CFLJcZ57terlmeZscMpDMm1sQCchAJ76030ryXuyHIrnRvpYdW6kn67Iyp
	/sev5rB4+I6goWsfbDFRoFLXW7FBoSU0cvdwACxX+yhL1C7TuBXDkc5kLA1ydOGuDMAecJSdBlC
	Sq3O+iAvKSxyda+XmwtJ3DcQ3S2f6wTg8cKAAKHTQHMV9tqrVbgmNelpmMHgfXxeyVkPQ4zutxm
	NlRHuMOjlk6C9qsIXKNC5gS6LnCqN/6nqt+pQItIoPOjlaUWoybAENloMCf5eeaVzK6oQp3xPeL
	k0bvCW6qD6Dt7cQDBVqLSyL0mBJ4G6CVO5zAcz19guNIeAyEAHGXyQ0x4xw3ObDOwwnGxQsAm98
	hloivGU5FNJS/PRa6ePQBhaTJTkC+ueeuOKmcX7vleH7M4aZ7wUfAM3AInvqvjS5nwQoVqv7+YF
	lDE9U=
X-Received: by 2002:a05:6122:4641:10b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-5760be5c90dmr592168e0c.1.1778842532236;
        Fri, 15 May 2026 03:55:32 -0700 (PDT)
X-Received: by 2002:a05:6122:4641:10b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-5760be5c90dmr592149e0c.1.1778842531734;
        Fri, 15 May 2026 03:55:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e60a76sm206187666b.53.2026.05.15.03.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:55:31 -0700 (PDT)
Message-ID: <ea0c60b3-df79-48fc-b9c6-d749cdce2c05@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:55:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-xiaomi-beryllium: Correct IPA FW
 path
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Robert Eckelmann <longnoserob@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Joel Selvaraj <foss@joelselvaraj.com>
References: <20260429-beryllium-ipa-fix-v1-1-816326ba9047@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429-beryllium-ipa-fix-v1-1-816326ba9047@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX4baUkpusBJ1c
 0jM0l0uA2Gi0jC7nwm1fL4JNcOIHSNVsLGzXG7/JiNUBMDrMr8bQdMaShumEe+u4api01rarH7s
 jbJX3kREG4C7nIUduOyV7+K6gWzFhNvgExHdX/mkyaVpv92bQuF/iPzAjY22d4RQs6BhgyXGayj
 Tp8WIC9WubAp6rJaFvYp6BgPBuDc4Fr3Lt20CUCYvKSMXmjvX89Nl5+7WDW2M/9y1fZcr1PhZ9N
 tg/lQ75+8GVV/WgFRRvBpR4ka8H9OxkyexxMFCTotWDzYXu9h3VgctUC5e1BDiXikjI/dJxThol
 24LMLTSou62SspfZnYvTLZZlXkZN3QVZPesu8ur4NJ8ljK1yBCQkdQy9StToTfJvkjbY98/9Guz
 tRxJpqoSmk0YjmfTgheGAB7KGeYz9X9lDjiM9iVSuCTpHnaAd/I677UdKk4vdMTKwEgihiZ0OMa
 zdbJ1mQYCn8/yZdFZBw==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a06fba4 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=WFa1dZBpAAAA:8 a=EUspDBNiAAAA:8 a=ab5invG6YRD6NB1u6q4A:9 a=QEXdDO2ut3YA:10
 a=UzISIztuOb4A:10 a=XD7yVLdPMpWraOa8Un9W:22 a=MZguhEFr_PtxzKXayD1K:22
X-Proofpoint-GUID: RT3GHllH2-xhMvCd37v2gJitCYPyAVZz
X-Proofpoint-ORIG-GUID: RT3GHllH2-xhMvCd37v2gJitCYPyAVZz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110

On 4/29/26 3:16 PM, David Heidelberg via B4 Relay wrote:
> From: Joel Selvaraj <foss@joelselvaraj.com>
> 
> The path was accidentally reverted back to old while refactoring of the
> device-tree.
> 
> Fixes: 5bde31dc7b17 ("arm64: dts: qcom: sdm845-xiaomi-beryllium: Add placeholders and sort")
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
