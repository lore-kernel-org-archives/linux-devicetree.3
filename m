Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A553D3336
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 17:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785951791; cv=none; b=ao0b46aDFJtQUMGzy1LOFmtJbtw4W8aCtvFl4ImUxYLhezrEqIU9Jfxs3YgeawgDxloB1P5V2rEZRIoslgdmsqJnv0BMT4Itv6R+/qL4fkdCwedCqiCWZe7kghHKQJF3+mlkOSnsWaNYzx69q6HxAOVOQXu1YKjKkciPzqmAjAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785951791; c=relaxed/simple;
	bh=07ypCyMw1Y1DkHyn6IJ9jzEBekZq2e8qxAawukaGOdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQUpP0Ua5dRaHSJodzcXsgSXiLW5qPykVcVawwmnp3wu4bh/S3vMMD3oc4Z6P3oWVbDsFzd1M5Zm/z+AeuDfTqXz4VE3haN3nkfntd8m1rVj23j9lVJsgFdBaP9W+GS3ePpSpagvlRh1xXAyQY9DXHu4BDIqfWE4u5NzQKj9kGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PzUl/HrK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f3emVvdT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PzUl/HrK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f3emVvdT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HSMRx3561234
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 17:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nBgw39pYZbgIiZ2V9ir8GoYAeYCB97cB4QUU+tWM1ZU=; b=PzUl/HrKOa9gIM7d
	JdkBwF59X72TiyiwV9JsbIO+ND7rOEAN9f7Rt8Vt+RAIzCqlXrwxAr8VuBi2kc8b
	mrPMJ5yRUcHyX3PfZgjIwpsiSkxhZyhn9jt8KZaLpgjsjefD9oDfX1FzjmCcrsIl
	lZcaRGp0CrQ9I7yVard5MfAAs/WwKO0FmmjhFICMYA/fDhAET61KhrA0oOMnopZ6
	lbs1Po+34+rYQkDF9/xUYnIidhDZDzoRDOL0OcvVsurNsFtzltNWolrLBcOQxvmI
	sfEdvIz98pPMdYema3L35VNsgbmqt1qUGymVkrHwzlSzYDE77s/Fs/WLZYfl9RRx
	b1uROg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5sbg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 17:43:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cec4226c70so21306435ad.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 10:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785951783; x=1786556583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nBgw39pYZbgIiZ2V9ir8GoYAeYCB97cB4QUU+tWM1ZU=;
        b=f3emVvdTAl7VuvCxHxmHpKJ1R2ietv2FxsQ8AGWXT1rvLjY+JSH2KVUYwRRFPlsAQA
         kpZr+rZL9r+TltctrPpVKt9DqzRNloUYBLqQZ/FCs0cCwOdVotBC6tIKbwa2bMGmG2mZ
         sJjCp7WdNGO7nkmUT7Im53DzlI84CbKr1lN2DFgKXIAuPVqGcgfgBhphSZ6IjrRpDDyq
         XGWTTTtbsq6Wk8dyzdp1lP7UDxwkhPfVzI/2fHpKFXhqBZhjJDyn4zmI9e31PU3bNFt8
         qjXwThm+pcjWOV6smiaXIXMmYmpdZcXcXX3OJXawaZ5p1hRcM/j9lm8VR/+LUIoZPrJ2
         jqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785951783; x=1786556583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nBgw39pYZbgIiZ2V9ir8GoYAeYCB97cB4QUU+tWM1ZU=;
        b=H7aIz324IWVjXE+HLU+4nbnyF7XKz7+a9467KxthI8JoZRTSmyu16bMefQkmKGukxl
         ham6LvAJnCKF+0YjkR7O3i/1xOPz+6kj/2k79SuMHAgnKMBhKbR65SRipeCYEeMSlsFd
         1q2PJRCcEnnuekTzSkC48DDdvmSmW6B+YPldUyxGwLspyymIxrcXDLSkdqvaV4rQ6xlW
         VCbaqQrhPSI4Dbk+SWqbVlHSrRw2wjN2v75QToSX3bCAVOoqc1030uUz0TB9bVtG258D
         RcY//ThkKkc5Fc2qUMeriYs7L0xaOUy1pm+9iAByyAp3ceG+SN5v7aq+du3/R3u5hJuu
         qqvw==
X-Forwarded-Encrypted: i=1; AHgh+RpwsU9MYkVGXqIJWVJbQU9HOl1xXSchUEQCs044ghHvQj+1Vwm+79iFyyjL2FYWeLjM6EANzDbWDSBE@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpwca115Dh6GvUbWUfAKw7+gNSzLvoeusNEMYUaqw97Zagtnkc
	oC0jJCKdlOkZIHUfUg0hm+MBJ7N/K5WyE5hnma1hUNSDfixW+kUcOLqE58seclmu8gE34Z7LO6y
	C4l8DOEs8r0W241rClxbJ5P5PLK9exBTtEFZqsBzoUpkKuunWfYGrFowo2ratCy/v
X-Gm-Gg: AR+sD1290gK3+lYZvlL1+r2RsRjeluxm7i2KkQZUX4zvoPgLVMU28GzV7b0gCGM9Tpc
	53NZ461J+sBxZjnThxG/OXrQ4sdBZXkTIOf9hYb0PG5+mJ+IidwdUw1CnRseAh2H1+fhJ91kOuz
	WawrI9MPWaCOk2/Evngt8NpAknQuDKydmLFfNnO69Cwu/Wzvcqsq/tIxLmJf2OeLWJV37v6i5Nm
	Rzb/wwnYpaqcU/rSVezNSfZYPAQR4sZ6I03EZB1fPeYXrqZByTYBLra9kqqHxjTNuF6diq5Ssp9
	cczfnhuWI6eXNIz78MOghtd/U4Ew28j20pNrGqW/N5PU6I80ImrvrMC82bzmY1DDCTbYiMHvIhd
	PfUi2ya5OSHyCz6gC7auEfzLgH5w=
X-Received: by 2002:a17:903:2288:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2d0ca98f8a1mr93789285ad.21.1785951783524;
        Wed, 05 Aug 2026 10:43:03 -0700 (PDT)
X-Received: by 2002:a17:903:2288:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2d0ca98f8a1mr93788605ad.21.1785951783054;
        Wed, 05 Aug 2026 10:43:03 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.24.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa49295asm20647695ad.45.2026.08.05.10.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 10:43:02 -0700 (PDT)
Message-ID: <0689a62b-28f4-4c90-bea5-065467d2ea9f@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 23:12:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-qcs8300: Add support for TSCSS clocks
 and resets
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260805-qcs8300-tsc-clks-v1-0-e7a5101ed479@oss.qualcomm.com>
 <20260805-qcs8300-tsc-clks-v1-2-e7a5101ed479@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260805-qcs8300-tsc-clks-v1-2-e7a5101ed479@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VJgcSIPx_a--drvEZYmelxBibCz4ZAWz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE0NSBTYWx0ZWRfX8EkPYcnvZq9D
 pdTDlTpLOu6a8JFYNrLdSkcJTeBZoDWTsFlYsJiX/Ugm9e8nhBVI5TUz6tLQOIzHGX1Q0PBdRGg
 Q5UgL1u6A5QMGmpCac/rhozAcuSnczIfKNO70Sq72lCAXlZt3U75wjseb4qLdVdt6AKLYlh9Y6M
 OebzqZZLrXNUlHWjE4biOleNPC4WeKpPlA31X/SDXgJpvIhREVfuHDC2xr+ZHNa5Iom0U4stNWw
 7/O8uoyeSR4Oloepc4yaFxaLdMG4YY0cE073CjtFYgyslfxCFp5tyf8ma5AGwQNbaGPGuGdEo8M
 dX8ieXyiFug2waOn3VpIUeFuyBIB/2Ngypd9fVz6NB5/knv8Vck9wCncgf6jOtGjM4uxBMwfhoZ
 N/MqU/HfrDMN2CbD9q2rjvwY3xUQBBM+TPc+829gkhphNNG0/MNfa5aQ2opKyCLZ1nAHF+Wrd+x
 l65LJrAqBW3bIxrnlFQ==
X-Proofpoint-ORIG-GUID: VJgcSIPx_a--drvEZYmelxBibCz4ZAWz
X-Authority-Analysis: v=2.4 cv=RcygzVtv c=1 sm=1 tr=0 ts=6a737628 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=zf9A3FKX68OF7GX/VhWQbg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=J0kFQpeBCHEeCUjyc0QA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE0NSBTYWx0ZWRfXwuXpbAapYf3k
 55hLrM0weqQQt7+x+ZYslSDbdhOBKrrp8/UtuwJEIfa78WiJrbeSB4cXh4Dsynxk0jKAPahKIh6
 3g+67daJcOwHmaEGOBBk/nxVS10VbHU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050145



On 8/5/2026 10:17 PM, Imran Shaik wrote:
> Add the GCC TSCSS clocks and reset support required for the Timestamp
> Counter Subsystem (TSCSS) functionality on Qualcomm QCS8300 SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-qcs8300.c | 103 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 103 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

