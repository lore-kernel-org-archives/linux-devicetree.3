Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DA32EA481
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 08:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778230079; cv=none; b=u1y2PtlRuuakriVUImXIYF+Adh6HVGjkwHXCrzsFlaNCPgbCo1iMz2cUOG50cBhvDNnBgE1E/OtNxPu4DhmyZNkR9k2GhRKwFr3rU6k3ZgLwUjUViDSwN9BA+QSzmYx8/olR6HKSK3OSl2pIIns5tRQH+7o4p7eTa3SQ92gm7vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778230079; c=relaxed/simple;
	bh=Pyw20vUTLDkdwfwf+/4R/pq/83GquxoH5fBoAfkz0bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vBWGkoFTwStr3UOirnjGGBr5uPf24gN06ILAZVY0/j8DXRRahYqwouPq2X6SbEtYHHjAdYKeUZ90bnCd5iVp+jkdBKI2/d0pDbLB3Wlj2Vsh2yc6wvBL75J5BlWdFLxZMxUgmMH4HvT6roapeePa/K1UuzOwMM9gsMcTEiVcASw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XabZ4duL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d4JhIli0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XabZ4duL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d4JhIli0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485sihM4069586
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 08:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	InPAKn66aqiCxP/NuARC91sQ4atWXO5vXfq8uLfsK4I=; b=XabZ4duLFwxhsgel
	7a/+TtJaXXaR3qLpKpZHMHnI1Fjie81iftdEc+JHRnFVDLy1VboDn8ka7dgWcbcQ
	01OsQgCWR1e48LbJyf2haiHshDOuS5KT7fIVt3zyJVhIu0iPEYLglRyyR6MuH5a6
	z7Ev28gv7kXtmuW9qlAkFgyq1TIu8USokioLZuaqB7eoVmgag6QdFsY2zUR9Fzlt
	YSLtccQ/y3N9V0l2fPBUkhkChhy8iLQlP2x23hTUY0x+ZxL4QI3TY1J7EIXbch8O
	WCywekve74601mzNCZ2RnpJHP5B97mfU0lUbaXPsKMrp4mC2g2TDdQZlmbG4RbnG
	bkTRfw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e12sp23ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 08:47:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ecac841eecso34615485a.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 01:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778230077; x=1778834877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=InPAKn66aqiCxP/NuARC91sQ4atWXO5vXfq8uLfsK4I=;
        b=d4JhIli0iBSrJqo+2TrWyINicTuWnVZC1T6DawOglAOpOqmXx9J0tkFZ+SjQhYIw4p
         G1UhDWHCiN+5k2rBDGJvIm+bmh15cnQilM98qDO1LbAAf54Act3olW6I8aiCf9jeCVbN
         r3NWWq7xwrtkhq/2Er6hTfDz6NjJxs7HRlrqArAjHS79VnsksKPa/x54t52E6ejZ6WeZ
         WOIunMI36oqtVPWXQsGtvz8z+IAhet4lHo/ZtN39nMvujNu4yJ69e04SLPGMPybZfbt5
         XIoRkB7Q6Sl2txdgooPDofz6syEI39WLsKOlSim4l8Kms7M9rMAWD7KB1CBJ4nsxVbFT
         wSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778230077; x=1778834877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InPAKn66aqiCxP/NuARC91sQ4atWXO5vXfq8uLfsK4I=;
        b=IuoZi2dsjgvqAIEWUe3bHpoNT38cLQj+tt7tr8o2FRWELMDdKONHBgtinLlPR8p0ty
         PZmwAPO4w+tKfNhz2aiBaO7MH7zJt6rlfMp1qQE45FE/ABlRh9PAPI6S3J74OlelUZpD
         LzfojBiviHoBovUw9umfjCP38IcBqP5DGElpVbGk6QYkiyDpFJDqizJPaK1M85oJqCvH
         5YKC0viKB7q1FxNFoRETBNfEgHyEUQH1d/XW0ogTjq+r3K6q+gJP5TQyYUjPNLRDUE4c
         2FaTHx+JAgHwg0Xt4gWbTBqT/1z7Nyk861kfxJJe2wVViZV62X1SOnZfw6qNnXMo6xbo
         ETCg==
X-Forwarded-Encrypted: i=1; AFNElJ+wIsMkQUeCDxi9AnQPPRxGJQpL+WgLSxlPNp0vT4scDo0wMMcHOz7JG1sOO7FzHKScTk5E+NPsgRKU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9OUYdnc/zKTXN0ySEl6jv5epOz9rJqA7doyVBwuW2VQaOmoLI
	P+oT6KPND+TIr6A6tnDjBld3ym8OMIJmS0yNqzDe59u5q/5dA+DKdwhg6A6K9g5bCdKdlXv4GOk
	mfPD/o7UQhISbYlz5xvxRUblc+6TD83WzCD3z1sXL960/vG374BTu2c+r2tM421zn
X-Gm-Gg: AeBDieuB+vfK018pmT45hiNnW3D5jZJEkUNzmvheQSyBcp8878BWpWYhPr/2tq3WV2m
	fzuf9eJaNFrUbAoU2OJGvVuWKPnhVXVlhun/EHonL3pxH53HfwaGK6znnNIEtwBMD/z2MebOMYk
	kKscCIo0HX8jVPSf67IZKTFKLAJEZl28L9lKB3TEEN/DoFwQC4pRQnXC5xG/GDGltLGIIZ6qA6p
	Zxr5quAW+4v+ph07NEhRVqe5Lx2i74qLV4q61iucfJt6zdiETL/hJ8/KFLyGD6ZHQqWQ3k4mN0+
	ILzFRT0eVkcrZULOzJXV2Ws/PjJHikwj0asRHHxoYrnKJa4Tsdz6kn4nyfqXrfZNvXD2K/qHicj
	5MiaZODjFfzRKU/QxIPY+oyzW/mc1GwfLUEyMS1GG0BzXdP9e5OBg9NsEYe/D/RxyXtY24Y36xQ
	852Sw=
X-Received: by 2002:a05:620a:4095:b0:8f0:7516:da94 with SMTP id af79cd13be357-9051b259487mr1096400285a.1.1778230077058;
        Fri, 08 May 2026 01:47:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4095:b0:8f0:7516:da94 with SMTP id af79cd13be357-9051b259487mr1096399485a.1.1778230076584;
        Fri, 08 May 2026 01:47:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b8a939sm402893a12.13.2026.05.08.01.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 01:47:54 -0700 (PDT)
Message-ID: <a248ac04-38bb-4251-91d6-d99c21e3f3d0@oss.qualcomm.com>
Date: Fri, 8 May 2026 10:47:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: qcom: spmi-gpio: Add PM8010 GPIO support
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        David Collins
 <david.collins@oss.qualcomm.com>,
        kamal.wadhwa@oss.qualcomm.com, kernel@oss.qualcomm.com
References: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
 <20260507-pm8010_gpio-v1-2-3bce9da8d2ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-pm8010_gpio-v1-2-3bce9da8d2ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA4OSBTYWx0ZWRfXxsBFiYf+pIg9
 zm6FE/XG412FUXl19j/z4+xdk68Vitcd7BOqE12RV1z1AOuvGrfB6Tp6O2o+tIXfMWMY+Ub/eIf
 /SgnJISfSeuQDyAUOz0++kSKiM772+AgUPz6Gtkfq/bKuQZzzt2fU1LNXInqRb1GXTZ0tsFMVpu
 gs5DSD9cpCLWTooLlYe9Ls8fMPLP+QuVF72ra324P8QHni/lTuggNqwInBh/PuvXG7eVrIl3xwg
 n3uH1zHQQqrpOmtG2hvrWlShVz3Ddc3ZJRa5KejRWcEYcKLTbL32i/Hdanq/qYQPNo7igvl1YzA
 MQZvVTwYfQfePvq8nEuWCJMC+Y5gnVJZWg04NyFa9HduTfNcqUS+JEgj7ubun+m06KKLGjdAzTX
 rTcyYC8lPL4CLFCfy1MhFwCpIBmLCVvmc84bh0QMXIPbm9rhD/A5qTkwHdMwVHxVdeUo1cAWFc8
 ASj05Kb1Gu54ZiAIQCw==
X-Proofpoint-ORIG-GUID: tnBftQb4WE6er1H_wBChMOxP6tn_g8uX
X-Authority-Analysis: v=2.4 cv=Wu4b99fv c=1 sm=1 tr=0 ts=69fda33d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=WZlt3gIzTKT3u8vpA5YA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: tnBftQb4WE6er1H_wBChMOxP6tn_g8uX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080089

On 5/8/26 7:34 AM, Fenglin Wu wrote:
> Add PM8010 GPIO support with its compatible string and match data.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
