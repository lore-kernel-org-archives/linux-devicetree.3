Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369134;
	b=oLRC2PqHNWZYdojlXTuVUdtcsOXpgCRHWXZDpCe4TPqJ9EBprlz9Bhph9Rg4x7tXGnPF
	 XFHBrsKubq0JunEgf2mwvSU1fLiafU2Zsz7XoMzHqOQ1fTxR1L87A/D4QFbA7jXZw03mD
	 5e8x88RzGB0uFHOwCnIROMCitcahgGF++YXjv8Q28zSzw9HT95uPbhkrSPChAuv4qc6uw
	 WsfDnWigbhldpnZLsTcrtbUnI41X8nfiAS7v5L2r+zAXHmrumwdBJ2aEZJi1bRG8B/i4k
	 teNfzHZHyPtMhtW7TJ9ZpPu5ZZwAZGjWr21fSy5oFcyUouiPGOgCnvjdEa40zYoELeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369134;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rbV34oi9cJeVMXAr54dz5VJbd/j+Zn5ocM7OggS00LE=;
	b=WJYappd3Mv9vJG8i33FPiCg1s0pXBLM/JfU/gtl7ZrLumXxqZSrEKdVxEySR1hpnl+R1
	 VKNTn1oa0xDeE9jf8sFV7uMN+9jhEZw5pVUtVM6i30ctlpdat7aHRvOUSqp77iNv9Dbc4
	 6FGAY3xASF6t71MCxUEaCSJg8VfMNgD2liQG86M0nJFSR+gzDNAM8wbUG7T7WKIt1o0r9
	 gCQFpGn1MyO+OXUX8n6MEvR1itcy1JnlSQPQbOWvku7qdfRQMhkGuHQVanReoK5SO/SaA
	 7QPrrVySyDP8LfC5As+jsoKwAIfHSmN5CANtQ3fqX2c8ov7InW/uJPWNpb2rmcGT2oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="I/B4aZSU";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CxBmYtt+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C42606A31D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 14:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83C42606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I/B4aZSU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CxBmYtt+
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDnZL81869083
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 14:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rbV34oi9cJeVMXAr54dz5VJbd/j+Zn5ocM7OggS00LE=; b=I/B4aZSUbex+VvzH
	UGsrZ/7W+JVAfwK8lQqdrmfv4UkM2BuKAZKFE9Sm/HVI9Hi+D9fmMoJtXnah+iIY
	Up3vBSjW7ogvrz+TMhbMZNVxup2cRbceEQxdkP2GRUCjfrD44Ewx07Q/9HC5YjV1
	0iQfqKLuNrj/ec4SQoiTraQWtUci4WUAyybJqwQDm9p7B+4tXXdKfG7tIJ8qt38k
	Ht5gd5X5tsTeuRaO+vcZpAYUOnecBG2VaFwK9QVyO4nfKIQY68/Os+vGiAOfbeGR
	cy4zyS4CAwiQtVoM9a9kMOWKHqoB1jMGpIdJ4ZOjf0NytbiJJn8XaO53ZochKWiZ
	dQ4zgg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pkd09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 14:05:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so671400a91.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 07:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793369132; x=1793973932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbV34oi9cJeVMXAr54dz5VJbd/j+Zn5ocM7OggS00LE=;
        b=CxBmYtt+9JA0tzgdpQiWRIKtMLBNeL3HAJkpgs3vC7+W6ggITG6S76iMjbui451+oA
         2cN303WLhFG3hkUfplHFrw8XtE0VFOAEPa0wIJRe7eC2DFt2n+jSbrTZntfyE5Ewg6mi
         tmnuOtqouxtHbuxIJnnn2NFhN4hGRS9v8DZIVPZQr4cGII0aJhfNQDci8Z/KeH8FDUk5
         UigkvEewJf/wyDf19FJVQKiIo+79gdUqePWlGxuc3uBu+1iGfUaB7B1l07eWbl7rShvh
         VyAoxTOvndI4aNvihI6vi62yMCcXTvdSffGGuTS+XG9FPVWGobi5XrvobpryFNN5W/WF
         D1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369132; x=1793973932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbV34oi9cJeVMXAr54dz5VJbd/j+Zn5ocM7OggS00LE=;
        b=m3dX7r3xL4dy8qvCGxzA+KJlLrsSkfNttJy02ShXk/jWv4PkAQcw23C235ACCEDgPt
         y6OTcjfksjoLBDOx0m4g56ZxjlIbqyB2nu+95XtFKvuJwoHiM7OJAAv2f+rLrusk0NnZ
         1cREpEhmPMAxHH5oMTXF8FLHKVPETA51j8D8Ds6aV12D6V0nURRHCCQ26pZWExM9URUu
         mN2TFyUjCkN+J+25g91r+SQTxKDcR4CNNONWaAXqv8yF/SywbiT51tgVhvF6DQwE3eYq
         JpS71KEUqx7c7uISsCdWLdlOZSZRuAfjcul03IhqbndCHyU8sSWlz7SwXuwfwxx+imUZ
         oKfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzL/liLr8xm9mTWGBIhtfqoWtNRmZ4Aasp0hpYhcafjnQ8KnWoetw78die0YWj1fekkPZeHZxft3O++@vger.kernel.org
X-Gm-Message-State: AFq9FYIXFyD8896z/Y+k5mkBOPMFkPFSHvOM2nKlvvyjDuD7eUfprE7t
	x/sKmAdD2fc4PmhahhkIbDUEW4lX7dnSkGe7ntoBSehURu1zJNs00Sf5vG1EMY+NnKoF22NaQzp
	qd849J5/+rumj1q2TBCGEEH5J8GasNO0La6uuRJrLclJ8N6LqiloN9pdWChNRCawh
X-Gm-Gg: AYBFou1WChNoH0VWAGe+NneY3PAnXuIGToAJaOyGAYBjoD75wtOcuOu+afXUoFNqONA
	nQeEBzV9KpS6RnZhK7x8Tmn6oEO0pNQp4xGMftzZahJOx7GBANLF6QvUYa1dY6CToVw1qhgDGNF
	+hFysoUP2yIX9nJb/lfwOAzGiTApyDUSO0t3b+dxIUHlfOyb3ucwJj5BbeNZ+3moSVqQ5U7m9yM
	8cX/xAUwmjUCaSY4uulBRTPviCBtFk8ys6EDhKDwv6EUz+DKQgu5HmfNw+ENGDZG0SOB2VtxmAV
	vmAMtWacc9uInAisLOpoUI/XexGax9cl88E1tlzWTkM01xHDUJ64Whu/+bdHbInrWl+FYxJDdMA
	74dm+piCQGNiX2hzs8Pa6veOQog9PoF3pWQm9G62zRDcZAGxH2OFWSD3zbGOHZAqzA49xBAAyoG
	/r1LhJaq1AWBqqsGNDMZ8ryQEYCObsSDPbBQG/
X-Received: by 2002:a17:90a:dfc7:b0:3ac:6e91:3f1f with SMTP id 98e67ed59e1d1-3ae6f00cccemr3780110a91.37.1793369131931;
        Fri, 30 Oct 2026 07:05:31 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc7:b0:3ac:6e91:3f1f with SMTP id 98e67ed59e1d1-3ae6f00cccemr3780080a91.37.1793369131298;
        Fri, 30 Oct 2026 07:05:31 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.160.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb096fbfa9sm739707a12.17.2026.10.30.07.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 07:05:28 -0700 (PDT)
Message-ID: <10c00e3b-bdbc-447b-b8e5-23642faaa4d2@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:05:18 +0800
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
Subject: Re: [PATCH v3 3/5] dt-bindings: media: Add CAMSS device for Hawi and
 Maili
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <20261030-hawi-maili-camss-v3-3-9742bca8cef2@oss.qualcomm.com>
 <CAFEp6-2vN5UEbSwDH91eUzP_w7DHd3WtuLnui-_k7az2oQnoHw@mail.gmail.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2vN5UEbSwDH91eUzP_w7DHd3WtuLnui-_k7az2oQnoHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NiBTYWx0ZWRfX5YTo2PEWU+3Z
 yeOBe7cwn01xL1psMjMRfErEDjrm8yRxvGG8KnmM9HxofwsfYjWYQWp/+GDHBkyYdP/ltV1IWa0
 6qzrmIH+mf+FWxCkKMsbkHpfUhI8cLbHxAjTgHmc25fuJDhD4VNs4TZGUFLV6MHsfTaEPRzTnSv
 1C08wfmGkQCtCv0lymU3U5iK7E09MLaSv/hSAvzhCboysscjJtM0P1unhyrKnww1wuy6DMIdDL8
 UCYJn/6t4Zz10Tk1tIcgl95qbVbSM757S89zajlmZSWOewWk0X3JAFQXCybYMRU6zckFHEaledm
 RmmrT53xUAztXYJmSA8ub6qTkZuc7fw/kWQc2CnZGwzELJKQNRgR9VHHURXNSeHDRBPfqlpNQgz
 yZ9DmApFpjP8lQ4IkrjUft1xUcWRIRVuHBzTlI8dCQRcZ60KJ1XauuEyF6SSjRdF3Q/ZtHem+Nz
 0j5O+CgoUjcJcYtvRPg==
X-Proofpoint-ORIG-GUID: muNYlu74jQIsUCJXqauDjbKg5yO3wUah
X-Proofpoint-GUID: muNYlu74jQIsUCJXqauDjbKg5yO3wUah
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae4a42c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6d0oVIyUxUng7TJeo7N4IA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tb7J9fPpy6OZh8FWujQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NiBTYWx0ZWRfX4yFFtZcpQVFT
 bSsrWaXqz+/pHCmRGJy5awHBkiChV80mbMcOx/dd+wQUyKq2PN8rNfQrtqfTwris0DD0WTS/Prn
 +iHSZQ2br137CpPgthk7/xWAu2EeGQE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300056

On 10/30/2026 9:38 PM, Loic Poulain wrote:
> On Fri, Oct 30, 2026 at 1:43 PM Nihal Kumar Gupta
> <nihal.gupta@oss.qualcomm.com> wrote:
>>
>> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>
>> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Hawi platform.
>>
>> The Hawi platform provides:
>> - 6 x CSIPHY (CSI Physical Layer)
>> - 3 x TPG (Test Pattern Generator)
>> - 3 x CSID (CSI Decoder)
>> - 2 x CSID Lite
>> - 3 x VFE (Video Front End), 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Co-developed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

[...]

>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,hawi-gcc.h>
>> +    #include <dt-bindings/clock/qcom,hawi-camcc.h>
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        isp@9253000 {
> 
> Address should match your first reg addr.
> 

Ack, thanks. Missed updating the binding accordingly. Will fix it in the 
next revision.

---
Best Regards,
Hangxiang
