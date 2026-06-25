Received: from out28-74.mail.aliyun.com (out28-74.mail.aliyun.com [115.124.28.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF935324B2D
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782352918; cv=none; b=o4wnNRIN34VboWy32/LvYgQfY+1sVyozFHXPx8nwcCyVj4v2eMHY7VT4A1QmFP5bedu7ZIDQFOL9OKFTIcmxYQft4CvrmXmkSRS/wprFXkCjsn1Ff7qUl1EAjkVbDl7DWu2utO/dx+lmRLWr7HbIElb+wFFjuUreYktDVbH/sdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782352918; c=relaxed/simple;
	bh=Xt0iDNrtZUtHEYxWCe4+Z+wRI24JS8InXOARf8ANElk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pC9fDj4cdpgCz4hNSUwPn1K3ag1S37tGAubjSVmRMrJYM5Tawc5QOZZQM389akV3NVZ7XP/VXPJQip8gMDF/oBlngseRTZfwuhrW7IQ/rOw8abjYHoPBFrVAnbIw2+yrt/bF12hcJJ0EW5ESEeNhALIgCzZ18RgErwUmk1xDRl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=Df0sW5SG; arc=none smtp.client-ip=115.124.28.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="Df0sW5SG"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1782352909; h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
	bh=0HI8u0E+ADzDZfgRytV6ZPmS1dcxKzkD8fe0hOt0kNU=;
	b=Df0sW5SGRYnuHT6Dzh8BEWvjdtJ3//CAdj30kuvZK5pyo1GHkbqXo4wUWgs2vRlLxnWrevsrDPGYeKqSeMP+xOIu469D3/PoFP8rmydKog6LAZfUVjHr2RSAfCGkBtc3tggU4h6DTfgGUrt1szguzJm5CxNPKrFr5uwYvHbI3qgJF7k2voIoQtEwElyVCkYUKcmd5Zka7JBkcBRrjoBcIviUpo/OEO2uz6dHNypojkOz7aAHizyrEC7eXU89LUZH5sCt+pgppbmt+VP+uvN/HfH4jnddV0N5nKXQSlPRCETzp3/wUL7h6m5zcOSmMkX4tzEscU2fe+CB+w/pGoZ5xQ==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1482914|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.125752-0.0564426-0.817805;FP=13348672268204241752|6|1|5|0|-1|-1|-1;HT=maildocker-contentspam033045018182;MF=syyang@lontium.com;NM=1;PH=DS;RN=1;RT=1;SR=0;TI=SMTPD_---.i4rixIr_1782352905;
Received: from mail-oi1-f181.google.com(mailfrom:syyang@lontium.com fp:SMTPD_---.i4rixIr_1782352905 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 25 Jun 2026 10:01:46 +0800
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-491f5e6d564so88995b6e.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:01:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9KvGjalDB2IKzVAlBwAIWHpJH6SwADt1pkGv3OO4n6HRhrzTzBNa8ygp7pCFD8QmFWHHbjE9m4+iCL@vger.kernel.org
X-Gm-Message-State: AOJu0YxZTTq+akQI8yy2Ye7bS5o4jH92RWcCz2OcUY0OBgBlcTyzvaig
	m2N7DX21pWylc38S/WVBVe5M9CUpy9xJAtYcGKCjq0by4N/hgKMjhA5d7ecbcMHnz0Ry34Odqj2
	B0KtkerR5RZk/fsZu+T8l5/k7/izJvBw=
X-Received: by 2002:a05:6808:6a96:b0:491:7c98:70fb with SMTP id
 5614622812f47-49218a120a4mr612720b6e.43.1782352905100; Wed, 24 Jun 2026
 19:01:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508142500.4922-1-syyang@lontium.com> <CAFQXuNYq5QYAXRzcUBnyvVh5ofPBVYONCs1dM6qPgK0BDja5Ow@mail.gmail.com>
 <495f0dc3-b5ee-429e-bc60-78b13bcb42c3@kernel.org> <CAFQXuNajWT31q1MccwTDa074_7=6tfaz-FOmP-tx_q83R60QfQ@mail.gmail.com>
In-Reply-To: <CAFQXuNajWT31q1MccwTDa074_7=6tfaz-FOmP-tx_q83R60QfQ@mail.gmail.com>
From: Sunyun Yang <syyang@lontium.com>
Date: Thu, 25 Jun 2026 10:01:33 +0800
X-Gmail-Original-Message-ID: <CAFQXuNbvSQSZayBGcS6L106ic6M9D+xi8CF9=k27fCAn5U8tdg@mail.gmail.com>
X-Gm-Features: AVVi8Cf6lcVS_ZMQoqUlrZQRKTWB8E-LeT1g4fSMafPM6AVXeaL9vSzHlZap9X8
Message-ID: <CAFQXuNbvSQSZayBGcS6L106ic6M9D+xi8CF9=k27fCAn5U8tdg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	dmitry.baryshkov@oss.qualcomm.com, maarten.lankhorst@linux.intel.com, 
	rfoss@kernel.org, mripard@kernel.org, Laurent.pinchart@ideasonboard.com, 
	tzimmermann@suse.de, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, xmzhu@lontium.corp-partner.google.com, 
	xmzhu@lontium.com, rlyu@lontium.com, xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sunyun Yang <syyang@lontium.com> =E4=BA=8E2026=E5=B9=B46=E6=9C=8825=E6=97=
=A5=E5=91=A8=E5=9B=9B 08:52=E5=86=99=E9=81=93=EF=BC=9A
>
> Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B46=E6=9C=8824=
=E6=97=A5=E5=91=A8=E4=B8=89 22:05=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On 11/05/2026 05:28, Sunyun Yang wrote:
> > > <syyang@lontium.com> =E4=BA=8E2026=E5=B9=B45=E6=9C=888=E6=97=A5=E5=91=
=A8=E4=BA=94 22:25=E5=86=99=E9=81=93=EF=BC=9A
> > >>
> > >> From: Sunyun Yang <syyang@lontium.com>
> > >>
> > >> LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual =
port
> > >> mipi dsi and output hdmi, differences in hardware features:
> > >> - LT9611C: supports 1-port mipi dsi to hdmi 1.4
> > >> - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
> > >> - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0
> > >>
> > >> Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > >> ---
> > >>  .../bindings/display/bridge/lontium,lt9611.yaml           | 8 +++++=
+--
> > >>  1 file changed, 6 insertions(+), 2 deletions(-)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/display/bridge/lontiu=
m,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt=
9611.yaml
> > >> index 429a06057ae8..e0821a63d9d7 100644
> > >> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt961=
1.yaml
> > >> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt961=
1.yaml
> > >> @@ -4,19 +4,23 @@
> > >>  $id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.ya=
ml#
> > >>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> > >>
> > >> -title: Lontium LT9611(UXC) 2 Port MIPI to HDMI Bridge
> > >> +title: Lontium LT9611(UXC/C/EX/UXD) 2 Port MIPI DSI to HDMI Bridge
> > >>
> > >>  maintainers:
> > >>    - Vinod Koul <vkoul@kernel.org>
> > >>
> > >>  description: |
> > >> -  The LT9611 and LT9611UXC are bridge devices which convert DSI to =
HDMI
> > >> +  The LT9611=E3=80=81LT9611UXC=E3=80=81LT9611C=E3=80=81LT9611EX and=
 LT9611UXD
> > >> +  are bridge devices which convert DSI to HDMI
> > >>
> > >>  properties:
> > >>    compatible:
> > >>      enum:
> > >>        - lontium,lt9611
> > >> +      - lontium,lt9611c
> > >> +      - lontium,lt9611ex
> > >>        - lontium,lt9611uxc
> > >> +      - lontium,lt9611uxd
> > >>
> > >>    reg:
> > >>      maxItems: 1
> > >> --
> > >
> > > Gentle ping.
> > > Thanks.
> >
> > Except mess with threading, your patchset does not build, when applied
> > on next-20260618.
> >
> > What is the base of this?
> >
>
> Thanks for testing my patchset on next-20260618.
>
> The base of this series is v7.0.
>
Krzysztof,   Is Sashiko AI review required before merging a patch now?

> > Best regards,
> > Krzysztof
