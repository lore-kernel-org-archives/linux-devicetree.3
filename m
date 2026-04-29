Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C041C3090D9
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 03:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434631; cv=none; b=jPuQWrTmxzq6Xm76Ed/Vo1E7JfQtU6RD04n84uDY4ZwmTw/xsCVvzGm+oojwZ+W3hVRHaXYi/Vu0f5RljTSplcNPtqGMPeN/r5rjhtQDVoiSN8xIf9lzzO78gu81JQ75Yj2fRaNQ9KOw3cSyHSNMBkbIVRJnTzmb5j6GlOhC0fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434631; c=relaxed/simple;
	bh=hLJ7W6k2uPR0+Erx4tY7u4YyqVWIbtAwQP+bOJG1vBU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-Id:
	 In-Reply-To:References; b=qjyF/96X+oh5c92fpbyZQ0jC2PQOIkdo9CPpMtt3ty5xT3z6MYlWxrgwHwv/qty60d8/3V0YTrvXVcjQKIadJcM6ZYHR276eE3U9sNo5KGQPB2MnumvadnBaxOshOO+fEuI+JCEsEt3M/9XXG5UTKg1iwJ+ulyYjLyVKhC3N3BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsT6Kaf8; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsT6Kaf8"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso7135037a91.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 20:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777434629; x=1778039429; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLJ7W6k2uPR0+Erx4tY7u4YyqVWIbtAwQP+bOJG1vBU=;
        b=TsT6Kaf8eMt9mg+8H2uhOIKn3SIlGkl7fYB35jhVTae+VR6KetsFJMqMnDYxLqj9ti
         g2AMdF327ooldhqGlA5CqGcwWyUPy93MszLQt8XhND9/ydh1aFiYKzRAzGalOlk05h97
         r+i16N0YHTymC0zFTnuIs5YCuv8yZ4lDHTty6mnCfQ/FWwd7EIxEvtedu0+6g4xnP9Wv
         HwxGfiYwiWMF9lfGpHF648fPQM0OLp84Jid2ZvJAXn0OA2PVE1obx8TO22Z+PWwS5bAZ
         HFVcgIpz5BCQdjRY+NValmivHkJXE3B75dy+eshpvmbGy5cS11FE7NS54lFnIReJuP3v
         ocgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777434629; x=1778039429;
        h=references:in-reply-to:message-id:date:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hLJ7W6k2uPR0+Erx4tY7u4YyqVWIbtAwQP+bOJG1vBU=;
        b=KVR9EZvzA+L2aZfcxlL5lkBCo9SAX/jBuWDwXZ3amQ4Ccni/gQnYOPJ4W/8JUqbNxk
         TtbWWYZbYl90ygz6P1EJLABEilU52T4SsV6N87UN0txP5Of6VyAMI7P5SNx3M96CG2OY
         SkrLYSldlKbHwd7i5RCPY3ylhX1yHEw3bRPgh6BmB0rXdCcT99epInhTMAqbq07SXYM0
         H48eQ6p1annvyJ1t4GMu7QuPRXeUOnbcJBM/BT8wkEd4etyoFz5l0GlrffEu7+1XGuax
         Qr1n8BLRjYIydyVEF1GzrT74/S0gUY8FMYY9Mb619Hj9+GwaLlK13ioizEPa/CmOD/T9
         HQ0A==
X-Forwarded-Encrypted: i=1; AFNElJ8hnOnCbjZSIowDkXcPUiW6Tgny3yUceu/kyWxlw9evGvYEWUU/HW+gYZi/0Xppb3IuzsxI4wmDUTH2@vger.kernel.org
X-Gm-Message-State: AOJu0YzllLea4/8unas+a8BXQNb+aUXPqteXZPXbqglk7NtC/snNSe3c
	bEcCoEwKXmbhW53NwIQF7udJ6df0luem6vf/6gE/YQstxJRskWuOPCea
X-Gm-Gg: AeBDieuDEs3rqe2wAk8/NI2hEMUd2wLppqP7MQ/fC/r5ePt0YCv0Cczp1tJlsjfWWt/
	tl9AQW4OZyY66J0raDnXdHasAbTD6NYcw3nT4HCkDelwgwoGuX4tuEq/yDcyJIuwEMyGC1aNYQM
	09Tg+1eS2Xq+e2RI3g5NIS5pgTcLgJRO0ZL/sAUqu57JcWSaQENuk76+n0WA/OVxUYCqix7IX15
	atzsk+wCeDPmOoWWhn71KsxU5UsgUY1lBRlmy/ZqCZlb+tO3NlFnbAEGbJei6hfjO75NUxf1da2
	rBjjc0fr1BmF3vZQeET/1ET84XDvx1E+12/OAE21j92x9ETMBdgCXjx0YYuYQO/27VvKX/VwE5d
	xoeMZv7yEcoAGsjbVLvPwRRQzuzfiS9cBEjpMsDes0Ip2r8bTjgkK5OxbJfxzjKnS2EH2ioQ4Ic
	A0s/r40Zp/CIiYXoYih7WOcbQq2H9rke5/AEsuGnovwYcRHcgXjDhwa6GnSFBeNg==
X-Received: by 2002:a17:90b:4c0e:b0:359:fd9a:c50c with SMTP id 98e67ed59e1d1-3649207e3d0mr6098079a91.22.1777434629090;
        Tue, 28 Apr 2026 20:50:29 -0700 (PDT)
Received: from [127.0.1.1] ([121.160.151.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd606a079sm522381a12.12.2026.04.28.20.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 20:50:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: Re: [PATCH v1 1/2] dt-bindings: gpio: fairchild,74hc595: add
 registers-default property
From: Chanhong Jung <happycpu@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 29 Apr 2026 12:50:25 +0900
Message-Id: <177743462567.993632.18227713228953210194@gmail.com>
In-Reply-To: 
 <CAD++jLkOZGunkfs2EO_DQDPLnLVp+OPG6o4EKaY5GkAcqYQy5w@mail.gmail.com>
References: <cover.1776872453.git.happycpu@gmail.com>
 <33d515f13769c685e6811463a14e111252a7c58d.1776872453.git.happycpu@gmail.com>
 <CAD++jLkOZGunkfs2EO_DQDPLnLVp+OPG6o4EKaY5GkAcqYQy5w@mail.gmail.com>

SGkgTGludXMsCgpUaGFuayB5b3UgZm9yIHRoZSB0aG91Z2h0ZnVsIHJldmlldyAtIHRoaXMgaXMg
ZXhhY3RseSB0aGUga2luZCBvZgpwb2ludGVyIEkgd2FzIGhvcGluZyBmb3IuIFJldXNpbmcgJ2xp
bmVzLWluaXRpYWwtc3RhdGVzJyBpcyBhIG11Y2gKY2xlYW5lciBmaXQgdGhhbiB0aGUgbmV3IHBy
b3BlcnR5IEkgcHJvcG9zZWQsIGFuZCBpdCBlbGVnYW50bHkKcmVzb2x2ZXMgS3J6eXN6dG9mJ3Mg
Y29uY2VybiBpbiB0aGUgc2FtZSBzdHJva2U6ICdsaW5lcy1pbml0aWFsLXN0YXRlcycKaXMgYWxy
ZWFkeSBkb2N1bWVudGVkIHVuZGVyIGEgc2libGluZyBiaW5kaW5nIChueHAscGNmODU3NSksIHNv
IHYyCm9ubHkgd2lkZW5zIGl0cyBhcHBsaWNhYmlsaXR5IHJhdGhlciB0aGFuIGludHJvZHVjaW5n
IGEgZ2VuZXJpYywKbm9uLXZlbmRvci1wcmVmaXhlZCBwcm9wZXJ0eSB0byBhIHZlbmRvci1zcGVj
aWZpYyBiaW5kaW5nLiBUd28KcHJvYmxlbXMsIG9uZSBleGlzdGluZyBjb252ZW50aW9uIC0gdGhh
dCdzIGEgcmVhbGx5IG5pY2UgY2FsbC4KCj4gU2VlCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2dwaW8vbnhwLHBjZjg1NzUueWFtbAo+Cj4gICBsaW5lcy1pbml0aWFsLXN0YXRl
czoKPiAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4g
ICAgIGRlc2NyaXB0aW9uOgo+ICAgICAgIEJpdG1hc2sgdGhhdCBzcGVjaWZpZXMgdGhlIGluaXRp
YWwgc3RhdGUgb2YgZWFjaCBsaW5lLgo+ICAgICAgIC4uLgo+ICAgICAgIElmIHRoZSBwcm9wZXJ0
eSBpcyBub3Qgc3BlY2lmaWVkIGFsbCBsaW5lcyB3aWxsIGJlIGluaXRpYWxpemVkCj4gICAgICAg
dG8gdGhlIGlucHV0IHN0YXRlLgo+Cj4gSWYgeW91IHdhbnQgdG8gc2V0IHVwIGluaXRpYWwgc3Rh
dGVzLCB1c2UgdGhpcyBwcm9wZXJ0eS4KCllvdSdyZSBhYnNvbHV0ZWx5IHJpZ2h0LiBJJ3ZlIHJl
d29ya2VkIHRoZSBzZXJpZXMgdG8gZHJvcAoncmVnaXN0ZXJzLWRlZmF1bHQnIGVudGlyZWx5IGFu
ZCByZWFkICdsaW5lcy1pbml0aWFsLXN0YXRlcycgYXMgYQp1MzIgYml0bWFzaywgbWFwcGluZyBi
aXQgTiAtPiBHUElPIGxpbmUgTiAobWF0Y2hpbmcgdGhlIHBjZjg1NzUKY29udmVudGlvbikuIEZv
ciB0aGlzIG91dHB1dC1vbmx5IGZhbWlseSB0aGUgcG9sYXJpdHkgZmFsbHMgb3V0Cm5hdHVyYWxs
eTogYml0PTAgZHJpdmVzIHRoZSBsaW5lIGxvdyBhbmQgYml0PTEgZHJpdmVzIGl0IGhpZ2guIFRo
ZQpiaXRtYXNrIGNvdmVycyB1cCB0byAzMiBsaW5lcyAoNC1jaGlwIGNhc2NhZGVzKSwgd2hpY2gg
Zml0cyBhbGwKY3VycmVudCBpbi10cmVlIHVzZXJzIG9mIHRoaXMgYmluZGluZzsgbG9uZ2VyIGNo
YWlucyBjYW4gZXh0ZW5kIHRoZQpwcm9wZXJ0eSBsYXRlciB3aXRob3V0IGJyZWFraW5nIHRoZSBi
aXQtTj1saW5lLU4gbWFwcGluZy4KCj4gVGhpcyBhbHNvIG1ha2VzIGl0IHBvc3NpYmxlIGZvciB1
cyB0byBjZW50cmFsaXplIHRoZSBoYW5kbGluZyBsYXRlciBvbi4KClRoYXQncyBhIGdyZWF0IGZv
cndhcmQtbG9va2luZyBwb2ludCwgYW5kIEkgcmVhbGx5IGFwcHJlY2lhdGUgeW91CmZsYWdnaW5n
IGl0LiBLZWVwaW5nIHRoZSBwcm9wZXJ0eSBuYW1lIGFsaWduZWQgd2l0aCBwY2Y4NTc1IGxlYXZl
cwp0aGUgZG9vciB3aWRlIG9wZW4gZm9yIGEgZnV0dXJlIGNvbW1vbiBoZWxwZXIgd2l0aG91dCBh
bnlvbmUgaGF2aW5nCnRvIGNodXJuIHRoZSBiaW5kaW5nIHRvIGdldCB0aGVyZS4KCnYyIHdpbGwg
Zm9sbG93IHNob3J0bHkgaW4gdGhpcyB0aHJlYWQgKC0taW4tcmVwbHktdG8gb2YgdGhlIHYxCmNv
dmVyKSwgYW5kIEkndmUgYWRkZWQKCiAgU3VnZ2VzdGVkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+Cgp0byB0aGUgZHJpdmVyIHBhdGNoIGluIHJlY29nbml0aW9u
IG9mIHRoZSBtdWNoIGJldHRlciBkaXJlY3Rpb24geW91CnBvaW50ZWQgbWUgdG8uIEhhcHB5IHRv
IG1vdmUgdGhlIGF0dHJpYnV0aW9uIGVsc2V3aGVyZSBvciBhZGp1c3QgdGhlCmZvcm0gaWYgeW91
J2QgcHJlZmVyLgoKVGhhbmtzIGFnYWluIGZvciB0aGUgY2FyZWZ1bCByZWFkIGFuZCBmb3Igc3Rl
ZXJpbmcgdGhpcyBpbiBhIGNsZWFuZXIKZGlyZWN0aW9uLgoKWW91cnMsCkNoYW5ob25nCg==
