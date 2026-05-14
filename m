Received: from out28-115.mail.aliyun.com (out28-115.mail.aliyun.com [115.124.28.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC721E8826
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 01:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778722866; cv=none; b=ESzPiYEj6gdgX5TsK02mYIzpcfP76klHxWSBZG5XY/qB+6nDbEk0UABsb2uEuZ5cITrA8wCuAVVyJcyO4wnIiAhuMaY/R/NWbuTdKbExdkijiEeQ0jsFwfqmarW/gEuoPYWvCLPnj9z13CU2V0W+sq3g929PW/HEF5vSYypEGrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778722866; c=relaxed/simple;
	bh=UnJrnprjJI40cyQqWZmV8Lcq8R0JpcuqgBa957VU6NY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eJcR5FCeheMRiO2O0fK062JlAgrw9wF+R8I/oDMIaj6D6XNzto4ObKCWicNqFATOMBT/qZQwDQnXILXYebUxKFJPFK+1OIruJUVta8Q7MjkSUwW+aTSxrURhgjIpOj6GPYL2/DHOl+03oAoXP0NW0j3Q37S0G5rxqVNthFoiuJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=gAQ+2LPN; arc=none smtp.client-ip=115.124.28.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="gAQ+2LPN"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1778722856; h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
	bh=paSUUNeM9d+Dg+dK0ePPB8BCcy3aHvmTkKmP2lDWFOQ=;
	b=gAQ+2LPNdZb6AuF0A2+9VrYyhwGdRWEV9kV9V0AfmTRzGC8/iBGqN0ZMhMQMlVWm+AjN0VZGCKKzCayDtbeCGYVmoPgc/S07odvm2B/5Bn1VER0t8oxZSC0mi1UY7f7+mYGBausHP1cSg+d41oXdOz+q7ArmSdcwgOiay/MQXSb0+4mFy89YcGXmRA9n9sTEO3Q8PxbjYOVOfrer4zwvU/8wljzQRctsidQeeMRK1yHTNatTncqYSdxsg0D0Jp1nR4i8/l7ga0TZAxUOr1L9nzPlVMLNzfr83lxI6h2gfA7p94OihYKEZO40CRDhDh+8bQxgBVxWig8aSR3BAbEfvQ==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.3534878|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_regular_dialog|0.174381-0.0202541-0.805365;FP=11096877952077132768|6|1|5|0|-1|-1|-1;HT=maildocker-contentspam011083013073;MF=syyang@lontium.com;NM=1;PH=DS;RN=1;RT=1;SR=0;TI=SMTPD_---.hWhJdXr_1778722853;
Received: from mail-oo1-f51.google.com(mailfrom:syyang@lontium.com fp:SMTPD_---.hWhJdXr_1778722853 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 14 May 2026 09:40:54 +0800
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6948ed7139eso3717997eaf.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:40:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+hJDdmwy+zgumsryLaN2PF8Crq3ZzoTWcmGINbNFHAj9nt97vNqpB6eX5rSl5V0Z5aIE2pt3FV+mXq@vger.kernel.org
X-Gm-Message-State: AOJu0YwgfP6eiLFF5z5Segj5QEqQJd24flOPEYMP+vrAMTRKA8KaPjId
	ZjWd5UWdBCVQQItI/h+N0qRfsW75VCQBHMdIBOsCixECbVG7rNMAqE2KViKfCKDqxlfr/TGhDPC
	qM7YE0fa0qLvWKxmp+J2bop34bTZe1HE=
X-Received: by 2002:a05:6820:818d:b0:694:980c:9609 with SMTP id
 006d021491bc7-69b7ab2de0emr2947356eaf.36.1778722852317; Wed, 13 May 2026
 18:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507034049.97765-1-syyang@lontium.com> <20260513192515.GA1728398-robh@kernel.org>
In-Reply-To: <20260513192515.GA1728398-robh@kernel.org>
From: Sunyun Yang <syyang@lontium.com>
Date: Thu, 14 May 2026 09:40:40 +0800
X-Gmail-Original-Message-ID: <CAFQXuNb8WBrCvBpdKdpCUSdrS+qEWjyETE0qD09LH5HOfjOH7A@mail.gmail.com>
X-Gm-Features: AVHnY4IkVGhomaeI1wAG41IL6-oFivJQBQuT2mzo4d72gRbFAuy9FvNbwo8LR2Q
Message-ID: <CAFQXuNb8WBrCvBpdKdpCUSdrS+qEWjyETE0qD09LH5HOfjOH7A@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, 
	maarten.lankhorst@linux.intel.com, rfoss@kernel.org, mripard@kernel.org, 
	Laurent.pinchart@ideasonboard.com, tzimmermann@suse.de, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com, rlyu@lontium.com, 
	xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Rob Herring <robh@kernel.org> =E4=BA=8E2026=E5=B9=B45=E6=9C=8814=E6=97=A5=
=E5=91=A8=E5=9B=9B 03:25=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, May 07, 2026 at 11:40:49AM +0800, syyang@lontium.com wrote:
> > From: Sunyun Yang <syyang@lontium.com>
> >
> > LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual por=
t
> > mipi dsi and output hdmi, differences in hardware features:
> > - LT9611C: supports 1-port mipi dsi to hdmi 1.4
> > - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
> > - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0
> >
> > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > ---
> >  .../bindings/display/bridge/lontium,lt9611.yaml           | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,l=
t9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt961=
1.yaml
> > index 429a06057ae8..b20a43456b01 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.y=
aml
> > +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.y=
aml
> > @@ -4,19 +4,23 @@
> >  $id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >
> > -title: Lontium LT9611(UXC) 2 Port MIPI to HDMI Bridge
> > +title: Lontium LT9611(UXC/C/EX/UXD) 2 Port MIPI DSI to HDMI Bridge
> >
> >  maintainers:
> >    - Vinod Koul <vkoul@kernel.org>
> >
> >  description: |
> > -  The LT9611 and LT9611UXC are bridge devices which convert DSI to HDM=
I
> > +  The LT9611=E3=80=81LT9611UXC=E3=80=81LT9611C=E3=80=81LT9611EX and LT=
9611UXD
>
> Use a normal ','.
>
> > +  are bridge devices which convert DSI to HDMI
>
> Missing period.
>

thanks, Rob Herring.

we will fixed in patch v7.

> >
> >  properties:
> >    compatible:
> >      enum:
> >        - lontium,lt9611
> >        - lontium,lt9611uxc
> > +      - lontium,lt9611c
> > +      - lontium,lt9611ex
> > +      - lontium,lt9611uxd
> >
> >    reg:
> >      maxItems: 1
> > --
> > 2.34.1
> >
