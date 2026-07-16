Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73B533A032
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 18:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226836; cv=none; b=Z1zZTwJQYpjKGEc+sDKWKKlrIXyI8gHZ/GWunmWvPhkEt5R0AXkwcu2dapwz3AW58avVOEAg0V7RPL7nUGQxD0N1NhVlqhDKAjVIP2ZyXnp/mR6Hcy8TIicfa2jULvfNjsT8V6hFMG79z5rSeW8xi5gM5fTCNKa6g9JW5yccIjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226836; c=relaxed/simple;
	bh=dj60ZZJxV3iY3P5TWn+xSeE+wPY4h+ZYSZ2q9TaXG0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jSRnKoNg7FcccoDTRxkkOQE6iZuZH3+LDdO/BiKUj3+2FZ6k6ecnj0zu5VkyvOW6R0c+pOUDZ09RsT21EdwEBiu3MsZSZVRg6NpGPkU2hwFge53PhdS064aIc3jv2hCbDuf2jXZKnSNZ4Uf2pb9qeGhjPxwizEYq60hUEuwdYvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XPlu6I4U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i1HxJGFc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPlu6I4U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i1HxJGFc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GHa2Ax3281881
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 18:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zU8L98CG4jOXv8caWEcZP/r5gL/dFX0R4r+uH5SPbGM=; b=XPlu6I4UH921Q9Fp
	qpnXiVUOueZAvHLPBQmfTk6h6H36ZxE+5bYRjUIgz1oIRD57kL0EnhjPAz1Im8E5
	8H4+MK3DYX5JtnDFQzTTF5Kr0wLMXozi/YOmvvj17C3D8eYM+eaCnFUJuixtT6UM
	ZcwW4cgRFDunhbNrroLvGWlUPGsT3iaY/+VdaRhufJzQjpdLAVy9vBLr/bDXe7AV
	jG5rSeIw6SWW00J2RAnLm7Fc57AgqdXgkyNaZfM7SsvWXFUFSbv0q9uKh7Fa8db+
	8vhbOLLhEIpvQH7TZrbCE27P5W7vPcPHrREQneLeNC7FKDSpoA6rMEdBF0MKqJG3
	svlQXA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8g7a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 18:33:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c9e97b626so13627901cf.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784226830; x=1784831630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zU8L98CG4jOXv8caWEcZP/r5gL/dFX0R4r+uH5SPbGM=;
        b=i1HxJGFc/bR+7aUu1aG9+kVewPYngQBUTFyqju86+/IE7FJuS8jhjPwH79L0Eid+rz
         6NjpQvorlfcQhLe0o/dMBx9F3d88Y/uYR1bu7REtapwEwpADDfYaESPwoIm2AXg7t/Te
         vPZQkqhCrAApyVcyUgXWj7zTsi4lgZxtbcGMFJJKrSUFM9sEzKD2n8M8PIhn8r7VXW3D
         K+JgsTd/AmJleo1w5C2C1Z4dDizopU5Z/HskpTkh5/Oq7BC5OCsYHVElRC7P2u2/uFLr
         6sOvxT79Rp+CSoDZ0DnivKJpLUoST0I0GhbsTyXQjyOPNoLoQPk60thwBazv4bEGH4fM
         KSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784226830; x=1784831630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zU8L98CG4jOXv8caWEcZP/r5gL/dFX0R4r+uH5SPbGM=;
        b=R4QfrJ3hPGmv1MZ1CY1hzqvAHyQtO1tiIoO7DPWBe4D8ntwva+StViyPZF5lo9pxCR
         9j3uj7WuYB00SchLzK0kqug94H5t3ak4vbLtB2joX+YJ7cOwLy3ezm7ZCsj4KZlhQOzW
         CgOV5ZaMz0VjJLb6o/LE10km3vUeBSd0UHaXcLSpRnPqEUZ0xc9eAQDquaYLJ+cropXP
         BrZoZW9g/FNaMBTHGlKaJ/4B2sXNi+PuivriZL6rUnYwCx1sU8J/NaL0Lzjmx+XtMBnt
         pxtj/rrCQ2iVx9J/tUkvI5bA+zmKafhcvsa7MTlokwcILTwF7QYpi2eQlbRSX0/45kAh
         eugw==
X-Forwarded-Encrypted: i=1; AHgh+RoHOHC/zbswuZkRRgcqNH/3Hsn0h33n/XmFBIyxNm487n8Pm3dNt1o3R7HEf4xoEvPt8FUTNRjMyxgA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5+aELHa0rUyWQMuY0xCx2Wso7TOKnfdo7q/TpXcclcxno8Gnr
	P0hlnNQgkHU96mQKitOQ9t9er+z7ub7CaZsNvZMpc9I+S7QGOhFYeEEStvmjEn9Pt3kyUQQRLpa
	5z2vwq9Oo38goB2x4qBkOrcueVj+PSAaII2BIjHSqla5kw8rSJJqSFFhC8skqkknW
X-Gm-Gg: AfdE7ck0FWcETvzJ3w5BGelTuqWojSrcPOCuQKuBum3V/b0K7VhIvdL3R+3GyExPqfq
	IzLpnr/iSb+5KzorrTEYoRyn1a5X9lXnMaP+vUBMMWBOBPJiThZ9s32k3GDatyK2a84Xo8UDE4T
	xigb7/f1346Jk1VMPMsJFXeKm6An9mDAFz3GkR4PzGsrjZta/xc6uX2vs0NaGutHn6SGKHDp7AD
	qJ1R3c27x8kuomib7NLJrV9tdMVDAQZcQQeibhk2RjvBYDbCGvavnOc0o/Vhfe/RTJ/q658OqUj
	GOxcGGr3fca7MxPB0iH/k40nM56Yus3uurFaeWyD5lwoOdJEObM+dkhtBeCIBXS4UN9tB2zosV/
	zly3hhkfmt70CFMaLCIhnlr6E
X-Received: by 2002:a05:622a:43:b0:51c:f3e:781e with SMTP id d75a77b69052e-51cbf2159eamr208524321cf.6.1784226829945;
        Thu, 16 Jul 2026 11:33:49 -0700 (PDT)
X-Received: by 2002:a05:622a:43:b0:51c:f3e:781e with SMTP id d75a77b69052e-51cbf2159eamr208523871cf.6.1784226829396;
        Thu, 16 Jul 2026 11:33:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16874a2453sm255164466b.56.2026.07.16.11.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 11:33:48 -0700 (PDT)
Message-ID: <1153ebbd-659f-4ba9-9317-66ece33423e9@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 20:33:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/11] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Anurag Pateriya <apateriy@qti.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
 <20260702-shikra-dt-m1-v5-11-f911ac92720c@oss.qualcomm.com>
 <9c1aab59-14b2-4811-b778-8e96645bd65b@oss.qualcomm.com>
 <97b205e8-5ab7-4205-b1dc-cbcb0497987d@oss.qualcomm.com>
 <986da1da-db2e-4d4a-b9d0-70482adaf4bd@oss.qualcomm.com>
 <4f641f13-a278-4465-8033-670c7279a7e3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4f641f13-a278-4465-8033-670c7279a7e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3tHY_FS8zPfqLi4GHYUzQrMPhyXIJ-zD
X-Proofpoint-ORIG-GUID: 3tHY_FS8zPfqLi4GHYUzQrMPhyXIJ-zD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE5MCBTYWx0ZWRfX6ntQJczP12QH
 AbbQs3KJBaWq8nb5g7y8j4Hos0hATz/SzafvXEMP8rvAz147M8UQDQk4XoNR1r5FrNUWestjYA5
 2+PIwldQjJ8AmInATVTJXCey45oCOyo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE5MCBTYWx0ZWRfX5nSM7ebjQr6Q
 byY04t2ezancxYJvQ4x9gF7GrGoXwl5f3SXGN6DGQppFGLk35uLoXcDALRVyDfspfBdYmsgCjEs
 doLNzY2N/rG+8A951r5UmsitOKuxIastpbK8VEeeW9Pi1vmDEfOSqUdtxjEB7cpFBqDvUzvRVLP
 NX8jYniDWjp7Gu2nKzOxOtzvCB1wPbfrVZkAUrrvFKnX65K4kQXbTrQGwwRmsIC9VrhSwEIbyq1
 j7i0DvrVDfZEwPQ0xvU1KjlLVAaA+rekOlta2kNI1+3ex1KkcqK831faOSLJDbj1Xpgn/r49jlA
 aOe1ke7/J9ScoB3ohoaramzPUJFPrnBldfAKbc8u32CI27WJZGcn0xx4PGjkEASRelGkO4Zvorl
 Pxc+/PHz57lNC7oG1ly4bDonGK0LcvqgDlSTsLK3O6vZUip0Dp1mGtuG6TXhIZ5Gaub9rFUfUVx
 Y1zypdYaHW3+W/wqHqQ==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a59240e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=E75d-Z-T5IGyIi2ltCUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160190

On 7/15/26 3:41 PM, Komal Bajaj wrote:
> 
> 
> 
> On 7/15/2026 3:57 PM, Konrad Dybcio wrote:
>> On 7/7/26 6:36 PM, Komal Bajaj wrote:
>>> On 7/2/2026 4:25 PM, Konrad Dybcio wrote:
>>>> On 7/2/26 11:50 AM, Komal Bajaj wrote:
>>>>> Add gpio-reserved-ranges property to the tlmm node for all three
>>>>> Shikra EVK variants (CQM, CQS, IQS) to mark GPIOs used by the
>>>>> SoC internally and not available for general use.
>>>> These are generally added to prevent non-secure access upon TLMM
>>>> probe, i.e. the board won't boot if some of them are not protected.
>>>>
>>>> I assume the proposed set contains both ones that are _absolutely
>>>> forbidden_ for Linux to touch, but also ones that are dedicated to
>>>> some specific purpose that Linux _shouldn't_ touch.
>>> Yes, some GPIOs are reserved for secure-world use and are therefore not accessible from the non-secure world.
>>> I will update the commit message accordingly.
>> I'm not sure how to read your response. In other words - is this
>> patch boot-critical?
> 
> Yes, with Access Policy enabled, it becomes boot-critical.

Well then, I'm no less than surprised since we have DTs for 3 boards
in -next right now that I'm learning can't possibly boot..

I understand you might have disabled that at some point during the
development, but it's clearly not the configuration that's supported
by any means. Please make sure to take that into account next time.

For this issue, since the pins seem common, perhaps moving them to
the SoM DTSI makes more sense. And this most definitely needs 'fixes'
tags.

Konrad
