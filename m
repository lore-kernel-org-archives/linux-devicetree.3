Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3E937AA8A
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 10:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644948; cv=none; b=cgpyCurTg3hBaDVNCQGsChnr1V+XRwUVY91QzasGykoBYI5HUqnv92EjiQ26Chovb1j4+5bEh8WBQ9oqSO/Xbcigf5IcGRArSJnzw5O+eq73lHXS1de5lwtvA0fyQb5Dwj8ATPw0nFNcXba6AIw1Hdcr4fxEOwF6RAOfUPi4zoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644948; c=relaxed/simple;
	bh=pmyeGLntD58RGtxPkUD/mA1PEFM7O9ajEnmKlzst5u8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BgDWY64KxKY0DLGD8rPnVjhJYExPUe5Zp6bVfKxswVqYzfdwf5liTKhKOmBynHZPEa7glqWLGhMKGvW7ypUHlTHXf7A3DFYUhDGMLoeeA9XB4nHP8myA99UlhoDNZevkIvZ6ZDszfIXWH2f03Xg3G8rXmvH1GmpnuWtgDoCIu3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eUm0ulen; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QvR66idM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eUm0ulen";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QvR66idM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638700RA1619683
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 10:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fGcotca1c9G9X0Wk47D2k1ldrS4xnK1R80n4tyPd6dU=; b=eUm0ulenZv7T07ga
	Wwy6Ix3TveFCCSsMuAD5Da+iSCArU1d4XZMDY3YzOqvwN+Q01S5PcZS99suFnLkY
	uC55j3Y23aXhs4SYlsETiqWufchXxm0Q6w1pvqMGrzssnogqXxuZjAH/EPIDBwfS
	9egdeM8EuxLoSiVqvPoaVtXSe5+Ilpou8Xjcr0i20lwUz8mdYoaUpTSa5OB0Txtc
	0IqDMhgK77ZCU2pDcuAt/BdSrrywoWKbj8anfZfAWAPUgKswHRp91B2LQyHOw/Rb
	7oDfVbq9pJN05kuC3Bwi2rhnpzNWKceggm2y/7jwKSELSRaURbdl56gQ8uDHoPBh
	Ot2kLA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddacrjc3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 10:42:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d1d81dad37so215698085a.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 03:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775644946; x=1776249746; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fGcotca1c9G9X0Wk47D2k1ldrS4xnK1R80n4tyPd6dU=;
        b=QvR66idMfJS7CgkyYPWDvXfhM0H5LTvMdbQy0QSKYSxcfiNjaKgIh6iGwECfLKp+vV
         reknD9RbusPrkQk2QQz4kLnm5eelVNi1ei4I/W7BP52B2qPwLoC1sPS61ml0rt+6Q2J6
         rIFgOV0vdTbx2wA/JgQf9UKenWv6/mIJxZaluoyw24IlKjJ1EI0bDtrO4rnoOihUOcGg
         bG+fdm80zIoLZj6mMsCterg8onHDzxcHdmg1hLz5YmXd5cj1QgtsQ72q59Eza29Zz57T
         npisJ7OaNuSj/vk8Mo/xYG1zhNKxVpMGrBarmEImzESVN4JwY0JroF3AIEfQP9pGeYp3
         R8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775644946; x=1776249746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGcotca1c9G9X0Wk47D2k1ldrS4xnK1R80n4tyPd6dU=;
        b=HZGSaUmaloq4asRiRUXUICf+SfrzFpiYsN85ocbyOyWJ+jX9WHpx0UjrdN3iAC1P0H
         cp6isCSeZJMeQumIUy5lg4BoydBUGYRcCWTVqm5v6KNo9gcJyGgurgp1hNZPHhjSi9Zy
         81RikS7xDP0xEJeEV8tqM8tK8WkTxWVW7v/JL9eJR3O4HTCb+zB4hFJZDbucBWeVaiBC
         1aP6hixwl7EzJc1zjPgbO4yMqt7qJj3SzyWABY082NVI58TZwxb3t5U8jcKmzjwVU+I6
         F+27qXHJ0B/l7TFiPBLw6Z3ymYDEv5Lu4n/UWlwlwKEumF2lF09gfeWZglBH5fS25UzW
         FLnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg9zvnjYF06ktfILeZrx+xMt/U7ReXJrUUDvex/AOUNghAgqde9g0WjAtAFTT2KRvbtDtO0cIQRrDd@vger.kernel.org
X-Gm-Message-State: AOJu0YwD1UwM83wHYJz6Hd3njjWZdmKduo9Q7IX5djaQGJR8xHjFNjvn
	mcnmaiW4ghbp0dZ9vHkhI1F8d9qNedsrfk7I6Omi+qeshWvb3YwYAhySLV66i1/F1BJHE2lRvoh
	n5lmlHWOursF+j7MgRnzxPLbIbSR2tPtLh70eKLrB0qrWyDDcAzjglIV3gPMOS4mn
X-Gm-Gg: AeBDievf8UJ4M02AgKNPo8TH+VwB9aN7/nOmF3Kf7PIbzAlEHZLz+/3/jQYEexQKmxp
	3tSO7+HGB/epb++D1ZEBgo7UgO9HW78Jn9BC4YIi546tsiHAZM6HT8pCa77SuOMo+X688DCT4V0
	aZFQckkl+aO4c136qQQYyyQlM3E0FzTn44SJ9Wj5DrnlPd561BeW3V0ytkJZICDaA1ueckZ808Z
	Ukr4iYvB4hTVQw6AWgHkJGrDzATNo1zRQl21DH4SdXk/Q/kPmb+MiNudeWsfCEVCve19f4qUGPZ
	idKUJulOIgvTFH/7fhuyJeRntaRH1SphsM8XNmvPZmCNnZAbdnnq32uBO+PB247fBSvTynU5lpV
	A+qiHVZVvAbgq691gN5rNtl/zdmEA0qa89iFXN5CL40t1oXXsr/dgUwo7bdhCdDfU2pjrNIyl7N
	x+P68=
X-Received: by 2002:ac8:5f91:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50d62d1cac7mr225687801cf.7.1775644945884;
        Wed, 08 Apr 2026 03:42:25 -0700 (PDT)
X-Received: by 2002:ac8:5f91:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50d62d1cac7mr225687611cf.7.1775644945460;
        Wed, 08 Apr 2026 03:42:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99ec5dsm650018366b.15.2026.04.08.03.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 03:42:24 -0700 (PDT)
Message-ID: <e70839e2-a94a-418d-83c1-87336c558189@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 12:42:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/7] qcom-tgu: Add TGU driver
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
 <20260402092838.341295-3-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402092838.341295-3-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: C69lajhBQYVoEw3hSUMJtS8-0YrnC8Uz
X-Proofpoint-GUID: C69lajhBQYVoEw3hSUMJtS8-0YrnC8Uz
X-Authority-Analysis: v=2.4 cv=WZs8rUhX c=1 sm=1 tr=0 ts=69d63112 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HxVFgQzDQVkKW_O196YA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5OCBTYWx0ZWRfX2/CQt71/0G0G
 OVYy5qHqfjGZbpSJU4UTYMa2qBU8+zP9LHDDRnpt2cLA0/hnn/n6TkddO8wOv3PXKfoFJFZyvoP
 +gy7rDAbiylzvdk5vHeciZnJwJ5IX3s4Wk/Gwlj2ahBLk/xu5VUagEhGi7FVrFFWdmEJmFeJXEX
 VkOJCeyzCWZS95zzJm064G0xQ62MhT4ek+0a6ow1RTy8fpohJ8wLf3odK41bNfYMEAmTb4n0tmP
 fGHcb7DFFraJl1JgAn4mYUk6OrLI5DUpMLfWKnoJA65kje16gOefymwZbCrdfNyuKbfPGhRwQCa
 sim4UO6C7qapE4qOLz3O9sBtmD01ypzmaPsmc8Ahw9+bUd7fym6Xhy/fa1MvCeQY1t27MUMQto1
 MGUUrxIsrHkW/qStHPRTlSm/ESRTVtjHbiHbMNygD0mSYHx+L1WsxJjMGk1qPAshzKG4Y7o7diz
 je4qRCJwdMqSOaI5drw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080098

On 4/2/26 11:28 AM, Songwei Chai wrote:
> Add driver to support device TGU (Trigger Generation Unit).
> TGU is a Data Engine which can be utilized to sense a plurality of
> signals and create a trigger into the CTI or generate interrupts to
> processors. Add probe/enable/disable functions for tgu.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
