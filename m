Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A867C3A6B6A
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784878733; cv=none; b=RIGuc4uivduhull7NASiRpCYuRMi0KcFcyySDDAkP0NhWvWxyY5QunGt3DGhGw9Bp3oOD0LjoPyqMBxlHazu/vNag/Rz/lZMBnif6RWoSbARXnVVs26LPLz4LEH82PIuyNbUbPwWZUFfTpAdOGLUiibidrKopSQE/IY2iuEEp00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784878733; c=relaxed/simple;
	bh=Vqo+YuDiIyVd5KiE09aXgwZ7/8NNT2Uc0a5HPNeJ53s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U1aeJutXrnIjwjfVjg6qA7298jUajN4qPJFNZQtQbKLxovvMkxXQAfiIosOR2x/mH3DxjSBQ4jx+TN2i+USi+UXtMO/tPC8Veth2wMkF/RJQnVWx0aS7FpAXXwRicODQA0Nzgel8JUtTF5QAUD/IOqy+t9+aflILLGoNCwgKLNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i3ZEb5wb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SiZa3tmG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i3ZEb5wb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SiZa3tmG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4smOU1897518
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dUzX52/b0nO9diAV8Q7BHZ8zxOx2Nxj6T9VlEtqE+uA=; b=i3ZEb5wb6SH9W+a+
	lEx8jP7Srtcm6noSrlwe+XfQ1kgm788ASvmrsM9V9iZR/4uDCYVLkGT0qQeCbLq8
	iUKo1Ji/nr347FIM24AhjH0gBrNWDcPk0MS1UaKkZ6Pgni8vnogC09fJKTEw4dQT
	YpfREh1IzwUGVlcwqqxC83Wx0cXLxC5vo7N4o1CChhwNwcVezY2psqIjW68iMvzZ
	XvA+yndUtJRu56h5UOxpcvZkpd7Px0ZT3ENipFbqZhjI8hkO+OowrWrV3qRZ9lrx
	ngNIfIYetzBy3lpuX66mp9G4oqB+cMcwKg8n0yvSvxYHiq9GMHXbrgBQOuD7K4zY
	p0a6VA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm1em8j3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:38:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8484b9fb055so313592b3a.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 00:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784878730; x=1785483530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dUzX52/b0nO9diAV8Q7BHZ8zxOx2Nxj6T9VlEtqE+uA=;
        b=SiZa3tmGs6IgQWkSgOxQqu4DS9SqU/nAl6oJAajlXkAUTopJ+75it59PEytipvHhoc
         UmJQTpSPs3kCytxrbwseHoIP1ZA7N+gMJfthtNPOE8BIJ21tZxym289vzxYx1+kW03Vj
         nfWcb1mn/MNxyTkix3Wlmk3Hw33MVP/6SqMhSgMAflbBgZWngO7qQp6aEbry4EjAi8zb
         6yLcD3fHIb/Ers+k+/eUOzPSKFhzBYYwsw2AtHvLXa1XhgaJaxq2Hq8j4OcH8iexnDKJ
         aD72oD+XmNRpMmfecutfHg3qdLPG9qrXfyiZWImmbsLz49ob29xYLCVXCNchkpLNXuBR
         YUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784878730; x=1785483530;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dUzX52/b0nO9diAV8Q7BHZ8zxOx2Nxj6T9VlEtqE+uA=;
        b=LRMACLJCENLzAqpeM5X1Z/Kjd0h22pGEdiLinoidg1liyX4CQO1PqGqP0Y6gBFo7mU
         5zzwvhLHl+VFGwHfeSUjRT1BTKXSWFp3hODkbECjc+Le+y7VqqFfeFD4ki+2PzYImF1h
         vLT4oYTfdK5XPAj0JKgtBEj03hmmJ9gmNcmfTLqryKte0Vu6wPi+P9bTs7rYHOF7R8Hh
         UTNSGfP4x1n7fctMW5dSu7hqCvSxLR04y7k5pGhakm53HLaPIioN/sx83U9qSLa6vJGO
         aDaj+2ar068d5DBufKn7uBi3OZwuNiTiQRXqfQGfpXZ4iv6J4r8XD6oCMVA8EZ57N0q5
         TcjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8aVJnHvwC+m4fF9hNDfBNnpp7SugaI+Pp0UDwD43pYyoMUFORl3TuzZQhA7utF0D6MQexHVWW1ZQq@vger.kernel.org
X-Gm-Message-State: AOJu0YzVjYT1oxp04ak5/aw2Q705dMPVI2OXfiS4nsg4TbDDhNzBmvCv
	pU9gvDNWjZw14dO9SUEetJw2kI/NziFUc+9XaJkGf/vsG4TTSwGHUstAmvB67YEWQ2kI+W2dgO5
	0ESvCXSJr9v0CR5BAeDpE7XRxN6IywtAOceif4l3fem7fd2qGN0HSwi3QuRC0TleX
X-Gm-Gg: AR+sD126CwpeiJFpXaGdtJVx5Z4YhamlZV4TNJmnfngfJVD1bFP/0dpWC4YCvUlJU2V
	PZf3kzGQrKfQd1HqxKpp8YQrKMBN+RZ272edbaKTtrDdoKfMQVwJqldQTr3mYM1epGh4Tna2wuk
	/bqpb4o1OhrPvQaguycYvuvMTCBO+4mmgbbd8B6POAVIy2jrJzimAlIS7GWInd1r5bUfg9RbvbF
	fjH0GWTyor872skm7hE8V/SwMcKaBmvJAJ6w8rYX6wtrb20AAxfpuzHm8AnZOgPO6oSnw5XCbou
	3/dhhNcXnXXKGjo3OIMp5g7e30R7iEI1o2bPiTCUIFKVcmd9L6Zc3YMgKItKLJyJh64OeCuDUjL
	ujIuFIWzGURYVJeQmjqV7Ygl4UxCO3Vo=
X-Received: by 2002:a05:6a00:ac3:b0:847:76d8:8d72 with SMTP id d2e1a72fcca58-84e2bd63459mr7418390b3a.23.1784878730173;
        Fri, 24 Jul 2026 00:38:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:ac3:b0:847:76d8:8d72 with SMTP id d2e1a72fcca58-84e2bd63459mr7418355b3a.23.1784878729763;
        Fri, 24 Jul 2026 00:38:49 -0700 (PDT)
Received: from [10.217.252.136] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17602046sm4229034b3a.59.2026.07.24.00.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 00:38:49 -0700 (PDT)
Message-ID: <9d0bf4da-cb3d-4714-afce-57a165bc4ca9@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 13:08:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Bluetooth: qca: add QCC2072 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_hbandi@quicinc.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_anubhavg@quicinc.com,
        quic_mohamull@quicinc.com
References: <20260723-rb3-industrial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com>
 <20260723-rb3-industrial-bt-uart-v1-1-3c8e580c09d1@oss.qualcomm.com>
 <591cea7a-0892-42c7-aa38-51a90cd2c450@kernel.org>
Content-Language: en-US
From: Rahul Samana <rahul.samana@oss.qualcomm.com>
In-Reply-To: <591cea7a-0892-42c7-aa38-51a90cd2c450@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2OCBTYWx0ZWRfX3EMZ+bUxoeNv
 iE19/AwZHjWj6GVCw4mwIfA6VYf8HiggeTyU3PXk5lSWWK00KK3jeeciMITf7Qoq/lIl45hYaC+
 WTL3bwSSaT2Wt572gSUFaOFtTBuTnY4=
X-Authority-Analysis: v=2.4 cv=BIODalQG c=1 sm=1 tr=0 ts=6a63168a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=umfyDsVk65VPoLdumXIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: kOf0lwPLliZph6Uk4b4NLrzS_nXJDjdQ
X-Proofpoint-GUID: kOf0lwPLliZph6Uk4b4NLrzS_nXJDjdQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2OCBTYWx0ZWRfX6OUrUZWktLYQ
 UO1QNTp1T2P3K5g97oEa2IZ1oetWEZ/z+8gxtSiWMSO371A2ZLfu18bPpSHnxscPsTqMdtP9sHp
 g2Z9wovH18NSbpI/Gqa2VHhvrvk6xFuSmHkpIg+OklnFb7Vuxb5XJc8HjIZIR0fGwbcVonODt7o
 gquHpyA3e8B9JtGyTgDwsMP5uxcq/W9ul7LOwqcOFxBCLXQTGX7xpeWCeSlWEqaKfnANAiYq/B+
 AFandlYgkHWpMYq+bT5MhNGvhzRLzGYZP/TQ258MVv4Um98tmqTV1Txcu1lQKUktw4aegH3tX0Y
 7ElQMft6U8saljYU8GaTbLUgnKXsBUpAbfAj/2KIQJv2CvMXDkE5yQxd24TbFOR9yUJ382Gqmg/
 i30jjyuLYQh4ma/Czb+cKu7nwscDxZI2oxHBser11t+0YS/YPXVkpr2bZI9cRFnQ9i+CfYplM0+
 /2ezOGSCQddhQa0Lacw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240068



On 24-07-2026 00:49, Krzysztof Kozlowski wrote:
> On 23/07/2026 14:31, Rahul Samana wrote:
>> Add QCC2072 as a supported Qualcomm Bluetooth controller.
>>
>> QCC2072 uses the ORN firmware and NVM naming scheme. Select the NVM file
>> and BCS calibration file using the controller board ID when available,
>> with fallback to the default files.
>>
>> Register the QCC2072 compatible with hci_qca and route it through the
>> same UART setup, speed switching and power-control paths as recent
>> Qualcomm Bluetooth controllers.
>>
>> Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
> 
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
> 
> Best regards,
> Krzysztof


Hi Krzysztof,

Ack, the checkpatch warning for qcom,qcc2072-bt is valid. I missed adding
the binding update for the new Bluetooth compatible.

I will add the QCC2072 binding in v2, make the dependency/provenance clear
in the cover letter, and run scripts/checkpatch.pl and
scripts/checkpatch.pl --strict before posting the next revision.

Thanks,
Rahul
