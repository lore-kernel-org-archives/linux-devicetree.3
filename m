Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602652;
	b=hSOU+/afZ/JkiS2vcbCGCPZFrmSn07bNo3IrMQXgHLXw/oMZLDY1k1NBf+OyEWgEMtmu
	 Zst62FxHGUOvhdoFbagAttos24ytX1+IEwOhG8Lol+3tTgF+3f7xJW9qGnANZn9/GQBEU
	 1JD6lKUrATqHne6oltQqAZ2OiQZuTXP74Et7Z4NiQ/fjpsflaN1NYPnYCgZJPoM6CxpwK
	 b8kEuLJskjoQusjJaeKS7X+yDI+zk8t8R92x6iVhV+n3Xkp8I+8lOKp+BoEoqVOheSBjs
	 3i932eLrJLMMOgs4pMiW5keyL/P/uRtaZzXXNiO//XScrm62R0D0rPPsQx/rFBiStHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CgwSM/motJLYHm+Hr+NJTgUPn8ykHSFv0PhOGVANaXc=;
	b=eAx1uVV2rArvsJCoUtXRj0Hyuc2JodkqbKV2pehMdY0Vuz/dXfQLWZA60yvXOdZJE4GS
	 w5T/OqsQ0bVIix2Y3ZmOvyOEmvfMx4FRfF/opK7+qrhqkJ1TtaF6jPa6oeDJGAXNXGk2H
	 WP26TRSRr1sMIOtn2qI71tF8H1K4ejhiMyvTancgRtgvZmriyRXfWwalPvyTI1nV0WPjf
	 R2AOl0rvBnGZbZw2oABJZ/1th9cYeAHMffvQH1YXFfwlad1QMIwBT9yGo4EZnbLPkjOjM
	 NUFWPYZNNrprYcvDqkQ8ANbgr0l0wzT8MVLjDSVK/LQY/6P067PecCT3H3B+E/GaXVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hfbd/6p+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="CH5H8X/4";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A81D606A32E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A81D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hfbd/6p+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CH5H8X/4
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9m8Lp4130788
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CgwSM/motJLYHm+Hr+NJTgUPn8ykHSFv0PhOGVANaXc=; b=hfbd/6p+NLV5Xds1
	S80CYesJCHgqcIGqbf7yj2y4Ri0FQ+QUOhYlkOC+1NBMvz//PG6BhZfQor+AcE7J
	uRi9VsKRNw+ust46DIQXj3UTlM3oTxKYSwpq+NuaXyI+7HNIbWGE69VO26PPT9y1
	4H+h5diw9LZeeA2aEbFm9aV6gq6e4cWKgI1WDvjAzOEhZbGhpIeEPNjC4Bb0EO6q
	BWZvVLz0gyiiWaslPlCv/xee+MZJtYAUgxi4SfeF2BgYb0GXuFPOkL9YiyNc7DIK
	FzlhYuYTt4VdgR0m3lsthPeIZ2UYB9CPgfGEaghfif58GPRhTfa8B8v/B4bGSvM/
	POAXbw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhrcgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:30:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55cbd8c22b1so8446701cf.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 02:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795602649; x=1796207449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgwSM/motJLYHm+Hr+NJTgUPn8ykHSFv0PhOGVANaXc=;
        b=CH5H8X/4SQqqiJOV0b1l0m6sYWtf4rfL6obgL+UmJWECxweOYJgqQERBl/o64qvDqx
         IZa1VbEP7QPyungArPawYkNRr9Z3+CKBrLDP7CCzUhUgXsqZxwmHKWy+NzrjnXdjGfLt
         GSBx+Va3Qd5xXWp2aHr57foMRHJLeKug+GGVQyjBKeH44QexVsQYHcfibYTer8BnRvW6
         MYnKpS2Y094wUKRUfRDcD6Aq1Op81/NJlkSz8ByX0R1O6zHDqWCpIqyjAIhQ2o69aurA
         zwBRNm3mfZm8IRY4bUXcDKhaMvEaQ/xunrjqMeDY26mXz6r73VUOQfzb1/S2ygSXwQAj
         Yuow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602649; x=1796207449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgwSM/motJLYHm+Hr+NJTgUPn8ykHSFv0PhOGVANaXc=;
        b=G6quTwNSsBL4HPV87IG4HZ6j3yW7kJqKZcvIUHbiVWipOy9iGw8O5qm/yD03wpjAOl
         iBn4BlfyehQYlcNkWqhRG4DBD+KZnWl5xzQh6j6VHEsioSYMiUKD+RBV6Rkb8rYMfGCt
         5Ki1C3t25d3esDl2R3F3ZnGkIwEGADVSSnB8X7QTix+Smbnug3Ati3U+b8OAJj/wdjz5
         +kjsVX/sldBtgktC6YGKFzHxHrCRY3h66RUIIq/E+BxNyfqrelaugqQ1aeMxirQhkCVM
         xth2jLPZ/59CmM/s7L46Ljvjdogava173NpPSOQwbXkz0Axi3xG6AP/1TmAyVMzcMABT
         vhCQ==
X-Forwarded-Encrypted: i=1; AL+hErHvq77+nyEjMmxZ/GXo+BMdllqC4ryqT8OOmgHu5+2/T49WS1RZRiFtLFYydI/TKxRCUggwIrp9J+u1@vger.kernel.org
X-Gm-Message-State: APuU4Z8uQJ73aGag/yqo3tTZ1sghfiUMk2fb99UZrAkp/h3uhtXgk9QX
	QfvRxXbqKWqxGlC6kbk0ZUnoKAIIgGLwGA5U56IC2xm6YQwS4HdkN8c6wtI/UTkEZP3MiecSNfM
	JANTaTSBZS2QR0bcrTnJ9Frs5+sVNxR3gxCrpEyTKcfjOKvSFRx657knoAtoYobGZ
X-Gm-Gg: AZFdTZe0mDFzsaBlvMOCjJygdR0fls1xqRGwNsseH04oLZXnVHezUBLWIYbeBwr4Dbb
	2KLNGQ+20DDyJihI/WQP8UDuwbaMwUK75aWsz4o65+vIR4nLzgkcUrBF1cMLRh4CCt9H0rbTkZe
	BfaPc3VRqRCC27z9GfYOP/aBi5YLt1+hlzSU01Ak0+bmU2sDwML8A0ro/JMuupkt+dvRFan8Qr9
	X3kfELH8bHCGN+P9fO8ET7dAYVD3VED10acgdtyY0Dq8ryG1qVSdkZC2FSQ3fNGLk+wu+iOGqdv
	UxMy4zorpIlnmnwSrX4CS9p944OmoNvdKmCQiloe0hLNAS2uV2lnk4403uegbhCt/HF5DRJT020
	NJrXJIfCrzt8gHJDEoHyeyY58FIVbLae+agn5BE3QYce2846W5e+eNgW7s4U6WM9ZZs5svsM=
X-Received: by 2002:a05:622a:e2cc:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-55d769f824dmr293213991cf.3.1795602648892;
        Wed, 25 Nov 2026 02:30:48 -0800 (PST)
X-Received: by 2002:a05:622a:e2cc:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-55d769f824dmr293213541cf.3.1795602648401;
        Wed, 25 Nov 2026 02:30:48 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afed607sm611728366b.77.2026.11.25.02.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:30:47 -0800 (PST)
Message-ID: <9ab9503d-1668-401c-8d56-632bac5d82ff@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:30:45 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark cti_riscv device as failed
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20261116-disable_riscv_cti_for_shikra-v1-1-d7cc81f901e0@oss.qualcomm.com>
 <30485a94-cc85-4c64-8593-a2218a3aa59d@oss.qualcomm.com>
 <f2cc0d77-3a5d-4d82-a697-456488bee6cf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f2cc0d77-3a5d-4d82-a697-456488bee6cf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06b8da cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=D7e9McI_jBWpmMXics4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: GKwtVGzfq0Ilic7Bax4NuLdIGpv5inxl
X-Proofpoint-ORIG-GUID: GKwtVGzfq0Ilic7Bax4NuLdIGpv5inxl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX6DwHWRw5xQHx
 3ixKziBDXLYbDnOorEzHyE6uiYn9ndyTSaJ8A9moTUMu2DYhV+28EnJDS3BYj6tHvrqx+w20gJk
 hFzYXF2u9PjxLQpiRtdJD5BXKJU/Ay0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX+54up9OGFsLM
 qiY013lI3FYqMe7+iAtJfPwfkTfEVaMRxPexO7AGECKjkFdzQCoSF62yD/LAhFZ+5hkFqa02fjS
 KMYrgGKVVNGlrflJM5IQG75JoaI5W2AMIyWwVeZFnFXD5r3bszsbz4ITyT4BeKNym5oknBJYiyk
 ZQXgEabUM3vdAAEnJPXVKYWETOci5WI2OZ1jBudO2zeBMlGAiXP+738RdofdB7grzm/5XYdc+mK
 0Ai+DIq2NXPjxS1KaAXG4LhTDDI9GRtbke2aXBj25Z1BwySKtMo5DVw78albEyGM5jdJ83rQLkD
 /bSHg3IhTlDYCjNsVtceK0uTptZZb5mK+gwo1qzNidpi8Donv/isAN2Bh7n/ktFhGu8KMKxOO1p
 FIE1DTw6/oBWdo/82f9qouV+iBBPIogyQYO6CgytUcXM4kWYzwNu7jlZUp3No4CrMb5TfjY9qB3
 yPoXcQO6XYKbuP9MyMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250041

On 11/25/26 11:11 AM, Jie Gan wrote:
> 
> 
> On 11/25/2026 5:53 PM, Konrad Dybcio wrote:
>> On 11/16/26 12:03 PM, Jie Gan wrote:
>>> The cti_riscv device is suspected to have a clock vote issue on the
>>> KVM enabled path, which causes the device to crash during bootup. Mark
>>> the node with status = "fail" for now to avoid the crash.
>>>
>>> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>
>> That would mean Gunyah is enabling some clock that the TZ itself isn't,
>> which would be solveable through a clock driver patch. Do we have more
>> details here?
>>
> 
> We are currently debugging this issue. What we have found so far is that the RISC-V core is not powered on when the AMBA bus attempts to read the PID from the device registers, which causes the system to crash.
> 
> Normally, the RISC-V core is powered on by remoteproc much later in the boot sequence. However, we have not observed this issue with either the UEFI or ABL boot stack.
> 
> One possibility is that the RISC-V core is powered on during UEFI or ABL and remains powered on when control is handed over to the kernel.

As a workaround for now:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
