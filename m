Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BA73E5A1B
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663983; cv=none; b=dfy+ptG47HuNOlZ9+Eg52fcKMMZ7MG5r5z9/jWDndBF/XXYWHgNQXbhEA0baZMczOoXcPNexKzDFrq9RPTMrYzFWjrXT0nNbU80b/c9nh6pTdXjtj/F6Mju3PqmUsTpRrLTu5HFeLyBEhbud8ZWw07eQuDojpu7K76fqqhuBwXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663983; c=relaxed/simple;
	bh=NKnLkb2sr2xbZve2OLQZ/3C74K73Z3uIV/fC+LLhTXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aOjfpAzHeOJt5Sd/S7+g2xK2aC4Ph1rDGPy9OQDQIR8JknybMqVugFUC3geDgL7+n933drnz8/loFjB90F7DMbh5+Q//6vWvwwTgmYAWvC7A7bFdWpE7kAeFiPxMxJh5qwcasIhovZXtWJ2ndsfQS6UiT4qqThzCsBnBKgyyT5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LUf1g9nt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hxRTc43z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUf1g9nt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hxRTc43z"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D5JtqX1393501
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ubGLDC8aD+/jdmq08jDx3ISyhe8T6BJJF2GBKRoCBHQ=; b=LUf1g9nt1pzCHwq2
	5O/+0XGEIJWOG+C2yj3hw7tQCdV3oJapub0/dMTUqH2gez0oMOvt4s65CVY2/NIo
	vVgv9EaUJMAw61m6ePk8dRmY4qXEHgKFBPTqmWr0a0BWjaUjfZcPRvo/yFizioC7
	e2R9B/PWFmhJ7/TMglKQR0WOQ/zFflv9l+4JbQDf4j3gAoOP1SYt2tvCcza0TEiQ
	GOc7d302AJTvX5XIMx/3st7SxJWUWrJroTmnBnZ7SRQsCVlDV9RHrWpOTkvzrYb7
	H+oc7utzUtIUYcwRu7aKFvX6XZH/RpFswu0h/pIkdDJka8c+O11Qf+LfmB5+2cIt
	NPqoxw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k260x6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:19:41 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-575b9b7cc20so259200e0c.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 02:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778663980; x=1779268780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ubGLDC8aD+/jdmq08jDx3ISyhe8T6BJJF2GBKRoCBHQ=;
        b=hxRTc43zKkQd3qOPHg/4CkDDaHXo16sg+FC+UqX9+sC2Z8L+/mdQCBkM3sXKxxx97Y
         TxSFWKQ9u8in/Vps+AYKCWL8dgI/YbyMMXbyLrT6mqgjxYtqkJTv5J9F5Qyi50jY0inB
         VAOk039oj+e9h9GyZMSXgUISWNdNldWnM7pshQ2sQHj+rKOkkOvuo2N/pvD4sm2lKQ6C
         LTB+mlCUs0wIifOlGQ+TMHvH83J/xUDhN2FpHWLQ88suoMHrmU9gmSPjvFlNtiGlzxLT
         poMMjTUdbxXc96xZ/8GFoPHZEKMpv87Q0H+4QS0D98mJ6A4XCvsLMBwABmYlRwb48sw2
         /afA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663980; x=1779268780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ubGLDC8aD+/jdmq08jDx3ISyhe8T6BJJF2GBKRoCBHQ=;
        b=poyd4c7ZHNUpAP2FzfAm4OJmUXHSyG4r5DNTI6Vcgt+XSPCAtbJvCoSAH9f6qUGwvs
         dq4EdS8n8SpL+71ixKfN5mVVQ4i5irRyDGtulk10ZDEqzhFwVaZPZtSdv5Y+4cY6ysk9
         4Lw2nFHQtyh7vUiKXnjHSCDYdJqL6cKhV28ZDq/8k96qqWPDuX2Ask9JOmPraAV9c6rn
         xKe/Gj8KQyFJLZnKPGHBPUxkxdygWMXgHsmTRP9SCIRHClcfDYCOCcvf3ERTu5zCpsc9
         j5uyi3fIJgB4C52Sh1bupxLd+30Bugni4hlsI8he8RaUwvQui3hSwZCQWA6ocen9z8Od
         0jTw==
X-Forwarded-Encrypted: i=1; AFNElJ8Si7fMdMwFO0C5G0TCa/mCLDs5n/ztlsrZTUc5Ypil2LHEIbfXDjK/4tIlFBxgZJVAwgD0uPzBaYB1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo37i4DtX2pRUYGMdyvB7IH0GBwmBVsyCaxKL12EeR/U+R1/dk
	9LbW1H9C+P/AMZ96PrJkQv0+Nro7m5KxDv/GsQjFbX85DKeZy9nF5GhJaOTrmSfJAt8OXgm0uI/
	Z4qIdpG0QDL6ULcL/z8hCrH+OyKA4IGkI847sMAyyYOtqFudH3TGX2Wk3R35baSRJ
X-Gm-Gg: Acq92OHSMUvafZiQEdCi52wkvmg8Vi45h+x+yY1lHfUe5OCUKocg8nvtVlw22WKAVcC
	gflPuLZfjPnS375Pe2x6aI/lVqTd1FT49oG/+Fo7PlPI1FFmqojyL1jVzE7EHbRCaz49jI3q9th
	pWtdfqCUNtTO766d5iqyFJMHq2pUK7I5F+6JsWOfwdzX4WSSqUV2PIo7HoxtHTKZ+uxRMdrxCT+
	rN1CmmT3qbZpgMJX3fejfifZzMFZfrJnWabSatTQJyVKTrCWpEcYNhmJpvJcGjozgvqMOR7vSp4
	7RKSCVpb2fDTghU0Qm//DjyFD9uzD7yMuFqxZ77Yn7KyBDX4RPsRLhHJ4LNF9Keo4hfksIhXb+j
	cdQS8nFGWMuXrjyP8N7U4bjzT1OVe6gUIY1SUPMxUes5VFgNiOWF+wAKmLrV67vl6H8ObrUWpe5
	/HfOI=
X-Received: by 2002:a05:6122:1d9:b0:575:1954:439d with SMTP id 71dfb90a1353d-575e719b22bmr254868e0c.3.1778663980223;
        Wed, 13 May 2026 02:19:40 -0700 (PDT)
X-Received: by 2002:a05:6122:1d9:b0:575:1954:439d with SMTP id 71dfb90a1353d-575e719b22bmr254860e0c.3.1778663979826;
        Wed, 13 May 2026 02:19:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd09513b8cesm420785266b.38.2026.05.13.02.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 02:19:39 -0700 (PDT)
Message-ID: <7854c9d0-2b99-4f67-8a7b-cb0ebd2f270a@oss.qualcomm.com>
Date: Wed, 13 May 2026 11:19:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
 <20260512-eliza-adsp-usb-v3-1-6420282841c2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-eliza-adsp-usb-v3-1-6420282841c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a04422d cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=68niEd13HyaExDxXyQUA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA5NiBTYWx0ZWRfX57nFmVlXGEKI
 f9ESX+Ef2WAGOceTjrtMHyToAN75ITDW5JOZBMbF88qlwv/K+NVGnDc6bYjscAb5qXN6NgGL+qU
 Sp4bJm39goA6/BOYTJA56eMuFxN+YOBzBN5tEQ8qPGVIcTFazYnhWIAlHT37dKK0IU/kxlXEQXL
 YtELXB+wvzfekFEBe7OQgUMPs38f5EtnVy+eQER8PGTveyCdUKPqEJTtekmsj/vy1Pci0iXpvYx
 zwRhMLrT7+5P7KQhQsynnC/vEOuPaGPVN89xBvKJRNWXRYa7FVm4Hl98lSGSJjyKNAZKZY+AMEc
 AVrn3pwRok/6fp3te2NsgezYLHtfrex0bLYflZbvnPbv9LqTPiHev5D5MUEjus0ygfwOo7HybOx
 B7wP4cCpz/a6lS3OhSKmrjSYUINmB5QBGxaGjhBb1J4/IRdmpz1fyYX6bWWuKWVCsPFZdwHl4BU
 OBSFu3aQqTAP+Z2MYnw==
X-Proofpoint-ORIG-GUID: Agqq3VeiVmnLK07e9BkI_5_3UsSbjnlA
X-Proofpoint-GUID: Agqq3VeiVmnLK07e9BkI_5_3UsSbjnlA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130096

On 5/12/26 2:26 PM, Abel Vesa wrote:
> Describe the ADSP remoteproc node along with its dependencies, including
> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
> 
> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
> combo PHY and an SNPS eUSB2 PHY. Describe them.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
