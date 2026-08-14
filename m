Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75BE41B8E6
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693329; cv=none; b=mNXMgS2kB1rGiDZPZ+W4nTBa93yXr9X4viFI2iuPxqYxh92U0IWXkjX00VJoeQr0oi9+8LjYzx5KERAaTtC0C99UdGTUvFFn0OzQD+HPoD/z0LBrzVInbwW6q5U4r1t3xi3M6jMHrA0colqYbnRtlf3Sci8d1Btu9sPiJawYT9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693329; c=relaxed/simple;
	bh=XfQFoy92YAbJRszFj4tSxRJz3Ixlm75wjudJorUS+Nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCZdqvTw7yoSXmqB/dTG38yIqTskASgbFcUz9ZCwdbgRfTdvfLspGETeUtIfeetnfqaQb0I9G699MSTz9Z7Otwiuc8iJpZ61VtRPXIA4202EoK1Sg9aT/bccoCqcD6NwMq+FRkX2xRaFwUIMC7CokaukGExR+fbHKPY6sQ8HZWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLaB4z+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KjPDmf8X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLaB4z+Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KjPDmf8X"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7fOoA678124
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fW099fw0HL1cZfejGLVIWP2o3DrM5IlB72+z3ftYlz4=; b=TLaB4z+QZfXwOQGg
	Cbtnvbf3oBaDekR0RbQ3A7rx1B3bXGq09su8+IOCAkdrdv1bb0bqc7Qak76tqPib
	eJBFZiq1xDRINkol4ZA8CNUotxcy4fDX9nij1mcfSMRkfqTHQD8LyEMQBelPwjN5
	tILZZv1kCzgzlI4OEm6VoJhgekXBT4w4yT7xH+4XCZFDH3DnL8LP6wXTwcuKxWrZ
	G8GSEZGQ/X0vlWwhO+7nxnBkzXHxjhSGACrh0EkFt0SU6Dd5BEOTsVNGiGzDYMBI
	bGNiySqZUhEeAjFGTQAWIIIs9L8iXOOfrt+j1nyI5H1awzmuCqHqJ1HRqB5X5oJa
	CfaCCw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1v8prm4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:42:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfca8558d2so11613995ad.2
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 00:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786693320; x=1787298120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fW099fw0HL1cZfejGLVIWP2o3DrM5IlB72+z3ftYlz4=;
        b=KjPDmf8Xcxn5/UM9Eg1Duke4d8s5R0q3gJiNXCADNUrSyW21eG1M4jeYzhT+U1jmJS
         XJO83Xs8gyyzJlF2ZvGAUie8SWHY2yVQvHH4qr/guqtnDoyePzalHEmW+kJuiAObzIM0
         geJVZRLKU7lv+11abtQ3tQ/KAkgngh9jiBf6xJCCh/GYMxX7Z+oxfp0C2JX1Q8PitQTZ
         0o3oVeHalalGeCJ0ojde2qOqkJKuTLWK/0GBbMXcqvcvFLYZi014SOez59OLmLp+5Uny
         9FiknsFzs2tuc2pxkcV/KtQOb0pJ/rr4kfWbUFwOKHzfQvoSeNqesoG1hu6VzEQ7K3uU
         J4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693320; x=1787298120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fW099fw0HL1cZfejGLVIWP2o3DrM5IlB72+z3ftYlz4=;
        b=nDkzXhk3+QGPjV4PGwxnl6vpAtbpnAXx3XkIlMGcdvYdHaLeirhwEyk2T9+FrpzaKg
         b+WYfGq5LmDHRDYxE7Xf2WgTRbwVMJ9wxuF7wHwdD6VwC7atXsHGQRdN7KlWWAEt8kfX
         opx0nHw6a1UaYKKjbmjKUtGmsEc4OIopiuWuMThm9zfGaZKuCLZyxw3fYxMhn7itmDso
         2+n68bIgUbQOeZJYgQW6/t2mlHo0EQrn+M+9dMnDdaWvQmEl3ZyMM7IXMqvaaTKh9ZpR
         BIpnAogMDGEiBDyqCsOiwS5Z8kFfWcRNMZ5j5jHAQKqtdLIlzSpOckYkFIQxy4yGYDie
         W7hQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHI4VIBvUwX7UOvYXvRv2xaSaI18cEXHJECOql4rFHVlqnMyPa9aqQATYAwBu2CYuynDdXQbXdDx7A@vger.kernel.org
X-Gm-Message-State: AOJu0YzorLXEqz2AUehYBCKvtLsWQTZIOCs7aegbBUcXUyFoELzt1bF/
	tiBcNMKdqudWce2/EWlICTGduxk4ofx6In/WdSvbc7eNP0iv+vjioNHyovHOusVzmvjVRlSTnOA
	BP3YJoXx3Z/w0CoYQuO8CMDxxjAPsRUes6qkzaB43/fCDXhvXDtpWkqalFRIIOUpa
X-Gm-Gg: AR+sD12ny4I3SmNBU8peEKVDLpweEovudVxAN/iTXQBAi1LLAnc3xy/5rFvAmG75xyY
	/ECUthRIwBqv1INCbdHaT2J7SvDKBcsC4Mqefkay9WTzi6UxvWcn7zDvE7QsJqeUHaq+FGxAWm+
	g7hbc3Teh/5Au5xE1mj0gjcX32GTjtrhpJ/4joHNdSnu178bcvEpBlEvJo2pkZlKzVioKwx61ny
	vqMEgBMfsTVOitcDWyALyPqU/L/GLftjVpE3pjP5SidWSf3LrVziR7k1quNqGfd+nvt7PR0eC9B
	aWas07F14LxS98y1L8hp4UzI/awa6SNBWqUtcBLcezXRDDbGV7SPTPQe0HAWupQZLOo5SzSr6xF
	z4sN4jN5VFdrDUB/dSFlt6/HV92S2toaxLgJzNjttykTTsBED8ZCMqe3jSQLp/hT5hX6ws6aSxG
	In1N9QujoRgFRs41/WoZA=
X-Received: by 2002:a17:90b:3c8c:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-3933b91661emr4197314a91.11.1786693319738;
        Fri, 14 Aug 2026 00:41:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8c:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-3933b91661emr4197268a91.11.1786693319213;
        Fri, 14 Aug 2026 00:41:59 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea9a1301sm1542712a91.7.2026.08.14.00.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 00:41:58 -0700 (PDT)
Message-ID: <554fc371-f3cb-4c03-bb78-9fb5a06c2bc3@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:11:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] interconnect: qcom: Add Kuno interconnect provider
 driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-7-5e0ede4a0c72@oss.qualcomm.com>
 <anmbi_gXKslOw0bP@monoceros>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <anmbi_gXKslOw0bP@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K4MS2SWI c=1 sm=1 tr=0 ts=6a7ec6c8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qjwxEvNmO9gX62DwepMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfX6CNxLmUzoCCg
 ivyjM5k9u9t1oRJ/+X9GXoZF4N/e2/QLEZoEwq9u/2AZD3gSLihFYvM59Hta7c/KLLASIF2ClrV
 PP1vKlRHiRZKT8zNcfs2iMSK5DrPLGvPZDgSAjhwL1HPgoXSaw2PsVo18eyN3LCB8yXVNE8s21g
 SU6Cr0OswKt/aEkNtSc/GTthhH/OBkFZ76k0amVPJl+B76LskE6CuZhh6EtOV3z4u31FNO4k4lZ
 bcduLNxVilYYifbTNQaeJGRQVGC99p30Oz1S8GJpUbRBwUmSgmdlfCooY16cD8GLMHt3WMFoktl
 fATwMg30WljHG4Unhe6bMCcuXWGIOXWY70PjGDRrzsp6AIJ3XmWgZFn1jkSJJiRh4Trse5LMsPd
 jOd8KRITT5uWBR5JbMXX2ieJkRgO+AU5alYFiy2o25apvbHdWM8rl+8UlYOYGWUY6JIsg5EKAI4
 xScDw5HGw36P37oOlvw==
X-Proofpoint-GUID: J4HUBN4pDokfHuygJMmcbg7b54iemz7A
X-Proofpoint-ORIG-GUID: J4HUBN4pDokfHuygJMmcbg7b54iemz7A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfX924Sytucc4tG
 XH9PolPOVU0tww2rCw3HJ7UdXiPCPNl+5MM9u1JwD+08vB4ao1gQ69kn5DJ8o7JxCkD0sZGBGRg
 kA4Q4sooP0YpVeBYE/u2f6WJ8twDOKk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140059


On 8/10/2026 3:07 PM, Uwe Kleine-König wrote:
> Hello,
>
> On Sun, Aug 09, 2026 at 12:57:06PM +0530, Hardeep Sharma wrote:
>> +#include <linux/device.h>
>> +#include <linux/interconnect.h>
>> +#include <linux/interconnect-provider.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
> Please rely on <linux/platform_device.h> to provide a definition for
> struct device_id and drop <linux/mod_devicetable.h>. The latter will go
> away soon.
>
> Best regards
> Uwe

Thanks for review.

Done in v2 : 
https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/

Best Wishes
Hardeep Sharma

