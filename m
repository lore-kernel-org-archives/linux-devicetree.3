Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CF43AD52F
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 10:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481741; cv=pass; b=X2MRpxjcjxSltzYavrTtQJ4D2xQATFV144c7TVOmM8I5Sqy/WKykl5UitC9L2ndkyW8/P5+Wirm2X7LUpu6ogDMTz8pBuWQJ+M9Cvzm7UkBsbf2WCUiaFhFNYN33CMKPGugkduluKCpmPevzqdpsqSPIRONcXoqetiXIzZKXKhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481741; c=relaxed/simple;
	bh=wUkh0oXvBTOvNa1Z2LNjjV+ZPJCisVW7rSzyWPpb8dA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/0BSJ/b8WMafGDdIrFgXBEPyh/2RPUgj6QUyuRgtYN1Bnx9eTIc5Webm8xlM1+Okr2m4SNNqp7HyVjsjnffFqIrRXm3Sjd4jUKa23ZdxPXQ3Svyxe+OYPxczu5d6AYYEKD9p6SQpgT/na27eQXvfQIVOMNfaDmEczSdE5YODZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o54k4gsX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ajn4Eg8Z; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o54k4gsX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ajn4Eg8Z"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RPtK380692
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 10:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NSrIKtBce3EFR3hNVAccem09Es16mAoJgo2hKBQnq08=; b=o54k4gsXh69KXQXH
	D0AOIywx54NrVljTRshnXnlEzblmnmRJ9/ksQErW0IHJXwb4YQLTsKUaPMA3NF40
	uNEtUIjGIK9DJeLaktHfyyvHQJw7s8wKOgeAdgi0bICDne8RNkjeqB/T8pIULMTv
	gGEiAt81G4gyr1uoVZFdx0TaXU4RpLod9/LZxNZ2BGxnG63IDxXTbTHZemtUojU7
	ttPLrbf7XMMxnxzvDE+y5Oc/mdmzCevwI0VPi12VG+mh1KH9grGGQ95fOVwz6VW3
	PuJJ6WcUBFoKnsH+qVNmCn0BmdFVGE9S9zD6pxtebaMUs0C+8n3f5fBjA24p9edK
	FhJIxw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejewhrynb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 10:15:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8cec4d27d33so40077436d6.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 03:15:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780481739; cv=none;
        d=google.com; s=arc-20240605;
        b=LTptIPzF54bHiEmGjaswd+hD3em2FROLhF0oBL9AsXjiYb3g7h+k2sox3tgx7DaS7o
         U9jl3Dh/OLHO3/Wb8sKScoTjPkcUfOK1mzCsCHKJnlk43EAQuVjpCYcRDmj4/71hrhMR
         ENGmALYRFbGrtBbnNC+SLatTUrL7LQmfP00GyKVnfdRA4xNC3VBzUpxeiR/YM1a9L9/I
         yaOZvWdsIQizdZft7xQbgqwPToPEtN+M5FlsA7ypRgDXeyGwgAdQ2PVqrutvf2qt5Ezs
         2pz4U92TQTGuTZeH00Y/eD2P3xBi0szakQCFtuaTaKfIckrhcXXJfLojJiNr7zvszZHB
         eOmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NSrIKtBce3EFR3hNVAccem09Es16mAoJgo2hKBQnq08=;
        fh=nb+S7JoJeiM0X0QZqNhnNrqmimI/eWfewZlXVnpnfKg=;
        b=Ib7juciCR+iwCYMFPZB2iEvvRcRyHNsztte82mIwo3rutBEnDhkwZnAKbLISBUF8yB
         9nT4UsbelXhW3Zr43Q10mOZ65AAeX27iK6tgDWehhWEF2kK4eDkFNOHbiFfNl1/PrWXF
         uECcLq6WKN1U9rdZdf0UsdUhWb216Iv8FF0FCl+GwVijdaG8z/MUD4FNOlemRs7COvA6
         OZ3+T0IWNQ0OsCXaD61OU4+8ouBWbHlaFap7miEtsRO1G2jEMEbfhvFtcOv/o8dx0rMk
         djYnpcdchuSY5tD0X3NGUTScX5Zb3xB6XdpWfh1QfAYuy05zEwSgVJ8Kyz5v5RbuIcuD
         TQmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481739; x=1781086539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSrIKtBce3EFR3hNVAccem09Es16mAoJgo2hKBQnq08=;
        b=ajn4Eg8ZqfLzaMsW3dGX1hC9gSAqeWgAFA0vwqidWPPV3TqjlphWonbEiSzxX8f8Lf
         3XXolPDK3V8XPjqaLEqVTXQbaANBWzBcIQiwAIxLAhwQ1LBU9pvI14NtrAtXovDg7g6g
         XNDtfhVqBr2+jTLSbPAAea5V7F9eSLq4ib2KdOy0mTLJ09votkdZk47pc5yo7m4Dm702
         ne9HrEMkmaRWrnuX8H6tQLgZvm7YthlqA5COH+MwZeuX9PHR4A40iNzjZz/AWSVpVijf
         Y1dyzuU7bWsCCtUcfoNJ22NpRTH4FimaaUBO3VDgO6o1otfP4b+rZyXLx6cTxeowyhlt
         Mcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481739; x=1781086539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NSrIKtBce3EFR3hNVAccem09Es16mAoJgo2hKBQnq08=;
        b=ile5vWCXpBPKloA6WVLgMBUt8uIwuCkh0thHW+Fo/4YZtIRGlvsGFT8ZSfTlFL1ssC
         iGGP7Qz6LJqg0SMRkbuHn5fCAbLIateIlXfeo4dlBo3QLFSJHCfVKoudwjmoZ7TqLO3u
         EyWS2SRnRuc9tDQouQ5OnFsYi4Z4nBaM/X1XwzB6QHktyEKW8Z2fUHK5SZA6qvkcmA4h
         UjLC7D9uyXexn5C8CEGlkFL+ODvtopkBdUaDhKVv8yv3v/jGTa2HQP9mjZLfAzIAKAZr
         3f3yUuUZvmxX6PtzrH37EcyPDgAxKYoCqiqmVLcwNziG4xMntXY5+0hG570j6pqNXgVy
         RX6g==
X-Forwarded-Encrypted: i=1; AFNElJ+YeD91MHZdC71NUtx9jaVtvgfbS2J6hifdKwB1FORnDR2Erg9XbeNduDuVZK2MfKJRYQzr3TQMS4O8@vger.kernel.org
X-Gm-Message-State: AOJu0YwfbqRoBURRNKYwFEMmagHqb7XkQgzDet9FieQwP4P/3BBA9PSk
	4XvNCpGEmBmwP/fFXVhVwLi7zxYEv8rYMv2X9sAkpCGkO1NA8FJ9DB5d/lpVNMgzIYMCpJzj6na
	/RjeJzwGlpaUq2HK/S5/TU20DjHPt4BeLmL8b75/IB2de9evn8tfXBcA0jEZprUPJ7JA1Uhby4a
	4lktT7pY+4WD/vYRP5m1iIOby64Kstl77pbvuQBDg=
X-Gm-Gg: Acq92OF/lTMfA9FTSVSwDF3ZsCDTlIsbdYGUzM7KmMNxmjhdvZFUgICBeECK2YEPvlK
	zUp/lh4GLM42JXv2wftfrDMWfjiZ1O9e4jOcq/rjtwepTbwuMNd61Z1Ww8b1fQKSg9Gwepj3eyA
	fsajkcOfalzvAoN/h9f3OTTQsd7i4txCSIPJiEeoZuBNot6bMp75kRiK3WooOZ3+tHgdaN5mraf
	60uPZmNtdvRUhzz
X-Received: by 2002:a0c:f209:0:b0:8cc:e14:9594 with SMTP id 6a1803df08f44-8cecdcea7cdmr41693536d6.33.1780481738911;
        Wed, 03 Jun 2026 03:15:38 -0700 (PDT)
X-Received: by 2002:a0c:f209:0:b0:8cc:e14:9594 with SMTP id
 6a1803df08f44-8cecdcea7cdmr41693226d6.33.1780481738578; Wed, 03 Jun 2026
 03:15:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-add_rpmpd_shikra-v3-0-632838e2428a@oss.qualcomm.com>
In-Reply-To: <20260522-add_rpmpd_shikra-v3-0-632838e2428a@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:15:27 +0200
X-Gm-Features: AVHnY4Jr4nBrFjxFV4K-KhuoZ9lxednOew8GGPZciKNsnUGX9qTs9junH_jQQoc
Message-ID: <CAPx+jO-OUCe_uOH4h-0Y=cLFNGuQcCMY+09TMiXf_ppcPjYc-g@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] pmdomain: qcom: rpmpd: Add support for Shikra
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfX+BgfjMgLHHF9
 53Wo0fLUY7XNSNIDC1IFKC0FGLsmAShAnYQYx9taY55O26k3y4UlRDvyiBUC83AehHbjW2sD6xx
 xiBFLEGQhIp57QO8mEqcnHlzQ0o0zt9xdMhJJ/kon/+90b6EkUDGVuQK5R5gn9PcFq2HMLSLKgU
 qsrN0tF0NPNV2JQE/e3QyS9HDlmgAtziZHaNcZteGflBdIADPvoPFDPB1AQ4uKcYhi4Pu9c+CTM
 NlcelssqS6qqWyPrWXZxZzsntFUq10uHJ28fy8rhMnAzr7ZQXvqop43Gn16htDa4A2Z62EPVOGi
 nyH9eRZucbwAJedWBoWpjKn63sDdBY2SnpcvIngTLZS1APr5cfFqYbIo9MYUof2S75HtwHKgAhD
 beyg8bdyWR/MSKGLreoXFglZEz1LRwHisKaQRH0fs/tPYHWiHQhWrT+Cc37ZRkn5pE3PR6iVPh5
 rS8xBRZWbKa/nGn2PWQ==
X-Authority-Analysis: v=2.4 cv=Zewt8MVA c=1 sm=1 tr=0 ts=6a1ffecb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6hheQPWejXNNWGPLShYA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: P7ckGjC8a6qTfHY1oBMibg-oA1pifbVf
X-Proofpoint-ORIG-GUID: P7ckGjC8a6qTfHY1oBMibg-oA1pifbVf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030097

On Fri, May 22, 2026 at 10:21=E2=80=AFAM Rakesh Kota
<rakesh.kota@oss.qualcomm.com> wrote:
>
> Add rpmpd support for shikra Platform including RPM power domains.
>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Changes in v3:
> - Updated the subject for Cover-later and Patch2.
> - No changes in Patch1.
> - Link to v2: https://lore.kernel.org/r/20260514-add_rpmpd_shikra-v2-0-20=
bbd37592b0@oss.qualcomm.com
>
> Changes in v2:
> - Collected Reviewed-by tags.
> - reused SM6125 power domains as suggested by Konrad Dybcio.
> - Link to v1: https://lore.kernel.org/r/20260429-add_rpmpd_shikra-v1-0-fd=
ba28564380@oss.qualcomm.com
>
> ---
> Rakesh Kota (2):
>       dt-bindings: power: qcom,rpmpd: document the Shikra RPM Power Domai=
ns
>       pmdomain: qcom: rpmpd: Add Shikra RPM Power Domains
>
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  drivers/pmdomain/qcom/rpmpd.c                           | 7 +++++++
>  2 files changed, 8 insertions(+)
> ---
> base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
> change-id: 20260429-add_rpmpd_shikra-f57873b2fa7c
>
> Best regards,
> --
> Rakesh Kota <rakesh.kota@oss.qualcomm.com>
