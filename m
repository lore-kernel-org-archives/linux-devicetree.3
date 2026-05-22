Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471E6282F34
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779465096; cv=none; b=I+yj3lYpqFBkEREneYqAOM5Ard6j5/VKGizyYLEyT3/Y7NS0PJaB1CWeUfQuelXcieoRm84EHHKuOXh7HTNsmAVi74GB8iILtmNxYy8qSmRE8X8J+1i5nAmqUAk0ZfHuyOvzj8BSkNoeSoduGMqkJb4uTfzQPZPwd54OYT/trBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779465096; c=relaxed/simple;
	bh=CmsULhgzdpYks2pjKVsx1r2w1Y1WKpYU4+YB5dkEfOM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n1kWPJNcd/UXcHVvIXFMUtC4sGUFTgIZ9HGgblPf1BK0ACa7EpSaMMiCL9gDXgZpSYUFtfV9mht/Au//4FU4VFHFetHkFvDODpv9wJYrrHZIg9foKnU45FziqPLAHU0pQH4oQc08TPft11QV95BLpObbfyj4+f02k552KqgSE0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rKj//MpW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rKj//MpW"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso56816935e9.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779465094; x=1780069894; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CmsULhgzdpYks2pjKVsx1r2w1Y1WKpYU4+YB5dkEfOM=;
        b=rKj//MpWYvgl/WEPlyaCNyIGqwZv91i9Ch0Bg57F+n81vFYVP8yem0EdifpngHBlkT
         D6ggndop7A5Y+V12jurr9W/eAE2o7US/jn66PLy3f1Vb87CDnJ5SJ7xLHOOkOOpOX9+z
         8doNmbWos4QGfNDKQVEdg2Vgc5cAk0F0t1uz5v8ryUy0gUATSojWAgBTyY3mfWPs0wQ2
         MY5ZYjTi/7rlW34IZWdZQwW8H5PZ81rSII32BTzOpSY/NEmx7CZvYAtFKqOeL2rEy9pR
         vDVQ83M0xzAOVuNWB1ELoIqM+1PPIrhmrT2Shd2gNV068YFM+A5ifRYAn+HVLmqjHIh3
         Ypaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779465094; x=1780069894;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CmsULhgzdpYks2pjKVsx1r2w1Y1WKpYU4+YB5dkEfOM=;
        b=BpldDhuo+vE84MEnFZScqYoY7tTvF+gX1hunPE+fyuf2f3qpWr+9023YOCT5w1qNMA
         CVS4r6j22tD1xjyP5CyDG41L7D2zkIVHhQaSk3BiPIzSFxtnpfH67HwTY6j/uI15+pqR
         6z3lqFJRBqKEdQKY5Mls/zDWCSLryWrNayvMrTYkpboOiM6reIZ5JkzzxU3SQATzXlHY
         mzGBJuzLV/1L553pG4F7NKYx2VxBgkwJkCAnoEW2phOt61fizN5VjuIGnY6XBUSAuS/6
         PikFuI0wDdKqOCYJqyXh2kvEsOate5CBLMO+8qShUetPvhh+3tvoYellzSdSmRhu5xZA
         Yv3A==
X-Forwarded-Encrypted: i=1; AFNElJ/MLinvoVW1FswaWi+VB0wlSce7o8SzSlohw9+nyTazIniTppcwvbq/7+FHwpdWnKZNoRUtvNFgICmt@vger.kernel.org
X-Gm-Message-State: AOJu0YzAW1+pvhYzRPxouJCCWiWF6qsHSKReQkXvrS46stmto1kgG9mD
	PJ1SAaeafR5Yc0keN5odxHycCcLCaFvyImDxuhWapEFq9aQaW5EbNcyL
X-Gm-Gg: Acq92OEojZ6wQWH/XO7dnq0gXFQpTMBxL2MNOTlu15osWYf1TRvTdLFnmcXZYtfK5ap
	k8USJuGJbrZcWihNHX2n3b+wi6TMWY+qAHgZ1/cL3aVSvMC0M/rebw3xlZQq4FSkSGr4G4T9e1e
	frVF2+y8eYGMFk3oHmfZDXDqDcsC3qDI60NVVp/gLgA+ScYBz5WrNhrq33721tMWjkbL8XQjZXz
	vsPZTLgUenrk/RdVErWVWdS/wMyWDbLYrI81okGn8KVCfasGv4mr4Xj+EzXdCfWe1TOArxyw48C
	oaYCEW5oth/X70hh+DsbHzc+nzMpIXp9PRKzpmPTUSyTRWp4dZo5VwjZPoolYwvNWwye4cTmHHw
	HB0HWoNRDX9mNrlLLQkiD886Ij7Fsv7qA+ZK4M/f8f2aYsanl9cz36n3POXNOq9L7EkCMi8tYjw
	GC4Dpy3zMQtdjf/RUY0m7rp/LQBmROGhKcCu8TezJtrB7W57hz
X-Received: by 2002:a05:600d:640f:10b0:490:3ff5:737f with SMTP id 5b1f17b1804b1-490426cefe0mr46813985e9.18.1779465093265;
        Fri, 22 May 2026 08:51:33 -0700 (PDT)
Received: from vitor-nb.Home (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042af026esm17298825e9.30.2026.05.22.08.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 08:51:32 -0700 (PDT)
Message-ID: <a6d42b33eaf5dd1e0fcfb3d4854968a081a212b1.camel@gmail.com>
Subject: Re: [PATCH v2 01/11] arm64: dts: ti: k3-am62-verdin: Add Toradex
 DSI to LVDS adapter with 10.1" display
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>,  Tero Kristo <kristo@kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding
 <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
 dri-devel@lists.freedesktop.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Date: Fri, 22 May 2026 16:51:31 +0100
In-Reply-To: <20260522132014.226721-14-ivitro@gmail.com>
References: <20260522132014.226721-13-ivitro@gmail.com>
	 <20260522132014.226721-14-ivitro@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu2.1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGksCgpPbiBGcmksIDIwMjYtMDUtMjIgYXQgMTQ6MjAgKzAxMDAsIFZpdG9yIFNvYXJlcyB3cm90
ZToKPiBGcm9tOiBWaXRvciBTb2FyZXMgPHZpdG9yLnNvYXJlc0B0b3JhZGV4LmNvbT4KPiAKPiBB
ZGQgYSBkZXZpY2UgdHJlZSBvdmVybGF5IGZvciB0aGUgVG9yYWRleCBEU0kgdG8gTFZEUyBBZGFw
dGVyIHdpdGggdGhlCj4gVG9yYWRleCBDYXBhY2l0aXZlIFRvdWNoIERpc3BsYXkgMTAuMSIgTFZE
Uy4gVGhlIGFkYXB0ZXIgY29ubmVjdHMgdG8gdGhlCj4gVmVyZGluIERTSV8xIGludGVyZmFjZS4g
SXQgaXMgYmFzZWQgb24gdGhlIFRleGFzIEluc3RydW1lbnRzIFNONjVEU0k4NAo+IERTSS10by1M
VkRTIGJyaWRnZSBhbmQgZHJpdmVzIGEgTG9naWNUZWNobm8gTFQxNzA0MTAtMldIQyAxMC4xIiBX
WEdBIExWRFMKPiBwYW5lbC4gVG91Y2ggaW5wdXQgaXMgcHJvdmlkZWQgYnkgYW4gQXRtZWwgTWF4
VG91Y2ggY2FwYWNpdGl2ZSB0b3VjaAo+IGNvbnRyb2xsZXIuCj4gCj4gTGluazoKPiBodHRwczov
L2RldmVsb3Blci50b3JhZGV4LmNvbS9oYXJkd2FyZS9hY2Nlc3Nvcmllcy9hZGQtb25zL2RzaS1s
dmRzLWFkYXB0ZXIKPiBMaW5rOgo+IGh0dHBzOi8vZGV2ZWxvcGVyLnRvcmFkZXguY29tL2hhcmR3
YXJlL2FjY2Vzc29yaWVzL2Rpc3BsYXlzL2NhcGFjaXRpdmUtdG91Y2gtZGlzcGxheS0xMDFpbmNo
LWx2ZHMKPiBBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1zb25uZXQtNC42Cj4gU2lnbmVkLW9m
Zi1ieTogVml0b3IgU29hcmVzIDx2aXRvci5zb2FyZXNAdG9yYWRleC5jb20+Cj4gClsuLi5dCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvdGkvazMtYW02MjUtdmVyZGluLWRzaS10
by1sdmRzLXBhbmVsLWNhcC0KPiB0b3VjaC0xMGluY2guZHRzbyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvdGkvazMtYW02MjUtdmVyZGluLWRzaS10by1sdmRzLXBhbmVsLQo+IGNhcC10b3VjaC0xMGlu
Y2guZHRzbwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wZTg3
M2YyY2NmNjUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy90aS9r
My1hbTYyNS12ZXJkaW4tZHNpLXRvLWx2ZHMtcGFuZWwtY2FwLXRvdWNoLQo+IDEwaW5jaC5kdHNv
Cj4gClsuLi5dCj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJlZ18zdjNfbHZkc19icmlkZ2U6IHJlZ3Vs
YXRvci0zdjMtbHZkcy1icmlkZ2Ugewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBj
b21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+Owo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsK
ClNhc2hpa28gZmxhZ2dlZCB0aGUgbWlzc2luZyAncmVndWxhdG9yLW5hbWUnIHByb3BlcnR5IGhl
cmUsIAoKPiArwqDCoMKgwqDCoMKgwqB9Owo+ICt9Owo+ICsKPiAKClsuLi5dCj4gKwo+ICvCoMKg
wqDCoMKgwqDCoHRvdWNoQDRhIHsKCmFuZCB0byB1c2UgdGhlIGdlbmVyaWMgbm9kZSBuYW1lICd0
b3VjaHNjcmVlbkA0YScgaGVyZSBpbnN0ZWFkIG9mCid0b3VjaEA0YScuCgo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBjb21wYXRpYmxlID0gImF0bWVsLG1heHRvdWNoIjsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnID0gPDB4NGE+Owo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBwaW5jdHJsLTAgPSA8JnBpbmN0cmxfZHNpMV9pbnQ+LCA8JnBp
bmN0cmxfaTJzXzJfYmNsa19ncGlvPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
LyogVmVyZGluIEdQSU9fOV9EU0kgKFNPRElNTSAxNykgLSBUT1VDSF9JTlQjICovCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludGVycnVwdC1wYXJlbnQgPSA8Jm1haW5fZ3BpbzE+
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRlcnJ1cHRzID0gPDQ5IElSUV9U
WVBFX0VER0VfRkFMTElORz47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIFZl
cmRpbiBJMlNfMl9CQ0xLIChTT0RJTU0gNDIpIC0gVE9VQ0hfUkVTRVQjICovCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlc2V0LWdwaW9zID0gPCZtYWluX2dwaW8wIDM1IEdQSU9f
QUNUSVZFX0xPVz47Cj4gK8KgwqDCoMKgwqDCoMKgfTsKPiArfTsKCkkgd2lsbCBzZW5kIGEgdjMg
YWRkcmVzc2luZyB0aGVzZSBpc3N1ZXMgaGVyZSBhbmQgd2hlcmUgaXQgYXBwbGllcy4KClRoYW5r
cywKVml0b3IgU29hcmVzCg==

