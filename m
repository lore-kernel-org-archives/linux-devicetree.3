Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795787248;
	b=vS9PNAsdOKdJy3sbk8HJCJEv64GNc+ltsTefeTBor2s5yVj5Luy1vFBNPCGFfA+Bvt1p
	 cqxBpatxT8Tjnxfo0EeNMuN0uzyXYMyafZ8QctN1Dm9t2Tp/jM6h6xa7M8I1xMxCEg3TQ
	 EAM+wWD9tqz9akgpixCqBdgiT/NUO0EIHvc8tIS/5U/7uZDDQmYr7Xi9j+6S0aVQVRFVO
	 zWKuCk26QvO/q+Ttf1SjelhFvLncg7jP4wpILGvHLowMUuCG7wUbYn8i6Lk/Zq0bna6f5
	 KnS/LS2uItANLc9PKOiyxvOeSVbteFzNUpwtb6SKCpHNxlLJCs42FBzHRfXi5sMjbxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ddtVqoOZQDOONta1BJaQFWf5kTSu9vJTN1sHT88/s58=;
	b=OqzozFGWZhSUbNfDMpwSmq7f2rRhW3c7V/GIQ4WiSXO12vkbWFcFHPjTUY+xg4/XMgNG
	 C5CTKd7LngibcrKFouIOD8VVLP03LzZeoCpl7aFLdrMYhOiXS9SKdy3LF6xqm2L8MWUGh
	 i/l23/GfrDc+HEW/x1v91Cok3DbD4wWmQUpm8aR7CZ294lHZafny9/3/uYMlh5DgwFgky
	 73sn2Cfyt8qk05V3KvPpMXDlvfHHkI+Jr3atNHHy4Nc30RXVq67mSIWzKXaa7cI/KS53t
	 9bK//fSUjcDJYXVrlbSeCSLmt2rt+mmb+zZOWp+fJ/MWnFCnpgpaUHR4C/qragWYSYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUVR9x8w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85B7606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A85B7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUVR9x8w
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38692f62b22so10980391eec.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:47:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795787247; cv=none;
        d=google.com; s=arc-20260327;
        b=YGbbHef2qgLQzf0GyEPVg0Z5Cbfzv1M7RZ1PAEhkrUJIHrDWswYuTqi4JRMvAPNMiF
         /14lZPsMpCT/ZYifp/DjnLmiLA28NeHORQlKvxAlj4NtV7JOoFEe2955voX5A9/psjDh
         /rkBSoQCMpiZNWSG7GItjg0wo2gubrl+HhGA8q1oXacdngA34+ifzezdJB9oPo5ek3hX
         qYaDh5BNQPBiNPuk1zvqR5SiXfD3UHlkGcEvW6vLoeqPnrfYxGqwzCakZGcQ22tkEPLX
         Q7jQvwooPpzXTDv35Ua+yDIAdNKAa23e/yOY0UFQ2OEBdPNjWojmuPJbdhxkP8kNHztj
         qfdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ddtVqoOZQDOONta1BJaQFWf5kTSu9vJTN1sHT88/s58=;
        fh=tdQUApX7q9TPqxxi40Ii1EqwnOYeyAGfzo+bIFJh1R4=;
        b=qrc0yJxdgtQBT7A4jn84EczkmC5TFvaUPWfSP4RGzPPoFAsVEpbqg/cFZWmqKzZm85
         SwRR0N0mpjJW+V9dbpzKGAKVhANbUOFqf/R+Uk3NKFsC9XBcoDSFNucoMa5nI78xORdE
         GuPiLjIj94olltDsQKSOCWhEJp2qA+GYqwRkNk+BzgoH1cjXsxORT6CFmO0VrX1XJ/Te
         csjjuF7CpsSkO/4VqKahLzg30nQCXT9MJzvtBZWWDSbCNxtTjYfJ1lCktEFhVYHD51ke
         wq9d8Jha3ibQo8YJ+Er9keTZgbg/MmWIufPCuV3OO9xPVO9AUoYTCSLnY2YQSKS0r4yI
         O7rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787247; x=1796392047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ddtVqoOZQDOONta1BJaQFWf5kTSu9vJTN1sHT88/s58=;
        b=dUVR9x8wINV27by/P945Q1Mnn+TjenEZ7rmUKnmHjkBJdNA/hToPBUKj0ldeNrQgHl
         lxv4mj/B76K/QB5IEfllaOW5jcSgt1pVGTmY/JkD/bw6e/Tu+bfL9RzTORynYljzkdKN
         MPGVzmBrfbrkCkhtxNZJtHAPEHl3XqRM48ovuy67yR5Ai18sVp2nSj53qIRzCuq3baH4
         xwT2JZPjNzlajHAHiZH1B+2FV7xyyIdAKl993uhPpJlyELepKHK15AmJbJyCWn4epqBW
         EoAwfOSWV5sp4gFxAgR0uX2OMD0I3L9AB4p0jsUNLTsBeAlYN4gA7jTfPa5rXrp+HYxj
         tRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787247; x=1796392047;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddtVqoOZQDOONta1BJaQFWf5kTSu9vJTN1sHT88/s58=;
        b=y5DS5AliJetLM1AK4RFKUThj8D3HG5QITus47EcutkHtGaXUlwUfxHqRYy7lhlZQHI
         V5aMeHZJCakF4BFxt31jLwGzMyGImy2FE72waebdG6DevWu4HGm66hR8EKZCHv5P+LUK
         3LpZyiSh5gFulsuh45QPz3x8Udp4SbwAqU4z2GQobF1H1vxNf1VfpQqPYKuLhDXnprSW
         nJNhvkNsBJo6ohc87PHcQi638FUXlaUsQX5HOxmfkTSzEZ88shpbVAJ4IbVJovh+g/FO
         QNeMcEE4we+KQlenBcNbpuK68JBNZGqZO6YGQUTHSqQ/I0neXA3N5k3PS9jFLqVsM9mU
         qiNA==
X-Forwarded-Encrypted: i=1; AL+hErGqU8OOEDWewtCcwM/CtZ0R66Bla9pGa8UK81akd6Ei2HS4E8jGmpqe8snqNQbqddPB6Te44eMDhcGF@vger.kernel.org
X-Gm-Message-State: APuU4Z/lMNDcd7l2GPz7KcsNn8306SOuq4q1gj2G69hQ5WwD7J2rN8en
	UXcF+WVzyvPPU0t6+mdHzgqvnKSXw2XcN/f5l4bskbkvWUpzaz4qc0dznSoVMqgyoFqUqjr2S+G
	aKnCDL9IfxqHGTgunCy950ht7PHP4P9o=
X-Gm-Gg: AZFdTZe6YEnF+3iNGV/UXUbA9z7BJCTBi+9hwQIsyHMXvapmHqaJqtLsPyrSjGoVvO/
	MGX+atcs/8493AUNfv5Zrao5xdYHucAuCBNaHYgDMZIuzEvcLBCn0Ta4nf7/zNuJ46f/982AWDC
	fpwqrkbqi08nr4V4vKqusqKHrD6p8w0YzLcQU0w0Eq2yWZNhL+DqsetQvWzwRbVQTXZt8Jd97KT
	pz5BwAxaCzGGFQvJ8USJ2SKKHAG8FNoS6j/vKmY8wpg0iWT40ETHSmSA9P8WMWorAlVKGtiwTHb
	3DcTh4K2sJ4vrkp6j9EkBuv+FVg5wjJWeaNlIM+ANCZSdBO5prtn+qmbEUz/fY9utREGKdVGJvb
	Aelynqc2EMH4DlF4Q3DLM+Ej9ZA40T6opueCPAg//YM7kakmKj6tp2M837GSz6ny6Hh83qgDLYW
	2gq6OtJFQATV+liRBwlL+PnIibbaVLQQ==
X-Received: by 2002:a05:7300:f0c2:b0:386:688:7f25 with SMTP id
 5a478bee46e88-386068880f5mr24828583eec.18.1795787246637; Fri, 27 Nov 2026
 05:47:26 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <20261122081820.53199-10-clamor95@gmail.com>
 <mxfdX1kqQz209wWYqFOofg@nvidia.com> <CAPVz0n1ZoMfPWKXSbLENDh9f8qxZbdbnvLxbiLxo8fZS-u5Etw@mail.gmail.com>
In-Reply-To: <CAPVz0n1ZoMfPWKXSbLENDh9f8qxZbdbnvLxbiLxo8fZS-u5Etw@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 15:47:15 +0200
X-Gm-Features: Aa3M54rOwXt4RRvrVhin6s6sWmOMRKHUvBDVMPxAeq5_EzajOawjB-8Sauy4qVM
Message-ID: <CAPVz0n1Q85nGx3Aa1Vc8sxsX7cVdMqzk_G5R+5XMaMrLotQC-w@mail.gmail.com>
Subject: Re: [PATCH v8 09/12] drm/tegra: Convert to use atomic versions of drm_encoder_helper_funcs
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:1=
7 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 07=
:24 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > Switch to using the atomic versions of the enable() and disable()
> > > operations.
> > >
> > > This is required for acquiring the next bridge state without causing
> > > crashes, in order to properly set up the encoder.
> >
> > This is a bit vague. I'd make an explicit reference to RGB needing
> > access to the bridge state, which is not possible with the non-atomic
> > functions, and then explaining that DSI / HDMI / SOR are converted for
> > consistency.
> >
>
> Noted
>
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/gpu/drm/tegra/dsi.c  | 20 +++++++++++++++-----
> > >  drivers/gpu/drm/tegra/hdmi.c | 20 +++++++++++++++-----
> > >  drivers/gpu/drm/tegra/rgb.c  | 23 +++++++++++++++++------
> > >  drivers/gpu/drm/tegra/sor.c  | 18 +++++++++++++-----
> > >  4 files changed, 60 insertions(+), 21 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.=
c
> > > index 6d6adc485e51e..cd61070072beb 100644
> > > --- a/drivers/gpu/drm/tegra/dsi.c
> > > +++ b/drivers/gpu/drm/tegra/dsi.c
> > > @@ -855,7 +855,8 @@ static void tegra_dsi_unprepare(struct tegra_dsi =
*dsi)
> > >               dev_err(dsi->dev, "failed to suspend: %d\n", err);
> > >  }
> > >
> > > -static void tegra_dsi_encoder_disable(struct drm_encoder *encoder)
> > > +static void tegra_dsi_encoder_disable(struct drm_encoder *encoder,
> > > +                                   struct drm_atomic_commit *comm_st=
ate)
> > >  {
> > >       struct tegra_output *output =3D encoder_to_output(encoder);
> > >       struct tegra_dc *dc =3D to_tegra_dc(encoder->crtc);
> > > @@ -919,16 +920,25 @@ static int tegra_dsi_prepare(struct tegra_dsi *=
dsi)
> > >       return 0;
> > >  }
> > >
> > > -static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
> > > +static void tegra_dsi_encoder_enable(struct drm_encoder *encoder,
> > > +                                  struct drm_atomic_commit *comm_sta=
te)
> > >  {
> > > -     struct drm_display_mode *mode =3D &encoder->crtc->state->adjust=
ed_mode;
> > >       struct tegra_output *output =3D encoder_to_output(encoder);
> > >       struct tegra_dc *dc =3D to_tegra_dc(encoder->crtc);
> > > +     struct drm_connector_state *conn_state;
> > >       struct tegra_dsi *dsi =3D to_dsi(output);
> > > +     struct drm_crtc_state *crtc_state;
> > > +     struct drm_connector *connector;
> > >       struct tegra_dsi_state *state;
> > > +     struct drm_display_mode *mode;
> > >       u32 value;
> > >       int err;
> > >
> > > +     connector =3D drm_atomic_get_new_connector_for_encoder(comm_sta=
te, encoder);
> > > +     conn_state =3D drm_atomic_get_new_connector_state(comm_state, c=
onnector);
> > > +     crtc_state =3D drm_atomic_get_new_crtc_state(comm_state, conn_s=
tate->crtc);
> > > +     mode =3D &crtc_state->adjusted_mode;
> > > +
> > >       err =3D tegra_dsi_prepare(dsi);
> > >       if (err < 0) {
> > >               dev_err(dsi->dev, "failed to prepare: %d\n", err);
> >
> > The function also uses encoder->crtc and tegra_dsi_get_state. Should
> > these be changed to conn_state->crtc and to_dsi_state(conn_state)?
> >
> > Similarly for HDMI / SOR.
> >
>
> I must have missed that. Good catch
>

encoder->crtc into conn_state->crtc is pretty straight forward, but
tegra_dsi_get_state() is more obscure to me, how should I approach it?

> > > @@ -1059,8 +1069,8 @@ static const struct drm_encoder_funcs tegra_dsi=
_encoder_funcs =3D {
> > >  };
> > >
> > >  static const struct drm_encoder_helper_funcs tegra_dsi_encoder_helpe=
r_funcs =3D {
> > > -     .disable =3D tegra_dsi_encoder_disable,
> > > -     .enable =3D tegra_dsi_encoder_enable,
> > > +     .atomic_disable =3D tegra_dsi_encoder_disable,
> > > +     .atomic_enable =3D tegra_dsi_encoder_enable,
> > >       .atomic_check =3D tegra_dsi_encoder_atomic_check,
> > >  };
> > >
> > > diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdm=
i.c
> > > index e8c4347f09e69..a78279810dd82 100644
> > > --- a/drivers/gpu/drm/tegra/hdmi.c
> > > +++ b/drivers/gpu/drm/tegra/hdmi.c
> > > @@ -1166,7 +1166,8 @@ tegra_hdmi_connector_helper_funcs =3D {
> > >       .mode_valid =3D tegra_hdmi_connector_mode_valid,
> > >  };
> > >
> > > -static void tegra_hdmi_encoder_disable(struct drm_encoder *encoder)
> > > +static void tegra_hdmi_encoder_disable(struct drm_encoder *encoder,
> > > +                                    struct drm_atomic_commit *comm_s=
tate)
> > >  {
> > >       struct tegra_output *output =3D encoder_to_output(encoder);
> > >       struct tegra_dc *dc =3D to_tegra_dc(encoder->crtc);
> > > @@ -1209,18 +1210,27 @@ static void tegra_hdmi_encoder_disable(struct=
 drm_encoder *encoder)
> > >               dev_err(hdmi->dev, "failed to suspend: %d\n", err);
> > >  }
> > >
> > > -static void tegra_hdmi_encoder_enable(struct drm_encoder *encoder)
> > > +static void tegra_hdmi_encoder_enable(struct drm_encoder *encoder,
> > > +                                   struct drm_atomic_commit *comm_st=
ate)
> > >  {
> > > -     struct drm_display_mode *mode =3D &encoder->crtc->state->adjust=
ed_mode;
> > >       unsigned int h_sync_width, h_front_porch, h_back_porch, i, reke=
y;
> > >       struct tegra_output *output =3D encoder_to_output(encoder);
> > >       struct tegra_dc *dc =3D to_tegra_dc(encoder->crtc);
> > >       struct tegra_hdmi *hdmi =3D to_hdmi(output);
> > > +     struct drm_connector_state *conn_state;
> > > +     struct drm_crtc_state *crtc_state;
> > >       unsigned int pulse_start, div82;
> > > +     struct drm_connector *connector;
> > > +     struct drm_display_mode *mode;
> > >       int retries =3D 1000;
> > >       u32 value;
> > >       int err;
> > >
> > > +     connector =3D drm_atomic_get_new_connector_for_encoder(comm_sta=
te, encoder);
> > > +     conn_state =3D drm_atomic_get_new_connector_state(comm_state, c=
onnector);
> > > +     crtc_state =3D drm_atomic_get_new_crtc_state(comm_state, conn_s=
tate->crtc);
> > > +     mode =3D &crtc_state->adjusted_mode;
> > > +
> > >       err =3D host1x_client_resume(&hdmi->client);
> > >       if (err < 0) {
> > >               dev_err(hdmi->dev, "failed to resume: %d\n", err);
> > > @@ -1460,8 +1470,8 @@ tegra_hdmi_encoder_atomic_check(struct drm_enco=
der *encoder,
> > >  }
> > >
> > >  static const struct drm_encoder_helper_funcs tegra_hdmi_encoder_help=
er_funcs =3D {
> > > -     .disable =3D tegra_hdmi_encoder_disable,
> > > -     .enable =3D tegra_hdmi_encoder_enable,
> > > +     .atomic_disable =3D tegra_hdmi_encoder_disable,
> > > +     .atomic_enable =3D tegra_hdmi_encoder_enable,
> > >       .atomic_check =3D tegra_hdmi_encoder_atomic_check,
> > >  };
> > >
> > > diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.=
c
> > > index 227a178f761bd..d48d498068ac8 100644
> > > --- a/drivers/gpu/drm/tegra/rgb.c
> > > +++ b/drivers/gpu/drm/tegra/rgb.c
> > > @@ -90,7 +90,8 @@ static void tegra_dc_write_regs(struct tegra_dc *dc=
,
> > >               tegra_dc_writel(dc, table[i].value, table[i].offset);
> > >  }
> > >
> > > -static void tegra_rgb_encoder_disable(struct drm_encoder *encoder)
> > > +static void tegra_rgb_encoder_disable(struct drm_encoder *encoder,
> > > +                                   struct drm_atomic_commit *state)
> > >  {
> > >       struct tegra_output *output =3D encoder_to_output(encoder);
> > >       struct tegra_rgb *rgb =3D to_rgb(output);
> > > @@ -99,12 +100,22 @@ static void tegra_rgb_encoder_disable(struct drm=
_encoder *encoder)
> > >       tegra_dc_commit(rgb->dc);
> > >  }
> > >
> > > -static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
> > > +static void tegra_rgb_encoder_enable(struct drm_encoder *encoder,
> > > +                                  struct drm_atomic_commit *state)
> > >  {
> > > -     struct drm_display_mode *mode =3D &encoder->crtc->state->adjust=
ed_mode;
> > >       struct tegra_output *output =3D encoder_to_output(encoder);
> > >       struct tegra_rgb *rgb =3D to_rgb(output);
> > > -     u32 value;
> > > +     struct drm_connector_state *conn_state;
> > > +     struct drm_crtc_state *crtc_state;
> > > +     struct drm_connector *connector;
> > > +     struct drm_display_mode *mode;
> > > +     u32 bus_flags, value;
> > > +
> > > +     /* Get mode flags */
> > > +     connector =3D drm_atomic_get_new_connector_for_encoder(state, e=
ncoder);
> > > +     conn_state =3D drm_atomic_get_new_connector_state(state, connec=
tor);
> > > +     crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_state-=
>crtc);
> > > +     mode =3D &crtc_state->adjusted_mode;
> > >
> > >       tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable)=
);
> > >
> > > @@ -201,8 +212,8 @@ static const struct drm_encoder_funcs tegra_rgb_e=
ncoder_funcs =3D {
> > >  };
> > >
> > >  static const struct drm_encoder_helper_funcs tegra_rgb_encoder_helpe=
r_funcs =3D {
> > > -     .disable =3D tegra_rgb_encoder_disable,
> > > -     .enable =3D tegra_rgb_encoder_enable,
> > > +     .atomic_disable =3D tegra_rgb_encoder_disable,
> > > +     .atomic_enable =3D tegra_rgb_encoder_enable,
> > >       .atomic_check =3D tegra_rgb_encoder_atomic_check,
> > >  };
> > >
> > > diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.=
c
> > > index ebac9068b670f..45a9ea94c4355 100644
> > > --- a/drivers/gpu/drm/tegra/sor.c
> > > +++ b/drivers/gpu/drm/tegra/sor.c
> > > @@ -2203,7 +2203,8 @@ static void tegra_sor_hdmi_scdc_start(struct te=
gra_sor *sor)
> > >       }
> > >  }
> > >
> > > -static void tegra_sor_hdmi_disable(struct drm_encoder *encoder)
> > > +static void tegra_sor_hdmi_disable(struct drm_encoder *encoder,
> > > +                                struct drm_atomic_commit *comm_state=
)
> > >  {
> > >       struct tegra_output *output =3D encoder_to_output(encoder);
> > >       struct tegra_dc *dc =3D to_tegra_dc(encoder->crtc);
> > > @@ -2244,13 +2245,17 @@ static void tegra_sor_hdmi_disable(struct drm=
_encoder *encoder)
> > >       host1x_client_suspend(&sor->client);
> > >  }
> > >
> > > -static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
> > > +static void tegra_sor_hdmi_enable(struct drm_encoder *encoder,
> > > +                               struct drm_atomic_commit *comm_state)
> > >  {
> > >       struct tegra_output *output =3D encoder_to_output(encoder);
> > >       unsigned int h_ref_to_sync =3D 1, pulse_start, max_ac;
> > >       struct tegra_dc *dc =3D to_tegra_dc(encoder->crtc);
> > >       struct tegra_sor_hdmi_settings *settings;
> > > +     struct drm_connector_state *conn_state;
> > >       struct tegra_sor *sor =3D to_sor(output);
> > > +     struct drm_crtc_state *crtc_state;
> > > +     struct drm_connector *connector;
> > >       struct tegra_sor_state *state;
> > >       struct drm_display_mode *mode;
> > >       unsigned long rate, pclk;
> > > @@ -2259,7 +2264,10 @@ static void tegra_sor_hdmi_enable(struct drm_e=
ncoder *encoder)
> > >       int err;
> > >
> > >       state =3D to_sor_state(output->connector.state);
> > > -     mode =3D &encoder->crtc->state->adjusted_mode;
> > > +     connector =3D drm_atomic_get_new_connector_for_encoder(comm_sta=
te, encoder);
> > > +     conn_state =3D drm_atomic_get_new_connector_state(comm_state, c=
onnector);
> > > +     crtc_state =3D drm_atomic_get_new_crtc_state(comm_state, conn_s=
tate->crtc);
> > > +     mode =3D &crtc_state->adjusted_mode;
> > >       pclk =3D mode->clock * 1000;
> > >
> > >       err =3D host1x_client_resume(&sor->client);
> > > @@ -2657,8 +2665,8 @@ static void tegra_sor_hdmi_enable(struct drm_en=
coder *encoder)
> > >  }
> > >
> > >  static const struct drm_encoder_helper_funcs tegra_sor_hdmi_helpers =
=3D {
> > > -     .disable =3D tegra_sor_hdmi_disable,
> > > -     .enable =3D tegra_sor_hdmi_enable,
> > > +     .atomic_disable =3D tegra_sor_hdmi_disable,
> > > +     .atomic_enable =3D tegra_sor_hdmi_enable,
> > >       .atomic_check =3D tegra_sor_encoder_atomic_check,
> > >  };
> > >
> > > --
> > > 2.53.0
> > >
> > >
> >
> >
> >
> >
