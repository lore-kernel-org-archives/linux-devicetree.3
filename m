Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FABA3ED3CF
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107475; cv=none; b=eDquSPTIggBNM27qg8F4AOX/P5oXe1BjQW2pF58lRL8hUxmYjyxjIOcVeD0qC5yKqXEw8fcA1vdZn3jpQoMWcztU2IK5HAG6JfYN2LuUnD8axgVZ9DYAQTbJUNSINtnSlhNo2JPiwMGm7TziQzVhsy46LVBVSyT2iDX+qC6/3i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107475; c=relaxed/simple;
	bh=F9I6nySpLAYBIrwNwiXbqQXlhE3Jd9+XHW7KFwnC0eI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vGYmbVYR4vHTi4Xcl1CQx7rguX1xZ+FVuojrsMnN3Aem62y6Nc3sX2wty3lM1rZDVJIX1K7SelAecH6X4ZYow5fu4L7e9NFA7e310b/OJ3HbYFXNCSGjrMI2QGF1cfs44sWCyc8t3jMge2K84R7BIvsw+yFG3RbpMwbi+eYVYl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMo2bfBE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EU2TMY+2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMo2bfBE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EU2TMY+2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lKQR2528201
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K0qsXlsk5JCmDH6LIG06w9L926cTJpNt6HXx5DBOd3E=; b=lMo2bfBERMxnSQ/3
	lVHDzbFfRI6kMf4CzLDMqmmfOOvPwifSxB/C9STQmiaFuens3ojo+A+c1rO7FJVA
	YAgy2r/dC82Tn6lIqMIT5RymU3QHbYjgBlOP7+lKRxNWgKZeUCdjqNkJE2/DNvnA
	AQJxnIuESyzhJi3ip2yTBiefvUskRl4H4gQMZtKMLsFGLZ2QE79ei7vNnf7fV4WN
	bcVKxql0NhR0tcjSfyQV70Y2aZVOHX5t1TPo93nLmZe/KXSFv/pEHZ8SVtu0qPb1
	MwURfHO1NnK9IKGwQeOPhlAGcEtUlKj1oFmMH4bf+O3sCoStpi9mhcp52NjQ3vXh
	i7J3tA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr404y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:24:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6cb57d25so115229085a.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784107472; x=1784712272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0qsXlsk5JCmDH6LIG06w9L926cTJpNt6HXx5DBOd3E=;
        b=EU2TMY+2ZhIXC4EJZtRMPHfc+oRF83unCeLGty0aNK3MjaIPiNFaQRI49a0REi4+oc
         b5XzxrgO1w1rpraZn5nZ62vcoF5/SDuGxtnExqoUrjn0VkB96PREGa5qlK8K9Bu19AMD
         paVHnSrVcpCDbmpWy+Mu2SQ8ugaYIVM6tJDVdLabfzwa9TIpNjQhqSTE06NVs2KPxdFj
         KhC/dFIy7C5EB3zDn9w+WhxAN5j9Pvwae9NxLsvMAH59j8ODXsPDbjWIJDzhcEyftlFm
         jYc9s31WVkWxPYvzZoDhxygm2kRVQQi77CkRXjUvDO5lEj2bExRLRUAaUADFS0WYF9ys
         KEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784107472; x=1784712272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K0qsXlsk5JCmDH6LIG06w9L926cTJpNt6HXx5DBOd3E=;
        b=WIOSx7MRLhnn/uxb8UbYXQDd/GK9noQ2tzL0SD5KpLFd6ANymnqpTyDZ9LXRKrkB5n
         Qr2AuRkmltA9Lk58NVyRqITPUM9K0Klr3DrDn2SM18ky/TSF431EJoBfq23rtyD6WrO9
         tptzAQNsCLU8fjZYxNTN7eQAn6N2YxM5b86MuGCwynY7U3t0eqJbbw0t4V2BYv9Kk5nG
         bv1b3+pIkTUSaqaP++yqhEfQUE2H7KCoteqZ7KrpuHxd9zMkv6w6dMmDhQGCgwitfyud
         sQwg2RRd4KsSukbsJQzRKMBh2QYiIUFRDqCZDDxV0HNTD1A/LhxZe+z7ddBHo7OXv0Ij
         Q7lA==
X-Forwarded-Encrypted: i=1; AHgh+Rq0xQ3lebO+GJPEiDNKIs/oaOsIwnM+HZo42bW5XwmWbArUTSdjs2Jvju5+dcHd+g7SJzLrBnRNDOwl@vger.kernel.org
X-Gm-Message-State: AOJu0YwMGl4Atq4ymtbz/IzuIQQD+HkhgGfl4QRrsFF+7qsteezCmvod
	2LztKhnqzWsh5ctZ89d42Bipf2EzdS88gKqUfNmWJs+j/0UWtWpsmKVNlOa6RA41uCrr/KOpUg2
	8GLab4hd2bPkf8xYkbY1ngfjYaEauu6zXX4Rlyra+fj2+9+dhg8ZLYHhKAVlFRYhg
X-Gm-Gg: AfdE7cm35aJblHSnuEl/d9E6Fl7bD8U4CzqKV1Yigixm4NdFF0WROAGUFEiu8g8mhoL
	D7hfgxzjV3t+HP3f8bulxdebC+pNth8Spm9Hjb4eAXCavvZ4XsKtBh6AZssS6tZKYDHSC8j2akx
	wuP3Il6kuiSukI/XbIE3lXO3IQ6r7dNIYbA0NY85qkzRTHhQ6vaK/l29yOyI4UPH+pkIzQhD37b
	HKEAC/1PMCsYCN1131oHEphcCnmdcSqdyPkLH61lNzHg4I8KqT3eNorT9Jd62igD1QUmAsLm13O
	1ucGpdhVjNgkPcqXh5IElF2NlGRcGkugkxWxlWZLOmFkhfXF2nzmSyDj2ii7HbNEXZI2Ty+uNzU
	uhClx006k3QV75Aih3rh9UvQytMLJgKYXcVw=
X-Received: by 2002:a05:620a:1a15:b0:92a:d10e:bde3 with SMTP id af79cd13be357-92ef2bdad05mr1352799185a.3.1784107471812;
        Wed, 15 Jul 2026 02:24:31 -0700 (PDT)
X-Received: by 2002:a05:620a:1a15:b0:92a:d10e:bde3 with SMTP id af79cd13be357-92ef2bdad05mr1352796685a.3.1784107471376;
        Wed, 15 Jul 2026 02:24:31 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d3e54e83sm1074289966b.42.2026.07.15.02.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:24:30 -0700 (PDT)
Message-ID: <624005cb-d527-4bab-9ec2-3ac5ada313a2@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:24:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com>
 <20260715-shikra_adc_support-v4-2-5e07b6d21429@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-shikra_adc_support-v4-2-5e07b6d21429@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5MSBTYWx0ZWRfX1T1/CqQZBKXY
 75yevUxQkUTHhb/YGYnce/9WWPXbR+VFC5u8ONQTy/VUVH9Jl88ZYA7iKx8G+8oDw5SJv42M/7E
 aPNNt0vJKtenNHCWXfg5g1pVPRwacnw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5MSBTYWx0ZWRfX/BEHhnrs5TIN
 oG+/B2ac9rGSOTqPeOORSVxbtlJGbhEtIxWhv9d9/oUM2zrnWtsYtfDPP2e6ZqLfDQl367AkGJF
 BtscGzFwdsql7Co9VyEAYSjy3HlkQREi0BSrC/8oJLhUMiNcw4wLb5X9G5Bm3/6FPRe08/LsRLN
 KzR+UxXgLzEBxKIoWGvyBJo8JSogV919Jki30chHCdOa4J1242LPSCdfy1jZ0B1ILVzuV6p3ckt
 yiGDu01aisZTsk2nZzSpQ59aOP7XtonJbgud6ib8LkZeHZt+i4ncElBIJJY69cVPeqQ+RfRKY8V
 KN+Cb0W6967c9cWvNij0FwatPLd8ER77bUwyz9GH5Sl2GIddC8Utge6tfsFfJs0f94KtcnuGfa+
 ndR0CNcA6Nuj8vBDgBfGsYIOQqhoBbRqcgyIXJBoh7XaptYfgEkGBdsDdWqm4VzTIThtmm8020i
 C5utI9NUsuHrSlFPZ3w==
X-Proofpoint-ORIG-GUID: vWykxuCDVD3J2_6uRiMa8FT8hft9KPMO
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a5751d0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=0iEBmV3l9DZ82o72BXwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: vWykxuCDVD3J2_6uRiMa8FT8hft9KPMO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150091

On 7/15/26 9:42 AM, Jishnu Prakash wrote:
> Add temperature alarm node along with thermal zone used
> for PMIC thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

