Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF1733C513
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784700998; cv=none; b=EQH6RKPEiYlVRF71T+TJtLXOE3gyAwZLwNkSSZWmTCGyKNFtGNmXPuwhNzNVMhGfksY6ytn0aW/pSVrOx0SQx3HO9DyghDkld98cAp2sVvmcVNyoVRKS3P4c3l4iHBZ25HPXjzfzvtVMRv5KjhjtyMJMrjb5DXBev84CBTf1DsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784700998; c=relaxed/simple;
	bh=2F8uL+lr/TvDZ6PebRzFyOpFLYORBeIAa6JHLuArtkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bAzjFxrWKYYQFwrjWQH4E9JYgx9/1zzHP9Cz/4n2nvpMVEtajeYONo/ZfKpHeBUxs/IUKCvksVM+tsdsWhRjBIWVsL9kF/dQZKeI727lOPK94u/Op8RsKo4Gmh2VOuP1A1vRUf1BVaLbYLV9skZpev7ka1lxbz3tuGgjdxdcvD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+dZq3nM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OQn92M56; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+dZq3nM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQn92M56"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53n3Z3917721
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/xSQQZylPlsd1bDeInrNUJPeUxq69DMttpsYNIVzXo=; b=E+dZq3nMzJIc+LyK
	I4Cnq/b0ZK8EW3GL5qmSzy3lZRCegMhIMp5n7ufhEdMOMjOfVv74bvDni0QrI2rW
	cBQMIiLZsArH1XzxtWfBXCrhDZUcjxKhJs7EPzmlduCHyUIA3AZMm+FGV06hZypA
	hy39djbCoZvyP9YQ3TztHzzheLHUdwiGMQcgI5Mv4pAzBnSV44L6tH4YuO1QASzP
	54f8tlbx1+thgC9Wio/ruwf2RY/1lzcocX2qJ4rji0WreAvDO+w7spT8++ki9OSS
	H39FuQw7+706cLHGozktXqDjtyMX2+1T6Ulu5ksfNP3O6DS8ZoKBBZgVjFC8F5hp
	KytOiw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6aaf94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:16:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d7886cdso136911751cf.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784700995; x=1785305795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T/xSQQZylPlsd1bDeInrNUJPeUxq69DMttpsYNIVzXo=;
        b=OQn92M56y8ExoQ4cU96KWUO4kYZz9BDtqf7Avy/vNcuD1RvbyL/Jy64Skfym8xt00t
         gmW0meNRsi1qsg/Nnc5nZ8SGEeTVsKHVuJkzeLqYtwNexPoe40agMGDee+/uIJ/wlE4K
         d0eQm0x1QdVDaTZ858ih6On8p8fR9T8971Ng6KpyB5RTe1QndRx72pW7M81BUMCW/Qc7
         b6Us3a5ACGKpudrtXsfRCKIRMBQcLhukynkzTiVwpqpjUWJOwEXe4wIm3v38eSa/vHuJ
         i2B/Qv5xE0Ij7LPBCyrgV2y6ebfeFtohvM+tGhbg+bL2yKTDNopGHqJ2MBp2FUyfuSdF
         Rrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784700995; x=1785305795;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/xSQQZylPlsd1bDeInrNUJPeUxq69DMttpsYNIVzXo=;
        b=oXGmtodA+37f1IqjkMG/a4eP8DMUcxyZBo84zjA4SlSY4t/7hUdwInT/KemkCxIiRp
         G2kLkkIgM1aj+tL6hXlNpqZxgWTEJ2BD/75Mi+iFcNW/RxCEFnkg/b6ELSRe6I0t40tk
         TWQrBk1e8gPqVmX22cWxDMK2mCGERe17sDHVHofpFwPg4fzP3Wc+VCas2GWjY2BSVRpZ
         RaHoKpsZ7dKouvhrhsR/HtiR9hjGvEs/8N4dF0Z8FqjhjVWAK+WaB18pABkd3c2mJwC4
         AqZNAGAc68tlAzzAQMlhTF9A9f6JbYMUMv19ZN3zO67uUyseSnK8AZqvu/2niVqJ7ykb
         OLpA==
X-Forwarded-Encrypted: i=1; AHgh+RpXR1gGE1QJv9ag5ywucw1fUZgSIbaVQclnRJbXiBc+0b9Q2Nbr7yUPkGxs+LZR2dqLwsQl1Q7Jf14/@vger.kernel.org
X-Gm-Message-State: AOJu0YxLgbXHfR1M7GcXqmUPgUaAPU89970Bolo8+iY3Ev3a7HgEjTCs
	hsiqQViX+nT00cuXiRpnuk0yDSs570wcy4O9NNJWky9PPTL3x9Yc7Lge/d5lBsNML9urO5tkWLf
	mFcrGKqVL0rdmy5DLSxNal+un5mcAaldQaJ0w+upo2MvdNtduilNSBNpaRodaYWzi
X-Gm-Gg: AR+sD13rEi4HRZBfOvlQKBZmWvBwTaFuULVNoPb4IKrvt2wakYjPkkDkJLYFOW7Q3pS
	q8AV9ABrSHEHYlyPZ8F0pyvom763Ax3/Nz6uj9XeIzA9QpviOgL8YNkJFfs3l403BpbiqBYaG2A
	IKWZAOjt96fkBlffOBxFiReRX/sshO0Cycy6stWVTjH89MgLLs6ytAa+5WoT12zg2zzjvwgT2UJ
	Uo6/MX2V/fgDQToc9N/2EaqhD9jKfyXZuE7exfYabl5Bg9ez6HO6UPTOq2fop72hJPN9dCoOkEi
	XznRP93BSg9YjZUd4K47cKZ6wE+86EzTJiB3RFN7KWEC+xW+lpGiSuePAKnk+9pISRfbfTxOkPq
	41fo4GQ27TrYfyDgbLljQROajSFvt0g==
X-Received: by 2002:ac8:5713:0:b0:51b:ef9c:573c with SMTP id d75a77b69052e-5213c7e5333mr217865961cf.50.1784700994678;
        Tue, 21 Jul 2026 23:16:34 -0700 (PDT)
X-Received: by 2002:ac8:5713:0:b0:51b:ef9c:573c with SMTP id d75a77b69052e-5213c7e5333mr217865781cf.50.1784700994321;
        Tue, 21 Jul 2026 23:16:34 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4aae16sm44397095e9.0.2026.07.21.23.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 23:16:33 -0700 (PDT)
Message-ID: <3973cfc9-4fd5-4b42-8be8-b871b225ad91@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 08:16:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] dt-bindings: arm: qcom-soc: Validate nodes with
 fallbacks
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260721-dt-bindings-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com>
 <20260721-dt-bindings-qcom-soc-naming-v3-3-8f275c9d3412@oss.qualcomm.com>
 <20260721155830.741EC1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721155830.741EC1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1NSBTYWx0ZWRfX13GfMp1tbGea
 he6ZEo2cC/S31TzyrgwZod5YbbiQn520ZTXzrPPmMgB1czuyg/wlI5ET0RPavoBvZr6HmTumNAn
 z67zmw0KH1hxlV7iwUKcrjI6HGvUdajbCOaoIwx1Mxjtn4Ai/tg8dSAIvoQ+PW+8iIbeJtKQpDr
 n7Sy7S2je32h0pyWAqtH3BAXAuqzMyAydkVRT0sfVBW7hI28J4m81W1NVskiSK3eM1dAj9say3V
 tUInwzhYeuViecXR0e3EmUsnDyKrRA62OHrWzkYyBXe1QDnxb0EuqTcttgNaq+OIc9fJ88gsBKX
 r95DCPwAfHhx0a/Nl7QpelDhk/CddJs8fzqTUSlaet+FMTu5P4PB0dJsARoggvUI88VOiFTr7DP
 7hLxPDTYMii1d0wSD7aSdX9SSLEV7hHqYaxKLXp1o9YB+FBf/VfrkQtDLFBWbCS2BHMqOpcMeGK
 7WGSqAjWABQoA+6epiQ==
X-Proofpoint-GUID: Zrr-x7Od3xmxGs6AGcdLjIj-ES1xCNA7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1NSBTYWx0ZWRfX0OnsymJ2/mAR
 gLRZmHmnvAnSkjTSfw661Y+eP/AvrK/TpyTys93XbHjMojuuNfLPl/Ed0bwnTqWAoAhgB5MEDGv
 0FHjEq+7yoSViEAYkSeeh1MSKSgL4tA=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a606043 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tF9WG-mXdnh_oyKL0pEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Zrr-x7Od3xmxGs6AGcdLjIj-ES1xCNA7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220055

On 21/07/2026 17:58, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The commit modifies a regex pattern despite the commit message explicitly claiming no patterns were changed.
> --
> 
> --- Patch [3]: [PATCH v3 3/4] dt-bindings: arm: qcom-soc: Validate nodes with fallbacks ---
> commit 5d9830a03b3532641c37f4db55bf3e194063f0c9
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dt-bindings: arm: qcom-soc: Validate nodes with fallbacks
> 
> The schema checking for expected naming patterns for SoC IP block nodes
> was incomplete and was checking only nodes with single compatible. This
> commit changes select to contains so that nodes having at least one matching
> compatible will be evaluated.
> 
>>     These two above are the only functional changes in this commit and the
>>     rest of the diff is indentation change.  None of the patterns are
>>     changed (neither in "Preferred naming style" group nor in "Legacy
>>     namings"), none of the compatibles are affected.
> 
> [Severity: Medium]
> The commit message states that none of the patterns are changed, but the
> diff below shows the regex pattern for the codenames variant was modified to
> end with "-.+$" instead of "-.*$".

Good point. I forgot I changed that and then did not see it when
comparing the lines.



Best regards,
Krzysztof
