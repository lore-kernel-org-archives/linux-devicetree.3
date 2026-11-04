Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833955;
	b=3T4rSjeqLh1y8PmsnTr7KEUzx16Q8DG/zcGMRsCokVtiFNnKJNFr0ApLjX8Fu5j8bnMc
	 uhG90zUA05jmN10XNqA/Rp35HNu/NnbwGJAuteELJXdzWbEgRyyNoZYcG9HdhGVXn6KUT
	 0Blz8L+JjQ8oV5P7JN9tPOb9fc1ZD9oXoAworO2790a2ekk/jYsHlJ3qkMG1dM52wChDd
	 c39HNtEOKu2h2hyVJw/8hHCLHYcJF6DjWLSOf1YS5FnO5qLMHd2piqOgAn4dPWi5O9/b1
	 Zg8kK7ToBFrkkDnfB6z5P/WyXgXZMKr7fdiSHp7DMZ6n2UmjAiIg+YsSr90DsTka7yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833955;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0ig/7/QrdpCDxXtWkwmfBcbB/v9MdGwTTP1BzaPF+ok=;
	b=y39xSMIi64ohP+VZ+4+vxGIwaVn2xk1Mojeac92HEXXrUMvTlMa+Muj5+USmVjyvWWtz
	 g93DWqMCuu98M5kTpguYn2Cnudip/uVAGZNbMw+xljdleerT4eX1GebI/cnxlpX0i6YzA
	 rxb3siw4F5ahUVygJp1ldCPy41aklQydTbdpXoN8lTk8AcxTnwSlIyl4kXDkcxm7RulJ1
	 gtXF52J4iwdYwglXmCbVDoIijLKxcR9i5fD85VSedTt1JmoOmvurtpWMKHqMD1DBcmhPT
	 joza1JzrAE+khVWi2SoLxtzxdXfPHqdjz7BEcl1dVFlTolY45o1fIn1s0/emCBLyGzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A36606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 23:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34A36606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab3dd966e1so12039191fa.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 15:12:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833953; x=1794438753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ig/7/QrdpCDxXtWkwmfBcbB/v9MdGwTTP1BzaPF+ok=;
        b=JuwluHB2qDaCMwCO74T+bD2LLlKpOMttokPgW3n6MeSQzwTMYbQ/przT+SH+EVtD/P
         SgQlTw1+XBXt4bQoYLIr79/IOAuBiXpyoP2vxppwTXsglaYKp7UviqmUzZmeUscCBlOk
         JVnVjckTXhBV3LjmBRUFek3LgvWbb//vpARYQU3BI13MxhpT6z3a8+Qf+9psxZKLyrl7
         FZmp4RqA3D4t65jVHeA/buS5jrvc23mSLmY28yF2NxpQeygwCuY2F0W4eJVg4gS6Wb6V
         kzo9TeDbpfvceazGSrar2ofICL1B0gKGfiif2GA2BJatS+kvUD+1sBDuFJfsPhI3oDcG
         3XHw==
X-Forwarded-Encrypted: i=1; AKwUvBw5+jAt7s/nFMHMGIekxILazO7wNn2dotjW9+h630XFJHML5NpEBink5+BAy1c+xm47ijdGnPnQS5C7@vger.kernel.org
X-Gm-Message-State: APuU4Z/FgOdEpoEWzbCbbgDACojxv4Juz7JzpaPd+oJsq9AdBCtwQorv
	BR2B+fCIKGYAibGq2/wASDfwqoYmWngbUBZtaMF7295vbNN9F2IEZXVdy83/Nq12KYY=
X-Gm-Gg: AYBFou2RcQ8ODWZ5mPSVtkEy8m+VW2XwQknaXZD3TjwgHrGJzTyiHd1YILRnuYUSjIu
	DfPJY2M/u6R60CY1JqNl89cTPYCbZ/OyugKV17k+hqFi/lT2NIJFnIt/JvZeKDQrwNMEKu1YQzM
	TtASXskEZiu2HWBSyZo55dpOGOsXQ5pHGr3pIGEUDwPCct+WExTVRojqrazzfPiEH7VNmB3Siz0
	FQA1i8on5Bna5V7MeGJ3f2XmBELX2wFQJn0OVev7utUBdtCRE8OkTAqFUSLfczNo1vvlM2jRIws
	L+1E+XPKVy73STgd27aOLJCtxTA0zkEtzhsafubPfbkDBYHK4rb+8nwaUH3IOiO4Jcm/XlmXtgk
	Fu6/6JCKEAR7xoi4yisDwxFiqYDQ6WodN9cZq9WT0gtBphy8hbYSVRYm9R7/nm3Lu0ZndIyEuBo
	a7zOs5nQnK82AXRzp/n5gaV68oA6JO4RnM/qKN2FHvTQlGPl7Rm10NR3RkDSUDBW6jWShsSCkyP
	+8nNIgaumm0R3qmwgVtWEw0qB/v4Ne6v00fP3odWH/gWX1GhYEIdvMjYLuyD5C8NIyii4T1+x9s
	Tr9r0Un4wzFUA3eSSm+pIUIcJnA3PD+3n+eG8Y0QaLcFu0Pikqe20drH11aJKTvdCaHLs+A=
X-Received: by 2002:a05:651c:a153:b0:3ac:e304:6c with SMTP id 38308e7fff4ca-3ace3040300mr1938921fa.16.1793833953137;
        Wed, 04 Nov 2026 15:12:33 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ace2e4d927sm1818861fa.23.2026.11.04.15.12.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:12:32 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ac91f5aa89so12059801fa.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 15:12:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx5P4GcN8qQHQS0REzp6ns+FHkxnhXYqPO4B55uO7G80mVZpwg3DQM5fQ6ZY7n6747ZMkAegY5ipNrH@vger.kernel.org
X-Received: by 2002:a05:651c:31d2:b0:3ac:e4b6:b93d with SMTP id
 38308e7fff4ca-3ace4b6bad3mr1250481fa.8.1793833951678; Wed, 04 Nov 2026
 15:12:31 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-3-7a9534a9a22f@andrewgigena.dev> <c5405525-78ee-4480-b482-4dedc49661a7@packett.cool>
In-Reply-To: <c5405525-78ee-4480-b482-4dedc49661a7@packett.cool>
From: Andrew Gigena <mail@andrewgigena.dev>
Date: Wed, 4 Nov 2026 20:12:04 -0300
X-Gmail-Original-Message-ID: <CANn8Ume7MfDKhjdZAc3Qha7_k=CFFzaxzk5nK9Ke8iNOveYyRA@mail.gmail.com>
X-Gm-Features: AclHuK9-uWrMe0XXfFl-zEd0pTQ8lUonEa8rXy8zxcLRw3JRTxzZbTIo1byB1YQ
Message-ID: <CANn8Ume7MfDKhjdZAc3Qha7_k=CFFzaxzk5nK9Ke8iNOveYyRA@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: qcom: camss: Add support for SM8150
To: Val Packett <val@packett.cool>
Cc: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Val,

Thanks for the review, and great timing on the SC8180X work.
> It should probably go higher in the sort order, before 8250?
Agreed. I=E2=80=99ve moved them for the next version.
> Interesting, why do these match 8280xp and not, say, 8250?

SM8150=E2=80=99s downstream DT describes the PHY as qcom,csiphy-v1.1, and t=
he
v1.1 2PH (D-PHY) lane sequence in cam_csiphy_1_1_hwreg.h matches the
2PH entries in lane_regs_sc8280xp offset-for-offset:
- 0x0004, 0x002C, 0x0034, 0x001C, 0x0014, 0x0028, 0x003C, 0x0000,
0x0008, 0x000C, 0x0010, 0x0038, 0x0060, 0x0064
- lane blocks at 0x0704, 0x0204, 0x0404, 0x0604
- with 0x0728 =3D 0x04, 0x0700 =3D 0x80, 0x070C =3D 0xA5, 0x0738 =3D 0x1F

The SM8250 lane_regs_sm8250 table is a different sequence (0x0030,
0x0900/0x0908, 0x0034 =3D 0x07, 0x0010 =3D 0x02, etc.), so it doesn=E2=80=
=99t fit
the v1.1 PHY. If SC8180X uses the same v1.1 CSIPHY, the SC8280XP lane
table should be the right starting point there too.

See https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-co=
ral-4.14-android13/drivers/media/platform/msm/ais/cam_sensor_module/cam_csi=
phy/include/cam_csiphy_1_1_hwreg.h


El mi=C3=A9, 4 nov 2026 a la(s) 6:19=E2=80=AFp.m., Val Packett (val@packett=
.cool) escribi=C3=B3:
>
> Hi,
>
> On 11/4/26 5:54 PM, Andrew Gigena via B4 Relay wrote:
> > From: Andrew Gigena <mail@andrewgigena.dev>
> >
> > Add CAMSS platform data for the Qualcomm SM8150 SoC. The camera
> > subsystem contains four CSIPHY, four CSID (two full and two lite), two
> > VFE and two VFE-Lite instances.
> >
> > The hardware reuses the existing 3-phase 1.0 CSIPHY, Gen2 CSID and
> > VFE 17x implementations; the CSIPHY uses the SC8280XP lane register
> > layout. Add CAMSS_8150 to the version enum and to the shared code
> > paths, then add the per-block clock, regulator, power domain,
> > interrupt and interconnect resources.
> >
> > Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> > ---
> Wow, what an unbelievable coincidence =E2=80=94 I just went looking for t=
his and
> found these patches on gitlab in order to test on the similar sc8180x,
> and half an hour later you've submitted it to the lists! :D
> >   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
> >   drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
> >   drivers/media/platform/qcom/camss/camss.c          | 262 ++++++++++++=
+++++++++
> >   drivers/media/platform/qcom/camss/camss.h          |   1 +
> >   4 files changed, 267 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b=
/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> > index dac8d2ecf799..851decb0691e 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> > @@ -1141,6 +1141,7 @@ static bool csiphy_is_gen2(u32 version)
> >       case CAMSS_8650:
> >       case CAMSS_8775P:
> >       case CAMSS_X1E80100:
> > +     case CAMSS_8150:
> It should probably go higher in the sort order, before 8250?
> >               ret =3D true;
> >               break;
> >       }
> > @@ -1236,6 +1237,7 @@ static int csiphy_init(struct csiphy_device *csip=
hy)
> >               regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sm8250);
> >               break;
> >       case CAMSS_8280XP:
> > +     case CAMSS_8150:
> >               regs->lane_regs =3D &lane_regs_sc8280xp[0];
> >               regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sc8280xp);
> >               break;
> Interesting, why do these match 8280xp and not, say, 8250?
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/me=
dia/platform/qcom/camss/camss-vfe.c
> > index 2680a9914765..dd28058e98a7 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> > @@ -354,6 +354,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, =
u32 sink_code,
> >       case CAMSS_8650:
> >       case CAMSS_8775P:
> >       case CAMSS_X1E80100:
> > +     case CAMSS_8150:
> Sort order here too
> >               switch (sink_code) {
> >               case MEDIA_BUS_FMT_YUYV8_1X16:
> >               {
> > @@ -2010,6 +2011,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *v=
fe)
> >       case CAMSS_8280XP:
> >       case CAMSS_8300:
> >       case CAMSS_845:
> > +     case CAMSS_8150:
> >       case CAMSS_8550:
> >       case CAMSS_8650:
> >       case CAMSS_8775P:
> > [..]
>
>
> Thanks,
> ~val
>
>
