Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17BB37F8A7
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811124; cv=none; b=fHYdo7vzDgDmkWfrorJzrfw1UiZac6aPfsjlDlAcrCL6r6Wptm5J1pBCXzgCqIXoAyvw+kNGez76KzSoqiHdlY9H4xmDNhD1ArKlFo8/qKXouHexBQCgx/6mAtAKw/XxmGhBEKZxunfWOtLJnUU5KBIb6rjHRbd3WIwZa0Xo3KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811124; c=relaxed/simple;
	bh=h97A33tgci7azywR6E2y9jr3oVS1b940BBla8v0DIXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OgowQLI8Z+zAyPtp1a/dTlAM5rhKOwHN6RTjHCnTTOlGvRwT3pfbzU2vxxOAj2kDrovfRMJq+93p1pFM5e0fco76HNASOPzg/RgyJZykjEsW8Ks/vZ9YyLbDZlJeJqgzS9XlUyn2Ag4GGIIYjrmVNQwP1JcKQxQjnzzJlVGRFV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Whmv28Zj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BjHz+qHy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Whmv28Zj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BjHz+qHy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CJgI1008539
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E6tpa3uGi7z+z4oBK4fUuFDNYQuQX0L5/yhDANu3P/M=; b=Whmv28ZjTyrUFq1P
	zQy0+p+3yW6cE6vcqJfLf3EYYrW8DzVL0E8FDRWuNIarhumnKg3mtRogy3AFM/So
	xChkGt2C2PowfnKmwIdBNvHKiheSeT4vfFMdf4QS1zrFdc16JgPmEd+PmHbNMTUZ
	GRC1KETyyjJNw9Ki3y+0GJGWoUYG17Srh1a07DSpjxa2hsAPaePBoBA0thElSfji
	uAXiihgKI/XryTcBkycYZd0VhGhfYenwTqLm1+vTUWcnCYJCRZXXlyPVRyJYdjoJ
	fW4Hqmn1cUwFcZODg2a+C2ICxuGljcrLqUVbWIJVcV5lIJr5LQGHBMXMaZjPJSCX
	SO44QA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw92hj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:18:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e68cbeb53so5829785a.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782811120; x=1783415920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E6tpa3uGi7z+z4oBK4fUuFDNYQuQX0L5/yhDANu3P/M=;
        b=BjHz+qHy2qz5GC8ex3a+kV+D1JaG+h6xirij+rGpbXzb/pFA7NPWmX6HCWessf/b+E
         fpMYQ6XPPsCIqmGgDGV8istm79sybaAAP6db0HueV/ADB+6B719WYG6WbDYoA3KixLlx
         64gXUNHsgrmxhMVFZ43dDKlGReXP/RkoEQO6H1HCXSwPiOMQlMz4ItmoIg+LGlsfipJT
         t3gFJuJ7ah8oayT2NdwpSdoL5DHa3/S8ptWyxBbC7ac4hntTw2GEd0Z1qtjHcFGEQ8iK
         MXf1H4iArTrtquFQvFl6MWgIFiOH49vQW6kMM5ZvvGbgB9wXM4NT789KKYSNv1GCWD2i
         F5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811120; x=1783415920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E6tpa3uGi7z+z4oBK4fUuFDNYQuQX0L5/yhDANu3P/M=;
        b=LYyedD7hxIq2x4RcgqncokTdcCKie6GIhwSPbB/ptSOizz+EVOuKrYAtdzg4JrdZWW
         FGvfiq29vgu+ysZsIy3CUSkRA1DAaLIZmxX+3lxklaEXYTvFqA7FvkkU/qiBVclg2JfC
         HRp44Vqao0hLUQt8iknc2d71EF/JN4jpposLlhJWNaYCNUoLBMz/SAAZzaCSv+RPMLri
         Vb59icDh0gcgsBxH5EQTha1tgSlssOVNE9ILnghaXmHQJq616W0UJVeTmQuB2P3hZw3G
         z66Gq2Z11x2SPNpcDWTSAEP34NzjoVx3Cm2jnrQnriugZs5Aqfd4JHCVcDs5e2Rsu8Dq
         0DYw==
X-Forwarded-Encrypted: i=1; AFNElJ8psTX3SroqhVxEqPdnvaguqho/JehLitLqLyJXsjjVqbzCZ0ZvIGQR1cCiIaM4MQxlBiUhNAWDNT8C@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+KsQ7hAqam3OtiqBL95f3wa7Ak5fnYAexVH/ynPsnQLPad2MV
	VHXe70FuuhejNUgewXQxku33+Fh2LnKegfbcxwtQdGdKLe/bgvBUXhs3YFbuXW410tfRB9I8YQV
	26FrtMNsFozmIWiSR0zCuGi9Ac2MeYhjv8KMlXIopcaUe5yxsQrDm9vdEPrhRfqME
X-Gm-Gg: AfdE7clJzlQdIkN6EQG2LUGH+8WDePbIeqXaCvGZOeOmjIrmsDSHe71YjHPoNY0Fi+7
	mrRc2iGYMfd4ljyotb5H70uPo12M35xg6K1A5RfBmH/M3c4vsQBJnLYRcsvLnf6K4rrpCBVhOuy
	dCScVH91hboubVPvLR7PC4omWecyRl6adf8AYGdEZjLWi5PkWEgVH5FbVFgiKTj/y9OAVjaCFZa
	19DbomzrfCwlX0Oon8DQD5kuBn851+WqwrIrw/n53Mf798yqNan0Rcm5GKWkZ9+9jT12DwofTks
	wTml51q4AjRrSyESCkMyIuyWH0k4J5ZXMBe8HCE5Wx9wpsDTGXX/UzRSS9ZTVttmIyOl045hZI3
	ulqQp27ALe9hfcjuyFjpk5rPZXpaoURNrN6I=
X-Received: by 2002:a05:620a:2589:b0:915:7c1a:1388 with SMTP id af79cd13be357-92e627e197cmr302559985a.5.1782811120361;
        Tue, 30 Jun 2026 02:18:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2589:b0:915:7c1a:1388 with SMTP id af79cd13be357-92e627e197cmr302557985a.5.1782811119964;
        Tue, 30 Jun 2026 02:18:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d1ef53sm91941666b.7.2026.06.30.02.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 02:18:39 -0700 (PDT)
Message-ID: <f9c24109-f480-440d-8658-84033fdcf9c0@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 11:18:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel
 DT node
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260630042229.277799-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260630042229.277799-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX1dIRvNmJPXm2
 X2hnMW184IqocnlY1G5DgI1amj3dTmaWt4laB4ZsqyBSk1BFiRIZcvX3MTn6M0iNPc1jwYOZpc7
 W9j0ymlCxNvB/5ooBdTiLCRMiuFcHDI=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4389f0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=IGLo0CcfMTApPXQeF_8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: MdJTBPDAJ-myM4nRQqGEjmF2gsID2H87
X-Proofpoint-ORIG-GUID: MdJTBPDAJ-myM4nRQqGEjmF2gsID2H87
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX3jTQ6zAd3nCk
 XRb0Hx3v8zyQjIXEwr7Ih0gcfADfWMgrz8Z3Vg42hyFsZGoVgIe4x0gvNLvBe/fQ+eAMcISsEji
 C1IEEWWvc3bLxOdkn061j7BRnq5rmkH7noVh8QT1jDZLDRhNvakzM87iKBgxr1WKln7AJawI1jh
 52uwjgCsVrXCImj2Fc0Zd8bywb7/XZJwFQvTvnnilEGGfmJtuMlVLuaboNsnZKNCiKM3c3crczC
 CmVSaCFbGC9Qpu7f0hfSHIweK3VOCZeez21+18w4JB2Ga601yOX0OsD9guXLaGAlbhDjANahFGU
 rCOtfv4s8BNF6f8ERbEZXIMrdgxCpYgJlcRaUl/FZ/lqR+Y5AEdC1AxU8j5u36vpH00YSrFx4Bx
 ggG6MyGslJJe7Ox8oR6UnhYRU0zrSAGLtjtV6vbVi6nAHSnPbbj5FmRi4Bg0g4vhxK+7HvDRYXV
 TkbwYew/XaoM6uuNtvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300083

On 6/30/26 6:22 AM, Pengyu Luo wrote:
> DSI panel driver have been added for a while, so add the DT node to
> enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the DSDT
> describes the wrong, no impact after manual disabling these wrong
> supplies.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---

[...]


> @@ -616,6 +663,9 @@ touchscreen@4f {
>  		hid-descr-addr = <0x1>;
>  		interrupts-extended = <&tlmm 175 IRQ_TYPE_LEVEL_LOW>;
>  
> +		/* TODO: set post-reset-deassert-delay-ms */
> +		panel = <&panel>;

So.. are you going to add it?

Konrad
