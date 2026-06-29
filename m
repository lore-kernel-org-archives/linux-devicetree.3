Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858B826A1C4
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710498; cv=none; b=uqDU++fbAlPc5QilxeV8i9dWCM355qLx1OUOdJYiXP19b4S0G0bBZFS6SwS86Mn5COZ//6J0/Rbf7suegGPHjOWDWwRBq9cIWFA/ggjt425y4fEwUPOwqMvQukcF8BejOWPxBl5AynnQMbrtValD7g+iVyvtbLlfvSEU+DIqs6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710498; c=relaxed/simple;
	bh=hf2YvkCQ2+656NeqJ7JOZlD5t5MHvJmIml02HR1n2a0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=G8KbaXp/iJJgqTf9YYejmkxu6sp2e2TMpzK2J0al3Dq/mZcNh7YItNu9V00GO1wsl2TXYtcjjA1D0Ac7k5m590enfO0QQhO7WCvDTBhXGajeZQd46rK3GC2BY6ntboioo1bcY9eKCBwLoMT55RxTNjtYbh6pzL5J4STLGGt3Iso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWLrmMem; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMtvpbu2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWLrmMem";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iMtvpbu2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NKcr1772589
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	topQkWEwcoqTN7MCwL5X+qwyPKw5DcKVugONuTUv8GI=; b=XWLrmMemubiWq0Ki
	5T5ufHvkCgvHGXku6QaLXZuueHswsXbuWgwxTUpfDAMnEzH6pRa7udnOFIZ+Jvnr
	5pCRH+CSta8dkMESeFc+bXqN5Kgft6taCLQMWTsf1R3+D6X3jCyuPWL8Vo5VgnJT
	KAsJjzv2DK7g9cv4+OYBd5/Vhk54Z5O+X79BeUXz2rtgtcUjFOFFERTiHMqjszAR
	7uZIUMGK8HXtS4+SPa/hR4FYdCAx/sgaT83f2bHUYe/VmTP8YNt1k/ehNUImCtaC
	r2+VBQ+fas1fyF46zFXMJeBMT8DFRqfjEJxJQu6hPLKSpVc8krTFXc6IkgcYjY4R
	7oOe5A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27084jf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:21:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c80be91ea3so44635715ad.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710495; x=1783315295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=topQkWEwcoqTN7MCwL5X+qwyPKw5DcKVugONuTUv8GI=;
        b=iMtvpbu2Fck3p716N2XHLhKbhfX2cvaybd0oMPGCCPHps+TuYOZezlmYMNMY1rRv7Y
         jmLZfhfgrfjhZq+aI5Ca+TxBdPmkS7ehjD44NY6bPj6996r6rfg1aZwxNNkjna9GcRlK
         FjUgrwUVAIZSef53zb+fEUU98AFifkJmM7MRitHEgOEGIO7qm1Mikgn26GOAB4zcdq2Q
         mnjxOwcdGeaU3uXIt70KH/496YFmCUkJ35qmFNiWNmnhr/snQmJjxmrxwkjI4D2gpNqh
         oXTUmIjTLUnPFkarYmVXH2n5jBVyDz/uHO45avtGcoynWjp8IfCbLl1528/b8JSQr3na
         cG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710495; x=1783315295;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=topQkWEwcoqTN7MCwL5X+qwyPKw5DcKVugONuTUv8GI=;
        b=IKZdKHGd1xXsoW8r1S0xVFS20HcN0bpm3DBdfbyyPcDJlGYygct1c6sO54uS9ZGaaR
         J9nPfw9sSGoNhZPwUhhdCzIyqzDDnNDnpQPFIRULUMbJlCujjrxNbqdmBcS9aE5hm5iP
         bJy31MRrdjbqwb5AptJiSr35BIjYSWWBbSowqhcxUV6RpwqxKyNV3Req3rpU1E7qbTeZ
         RWzJu9gsEQ038F3J6KpmM4HQzVVkmyygnAD1T8/6KjTKWP6eX6YlzV5KmHMT5hWbL7xN
         koiOBIc66i57YcAk4zns+rAE98QUiIHbOiy99G3X5vSHV+DpSmiWm6oUyQmRcktk6k3/
         ceLw==
X-Forwarded-Encrypted: i=1; AHgh+RrtHoYQXkXxFLypJ3je0ttFSz+mAaFkt14S/aCtxstfbspV39hkQAUaH2MFNSuLTEbdCtqC/GU1whTq@vger.kernel.org
X-Gm-Message-State: AOJu0YxrO5Jjiju2zWU+ecUrFLRz6+rj03VkwJVgE+LMw26zoBR4bpGp
	DrSDP0/Jmrlm9NQIfGZqVLlgSmlqAa+3EaHuXM0yEgX76RkxlNylR82rHZThLAeSfUT1Zd3FRWK
	QQKzchoDCmpt6cW6tLuZ3R5Qo+tPHq/iWJfGIYy0GYC8RFnNHlVR43TirzIzZabtJ
X-Gm-Gg: AfdE7clNemXFHZSqYBiono4dHG/ZjTTBYCtAg9/pVve7jf/XCGtwyWew0uoyorTaRnz
	nQZph5qRCNIwX3EvTtpJakYxMa+V+f+5KiWNp7L4ItLkURjlo4+leMNYi39fPdLUdG4KRqV/ykp
	6vxurkIVXlWo8FqVOkMAZMS+ImJawsP6T6d+YR9hFvQ7R+TKJBNF3TKCWgpdWK4vWMl+IO+ThVd
	5d19hCIf/HhgSKQNb4pIo4dAwyAA1hCgTHC4xky4MnFhUP1iong6jHPHFJimCjw6q4yZNPixVyd
	EVIAgXeGRz3uQ6f4gmYoh3jTRb6lW+Qs/mBidc9Lx+6QHwcyBvFVbGlf/uHhMW4He9HsewobeJy
	WvrJhdYdPb9Nb/mB7IuY8gSpGyhK9iXRlKtJhjw==
X-Received: by 2002:a17:903:191:b0:2c9:c083:cd49 with SMTP id d9443c01a7336-2c9c083d409mr50062565ad.14.1782710495157;
        Sun, 28 Jun 2026 22:21:35 -0700 (PDT)
X-Received: by 2002:a17:903:191:b0:2c9:c083:cd49 with SMTP id d9443c01a7336-2c9c083d409mr50062205ad.14.1782710494705;
        Sun, 28 Jun 2026 22:21:34 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9d886668esm25607175ad.58.2026.06.28.22.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:21:34 -0700 (PDT)
Message-ID: <620be193-f49c-4f8b-b025-51f266f247ca@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:51:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: qcom: Add Qualcomm Shikra Audio
 Core Clock Controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
 <20260605-shikra-audiocorecc-v1-2-7ee6b5f2d928@oss.qualcomm.com>
 <foutgm5vhldz3verik2mje22nrnu3r3z72mxah5wmmuoro4l2q@ud3nbdgctpjl>
Content-Language: en-US
In-Reply-To: <foutgm5vhldz3verik2mje22nrnu3r3z72mxah5wmmuoro4l2q@ud3nbdgctpjl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ObKoyBTY c=1 sm=1 tr=0 ts=6a4200df cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FQhjQoDDPVDRA2-OVkwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfX8/mUfWCVWFuB
 9rgRSYaFNu8WLmgy8gJq1C2V5Zh6ORjcDuFTMAVNlPk7I066Sdx7dPr0eIK6X2D1wM2b3x+3nvB
 vTp8pDRlbq0v884dn02nMfoqKoYLAqWxIafYFN8ruU7j//OzJgp+bN8XgPrDZo0ufNsTfdZjwsm
 M4J1Vaa7XLZwGEYI3aogHkWI17sevTjTqMeEHbK51beEmsLViNJwcFaybrALIDLq7QxMnuUZ+B3
 EAwqjQ5yxb6whnJo3zBZuDTe+1nGOnqP5q7UeQ4Tze/ob64SB0xBaPpLd0c/+irPRy9ulXKe49R
 M5hk8P7dCaYNu8nVQnq6kHYwdzld2MeGRZ6dgO80/4FXuApMpvKixNqf34wCigrA4GMafV/pN1Z
 hEZdMu2cr6exDesm9yIrDNcMpRePMVKtKpnikYuFlUyCPNL4yRkGctQOR2XxLXDNU9PYZPfHML8
 7t699oqzdNPXf/aQ6Cg==
X-Proofpoint-ORIG-GUID: EjoFmlFflQKDZL4xZqVBB71TphGIR5_9
X-Proofpoint-GUID: EjoFmlFflQKDZL4xZqVBB71TphGIR5_9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfX1Dqr4bFarcO0
 pSNuFfSZxfDSVWisrPsCjF2+VJDZLo9Qt54W5CqqgPnu+uIB6g0iUpLUq3pqFC11nmquGkKIQEp
 YAXMKwZnB8adYD0yEQQt9gCleqw6VWc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290043



On 07-06-2026 04:48 pm, Dmitry Baryshkov wrote:
> On Fri, Jun 05, 2026 at 04:56:31PM +0530, Imran Shaik wrote:
>> Add device tree bindings for the Audio Core Clock Controller (AUDIOCORECC)
>> on Qualcomm Shikra SoC. The AUDIOCORECC clocks and resets support differs
>> across variants based on Audio subsystem enablement as follows:
>>
>> CQM (qcom,shikra-cqm-audiocorecc): need clocks and resets; audio on APPS
>> CQS (qcom,shikra-cqs-audiocorecc): need resets only; audio on Modem
> 
> What does it mean? How does CQS play audio? What does 'audio on APPS'
> mean?
> 

In the CQM variant, the QAIF driver runs on HLOS, hence both AudioCoreCC 
clocks and resets are required to be supported on HLOS.
In the CQS variant, the QAIF driver runs on the Modem side, and the 
required clocks are handled on Modem, so from HLOS only resets are needed.

I will update the cover letter with these details in the next series.

Thanks,
Imran

>> IQS: no clocks/resets needed; no SoundWire codecs
>>
>> To handle these requirements, variant-specific compatibles are introduced.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/clock/qcom,shikra-audiocorecc.yaml    | 62 ++++++++++++++++++++++
>>   .../dt-bindings/clock/qcom,shikra-audiocorecc.h    | 49 +++++++++++++++++
>>   2 files changed, 111 insertions(+)
>>
> 

