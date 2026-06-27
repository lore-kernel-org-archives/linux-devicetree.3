Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C01158DCF
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 05:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782537622; cv=pass; b=Q0wXRNoS/gssUFv5c02LgibDNw2FvBzzQmK8g608RIT41B+1xI6af3JORgBhDkwesgCQw6j8lLMDbAo//Okxdm4f2HwkxnUxh5IVRZa25RVSalc7JMKroA5/MqaEyBzPy1LXqI6nAtXGYL581Nj7xJEDg9TIY2Dk5N0OTTz8GkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782537622; c=relaxed/simple;
	bh=JazKb1s22fdMLXLs1H1wbAz3+xYEpc8IfYlazIB3pV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mFuhp8MfM01ajgB1DFvoSR9Z539phKRcHczIrkHiGfn2dED33EvAswy6JYOVJ2C9ZnZ81pKdOqyLuWAT3Q++4jE1PGapsaa4aPXCPTI5Uy26qwXsM1jEx6VRSOWcjpB5tFcUXw2PAixoMsp4zbFtaS4yw7hqhBHaPGogDR2WmJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CUN2dO8U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FtJNrubo; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUN2dO8U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FtJNrubo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65R3gaDT008531
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 05:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MdGyk5vANDVKEdD2SQN4LRHwUsLGHTmniZK2ZFoCodU=; b=CUN2dO8UKvOkbLKq
	QNoEuJQnmdY+wm7J2fvcei1yniWa04MtU4lxg6+2KJ9BrzUZ19bIG8ba/RyZh0Xw
	Kf39PTr7/AEj+CtK0YcVhjVBKuDwKd5KSs+3L67hssSTOwjV6A1HIrt8OI+Ny+G4
	PtK1pgRGxipU1e16BIgV3esM66fFIbTKuHdeaSKDp8AJochexfpEY06fR++6bXxW
	gNXMHQVgU19BYH8G3W4UUn8TML0YZyMYE08/I+xWQX+hyR1Ttd7P1CCkR08H7nRI
	gNCvlIMa4nDFi12dg9Dt39Oq2pJz3l3t6dllfm+pannAutgGKFLLUWtsoYlZHGan
	wUnnTQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26u7059c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 05:20:20 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-806a62af18aso29576787b3.2
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 22:20:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782537619; cv=none;
        d=google.com; s=arc-20260327;
        b=kyGoJ8D2G8JLKbNygb/yq/mh0zWXc+sXCLDzMi/SkUDIWN9uA/2ea9MrgEtMZfUlHR
         TI4kl3sx9iEr8o1aeUcNzjHqQ1f2ssthYg0f+F+qzxQjWYi0hWs6BuQQ6K6PDnC5a09J
         XJpxLkNURolYgPkz64anIRl4ArfWy/33EkExUr8HwSIx0NapIL3M7JEi4MJ8kKyysm4O
         i7bksIsnpAzRTVYbM9xkDL4/isbQMQAJZH0Vjmx7CK0qY6fHKVpD8NmWyUDkKxfJdQhn
         0qCdKcrSlNIcF21e7OqFE8NNHwWlYaOS43kWDCkLM4CmZonLfpMaRHDCbv5RJIC7JuLs
         VrOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MdGyk5vANDVKEdD2SQN4LRHwUsLGHTmniZK2ZFoCodU=;
        fh=ZX1YxdMcxRDEJx3dywAZMZEibNnr9bBWsW3ww+eLxyc=;
        b=lpyEV4r6bC52o9pnmLGmfpnlLaB9sxfdUtNrcPgo4+eeSek0kxZo6+RvcLpGCopevr
         xRJH+uiX/x6BcsMyj3eiOzIfK07yBcqWhNhBlXBVH+dm/G4Yo/RXb48kcLMgZLRWtaZm
         79DotcGZb/OCKPdMsABJhufZoX4Rdu816Tctwoo4yT8jVD7aO553wtvNFsp07rhaIP2Z
         EGNUivHiIHEh/MFQyV2qtCU9YNYzCRIErsu1Ofj25+o6DNpiWmvm9oX0ND8kg1CpG1hq
         ey8D772K4jrDFKh6YuHM9c5EyfL2aeKwRS8nhcGXc8QmZEIbhE0bd+lduEGKn3/EjW7C
         mebg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782537619; x=1783142419; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdGyk5vANDVKEdD2SQN4LRHwUsLGHTmniZK2ZFoCodU=;
        b=FtJNrubohWxtbJLGKWeB6JNr+RjlPBD8NJuJ/1NPC5b0yn/W+A0/uMxHygeiMmz6O1
         ynhS+wlWSVhdNwluqrG9fMpjp+kVxqCsM/ElKlsFbgFvZG6SWi3ZpC6eZzFlzdf43VB8
         bx8zwGUn4Ch+uzDj62I2A3SwBvUfDg4sU1K1BnMWQYbbMz8foEwpXjs5zl3Sf99SHQ9h
         7nQnqUKCuA6kBQTLBF3HZRWDdL2jcpdoY6eJECxTc/dvvHKmQDcD0qMDWZYd/bV8//RZ
         gahSs2LZ8z1wuW1Xg5sjQpcEtjPXf5Bvagw42atfZUmOTQ6XEcDv0VgC/9UTtMWL3xbJ
         nnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782537619; x=1783142419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MdGyk5vANDVKEdD2SQN4LRHwUsLGHTmniZK2ZFoCodU=;
        b=O6Q8vG5ijYZ8Jbojzt3lceWXdWrEuLoGE7PMMEqfoM9Ij/xAFIiaLngRWwENq1q0ZU
         GaOgVBPrNaYP8YTS9zelYXYC5GzXVfKu6zTMMDLFXJObTf49iSVy/6G73BB0myYzw2zy
         7kiXn6Z8E978a2SV8AiEVc8z+iPP8PzTHCWSkGorc4N0ewn1lzNbFMXxYVWximzQfFd+
         xZK5gWxspPjMXYMzSV3LvJtwol+zfmyTAI76YwYEfgiPJp7fkxEt2OM+QEzp+VBsJBqg
         2HKsn7CjA3vj0gnGJoqiHd9jE5zDbMQB/7ZPy9A/BME3ve3oGt0QFvzgPDurDLZHVXZW
         SaHg==
X-Forwarded-Encrypted: i=1; AHgh+RpWQSn/lHsoNgZIEJ+MAjdJTFlGOHiB/vElwqZsEemC+TytMG7tClWvr/TBiHKCvOrD6LdOoRsF/E5L@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4pWbJDOxC42JEzzsaCxwlH2w+r4H9vyv/xryARPfx+MW2C80t
	qRucatVns2Ryb2GGOTJtf+Sd/lXr4Moxl/6xn3iAA8P2abpY1Y25bxpQcJtgk5j0jk30h31MBal
	xXGjz3EU/lxNJKRtDALsg8IVu4X3nxYBuUJDcAkYvi6pVyetGLn+pR8UUo5tW49xIUYlC9viiqy
	3HwXgb5wIqE7pnpNxir3UtjOb31QHCsPTS/WorgiY=
X-Gm-Gg: AfdE7ck7LBR0qDyMiv33lj1J8sCXLUcqVkfA+PelwAVwJutBP8Q3Ka3uBnNVlnOv3+s
	O/CHYRWwtVJn2tf68ApGu/EcjCuMOaRBvhrm2E0X2C/uqdYG5aZRrNSvpt0NuDfJbgDJjg0vLxK
	IdDFXEc5myp9QeCCoMn/YsTqTTzptm/9BR1nKnj6Ids8KjQa9Lu2ySxVCqNtcKSLHa97f2
X-Received: by 2002:a05:690c:9b12:b0:808:f9bb:3848 with SMTP id 00721157ae682-80a686ea671mr98741457b3.13.1782537619520;
        Fri, 26 Jun 2026 22:20:19 -0700 (PDT)
X-Received: by 2002:a05:690c:9b12:b0:808:f9bb:3848 with SMTP id
 00721157ae682-80a686ea671mr98741307b3.13.1782537619163; Fri, 26 Jun 2026
 22:20:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com>
 <3da8b668-1504-450e-bde2-b383d63090a8@oss.qualcomm.com> <CAC-tS8CuhED2dvne=cuTBUcrL93WXPjNB-nDUYHWNtFF9oVVjQ@mail.gmail.com>
 <7948feb4-9eca-48f2-944e-ec982b6823dd@oss.qualcomm.com> <CAC-tS8Af8GNQ1rq2PN6Yr-wG8_D55ddU9t77H4CUEvWfaP=Gkw@mail.gmail.com>
 <0f91b335-35b8-4b71-8601-0d2c4dc53950@oss.qualcomm.com>
In-Reply-To: <0f91b335-35b8-4b71-8601-0d2c4dc53950@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Sat, 27 Jun 2026 10:50:07 +0530
X-Gm-Features: AVVi8CfSGk4Ur6-NpU9JcWCxqSlaeNXgt_0c45dTtL9eqUNe3YnnYSnTGt5mpbo
Message-ID: <CAC-tS8B0+w2EOp4nMOq=egP_rLHtdNQx_SbjyMi+N+2axTrO0A@mail.gmail.com>
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDA0MyBTYWx0ZWRfXyd60zl9gcjV9
 oOCoTU8ZprDYPZ85t/CbP+WnMulNh93uqilUvU6QIKiNesoHOsWbT9m52Mi7JepZoQKFmtjGRZa
 jsxhVAgn0OUxgDw3RugwtythzqH6FyY=
X-Authority-Analysis: v=2.4 cv=ftnsol4f c=1 sm=1 tr=0 ts=6a3f5d94 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=ic5Di-vIGvb2KEz3KMEA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: Oivlz54qYnmKgKM4Nfpgxb-QgHn0YkBQ
X-Proofpoint-ORIG-GUID: Oivlz54qYnmKgKM4Nfpgxb-QgHn0YkBQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDA0MyBTYWx0ZWRfX7bJDDuBp48xs
 E7zZhqeYwWa0vxIhe6/VnHJ7rznWDafPAHJPe2C4tsS8hmzCma5u6itF0tTuLXG6zLeWVpihLoE
 xSmknBwuZwwyoJfKsIOXFeLSVO821UHRJaSDwITjwJN56v/hw3+TmFDCNTiMIMcc/SbW465VXwG
 tW87j8z/Jn3JgVud00hNLqa9t/g/sQXZw5IlZPnFHXWZnw+O+eMbKc7HW+nOKJmctLnNIK+LMiV
 4+MmzrClkwu6Ji6nHYXthrmNV5u8WqYszajyH2FzhpesOA51U950KjN50XyxlrG6kEbU87hXvID
 Grsy9FMYaEuUFwg74a8ffMUI0NnBbahGkrtCSTSvQdg2FhPWXRKqT05YxpxLi97JV7Hs9JbcMV3
 oBH2jo6zI0ryBCE+xzR/LWb1H+8Yyj4fT1Udrofdg37UexlQ5Dd+P0gw5H2VRTtxUJ1A1gRHhPI
 CHtC6Wh1SZrAGBBuFYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606270043

On Thu, Jun 25, 2026 at 5:41=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/24/26 8:59 AM, Harendra Gautam wrote:
> > On Tue, Jun 23, 2026 at 9:18=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 6/23/26 2:26 PM, Harendra Gautam wrote:
> >>> On Tue, Jun 9, 2026 at 3:27=E2=80=AFPM Konrad Dybcio
> >>> <konrad.dybcio@oss.qualcomm.com> wrote:
>
> [...]
>
> >>>>> +      qcom,qaif-aif-sync-mode:
> >>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
> >>>>> +        description:
> >>>>> +          Sync mode. Use QAIF_AIF_SYNC_MODE_SHORT (0) for short (p=
ulse)
> >>>>> +          sync or QAIF_AIF_SYNC_MODE_LONG (1) for long (level) syn=
c.
> >>>>> +      qcom,qaif-aif-sync-src:
> >>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
> >>>>> +        description:
> >>>>> +          Sync source. Use QAIF_AIF_SYNC_SRC_SLAVE (0) for slave m=
ode
> >>>>> +          or QAIF_AIF_SYNC_SRC_MASTER (1) for master mode.
> >>>>
> >>>> Should these be boolean flags then?
> >>> It should not be, the intention is to define explicitly, for better
> >>> readability I can rename these flags as EXTERNAL/INTERNAL, Please
> >>> suggest.
> >>
> >> Are all 4 combinations of them being present/absent valid on shikra?
> >>
> >> Konrad
> > Sorry if I did not put details properly, I will be correcting in the
> > next patch. sync-src can be external clock or internal clock, where 0
> > means external and 1 means internal.
>
> What I meant to ask is whether all combinations of qcom,qaif-aif-sync-mod=
e
> and qcom,qaif-aif-sync-src being present/absent (set to 0/1) are actually
> valid and should be supported
>
> Konrad
Apologies, the correct sync-mode mapping is SHORT (0), ONE_SLOT (1),
and LONG (2) =E2=80=94 ONE_SLOT was missing and LONG was incorrectly assign=
ed
(1). This will be fixed in the next patch. Since sync-mode and
sync-src are independent controls, all combinations are valid and both
properties are retained as explicit uint32 fields for flexibility. On
Shikra, the validated combination is ONE_SLOT with INTERNAL sync
source.
-Harendra
