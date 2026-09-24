Received: from va-2-57.ptr.blmpb.com (va-2-57.ptr.blmpb.com [209.127.231.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24353E123F
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790237482; cv=none; b=vA0rBvKzYip9lq2w2/a/RLJu1VxScB3aebM56YwBlLHwtD2BztaSh9AuWMSiJzfZ/Wcz6hf0wCdpU4FtmAevtBQoBv41VJxSjOCINydiQ379RIi85s2c99WgoSEXg30Sz415B1pUzhhvjjF3TiaRhtmlYZ2XTm5NSZvYzIHnYa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790237482; c=relaxed/simple;
	bh=AoDdUurWe21FElda9XiGLhWIKP/LxkJBdQ3+g0QX3Og=;
	h=Date:To:From:References:Content-Type:Message-Id:Cc:Subject:
	 Mime-Version:In-Reply-To; b=KWKJGEpBLQZoTx6/rP5RPBBdFokVOhp3rIYBDsz/a5BC/wIdKsQcdft1f4T0vSmiOzHmeEI5z44h/B2zM79WOy4n2DO6FXy6CPacmF87J3QSbczMcEOS4KyJwInEME9iW5sKqs3fDXAoiyP/jlaATjVGnKTDJ5V9nRH1r0LnVqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com; spf=none smtp.mailfrom=bedmex.com; dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.b=RdZ9ywC+; arc=none smtp.client-ip=209.127.231.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bedmex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.b="RdZ9ywC+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=bedmex-com.20200927.dkim.feishu.cn; t=1790237473;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=AoDdUurWe21FElda9XiGLhWIKP/LxkJBdQ3+g0QX3Og=;
 b=RdZ9ywC+PhPlNuIpwVpLx5kvDQtOKBw2jeZ8fb+qywVJc73rvRgxL8m/oLSP0HAbHkkcqq
 Ob3FkCpsBjY9ZqN3V2F6z1n+pXURpT64YxCTJh3EgcNhtYl6VM/nr+QqsKzNnZIB4FVoGs
 qj6/LQnVXM6G2gvrCN7sMcNSqE1thCVSf3qv4+Omif7XEWdSxPb8Pu1t0v8aff214fMD03
 NdrAVzcOpG0EjFjZoLT0etcpB2PkUovIjtpn1riMwu5qNLZDg3yTm5h8LY5Q/zgpyZa7JR
 dzP+mCWMa6/JMZCKOVo5SGw4b55pt+6pZgNCWSK76hrblLYy19E8AjCLRPCicg==
Date: Thu, 24 Sep 2026 16:11:10 +0800
To: "Krzysztof Kozlowski" <krzk@kernel.org>
From: =?utf-8?q?=E6=9D=A8=E5=BD=A6=E7=AB=8B?= <yanli.yang@bedmex.com>
References: <cover.1790235697.git.yanli.yang@bedmex.com> <a9adff17461c1e66d645d2d0edb35a05a536e1a7.1790235697.git.yanli.yang@bedmex.com>
	<270a77b9-30fe-4b5c-8971-33c1f64f3772@kernel.org>
Content-Type: text/plain; charset=UTF-8
Message-Id: <0c6903be00b92ecb18f2e74fdd9f8cb39e4db47b.1b45eb39.c5f7.44a3.8394.2b83fdd684c2@feishu.cn>
Cc: <linux-bluetooth@vger.kernel.org>, <marcel@holtmann.org>, 
	<devicetree@vger.kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>, 
	<conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>, 
	<zhirunliu@aicsemi.com>, <dijiaxu@aicsemi.com>, <chunqiuliu@aicsemi.com>, 
	<liheng.wei@bedmex.com>
Subject: Re: [PATCH bluetooth-next v5 1/3] dt-bindings: vendor-prefixes: Add AIC Semiconductor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <270a77b9-30fe-4b5c-8971-33c1f64f3772@kernel.org>
X-Lms-Return-Path: <lba+16ab4db1f+a468c7+vger.kernel.org+yanli.yang@bedmex.com>
Content-Transfer-Encoding: quoted-printable


> From: "Krzysztof Kozlowski"<krzk@kernel.org>
> Date:=C2=A0 Thu, Sep 24, 2026, 15:51
> Subject:=C2=A0 Re: [PATCH bluetooth-next v5 1/3] dt-bindings: vendor-pref=
ixes: Add AIC Semiconductor
> To: "Yanli Yang"<yanli.yang@bedmex.com>, <linux-bluetooth@vger.kernel.org=
>
> Cc: <marcel@holtmann.org>, <devicetree@vger.kernel.org>, <robh@kernel.org=
>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-kernel@vger.kernel.o=
rg>, <zhirunliu@aicsemi.com>, <dijiaxu@aicsemi.com>, <chunqiuliu@aicsemi.co=
m>, <liheng.wei@bedmex.com>
> On 24/09/2026 05:34, Yanli Yang wrote:
> > Add the vendor prefix for AIC Semiconductor (Shanghai) Co., Ltd.,
> > used by the AIC8800D80 Bluetooth bindings.
> >=C2=A0
> > Signed-off-by: Zhirun Liu <zhirunliu@aicsemi.com>
> > Signed-off-by: Dijia Xu <dijiaxu@aicsemi.com>
> > Signed-off-by: Chunqiu Liu <chunqiuliu@aicsemi.com>
> > Signed-off-by: Liheng Wei <liheng.wei@bedmex.com>
> > Signed-off-by: Yanli Yang <yanli.yang@bedmex.com>
>=C2=A0
> 5 people worked on this one liner?
>=C2=A0
> Best regards,
> Krzysztof
>=C2=A0
Hi, Krzysztof

Thanks for pointing this out.
You are right, this is only a one-line fix. I will remove the extra Signed-=
off-by lines from this commit and keep only the author and relevant contrib=
utors for this specific change in next version.
