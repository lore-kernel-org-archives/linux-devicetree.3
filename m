Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FECC311C32
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 13:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786023422; cv=none; b=SFUZUEHw1fBzw8awwtz4/kXwl6VMIM1/R1pNqDkeodQvzPpuRjN0KnfAqBBxHdnjf+/wuP7eBVMzXgD0m8JnGNZR7NRd25fpqXRXz5qiDPQRYtZyWiEQQy+1YBdWmwxNsPqEbqGsiwMuYgCPhTIYGNVA8G1ZP6pKv5ieINGeDUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786023422; c=relaxed/simple;
	bh=U88YaCTDP77ux8I9RZI+XBGK0Xh01lOACdstLlH+1Ww=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f2K4XFx/SQQxqK3VLwbeXjl5GH+V6+giW5vQD5CnIyYMlIvo5oircaFz11j22LKdsicZ8gy546lQWnrXLrN3uRGEl5JyJCvZkzvkyFurK1uxnjsJYCZ19oHpf+b0cXMeVJ3TZfXwOENr9Lv6j4O64NPjs9c1MdvlVs/ePFLCDUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XTCOLcLg; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XTCOLcLg"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4956242332dso17414605e9.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 06:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786023414; x=1786628214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U88YaCTDP77ux8I9RZI+XBGK0Xh01lOACdstLlH+1Ww=;
        b=XTCOLcLgw/bBUioNX1Gz1lSR623kvmHxdBfT44paVb/Id2JQjCFIOnX4AQwRYxL3aj
         utf8eCvgsMc/70qBY6zJ2raVfbaYzDQ7sZ7X/oEwgY9x0MCrNNcuICbnduJP/bN+dCkO
         Sk6vAO8LJnsrSGc/c9s1NWQAE/gsHQ2fYgBmUjbSLsgOyjA8QuuoD2b+EI0JCymH/O4m
         CAlOAypy/qp180GDtgR8vX8WUmS5+3M+24GPHLqQJmNmT/DfC9UX63O1qGYZYHD+v6bN
         XLbfb+egrZyvQcqoCHM/cSJVzJdZIPmRuHHxX/CGRmdjV1dBFq4Ykc0kVeE/iYCsFF+f
         +zQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786023414; x=1786628214;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U88YaCTDP77ux8I9RZI+XBGK0Xh01lOACdstLlH+1Ww=;
        b=c2LHojcKUWDOetIE07FxPEUgd4bS1WnubJXLsFg6DtZP7CN+ZZgOuZ79NudOXCZWOT
         5wx/5zHhnjUaTod5HA23ozcnU9YGwsjFs4UH7N1EOZbQ0M3Ugm9auI94WTS2M0JJ/BCy
         YzIKpmaPTWSjOvZiZf/WCJi5MdMZ62FUcJukZoX5K/w9hsrO/9fBO7ctJkl9XoiDIxB9
         7U3GhUscWnA+xHj+74w2lev0PvrmeQhXmUxDv3UxkkXnBhjBfE/95wCcJXnBZDtYChY+
         GJqUAGzfyV4MJC4oqDuh6EydysiJQsHCL198Yu2rv+cL4V7Yui/PRET9p7fzTBvp9qwh
         XP9w==
X-Forwarded-Encrypted: i=1; AHgh+Rqgc69uLColNMQvLT8GsJb1xIl0x0ThAYlHqELcz0Db3/FbIVRQPGPmqs1EPrPZaK3o0TpUUUUT5nnl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3kOL//Zrm9zkIFGbkH+1epj/JmSl/q94lF6aiIf8wquSJYe9x
	8nRCjzfVx81xqCiYOwpszgtz5skEM+vkbDbdAn+unDH0cIavDsUeZJhCswqdutfHDGo=
X-Gm-Gg: AR+sD10i4bN23CwpTJLfLHRG9d8QD0nSFbIJVd+GWYO9YF4AsNLU6IIV+6lb6NREF8n
	xL1rxFB1agjQEUyqQbLuHDyhmnhnkBEof29rDDyoOfEs6ZlFq139yZVTGCDNmAy/KS2R+wJnhzz
	l2Y12wIsR3+6iiunEPvHtICPMa/JbYNNYJZlO67lfIiJ4EPRgQo05I9eqLH1+gfD6RqbDyyhEWL
	eU/GNmWOHEOoeT3AKZZUwqoms1T1ssO8gz8Qw/+diu1lAEVtk6jE92aDGXHT4AJGUU3wBWGT02f
	TgjvzoeVvkciA9dtVXSpOrJ6OXX72fNYduDIK1kA4l/XjTRgtuJBHbSQPVGRrnVMXBAceQmmQn9
	S9dGSdUeBM+YA3T+ZVUXL4pkW1nza+XSKHppcZ3GlC55BVGo6P55j8YV1GyLpBNXujeLSGIge2D
	KKezHRMttPVxouPQFjqMejwUlym21FcdpibfXYHes5So0YbmaE2Gs7+QnIr45WntZ+/1+6XA==
X-Received: by 2002:a05:600c:a47:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-4994e718f78mr181985665e9.5.1786023414119;
        Thu, 06 Aug 2026 06:36:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:7fb5:508c:267f:30e7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4994e98adc4sm103906245e9.2.2026.08.06.06.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 06:36:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Chen-Yu Tsai <wens@kernel.org>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] mfd: axp20x: Add support for AXP318W PMIC
In-Reply-To: <20260806122433.GB2869284@google.com> (Lee Jones's message of
	"Thu, 6 Aug 2026 13:24:33 +0100")
References: <20260717-axp318-regulator-v4-0-50aff97084dd@baylibre.com>
	<20260717-axp318-regulator-v4-2-50aff97084dd@baylibre.com>
	<20260806120952.GA2869284@google.com>
	<20260806122433.GB2869284@google.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 06 Aug 2026 15:36:51 +0200
Message-ID: <1j1pcbxte4.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On jeu. 06 ao=C3=BBt 2026 at 13:24, Lee Jones <lee@kernel.org> wrote:

> On Thu, 06 Aug 2026, Lee Jones wrote:
>
>> /* Sashiko Automation: Issues Found (2 Findings) */
>>=20
>> Please explain or fix these Sashiko reviews.
>
> Also, please Cc: the MFD mailing list next time and you get these for fre=
e.

Hi Lee, this mailing list does not seem to be provided under the
'MULTIFUNCTION DEVICES (MFD)' entry of MAINTAINERS. I've been using b4
to get the series out. As far as I know, it only picks what is
documented there. Is it documented somewhere else ?

--=20
Jerome
