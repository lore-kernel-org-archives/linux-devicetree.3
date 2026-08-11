Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB098390223
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786415317; cv=pass; b=lw8WYZVuCfT7Gtx0ZWHK5CrpbgfOTTC/nMvm68bNMudtczHjBwzrPYLabkwb6R6//SXZUJCc5dwVkgdo5/1iluMrlIpIraA97iAjYcpYGlUxyrk4XzlLH1Ayjhk5WbyPw23tT0vQkL6bguA5iVkDE4Obv/bVlSOmaG5/yvVIOBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786415317; c=relaxed/simple;
	bh=AUc+FEsu+DrlUEKF4zIc/Pac63ML9yu4ibWXeDmIe8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nJnjB7fGqTX7MdJP1PLoOBclcjeEh/irnUcr4a+u5AR+jbNNgqjVhj7OEXyH2oCysL8qEiZx3PpgofsGBr1xSFYnwTbQv3I2HHbD62xkVazIId+jUkxMQGZ5ohNt+LvHxRWezyLys2y3WSwaF4NK9eH14pBels8PQ4dyIwOZqW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnmmKpHo; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnmmKpHo"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so2087544a12.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:28:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786415315; cv=none;
        d=google.com; s=arc-20260327;
        b=gNNfVe3eby0Ols6h9pZzDvZOWbki3MU0pwvQxLHiMjHEP+5GtjZsaX/BEeudE5R4Mj
         VvdOjxaIwPpjhkQEwoLdtVl6dTUKS2zMtLU/ETQvCoFfkXvbxrSuvxE4XCbKhlf01hI1
         RA+9bFQPVuG2jFLUE6ogfwk/xNkPSm97NtURPWt1VVEhxPtNhb6BR41nBANWJV55j0bJ
         a9St1KZ4i354DYUFRnT+zwEWhvRUYKceSm1a1DsLoJrDq32NjlHjY+NXbaoDYsUpUUjt
         XwL36ftMXJ2ql5A5X59az+lMb9IGjFbOpX2onQeBPr18B8vRPFc8bH/N50nxY3h3QzhR
         A4sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FK3vmJiqb7a+gVn5qBnneGTL0Sw9n7wbleQLLjtRCmM=;
        fh=QfsyncUsrO3XP4R7JSOBGGK+J7XbF1GuQb3Z6Dtt0dk=;
        b=M7j3JSSb22tPZOQe/jQPM4RXe6svReseJta7bqzqFv+rvIZs5ZYuHyz3bmOOoy+jI4
         DxU6f0jB4XSNq3N0/vphUMhHkZYktF+DogHwQo9hNEjivwY1UIVgTv3eHmNUuSHOB+QW
         obngbBt/kXzxzs+bgRjPMpQv2ECrgoYdTb8LuMBOCNkDAqPPGqgA1Bty1Olw4JfG4+qS
         Hj/w+nzx6C62HQYhW5FFBCfoFz1rY95D0P0QL5UG1iQCmYXssPxmu4Z+Q/uWPRQlMnZe
         FX61BG02jrdsEVQrzvxMZ8ZhRd+iQXDEFKKKSPqI3OVPz7s49mg4Vcr0ggnprIXp3AB+
         dtIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786415315; x=1787020115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FK3vmJiqb7a+gVn5qBnneGTL0Sw9n7wbleQLLjtRCmM=;
        b=LnmmKpHoc31KzFeLH7aU/s2Vwlfaxsm27onqqErO8ZYT6QaVm5xOvNTbBLX4YgAUBK
         oXtE+3NcAzGJ7HtMxMgUx68xRUgTn7ai0TU7FkLdwhkJLrRUH77S4kfjHHIlVPiIZe6E
         xpTXJ5yPc0sc1xV70ojdbBL2d3eRVdsLzBMktVhr87fdRddhwnkApGjI9MCc80nGPkI0
         w4+L6Ckc3CrlD5/kkVC+bnBfGVrYE+/eOiDRQX5RQhMluKHZE3ef2J82a1dOrqN4v6lj
         Lk9/lV59iId/E0iRfNic0lqXQsvBreC/KGQh/qc9FFbQRPLxfC7G9yAOSg9svNUvLajD
         FvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786415315; x=1787020115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FK3vmJiqb7a+gVn5qBnneGTL0Sw9n7wbleQLLjtRCmM=;
        b=RCSc4hutNY+zjoYqR0NyF34BG03b0AqiubfU6wi0vctHH+idoLDGgPj01+f+aZ17OJ
         72pnuZCcwyZkelsr2h1sHn4vo2E7h17APOhqxLbR9nd2jtvh+zF8TbKnP8/dxk5q4uMv
         rct2snlsGz0ZfQMagAMQyDFkBW/A6fyP/otFIEPKCEgSluOY0CDYqnZCpPIMzarlDm6k
         kic9jCpXAhqeTPEZ6ElKs3GUOXtg+QWnmgcFLGvY32VseL5QChtw+cRB9MXeB7txL7EB
         Cagxah0ZftXzRQu59vXPkgH5emd58a3H0fRcceH+nuQUvbo1R2GOvfh8AIblY4EBx6o7
         i57Q==
X-Forwarded-Encrypted: i=1; AHgh+RoOMyH9iZ40G5Y7+D/a1eSlEg5qMNdFCaG+2WM9wVM/t0r2DrBrswHPUtvWGB/GeKZdHxnsW+9qVglg@vger.kernel.org
X-Gm-Message-State: AOJu0YzrCb5H0Nw6nLu05RB49Vnjl9KsRHOAdoL3Lp0OWBlauR28dW1T
	BdAVAojiaf/pxid2BVUYIAMKab0erCmGjuehviZchJJHTyVx4roY8JTW5LqgGSsxM+s9o3FvQU3
	xYVz2fzv5zYg0jQyzSvsfsLlZjflahOE=
X-Gm-Gg: AR+sD11jhvpuPYOGyh6g6z05vk6HltbNETrLe8e5Wkc/VqmtJVTZLA2uL9WjNISTTv1
	Js0dEa4//cbffFA9pHwaLH2RMWiMioI6DXWMdnsI21UObLBizkcj9BD1+n0jHwCLM+6kht7qAEM
	w5PQdH6Q96nlIb+R4AxgC/r5ohZkNY0sQEgjz6GXGdTzPY2c9+OKSFMCR06A3GrSFxQjpz1XjID
	dRAcGDvs0eCwhJzmJlh9IyBL95xrcukH8vwQS8AXX1MKHS+qLVXl7DQsvp3euH5OAXwACc+ueed
	q/rGmykiXdsQGcZSA9MF0BcKheJmJjmoRUiFIDfI2tK6
X-Received: by 2002:a05:6a21:e0a6:b0:398:837a:7af0 with SMTP id
 adf61e73a8af0-3cc2baff1a5mr397245637.30.1786415314854; Mon, 10 Aug 2026
 19:28:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com> <20260810-normal-cuscus-of-argument-4b230b@quoll>
In-Reply-To: <20260810-normal-cuscus-of-argument-4b230b@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 11 Aug 2026 10:28:13 +0800
X-Gm-Features: AUfX_myaxBa_rPqdovqcCYr4z7pz2bgmNVRQ7bdnJSbreWmsZ5qeF4VRopEa4z0
Message-ID: <CAA+D8AM9s7EX-G246Hf2=DOx5q2qXWg_MjUCaoJ8RggOjp+5cQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 3:14=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Aug 04, 2026 at 06:02:14PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
>
> Which SoC? Did you read this binding you are changing?

The i.MX35 ASRC (the original) already supports three conversion pairs
(A, B, C).
All subsequent SoCs that reuse this IP -- including i.MX53, i.MX8QM, i.MX8Q=
XP,
i.MX952, share the same three-pair hardware. This binding covers all of the=
m.

>
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent independent conversion paths when multiple pairs
> > are in use simultaneously.
> >
> > Add a ports container that enumerates up to three sub-ports, each
> > representing an independent conversion path:
> >   port@0 -- conversion path 0
> >   port@1 -- conversion path 1
> >   port@2 -- conversion path 2
> >
> > Each sub-port references audio-graph-port.yaml as before. Hardware pair=
s
> > are allocated dynamically at stream open time; each active stream
> > direction (playback or capture) on a port consumes one hardware pair.
> >
> > For backwards compatibility, keep the old single port property but mark
>
> Why? Did the old hardware change that it has more ports/paths?

The hardware has always supported three pairs; the original binding simply
did not expose them all. This patch corrects the binding to match what the
hardware has always been capable of.

>
> > it deprecated. A schema constraint (not: required: [port, ports]) ensur=
es
> > that both forms cannot be used at the same time. The binding example is
> > updated to show the preferred ports form.
> >
> > No existing upstream DTS file for fsl,imx-asrc uses the previously
> > documented single 'port' node, so this change does not break any
> > in-tree device tree.
>
> Does it break other users of this binding?

No. The existing single 'port' property is kept and marked deprecated
so that any out-of-tree device tree still works without modification.
The new 'ports' form is additive only.

>
> Why mentioning upstream in the first place? Either this change breaks
> ABI or not, explain that.

The deprecated 'port' property is retained, so this change is fully backwar=
ds
compatible and does not break ABI.

Best regards
Shengjiu Wang
