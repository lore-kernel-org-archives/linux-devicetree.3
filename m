Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E0A3CA4BC
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025676; cv=none; b=FaovabpJtuz+JP1yS26xZ9z+di2dX94AdKKBNpmvT8dEiNzzSmFK2PZfXN2hIqUGmM9u+n+GrnxaH/4f6Z8U9M0Zg29MW7rfXyleeMs6LXRYJy/hjtcy8vuh3/CDWvS5eZ7lNihbPhs2Rfiozw+C4zMCHbK9EIz76kQvsU5fvxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025676; c=relaxed/simple;
	bh=HEpcZ+N5k/PBTaFR1jr8ti0Jo5CNMvvcXr2gyt00KqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sYNC1f9Jf4wYYx1NzpJYDnn+ejRPs2Aw+vZ7Hd4IMqB9p79YvsNv/4GKHGsSiLrMnRCgq2KkyBF6yCr9oUGQObMhfArY/VaUaCTGe60+Fo9JIhrlY+84mrgBE627qLSiwSBruWar6NPCJ7N4QMal4I2Waj3u6Y85tID1colVK58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TrA5ADg0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csBBOZIW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TrA5ADg0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="csBBOZIW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5Gw6E319473
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2sagXctCRdeY730etUoIGYaRKPWzNI1J5euw6/9W4A=; b=TrA5ADg0NJhtoRqE
	ZlEPBPOMTpb+ue8Y66UJYYQBotv6QHiYsoFk9z07cELpmkBGucU29FrwalCOhNVF
	wGDUO2Y13GrYcmzM/Eq/IbzXHRnwlCgeh/SVxusBdfr/Jd/0dhJCQayOlRnRrIni
	FREJ91rqmWbaeDtTbgdZ+Bbq7Tpx6xS+fPO402w3KNsJQKzXjQDA7Q8xFzKJYtYY
	l7cLDOEjfsko5ZBrUxedl8t3A7KRVSIQjJBH0nlLu2K6UZI5wzkePI4tV6UHCMNv
	PgB6En1yJMPis8ld1pmzJ18uYlsf+UYM40yLwqZqKVgJXLtMLbBMuj1zxFlK9vNq
	qzi5iQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg2nmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:34:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9103c9c0b34so131069446d6.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 00:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025669; x=1789630469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R2sagXctCRdeY730etUoIGYaRKPWzNI1J5euw6/9W4A=;
        b=csBBOZIWdxksM1o/N54HBuWqmgeUPLUMqjDRadjWoTo46R3FIsnS7HUXIsc04CVg/X
         CJ03SeI1EdR8KjqHFM88GmR+xJT8Fu4jErJ7ZnapqX+ABlguFKc+ijnhlQ7FRhHolLT1
         YUUKNy+GKieEAOG5pX6GJtMaIeuRX6bR6aFOJXlLhw5TA9r5QVNGYSx5Rk2HLh6oCOOg
         JTOM5/7pvZVz0sLZptx8cXME8ogIayPWwEbKR8GlFskt8zTFg3OA6QoOl8gqUgDVUZYu
         jhz5b5rO+kArsFKKoT8xPYILamNN3mxW9/dPdgWE2pg9m5emqgN87QU2YZTHKt8rddb8
         VzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025669; x=1789630469;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R2sagXctCRdeY730etUoIGYaRKPWzNI1J5euw6/9W4A=;
        b=PNWObbg+v92zV/2WABx3mWNGtNPUJeB7Mrnkqloh/4HM5u682vm7ZmArLUmuKoUxOF
         AXWfsAIJcHTdlMrvjaOa6XULjHhVYsZY64u8A+Lukf3X9mT7ryLBEZaJW61XyyIsMXlJ
         7WjaVhMxgBpoWkZlTJp0h3Reti2T1KLaV9MPn0sz6skZyhIcoF75IJv7JQNzYX2RIrTm
         fla0QhHgZzxRV9UnQctyofrZydS7gM7p0UuQe30RL+vjsqTZfs/m/uxwMgnag1q6PlOV
         Do4JGZLH9s7+anlRIfkrwYRJiHH0C7sOdIG2WWf1y409OBt9viiRKCvjrkhpg5Ho68VP
         9iuw==
X-Forwarded-Encrypted: i=1; AKwUvByDtsRp9VvAUkfGETrng8I0Y5IpQ5yowOYkIHUEARDbNuvCj7alvz5svi1f3RUSqe3hZ7Afxyv9i90D@vger.kernel.org
X-Gm-Message-State: AFuF++mqti5X12W7uADlBjW9NO2oA7UoppNHPcmewGgZVSA6Hij2kEdi
	H4k8NqvikXrzqMykuUgdhfYPuqfuFPjwX1Xe+627dzCQoOk3MpvBUh9mhgYARs8K3XjF41bBPsF
	R4if7My9QOOrM4YtoZudKiXzrZakBmyDIbw4S4nfGoEeFAL03QqXlP5CSP4aawzoq
X-Gm-Gg: AYBFou0ljUGdU0AnGD92xDGyhUx2ys99qS3jO0buSOHMvAYSmSSPn4BSNHKwPX8doWC
	L1PgIg5BxeSVlXNRrGCjnG1zgIOVS41HxwJE3aKxjSme0fDGhBUCCpUIc7ese/bPZ/skmEsSXMP
	kN0DuL8lWKbSUFHK5VmAxrh4lyVFDGaMpOVBD3SunXzC8q2yABU52D1K9dpECNUz1fY07uqwkSO
	MgBEAB9d1XUXBOwaWyE52B/OzSp2c0h5nT8JvjLEnk1s4I0DM76dC7+bsKihJaFoqpHpOrFz5LU
	Plt5VOi2V6D+XIqZqBvgyItmf4h2k+5CsnYVhe81OyFmLFNgQ1HMzqMu/OWymJBmEHGqV/CTr6D
	7mTkcawy0fzqXAUB1pW/YPKalQRRrE0ojj/TcikexIV1ovzsqrA==
X-Received: by 2002:a05:622a:411b:b0:530:4310:53a3 with SMTP id d75a77b69052e-53054a34ee4mr488617771cf.48.1789025668841;
        Thu, 10 Sep 2026 00:34:28 -0700 (PDT)
X-Received: by 2002:a05:622a:411b:b0:530:4310:53a3 with SMTP id d75a77b69052e-53054a34ee4mr488617551cf.48.1789025668499;
        Thu, 10 Sep 2026 00:34:28 -0700 (PDT)
Received: from [10.38.244.96] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530868ceb68sm96542161cf.29.2026.09.10.00.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:34:27 -0700 (PDT)
Message-ID: <68453b13-624b-497a-b5f8-b59acb2afcd9@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:34:21 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] media: i2c: og0ve1b: Use monochrome-appropriate
 test pattern name
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260901-og0va1b-v6-0-a05b2d04c892@oss.qualcomm.com>
 <20260901-og0va1b-v6-2-a05b2d04c892@oss.qualcomm.com>
 <ap_t_x0D5moBWJz5@kekkonen.localdomain>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <ap_t_x0D5moBWJz5@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YZYodARf c=1 sm=1 tr=0 ts=6aa25d85 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PI9LhpIBPIlg1HrUti4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX55i6UYFzpA2T
 a+B4Z1aUr2yT383dxXgNVFiS9lstBY8b0ivNTSzN7wh5c5AfIpvhNIBqTE2sfdqq7H5PKcwLsYD
 So6w3u930ki+e84ZotYzSVhmfVkQ2Lk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX457SR9J8hnVw
 UX0ty5wlNO/gR1jKT7ZzQoCyNtAlSsqLG1RCN/o7YVdRFQ6piOcu3kmlZjsMOSDm1XyOAj7S+NZ
 VNyxzhSAEhC6zM8qO8iHh4huS2gn7QKGAEDHNsUN8/UBolawn8Qao3qXoZBaFIMDONnitDUiCb7
 9ZR2bm9QLsof014osTXbZDptFL76NkWHI01CMSu9hkxfvASUfsW7hyVqOeTSOZMhAuWNIz0dIxL
 MAHZT9N8fInHbYxTqMWQEH4AEFgaLLVF3v5WbOcTCYSV0cQCEVfiF3n0nqZKzsjxmOoyuXm0wIL
 GqhMBQ98WJv+afD2n6/1P4va+l229XQ/3j3ZWb102UKJPJJ08hZhmOteAn9iRThk//9vq/f6tTM
 43T7JD40+pM1TP1PUdegEOkwt3PSZcVbg6IkBoF3JVYBPTuth8+oRe4P06ZUO34nRBG4zuyTH46
 8gBvB/BZdDM0F3S7njA==
X-Proofpoint-GUID: jOhN69ASX5Cv2NEa7L0C0ViWvh5T9Kfg
X-Proofpoint-ORIG-GUID: jOhN69ASX5Cv2NEa7L0C0ViWvh5T9Kfg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100080

Hi Sakari,

On 9/8/2026 7:14 PM, Sakari Ailus wrote:
> Hi Wenmeng,
> 
> On Tue, Sep 01, 2026 at 03:40:05PM +0800, Wenmeng Liu wrote:
>> OG0VE1B is a monochrome sensor and cannot produce coloured test
>> patterns, so the "Vertical Colour Bars" test pattern name is misleading.
>> Rename it to "Standard Test Bar" to match the OG0VA1B naming.
> 
> I guess the test pattern generator is still the same (or similar) even if
> the colour filter on the sensor isn't what you'd expect of e.g. a Bayer
> sensor. You you call it standard, however, I think you should define what
> that standard is. We're not limited to datasheet naming here.
> 
Good point.
I agree that the monochrome sensor does not imply that the internal TPG 
cannot generate color patterns.

I'll drop this patch from the series.

Thanks for the review.
Wenmeng>>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   drivers/media/i2c/og0ve1b.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
>> index 84a28cdcade10f8fbcf945999e88f84641b9bc0d..da5c8e49d4a811f55736bd89c6922856f2e7391c 100644
>> --- a/drivers/media/i2c/og0ve1b.c
>> +++ b/drivers/media/i2c/og0ve1b.c
>> @@ -72,7 +72,7 @@ struct og0ve1b_mode {
>>   
>>   static const char * const og0ve1b_test_pattern_menu[] = {
>>   	"Disabled",
>> -	"Vertical Colour Bars",
>> +	"Standard Test Bar",
>>   };
>>   
>>   static const char * const og0ve1b_supply_names[] = {
>>
> 

