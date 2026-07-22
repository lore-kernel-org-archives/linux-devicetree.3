Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B55643F8C9
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784708390; cv=none; b=pYzJ+uywp37FKX7FSUt4Oo4EqEWF7Tmqdx4RwXwpz50dWyhcHcjFEGgUmeMspsOHmDY8sSbyfhSebTLcApkbKEGzko28a1nfV0v4cX2gCiVJNevF0rvFo9BGwMCPDLeINYUlBP5lBbWrwoGP/TQ5xdUb1iX68jznS+izim3+sBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784708390; c=relaxed/simple;
	bh=p1rkmvXGTiLhtr1/+2Sil5jynD+77pf87ao7Mn5E+jw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=as1rxOi4tGjDwumBWjyQq96WZkQ5q98hY7el3PieWinfLcAdLZ3V97JVvYZYX+mEpXkjlrTOBttrft+LEtZz70KlYsXZydAH2OI5lAXcehwrl40yMJ18mG3vkcqh3q4Mw5FxNR0F7GYraBknU0hxteDqlO3B57gCaLVUK0Pstyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fv5/JdvS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fg6F99bA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fv5/JdvS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fg6F99bA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M6fkTw200282
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fiIP4alQ4KMMwt0IpfKoWbfpOV7tZLr+gIT8O6Cw300=; b=Fv5/JdvSn7Ch91Fl
	Xnax0wd3gP3fZ3tefHvxH38LkQJ2rYWzBB9Dkg6vFkGZmm4Ccz9eupru8fGkS7zE
	tYjRiome0SEMtjM2EHySdcwFQ0MulEjltFyyO1GXLSTit2+JyYHVzIjWvXLSTprn
	d23hm32wrMJGiugJ4Vvx2+DMqTp7FXudtoaNUs/26zeitnwejk/2Nn9nYWliGNe9
	r7wPMTZfPLYCRBeaO27m1d9c6SBivNKhSI26XdTWpFQ2cn8QRTEmQL6NR+qiebSV
	kG8RWAozyne/zHLaKsRAL9bUDoDL1EqUSdZzAKlw6L8oqYpgaDQVGH7QuUZaMA3X
	izOrlg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjrtt0d8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:19:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84857446424so22754290b3a.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784708384; x=1785313184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fiIP4alQ4KMMwt0IpfKoWbfpOV7tZLr+gIT8O6Cw300=;
        b=Fg6F99bAGcJK846KPw3q/YBTkIzgkAdie9AODvkVuv2YpAOnMjp0Hk6H/OtIJCpdmg
         XSb0LNJhRW0rErCDIRjQXWaY2kX2NyKkzwh4gIs28Rkgtz0DUa5yCp0bfvaKlMg19Fj1
         f4KdAxpvwleVGfIxrQNJF2opywm9PzD72q+uFhrHgke2yYXANRCfzEmlaRK8yiWqGLL9
         jsCD8kozd6xs576kWOJhz5awD2EFuuOYM/2S2E+u1oF7uB36ZUjk7e7QJSs8qMTQptPW
         svPj9IAJGTix94KDVwigKfbZ8WW0fypX1jOHtDOVpVBCpil14ehRYbN9ooJhYk1DZntu
         ccCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784708384; x=1785313184;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fiIP4alQ4KMMwt0IpfKoWbfpOV7tZLr+gIT8O6Cw300=;
        b=AkzrXsRA3j9AYpVwzBUzvFSOxT6TKqw6DdKTC9I4x5GHDJhEqWs49pUCjsEj042rS5
         Gtg3JIpROOdtzfYq/TQDMTOTuzxty6v8Q1WJHfGsEiIRijJvhT/rKtUhIN4vHGKDM6mB
         4m81Qtrk912cs+uzjcWKPyeyjj77lU8gk4q6ayFW0SgloGX7ax7ye5szvmHrMeNHFdFP
         GAY3JXWaZjd0l8X9SXcUpHQ90D28wAXnhaLg6PSeHzWnxNyqTmE/CbtxFmuoUB0gzwyE
         quITyKFjonN1Vqi5GHew5EorvRISNR5ZVwMfbjUHVqPgMM3V6wp4snJgTvIyaJtXHC8C
         OfzQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUHPQ+1d5AlyKGCpR5Rt4DVSc1M+NVE4WFEOEje6jm71RVH4QAQJ5PSZatKB8YRN6jkZpjv1Hq9bSj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8CoD+TF7PEUN9wYjuwHoC78RWcoI1w04QGtr5VndcLNH7cWxw
	/i2z04GqkpTeHCRfmQpIBZdQDBtgL7b3BsNLY8JhSPw1JVlOSICedLiGtoKwninAtBvjjR8uSY1
	yXoiYNfBEXEvsAY8UCiz6eMqMGfNHNnned+T60ia3PpjpZN0fFs/+aLUCcF9yFtMG
X-Gm-Gg: AR+sD10LIl3Gxop2C2EU2VCdkm+dZpzzXdKFhSM8qqAsrcQRiYjHLgv9BsRf505CyAM
	Cba9wEcoa2HBXIOnTQoNkdgpx17WYp0F7kS68es9cwVuWZGg9gGuK3o1lYMxhJOZDtPbVdNk1xa
	ZLogvn/je63TnWJCsn2gLXZAKwdCAN9C+3y1B/HzBuft5NVlaKVXOYjhSCOaOcwwnJBsR833uhn
	pSdilJNPdk1m+7TuwimaOMpAk3iIelodaEzc7EP6c6cxLEoBLxWtLo96BKEU6Ja7Txici/WplkN
	YS4cHpmb8ldndG56aLkCoa0JzpRVVeAcij/lQn9Hl7XLpyuydiu2vaRJXR/fWW9czzvs9GSs5sC
	vAPyBDg1ytI0bLie0ifFLmHF++iY=
X-Received: by 2002:a05:6a00:3a07:b0:848:2f7a:2e5c with SMTP id d2e1a72fcca58-84c295065d5mr21919067b3a.75.1784708383952;
        Wed, 22 Jul 2026 01:19:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a07:b0:848:2f7a:2e5c with SMTP id d2e1a72fcca58-84c295065d5mr21919023b3a.75.1784708383342;
        Wed, 22 Jul 2026 01:19:43 -0700 (PDT)
Received: from [10.233.16.34] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0d872bsm787911a12.7.2026.07.22.01.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 01:19:42 -0700 (PDT)
Message-ID: <f20f7b30-6717-4c96-b568-f916bb429a7a@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 16:19:36 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 SM8750 CSI2 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <quic_vtumati@quicinc.com>
References: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
 <20260721-add-support-for-camss-on-sm8750-v6-1-a5f841061d18@oss.qualcomm.com>
 <20260722-literate-nondescript-seagull-cbdfaa@quoll>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20260722-literate-nondescript-seagull-cbdfaa@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UE2HtELJsdvEH7IueoJB0shWiYnYTAVC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3NyBTYWx0ZWRfX2w9zR5TTje5T
 CItiOtTqAAEltdMbpNWZ6hkPUGyh4JJnewy6mfhJR3WAqnQRx7GdGdjdKoCRsT3wzTcuX9W/qOf
 lN33sbb+T97ioQnOrwmQkhk5Wx/lZviKhmH5ThOd/CheYeosd36b5u9p7l1FGYKDpUZwvKVTfvg
 LzPWCkvB+OgoILNLAfYH1eMomdqE62FQGX9MP0Y1dt6uhzUPwAzZzXIIl+vOd3aD9sD7TIzAZRZ
 8lLx2/ia3+cW1L6TvOcTyc7ZuWWKUe2IhgbNhOOcOMpvGPGmqUNSMUAqsMMM1HqLhy+TUB9SmfZ
 rf3JfQByQiUN/6uT88qyofGWxuf1amQ+ACalcLMEpMVcwqIWO4UUgZayPLFY3o+minCBAuqtzaH
 ubhEUZi3HOg3pasI7AAr/+GOXtMiISLE1FWeysQCx7kGEQH3KqnueRUpBjBIbuK58KqybKPn8A0
 2f8cqHgbU4CzW3vCZvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3NyBTYWx0ZWRfX5e5s/wm4+xkZ
 YEe4Rf1/UUhGnUdFmA746eCHPDHFQQHj5wKuDR67iATvsZ7O1lJSkg+VEeQcg36x75cVpZ2cyAz
 vpLVpxpYy/IcIFrOsccRiG+RirgBM8M=
X-Proofpoint-GUID: UE2HtELJsdvEH7IueoJB0shWiYnYTAVC
X-Authority-Analysis: v=2.4 cv=V8lNF+ni c=1 sm=1 tr=0 ts=6a607d20 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=vpPPM2f6CJMr57xAQTgA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220077

On 7/22/2026 2:57 PM, Krzysztof Kozlowski wrote:
> On Tue, Jul 21, 2026 at 05:46:00AM -0700, Hangxiang Ma wrote:
>> The SM8750 camera subsystem exposes six CSI2 D-PHY blocks that follow the
>> same programming model as Kaanapali. Describe the SM8750 CSI2 PHY using a
> 
> No, SM8750 does not have the same programming model as Kaanapali. When
> SM8750 was created, there was no Kaanapali, so how it could have the
> same interface?
Will optimize the description for that. This description is not accurate 
and cause ambiguity.
>> "qcom,sm8750-csi2-phy" compatible with the "qcom,kaanapali-csi2-phy"
>> fallback, so the CAMSS binding can instantiate the CSIPHY nodes as
>> separate phy devices.
> 
> Redundant sentence.
ACK>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml        | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> index 7943049834f9..95375efb2597 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> 
> I just commented on very similar patch. This is confusing, there is no
> such file and I do not get why you keep adding some long chain of
> patches touching the same lines. Squash patches.
> 
> This is untestable.
> 
>> @@ -16,9 +16,13 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - qcom,kaanapali-csi2-phy
>> -      - qcom,x1e80100-csi2-phy
>> +    oneOf:
>> +      - enum:
>> +          - qcom,kaanapali-csi2-phy
>> +          - qcom,x1e80100-csi2-phy
>> +      - items:
>> +          - const: qcom,sm8750-csi2-phy
>> +          - const: qcom,kaanapali-csi2-phy
> 
> SM8750 came one year before Kaanapali, so how such compatibility is possible?
> 
> Best regards,
> Krzysztof
> 

I acknowledge the truth that SM8750 is older than Kaanapali. I handle 
the compatible like this because the Kaanapali series was developed and 
posted earlier than SM8750.

I agree with you that handling compatible string in this way may raise 
unnecessary ambiguity of the relationship between these two series. I 
think it's better to treat them as separate ones and add additional 
compatible string standalone.

Could you please confirm whether the following format is acceptable or not?

properties:
   compatible:
    enum:
      - qcom,kaanapali-csi2-phy
      - qcom,sm8750-csi2-phy
      - qcom,x1e80100-csi2-phy

Best regards,
Hangxiang
