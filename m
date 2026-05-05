Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8072EFDAF
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 13:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987026; cv=pass; b=DRXEbfI1VbLAulLItXGaSqgI0wXLF9dSVAJ4184Lp6ld3c284de1wrJHBO5BGQiD/c7bI3E2kwBVD1IwZZGeNzXdjmJDaLIs6WLiw2TMm4o/5WYrI8tDPuoE6c1LuFv9SO5OnT8gSHrVPJZtI6felq92C5W5NpfjaQ/0MjzqaRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987026; c=relaxed/simple;
	bh=RINXaIomji3Z5k68WUVEnL93Hz5H4UongOpfpintwjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujF+ON1RNFTiM20kw5xpphLnhDgcgW2jlWR9iFjJ7mOb+gsG5/uvwcLhxgpjzXib7Wjbqbj5SUF1KsuBSeBhC4sWwWBx5bUqJE1UH6LZCniSXty1DVoMJ3T1Ux2AScOS+a1/B4pRyhFfzfGaXqSTncfLi1O1BiLG2i/Q45CGEoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPFtpj7Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OVKQ+gMa; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPFtpj7Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OVKQ+gMa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645CDmLi2187057
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 13:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AD798WH8YaKhVfp/Kav0sq2C2jeCeH7HoyLFibDPvLE=; b=EPFtpj7YXNJxCs7X
	HJwZFiVLoYL6T1l5DiF60DoP837ay+JVBPpk9po9f7fDQ4tsGp0eTtCVyAEr/mnm
	CqXSuSleUA/r38a9U+iEwWVIx4DOr7BgOHdTO7H68+6N+wem0sD8vzgq9fiZpckp
	1vWFHhe8HOUaJfEJ7x7pnl2CyodAN9Rd4rzmKEaofo9HThcwAyHL2Sea14I2CdHv
	DIg9nlmSeHY8rZv3cVyJJuWH7pmeiL3P/u3X8ltmyuhtlOSIVNeVC6cUrRRrHDE7
	KiWzC21NKF9EDEGlgV4SOWXqA+zP+3uAsmZDif/ODfvfQh47VftK/nbBu/J0gbbE
	//GMEg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dygce06yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 13:17:04 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-60fc71622f7so2691077137.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 06:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777987023; cv=none;
        d=google.com; s=arc-20240605;
        b=lK4V+y/sNa2/P8jiUX4TD97nW9rE8jc90awwlPueevJs3nNmRMlMnQlib0E8pAg/m8
         OfMBIw3pcnGR0eH6uJSs8X4glYUKG7VO780OjFn15RtamGQyFpA4cAmJZNYTNzZPEuX0
         ubnynNaAeW0b3cU+wqoWo7+0x5cmLd1UcMkncpcdCSbICiJ8TrjmL80lSF61YkByuG6h
         oXBGx1eMAGCtDJsbxFvrSwobovtauqrPq6glo8wSDnhmexjdfnnrFsdGjdn7MTy98vUe
         UpHUYaEkdS5GNHwce/nUPg1xmQH1cD1YwACXxssPSabiI9rq+V4eO5K0mlZEvPvwxBAa
         NRGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AD798WH8YaKhVfp/Kav0sq2C2jeCeH7HoyLFibDPvLE=;
        fh=eXIC/HlDriLyMvMaldO75+sLM2vG5yUkAXt498pY9s4=;
        b=ROYV7et62B93CtiPcXPC1bU9unFhgDS9DPSyWxZ+frKFYb99cGMWlLKuH6+aZzGsPL
         uUIGp7u3eXjHtmPHjXiUUCgTMlvVvK7tJY175nkk5F8128KEQzi1vP4FIC5w0bnMZNfH
         tjX77C5L9j8SiZX53yxkjXwOLZZEEANjLc15c6stZIFNje30xP5AFsR4XUuun8ovnqK0
         h1flrlMdbpP8datxSNxuDjczLY2sXsuMVbst8claF3z1ovLC+/Tq7I4zWeFx2ISroHJU
         UC7A/lFvHxjf6OIR/ryZgtaVuZWS2KzTGDPkmYLUZ1PYMNgrBTk4wz0WR26pVU3GH/Ce
         5qRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777987023; x=1778591823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AD798WH8YaKhVfp/Kav0sq2C2jeCeH7HoyLFibDPvLE=;
        b=OVKQ+gMateW+W+JifJeKvOFvIRLK9xJl5Oa1+H75KnEmWvpeVlwqvsSSxaVXdNZ3ke
         G0EmyWm5f4/FkTmY1YChRlbP/JiaPTm+pddUg7YWGdI9PlhJ7Gc0RIo8tveRNt3+ECDd
         bKxEXZCP0V/lNJiTwQ68gAIsouti9Z5iTuOqGycheCYKEeRHgQW4ogMt72ZlgGLRA6yX
         xblRKlnSceiMyNuvRlgGea3W8ZUqkSA0P2CSyRhKgkLkmQ1Jwu1cBpvrTcmh7yDdxkbA
         KZxePQ+M3DnbZmK5rFdmmDBrob/l8QQSPCp546WDhZ+b5YHdW8WZz6O1eBIwwg2giJON
         +p+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987023; x=1778591823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AD798WH8YaKhVfp/Kav0sq2C2jeCeH7HoyLFibDPvLE=;
        b=IN1fwi8B48Na7qVgKX98WGr3xLeCHhqf5/+AXFAoI/RbITSzsgKnzc/wbBNv2W+KiY
         wt7TNQLn5oY36YqtE9kzk29wHcvrmJ/+NbZ0rW3NR4cdh7CDnrngl5r6HiwYn7rA4wjg
         t58Ul2ZOzcn+6hBTZnjbRxi9GTVbh46nMYXPRv2oz1A5rkO85opXUQtSH3FA6+cmJgUM
         besxPI9voSyKEiH8CaalpF8UHufEC0z/NBUFgGlg5MQ4IpOK9gFa7h6/0bS+mNIZz4cV
         ox1XLyykcoX8VYYEddhCwuENW85wrkX6NeasdcW/ccGVVgjnZXMraxHtXyiA0LIiUvgD
         QIhg==
X-Forwarded-Encrypted: i=1; AFNElJ+8eF4JXLY+KfE1IIr0vOdGqCIBIQpF121lVWKJNCycC5H2jtuc0Rc4Be38nzp8XapazsI0TUa6pDw9@vger.kernel.org
X-Gm-Message-State: AOJu0YypoPtdEe3iAw1UA4sOxJobF2UBLFAsTbsjA28K0a41urtk5HaN
	AmRZMTjAatAO7/GZt158nEapbzqa/vA6Qceq7nlTl58jIQkuGCM1NwEpqFu8yEGxCXw1c1puBun
	1kKmWEz+lACfx5+ko0PpGvIYKE0Mgux4FHHuHflzqmSIR6AQG8py4EuzRx6TSfQzA96FBb+aKLZ
	XorcHgPz6bT0hTxtazYvgmXOYc5dF0CkAcSnNtmgY=
X-Gm-Gg: AeBDieutZIpmtQx4HsH7JYKEzS7J9H3Wp3ehkDYmLMkXHwmNkzYSgHbBwPOrjbfTvdm
	VlU9eLTGSp6/5Q71CT2wrZvIvoqNctX1boRbVKZITMTcaPGpW0ztgZnVMQmHZwzDtZE2w4UENgL
	sV8JA2YC76iJWW/Cn74bueNXWkVRhpguhq3fm2Yqj7SYw4CaEgPAsvJZUK/Z5hMMWtaxAYljMG/
	+lcNnUwuJjtY4VfaslTWoQGYIU/v1zv6F/1MPg860OweX2Qm1IUN8CcoMMikEGAE2SFCHPHeSJR
	NOo=
X-Received: by 2002:a05:6102:5e84:b0:612:7ddc:52ee with SMTP id ada2fe7eead31-62f591e15f8mr1334677137.15.1777987023051;
        Tue, 05 May 2026 06:17:03 -0700 (PDT)
X-Received: by 2002:a05:6102:5e84:b0:612:7ddc:52ee with SMTP id
 ada2fe7eead31-62f591e15f8mr1334635137.15.1777987022558; Tue, 05 May 2026
 06:17:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-10-f430e7485009@oss.qualcomm.com>
 <aead10a8-45be-4f7a-ac6c-35a99a716b3c@oss.qualcomm.com> <CAFEp6-38=hcUOvW1yd+hRZ2nHV8sLxiLeB18uu-au=LgA2bQTw@mail.gmail.com>
 <0c6c9366-a190-4143-a0fb-2aff38ed8804@oss.qualcomm.com>
In-Reply-To: <0c6c9366-a190-4143-a0fb-2aff38ed8804@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 5 May 2026 15:16:51 +0200
X-Gm-Features: AVHnY4LGEhfsUlkX4TOjzlp790x-TMEYbGtYBxNjEt1Hs1iHIIf3wT5xSTTbtjU
Message-ID: <CAFEp6-1uDO7UzYm+5ejRH0fCtnFZSA3z_Xa+4ibDEbXBh38ueA@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEyNiBTYWx0ZWRfX2wwOLw6GMvdE
 gMtMEpERYRz785+Mrl/SSqVKxANRFtoKVA6bljPHmZjMjpQW5k6tFfOWROLulmQLNgr2YtHSgoT
 8m3tG/RH3ldX79pdrSWW64nB3g6jerMpsECKr2xVW6h7zKMxOwUQuyufujum8NZoRyptJGXrRVy
 uzLBMIaBsKWLhGXsvuS4OVuPF4u74mDDDor/yA4y/vbhCg7SHu3dGVNfOdLAsbZ4Z7Q4o+3YXJd
 GohqYRE3uvpEntOnmHqreynkCKr4HfggaTuwdDhBklFeEeOQ47nluOUCAiIMnlXD781Eol0WAmw
 sFjw6kgUUrE8jKEwG47PGm6VqgNDEbJXLvJh9Ln1AgHDp9kp5NkwMdlfmvNWHbue8LApc5umZWU
 z/PxLx5zshGFpPMYAuR0ZcYtxngqJin/B6lYdhBJhTMLZj1p/fTLB5GIho3cxy98Xy+zFHiHD5u
 6JKtW4b7C5epGmDCUOg==
X-Proofpoint-GUID: c4A91rgl2qtYULL4xqbW-0Ho7Bp1g2Wu
X-Proofpoint-ORIG-GUID: c4A91rgl2qtYULL4xqbW-0Ho7Bp1g2Wu
X-Authority-Analysis: v=2.4 cv=b6KCJNGx c=1 sm=1 tr=0 ts=69f9edd0 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=_2yBmY5WZcee53Sj_MsA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050126

On Tue, Apr 28, 2026 at 12:16=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/27/26 10:33 PM, Loic Poulain wrote:
> > On Mon, Apr 27, 2026 at 4:22=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 4/27/26 2:43 PM, Loic Poulain wrote:
> >>> Add Devicetree binding documentation for the Qualcomm Camera Subsyste=
m
> >>> Offline Processing Engine (OPE) found on platforms such as Agatti.
> >>> The OPE is a memory-to-memory image processing block which operates
> >>> on frames read from and written back to system memory.
> >>>
> >>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +        clocks =3D <&gcc GCC_CAMSS_OPE_CLK>,
> >>> +                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
> >>> +                 <&gcc GCC_CAMSS_NRT_AXI_CLK>;
> >>
> >> Should the two AXI clocks be aggregated by camss-top instead?
> >>
> >> Otherwise we run the risk of the OPE driver setting a rate of A
> >> and another sub-device setting a rate of B
> >
> > On qcm2290, OPE appears to be the only consumer of the NRT AXI clock,
> > while the capture path (VFE/TFE) relies on the RT AXI clock. That
> > said, this may not always be the case and these clocks (AXI / NRT=E2=80=
=91AXI
> > / RT=E2=80=91AXI) seem like they could reasonably be managed at the
> > camss-bus/top level.
> >
> > The open question is how the NRT AXI clock should be enabled when
> > required? enabling them unconditionally (similar to other camss PM
> > clocks), introducing a dedicated CAMSS top=E2=80=91level interface for =
voting,
> > or leveraging an existing framework to handle this?
>
> So, interconnect, or some internal, smaller version of it?

Downstream, there is a CPAS driver that handles these clocks in
conjunction with the internal CAMNOC block. Dmitry also mentioned the
existing icc_clock mechanism, but we likely need to investigate this
further to support proper dynamic scaling of the required clocks.
However, I don=E2=80=99t plan to address this as part of the current series=
,
as it would significantly increase its scope.

I believe the current approach is acceptable for now because:
- This NRT clock is required by this specific sub-block, but not by
all CAMSS sub-blocks (unlike, for example, camss-ahb), so referencing
it makes sense here.
- At the moment, the OPE only enables this clock without setting its
rate (i.e., it uses the default), so this should not conflict with
introducing a more complete scaling framework later.

Does this sound good?

Regards,
Loic
