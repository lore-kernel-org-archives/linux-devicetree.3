Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37604908D4
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992032; cv=none; b=d9iG9f01suXkCGf8al3POJHtGOwQHggSr1FtTclyWRQ2rz5D0PsrWUpeCk/32YXwh2vUyvsInb0k9CRwlDIHFJ1PItKuv7mZ/NgMdNvoJIUkmxica1Ec8hvwkUmwMhCNGmpPhqv6smwlXroNmGqcfQ7tSdW3acJ2/IYZx+mlh8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992032; c=relaxed/simple;
	bh=28oo7UN8FZcgTrgLbSVyQctwz3dUuWC1rnC1t2Tx1Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PyrVgWmTCEe1MshU65a9Z48isW11IKNEER/q5nwOsGiuXvBIeKQEFvVuaOVDdAu/GpsSO/dyUpJwSzBwqrwfY9paJXJmJEbKJTwRgMrfD4w199sdI08LynSAZJ+K64gg7x3n8EuT4hbbAJKG4EDbMeYSeBncoWYaf5fAJxHBeWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eJcKXguN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TgONr9aP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eJcKXguN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TgONr9aP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdtil1218082
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5hds0TdhjMv2BFxmZw8drlMG
	gZASdjiaOg7eKPpN1Ss=; b=eJcKXguNAJYFDldZqwNECB0yy45dEqxPmprFFhyw
	05fQbLK9cBtdu32Q35kGSJOVDproPqldruARFjP+oiTFJB/oxDp12TX4vdCmlFOb
	ga9TNKnrJbTB9iNFbSF72HMTuh4JJMLOY2+DUGiRCAHFiNtAeeadV6Df6CZfCdHC
	S3YHP/edD3Me1L+AvcBJCGEmSbRci031VMJnvroWxyO3RVH/vWQRuIf0KER5unpg
	MdnpO5WTNE07qZIjbbWjSCCvDTJsQFawjBhK6UHrw9kkOnvR8B5QC4aRhQQWy7g7
	v0zXvjhWfMc3HaZuOs7Q3xSL3Dupy7gEp4xW2kkzRI2gKw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu011946m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:00:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939062ecda9so471781685a.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 05:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992029; x=1790596829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5hds0TdhjMv2BFxmZw8drlMGgZASdjiaOg7eKPpN1Ss=;
        b=TgONr9aPiz33ybgKkXP3NLBj2folFfhIDmCG2Kk3iYC/c9yjT4GG91YSqh5c/Phm/k
         FojbWvAgg0ALdxqhDMXUNI3SuVMr0lKNtj5m5pQIUUklpXSnO5hQSB7f6//UjEjGSU42
         TTjRiPIlufRE0/hNzoq3xf8M740PEUVk6mZtEntsEMQQ4mG8KX2QBe59NW5L/7kiQJfs
         h03W+R6RlnE+eQ1BTQzupgkN7MVflART9j8W5ppW0DcQD6wgdyGbbjjbMN5N7+rAjUCu
         SVvpINfg8PRoRLf2hENql+yMFvSbpVr2UDIbPLPYmTuhvQzh262mk+cZ+m6lYSBbzyX6
         Zz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992029; x=1790596829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5hds0TdhjMv2BFxmZw8drlMGgZASdjiaOg7eKPpN1Ss=;
        b=A8Hfd7C+aj5OECf4HStfzeGpD1OzLOLjmhhq8YZkT1m2lZS6BdSPKpQKZQPqdFS3Ed
         eYBDT5yiJPgIiE+FAX0swkyTYKtNcbgySswqTZKdFmnn6CHXwAn9U+/rjHC11MKUydSp
         hYnZPSp84ev9BG0rHKGtEEVlEUHlTrQL0Ze8pSUOVZ+3iU1Fr3qEgU+GN4sROeGHcINx
         ZoiTpnPm4Sjh2KXlIGjH2S7qgJ7bFrXrkOZX8gyPhHe4ia0GaxsN3/aq/kgtT0jepJt2
         wUbhZYaXe7Gr85owhC5y5qq9bjvvFK8nntAxt1bQK6EMqKmMELBnkOVzpzH6KBvpshpt
         JgfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpaQcfLTYfHJ8U6O2LSVJApQ3h7Vrhi6Zc1r1adyu9OJIdlBzqxgOjOsUOGEsMV7nTGuCb+EgOVmcF@vger.kernel.org
X-Gm-Message-State: AFuF++nwEbiVxqc2hxx48HN15tYnYbmkTsWxElH9vrDaUjdjyYEmPQ58
	hVVf7keiPyQs6f3DVaRlbebSynVfUBMEahAzRq80ADqWQFS585k4qK/oXtK3N+zH7Ve34yw3t8K
	z6EWGmStgHFn/PdsFH6RTOeX+hypzfl0dX6ZiAR19jqwfxU5nvBIaxShuaJmarpod
X-Gm-Gg: AYBFou14bShNQ6060OxqYozZzSTnNP54hH3uJBtYto30H1YwrErCOOyWSrjf+FjN15z
	V5yZsu2wQ8/cWBxW1gf9AnUaN4r0rHhzWNpYqKCz5bDGNA27YrsOxBkpM/1NJiQCOWWZbh2TCc+
	NbID2K67YL70kJatAzjaWrMYbLQcpfgKDwstEiRHJdVtPyDUVlMg01TbVr+EtfTYddvWCf41ArI
	pNpQ49QEpAklNrBV6EQvqoqdQAWnk15E7iogtuTkoMi4MdXqDZUYDlAg5HCWHSgjG5tcojzw2uT
	Vb6d+MR9MYIxV4zwzFa3bn9mzdeO8YOpMnQ0cduyHXK90rOWBa0juhDLhDmJ1J95n0rm3MtNQG6
	39mQSO2v19SVElg==
X-Received: by 2002:a05:620a:460f:b0:93b:d79a:c45f with SMTP id af79cd13be357-93c15ea1ef8mr20043985a.55.1789992028772;
        Mon, 21 Sep 2026 05:00:28 -0700 (PDT)
X-Received: by 2002:a05:620a:460f:b0:93b:d79a:c45f with SMTP id af79cd13be357-93c15ea1ef8mr20035385a.55.1789992028117;
        Mon, 21 Sep 2026 05:00:28 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724422790sm21382516f8f.5.2026.09.21.05.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:00:26 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:00:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/3] drm/panel-edp: add CSOT MNE007QB1-1 entry
Message-ID: <wgj5qfghiglcwzg5ouhjr4hv7mgsb5zlerwrmouq4kt2o3ywsl@wkt7trsfjygh>
References: <20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918120515.595782-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918120515.595782-3-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: KfDd4MeinJ3Ay2VmBv9YDzVanvA2zA4M
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab11c5d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-iAOE1hZoH9ZQyiuzH4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfX2TLqJVse+wNl
 fiHfOq4Dr8ykAtBsezN+VbNco/WPhNn76D05CyVtTEmBAVLUDxCAShmasnzu91BnmIzqxI/gSLk
 h0beYDaL5HYwu2cMN8619JWdhqN3UOHiMhOD9tCBfL8zzoaBVI0Ch3rkeIvpOVufeif+eS5d6Lm
 OqrQuWrTOHWhWscSV8oOAFjdlmSUDxKMPvpcZA/FQshHuE766m4reXpoK4Fmz6CUcFIT4v2a2wD
 j+aig3inZoIsmh6xJi9hhKewamrASWlFMCAPCGlUqs92n6LN/kJKFKJmQ+dsh41ohvdGF6CHimn
 7Onnz2oepzRyhPDui4qbFTWI3nQmMNavg4+/KjYhX4DWZ1Mk6fezlqzPnOPmER1P0XnPwmzURQM
 RLb6w4BIp26lRjqf7i9NAZnm7uDkMYUz2oJWvsFS1H0Tlp/tBOKPHINjAtslLBftdagIRgqhltq
 XeRBTk9uUprk1bl970g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfXxLnprz4SHvoj
 QQ74elE8HFJlscEK/37EE7K3dOaFOOd7YgJsn45T6rd6I7NuMYZLnL3q3adO8pzXKOB+YOOfaaw
 epISI0yhcZ+c/uMLpzreyJDQq4D01MY=
X-Proofpoint-ORIG-GUID: KfDd4MeinJ3Ay2VmBv9YDzVanvA2zA4M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210174

On 26-09-18 13:05:14, Srinivas Kandagatla wrote:
> 14" 1920x1200 IPS panel used on Lenovo ThinkPad T14s Gen 7 (Mahua).
> The panel identifies as CSW 0x1465 over eDP AUX and is not in
> edp_panels[] today, so probe falls back to conservative timings.
> 
> EDID, read over the panel's DP AUX DDC bus:
> 
>   00 ff ff ff ff ff ff 00 0e 77 65 14 00 00 00 00
>   00 23 01 04 a5 1e 13 78 07 37 3a a3 55 4d 9c 25
>   0c 50 55 00 00 00 01 01 01 01 01 01 01 01 01 01
>   01 01 01 01 01 01 35 3c 80 a0 70 b0 23 40 30 20
>   66 00 2d bc 10 00 00 18 00 00 00 fd 00 1e 3c 4a
>   4a 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
>   53 4f 54 20 54 33 0a 20 20 20 20 20 00 00 00 fc
>   00 4d 4e 45 30 30 37 51 42 31 2d 31 0a 20 01 6a
> 
>   70 20 79 02 00 20 00 0c 40 8b f6 65 14 00 00 00
>   00 00 19 00 21 00 1d c8 0b 5d 07 80 07 b0 04 00
>   3d 7a 54 cc 94 99 66 52 0f 02 35 54 00 80 00 80
>   00 80 12 78 26 00 09 02 00 00 00 00 00 01 00 00
>   22 00 14 0f 5a 02 05 7f 07 9f 00 2f 00 1f 00 af
>   04 22 00 05 00 05 00 81 00 15 74 1a 00 00 03 51
>   1e 3c 00 00 00 00 00 00 3c 00 00 00 00 8d 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 90
> 
>   Manufacturer: CSW
>   Model: 0x1465
>   Made in: 2025
>   Display Product Name: 'MNE007QB1-1'
>   ASCII String: 'CSOT T3'
>   DTD 1: 1920x1200 60.006199 Hz 16:10 (302 mm x 189 mm)
> 
> Datasheet was not available, so timings are not datasheet-derived.
> The delay_200_500_e50 preset matches the sibling CSOT MNE007QB/QS
> entries already in the file.
> 
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
