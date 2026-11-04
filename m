Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793808710;
	b=i5K/35YbOppo/Vk76MIjCi0ZlMtYUdjpuuov96VgKwegzqJ17kKypZuz/BcXR4qAD2pw
	 s/i+5foLTpaQzzlW9NyMNuUOXMdaSxfFCNVrXGwkzZbMdDjSGJjcRdcyFjJCseRVrTTyR
	 Oz3A9RAMEYmq+IfuVgmLVZr2iPGudoMQU/pn3PDwbN7dMFicDWYAoToF/C5Y0kDt6oT0o
	 X6zjtPLvg+VFcQy+NxGYD2HN14i8e98W6mwW1ZOs15HacHS+S7vZ3n4vNQaPPlamllFgU
	 1xoOy0+hlfkrssUCubBUY07eeQi1/vg+AB13nsuPwCW/bscZ4rj1J6in0w77ALXVN4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808710;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5QB6POg8HfhMxcRuf7nl0o7R4RuPToIyjSP8q7zFzGY=;
	b=z7t5CF1WSCUjl294XBhUe2qQXpsKNiRv9sPmcxePcfloB+QnIdsp400A08J2tWuxgYMt
	 RnuJ4ORXOqLmFHbkgWIv9dR+cz9uHuhC+fAj19nvqca6wcrjpOsHIr/twOJ2Q9z1vgtUY
	 kcE7G32RmSdGRlErEA9I1hFRz7Wp9cVnQyUH5SgpyObue3ZJb/td/Dm+dZFnXZ3vZbNSy
	 NNCf0ooOZ1HVCMiaKhn8A5Hood2qCjHgSkI8P13LNemC65/Vt2228gtItCEiwuxVG0sOt
	 i84IDpJZuOle5ymC8ymVihcYpTURkI1Y3leadLW0HdrRZbPJKqGMnjz0EYhe5d3p+fQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HL3zDrgn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=El2IqZXW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E23606A32C
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 16:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03E23606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HL3zDrgn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=El2IqZXW
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fistb2210748
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 16:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5QB6POg8HfhMxcRuf7nl0o7R4RuPToIyjSP8q7zFzGY=; b=HL3zDrgnV5oO631M
	Ro3PaT8ie6EQfwqRoHQijSgOKcFDtH4tbxZgzZrLgfk3JSj4kg6r56uj6bnDRrrt
	ScyF0vqH9OisHcxgvpJae0MgpBXydaQLio0ZJVG9j3/TlNXrGtskrkqlmSW+2ZWo
	xU0TdvyezwBVy7vz0pI70oZlvKNb9IC48femR6o7Dqp5cNKgJh905dqPo1w1jdCi
	WDmne/ATT7DGWZMvChAmzLZWil6FP/bqc4iMtzaeY7K30odHjDYn9qZ/etBbN9Ja
	jqK4oYFVlMganJK7VG/lFM6J4I9nVp++FG3byp+UjzBmz/u8Ss3gjnKEAxKIZrTJ
	Koozgw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bdree3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 16:11:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so284576585a.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 08:11:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793808703; cv=none;
        d=google.com; s=arc-20260327;
        b=eVlxuGIjW87+w6faBHN3z2viEA/eHdJ7017JWLxzzZLCojDoo3Q+LXijkHcdFf9G6r
         TPd9nkIcCH+fkunqocb8no3r9z2lBuEzFzdfiGFNS7/CAIlt/lqrGeZLX+DcFGQ4x3Du
         HxoUT2HIXBW96zhlfgX9g3DCexT+RsYD+7sHXRezHG1ZH+N/7r9yk3gIL44dlpPIOaWC
         bINih9pivzZdXbGWP7hRgdNpYmRUm+iJ7qcdZu3vKucNe42/d1V2xuXVkqW398wixE4E
         6Oh049QiOxbz1I5hD1IXBIZesoamwk/uHL91VKF7+KyFzkBxu6CWsq69uk9nIuIKfFRW
         B9gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5QB6POg8HfhMxcRuf7nl0o7R4RuPToIyjSP8q7zFzGY=;
        fh=IKSUAR3phOrOc0cliQWDqsxwn1X4uzl2zBwqLSK2H9k=;
        b=XnVJrO+Ov73Ph0mvZR14fO25kAw5NM865UfmGEj0zCuI7hNYdC0z4dIsHwVtN6FbkM
         35iTPKwfJEeO+0SURUu+dx9WaNHsZltOSTTfqEgSk9pLpWleaIAN8MUOCkBCXt9Py5pT
         FnDjUx5PePQUu1g0oQ1oBp8qaDonXLnTWS42r0uxTd9yuWxtlSkLY8J0Yz9s4P0cquxh
         NX/8T5NbiYhn1GPJL9sSMVTzMxJz5VHsUWDTiT245uHVgwntveKKP0oWpXy80Z/V8IN+
         nsidW7TQ3da+rZtaIXyyd4B9Mfs+lXa3nU6fMUOYLd4uE/wG01+T9sR1WGGUSZHA0vo2
         PUvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793808703; x=1794413503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5QB6POg8HfhMxcRuf7nl0o7R4RuPToIyjSP8q7zFzGY=;
        b=El2IqZXWqkDNC57tidc/K9SGVrfNUsSastdQjvvHqzAaDZRkiyFrAuM/vMIVkTVg+L
         N+iMkAyBUdQ06Itekfz50jEiN2ymXWirP1+05uhuz2Noy5oMOlITxv6gF8NipJ7/010p
         x2uuO1FtQY09ULWm75TENf1JvyJ0Oy0BY8VMzLaHhSwFlY54SIAOMRBzwcNLaaRyoAY+
         T1K9YmEZgQGcaFw4GkFfyOLagtW4i2UvUoItKuXt9F6FUiquX/rzJIPWkSEDN9mRSUNz
         JAhMQSOgwiHhAkSIrVUIa6NkJGSK33AiFXMEyOZYHL+j0vdwo16VgtjOZN16c8sHHvoE
         AJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808703; x=1794413503;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5QB6POg8HfhMxcRuf7nl0o7R4RuPToIyjSP8q7zFzGY=;
        b=fO30+OFAUYDG1DHlQ+g7u5Rf4ZeX0vAZC1aK9v3U7O+yYjKefeQqCNXT7oZToKwqMI
         s++I3pMEiLh0k4PH5YGCw8TsxHMbfBDA51q2EMnsd9gDPA8MP8afRnkhrx2C2s9ne65g
         s0FyZQXDidWo6yhUq6Ye1kqUj/T74Vb05M/bsayi1KGSIe0oDwZHn843E12ieMieVM0f
         VWeE/iljwFs7bObXWXcCmHSN4qJoRuDbkgVOn3jA8AMAgxSonmR/EzcFLkeh14StsJhX
         cGCOJPPEqMapaP65kVato0YFIKMdz5sXp3GLBoqTrabZzAPRT36jnNcvnJlKM2kRq1VS
         TbwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHXRstaOWrsoVs+lTc7ubHgqI9ovtwGsUg1Kh20mr8cmODBJujRwGxm8NsVYhEcb2KeECn5qmjfH6P@vger.kernel.org
X-Gm-Message-State: APuU4Z9zwg2QYSNt6ItcaWSgwmpI/zGlTGsDbEv5PBrBu7rC2VqLSODI
	3F7guQ4MayDK/6l0ggF0g5Ngu/vwpBrSP3Ley6zZxGEAWuMhWhD+A/88PJdH9Otmn1Y5UHjVOte
	yaA6LsjZUoEkM70wQ1HVsru07s/ZE4JBb3L80AU0Pojhqb6dIcBGvvI9thcdeKV8VY7aDsapvcM
	xa4id5B8kLkwJ79pCr4s9hGVPkJF5ObqcRqBzu3hI=
X-Gm-Gg: AYBFou1yoIDqz+dmcQFJQEVT6wZdKkw0gt3JZORdiOCzpIBfO1HH7oDPJaaS0wgtDN5
	Fm/oN8MuvHnPi7+0h5nif7GpPY9lJ1x4e/NxosG4IG5gAAY5gda5pXUHR1MWNh6Qn4nsNfKHHwD
	IJGuYUiROllGAMHG//MORjLrLU3/lkYNfJMFLbIJsSButXZaztQSV+173YSIxmSVnUUyLj0oUp/
	gW4190yPfkc1uE+TMFOdl4eEwCTDkAHFp3OF+l+f5PWYExTuXoNazigG+/3ky5zE4fQ5d/VrYvW
	XGrwSNl8qwOOZh6B4CthCymNXo28
X-Received: by 2002:a05:620a:8809:b0:93f:34c9:924d with SMTP id af79cd13be357-94421695deamr2551186185a.35.1793808702908;
        Wed, 04 Nov 2026 08:11:42 -0800 (PST)
X-Received: by 2002:a05:620a:8809:b0:93f:34c9:924d with SMTP id
 af79cd13be357-94421695deamr2551182085a.35.1793808702357; Wed, 04 Nov 2026
 08:11:42 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org> <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
 <fac8cd6d-c3f7-4ed3-b0d4-7cb8a7a6f451@linaro.org> <d92a8aaa-5cef-4416-b1c9-46ecfc6b2745@oss.qualcomm.com>
In-Reply-To: <d92a8aaa-5cef-4416-b1c9-46ecfc6b2745@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 17:11:31 +0100
X-Gm-Features: AclHuK9u3BNMbXNzSA7AiOa-yyai5dEWKspQKV0NGjgXsr23U39BsLgUr6rq0Ow
Message-ID: <CAFEp6-3ka3ZKzCoLQ5BNv0YR+yhYXVRwV6G6rM8Lx_9hZ0RqVw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NCBTYWx0ZWRfX5d6xeaO9xZXq
 id23DH6evGAmEe2m0WFmBepPGlnpq37KTT/hbhE0rGZuF3s3TeNUWZORqa8eEXAQmjsGwht6jB8
 vEMTyh16n7AaHWiX0eXjMgWp++sktOA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NCBTYWx0ZWRfXyl1c8lEDaxLY
 ofrkB8HL81axgNdfhIBjiLFj0ZluVOftRTd87NHxydM8+T3CG/Y5P/w2HvbD9x3Cdt2tkzjBqmG
 lQuhfAhaWHf5e78y4ByM5NE1TvyW7ewyjSdD2geX4dynz5XUQw87Kwxb/zDXRODbaXB8zVDfiCT
 Gi+KNYEFSOVMmTjW+oVC2/B5C9hy4GJH+ea4ceuwWPZgVZzbphcFcMbS8JxCwpktwcdNwL0fE2P
 8YxauNcqXW1sgugyY4C2OWantJ0G/Yc29T7AckCqfHzhvjSm8pu2lhaYDyTh2qjdop6gDqZlCua
 HGHMj7rR6zg11MirRAozpHJCPLW+dfmEEuzW0FxGcvhYpueNO5b5KsSoIMOVJ/5sFwHyrcV0ZPf
 GXuKPNNFaNVkV9cObwISC5KTjTl5+GLi6HOA+VzskfzIAnohBlovipSxm5B2fx6S1Rp//3MSf8Q
 iBCxOk+1yq3gW7k0wlw==
X-Proofpoint-ORIG-GUID: cm3BhyMdo1NbVOKC8h6Fl-m0PvAZXI_f
X-Authority-Analysis: v=2.4 cv=D4XSufRj c=1 sm=1 tr=0 ts=6aeb5940 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=rMQDtz2esI8IZeRrkTcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: cm3BhyMdo1NbVOKC8h6Fl-m0PvAZXI_f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040064

Hi Bryan, Hangxiang,

On Tue, Nov 3, 2026 at 6:29=E2=80=AFAM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> On 11/2/2026 8:58 PM, Bryan O'Donoghue wrote:
> > On 30/10/2026 15:25, Hangxiang Ma wrote:
> >>> On 30/10/2026 12:43, Nihal Kumar Gupta wrote:
> >>>> +static const struct camss_subdev_resources csid_res_hawi[] =3D {
> >>>> +    /* CSID0 */
> >>>> +    {
> >>>> +        .clock =3D { "csid", "csid_csiphy_rx" },
> >>>> +        .clock_rate =3D { { 480000000 },
> >>>> +                { 480000000 } },
> >>>> +        .reg =3D { "csid0" },
> >>>> +        .interrupt =3D { "csid0" },
> >>>> +        .csid =3D {
> >>>> +            .parent_dev_ops =3D &vfe_parent_dev_ops,
> >>>> +            .hw_ops =3D &csid_ops_1190,
> >>>> +            .formats =3D &csid_formats_gen2
> >>>> +        }
> >>>
> >>> This looks strange, why is there only one clock rate ?
> >>>
> >>> ---
> >>> bod
> >> Hi Bryan, the current CAMSS CSID code always selects the first
> >> frequency listed for each clock in the CAMSS resource table.
> >>
> >> In camss-csid.c:
> >>
> >> [...]
> >> } else if (clock->nfreqs) {
> >>          clk_set_rate(clock->clk, clock->freq[0]);
> >> }
> >> [...]
> >>
> >> For the CSID and CSID_CSIPHY_RX clocks, the hardware supports three
> >> clock rates: 200 MHz, 300 MHz, and 480 MHz. If I remember correctly,
> >> 200MHz and 300 MHz is not sufficient for the sensor's output pixel
> >> rate, so we need to use the highest rate, 480 MHz, to meet the
> >> bandwidth requirement. Thanks a lot.
> >>
> >> ---
> >> Best Regards,
> >> Hangxiang
> >
> > We have a series from Antans to address this though.
> >
> > We should list the clocks the SoC supports not constrain that list for
> > one specific sensor on a test-case.
> >
> > ---
> > bod
>
> Good to know that Antans has a series addressing this. I agree that we
> should list all the clock rates supported by the SoC rather than
> constraining them for a specific sensor.
>
> One additional concern: if the clock selection logic still always picks
> freq[0], listing a lower rate first could leave CAMSS unable to work
> properly with sensors that need higher bandwidth.
>
> Could you please share the link to the series? I'll rebase the next
> revision on top of it.

I don't think Atanas' series targets the CSID clocks, only the VFE
clocks. Ideally, we should make similar changes for the CSID clocks as
well, but for now they are not being considered here.

Perhaps add a few comments documenting the supported rates and use a
single rate for the time being. Once the CSID clock changes land, we
should be able to revisit and adapt this accordingly?

Regards,
Loic
