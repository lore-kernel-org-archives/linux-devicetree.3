Received: from out198-19.us.a.mail.aliyun.com (out198-19.us.a.mail.aliyun.com [47.90.198.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CEE37F72F
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778670487; cv=none; b=VsAu0eq/DsbP/GtJ/ZJsLgMd8T9ZyvEJdFJ1ONIjdRgmNtB0sMhk+RfvISlU+2uikpywW7GyjWv6Y1ii5gmGw6ifQ7v+7HWkWn8ynTT9AQYMvA7nOTVTQ2GACUxFvOHva7zmtrL1zF8tmuKnMDAk2UW7oFpqPl3NOeI6B7Laikc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778670487; c=relaxed/simple;
	bh=GkarI6ZblIDma97DgwkVvqcAqBw37bL17SZaqHtfXfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oYq/WNu8nF/pEmd8JOZpSUBhnmFzMBUiIl3pzaQWXQ7jOtgniAQPHxqZMoGJ52XNsLkr08Yu95Sydw6vOBd74CEolcLVYxMBdfdvHfP4sderz0fX+9zj9Sfmv5t/boqx4CQarkdKmf2sIEhr5CBWDj3Xe3HOuNRRvu2dzOXm2Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=OEZpdfXM; arc=none smtp.client-ip=47.90.198.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="OEZpdfXM"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1778670471; h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
	bh=GkarI6ZblIDma97DgwkVvqcAqBw37bL17SZaqHtfXfQ=;
	b=OEZpdfXM+0U8tBh/OXRDtHDxRWAa94Y018muePO4SU3tKbhYENgiRh+CRZYJ0/zPRAll5PEO6jw6oUUWeSdAdbfcCo9SF5WfvFXsWH3Sdn6CK+Al297l043rfiPA58gVfls3YFr8LfkClM4MyxDJ8mhbo5YrhV4lX0FOlYWdUBOEdKlhwDPDyyiL9em04oIzE8qf9cfjp1lbRiWm5KYYF3MRnXrEJ20BuYdkS8WXJGTXyfux50D1iveUM/M7JAq+Mgofk/lvlduVWTMiaPphfbxKdSqJfu2tcGf9q6sUYWxc1LGYG1ss3AJ5KP/MnKFMoxC2a0bswnJjvlyzevBd/Q==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1722893|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00473021-0.000276695-0.994993;FP=9172997517233803977|13|1|11|0|-1|-1|-1;HT=maildocker-contentspam033037021130;MF=syyang@lontium.com;NM=1;PH=DS;RN=1;RT=1;SR=0;TI=SMTPD_---.hWLYuMe_1778670469;
Received: from mail-oi1-f182.google.com(mailfrom:syyang@lontium.com fp:SMTPD_---.hWLYuMe_1778670469 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 13 May 2026 19:07:50 +0800
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-479ef2b78f3so5622968b6e.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:07:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ86EB8jWkMPKU/bS277sa3Ygfp5uiBKZwpdVWqeEzyTmHL8xU3lRt/X9dubFtbXCvLYdlyWZsuqSNgI@vger.kernel.org
X-Gm-Message-State: AOJu0YzpVGn0EqGEIs8dEESB74GoxMq9JTjPIbKHZYzxBqdYZn40KAwo
	NfrxU2cjVFQfwJ3t2ksoZ/ZAM75FwLSMIS66SnqqKAibqCNigvYlbGC4cc0wTrA5nnIWDfvQSuQ
	93u6K/6LHGDji3yH0n2UssVDAVfcmCRU=
X-Received: by 2002:a05:6820:2210:b0:68c:5bdb:8c12 with SMTP id
 006d021491bc7-69b78e41c2dmr1573421eaf.45.1778670468510; Wed, 13 May 2026
 04:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508142500.4922-1-syyang@lontium.com> <CAFQXuNYq5QYAXRzcUBnyvVh5ofPBVYONCs1dM6qPgK0BDja5Ow@mail.gmail.com>
 <vly3gbft3k76mrcztcn6vxuqadz647hsaz2q7qpmpofowofodb@nnxrr2cdueru>
In-Reply-To: <vly3gbft3k76mrcztcn6vxuqadz647hsaz2q7qpmpofowofodb@nnxrr2cdueru>
From: Sunyun Yang <syyang@lontium.com>
Date: Wed, 13 May 2026 19:07:35 +0800
X-Gmail-Original-Message-ID: <CAFQXuNZKoahwq0zoWg860Z-amTKEefBFuen2fDG1htKjzE7ymw@mail.gmail.com>
X-Gm-Features: AVHnY4Lcwpe-EsCtpzpHKhV1BURraPYP_0FYiNqHf3gHIfe2BtoSG9_tFV907DU
Message-ID: <CAFQXuNZKoahwq0zoWg860Z-amTKEefBFuen2fDG1htKjzE7ymw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	maarten.lankhorst@linux.intel.com, rfoss@kernel.org, mripard@kernel.org, 
	Laurent.pinchart@ideasonboard.com, tzimmermann@suse.de, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com, rlyu@lontium.com, 
	xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
5=E6=9C=8813=E6=97=A5=E5=91=A8=E4=B8=89 18:24=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, May 11, 2026 at 11:28:06AM +0800, Sunyun Yang wrote:
> > <syyang@lontium.com> =E4=BA=8E2026=E5=B9=B45=E6=9C=888=E6=97=A5=E5=91=
=A8=E4=BA=94 22:25=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > From: Sunyun Yang <syyang@lontium.com>
> >
> > Gentle ping.
> > Thanks.
>
> You've posted the bindings on May 8th. Please give maintainers some time
> to react. Not to mention that you posting the bindings 4 times in a row
> (once together with the driver and other 3 times separately) doesn't
> help maintainers.
>
Sorry, when I submitted the patch on May 8th, I received bounce
notifications from devicetree@vger.kernel.org and conor+dt@kernel.org,
which is why I sent the patch again.

> See https://lore.kernel.org/dri-devel/?q=3Dbindings+Lt9611c+v6
>
> >
> > > 2.34.1
> > >
>
> --
> With best wishes
> Dmitry
