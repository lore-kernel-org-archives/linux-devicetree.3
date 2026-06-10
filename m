Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1750C3EAC61
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 10:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087631; cv=none; b=ARiRPBnaIrbkKzHeFIvW1i6uX0UAIIb/23AowceDEccLeX9EjwoAUon5XNhtTGWThn527JLi9RRZpDO5lbWjf2Ph/Mtbp8KamULyMK7fn264OUL9A910DNADPts7HOIPgTqKuwAdBESh35TiJHOL9v2fS0OjNjqXe8JoxX5Zu78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087631; c=relaxed/simple;
	bh=yNvme85oo3d4KkJuNkf68y0a7Zc+qE604sjJhFN7+zQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VhtMlUA1GsEUBeYy95mLBIqdCz8TnUumxYNAzrcD+ty9UmloKcXZbOvYxzQMpMPVrBL+xDqk4EFV4a5I+RwjHoPjxylma2Jd4rE1UXbe1bxlnyN4JIMwU0OGufe8nLYyYCFnTms3iZDXQAqsMG2k7tvM4/2OBemv9KO8GxiYWlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxaUp2lP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WKtQslUA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxaUp2lP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WKtQslUA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7inM9997558
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 10:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/2WnocrnpuSiCW6MaX5GTAHjfkhonjDtGxDdr+xkp0=; b=kxaUp2lPvj+fd91Q
	DHY8/3eIEPCDC/MBaZgzgLbCrX6Nx0KxWYUX+yChzxqUqSbzKfiBu9PDuzgVNHth
	J2MSTCK0pfHQUdeWgQ/kpBNJ81khlFvusEsFM2Y8zkLPG94+/8P7gFTeoBnrFeiV
	0UeSL2SeKMVX/uuQBmimGUdd3yCes5vkbha0IQo4BaWFEVdLSU03xkQIdNsKAKUB
	OH4uCT3yh2C1pyXVKPO7Niekjlgopl0vnVehX55UNtyG7o9JgN+HXCRl1Oe2WKCS
	4kDWSgnacv+s5qLMXkECVc1is7/XZvIf8emg6Q2GhnPFhjpc7VA5uLY+0usobb1u
	sWJsWw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10a9b1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 10:33:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517647fbff1so21710831cf.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 03:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781087628; x=1781692428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o/2WnocrnpuSiCW6MaX5GTAHjfkhonjDtGxDdr+xkp0=;
        b=WKtQslUAMz+7KJ4hsz8W/i7H02VMk4KOMvfkmXsXR3OVSAIntU0OsURXLYkIwoTIYd
         7V6c1NOf7X3fmkCroGz5bu2xGwcDXIXelxqdf/Qn7Q/QrzBgAWWLZWnq0efue+WYjyPX
         MQ0c0zSLkNCY6ibyPCgKdHY3nuSV097asY0WMfG0ZUcR/NhIRA3WqDmGFQQAtJihZMKJ
         x9Xo1hh2F8/iTyjk1DFbJMhSnsrIPY/+FagF2IxuhtijfiYDZ/rSPD/DLydJiDVSO6WG
         cTNx3yFLmVN3JZ9HAgWhsW+3TwWXuQvnNMwPq+JQ4WhwsPb/T019dobP+CBoUcUXdqqz
         aMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781087628; x=1781692428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/2WnocrnpuSiCW6MaX5GTAHjfkhonjDtGxDdr+xkp0=;
        b=npwB4/GSNl9lqtq3/WIup0TC7xNR6+vS8cb5v5Fru5ypEHSLXqsbqqjVU6vgDge64y
         EMkTcnveVK489biv1G4mWC1TvI8VDnUG/o5pLHAimTbL5Vi+l+6Mf4gOCeHwYHUuvA/R
         Q4H8TfvxCn6vGiiIkAJ/NTh4MReXnozDPfr3CLJ7bGPC1r8XdfwNtxpLR3qtuBGSbcXj
         9mojbWSyGIebA3QfKvxN2lZp+4HE/DvEJ0y9CrseD8+T9A/k/6dsybSoPDQ4tDCbhWoX
         ALD1FXFNAYwVfnMG0rS4YwY/pyk67w18wKPMdtppukImIkgGOFY3G9eewbwhyoA1vzfD
         BiBw==
X-Forwarded-Encrypted: i=1; AFNElJ8XwcxBC5wWU1nxH9vSJqfGQNBX+vn/P9yIZHCD4I9nkkO9fmcno6gU+P7Rm58jfSkfwof3/p0JWB7X@vger.kernel.org
X-Gm-Message-State: AOJu0YzM+YTWtAowbSHuzBhjwoVboLTKoH3vZYxw9oFXWUQrDvQKaXsu
	EVweCvbJ336LIhwkjrEtpaLHFoBzK8ohO+hS0xLuWYX9LmZel0U+EmXHYatShu14OC8jbWVes+k
	p4hKFStBRcG6FW/h0AzsQAd1uLgxCniHPYVkgxiGg/r0AkhlikCMtHyxZHQ/nXiWr
X-Gm-Gg: Acq92OG2iT/wzEdDLaZ4B6lMmBL69XSV6gg8MsgFEwb062N/aksOAFYW7Q86J3/lWW4
	jGURFj2g0/ci+NGq+kfzUqubnRyyG+XoY/3hzCjJ5PNeBHWQ0ZjKxvVowoTUvy9Gy8PD7R8wSqr
	z3E7P/UBCuqNYRewu8sSwWAQ2D8OzKhclPFIUYdV9Ie3Tea9wxq/EbhDYysfP0hOchGicrnIlX1
	3Qs73Sq4gQlRevffHow5VZlWKQZI2p9UEyLPeFUD1qpI5n91YTS8c83HYzCUQCmBQAHV4P3yxMO
	mUINKzHorkR67aCCJHN1lS3e+Tl4IJsJ7S7pipqDrwZ/lWW/YPNx18BYyaVSQp5UqL8FdqWZdUB
	+26sA9+Ev5EvrqGo5+ebd2OKH9YtjlD57YT+2BUVFBeEzUg/55wF2JKoe
X-Received: by 2002:a05:620a:1647:b0:915:f92e:86 with SMTP id af79cd13be357-915f92e065cmr142430985a.2.1781087628333;
        Wed, 10 Jun 2026 03:33:48 -0700 (PDT)
X-Received: by 2002:a05:620a:1647:b0:915:f92e:86 with SMTP id af79cd13be357-915f92e065cmr142429185a.2.1781087627924;
        Wed, 10 Jun 2026 03:33:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307ce3sm1163172466b.43.2026.06.10.03.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 03:33:47 -0700 (PDT)
Message-ID: <1b05d626-3a04-404d-96bb-57eb57db46a0@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 12:33:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm670-google: add lpi reserved gpios
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260602021722.30760-1-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602021722.30760-1-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a293d8c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=BITVXKfNEooxrV_AlJUA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: pOkQSQXo-YNYGscvxVbXEF5Ec4sKcLoN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwMCBTYWx0ZWRfX4e6PUSPvW1XX
 SIFrMfY3Bkxhwf4Yk37iW3XcpetJvAwMa3jaz1NvSsfl2BeiUFOgBe1Kst1+9K5qdRExD+ihWdl
 AquIiAnPYxef9O9jF/4zDseME4zAjwkCJa8kaFGcgDTZadYPCIk9rBZ69GoMBjz0miEDySmFjH4
 O8uvFmLb/PdO567eIHa8Dm4jCSsjiIeXAwbPRMih4jmVQ+xNQ432gbS4pVE6YntW9JHjnX0JHxH
 cZwGTql6CGzAxmf9R84HroozPdJ4uOr6y/Aaw5Ycwd+wuRDpitpiwpSIqpWSMOW9wwSlwUckb8K
 W1zMuRH+cOBEj1CWQb18TP2tjEBXswX63c22CN1PodDKrmYkg9w2ZcMXDrhKYWQzOIuPEUTpD3l
 R9q06KNXFmby04Et64NZxo2rHbUyEkdN8Ftkoj9VK9CeLspXHOomfOy6kOfdwJdANp4NYP7+vR9
 ktsde5UwcfwFMHR4SnA==
X-Proofpoint-GUID: pOkQSQXo-YNYGscvxVbXEF5Ec4sKcLoN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100100

On 6/2/26 4:17 AM, Richard Acayan wrote:
> Add reserved GPIOs for the Pixel 3a, which blocks access to the sensor
> GPIOs. The hunk in the original patch was dropped in the commit because
> it depended on an unapplied patch, which is now commit fe9f4a46895d
> ("arm64: dts: qcom: sdm670-google: add common device tree include").
> 
> Fixes: c4b423835ee7 ("arm64: dts: qcom: sdm670: add lpi pinctrl")
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

that's a lot of GPIOs..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
