Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997DA49DBAA
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 10:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540244; cv=pass; b=OoN78T4DxPVUtu/CjGj+pDvHbh1lG7AlzrNZt9WaKgle1qhvcaCvvUm+mgHgGXtAzvFuy/tAmL3dKf/rzhhTkU9TBPsC7Flp9RaR60ODPSzHdxYr+l+qQL7tAhuLhPQCnNgRjfOuFxk6kxHRV+T9u2MLSkYJsA20fEsKvkqlhZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540244; c=relaxed/simple;
	bh=PiIEJBacYP8RPpVhrEdxj6N1ZBrQAEJntz0xmldB7uQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UpUEDmV3H3T0MQA5sddvfKX2KWj+j/PA+lbMDwX1VHgKUvAo+tYyAiLM7xe7MVwuZKButlzcDHE520OFGmWMuFFJkCL4bZXMmgVTcFC2i82JY7JkinMm1+3mjuJug5BKqpZJKbzUIlbNeiBi57U4Hp2tYUOaPl6ZNeVBpcE4hsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WEXjmYKV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cn+iYpeF; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WEXjmYKV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cn+iYpeF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KRNI1252612
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 10:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RGFAbqayoGzkNoR9L5GgWnoZmVxL7JzSyp3JwWFjq1k=; b=WEXjmYKVBun7yiWt
	YcX80+2wv35fcTXvK0ES0ZsZU2i6UqtGQUdqQ4VwyEeUF/DSdreHDgunke9Bt6Zb
	uScCI2vzXkW/VEx2NnFgsweM1StFeweU8GOg82xUFPbMEEMB5NkDKsgUgKSkizv4
	zY5MHEbeGsyttEzp9ebcb3RpBQXkvjgKnoSv8ArUfBs/s5/Y6GOMqcgILZDcv/pS
	pEcgCWyXzVgPO46tMgTDwL6Q3MsUFTZ0c2FA0U+PYKGZBGvML8OXH3wDKGQHqrkL
	9HJuqxwi9YNtGh4mdyRvz/KF+F+jklfT+CQgBQ8hU22qEI+ihK0+Ax9tR3OQTFbk
	B8hibg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj47hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 10:04:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88629a452e0so5026625b3a.2
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 03:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791540240; cv=none;
        d=google.com; s=arc-20260327;
        b=H9GUZbgQfvIXkZJ0QyAlOXkH0PgbODkTPKOB6Ebu4D3hfKIsF9M8/EeEX0aPVmoij/
         J9LqprqOKJ5jMtdZctphecl3oGOFifMV3GVmBJGidJz06qY9cz/IuUoUWxX9dWGs3I3i
         u0BNbe3uRbS14XU0HpLGiD5MSrRYXf5Tz0SKuVm8cy3usKFcdcCweOMOcGpCAuwvNQrA
         JrUBo5kf+y/PgogS1uL7gOfoEaInlrXy/lyUZ/GPwa1pLqkFiN4F+/ho2OSVCLkpOufh
         gBP94LJSp63w/SNqLO8R0evxxLbdVWpT65jvKX0wbNoG8Pld5H8ioXQCvKmjSKqUpOTl
         2mTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RGFAbqayoGzkNoR9L5GgWnoZmVxL7JzSyp3JwWFjq1k=;
        fh=1pN5bwpfqFG2a0Fh5QhndCKzUc/39T4//exD//6CsU8=;
        b=LyQUdd4dx912AEVuMcHAwP0dlnn7JEVqFvBz28yfwD9MaBwG7x8f8N8PvqSJRr+rEM
         meWFNB+PetB7PDAqUujjvGfufNYZmjPqlTG3YtpUXTTroRjHL7pyG/2Da55ySqDRCWKj
         vr/fZuvS5xF5Bv7OYZS8LKX6kNLpLEVflH7nyRyeDIqdBQXR4YoBkrTk5rCNiYh06FtU
         hJOdPSlxKWxr7Zx2j0JqT11DAEOU4IOmoAfyVt5Fn5OdhTHpHIVX/8QstT5rr2YetCHw
         cC36LLlFJchaYBKHahqDe4hRqRsDbTdsNw2QmB5rk8QfQyJCnUmUHyRklPThQEAA/vlj
         jrAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791540240; x=1792145040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RGFAbqayoGzkNoR9L5GgWnoZmVxL7JzSyp3JwWFjq1k=;
        b=Cn+iYpeF1wxWB/Q0vk9Za/mHwuHK06nHpCGozYkDbM+vXFQ2g4q0UNeXahm2KN4uhd
         xn8E8Uiv36mBANv4zZCfb5JDWjLgoZW8tmpoVeGCybcd814vGxq2fkgC197ze+aYUdwt
         DE0dlz0yo75hLo2f1L4qo0/pps+aZjyrWNzbJYzdL+laGVvpYpqe2ktVDXyK4FgvUpdq
         0QbCge1F2m17mHp0zcAJl1vjmwFSZw5fPtTwQ26hUBqCcPdrnfP3mOmhz8RpEZW1PanJ
         807dOGN9P65bL4qSNy8RXKJrembzW2Hs2XYShaSfTmdG6O4/UKAqlh0zGGUUd0GMcBsJ
         KBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540240; x=1792145040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGFAbqayoGzkNoR9L5GgWnoZmVxL7JzSyp3JwWFjq1k=;
        b=gcyZiosV0mo745/GjvhPs8pImOi7Zgbr6Ej3lxP6Oc7OMrMvK/OGCPhUExvK+Tr5oB
         WB9t0fVeHgU5DohaYoesBOJ1HpkZIDEbq8Z1sIvaHihRVbiZhg/k+IVCnNXLcPTEY9ze
         mh8Bwd4XbkJZ313NGSyxcRk75PIb1OEd8cMLLOBr5fvSY+k5CcTkQE0Pv5u+2fHGYy9E
         R1w5v0JxEue8kuHQj5lRHMZNSbBumSGkYftH4MOsaSN2+5Wf/BVEkTSWvsv14PAJRuW9
         QDiFtV96z9mncnIlJtR/CKpNi67owgWcwAPr0vxpnqanwwG9To2bCLDe6x20lwbQL1qm
         FaTQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6oK8SQwr3QCwkFpEN2EAXOzH7lsa/RQ4QMvIiwTx2UQ6hE6AWc2SJMuEnNyZewr/J/3ajLV0NZjBt@vger.kernel.org
X-Gm-Message-State: AFq9FYIIh7LxjqfmtRgNJXZ5huzaL6mL6IGYhrib8zQqailh1uU2cbOE
	gmGo0braLumZjJHdgq2zZ/MlRR9zKISYgJ7pLpPNpUwHw/FoAQWUUK9m349OiC4YXK5bOiVACl+
	dqPk/yfy+8hLXFhMGheXNY6j9v0rVyt3JJeZDeVULCyLPM7xa7+d0gJ3iJUQzOPIVAAozfFya33
	5U0x6bTNYOwVh88LZfNowvyi5cEL2YBxANcrxHHNw=
X-Gm-Gg: AYBFou1QgYg0nnWmkcZiluMPwmLNxkSZAtG4kY4kG2gTQzcIQ/S5nuOBmyrUMvO+tmp
	NPRDfPzBd6XX3QBKqZ2lYd+90WTbBsFZJ1AToUNUxrnVjkHJxGDeKZrKCU4+DXOIxKRrzVWy5+S
	zpf5iylZyNBLh5JuLMg7TpVzuQzB0q7mB/A4L/7NyC4/fw9W+IIpEyCkvFoA==
X-Received: by 2002:a05:6a00:4f87:b0:881:1fb6:a81 with SMTP id d2e1a72fcca58-897c3ff538amr1154994b3a.3.1791540239815;
        Fri, 09 Oct 2026 03:03:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f87:b0:881:1fb6:a81 with SMTP id
 d2e1a72fcca58-897c3ff538amr1154954b3a.3.1791540239339; Fri, 09 Oct 2026
 03:03:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org> <CAD++jL=gFt9kKZH9T-m8B_pbwRvzc35tTrMn5V238d3528DpUg@mail.gmail.com>
In-Reply-To: <CAD++jL=gFt9kKZH9T-m8B_pbwRvzc35tTrMn5V238d3528DpUg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 12:03:46 +0200
X-Gm-Features: AclHuK9hQAW8ziR1wvAdOw0nLveraf3a0x0LG_1OOR8LPyJDyZu5bXvxmgGRPSA
Message-ID: <CAPx+jO-wb6NLYjnn_k7xu=Wqq61+vop9o7UM=5Y47U-WiGFXBg@mail.gmail.com>
Subject: Re: [PATCH v3 00/18] pmdomain: st: ux500: Implement ux500 power domains
To: Linus Walleij <linusw@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Frank Li <Frank.Li@nxp.com>, Frank Li <Frank.li@oss.nxp.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Frank Li <Frank.Li@kernel.org>, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzOSBTYWx0ZWRfX4BOw5V0ZqSrb
 PlYSlB/qg/HcqnvzxjII56GksQHY1hb0AFQ+6XPdhm01ixM90dvguGh6ZpRASkNZ+L1VCwmGGEs
 CpGEmf7KYZhyEPkUGHUmd58gVOugCRn0Ax8cz1TX/Gso59EvH+a+iuypw4SifZ6oRP/VmoATAhl
 +EiuqaOLXiTzvfNA7IgrRPKXxo/oH5crG10KnVdxx+jasjmFKtTGbo7qyJBPCe1YiwmS88pwXq6
 ACheoXjc2ySTscELspyGGPcNlHdieulcvBVB2UyAcDFNlQxoVsWYfMMWD0uEd5VTfwrBh7Pyzw8
 PR8mE4wlLzYewAclJ/ssZvbxY/neqBIQFHFexiSKDw3wvHHQ3q7J/+IgXvwb9YVZgcqnh0KdJp3
 KPEPdy5I1//m0Q6BWMggvXmYg0rcO288ps/UevIzFfzq/JctsxBKLTkc89ZH2uxGY0ZhGVadF/V
 y1h+KQUJuVczDpXQJ/g==
X-Proofpoint-GUID: wh7GZs3vfP0mZw6LbbriT0MpT3vOHTb_
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac8bc10 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=MPZ65LRjT8IzFkvHGtsA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: wh7GZs3vfP0mZw6LbbriT0MpT3vOHTb_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzOSBTYWx0ZWRfX5bzwj4l3GpQF
 ZOa6LokPUAz2rdDpswpNHN1V/zYyI0Pa4fdhOkmKQsHJMbq01DrBOlkY0I1y5cmpVAg8/fhxIHR
 GKg3iUMZMRsh2wkAM4SqDvtjxlr1Bzg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090039

On Tue, Oct 6, 2026 at 12:30=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Hi Ulf,
>
> On Mon, Sep 21, 2026 at 12:48=E2=80=AFAM Linus Walleij <linusw@kernel.org=
> wrote:
>
> > This series pays off technical debt from the beginning of the device
> > tree for ARM initiative in the early 2010s.
>
> I have so many fixes series that need to land for v7.4 that this is
> mostly targeted at v7.4 at this point.
>
> However:
>
> > Linus Walleij (18):
> >       dt-bindings: power: Convert Ux500 PM domains to schema
> >       dt-bindings: arm: ux500: Drop NR_DOMAINS
> >       dt-bindings: arm: Add the actual power domains on U8500
>
> What do you think about applying these three patches to the
> PM domain tree as a starter for v7.4 if it's not too late?

Assuming we get an rc7 on Monday, it's still okay for me.

Although, please re-submit these three separately in a v4 to address
the comment on patch1 from Krzysztof, then I can apply them.

>
> They are reviewed by binding maintainers and should be
> uncontroversial and will make it possible to avoid trouble when
> merging more stuff later.

See above, I think you missed the comment from Krzysztof.

>
> Yours,
> Linus Walleij

Kind regards
Uffe
