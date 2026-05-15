Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0AB44CAE6
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841508; cv=none; b=VccFsx5Yk0HDrR2i8qNqOkixIbpSHNQ1vnF1l6HdYE6EetbrjVg/67Aw6repTZiynihoIbd1Pm1bWL+PeqsTWg0U2M/vYyOEXM1ogsXxS+n0R0ZuTiww0UybdaPM5Mla1SazRYcoLSfCHKfmutPz5SkkybIVxBS4P66HR6U7isE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841508; c=relaxed/simple;
	bh=ub7Agyk2MN9SFWlFYDcRkZ/1Q0WeVvZGg/cobW/RJVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WUjMZjoTP7lkm7voJ3gNZI1T0UQBCxkaGL7WeUCRyj96OmOktPZ3FuZzfckVGsCQfg80sLZzcYMVg4LkTbxZy2OJ4/n4AC9xDSOmNb4bUdb8axEeIKgNb06aH1s3mByLvPKJx+csPBDNL7Lgl4TKmGDPjdjZllQD1WB91QU4eXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zg8KsDCH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/BtEWgI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zg8KsDCH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/BtEWgI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4o7Pl4008602
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i3kAKDqlM10u4dTeLp+aryNvJ1NxB6rqncZZAhk9DDs=; b=Zg8KsDCHsgc2Ll3p
	u6dhYMciCWG7U55oZdtxE9On9pJ8XS+1sBV2jdXm8C3KX6hMgAjrzIkRnsX2qZ1K
	W9vMVFOv/c66yfnIlpQ1884ZCNp3zSb5+egy724crIhzDalVujg0Bj5ddfI3G5Ql
	W7+MRuVxfDWMy5QmwXS7psVys3ApRSxH0dsc4aNN54ajqVNBAZqEvAlVYvtkP4fz
	uUkZlcKLrGfC/GjhX3ZjXElz0wwoibEDDnbfbaunGZi5iexE0gxoYZhdHdDzmxjn
	tlIsCmhQa5/eRnsv3TMQ0+GsoAePCueB34H6iZp+Vu1Y+lcYebdNE2975ohxT0bd
	P010Ug==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stvvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:38:24 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95ccc6c5b49so359125241.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778841504; x=1779446304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i3kAKDqlM10u4dTeLp+aryNvJ1NxB6rqncZZAhk9DDs=;
        b=S/BtEWgIbJ0lYAgf6f8x/9rWLeLy9d18rEfHdfzONfpcEQ7F0a1X02ELfBTHrODLZ1
         UF5MVnfXZ1v8bHQqRs4lgss1cyN/7BBQcJRkPVeVmKLY59LL033Q2DhUOhahjOqI1Qz3
         hDuQcjuokvvsx6AanXgLXufEvW7WACu1e8gMjDGowR0Sa8HJ8w2ApUjF7r4WQEliRFc0
         4vVq/yeMc0v0adeC2xrczo9/ECiWJJITTcWDUqOK7wOoOdF4XT/RxzNqdn+BQVz+hlOx
         YQ2N5kxBJ1/8sX8Nk2mw66ChCE4fT8wooEpdjnqT3WwE3609qRMO1WfTjmLpDTL7HSMH
         g7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778841504; x=1779446304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3kAKDqlM10u4dTeLp+aryNvJ1NxB6rqncZZAhk9DDs=;
        b=BjWi+PF0gX0N8kW5up7MqruJJwtQfiGYFeQEbiilnJhtlde1nhaP8xCtGtBEFvQAe2
         vt4oL2CEHFAjwy/PpgMHVPMZfxvIrfquII/kIc9gE3ZeQl8OeGHKkOx9te55cfAw9zP9
         jgoiJjwv8MwTKgB+xzZT7QNQSM2JNaVVqiPVzmBWaeB6MsebP2hoZjJ7xaSrdYoHaNnC
         WTWXznfutqYCiJ4qwB2uw/yjERIbz8AECXQnYaNLeI08anGsNrDbTrpeWigEavpBcQIZ
         mrDQPSOEZi7EndrxvcXddbGvuWefb91TSsbFeKd4Sc1DYIuxPC+UAQlYYjCgr97xflL3
         rqXg==
X-Forwarded-Encrypted: i=1; AFNElJ/QQaEEAdPP3if7dHjXDlfX75v24e7tW6WTMVCN8bJVO8Wsfx0Uf7wVpbwfVhZBDZs9rioNPXvOrp3k@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Cbo+uoQmeV0cTsj5qJxsD2ygKfdczBX+pciZhFTucn69fiFh
	lVpFUv87aV4SvaZeVw3MXNgMyhJso/lLl+ESl/tRRvPbz6BAkkp14cylquU372x9vzUD1eQpjAT
	MrVMzqwdgP9CJN4NDo46xrQqQrN3tsO+GvWMFrBpgoVDPntb9JQsuBb+gQ1TtcwKX4PcqkZkf
X-Gm-Gg: Acq92OHmfuKwSKb7TVpqdA1ZQMoqMkAQ/Cy18RFRHNyAuaWp5+ixUXj3ogtYRHlv3j6
	vGWGdQ/5stwNhq2GCyUmylNB5hSIocx9Bu+biGdswdebIOM+pPHPjIUPL4vbd/u9Cfj+iPNy74q
	R62EGzSxjpyCO1xg+xgougKM5h4g1hTLYGdnwResqUFZnlWxZ9JgxC0pFklAjCKVyHZPV22tExu
	ICHs01Ew0R2jG9s8YNtD7ApN7AECjQO9+teE+xsfwiKKwRu/HGIacJ+dzyAmyqzOIlC/Grgw8AX
	H+Wq+56MwEGfr/guoRc/LGdqz9R2jnpglIXXERuzRvzFbEyRvzj4dvDWYqZlFd75QKefuFHs02O
	Dgh7X+qT4Od+rF7e7dll3d6T40kmm6IvCREWnq+R84xvK7xfHB0GMoPy3Yu2FwqmJ0267wZkn3k
	xQvyg=
X-Received: by 2002:a05:6102:a1c:b0:631:b312:a2a6 with SMTP id ada2fe7eead31-63a3a377335mr440973137.0.1778841504162;
        Fri, 15 May 2026 03:38:24 -0700 (PDT)
X-Received: by 2002:a05:6102:a1c:b0:631:b312:a2a6 with SMTP id ada2fe7eead31-63a3a377335mr440970137.0.1778841503703;
        Fri, 15 May 2026 03:38:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4de6f1dsm210306866b.31.2026.05.15.03.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:38:22 -0700 (PDT)
Message-ID: <f95fb4f1-e763-4ac6-9cfc-e3af1e14df40@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:38:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: qcom: smd-rpm: Add support for RPM clocks on
 Qualcomm Shikra SoC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com>
 <20260508-shikra-gcc-rpmcc-clks-v2-3-83238ba24060@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508-shikra-gcc-rpmcc-clks-v2-3-83238ba24060@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: s1m8bUHvFYjgMKXqK9sHWFj7AJ7tuw7r
X-Proofpoint-GUID: s1m8bUHvFYjgMKXqK9sHWFj7AJ7tuw7r
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a06f7a0 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNyBTYWx0ZWRfX9mX19YqyLMm3
 z5sLyqGeFweV3EoFFh3gnTQ8pQV5Ac/4Dgve2Tl3BNPuNuxjZQzvqdsVdHpm1fOnHPAelIs9DlT
 MERq7jMTSRGtrodEOvwmalOw38RZ1Up2iq1KJSiwHltc/+1i3RJvB2Ppr4NzW8JATPusEXnmF4d
 Jx/QTIekTNaKVQSYy/kRlsLs/WzrLuttKdXJec4oB5LDbCkdMiM4DrDC17GXF3+rKXe2LuhW8AE
 TDcKjAmSgDF+9w1JLUMrTz10PssHLgRGZyvUUq0nVe2lj8vDRY3Z860G97a88ffwA2+FpCbrUb4
 i0xVbHhCbBWmjS5965mHe3CrdNCwxKWIBS4k4klNKSGN8r5FqqmqeR5xppYF9dmQTzf4bC3kzLK
 mKmYTpnSabwICylVJd56XORtiO/4JnUEcd4wpIceCraC5mpu3d9AIx6mIXE89ZAr/HJMCRujNan
 ESm75K5t3Vk905mMUKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150107

On 5/8/26 6:51 AM, Imran Shaik wrote:
> Add support for RPM-managed clocks on Qualcomm Shikra SoC. The icc_clks
> list is same as QCM2290, hence reuse the same for Shikra.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
