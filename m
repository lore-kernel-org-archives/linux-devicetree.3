Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF16447CC79
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 18:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777402585; cv=pass; b=o58ztLP/E4AYwatXutlu/ZJWLxRrm7s5jbRO9QUvNltBETL9Ek8T+9AVzap8K6w2OCXX+I8wgA8HLL5GiNt1Be+Njpc05ov4w6aDHsiNhw6Xe3OLBxxYI3GEJM0IPelwLvLxIoo/UtfvjZEYAFh4eQP1kcjjUUc0I9mbX25Pjiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777402585; c=relaxed/simple;
	bh=yKuWebngPDM8HW0Nj3aqA+4MhRfylS3ZXpVa/iXF1YM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyARWBKODk0aLxVGRLgm7/aZ0CUxs+4qbHiEq4iRcZ7QRp29YHo99wQgsWH2Ehyq1oCij82KrB4Nb/zRbx5/5eNLfJ+Sqcq/VZ6N4SEjJTzOfEq/itJHo/iQKYBzBbqi+jJ9c8mfeDPmWDzfX3mMgdMQfDJ7xjti0upyilx0Ot4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEeHPa7z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DeldMT+z; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEeHPa7z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DeldMT+z"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsRiP3705148
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 18:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Sw99fhCz6T9miiYV4+iKAQ965amMwy1/jcicnEr7aU=; b=lEeHPa7zUwSxOxWP
	sUIKv7wyDQjG80Be//owhNDBJ9XkXQ4r/5URCOhyDSc2OmdK7ySuJYtkkO2bSKnF
	HlbnncYb8BzDOEF9PXeFc3Em9yxN71DXG9cTVonCB8l3zQlZ4jcsvCShd4PNXIds
	j+blEcN85+ND6+cM2iwU1bL25PqU6jyXnuobNJh6u05A9rhPji9QB5eHZVYm42qG
	HhX6ZdpeMYZ0tSVQn69UJ2o7w4zcW5Ku0bzcZrpFV/PeggvyMhOIZECbuFvYYHiL
	8ggHJXYHUqtxKyi1U2Dul0wL8fnhrYhR4Kyl66/6GEieqh+5//bRPO9X1w/gX2vd
	eVqeTg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttxha0qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 18:56:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35842aa350fso22525694a91.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:56:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777402581; cv=none;
        d=google.com; s=arc-20240605;
        b=PjKb7Cflg2Zy1QJ50icKOM7R5G2isfSFHhjp9XrQm/IXGzAc8lqjVt2nGnHyy1zeHm
         4hQ3WcIdsxjCgNG0FJJHX3iOydJB6KoyMdY55DVySgoCrd2OV9+7DmAQN4Q67HBeNjgJ
         xdUarZVXCPSGRASuOke//f2EV8Nz/pIf1P+jAgjN80EHsIl7BHyBCkrmhyS8qoSGvQem
         0GOqAd3d06qW3qwJrCEl1XqQyRacl5bD4z3smF1HhmB2+qlgCqgrZo90zgyW5bsR12Ys
         yn47u9rNbnYZtdKfkg9sW9y3DBIdDFDaamH5aGXZobALq99R1RmUZoLViw7XJWbEF7SS
         w2+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Sw99fhCz6T9miiYV4+iKAQ965amMwy1/jcicnEr7aU=;
        fh=1rCyhW6WLcBwejuN5JWmQz+Ha8fmvZRBMh7MNP1kR1U=;
        b=UorzCGuRagoXe4M+AftLTCPI5mYzVx2pcn/6517fwg2JmfFYQnFonIcg/686IKi7cQ
         o7RAV9apgLBfzbEzt69Wb96g8LAm2q/RjCab8GAa3FhjxgCM5QlRSSPVaKsmUobPrvyX
         H0L0VCBRsFkP1IPdQuoN6ikfEh//MtuUZzND8jrEbLMZCh4hpBFcmSzDOcn6N/bLT+ot
         pHVChwSXSjcdVcCQFTaczR+fHjaPuRILFVbyUvPy6Qsx3CVRfaMy58MzBH8RsJ4nv/qz
         GTso6nZ3+5XzTJMFnHNXLzchvkwJYQq5hSmM8x+0WSAs3x0c4RN/jFlI73gF0KW+NItV
         2qNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777402581; x=1778007381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Sw99fhCz6T9miiYV4+iKAQ965amMwy1/jcicnEr7aU=;
        b=DeldMT+zeW47QDq1AT5ezqbBuJxA9+Ok5Ymm/BGlH0dNXaWGvPBwgLSM2qvXbBYh8Z
         HyBUDhx8SlgyWPY7U7QZ4EDZkqlXCWeMYDugaB21xDwCIYOn7gVGj5cPmq4nm75QnlZf
         H2WppzcvwMaAMTqI894LCfFH5gF1E9fm3tSLargpVJmC1mAohA2Ir0lmoG9PPl6rmsER
         veYf3h0zMCFhMUO9PjfNGAVmTZSv7fHRBQXFEnxHswUquGMtydB5p9FxFAf37ZYMdZy+
         Ibef5v2fjNSTaAGGbMWsuGg6u+iZFxhRrfuLw1Vmfbql8Kd901aE7zK70Rt/nbu+Uxga
         SyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777402581; x=1778007381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Sw99fhCz6T9miiYV4+iKAQ965amMwy1/jcicnEr7aU=;
        b=JHFydlaSzbhCFs7TAEGfQnQPKe4MoRycYT9cUXrXIOrAUBp+NH5CYPbADAMBwpTvB+
         alP6j1VPm5/bETKGB3IMoQzCgokecOEG/lXcuYimxyPsmQyvttv4H4Br1LX6EOesAnO3
         nUZbBBfMjTTNMVrr3FaVO/TBM8NY/Sd6MUqu02jtU1et9E/RFtVQkaI8dYYd8+poubbb
         DC3S/8J6NzZNZbrZxjuT63C5LkrXkvmmMvJ0EKwvh+TzY8ejcN+g7EsCHV0jqLDJBVz6
         nuoXazdmB8G63K9LMw/jqfk/VTuB0G3JeGSNsbjFeKIa1E/CihnEg2O8I82C/vvAi2ED
         7h2w==
X-Forwarded-Encrypted: i=1; AFNElJ+/j9HvlMQtXG8tHXPVi2gctfRXBmedEDPCbGpLZklvykJEs/VgVo794kgD7po2Vt/VHnlnNWmRndGG@vger.kernel.org
X-Gm-Message-State: AOJu0YwHUXo7Bf0+g27HqyvkbXA85KMlY9+0bQTloS5c8Buwzx4rwtv6
	mXfvzFKGBK7uVoqwyCkTTEUWUfrPFNyvej0AoR2ujk7wQySRP/xTJnMcdf3QUkx5CMfNmyzI1BI
	qCOIZ1N+OQlgTR7HuwdiFt1DzlLoHCPbXgDnRCX9SFnjW2MKsTeqHKDKxvf4jxPSAdqwsw9IzJX
	w2Qvzqmakpkff9N47xs9Mga/YzXGx3AhjLnijEX3o=
X-Gm-Gg: AeBDieuRhro8r2Wyx7BnzUjR72KrQQ/pIM6erm0jCbukjqMCKTeF4GyCKG6KewNE1nE
	77oNtUFYEHaFsA0/8Idb0VkjKxtftBGHC432TAna7zLoAR5+tdfeHsUQtPAuhc/Wjh4PGiCDRdc
	BYWxCSJBxjBflE+bOSesozwPBm5QvIzYxSaCsS1jVAePJM0aDOZDy1hqVifk8hSqEJ5PqlktrGi
	7R5v/vxWTiAVH0KBX+FMab03sjnDEsLVvKFXY8HzFeYnt32
X-Received: by 2002:a05:6a21:e097:b0:3a2:7ef4:81e3 with SMTP id adf61e73a8af0-3a39c402e6dmr5239403637.51.1777402581382;
        Tue, 28 Apr 2026 11:56:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:e097:b0:3a2:7ef4:81e3 with SMTP id
 adf61e73a8af0-3a39c402e6dmr5239371637.51.1777402580845; Tue, 28 Apr 2026
 11:56:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-2-eb27d845df9c@oss.qualcomm.com>
 <hpun2wdw3lnthjfwmycufzqrwl5ssiohdjf73kxcpm2reuyqqf@oc672sww2pqe> <3938070f-5be7-466c-8967-6dc32b5ef372@oss.qualcomm.com>
In-Reply-To: <3938070f-5be7-466c-8967-6dc32b5ef372@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 21:56:09 +0300
X-Gm-Features: AVHnY4IbRVOi8SHlF5dYFobt0wvGd_aIyg0c8FWOdUh_XxHFt_x9BmQPJgUIi3U
Message-ID: <CAO9ioeU-B1jpmR5-x=BrWwdTnNRyORKtQ5aShzf7NRFfLfM8MA@mail.gmail.com>
Subject: Re: [PATCH 02/13] dt-bindings: clock: qcom,sm8550-dispcc: Add display
 CESTA support on SM8750
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE4NCBTYWx0ZWRfX08MDaP8h3MBp
 fYUyRzuNbasUPsF/M5PWpI+4PMz7a0vHTota+WFDPUQ8MXo0utD66q+ArYYxwDLpc4XGiHhBEnq
 1KbmfJnpknUBb+oXPEJihBrM3HKSsAMWno3XPN7Dy6Z8l5y1+whstICSjOLNo68Fdu43mrkCfo5
 fwI0/EPIzePUXFDD/sVjYIWk8rqeFSKZ0IMovSEMmkoaOYs85NJmvRvkzmPDMpsuReIPC3TJ0g6
 FXjl82rdJ2gPahCLgEmV/u4Sl07f0OkjlWF/8MHJOaQYIHDsJRnFH09pg+/x22K4w3yFmFYXBcJ
 Fg0XL1oiiYt2iIJlOtKCaKi+F3l/oyrOEPCdf6n6cW6FcIWStuGrwwblT1ikopSe40vpLAlmdxz
 El8u/dwFEuUTr5yKkX/u00UNHrlGDEp8WuAZlXGr48DKdVQ6hd2X1755JGBHI4+HkglsHRG/ZI6
 pzcYSMLaMrnpeARw0aA==
X-Authority-Analysis: v=2.4 cv=Uu5T8ewB c=1 sm=1 tr=0 ts=69f102d6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=gA42fc11l1rYSZANlQgA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: XqPV3PmacIG9Z-CX-G49VatzjSNxFo4h
X-Proofpoint-GUID: XqPV3PmacIG9Z-CX-G49VatzjSNxFo4h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280184

On Tue, 28 Apr 2026 at 20:21, Jagadeesh Kona
<jagadeesh.kona@oss.qualcomm.com> wrote:
>
>
>
> On 4/20/2026 11:15 PM, Dmitry Baryshkov wrote:
> > On Mon, Apr 20, 2026 at 09:58:55PM +0530, Jagadeesh Kona wrote:
> >> On SM8750, a subset of DISPCC clocks is controlled by the display CEST=
A
> >> (Client State Aggregator) hardware. These clocks can be scaled to the
> >> desired frequency by sending votes to the display CRM(CESTA Resource
> >> manager) instead of programming DISPCC registers directly.
> >>
> >> Add bindings to allow the DISPCC node to reference the display CRM nod=
e
> >> for sending votes to CESTA hardware and the CRMC syscon regmap node
> >> which is used to read the frequency look up tables provided by CRM and
> >> populate this data in RCG's frequency tables for CESTA controlled cloc=
ks.
> >>
> >> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> >> ---
> >>  .../bindings/clock/qcom,sm8550-dispcc.yaml         | 48 +++++++++++++=
+++++++++
> >>  1 file changed, 48 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispc=
c.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> >> index 591ce91b8d54dd6f78a66d029882bcd94b53beda..3e049b2160a1781c866bb3=
0b29f0da5c9e156b61 100644
> >> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> >> @@ -60,6 +60,18 @@ properties:
> >>        A phandle to an OPP node describing required MMCX performance p=
oint.
> >>      maxItems: 1
> >>
> >> +  qcom,crm:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      Phandle to the display CRM (CESTA Resource Manager) node, used =
to communicate
> >> +      with the display CESTA (Client State Aggregator) hardware.
> >
> > Is it going to be shared by several entities? If not, can be make a par=
t
> > of the dispcc and get rid of the extra CC <-> CRM API?
> >
>
> Thanks Dmitry for your review.
>
> Yes, clock is one of the consumer of CRM, but CRM can be used by intercon=
nect drivers also
> for BW voting via CESTA.
>
> >> +
> >> +  qcom,crmc-regmap:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      Phandle to the syscon providing the CRMC (CRM clock) regmap use=
d
> >> +      to read frequency LUTs (lookup tables) populated by the CRM.
> >
> > Why is this coming as a syscon? Why isn't it just a register region of
> > the dispcc?
> >
>
> The CRMC block is not part of the DISPCC register region; it is a separat=
e sub=E2=80=91block within the
> CRM(CESTA) address space. It contains clocks frequency lookup tables that=
 the clock driver reads
> to populate RCG frequency tables. Since CRMC block is outside of DISPCC r=
egion and DISPCC driver
> doesn't own or manage the CRMC block and uses it just to read CRM control=
led RCG's frequency
> tables, marked it as a syscon device.

Why is it a syscon rather than a normal device with the normal driver?

--=20
With best wishes
Dmitry
