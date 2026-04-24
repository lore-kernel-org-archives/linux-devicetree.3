Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979A13EF646
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 18:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777055247; cv=pass; b=W0I1SDTZPlqqPkvwlOrFcc1bS6qDq6+CDuwJQqSeksdCP/n5NoTr9CS1fxGDp4Z0tavjDjoLLSJol0DTkoaMtefS9kgl8xdRmPhyyjyz0OVdqYmnY4OrhLXsgSt3iRINlDpFdDM5Ex0WJC+eZTs+Cv7dVfA1VN+2fSreDQvKLYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777055247; c=relaxed/simple;
	bh=7CTY68bsyrtSiDtxKuvOUa8EF73ypzAgDBPbmxeJO2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dg+7hKgEQFGxf/XTEeA0/CwH7J0wnpNJiGM/uWEyXw28j/aHFmBbKeQsN8e6P1PT83uNM9f71ineOwAOpMWokSzeyaf4EA3QYygDrec9tD69b5LwXl4Av2r+87eEn//gEgrNqr8YXj9FYZP72OK0Zs6Jrj2LVUid5shBfrUi0d4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kc9g6edp; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kc9g6edp"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c6df0b9bbso5169512c88.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777055246; cv=none;
        d=google.com; s=arc-20240605;
        b=URZW8cmW4popy43Hl/ebqP2CWSwx/VCYUSHdA6hK5WDgrl07mN+qN2/V+ta73qOdiV
         IAS9FEvvfg9Fk3o7LXaNP/ZXbH6CTmyy+VufMTrrO0QqZrAekKLQytkVXfBxibj+Me7D
         NMqrB8o5dnsm4zs5x5l0DSzeKMIlVpCP9gWTl8bO/v76u0aWnV4k6L82FlFycDvBOSnQ
         wUwHFRC4xc6kSlAKYkmHrWCBy7GAFb7TjehCzjiQL+b7WPuToMx+z4y95k5OdUrEFCGo
         vynulLb3k7yWN40Ydl1CifYOMNxFkGf38+OI01y9A8F875lin1LkdEWO5tZub4mc112W
         20Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8fKE6uWynXvOQK+WQLf5kO4iqhFOCsKdnL+aW04mVOs=;
        fh=IboPf02Awh11RtmxbbErItV5GgbXB3wBsiItzggS6T0=;
        b=ZoeSHBN5mBIBYeQ30Gkqza4xj6bVCaQfyPcqZu7WDkiI/E/e92VwMkKSw/YvlhZAam
         NMHfbLWpUiYEBtCUSI4fKMMt/yiOv0xIzWZS4nRCbECB+F5ukXQT/tqiPDt7PxOt6NeK
         uqH9J25+GJkv/kzZ4G7s4HIp9fjHrjWnkjMWupRaW9VtK5Ld7ZUDJqt51r9grsmY3TMk
         6iytRZMbBTg+6x4Dy93ddoJSvaV6i1DSKIOgJL9lZIELgY6oTVP3UpNj6kv6On56xzH7
         2yG3ej5VGn7KTZ6iTgoisQFQct2u/ICTM7rAlLgAUscIWdOMYmuH7M03xm9r/5Nac5SN
         qNqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777055246; x=1777660046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fKE6uWynXvOQK+WQLf5kO4iqhFOCsKdnL+aW04mVOs=;
        b=kc9g6edpyga1WnwY5RnE2ST6qQSFVa614XzYl7PbL83QzymsDZ7jyQxFs4AIGI/Pb6
         MLZVUdSIJvdnzq/Oar2W2pdBBOYtHOcPg79qzaQv7HeQmqrHZWoMnN5UzsNMDh97yZRT
         VHObSjWGc2YRoUw0rpUurpCahZ6OJ085r4Z+VHO6OjsZLAxXTjH7Rle6dGQ26SicX/cI
         CxBJZSR99AastWlKFD1ZCVw7PUHLQiVK9S2NR698ry/R7hO6jF6c589t5XOTtWZVRGSh
         F1I7NXM/RH3xp5FwhtPhLV9cv/RnvoDFVmgLQIk6GkrM9i+0XoCnvzFDmnrE8fRUQWJu
         arUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777055246; x=1777660046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8fKE6uWynXvOQK+WQLf5kO4iqhFOCsKdnL+aW04mVOs=;
        b=LhiaCssNEKbqhNkRJSNio3rliXFANxWMDo3YolwonJyso24heJfZVqoHKDUVjy6GyM
         EFtE2PLkh26m7CtCMhRwBGoHslxUhQi5MkAyDD3gNDFE3MHym9fHRy+X8+eAunauwk2w
         HMJSpT/2GM82k2adUbag9Iv0v89uwCqUsl5A4+fLDpb9B4/LGGgNjLQcnBu8JGN4dJBd
         5udn9fndOEeTowLwM4mtzOgaAldfNUBTjkDl65so+j8HN+P42qu7QoSKjdG4W8M9vRHg
         5jBjMnEAxY8b9hNaABNnh/wccG5kgDVEg1fL5QGsEWwmVoS4WqBaRQz/R0cfxDBM/Lc7
         Hazg==
X-Forwarded-Encrypted: i=1; AFNElJ82W+2SPfRgf08yyyMBAo2ir076dqMMD52t/pqyQ2q9vUVR3OdlAy4kkK6uhEK4+l//sYHPF8rihs+B@vger.kernel.org
X-Gm-Message-State: AOJu0YwXGB8e9a4yMEOmLKNMtg8lKQifYpPUPjw8vN5JHsQAIspmeJNo
	412+JZxfRXznvnUVdXDPkwMFlfC7MQSTjpNPY/3EdhGJ+W6e70wUWiXZsk++ZcoiX/uFotw7w2I
	hSS9q6Y48RNpu6lqHJZxKBDYAD5dl3gw=
X-Gm-Gg: AeBDieuXTYsmr7hwUKk00o2aOmscisarAUAoAVq/HT12/Bd9YmqQM+NSTY0Qoj+/8CT
	h/RMyJM/zyTxQKbNm3ug+KhLuS8t0PSyXKdOoR508h5FqnO3Xa/Vnr4Pcm+VidNvoHrF4K0kfW0
	y+NRrHdTh76siTAxsoi+VQkOhE5XPVYP2zo53HhGEyP3mBFsLEong0k7nRxbKU0pMy61YQcAJwJ
	w9bQBQW7Y0ZroLi/8h0Dj/l6W9yDupI3spWaO1UauPE4f2oBLN1sapDs1Qms+GTVTga+fi0xc+3
	PxvimuUmUWgQV/NSNalex/gyNkNT/uqB3b1lOL997q5VUEOVuDLMlJDDzn7rX2y14//MTNKhn/6
	MmqbwGrDlFxdzUTa6iuzPbtAE/bAx8b/CBiRyyw==
X-Received: by 2002:a05:7022:383:b0:12a:6fb7:87e3 with SMTP id
 a92af1059eb24-12c73fac0cbmr19164773c88.31.1777055245496; Fri, 24 Apr 2026
 11:27:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
 <20260420-beagley-ai-display-v1-15-f628543dfd14@ideasonboard.com>
 <CAOCHtYjJgqomKreDxLUiVbUtpeh36f0bL-jA6P-6rsoJrweshQ@mail.gmail.com> <cb19eafe-6c25-4a2a-bd31-9fb280837623@ideasonboard.com>
In-Reply-To: <cb19eafe-6c25-4a2a-bd31-9fb280837623@ideasonboard.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 24 Apr 2026 13:26:57 -0500
X-Gm-Features: AQROBzDdYR96fKz8FXyueV-T0huFl-SkTA_xyoSbvkzAGH098Vzr3EpRVRVzohg
Message-ID: <CAOCHtYgQ=71GtnUFkwhoVTkWma9rrbjp3xyKYUGVv1dG63m0Dw@mail.gmail.com>
Subject: Re: [PATCH 15/15] arm64: dts: ti: beagley-ai: Enable HDMI display and audio
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Andrei Aldea <andrei@ti.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lee Jones <lee@kernel.org>, Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Andrew Davis <afd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 12:04=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> On 24/04/2026 19:16, Robert Nelson wrote:
> > On Mon, Apr 20, 2026 at 8:04=E2=80=AFAM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >>
> >> From: Andrew Davis <afd@ti.com>
> >>
> >> Enable HDMI support for BeagleY-AI platform. The display controller us=
ed is
> >> TIDSS and the HDMI bridge used is IT66122.
> >>
> >> Based on DT by: Robert Nelson <robertcnelson@gmail.com>
> >> Signed-off-by: Andrew Davis <afd@ti.com>
> >> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> >> [tomi.valkeinen: cosmetic fixes]
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >
> > Tested-by: Robert Nelson <robertcnelson@gmail.com>
> >
> > Thank you for getting the display back end working on j722s family!
> What displays did you test? I don't have OLDI panel...

I was buggin @Andrei Aldea to get you one. I also don't have the
'special' Lincoln tech display or the TI cloned panel that works on
OLDI..  Right now just HDMI as i decided to tackle cc33xx wifi again
today on mainline..


Regards,

--
Robert Nelson
https://rcn-ee.com/
