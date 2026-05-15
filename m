Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DC43CFF6E
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841131; cv=none; b=U+H8PIquAC1EV2xcgYn7ZIUVLwTNqmbPF7DZJwTmcoZJ9VIoCnHV981HVckW4c94gLeDF5AXYtsMUKApObfW+R0TmJgbuU+xicV/nDIQSN49AkXv8kVHRNVEjitUQ5RKxqelzZwy1+C+K+aA4Q7dE44ZXEq4ktL/OJtOuyWWyyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841131; c=relaxed/simple;
	bh=LaqNkBsC1aPqGZMmd9r+EzaETwzayMdcQqzUGkAYZx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hzHYbkTneQ8lTYsdWWw1aJCAZ1/VhlY2VzKXva4u03mDLq9C+6fk0wkr2B2yKVv5De15xk+iZkq+mkhUZYGDvYm4rqAWh0t1rAz2+CIHtCGTHuJ8THrQKdQ5k1e1v5gZJjeZb/tzQfRNI6+NZvuh9WkgIirIsBaxl/PZ1DYOtAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJyvMM1M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EpjeT5Pq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJyvMM1M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EpjeT5Pq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5Eigl3795697
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7P5tIwdg/rLa4pPJy9f6dOdgWa9waugHsGuQ8JjtvLw=; b=JJyvMM1MhhPgRHma
	u6YC1THsAyKMKFu4juyXz8tWxEMCBJgCsohNlcAUWrvAUkG02qKj88x8jgrnAbuQ
	iAWc3YX9CD5AGjizW8WiR28hRDznmBZ1zxJb2UX1aa+2a9TkCvV9m4/dCvAhzXR8
	/85EG4NEuHqGZEbyKykf/wwGiDbMJfnQlD54A66ngowY+5apLcLnKWnqIe132gRs
	IYd0MQljCmNQbi1SpihvNQss9W565IMEwOsFr1kEMzZT8qQhPMjbgFh0YYqL6kWV
	WTxS/62TuERj34FMWWyyiPpWPIYuqO13qaklvmh96JiZoRmNGNKRSi8x+EVzAgjQ
	SgNmBQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1sttad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:32:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91056376aa0so58809685a.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778841128; x=1779445928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7P5tIwdg/rLa4pPJy9f6dOdgWa9waugHsGuQ8JjtvLw=;
        b=EpjeT5PqIGG6WpjFj1QJ1nv3oNk52EtUiMWpYXMeERodPxbnVan5m3FPMC3vaVHfOh
         kr5+yVBIQB0y1C9ygSxf5NupRxRyIJzNeWRRbFGtjCkZ3dCyVLWZvoTiMaSCRA1OKftn
         WfT0l3AoxddpTusC10wqqGZcpes7ezomEunB7KsJ0ICQwESRq07VPIBtk5zBueKlVFw6
         OQioOenOcXmpYH95lRssixxUkn0nRSneXKH43xKzY1kJZ92UyklwnwXgbhI3iHGXd7/n
         QlVJ2Wk6BRPNREOHPXiJYY4NM/RMQXMh0iusjMgK2dL0DES84BCNYmxoVvXyDSruAhzl
         eS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778841128; x=1779445928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7P5tIwdg/rLa4pPJy9f6dOdgWa9waugHsGuQ8JjtvLw=;
        b=TdzgkcEJsm15U5TU0ZxX/OnsTDsLiXk3fQCaWsZDJb4rG2N1yeFr+MkcJjcYhPTguk
         71vTgkFmou9qCP/r3n65zf1T0GNpN1jIqQZku2Vc4/Gf2HjZR+BopE/Lq2DALOq7Li/2
         72lFvFJvA34FbnF/Ux8mtu98nKF/Mmee4WFN77Go1qVSgCllNsljS1qxg+jLxSyP3RiI
         FQ0paoURhP2UOGDSfJM+mY57U97GB+cFsVvXEA3uF7GULcepl3d+L+OSYHoxee4Gy5do
         5slCGnxwTBy2GuFa5MHyP6mcibnv51lIZX1hf1U4yMcp+ZrPQ0Qaqty3eRoLzedlm4Ao
         BATw==
X-Forwarded-Encrypted: i=1; AFNElJ/AbEU5my91DzHYVG0KR+YcyOde3FkssDtVfRQrrxc5fc5LR/uuaFJRgVhnvYHqww3py9yuYG24kl28@vger.kernel.org
X-Gm-Message-State: AOJu0YzV/UEpAFKA2ZXRiXR6cAb5HmK3pyDme3N5ipxmZjDvr5gd6gGu
	VPV9BsisBQvHgMRKgWLhIwPrVuUBdBZHqpex91Qj1mbvtusRtG2BITXAgGluTNOAv3xfQJ1rT8U
	NGUqB42RUGy0qnEGWtW76VPrsow5CIis6vDKkZgQAZQnhgUgOb8pCqqyzxGXSJvhW
X-Gm-Gg: Acq92OHnIljk8ZcuRAXeqZDQCMgaadBRvX05suTTvgsETB9fNKnOn/THaQXHIAwnlnQ
	VwFn/jKILH7k+HhI/nWTZvpbB1mx/56QmPfZczTfcy1jAFkrEeYoNi5ZGuLiNTJnQzCC0Xi9fAq
	y82m0gO306VU9AnTuo4CBrkqcUI090xRp3miVQNRryjnws9MDVVJlUrL4FyMBMxEyfyifHsJclz
	hj5RQV/670vPNtf7/dcb943hDuHW/51FUEBxYlI/CmSfh3IIgUIUXX+rtuXUPpDzM2pqt96jwx0
	deFo7DzaTfJ9Hyj+Woo3ImafqmKdWH4COyinwwUyXoVCV9L6grk+oPvbYGbMdL59n1aIMLKK2S8
	Eh56i9cAVtYMET8bJ6Oep1qZ5Vqapf6JovCQtghTxWL4Z8k9pgRwdltoLpPGwDeM6HgHoYqbyEF
	//eo1hMeHOJm1TVg==
X-Received: by 2002:a05:620a:701b:b0:8d7:3f45:b95c with SMTP id af79cd13be357-911cd9560b9mr374352085a.2.1778841128198;
        Fri, 15 May 2026 03:32:08 -0700 (PDT)
X-Received: by 2002:a05:620a:701b:b0:8d7:3f45:b95c with SMTP id af79cd13be357-911cd9560b9mr374348485a.2.1778841127788;
        Fri, 15 May 2026 03:32:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b4069dsm1798256a12.1.2026.05.15.03.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:32:06 -0700 (PDT)
Message-ID: <7d84ca2a-9bbd-450e-a531-a9b2bc227cf2@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:32:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add Shikra pinctrl driver
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260512-shikra-pinctrl-v4-0-b93c3a2e4c08@oss.qualcomm.com>
 <20260512-shikra-pinctrl-v4-2-b93c3a2e4c08@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-shikra-pinctrl-v4-2-b93c3a2e4c08@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNiBTYWx0ZWRfX3qjDcHmu6TUO
 a222hoEFDaZiua4J61m86uwL8rt5EGwL4ErFOpzE01OdPf4lFBceFhhdrvn2LrKQ6Asz3x4Tifn
 jpHZvTiurHG2s1W6MNz2IFmcZE44ENg8FL4NZWtcfM2NAMO3DFoMo3YJgU6QtLQqemJe7VV13k1
 GWiEcggQoE6Oq+fC08iVdsVk+GwQOPPJ+x8hlVIjC8MqSQ2tE5/JYMMoWa2D+JOpg0kY8AHQ9zf
 2k869juAYMxAJJE+ds/UgkvB+14sCeqRhbmRXKxUNuo2UDKY+3gPyx1/q+XsE03wuCv9PbNeQuG
 wkuT4zaV79reKjnU/8+Bib4EI/XDEdYhSrA36NdZNXE1Q7GmtRK+fMiWH+bue1bPk3kUGixOLT4
 8L1tf1mH6kTJC2GCkchU6v2wrA8DKEw45auYjn1IY39lq2agp4S4DG3GX2KHAZvZHg/Mup+nkcB
 SnVbsv0fTkgrBkPrUeA==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a06f628 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=NVK-j4C6oOT1ijtQxEUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: t4K7KAnZQRIUmEe6e0B0NUh5_fR-hwCe
X-Proofpoint-ORIG-GUID: t4K7KAnZQRIUmEe6e0B0NUh5_fR-hwCe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150106

On 5/12/26 3:25 PM, Komal Bajaj wrote:
> Add pinctrl driver for TLMM block found in Shikra SoC.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
