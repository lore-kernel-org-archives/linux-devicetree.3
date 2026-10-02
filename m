Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE9349552B
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 13:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946219; cv=none; b=WugnsJ+H+omyl6gNQEo1bgRUCVIgJeJ0/L1J+X+B0PJmX6xCyPBe08CLO/d1QoExDelSSf9upyf9zifi6VqNyXFNmlWdZfVGqmpuzE6dXnPqul8IQxqD7SIT1omauXtkHXuXmjuQz59B+TXpSociwZ8O/CJzQ3KYeG/7x/eSvDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946219; c=relaxed/simple;
	bh=b+ZrbszRlr9tKDb3C0bvlN7LI2Y6k08QRyYRWjJKahE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U0a7tehQnu0pAR+kOaHNBTQYbuqrNomhQfLtqR14ntfouF6geMF8jvWsbD6lFEhAfHbR6P0GTE4gzOYX4q5v1a6jz7E3Zh4T8ogkBWsm9h3o64BNT/inA5X1NM3nyAAVldfpERzg09tw/WWEsceAvUIkKJjRgdwcpnmPElIUAnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGX981xa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B6xijXdB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGX981xa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B6xijXdB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nswA208410
	for <devicetree@vger.kernel.org>; Fri, 2 Oct 2026 13:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6z5IuxgZF+4qKvUvtMUrTZperd+qzTCulZgwTnrNmnI=; b=eGX981xa8ZqWDeFI
	gQfPrPzvO4ore6ZoNNVAKhkn5z+eMUGja22OrluJxt+SmqOP9Ha+Z7Z3ytgOW33j
	9x9xe83J7RKEBh3PpVoo3b/zeg6WL17WhVrZ8daJ2ZxenwvzASAxb3uqqijdVj5+
	LQM63y6IpdH+aOSV1UuF7dlKCTvGOlwRYVeAdc3jEGr2VYO3hDyCy9ck6OncZxd0
	mowN20rep8hkGWmAWZ1LhP+pgjgzkpyVwNU1oDjpV2BdeuCyhXSNokvX5NEQh7Hn
	n5a9XEz3uzUskjczJcMDXLcnqnu6YumVO2LrFyt5vMbrRSrxsmTZRlst9gij7PH4
	AujSSg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1v033jqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 13:03:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so13261448a91.2
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790946211; x=1791551011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6z5IuxgZF+4qKvUvtMUrTZperd+qzTCulZgwTnrNmnI=;
        b=B6xijXdBDYHPyBOWlUF2F6/D1VRgxkv53VXJjE0WgBhrcRhT4MbvPP8dK2ThwVA1X2
         /ccLsb7ImvysgydidQQeXEdLKFf4P7FZ3SEzkWROYn8kfdr5fQRUSnSgc0qJmxHbyDVZ
         CqsFjDyJOKDqMaJ+KIuKkD34B77z+OMJ8PMuSf3rEGBAvuS9++g91S2gFZVKechv/45/
         EPOlDkOpEsc97qtpjgFflJTGmrP2v8gHfDV2nPd+D7I5R4CGD53NORcODpBdG7a3rVrH
         7H853HhCT+ujStF0j15Dz4eqjiWUrGE4CXLsZqNTP61nN6S89gsjL7Qvbx2JH9D/Sn+R
         jasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946211; x=1791551011;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6z5IuxgZF+4qKvUvtMUrTZperd+qzTCulZgwTnrNmnI=;
        b=oVV9w6OXcqRR8pgx2pJiV7UjXp4oAG0yg4Tm0AOZLfZ7kxWHFrz0T2fSNGwYHGG41c
         ITqisaemWYz3tv30vgMfgdCaxLLMiPOdc4C/PHDFApwi7E19tjaTHF74UJEdOc0OiHQ7
         VYX4Ghi4pyG/czdMFYwaOSGfs8+bx0ak9nh6ZviYG4lA6RtGZBWPSDi9Gp9xgV6v7na1
         s3y/k92AJ00XE4AWVEaTyrM5/wAt0qABvUxoWPQXmHablIaLRpRUPfMK+Cr5PW/IjrLX
         QznrYOgfu6CL6l9WpewnXxbfi7PSm/zudZJkjes5GF7IhVOXMdzhTqt+67SLJq1tidOe
         QBOQ==
X-Forwarded-Encrypted: i=1; AKwUvByKfl3Zd4Bsi1l9iKAvu3vzST86qZRYJT81i5CuEn1RN2WyIsOIkDPqwNfVhJr6psV8g30Vt+X+qkhg@vger.kernel.org
X-Gm-Message-State: AFq9FYKr2hvzIzzSUPyU/zNLAUUY1W5ih2Mudphct+4qPs6bIrDE/cuk
	+MWaR/Zlr8qbCNawt3DOxwg+5KN+BzkcZzPlEFUZTkaVX0fzFK+8UbEsNs7WwVqFaCVR3UxKBpn
	f8cbBadidESqHb9UW5CFUt8HSUcPYzEMU9QkOBhvX7kRRRwUX+/cbJsLx6jNtq2hI
X-Gm-Gg: AYBFou0U4H1pPcrgpb9wTu7amuohW7PRqKWOA8NZDIZzK1SpdeaPUZ1ml74bAc34X1B
	rGPm3rP5cUxlXYTrVziHatKVO76D/Js0hLDZb70IkdaxFUXI7quT7kf0AipVYPtTfsQn7fMrwY8
	pmmQWPHzGjWhSSP7K7xMIVBPgN7Gis4uPj9s/jKs3zMnOSd/EYWVqmwO8VE443aB2O0Wnp6KTAT
	JqLVgNdYa1jNiiMsJfjRroJYDvZ/eUhjQbDjmdQ55LqqL4E6YTaT+DszCbOGgbPeIv3QUzeZfuP
	9YzeVNmjLT9W+I4xxNybFIU++Do82jnkfwmZBNH/pwbwuOC6h/Pvntsu7TLAqkbXJbQWlIPCbnc
	PwMSrB7TOzLW4dnrLC6Nox1hZFWzqyGwC9vzGuS1sr+I=
X-Received: by 2002:a17:90b:58c5:b0:39e:6c6a:657f with SMTP id 98e67ed59e1d1-3a6ceec796bmr2429030a91.66.1790946210457;
        Fri, 02 Oct 2026 06:03:30 -0700 (PDT)
X-Received: by 2002:a17:90b:58c5:b0:39e:6c6a:657f with SMTP id 98e67ed59e1d1-3a6ceec796bmr2428878a91.66.1790946208517;
        Fri, 02 Oct 2026 06:03:28 -0700 (PDT)
Received: from [192.168.1.5] ([122.164.87.104])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd3962f0sm1302687a91.3.2026.10.02.06.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 06:03:27 -0700 (PDT)
Message-ID: <9d024cf5-1a5f-4cdb-9ebb-1c3d7c6eb049@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 18:33:21 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: sram: Document IMEM found in Qualcomm's
 IPQ9574 and IPQ5332
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
 <20261001-imem_restart_reason-v1-1-79f516906010@oss.qualcomm.com>
 <20261002-expensive-boisterous-nyala-4d8bad@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20261002-expensive-boisterous-nyala-4d8bad@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX38cM0IFM9Ci7
 gSf2h/Z7JjRG3Oc53Tv0p3gq46oV4SFBHY9NQ94fwHYJGalXc+eQqTe1OGms5J2Jj4a9WMENM/P
 hD9Z3I39u1l4LiOx7YuKrQE9mQypgFI=
X-Authority-Analysis: v=2.4 cv=GqfXaU1C c=1 sm=1 tr=0 ts=6abfaba3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=h//ISAYwLoXuQW9fHTCWYA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=PDAiVhL2AEIrZ4fXd3IA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: -5p-aif_IkRP-do1ikikBZVQYgYj1rZS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX1ggV4rIm7naJ
 oprQx+sobkGwWK7esc5JkUrs/CdKj0MqnTLyu+Feuq0ffS0uwAjI8vb9Q0pVjIerlBPAJQdizzr
 xNK6Whd/5sYUTC/nxQIAeNib4fBpqjmf/97HqwwVhk+5IB8Qp/G5GhMUuHm+y5ltUChYRHaT/bs
 8+XfGfgoa8WD4cko0rd/a8wCkTuWJXVDJ5uYsuN8Ni+Ce9K4VtXB2qjWTPyxIH0d0HXm3Lu/RiE
 ffd+a6uZyImZTqDjMiqOX8Fi6OUECPWRDZ+oVihfzvknie6MoPYoJcEKGcc+LFd+ygM6jkSx7EA
 3wvMafQtVCRmmcoXydRx4lF9/vLc91DT4Uop5UXDBzOOP+4/f/M+j5tB8DeipflETJSDF3Q/xW/
 KXOe+tbBOj6uF0YJuraiJsTaCdE78IPZHSVIQy4w/4BKNXWYJ2RROrWMtSetgwJKubW4Lp1JGQ7
 PsTdhGPBTTWVjfehUuA==
X-Proofpoint-ORIG-GUID: -5p-aif_IkRP-do1ikikBZVQYgYj1rZS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020051


On 10/2/2026 3:11 PM, Krzysztof Kozlowski wrote:
> On Thu, Oct 01, 2026 at 08:41:11PM +0530, Kathiravan Thirumoorthy wrote:
>> Document the compatibles for the IMEM found in the Qualcomm's IPQ9574
>> and IPQ5332 SoCs.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
>> index 6ee0b1464722..d65696885e6a 100644
>> --- a/Documentation/devicetree/bindings/sram/sram.yaml
>> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
>> @@ -37,6 +37,8 @@ properties:
>>           - qcom,eliza-imem
>>           - qcom,glymur-imem
>>           - qcom,hawi-imem
>> +        - qcom,ipq9574-imem
> Why reversed order?

My bad! Fixed it in v2.

>
>> +        - qcom,ipq5332-imem
> Best regards,
> Krzysztof
>
