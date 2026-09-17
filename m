Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AF343E9D2
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644454; cv=none; b=qqdE55DPz/I7CV/ZQ+X9Cuer9+vILJ8j7Qd8b+L+Xx+LjjWb9C/W78UOpyRFiRmC77snOZd3jAEbja8ar00c3aswAbRUQcA4P9u4evFHXTI+rJ094Vb0sFOKQ+64HA4kF54WWIJBcQOAXJvU77bcCcth05kgQdKztBm7I/44pUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644454; c=relaxed/simple;
	bh=tvBGyJ4dxXxCO26z3NZavLcwUPG5Qz2od8odzMP9V7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ahg9BWlRncEbxsY3js7BvYUDUleg3p4DqkOosllHsVJZRGZPqMbU9zS7Gv1bqfCErZB9R6M89rUPvo5Clj8YGvuObeTajkOkYaWTF9ktuwnWNDUbMPpfs+WZbDnRY1bjVlZ2HnT/LcZTeGIn6JDcbOnBnvXDzZA7m9vQYyeO1g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+l3vPKM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CXXMbnWf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+l3vPKM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CXXMbnWf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZloP1520233
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OgcTSEHaAwYct2xsNsod6FocmTJhW8Zm9+CguoUYFIc=; b=S+l3vPKMtdLsbXdE
	5gYrNuZK9xoaXKeb+M97XMw3nWWKgt5Q0UikL8dNidESMfFWuCzPyJpo5p/CDoef
	z0frx4nvX3C4ukVntu68gW8zSp61ulPyYZF3+vHMImReXAS/OZWq8NhMKvs5+KUa
	i6uXUd6GUtcJzMb81zsN+0bPfYsMCa0uoGbA+rbVRMH/dNyQu9cbgK2A2jVN3WWh
	unZ31ZcLAn6kxlR7QA3BZicx/mVnEYAXYMAHXXFQ6zjeYN4/FL0PBeYViJ9v2nf3
	HojgE5BQujbS35HB8pnFiz6YHVBlCTLdM+xitpM3eBUFX8vv4j32ZAQmCfP1jhwO
	X3zuFQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7hc0js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:27:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93821883e26so27888385a.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789644451; x=1790249251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OgcTSEHaAwYct2xsNsod6FocmTJhW8Zm9+CguoUYFIc=;
        b=CXXMbnWfZZQa6oTZwUkLAsSeaasmRYYFBrxxtLj2CUg+rEl5wThCUqZ346CQDVXs24
         wmxguZpMVoLeGsu2z9PwCji9v1+aUfjrhiDasJ+93GWERGRgfFtOHgRwE+A66BY4wfFL
         ClirWX8+21VL52wxMVjZemoJ++cjzzbS1ur73BrLetETUhCvfZFCfsuQG2XU+oMIXP9N
         Db+BnDlLLkTVZu3RV935J2NGcEfa7WWvJn9pknJHbsp7Q0YIMD5EMMjJj+7YBpLPXcrq
         HVddxquroCWVb2uEWF3CV+XoBPG8Wzm+FfBr/Lt5iE2h7HPD4yt85DVZ+gXZF+KLo2Wa
         8QqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789644451; x=1790249251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OgcTSEHaAwYct2xsNsod6FocmTJhW8Zm9+CguoUYFIc=;
        b=fuATTHJkHEdKS6UvtI/tw7MFppqsXyt9HSvbERmlLESp5UMbu1k+1FGT0CqUCsWCRN
         IxzE0Y6xnq3VYoKYPSGt3YDgRzdGVItocM17Kv0Vgqy/km1Rk8d/GDCQ4znT/CeDdGrE
         a1/79W9skGyTSKWP+iekscVlmQIwbmiiubZETSUTOS3OCi3RkOEOOceTd1mKfatFP+b6
         w8pCkdCrcxafbTI687MGCUYhGD+3eMQYdpoWqY9siCrZWGGKAWvVM4dUUJmpAs9n8aYb
         xao/HHo0JHZPstJ3k61C8XWXd+J6c9AqCheeRCF++oPMF0ih6b0KIkenARkoFSCmLoKe
         YrZg==
X-Forwarded-Encrypted: i=1; AKwUvBzoQjbog/u1B7K5zvRmpgLWRRKQlH/qW5Ii7FtobNyDn+N6H5D0AlcGPETR6fj6N52Pw0tnP2lLOt/8@vger.kernel.org
X-Gm-Message-State: AFuF++mW3wjZ1jNZo4SzrYeRlNYHbeUEXlL2YxjZjiO5uEM9G3cYIxN1
	MfdQNRnn5x2YmdWrMdwHYt8ZV0w0Bftgv8ZBqfRpd5CFS4bTYXlIjUNnSV8iGZEpbx/XQ4NoM3w
	r2Pb0iyp1q09CvyBUmsYg8HNad213d47Zu4mvLBzIgSgWqp5jbKhhkDl9X5+/u3cL
X-Gm-Gg: AYBFou00cDUv4fHd25T1lfgWiSBHeLVhr7BaoOigJagKzoP0LBCY/nOU6SRm6oumZmb
	/QuHM3qbIQU0vOm/FHwN5fEYtDhBMPAQXL4uWflwDbiVhgT1mgh6NspPdayLgnMtGkQq1+sNFtl
	A5xoYPgC0wpiDxnV1gLB/ot02cxh6CJItbtvJBG3KvV7f8fLEBeegIF079oe3dTCFHYa9AnaomM
	HyZILQ6FZ1aMUKRLSOF12fXtvNkUgPU3SgQ9+hPiO35uWL7nqbMuWc2Kb1Mbypg2PDXAWfuqyPY
	MC9114rJ36J65qOjEfOId269KYu1DYvPATx7D8a85rhBviI5AgraigEeVNj+UcILmviMWaKT+pc
	stYwzgeAD3o0udk+ZZcR4NA==
X-Received: by 2002:a05:620a:2b91:b0:93a:1312:ff19 with SMTP id af79cd13be357-93bd3e63ae5mr76969885a.5.1789644451242;
        Thu, 17 Sep 2026 04:27:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93a:1312:ff19 with SMTP id af79cd13be357-93bd3e63ae5mr76965685a.5.1789644450669;
        Thu, 17 Sep 2026 04:27:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de4879f1sm283709066b.32.2026.09.17.04.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 04:27:29 -0700 (PDT)
Message-ID: <4d654b9d-4940-4f0b-9428-6332a5223d60@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 13:27:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v5 0/5] USB4 mode programming for QMMPHY on X1E
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260908-topic-usb4phy-v5-0-73aac69578ef@oss.qualcomm.com>
 <178929702551.215437.16496561815731000218.b4-ty@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <178929702551.215437.16496561815731000218.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE1OSBTYWx0ZWRfX7pwdT2ovD5Z6
 erSCnt0XJ4SpzBNvX761cGZzKaTzuF75QU04pahhpx+u4XwaM+KVFTmVFl4135WoPHnRfvYKLUa
 e9FVoeWhwW9fr4yEcxP0ald5qJHjpzaYZNfz+7D/c65o2qbrGqODbVx4zpCG1361LZ1YyQrmwqM
 B6Mh4Er9zVOl4Pw+BpXjv4lDySdQzYG3K8iXAPP6VVPIsKUCuu5SRUpaPngUi3yXfWqoy5KE/Ds
 IaSNsJOV/OPE3YGiQWeyAuAhW+T+NKtmf69Vw4iLBwL1DRYWbSNZmaoEc6Hfs0x7XqTmTg/L2Iq
 d0I5YPQbKC1l/uIfQoDwAkjC3+IkMnkcEwHw24vBeVov82r2+EKIcByJA9ImImpe3YJ/xx7/0mb
 qJYMs/Uo2BG2CiCq7+ItsBCPKbCujldCSKzMOi6JgBMMkZqW1Yi1iUiNUHO8m1BgHtaMi7yGaBL
 6stSfjVAZn5Jc1hdItg==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aabcea3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=j4MFFCbetrfM6ntwnR0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: wzo1WCk8q3yjnYTcUu4rfeSLrH8Ctvrb
X-Proofpoint-ORIG-GUID: wzo1WCk8q3yjnYTcUu4rfeSLrH8Ctvrb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE1OSBTYWx0ZWRfX0+czEaED8XCO
 zvvROK2tLuqFZoV/DOFeZd0Mmn7wlqX0SXzGUs44AXtGX90hFFMcrysHk2LIdRtLYSbYGjEkP12
 p6SFFJ3yY+/NQqhOBii+2yk+wzH46NU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170159

On 9/13/26 12:57 PM, Vinod Koul wrote:
> 
> On Tue, 08 Sep 2026 09:54:04 +0200, Konrad Dybcio wrote:
>> The USB43DP QMP PHY, as the name suggests, supports USB4 in addition to
>> DP/USB. This series provides the necessary plumbing to switch to that
>> mode of operation on hamoa/purwa.
>>
>> This is achieved by exposing a third `struct phy *` for the USB4 sub-
>> PHY, which will be toggled by the USB4 router driver, living within the
>> Thunderbolt framework, which will be posted separately.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/5] dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E description for USB4
>       commit: 1b8595f4cc9f4029d11ea1957a4c9b4bce3f6872
> [2/5] phy: core: Define TBT phy_mode
>       commit: bc70554e6294d71fde45895223881a4ac3769630
> [3/5] phy: qualcomm: qmp-combo: Add preliminary USB4 support
>       commit: bb8955305318217526e6f9e93ee150888d91d4ea
> [4/5] phy: qualcomm: qmp-combo: Add USB4/TBT3 configuration data for Hamoa
>       commit: 0e1288af882068dbaf6e64808ba23c95a80dc916

Patch 4 is missing from your branch and consequently from next, other
patches are there

Konrad
