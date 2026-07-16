Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9433F4856
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192201; cv=pass; b=RaNozep8HutrioTT4MrVOwoxUjujYjR9G2b2g3VVUoRIasxFeoUECllopsu/35KLG2dzKuuFwmQPWbifSTAC3JxG/w3a6fP4tV+A8tnebNBF7/C1xksUfI2P7YeSJWOyGPZjmdJ+sRhr5sts+SX3mnYeMJQhRqffTd0NHHoEFMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192201; c=relaxed/simple;
	bh=erxbLLRif2ylk2Ceg+Ib0QqzomEEukkcJoFFt+QTO8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YaGeFOCAXFtQBHcQ6lfEeMBSPKWeyBEuqjMBje2MDe8wZ04eoV8EDnPeJIQp5jINLP8EUK+a8KERCOH8A7CFH4Yfp976rFMMtxJ6C6OkCMz7G//yh1olkl3wT88Rym79KecjXWYQviP52+V4GOpW/1cfzgJw/WfSUNw5GtIM54k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6/qtwKV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+1w100m; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6/qtwKV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+1w100m"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DTal1994799
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	erxbLLRif2ylk2Ceg+Ib0QqzomEEukkcJoFFt+QTO8Q=; b=S6/qtwKV/SiAF+th
	7VAQiiWcHyBk94yMfL5ag7dWZ1HPNssi/K1bKCbuy4AGVnoMbrHSh3I4Y1iO4GGd
	8CU0NwbA2Iy8C1HSe9riD/CgdmcXWAJFvJY+WSmNgF0z8XButdmM9Bvr8yuIfhgx
	YLH3e2r9gpiDJD3dZSbLrolni1ub9fToFdcyexRyvPBb51zQpsq4sgQhhgAm+nEX
	NqAaT5J6t/m5Hns/2BycD3ZbaHQos59JLzoG6h/YHbMre0kcFaFCqfHOExK0KHXm
	vreHDOjOh92sBZ/S+8BPLIvg6WmzFwD1Bf9xedWUTqT8rCE1ekwpTTmNGaohtkJd
	vRFnSA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feefqjvtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:56:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so84568296d6.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 01:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784192194; cv=none;
        d=google.com; s=arc-20260327;
        b=jUY0gjoPD+Czd/YeCws8yEK6hrG8VA6TDqRDC4BGh9Z8xJM10d3HKp/0SlhqCrADWk
         HPg0XOZXdoZyzKUc+LhOLyOL3hYOJdEnSDCd7di4llE8ySJXq4sSOiUeAnJxynqboByD
         kWCikYHFRgN/5En7kuRQmuOOanMIJbteY4tZu2k+fW3lBI8j/ogqY0Qy39LXu1vwABLc
         +NXkS8TzIrlygBLamL1GU7nkZ0huRhWrCN5nAXbKjau2nNHodoXPHas0GRAosHSQ+Hov
         ztbyRgc8KWuNdaJ2PPhoUAitYqA4Vwxa70cwLDIl/ayI3dFmUqn3oQ1z8MSclpmBJjb3
         vv+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=erxbLLRif2ylk2Ceg+Ib0QqzomEEukkcJoFFt+QTO8Q=;
        fh=28iuLnm0sLV/7LnU61/VhomX8E2dMM3zaeoC4c2UuUE=;
        b=NPDnZwSY5Az2VnHlzLFjGsQTb2QzZ7Pzut87q9RW9rgWPuNM8JNsI614iR2zwU+K72
         TvmSxd2Fz0FL9gNNGT+jstBwQA3uGth2B8ASrD0JNX1TceM6hUsfsRkbkakqyCJPWFa9
         E+qXOntjbrGFwncB6t3JttNgfeUWfqnfVvxeaz9JjyYsxsPpleqG1kFjlNWNi30VW64f
         gGDBS7SMhftwGKrRy3vu+ZOvq20OAXTIC31nl+o/pRksrw1Kfp4lTcuFY2HDdVqmV9Bk
         fye+UAF+aE3Y4OpQL4kM2MXB9lSuoT+ifzcKwXKDkOIgIBWyyg5O7SOFVIscyovBKJ6Q
         H2Kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192194; x=1784796994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=erxbLLRif2ylk2Ceg+Ib0QqzomEEukkcJoFFt+QTO8Q=;
        b=f+1w100m0fzW7oDt/8U0FFRx5vS87p7xKKN4qjrhm4hgr+YaAob+DAfWFzlXesz0zB
         MBhnDQDM6h8ungvuZoDeJoQD7I/ENfr4Mfv5S9VugvDQ0NLkSiMjud/3o7QNIo4VyzzZ
         zhb4d+JnaLFfXohYFs/Qt6b2ppT7y9KQK9s4s1+b+Oz7Cz3au1RWF6zYNdjxovgqfMvr
         ta4m+0eU50c1CUOxrnc7MhRfLRRrGYUh0CDLcLz/29zE3UUqqQzVAog7g6ihfys4KOkw
         eWk4RSLOoObL1jZQFKO/b8TmgGG1Cl1OKshrFqCJ/Mvw+1eG/BUJkhR1F15xk5JkxRGF
         aNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192194; x=1784796994;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=erxbLLRif2ylk2Ceg+Ib0QqzomEEukkcJoFFt+QTO8Q=;
        b=XY6cHLXSzSiUhZRDthqa9GIPaxBGLlRSshcBBqRYukY6s1d1LDY28RRV7eZ02Sau5p
         8qMJBBe1TODbn9Dvvuqb6taE/cIkGEP8RdytpRnGyLxHn0U9Q5lJgqyh77JZhNTsijQ5
         yV6fEL30WhEQ01LsUqrEnrHdVJTnHLaTRPYkZazafjZeRbVXMYZWBIiCQJm84vm57Sf4
         NjHzSdGZA2n5hi2Q5xxkGub1aOtSEE9WlFOPco4f7rdQHyovKeSzsIJuk11r7co6yVAM
         FOTLpjfqXSIbAcYG9lm9SLUj01j3T3UHEhgdIF+RTayds/JbN8ByuqGORhLD9BUKUl5L
         fI3g==
X-Forwarded-Encrypted: i=1; AHgh+Rorp3H+fvR3TjyxAn1JambjYoUKrZFJBDiK0V1WdIP1CcibA8seolDe7wOMhBJoU/nzwF/oDi/afHPj@vger.kernel.org
X-Gm-Message-State: AOJu0YwPVQxvuuFLtGO7ZznJpskiHL2mAu9TxRv8O8U4f3bsj95gKdC9
	yGXgiq3vO1ZbR9Vl500urdS5NuGT4vEbT0Fr/p945wxJFYttG9ok5C/mi4FF030LOjvqGVNuy2l
	ZX/ZyiPzKlNbB7rISxsWxZf7G0Ghp1vmg4w1Q/PMglfSmNkZ5MvJVFNzUnVfpi/LKvvPVoqG+j1
	4J91KscdVMzIwsn/OTodlSOKLf+Wbbl/aUylKiHq0=
X-Gm-Gg: AfdE7cmlyuZHL4HcgvXVpncQLO/loQ2socvqmjG1yJ1fgtkrC4b3hs6HHIX5SvPZg5O
	vO39vegLt1+mtXV70VbL/cYyQUGrvoBP4er1uDxSHqWcIeWdvshvAHKn+Ss/BZ22rk5j1jqzg/z
	HiMKb5HUKxphZDyJhHEyvFJ6x5j+5AUxgr2O6rqsq5nh4BJRq+tiIK3oBmOT3R4RTEvk0QQdwfj
	oPyrdBq/Y0iLoooxA/glAtZY2okYvljMSBWyWmUY0MwzAyxQMAmvlhlhPgtAs/CHNg8h/VHV8xS
X-Received: by 2002:a05:6214:1c82:b0:902:e628:90f1 with SMTP id 6a1803df08f44-9074c6e5fa8mr121652486d6.1.1784192193646;
        Thu, 16 Jul 2026 01:56:33 -0700 (PDT)
X-Received: by 2002:a05:6214:1c82:b0:902:e628:90f1 with SMTP id
 6a1803df08f44-9074c6e5fa8mr121652286d6.1.1784192193157; Thu, 16 Jul 2026
 01:56:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
 <20260708-x1e-csi2-phy-v9-1-0210b90c04cf@linaro.org> <YSunV_lNJ8xW_y-Aa2psZavniF6mcHJlJipuj1RYWMB8Zb8yLC-gb7eEnk0XMjfwQOneMGsZM5foFKutCNhYqw==@protonmail.internalid>
 <b7baffda-b97c-4b83-8d9e-e381d0289682@linaro.org> <3ab676ac-919b-4a80-8dd6-71dd7f6fe06c@kernel.org>
 <-iN0mG5nS2joxEn49UrxFlORE3R6Ji3HRebfOMNMGnupMIobTBdRDvnwjRHAXHeLmGf6O4JJENVauduwZXwhiA==@protonmail.internalid>
 <b834e9a0-a61c-4912-b57c-36d571938b75@linaro.org> <4d7a0e59-7c34-4557-a475-8cd7fd2ad2d9@kernel.org>
In-Reply-To: <4d7a0e59-7c34-4557-a475-8cd7fd2ad2d9@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 10:56:21 +0200
X-Gm-Features: AUfX_my6CyfzbDCMixZ0ybaN2jQ8NmSLcHdbJCbKOIU7FiBcCg8_5mqZ43YRmKw
Message-ID: <CAFEp6-2J0WGF6g0K7s--PxciO+d9MR-SCVnrWJ3u=sgQNwA59A@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=APNfGQ4N c=1 sm=1 tr=0 ts=6a589cc2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=IjkT-cPiO-FOTv-BaOsA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MCBTYWx0ZWRfX5puL40A/GgT2
 P08dbXjnbacqOvrJOFb5szbi94qNmfTg2TZH06ztfGj3HCjkBW88qopV7jZN41wpcYh5KNm/HBS
 BGEHH4t6PAoU27+5qmpuUPpOG49JhFw=
X-Proofpoint-ORIG-GUID: 8x9E5prdGCFepHLFkmlM6KIupS7BlQAC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MCBTYWx0ZWRfX5/pW6w3wazz4
 iqoIZSRqR+GR9D1XjPPo/kaWo+6NEgsQqaDw5FziYc3tEcebnA1N7/aP91riE+NfF4DA82h7nXw
 CqgruKAg77v0c5JKtVkXgiA5SGisNlSbtmbA59iCSH0+xB9LsdUfEfYJGzN/ZG18DfdRW1UuP+D
 rcAT0l2M9HEi5170rKDd7PSRIZHuT0Ap8jwKPJun9hCF425IfZcUCT6x51pUjr8H72he7sm1t6o
 phQSU9itUgJ5ffHIEBIgCCfIwxshNzhk4LwJjjCzFU+wez1AokmEccdpUz5LTyOR0EpC9clAD1C
 iIw98VPolWUBgoVKIoFNPc8rQd9tiXOV+2fzb+FuAOYVBQZieAY9Zzsi2RJ2Kr5QXM48LPlNKSi
 E2AjZ6AwuQQd+dq7ntLh/MXgog1mvzPLAq6+Raxu5m+uunGvt9tOtXq2MxgKomp1PCmC2Gg7rmD
 vaZ3BqLIab3hDz3cQXg==
X-Proofpoint-GUID: 8x9E5prdGCFepHLFkmlM6KIupS7BlQAC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160090

On Mon, Jul 13, 2026 at 1:18=E2=80=AFAM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 09/07/2026 08:40, Vladimir Zapolskiy wrote:
> >> As explained in the cover letter: I'm following guidance from Rob on t=
hat.
> > Pehaps you've misread a given review comment, because Rob's guidance is
> > to remove 'phy-type' property,
>
> I'll just quote verbatim "Perhaps putting this in phy cells would be
> better because the consumer decides on the mode."
>
> That is not "remove phy-type" - it's "move the mode into the cell". I'm
> shifting this back to the DT schema maintainers since, I take their
> feedback literally, seriously and canonically.
>
> Any of the triumvirate will do, Rob, Krzysztof or Conor.
>
> Absent a different answer from the DT schema guys, v10 ships with the
> consumer deciding the mode as per Rob's original guidance.

On the #phy-cells question, IMO we should drop #phy-cells to 0 and
derive the C-PHY/D-PHY mode from the endpoint bus-type. The operating
mode is really a configuration of the link rather than a hardware
description/limitation of the PHY block itself,and the sensor endpoint
is conventionally where the bus type originates. I guess this costs us
nothing on the driver side today, we only support D-PHY, so the
mode-check just moves into the endpoint parsing we already do in
phy_qcom_mipi_csi2_parse_routing(). It can be a minimal
fwnode_property_read_u32(ep, "bus-type", ...) sanity check and adding
C-PHY later is then a one-line case MEDIA_BUS_TYPE_CSI2_CPHY
with no DT ABI change.

On data-lanes numbering, I don't have a strong opinion here. Keeping
the current 0-based values is defensible, in this driver the value is
used as a physical lane index and it selects the per-lane register
bank (0x200 * n), so 0 maps to physical LN0. In that sense 0-based is
a faithful representation of the physical lane position on the SoC.

Regards,
Loic
