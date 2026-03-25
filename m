Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D23C220F3E
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 15:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774451471; cv=none; b=N8hEJr6wgiMxKCjK8PwcMS4hkAhSHNJljHrGL+CapyixRk/7s1vayWONfc0NOWHtqEyVmTAkfX100NZ4c61ulJNAqlxFZwk2SzKQ2Qw745i3q13uOcVqlEcime1BZUPHUkm0IUKF3YuJ9J8mUQzWMYQGSLooBF1x0+29/xOyrng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774451471; c=relaxed/simple;
	bh=5YXZAMuhAv9WIGptBrNb0UA7Uho52stASuF9QrHVfi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iNHWrMUBCOwEkOnj+rajQpLLcxL3dexvcuBO/tvwRwrupd1o9nHvlR/avowMCV/V2VKl8+IlYRg504gFz8271bVZ2d6fEOjPsobNW9CLv6PYwMOEvMfEZIWmeQnzbyro1mXOeNfPr/U4+lIq1BZVL0WuMjVozWiZZkv7lGs6EL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZAEc28/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XeAw0Qe/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZAEc28/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XeAw0Qe/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGHu83091197
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 15:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/MED86hyNcrAbl5YZCxGVVNAkPNVeuRHWU9jWYdAHY=; b=MZAEc28/Fylae5kh
	ZHAzIG6me6yMJVAHJUesiD5+qJyLvYqOCqyWf58Gj4oG4Tqh5gsC951JO8BWY8NU
	mBfbiaFt7pGuJ3oiMxGPpWP6cKOaMF/FrueH+AEULVu96axtmAj/r07QSgdxHT7l
	hWlcNS/7jQLUpu7XhVManmrODFllkSo16XIRtbT4UBlC4OGVA2YYYBZW/MEkcvN+
	/bIJ4jUZqqKlryKg69TXUjVMmTn2sxPGq4wuZYyWS2tEKZXnYvPrYae2TSUFIX+2
	TD6NcoJWePs8B+rf/HRyFDSGE/hjfWvbxh3og7vvayWacCVJudhAMMSEI0ENapbm
	yVDV9Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dmps3y5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 15:11:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7422397574so45855a12.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 08:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774451469; x=1775056269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p/MED86hyNcrAbl5YZCxGVVNAkPNVeuRHWU9jWYdAHY=;
        b=XeAw0Qe/fa10T3NwzETQN8AVO2qbCLGCbk3qSdvKUavkWS3vM8I3OQ47Ra0RHFK4xi
         nUguE36/dmck/sWiKSvZG8mMZTBdvI1fwt+hM1r+pZ+XSftvfTTZBpgFPcflzp0SdjfB
         Qh6XVn7J0dvMOR9Vb6vL8Ws0ux7nbSmKXEPsS19yV4R12Hg7jV/gl2cDoBw3VyTLF66X
         L0b8mWE19Cr9Z0lsV71UnRzSDwL8s3e13rqbHtGe1pspctfvjljdwMF4mZI2zMlVPQR4
         n7LjgxZ1MfGej0THYHHZsnt40ImM3GPiUTw/9Y6ABcnyd38hnqtQeXYQ4GcGf9uaHxtJ
         /58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774451469; x=1775056269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/MED86hyNcrAbl5YZCxGVVNAkPNVeuRHWU9jWYdAHY=;
        b=VoZOD7d+7zg9Xz/JL57rrwBFzAfHlkEGzK+lWWjgMEWrx34c6hUUUR5PbPMpJ7lsb4
         bU/v2NT/Mm1by09jNUXP2lv6/tMSkFJnqp1m1xyKOZAOIejRTJdVvDfVKrZGrh+gNaac
         kGQ7Jz7I8ydYYXYMwww9jMl6FccpqbODRC9GqaiCDjKchUyFEnz4CpVY1IH+DhJYuEKh
         MQOzebCdOkenEE6L9Zog5LfCi0CS7jjJ8yd1khg0EMObGXafZBCyImMWGZZc2IyyqMwT
         fbOkUQtLkhRe0mRbAJFjvAYXZZyV6aCpYysKmJb1PJfFOiQwgFSlEWqFCFbsWjdfGkaU
         cSGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb/Advy86wldp0FhmFXy0SPF1LhgsZEl27xYrh5A+V6hoRt6/fhvZMqvunTpG8VF81491ToNqT8/qy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2gcCXfjbNYDovOXvUXdIVEH03GyRcd6UnZsofel5WwrhaquG5
	0L2WlDYou27GNyZn459f4LOOMqnnHOomcKh6jeZxxHdEsn9jmFk87tKuopKzEX2bSPs6+EQQTUD
	lwbxH2asb7Vi4xlVc9rGSc4FGhkJ09MHuyq2Y1JreYDEP0Xw3PMo3kV8J89Jt+H/S
X-Gm-Gg: ATEYQzy1aIOsM/ULoMWbEnCM75klpyP9C6NWlHQ3B7BowQhMnnUbBJUxSiMdODJWj7T
	20notQlZKSua/OSP/OvUmiZoch5Unb+5ZaqCM202dYUbUF6E6pU1g8eSt4sOAUWLt28DUfVpG0i
	s5Z4jfbjLtlUpMVsIorwd3Zsii6JjY4SFtEIEu8fOekiUgbCIyBFrNY8tK5f4NgaJZwkeZVZ66y
	D/2kQJLTGEoeKke/87tqhkEQl6ib1l2c3emGG6gFMMOKJq6msPSUro7efikze2lIbX5/UlUD7mw
	4tjgRsddB5CEOeVO5T8E+Av88O6Be4xu0iSeYvCi5z1NkPqWtxZE5rI7uNQQDy61MylTFSICErf
	EQIJKDL0VQWaWr4oj35XKIl4XBjBVlb2MbJhx5r3SEZcDqV2V1HizrQ==
X-Received: by 2002:a05:6a20:958f:b0:39c:1f90:284e with SMTP id adf61e73a8af0-39c4ad3a74bmr4220705637.53.1774451469067;
        Wed, 25 Mar 2026 08:11:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:958f:b0:39c:1f90:284e with SMTP id adf61e73a8af0-39c4ad3a74bmr4220627637.53.1774451468518;
        Wed, 25 Mar 2026 08:11:08 -0700 (PDT)
Received: from [10.204.101.77] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c766e9758easm1193710a12.13.2026.03.25.08.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 08:11:08 -0700 (PDT)
Message-ID: <39d765f7-ae0f-4ae3-84ce-55b419ba3969@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 20:40:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-1-9c0d1a67af4b@oss.qualcomm.com>
 <b4115d76-d3e0-4f0f-8ec5-697e116c6584@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <b4115d76-d3e0-4f0f-8ec5-697e116c6584@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEwOSBTYWx0ZWRfX/d7+lzzf7DCw
 Zcw0jFcNoMZ7kWJXHLUA5YR9B6aDvzlqarr/DrYp9L7H6hzya4CGlPbnE9cnIPuL/kI+pNYGzez
 C4VX7hOVQhdD8yWs0195jW7kpxuAhnzaTcKY6qS6C4aPdRktKr1iuQhlNPBw7ShoeMlivfOhPCK
 6eRBJpI9b34ECR5Vw5WfyEqeahkip/8FkVtwQzdASZbsZwZ8TK222pDF7IutlBczsbUS4vxLJjd
 cEng1LYERsh08F02Wf+np72wvoIN5nwLf9lMXmC6/TDiBGzmqSPmpyYwwvJ2e9r4HkX8x0O4aTx
 TnNQP/jMM/k+ALWhQKXc0pqwns+MphcNzVrSE0kEa00mcjUOCmoGGoRGEtvSv4S8+a0rc3kJABe
 Ozc5Znwg4XEZzwAaD0bewjc3NtKZPomtuPqlp+h88QvV6xUGSBLeugT2Dd3KlmdMecAQkhrMteT
 Yyitehyl2X4dT0TmfgA==
X-Proofpoint-GUID: WLS7x3PoaIf7LjlNhCMcvmJ5z_BMpiP6
X-Proofpoint-ORIG-GUID: WLS7x3PoaIf7LjlNhCMcvmJ5z_BMpiP6
X-Authority-Analysis: v=2.4 cv=O7w0fR9W c=1 sm=1 tr=0 ts=69c3fb0d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=DtSqZenC8O3uiLbdm2EA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250109



On 3/13/2026 9:13 PM, Krzysztof Kozlowski wrote:
> On 13/03/2026 14:19, Vikash Garodia wrote:
>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>> compared to previous generation, iris3x, it has,
>> - separate power domains for stream and pixel processing hardware blocks
>>    (bse and vpp).
>> - additional power domain for apv codec.
>> - power domains for individual pipes (VPPx).
>> - different clocks and reset lines.
>>
>> This patch depends on
>> https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
>>
>> Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> If you actually implement my feedback, then you don't need to keep that
> tag. The tag was given because you were pushing your solution regardless
> of received review.
> 

Noted.

Regards,
Vikash
