Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E1433F589
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 11:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524203; cv=none; b=KB4HiWXU/WVz2lSP4+cPwJLvAx418sqIRaKvO4CTteFONaqMaMVZx+TbESVeVY0gvu453OThULCZ3NgYo2nH78NBrzWUON3npOFgmWX81Cec176LccAnvjZwRJZxU9p1Lh9vmaJvIhYCdx+esojVgH7tf/eIBmpMY8cRMW0YFkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524203; c=relaxed/simple;
	bh=bEEsZLV7PPSJuZMZ0TUDCqsG8lEzuoLvm6l1FqNwz3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+03M4YfNgHAV7Inr/zJrawPrSrpfSOzXQnBtGnGZ++dDmroYF4GDyiBprZddV/kvPNdXyGXbx/AXbUYnXB4ku3l2RPYvlxFMcprY17deGg/w5ZgFlBS3z6T0/sYWDkf6tQ74B9Rl83kMAApTCuhDUVqtWRt3oVHQn5u8LwHrjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVUNxNtz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eIFRlPiN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVUNxNtz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eIFRlPiN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FApfgt136717
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 11:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DUvYTTUsOLo7RNmxiDZ33LF9UzPszjwFsJuntJrwpcI=; b=bVUNxNtzgRyilwCr
	gVvbautuEcty47KsC7E0VuGc3NH2PSjsqN6KUN0RcOltnEvywtQxHKGyYvTZgIEW
	sDC2gI1bfHZy3+emTe7dfklVzyUxov2DTfmlYbXalZgiUNr+fg1NdY7f5L6Z+6Np
	ECkPiPQTxiSBQLvoF7Y5dHfL37le5jpCIqEYlMv3uuvyXhdhG/YlI7w6SQttGmyw
	ElES+hViBXDmBEwSJhYDl7WUvKGjkd+mi82lsB1iFZm+tZh4BZzYzpe5d/+QXxrv
	cJoJEzC86s5yXmGun9EydrZNb/Ln5DhSKIrzpfgvBmwatYqkKOf8hJGrkXWlt7Oo
	VmmpQQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etevx0fx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 11:50:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84247fed609so1769492b3a.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781524200; x=1782129000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DUvYTTUsOLo7RNmxiDZ33LF9UzPszjwFsJuntJrwpcI=;
        b=eIFRlPiNe9VQx1YWVmylC/5OAPM+bhMxPVh2Iqdkkgw8+i/rsgPP35YBmTIOwDqa5+
         gi1j2M/Hm1bH6YPNuHYhje7ssY1xJTLJO+nQkPMBkTs6L58NEY4yL8cyF1hWxOhJIQSN
         W5ySbLPYTYyhmpNbbQByBhx6xuleJ13Bs7VEaYAG2jpn5vXeSlv6lkO/wL0rPtzrNMYU
         7+8JsadFdgkMdbnaReIBS4DV6cty7EwIOzBMaGPZO9nqJhHFuLlohMea+KtBvj4k28uz
         NCB3LiyqTDUN54JhGYNinRBkh76rZvh0nYtP8RdjeUtOzYmqrJJyfUtXJUCREcUvvsQh
         I/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524200; x=1782129000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUvYTTUsOLo7RNmxiDZ33LF9UzPszjwFsJuntJrwpcI=;
        b=MC/SbLoY1o0rNaHyBBC+K4JVXzqlF7yaBtvpEvwiXZXPwCHgi7VFZSRI6JtF37zrpT
         vwhEftVlUBrkMnyVwHMmW25Uk4WsonaBib3kFu28rgXHd3fsFOAoZJiVhWt31DvXmsZ5
         z1vlpTT82BiAQmAGwpDCZQqPWtSElJoD/6IKoNcNaxIRjLZbJCEf8B+y9GVPz6/WDAcD
         3IpeWVPYRLJKtLHqoHXEINrKjHaZmsyCGgQL5UZp81AB5twc+iSJl+VeuvuxELTZgdbt
         U6/v3jK4OLJ8RKQLoArMjQs5OsN9Y9DxABzW5jLZ2AWupJ+D942rGGm39WmeVgWtc8xB
         MvTg==
X-Forwarded-Encrypted: i=1; AFNElJ+C16t8JJQFb3KSZG2rquN9eg9ml22F+vl4FPb3UOaKb3IpPlT2QSEcbCRxhOBmaPvP5UwgsvOb5Kqq@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl6pG5o3X6xvayZHDDbcEfujXC5ne5ohMFJbPd9+hpjLi6fTTM
	uO/c257Qp3Z9/uuNZtxfwoJssj5R02nbLo6RiMPMy6nmUW7if+Fm4ApXCFKz9KeluE5+4UGDls4
	uwlEa9xiSQ22xYJyivb4W+6msKL9i9x2EcfKry21yudSRSi1O8bEnXMkPM4laWGgp
X-Gm-Gg: Acq92OFzh/LnNYoP7IIhBTL+d+Klc39AW7z23hBElubcxfW7yrvqM/IpEK/SIPRMZe8
	gPq864Xe51tcWeXGvtdKG1XLe6Jt6/feu15Rh36FNEcBwYX5JvpPuTqnerJY0Ckd/ydOCbhUH5K
	+g5CNTp4Q3Vbceegd5r990uYD+rLB0pAjHme417m/eIqgxzaNkMjDoht19VQ2zapM32Y5MUo4ey
	zlvi6QvG6rQf+gJ/MobpiPnKFwOlrPap4Thqx+Qiha+0CJf5OIa+ARcYSXQ2NMvq+OGhc/bK/ax
	zf2UNM9vd1ONgnmdMT5KX9C9+dCRDx/iJZ42X0fhfrnqobgKW5xys8GRtNxemwXb0/LKxmpW+du
	IIyhF5IzGpWE5KBr6GPIb6KUOCYLgr59cBbGkOvEiPOBWBmzDfC47MLAYEaQNxG81SCYoTN2YUn
	7gr9bHHiiyH4oALZPr5xlLibQlGtlBNrD61Q==
X-Received: by 2002:a05:6a00:2191:b0:842:2f28:4e36 with SMTP id d2e1a72fcca58-8434cd4ae2amr14954096b3a.17.1781524200183;
        Mon, 15 Jun 2026 04:50:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:2191:b0:842:2f28:4e36 with SMTP id d2e1a72fcca58-8434cd4ae2amr14954051b3a.17.1781524199763;
        Mon, 15 Jun 2026 04:49:59 -0700 (PDT)
Received: from [10.79.198.165] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8a5bsm10309617b3a.33.2026.06.15.04.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 04:49:59 -0700 (PDT)
Message-ID: <3f97dd62-1446-41c9-b16c-fce36076d345@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 17:19:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/6] dt-bindings: embedded-controller: Add Qualcomm
 reference device EC description
To: Rob Herring <robh@kernel.org>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap
 <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
 <20260511-add-driver-for-ec-v9-1-e5437c39b7f8@oss.qualcomm.com>
 <20260612222259.GA1960900-robh@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260612222259.GA1960900-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: d4ovQ9lKjt5ka4OMZWE4fN2SK6TXdcwy
X-Proofpoint-GUID: d4ovQ9lKjt5ka4OMZWE4fN2SK6TXdcwy
X-Authority-Analysis: v=2.4 cv=f8t4wuyM c=1 sm=1 tr=0 ts=6a2fe6e9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKCGUzlOdHAmEzU82osA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyNSBTYWx0ZWRfXz04tVNcWZMnt
 BwKOeSmfUNR4bZDU729CbJgTSEebGmfOHrI3CoIQ98uG5tsPzzKIoPn0k7HfGOQlrV5PWzrPcbD
 co/BCxvHnZneJdM3qgnCmaLI6YWizrk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyNSBTYWx0ZWRfX+v2BFiCRsbgY
 Qsy6huyd6yXvbCvOyljfKdVUrvhFUyFGDldzqsiNiwyicavCyZxKlaeqev4evLbvKfV2ospVcZj
 82V9jw2CjRuBrKNQLn9imJ9c9koecyFctROl+wo2H86O3PyrL1362ROX1ZasPkXW7X3FB9qmNfk
 gbPqeMekYopmtPExbp7edeCphiK7z/spRvYj6cEtsxqJrWxsRB82Ngsh5bbsE7HDS2KzivTjPms
 CMA1G1LyHKqU5mjUvukfIapff47JXIVw/k4khDPl3uzw/+uKKv3NniP26EFGmQz4fbakq3E8mMB
 P7FY7QrSaZdpVIS4bJYcwGY6flVgGXjCqtRwAmcjcLxJGVL2H+DucZPHdXnyagPjINzQ6Jva1hj
 A3+EuowfePzZVShqVGD1GVglvjwTutaJOtUzxIU70rKEbqCZBcow9nfU2tJgZ/00HJhYrzgGGjC
 h7OQ9ig2oZC9F4NwD8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150125



On 6/13/2026 3:52 AM, Rob Herring wrote:
> Looks like this was missed, so I applied it. Please make sure your 
> patches are applied. This should have been applied with the driver or 
> .dts files.
> 
> Rob

Thanks Rob for picking this up.

-- 
Best Regards,
Anvesh

