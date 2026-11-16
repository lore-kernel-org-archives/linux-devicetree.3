Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823104;
	b=poxIwFKzUGfaQZwbFWKUr2YHHTYjYO9uVsVTJ/VXO6EvhRkaZzEJ5aQ6XKB0KXeXn6cz
	 xdDyWOPoI8mqY0kS0QBckXxrQYOT8XVnl503smAYgayFeFBvMuRR5i6CQlYZ0FK4O3Kco
	 8SbqIbHsFSk8BLRjMQOois0DpknSlqbUN+jff6Lvw6r39C2PDYgsvuAki4PmyDeDlEEaT
	 19jt3YFwTL8uuyGk3XQIoGv8tTJxiEK1WwPyEe+lLX+xf8oJR3pP8DOzEBNR0PKQB4LKS
	 Lv6Y6jAjTvmphQoLoAj7PX4YSXm8GKRE8s1PrIm+9R/MQHspfv8auj6pwTdTSxcCikg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=1IKEWtPTLjM1XYaZ0STp/scHGqJtVbGIZgdMjNsrQOo=;
	b=33f4SmDlcq0tIPmiWrahmn4jBzrnG2B8Q732ucMmtqdA2zXaYa/pyCJsm4nBHlgHS0DE
	 yFBbZszs67u2Ws0CCuL0yWGYObwhNTruGWCkFOls06Qn72lRDVUkCBFBSRVH5nwVlCfGo
	 m0srMbU9x1USQCAAnnfd++FuliWxyhbaf0sGUC5MbaK/fTwmrW9TyrFV3bYcp+huTnyUo
	 n2+AG5KrE8K7OdKZmj+zg/Rh4ZtSGGO3E0sOVR1bqfrsvHPqOG06QkgpDFh5lmrtH1iXA
	 5/CKlGg6TMoh/DGYSMYmmhLW8PzTmBAwsWRxxnxKPskfclw5NZCZfKZyjsykx+jSKzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9bDlyFv;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB3C606A330
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 09:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CB3C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9bDlyFv
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so15131485e9.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 01:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794823102; x=1795427902; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1IKEWtPTLjM1XYaZ0STp/scHGqJtVbGIZgdMjNsrQOo=;
        b=R9bDlyFvVr0S4yMshgYnycii6CBT5Zvs6pnEe98MdhHkMGIBb39vwWS9x8wTIZjPPZ
         fRvzjBiWuzuQJ5uG8SNRNjkSIOeQT+H1rqYVW+YXbf+C0jHrPtPM3JOXY3KYNjdhUN14
         KUD0JqAFnDh8EPcXFC4Xa043JM7tMq1VwdvTFEcC1YtOgmoFGE1WlUllJXqpwM7jIEYc
         4sCDpV2iNjKih2iRfbfx0QMq5c5qn3DliQ2Cx81JomfYOa3VaBKgH2yqdSKElb2F5XB5
         +Jd0zOou5xhgnSYnrZLzww6IR+q/+cSTUfJkwAfthznbtWObTTPK1iqcCGYR3l7ygAnz
         QR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823102; x=1795427902;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1IKEWtPTLjM1XYaZ0STp/scHGqJtVbGIZgdMjNsrQOo=;
        b=Wskyz+7PqF/efNazHFFjW6C71cDcBDKhBdsOn9tvy+INpQuUMIk/PQo39XiYseJkpu
         LuxGFLSv/JA9NzKhkysLdFoc4WxI+exRVNJ1f4Jj5QmFBANoojgzwZAjx0Y3/AmrjxhM
         Vr7UjNCMWUC4yvwEE5uRK2Nw1m1cRlABB6AoFc3c/Wzn3hjbOjGfUaGVui+lMcAUoZoj
         Lng1f0gZO6KFo8pTNrCF5NYGryjVS2EaI9jzyHS9ZfufGv06xqKYbFsLP3IC6TCK2uUh
         CLIfY1ieMRAgd0Qu7bhA22qt/EF+nFDSIfficpRtZ4XPnsjqQH6lB+NazL2gmwG65NEm
         zhfQ==
X-Forwarded-Encrypted: i=1; AL+hErEmmXTZ7t/u3pVjDXsjitQ8aHOfxiih8ytnAeJvXLOALt8or95xup32GfwelhHDkEUHIgN8vijb3gnB@vger.kernel.org
X-Gm-Message-State: APuU4Z8oqNSuzpMYOJVpAtlL9PoBFqVY0tNoGzqaEZgdWTmDIEaNSxzy
	R7tnJrCMAzOJbwqzPTMNZnEpfpIoQhyMgpocVSGtqf5fk5RdHoEnW43m
X-Gm-Gg: AYBFou3vGT/4iisHd+jfqCwA04dlGkEHOOknd10X+3fbIxRPBxd5/OgwOHnVMfMZFVu
	rGwiDMJpNUTzywBrFhVpMHxHJZGGQk/RmHbDmWVdSmjrKdUiMNnCYAo3u9ZAon42LRcQjJIvDca
	oj9j0k+s2PQSidqzq3mvRWoXuY3ROdI/G+1IFwEf5r2rEuErTslJbZdKeK5tddgI7FgC0nMpRBV
	NLX5AQogxpqd/4I7sURdxrGi8E11RcFPqmVP76WQquxnOEXrNtGG04iPFEpfLJ8NeTJyM6hkb/W
	DbhtH/L2sfBIvMxkbdf5F8Unulgr9A5zIRQs/fvbdpCYuKCEavyWh6DaoXPLIvQy/09DgK8P/09
	wrDKyjQQRTeL6ISYwipp0UeKBzLHjv2hjsLL+Ibr3NKifl9NhNuNrLNXxLyOtxDDxzYkrvNjvIh
	dHaB4bkayokfdgWC2PbxUE9X/EoDyAE4Rv+TvHHrVUsLIIYE0ucq6yJG0jSH6dWJNYAjGHjXGYX
	2qdm8j9gCU+gEVKcC5xJzhksDTIM0mex4CWn+xUAwWOxU7IkM9tRRLUMRSNwcnaqEqxB8d9kxPV
	e1qTjcK1ks+WiLCkg+yXM23Z5Jmy5qDZgPXBnZfCDycZDX8xEDaYjgaMaCUuWroVxydUyLVu
X-Received: by 2002:a05:600c:8483:b0:4bb:605d:8e92 with SMTP id 5b1f17b1804b1-4bb605d90f1mr145813425e9.32.1794823101861;
        Mon, 16 Nov 2026 01:58:21 -0800 (PST)
Received: from ?IPv6:2001:8a0:c4c6:f00:1399:6f7e:7235:850f? ([2001:8a0:c4c6:f00:1399:6f7e:7235:850f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm112615705e9.1.2026.11.16.01.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:58:19 -0800 (PST)
Message-ID: <4c5562a2d384fc530be2773a49b7380f3b009e61.camel@gmail.com>
Subject: Re: [PATCH v1 0/2] dt-bindings: display: panel: Add LG LP156WF1
 dual-LVDS panel
From: Vitor Soares <ivitro@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang	
 <jesszhan0024@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Nishanth Menon	
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo	
 <kristo@kernel.org>, Francesco Dolcini <francesco@dolcini.it>, Lad
 Prabhakar	 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding	
 <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
 dri-devel@lists.freedesktop.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Mon, 16 Nov 2026 09:58:17 +0000
In-Reply-To: <20260529110518.624454-4-ivitro@gmail.com>
References: <20260529110518.624454-4-ivitro@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi all,

On Fri, 2026-05-29 at 12:05 +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
>=20
> Add support for the LG LP156WF1 15.6" Full-HD dual-link LVDS panel and
> a Verdin AM62 overlay for using it through the Verdin Development Board
> with the Verdin AM62 Mezzanine LVDS interface.
>=20
> This is a follow-up to an earlier attempt [1], where panel-lvds.yaml
> was incorrectly extended to describe dual-link panels. Back in 2023,
> when a generic dual-channel LVDS binding was proposed, Rob Herring [2]
> pointed out that dual-link panels should follow the existing
> advantech,idk-2121wr pattern instead of introducing a new generic
> compatible.
>=20
> Following that approach, this series adds a dedicated binding for
> lg,lp156wf1, with the dual-link LVDS ports described by
> lvds-dual-ports.yaml, and excludes it from the generic panel-lvds
> schema selection.
> The second patch adds the Verdin AM62 overlay for the LG LP156WF1 panel
> on the Mezzanine LVDS connector.
>=20
> This series should be applied on top of [3] to avoid conflicts in the TI
> device-tree Makefile with the other overlay additions.
>=20
> [1] https://lore.kernel.org/all/20260521150038.103538-17-ivitro@gmail.com=
/
> [2] https://lore.kernel.org/all/20230130170441.GA2796575-robh@kernel.org/
> [3] https://lore.kernel.org/all/20260522161105.277519-13-ivitro@gmail.com=
/
>=20
> Vitor Soares (2):
>   dt-bindings: display: panel: Add LG LP156WF1
>   arm64: dts: ti: k3-am62-verdin: Add Mezzanine with LG LP156WF1 LVDS
>     panel
>=20
>  .../bindings/display/panel/lg,lp156wf1.yaml   | 105 ++++++++++++++
>  .../bindings/display/panel/panel-lvds.yaml    |   1 +
>  arch/arm64/boot/dts/ti/Makefile               |   5 +
>  ...verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso | 131 ++++++++++++++++++
>  4 files changed, 242 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp=
156wf1.yaml
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-=
lvds-lg-lp156wf1.dtso

Gentle ping on this series. The binding has a Reviewed-by from Conor,
and as far as I can see nothing is pending on my side.

Let me know if a rebase or a resend would help.

Thanks,
Vitor
