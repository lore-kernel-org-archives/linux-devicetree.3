Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BF94A0919
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199418; cv=none; b=rDdqPNidZ/Ao7o4T77m2hOEk6Nu7hxbUCy+cjrh0hshTHYp5EZ0wDIQwzPUrYjnlHJnJDBYxXqWnzKI3pb0srtPbtsBz31UXUVOHw9GfG9OoWoaRTK6AkqglVyFALqufibP/mVOMf7ZDO7tbpQdvy7VLpAJxM9tB1AUfP3NAv04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199418; c=relaxed/simple;
	bh=rmq4A/3b9cJXS2TkfGSiciCNONWN4osSAMXLb20UGCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaSsSLwtvTMQ0eti91HrQzjKgWDbuQnjiMCdoilKRliF08yofWp91Ou59DO2aJAd0tZa4wukJgub5xPE07d4tIqfrOfGa3UBiOs55xyMXN8Ko6nwB6wlMrrHurt1SXHpU+SSmjfaXVIKu1MIGCuT/KRtqLtptX+SPsp8WB3/BSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BExlHJJ5; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BExlHJJ5"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d9004f39d3so21023215ad.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 11:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199417; x=1788804217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=scaTwoDAiAwCNDZtWleBwQ6YcnYnb/xcb5L8AHzEikQ=;
        b=BExlHJJ5As7llPGIPpe8Ch3cyhunebjXRJ8MIo9J373c8PKOxgJCxc9N2ON7uBN95H
         YyJYXFfrguRGG+fmop+3YNsHiX4PbpQy2SFOA+vSRgUulz1YVV6FwYE9rexh6vYujf5g
         CNzi+Adm7+bBo/y/NIb4PNvHyR4JEfmD/m+3RyL1nM7A0/nZbcBTqrwYzwldMzGk//OJ
         RJ4oRHAkO6lCc0y+lCDwd+E4UM6QOE7NebLL3MglMKu6pffmlOE0qMwOKPx5OUsZrV1H
         TfkSZrFRWvcWuCbtFvKTtRKXglO3TB3MyogRRvjjH389p8LlqXnFT50iqwmFauvHFqdG
         MhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199417; x=1788804217;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scaTwoDAiAwCNDZtWleBwQ6YcnYnb/xcb5L8AHzEikQ=;
        b=P473rxGJgjnsNPvFBfsaDhuTS0ljuGq0PvNKxc9pIzvw/BwA0zh05znRPhAluIop++
         CnGXuc8UgXsszEYATDp6gPtcOG7Iwpd5TPL57UxkGApPd0nVX8Lt+eDGs8MMlbUcl7+4
         jURZeAHSIoPw+xUkto43d7bNANXUNcisIiF7f0l60g+In4HQzKjImN7vW0GeCrx1AiDh
         G7RxqHDCHC7s0mMp3sqamtbVtQ+Nx2od1BmTBlYlA41rQ7+vzFWuKJa83VYQ8v/1mts4
         bcXVWu1O3vngSuKiBQDj8IhpTePClxhr9yCNAteFwTaeGSmFuUrgjYP2bfZdflCdOCrC
         Yj6g==
X-Forwarded-Encrypted: i=1; AKwUvBxcfAW6rq3wPKAP3PCzLdIQV4GGiz6Towem1DOTViYf9oJJ/+DlafaKlw7Fi+qtijfPbJ7oahCGKHkN@vger.kernel.org
X-Gm-Message-State: AFuF++n96AQ1KPZYJYg1SLYykZXDQgwxetdx6apD4uLdlh5A0YKoHOu4
	9mt7FtFxT9U5Y0SX1k03bpaDjVGgnrbz8Luu4mjDzlJZP2vzKxnqCVx/
X-Gm-Gg: AYBFou1rum436cJR2g75eHhSS3/4cIRePBGf+6eGc3rxZoShNWA5iuWK4tBFirDXzAM
	CHhpVSMiSgkBNGwgpRzodz/AmmLuWsCJ2UMRq++Rv6ZmzIIFzISbYrvRwIT0Tf+fd4G9o3kuZAI
	TfOTkpe+lVQweCFaXE7hx0ZmO6vZKg6T1ENnD8QiOgr+I54QV3jy+iMsj1CALvvmv2JySFyIy62
	2FpXxJe0HZeU/mfkLA+zOsyO2KVSy3jVeX58AHnvB3ErmQTQMV/wRg+FejJNBzioXi9FOth0yt/
	tACP512VVvg9LaownRe5sH4HgJFt1SVkLPBBIGidZWUEq+vTsShVr1w9BeuWd7ZEblvY/8DV19A
	Smb5KOy2DrW3AhwRWbAnxzOiIe80qFb/8+bmUrWXeriqnEd+9MopF3nvMyJhd+4Li8ZNyw9Jvjt
	ngLIpdwJCHLdfmvJOTt3ehHRyyiT4Se+jNGWMkEW9Mr/BIvavXGjHmoLT3MINkC/7hbmGv+wtNP
	w==
X-Received: by 2002:a17:902:ce8e:b0:2d7:107c:917b with SMTP id d9443c01a7336-2d94a32e0c0mr28121435ad.0.1788199417098;
        Mon, 31 Aug 2026 11:03:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7be607sm31904707eec.10.2026.08.31.11.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:03:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 31 Aug 2026 11:03:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Frank.Li@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Wensheng Wang <wenswang@yeah.net>,
	Cosmo Chou <chou.cosmo@gmail.com>, Colin Huang <u8813345@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: hwmon: tmp102: move ti,tmp103 out of
 trivial-devices.yaml
Message-ID: <25786645-f9c3-4fa7-b1a1-11b3704c3806@roeck-us.net>
References: <20260826211422.3299728-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826211422.3299728-1-Frank.Li@oss.nxp.com>

On Wed, Aug 26, 2026 at 05:14:19PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Move ti,tmp103 binding from trivial-devices.yaml to ti,tmp102.yaml. Both
> devices are single temperature sensors and update "#thermal-sensor-cells"
> property to accept values 0 and 1 (passing no argument is equivalent to
> passing 0 as the first argument)
> 
> Fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dtb: temperature-sensor@70 (ti,tmp103): '#thermal-sensor-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
