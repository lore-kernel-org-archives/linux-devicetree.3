Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7504AEED8
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 16:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785516956; cv=none; b=P9sVkKOgWTS4YDf8ku1lL5dWN+u0i2xIDCQV0PvuiwsBHsZRSPbdzywMeS1iI4pRWaF70iWS2PoGHLKXFYWYyrQ11+Y8iqzWKpFfD02dJ4bpPMdgTkfX7tQlOCwdmHVLRILTS07AMI3piCmzvDDCRh3C1KeQ1xVOXrKmnx9tiOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785516956; c=relaxed/simple;
	bh=vNQcuHZwnfBcaqBRKp24fl+ic099dWBRsaw7Ei0waQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uINtsa8xT+P+9e3HByexfD/lLiQkuXbNJombkPaMYnXrw53pyu0m0qD2Uy+PFME6/fc8Z1lx3iPbrcL+hG7NF8xXdSr9LPVRhTjz/UQwlbBkQaU1YX227EEiqKBORxtD+Wimuf2DLYEQWMJPuvqzoo8G1vg37wWwkL0aF3bAqGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YFdMV4tT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrAYa2nR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YFdMV4tT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrAYa2nR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFONGd215295
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 16:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8/wy2Wv/9rNwpuSJ2n6D4naMTb2qPF9MQec2tA1cdJA=; b=YFdMV4tTcXF5RLtW
	wD79XefII6C0bWPZAykN4hpNtvSajCMxrMvzT9OpnB4ruQq/crUuTE4dxpwLNen6
	FdIjlkNK1Ma8yjAiQ4D/o0PW8JX8b86+Pio1EWa9sD8GNEGjjOjBtuSNxDJlpxU7
	KEotBtT3ESzEYvPlwRm5c3Ity0MaqOrQFLS6zh0ZOu2wErn0snB+Dik2lGAT4ZWc
	HzTNojJbi/kquXZ6tiWcLs8J2FaxYFDrL/7MgGoV61rmpFJYMLHavdpLrGmtXcZU
	vg8I+X3K4JWBXaPOPhegdCq6F1Xl+uEtEAHoPeZGkniLuPBRYn/QC67vZapQmnx1
	TmaZJw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frujus9dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 16:55:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c9e97b626so1854951cf.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 09:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785516954; x=1786121754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/wy2Wv/9rNwpuSJ2n6D4naMTb2qPF9MQec2tA1cdJA=;
        b=XrAYa2nRZRBX4Iuzc6ZqvJyq/Hne1V0FKcfncJzFIfcu2syAl7Sixxda/1VMF31WE/
         h+B5GvzkPRjXhn6Xpl9Qhb50oHe49UnQJ8+s4DS7aixdusm2m92rEtAKFXoHWQCHir7z
         /qDs3X08/eSa3YjFohtKFuVd8exgvGtprsTPrwWbVBGp0rkfUS+bdvi1H4s8HJhY/aI7
         WxvbZ1JNjbNzzKz3uMNKe2eeUrepPJzHctdHR5RW+04r6H7E9UgQn1DCPTo5dj2uZAFA
         8r5gprq2ObexvOcJs7S8KhcCnX09XL1lJVov+S0oc4Bd4eg51cQ273qBvxUIx/hJg6p9
         hR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785516954; x=1786121754;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/wy2Wv/9rNwpuSJ2n6D4naMTb2qPF9MQec2tA1cdJA=;
        b=H8ThfPjI2zD19uIECnV4Z2uUjtJpFv3kaup4bQ2mpNJuRS7tXrOdgng8YnByOf+jKn
         qEa51voezVk9cOHL7M2Z1M2+Wb56af3a6HUl4gFi1fUfW/q2U5BNNirrCeQamKY35TmZ
         qDbC5gIKfU4WagJIJ8w/Ehv1v3k9GyWU0Ke3H3iDah+GBQPMB+1ZW/cdE4LFdqHfxbez
         CZJihWCyDlMyWvGihU1x95oiMYccXerwcGauaH/vhsELGlh1QX0IKFA4aSqiIW7c8fV1
         zvRp3kNLfFMY6Tnpqcp0M4JCKwD0FH7etcLCr3WJjVKGa902IFO8heXJYdlLNJzCvN7N
         9fiA==
X-Forwarded-Encrypted: i=1; AHgh+RqCznjmoljkOUZ+5un+Ow/+HChPqE1/Uy5kKiQfLUo9yCfTIHivRcoa92umwO9bH9Q6+/FKsPEQY2R5@vger.kernel.org
X-Gm-Message-State: AOJu0YwLIUeIjInBdc6KGcgOf+3bOpyZI92Fou+Rkzg5KFG1fgbyJkwQ
	WTX4DuZeNk3V6LB5wrN+80dbc0VRrB1cKg5BR4i8aHWjINsXrXbkRUCNKS4wkP1K3TygzowJiQH
	llgBdeatbixqzk7QSfDM+xmRP+IasyNXp5RhGj0k/udkrAKVNVnblwhr2O5gykAH0
X-Gm-Gg: AR+sD119m4ghicmQ0QI88UAPs7nhT5BI4MPJGLJEdxuQzCCE6sO3gZLCoVNG4tEvOu9
	vlwUFUFUY9e7fBFsn8Riv/bE3HibfxH+OKtWp3Op3F+eWvAMZOk7kDn2n+irAyps4e81XDO72D/
	Rd9WAp/JG3foXksSWglk1aVj54SLq5GU9n/5eiK68mWg2QfDJNofgDNCZxfDeI5FOVs+Jj9T+Q0
	qOGnhZKuQEy8xGtAYaFYvawjRM/JRY47ISxfIL3fsHwg+XfauJHj6hAPeUQEr/7KRhiPSYu5Rnh
	ICAkxn8XI0RYzFEpqBi3mOk5I5px6p7D8uINhOv2OXzSJOf6NSi2KwrQ7CO/7CjhEoHT+hb6E+y
	W2v5ljTelZJhZZfIvyaQiqLJp
X-Received: by 2002:a05:622a:791a:20b0:51c:2101:f0 with SMTP id d75a77b69052e-52b566f6530mr10086971cf.2.1785516953752;
        Fri, 31 Jul 2026 09:55:53 -0700 (PDT)
X-Received: by 2002:a05:622a:791a:20b0:51c:2101:f0 with SMTP id d75a77b69052e-52b566f6530mr10086751cf.2.1785516953414;
        Fri, 31 Jul 2026 09:55:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c655626sm2944226a12.22.2026.07.31.09.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 09:55:52 -0700 (PDT)
Message-ID: <4f02329f-1c0e-4684-96bf-e71eb5b73cc4@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 18:55:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Add
 actuator for main rear camera
To: David Heidelberg <david@ixit.cz>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Martinz <amartinz@shiftphones.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260730-dw9714v-v2-0-d5da19e6c60b@ixit.cz>
 <20260730-dw9714v-v2-2-d5da19e6c60b@ixit.cz>
 <3ac4eb1b-348b-444a-bba0-e4c64d5b57bb@oss.qualcomm.com>
 <b9afe038-dfa3-4927-adf3-5b99885fb911@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b9afe038-dfa3-4927-adf3-5b99885fb911@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U6Giy+ru c=1 sm=1 tr=0 ts=6a6cd39a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=6WajdqW1cDUHmqu6UyEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 5s-OqnC6FcbwyZsLmS5e2e4uqRTkEiFz
X-Proofpoint-GUID: 5s-OqnC6FcbwyZsLmS5e2e4uqRTkEiFz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyOSBTYWx0ZWRfX263CRBPqjw0S
 JD12Sw4G/14j2jDWBqjihrfAkOGwHVz+i1JDB5C+LEWABTs0nsuxboKtfJGyv2Wyw5CpzHs6INk
 uAlw+KF4um5vfE+3+eXGWu59Ff9Zmof/amFGc/wvLk2eb19+BkRY3SCHwRkv4zJbC0jT2ou8zSP
 fAhLzL/DgH4afOZ/u9KWLKsWxESV5u03VlWu5yDdLWbJuBGoPRUVPecIc5tdCNr32sKrx3vSKFh
 kzlgY1buD2NNUWlanDYBkgN2mwfyGrtPvj0nJncT9WSJgX1y6SqDIEdRq606b0N4BoT/FyvP8Yh
 p5cjEILoAZBXLNd2HX41AMdB9yskCYeqU8rRQ8bv/h4HINcD7qFJcsuiHLyaRF2QAAPJK8JlMQ6
 U66zSqM1fbW2p8koQ9YW+3eLs9V3zoQDZJCi5f+l8Z6YJ/DRBRVoBUxq/d+c8vUQAhhrgMB+JgS
 9axz61xprGk3/f0Xifg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyOSBTYWx0ZWRfX2MyzaF1zvhBz
 3kIm3g4OwA+/irg0ufEdI8KqYuxgAjCJpmW19O23B39xrG1NNKmrLqrY1KhFRY0AYn+gpBuq+J7
 792y2LtOfg4b3H21tha5nkZPC2FZzsQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310129

On 7/31/26 6:46 PM, David Heidelberg wrote:
> 
> On 31/07/2026 17:41, Konrad Dybcio wrote:
>> On 7/30/26 12:20 AM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>

[...]

>>> +        /*
>>> +         * TODO: This node represent bus supply to the cam i2c module.
>>> +         * Others DT do in similar fashion, but should be addressed
>>> +         * by the bus-supply in the future
>>> +         */
>>
>> I can't quite parse the second sentence..
> 
> I'll rephrase, I noticed that other device-trees where there is also i2c level-shifter also introduce always-on regulator. I let clanker check impact on power consumption, it's likely irrelevant, but in the future would be nice to have proper bus-supply property in use instead of always-on.

Aaah level shifters.. got it

Konrad
