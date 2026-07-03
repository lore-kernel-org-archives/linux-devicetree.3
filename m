Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA95C314B66
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 04:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783054403; cv=none; b=EhilPloWyXpvJ0INx5cR1NxWhBAu9aq6qPXP/YIIrPWRmgqLZO9JHL0QFk0adQAKXd+Vbabx2STjhkIHRofOGL2TvK/lRDNqAx7hW0M+bxqzNpu83y/lNMdgRjUXWX6k+hf1qGaAT/+NlUW63Dh+WiUfa35ljsp23441TInMx6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783054403; c=relaxed/simple;
	bh=NknhmZvh0kvHIBS3PtJIHQtzHj3i8LUsDKPzHhL8/dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ydp/n+IWlhV77aBFkDscgxGJdn6D1PTgKpLpvpRBkv/u7D1J2vyX+4kMrAAnuMhje/JzdvyKZxC7AJyMMX3DyQ9nu9E+2kC2o6zWTUDivFxHLoMQCqIaXFvGjHIVda+mjmfYBYqF8mv8UQu9vqP2vjzZygIq8A61aTfQ4QXYrUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wq+tKiU4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HKj7ZRYS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wq+tKiU4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HKj7ZRYS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342ffH2777604
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 04:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8SMAhbfVSKwdD38G3f7xC/eXU4B+FvV86kCi6fke9xM=; b=Wq+tKiU48g3TImZY
	BVsG5SrMsXC0FkeoeAWd+nMsmVUlh9Q4f6sz2ooetk/bhZC4sIXjYhi2sfiQ9tNQ
	IOOb4PjFvr2kKN9Ikp9X63OqkwNnxdLcmCWknABhkOl16yyTmAreN/+yUNSVoTQh
	mVkVHCa2kCJfvPEm4S4xOIX16M1oVpVKKsAdiLRsCOazxuGNOmeyuXly1ow+23wU
	gR7xl8JJLFA4WibAOC9cpumJ3W5At3wHZgIa6eXO2AVv7c5QHL0U38NBzHVRUjTE
	liPvOYMjZwQwfyrUAh+TGaaQAPxJenzGRjHYBv4gg29gwnaunU4Zf3f8X2ROOo60
	UiTIVg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s2534d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 04:53:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so202418a12.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 21:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783054393; x=1783659193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8SMAhbfVSKwdD38G3f7xC/eXU4B+FvV86kCi6fke9xM=;
        b=HKj7ZRYSt7bZS5cOkoc9PpE5U8Pf/11PZTOyMVuVTzJrQ+36T89NTqjh2aFooInbzu
         oIiTmj24V2oB2FwTVFS0eyXDJj5FoZAnyjVRqACSObhj/ThMWMaPXIptRGgmMkTUILnX
         c9zEjxjlUbIuvi/85wOCPMSEM73anYgXcoyz1JEc7QMCVFPlc0d7qRlwnPAPQekzU6bV
         NvfWEYAUuW+pgM/TetQwdJNAmdGScXXv5n4r88JDaa7VhHSH4pgk5FR6gdFlDwxxSQDy
         GLswleobnWvxtoeCOw20J5BQozY0wBcYNzGnd+y+EQsBHm+fjl7l2gldzL/KMetxxeqd
         jTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783054393; x=1783659193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8SMAhbfVSKwdD38G3f7xC/eXU4B+FvV86kCi6fke9xM=;
        b=c/WgHlRRxYoswD5Yrz3Idw2eSTG41kaWJTh3F3pzTPk6KS2EjE5p4i8sxNvZttwqt6
         Fw2H0SUVLZy7x0VDiM6jwADcaM8pQy+QOxd/+h2z3bWKP2Ro/sPyBDYDESzh6iM+TmIg
         ivI0oixvFRNrmtbKe+2VLBWt6FWGEzzQa3dMhe2THmF+JYsMZnIwT0Y138TLgwHkEKIQ
         Cc/wGLGJXjIBXR59WkhrZz5k1eWBnUSaXfM7xnrqjhwB7WgFYNbKo0xyjjr/gqKT5Gco
         C4Gy1R7sQwRMBixzz3f67/pnkzonsdqRDRHpbh+shIHrmQ4WQMfbPvbRqEn5f/7C4EkP
         xpLg==
X-Forwarded-Encrypted: i=1; AFNElJ+D2MO2dg2TqoOwylrAs8/7wQo0+IrKugtXamKoPCepvRQVqlv/CWCbKPSMVAjxThQbVWxgrW6TlWIz@vger.kernel.org
X-Gm-Message-State: AOJu0YzADn9w52iIl4TDwJNkMkMaSb0VIxab6JeMCrfbQC5KfHNGLLNQ
	UIVjKPMpVlBnuEp6qkR9/iMgopQTIjufWKF0Pmc+mMhdmIlP8lfxSicnkQ5QdNV+NofDNC8+f13
	P7WhAj+QOeZWDQKkU8Cwn1Z6UiZOB23wPosY0Z9/JF4oIvk60Wrfv4Jos0khIvEFe
X-Gm-Gg: AfdE7cnPcSJ0IzviSOoAfrGuwLYArTks3H54HnmDLrFmEAs775UtTYu5eKUpdcp+3LU
	6hxib982X15IMLZeTUiLiGoLV23qYkTYW4vx7YIXWxZidtx9bc+wkWKPCOjpZ4jXs3QfO/oyczq
	Lgv5M0kkeZiL8G9aA8HQJhHKo5RGjfK767XCwiRS48vgL49zwbX0TCozF4AsUdP+0CYO0OOsXQD
	n2bBzHcLUdfliV8bTKTvOt4HC881L1WfmsTPOS6OzZgmI1aEsTjJ/2OlCyCpUPtjyJpgwhI435H
	qr4XMeRpUkma8Ud2cBDxfMBmlh3hvLstM0XJdOf94kiS0xy86ht9ZW133oJR/t0UJ/XbLCPal0o
	dRtkNzb7HKsgpijZtD0KMc9omE6Moy3VGDtIdQKZkgYA=
X-Received: by 2002:a05:6a21:697:b0:3bf:e94e:e38d with SMTP id adf61e73a8af0-3bfed472a5cmr10107085637.43.1783054393106;
        Thu, 02 Jul 2026 21:53:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:697:b0:3bf:e94e:e38d with SMTP id adf61e73a8af0-3bfed472a5cmr10107058637.43.1783054392522;
        Thu, 02 Jul 2026 21:53:12 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb843fasm15565027eec.18.2026.07.02.21.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 21:53:11 -0700 (PDT)
Message-ID: <66b34158-56cf-402d-9364-2522dfc45d80@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 10:23:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
 <20260521-shikra_crypto_changse-v1-5-0154cc9cc0de@oss.qualcomm.com>
 <enovafjkiuzr4bciu6bu6hh7h56wvnaq5fh7f46m4h7browyrd@7huwa5egaqaq>
 <55039d7e-34df-4f89-8188-fcb45fdea538@oss.qualcomm.com>
 <46005937-c1a9-409b-89cf-4b8f592dc5d1@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <46005937-c1a9-409b-89cf-4b8f592dc5d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a47403a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pHORTPgO1eFKx7QcuTIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: sDBdYtYa6xDJua5ZOqh3_6-qEDVql91u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0MyBTYWx0ZWRfX+akGByy8JXCd
 4pjRTF7KxgtT97rgaJhEYoUrPESwrOOncMlVlx6Aorl+AFBoNvUX7ogjC4bL3Q9Jas5ZVHKFdlA
 AyZ/sBruUkVTtkS5OAcJYaWv3TEnsqwyn00GjJgoqcuI8cNiT0b1toDABxwwc/fUkLFrhh4VQJf
 y8WFCg3RQOOEQ/sv+Z8pMlIScEcKRXRnRDdtegF/9IZsvdCuttq/OXsnuIVBWDXOOFNxHY0G4pI
 ZPKAkYSYcV43cSK/QL9dXAo/JfRIy0ds1nGZZKxAMJS4yCx6HofflbrO1TiwhIiKpWbLB9+P+7q
 XTsCEWQldLidLYBtrvoT55rbyz8XdDvrIzME84zh2F4jeDnM0ERnfcIy1PfukSh1RfVJ5BBBALE
 k4jDMaA6qi1w/SJza1Z3TRB6c7iEmSgSZXhkrOzkgjlVuoS/HnLB2I94JNT80lDSzYYEfJ4ZiGv
 FQKlp9Bi+qxV96EN+fQ==
X-Proofpoint-GUID: sDBdYtYa6xDJua5ZOqh3_6-qEDVql91u
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0MyBTYWx0ZWRfX1xlnxdg1w6pJ
 ZiJVQg2cTzWPtNHan5u4valAB16CBdHr2QeqnH+6IEkpElW+L9Yu29Ml+W6gSminss4BxZ7q4+k
 V9GdRZEylBWFMwG84tC9WO4dv+DbD5k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030043

On 29-06-2026 17:10, Konrad Dybcio wrote:
> On 6/8/26 12:09 PM, Kuldeep Singh wrote:
>>>> +		cryptobam: dma-controller@1b04000 {
>>>> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
>>>> +			reg = <0x0 0x01b04000 0x0 0x24000>;
>>>> +			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH 0>;
>>>> +			#dma-cells = <1>;
>>>> +			iommus = <&apps_smmu 0x84 0x0011>,
>>>> +				 <&apps_smmu 0x86 0x0011>,
>>>> +				 <&apps_smmu 0x92 0x0>,
>>>> +				 <&apps_smmu 0x94 0x0011>,
>>>
>>> 0x84 / 0x0011 is exactly the same as 0x94 / 0x0011. Likewise 0x96
>>> duplicates 0x86. Drop the duplicate IOMMU specifiers or explain in the
>>> commit message why they are required.
>>
>> +Konrad too as there was same discussion in past too.
>>
>> 0x84/0x94 and 0x86/0x96 pairs are actually different even though
>> resulting sid is same.
>> Let me explain more.
>>
>> From sid sheet,
>> Description	   SID (hex)	MASK	RESULT_SID	S1 CB
>> CE descriptors     0x84, 0x85	0x11	0x0084		S1_CRYPTO_KERNEL
>> (for data pipe 4/5)
>> CE descriptors	   0x86, 0x87	0x11	0x0086		S1_CRYPTO_USER
>> (for data pipe 6/7)
>> CE data pipe 4/5   0x94, 0x95	0x11	0x84(same)	S1_CRYPTO_KERNEL
>> CE data pipe 6/7   0x96, 0x97	0x11	0x86(same)	S1_CRYPTO_USER
>>
>> Qualcomm BAM DMA engine driving QCE has 2 major components here:
>> * Descriptor pipe (0x84/0x86): This carries BAM command descriptors i,e
>> key, algorithm, length etc. which tell crypto engine what to do.
>> * Data pipe (0x94/0x96): This carries the actual data payload — the
>> plaintext/ciphertext buffers being read/written.
>>
>> The descriptor(SID 0x84) basically contain IOVA address that points to
>> the data buffer. That same IOVA address is then used by the data pipe
>> (SID 0x94) to actually DMA the data.
>>
>> Since, Crypto engine descriptor and crypto engine data are part of same
>> crypto operation and with the limited number of context banks, smmu
>> provides an optimization to logically group and resolve them to same
>> context bank/page tables.
>>
>> Pipe 4/5 contain 2 SID(0x84/0x94) for kernel and pipe 6/7 contain
>> sid(0x86/0x96) for user. Pipe 4/5 doesn't touch pipe6/7 buffers so both
>> are safe.
> 
> I understand they are different from the hardware perspective. Are they
> different as far as the OS is concerned? Will we ever need to separate
> their data flows? (I guess that would require iommu-maps anyway since
> currently they are bound to the same domain anyway)
> 
> Alternatively, if you'd like to keep this level of description, it would
> be good to describe the iommus:items: in dt-bindings, so that one can
> make sense out of it

Ok sure, I'll update iommus:bindings in that case.
Please note, I sent v2 and will incorporate in v3.
https://lore.kernel.org/lkml/20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com/

-- 
Regards
Kuldeep

