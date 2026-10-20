Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482057;
	b=wA6Xpall32jr7S4GfD5fZIjLBEZfTg4CIIFW/O5/mtxDE6LOKmpqCf+DpHQEYIP58vN6
	 ncleHKbhZrfFQWEDY0CnrpEOiSJySC9CDn0q2eben7pvvnF/BOpX3bjrIALuzrNaIRjPt
	 EZeWWPcgKxfnyUl9A8tVOTrNVQNXYWNW7HaznxcSRIV6cLXm7vOv0SDrdBG9bYMM8NTMr
	 6kn7olOtw2GS8ZQig03Fl5bedGV8VjI1XbA9bPLhcZev+pRBZMAcXroSq72E6XKH+mcwW
	 2euMyg96HukS6taxE6u0GElq+p+o+YZ57t1PedQuhf4hgtW6UeMMgtkbwJXAX1X2PSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482057;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hy4W6mMhOKdF/nbRv32rjMZMzD9lBQeunFVQ1Fygj/8=;
	b=brXkfaf3tqAPt8ZUks/DXNzQxSz/1xWsngzIMsjCqJ0HJ4SIAUuLinJAnDTwf7GEeQ1I
	 xB0DT3wbRYZWnK8lQwBEJihXQXiNSe+sn/smEWFlQkLk39mG51A9P0qTE0pwiYig1Ufo/
	 U3tHOO/rsmbgrmgLVlobLLqOWmCcGNXN3tlYRlyZdiG8LbZtUvbBfduecS7R4SQy8/M5R
	 tIune6hzFz7t4caNOLFaNST75w8pdfrK1bQ3wibW7lxURfnsag59c2D59gBH4b9zxDUKC
	 gcptk3OzRBjoD7CGwQwba5woespBuDcpOxNzsIyZ61DhaW/Fio+5uzcCPOqeSpnbsVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GqdI2ViU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="II+s4/OT";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E3D606A31E
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4E3D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GqdI2ViU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=II+s4/OT
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t7kQ3806851
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hy4W6mMhOKdF/nbRv32rjMZMzD9lBQeunFVQ1Fygj/8=; b=GqdI2ViUBphwRsIq
	LJdO7tVHBBCXtj+kZrsG8IxGgvJBUUgDo+fB9cNCo8JchN1seaMleSoNtvqW/HjO
	dWo12bzQitn7JoVFBLDFARms+8FnK2ijKgQ9IpyrmGE8nQjprv3KBAnsk5fk987J
	lGGGxTcVmlLDiWA55N1cDu2m665VU8OBWtdPg7GYLXL2f/lWPNxRhNts/JwDt8th
	Rs6sUvvDWx7OB5JvSBErZ23z85H+73cKKLDZzmOg5OfDI+gyCCP5QCp3xRcuDgRn
	uw4C9+lneT2f0jQA9NmPVRnyZJyZW84VpsKMdpxc9d5M/rdbdzePpOGyhzWkDQS1
	eYjMgw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p9ed4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:40:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3960dca5so43306985a.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792482055; x=1793086855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hy4W6mMhOKdF/nbRv32rjMZMzD9lBQeunFVQ1Fygj/8=;
        b=II+s4/OTaH/Fl+iViWfkTJWFnHrWfqJpEg4nEfQ8Q94+8eZwMuiR466bWjPmgG45YN
         PaZjGJlm4JCT1PYLFvKwcgJCUUyj34ZnP48i5JpjRebLk+phDGptzFqjmiU5ndBp9ZdK
         tX61Yg209vB3QBejtA86v82MOp9Cpqi474ielILquzG7ajojq2fkSosLxUrFelcpzng3
         WEUe3zrfRB9zBe5u/prIaz7rNxtMu48T93FZGsFyjW/5TZ689PAZ95DdGfjCtM5V6RHg
         d2W2JQBsh11oWX0jifpKLO0AfjBVVbODlPnz3dQOGGLAFMBjqE1Hdosv5Ms9D2dMEKiq
         kJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482055; x=1793086855;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hy4W6mMhOKdF/nbRv32rjMZMzD9lBQeunFVQ1Fygj/8=;
        b=lLN+KkrrqGkOl6t5VYa0Cf0b7K8KAg+EMZ3KPWzsW8xzCfLaeBUDFuXpFlZ7/dv+h+
         uzye2rK1SxX7nySotwscVJGuP+LE/f+3qVrv3KUXEHAX7KCwihPjzn7XPZP+Q/6flrcx
         6jRyNlQDm/mPNQV7fA3q2pqUWGDR7U1aDmrPhFsJwiB4twi8OY+7kssoL9lAB5ARqO/e
         3WNkxtjuBunkM7KTtljwuylBZMAqzM66kOn3dMe7Zs7WGbJKnoAAJhXz5M2mzcPw85U7
         pmvVgJ+F7OGAaxY2QqL9HVIrR4gWeVNZth2Yp+fnLbiSJ9R5fR20eYlGjLBoHEvc49yC
         GylA==
X-Forwarded-Encrypted: i=1; AKwUvBzZB3CydGbkykUTvsR/grQKpTUu+vBEbzDO/uOkv+NM0Po3DCwkMMJ9sJLAuC4cGXZ8MRmTibbDkqzM@vger.kernel.org
X-Gm-Message-State: AFq9FYLOWAwU8MSsIc6pYhHqsAdCxKSJT3DqxNMJ4Mki2XvVYTMGU42P
	0+xC20Wkp75iLEQs9HrKn2o0kc5tQ1STmCdylW603rfpbC+FRlqCOvEZQXZbQtvrSDUhCaouJWb
	WcdnyCvhKBsHRzYWE+hhY2V5wa2EZgt0nfgZwk4rFu1ODnMF+Q95VnjTqFk6D1O9y
X-Gm-Gg: AYBFou0I8qPWUvd/f61OgoxsCafcteyo3OwTBpWbAIk1eo1+vVTy2AKU+zyHUFg17Wa
	9QkxOg2YiReWhqCAtodLcYR9sxKuD9Ksjk+QSwIzT5nIcXokClA6LjKLXoBkDQO9/uY2HzfI6ur
	LkGplLfJEdZy7KzBi7uDF56PbxLPVc1fNWlZoeDncLEu9kHwABPYAiIvOSPCp+b+mpwgW2aaIRi
	eLAp7V3PrrbBzV5xUl8uNu+GzxkqKkMlYyFTd+ZcuDBODbUM1BQKW7YYr9GnVb5XIfmwe3vy90R
	vj+KL6f10F70lwQ+BgbKsTDZ7hV8Oq6mABzKjzLqRxNIJabrRluFwgS5Y6PzM2XwxhQwN0ObCul
	afjP6f9GylzSmdNvHFTDwDw==
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1773168685a.6.1792482055299;
        Tue, 20 Oct 2026 00:40:55 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1773166985a.6.1792482054808;
        Tue, 20 Oct 2026 00:40:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c42a3f4eaa0sm287773166b.0.2026.10.20.00.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:40:53 -0700 (PDT)
Message-ID: <bcdc5f69-bce4-424e-b498-893a95f3cdc6@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:40:51 +0200
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
Subject: Re: [PATCH 2/3] arm64: dts: qcom: ipq5018-tplink-archer-ax55-v1: add
 'qcom,ipq0518' compatible
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
 <20261007-tplink-ax55-v1-ipq0518-v1-2-0ef058756596@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261007-tplink-ax55-v1-ipq0518-v1-2-0ef058756596@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: F0T8QNAaMyHnshFHXrKGKPRsfdkIBggL
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad71b08 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=GWSpooEIi9OgKuXyjjUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfXyYmB2QUZLyDS
 uWDcajDnT43KfW1PWzMYIt6I051eXKwqDs4A6Q+PFiT66OwJAOR5XOxGv3aoFbFE/8fVguvR2Gg
 LSRshdeP8znzCMWh2yqy5bW2AKjb61JiP7XY+LdTW+n5gERepJL3MXe+9gknUWGo5lviVGSwmtN
 YWEj+SXi2J/Czv9VYSrhjDEiPj1zSB84AB9xwM2Gm7OhIdsfGsNI0kDtNYy9mTAG9+uWdGTzjOl
 LFD2Ffo27GbfKmXPnz9LaVYY05PtPoGk4Qi71Dxj9tAmFBNzpmgKrK+rRh738/vrtj5VOiRq0TM
 XvvELtMYbPUCXAkUpFRJm7BPmqbto/XCzgCTfQOINgcdzzeLLWFNZMeylSF4Hgjflp7dIolp4ZY
 1rzxvVuSjEN0Bd3GRqimXSlW9Q4XTnf3nvdC58423Ar0Mag++ryKBZ4d1RnFlrA7Gu3OoEHfb0H
 a4QlIbIOpTTNpuifYNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfXy1RVBy0gM5rQ
 Q48cv50uHxlPQEHLjsT8E9igS4n9Wl2jmabm/VIS5O2RK1cCvszQup2VGUWl+ogd/AIJgbOUBLZ
 NUbAV1MVNXfnpCL+Hd1ZA0IBWlWCifQ=
X-Proofpoint-ORIG-GUID: F0T8QNAaMyHnshFHXrKGKPRsfdkIBggL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

On 10/7/26 6:59 PM, Gabor Juhos wrote:
> The TP-Link Archer AX55 v1 board is based on the IPQ0518 SoC, so add a
> new 'qcom,ipq0518' compatible string to the board dts file.
> 
> Since the SoC is a trimmed down version of IPQ5018, keep the 'qcom,ipq5018'
> compatible string as a fallback.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

The naming is really confusing indeed

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
