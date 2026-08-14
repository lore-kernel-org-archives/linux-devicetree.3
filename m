Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE5341DEDE
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693284; cv=pass; b=OTmqK3aVdE7YYzy95ZUe6/1tMpvmKUec1+tmMDFY8Sfix93OaoSS6eDf5ypgV+1sutlmYEpftVCXdNiCvayVPUM/MbbsqF2EwU6JU+iaq76Ehx+iFYLE71m2l17cm9LojWIvCY5hXz/8Ep8K92I9/c3AX45/rl9/SuZwaG/Kg6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693284; c=relaxed/simple;
	bh=W4o1ZmlBfyrCH3y2jdCkwEByqgWhppc/8xEUvhcD0rE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o1N64vkoBn65snAlQK/J3TWePVFmDPxY8cWcliS3+hmnb28WprubVuSynEaAYDq/yzbLgVR1Tm34k3jWpt8V1L2MMoKnntjTzZ/xc+7MRrai6SdhWrdYbu3mIw2ReBsu3yuaF2q9TRmenuGbb7f5d9BfjSagM5L+Q8/K0nSjQDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EazMxGCy; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EazMxGCy"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so960973a91.0
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 00:41:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786693277; cv=none;
        d=google.com; s=arc-20260327;
        b=TLQCRnQ0Wv0NldPb9ZNzb3tFnt9SNUBW1DPS0JPJv0tId9KUbapPdwoCqGSp5lQjDF
         H/tjXisJWMaLLbgj9wsLTb5+uu42utfjJbQjvN+BP0D/RQgOGC3DL/e/Nt0cei7NOpqb
         Cetv+rITpHF3OTJdNhmer/nVlHNgYz3ayHFM+NZrrW6A0iXno2ibEl84yWsrhIwdiQJD
         z+GgN6p1dygj6zGcZ/42fY8z29niBfuhhIdfwC/FmAzQE9aBgpSSo8a4BAngIuvoIya5
         1mufjIewRc/jy+eJw2XjaePQM7FLO81dymOK7yUQOOHAUJORaNdmSJMlopHmhL15Sp8U
         o4Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W4o1ZmlBfyrCH3y2jdCkwEByqgWhppc/8xEUvhcD0rE=;
        fh=dhv6wo2oCQlGqy8vmO02UsUMTtuswYFTIbqpG40RMRM=;
        b=gP0sMnfOIwLgJO+/FHFykXhq5a5+XMJ2ebXusCoSiuHDuCAYcIE5ylvZqkKoNJrjMR
         SgK9BOxw6Gm0szJD2Ybtpm4jRKFfPwVcXDuSs5s+l8o3iCSzbrG5BZk9lli4+I1NOu4A
         EKuxtelHy0N+KP5Ko5pynyiAv5ARRAHvlLfSKausuRExieyVyIpMnpyIPk8QrgyC4VmK
         TyvGtJvoChjOO0ZrIgESfh6FhZspXfZAheH15wJ8i5VvQM/YmQB86iEdYgpYRoNH0LMU
         TArs57wpr4ZOT+wqkJV3FmpiomNTv2dDUe0Ja3NoN3d+ApI0MyMQBWlWVXt5FwBGFKeO
         XNAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786693277; x=1787298077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W4o1ZmlBfyrCH3y2jdCkwEByqgWhppc/8xEUvhcD0rE=;
        b=EazMxGCyQltK6qCWpEez4e1UxuXswYnZNKpc2CkSRvCO3b/N0NwRHfD+glg4GjVDT/
         Mn9gvA2cX3BbVv4hGWsM6jCkjsiygXWJB0kpJzDY9558jsmR/bm6j8paSxkBcNmkW5dJ
         z8pcXszFYGNVq6IUIj8LbrrttjKzx9ld9WauPYuaFjSzfKVgLj2pkuP+BKIBkLH8OOHP
         Y9WECnH/vdmtvrdk71jVy+YTh41tNc/qO5QIKfkiIqj1jGv5hJ8ao5gSDrNvrT9bVCwF
         oIvk7JU2evyZFftqRakBffBz7cH/TmeunOQ7u5TBeflt25if4Ux5C51OxZNxrIHrTcsd
         EwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693277; x=1787298077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W4o1ZmlBfyrCH3y2jdCkwEByqgWhppc/8xEUvhcD0rE=;
        b=IN3zIbuFSjWejh32VnrZV/5T9CNz5sV8ut5RXkOMlzOf6lfMSOCL8uP41OkL/zOMyR
         ef4M1maRjfjsCHRbhHhNP4DPd7fLwGbUxkjBQ+puo6FkwB0/EH1abYqp4h/zGqsfLfhD
         /9jNs/BFo93WLipICmuXxsx5WIZWLicuL2Y4eBHDOd0j+HpCy9QxJ2CVtqkcNzC3OXi0
         RfWyRZ8G8xfOC5wPbpvcfWQ/itPO/TElQTr1jP9M8qGZwdcbeCZ9UlZB6HGued8nPYTm
         KzjE06TVzt6l2RCDIb2/xEz9bU9XMnCnKXEqC3wqOmUeRXAOq8Mo4ZOjRLwWLwlYVrPF
         faQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5l9NwE9kGxwoTDK1gjn5uMr5oX3OP/7T1usk03oQmgyRs2MLaLknI0dhxqPaKXjUGIkr8HtFSwqMy@vger.kernel.org
X-Gm-Message-State: AOJu0YwVHNJL8jgLqUY1O6v1+6nHXh7JpiDb4sX4SRc+ElkimJ3uIaWj
	Hi/yOJRlrF7Cx35Vl0BSu2N7wZEmRaw7+a9AFuKp9wLyX5cKoLLR9Vqcnt0bAtfsnZqtbOjl3J1
	QcgjDfqD9PVLWNetETxWT2/6FZDakjFI=
X-Gm-Gg: AR+sD10pktH/Dr5hBolRZ5JxC/Sgd8XbLUx+6PglLKIwNFDfKOxOI3RK8bYKofmI7UQ
	3IQMZdXUMj24/BOZJWmZiFLWTOFimhC5w5KlfatpqbVJxfrBUAtTFXfx5rBYduw7r6eaW4EahgN
	38Oz602lIMWcftSpRqORItzjPfoteViyZMb7MAVSIFGCKjnEl/WN3VL+rJjCy7fhsN8lbe0RVjv
	nLtVGE1PhPImcM0yS9ecJ1Sr295mjQZvxzph/j9QtrpOK/7OX21Xzwxl+zYz28Dht9IlahUIkDY
	GhHyBRci3GM3c1UhC5jiQzxOG3uKk5rGb8dnJC3fDs8CdQ==
X-Received: by 2002:a17:90b:3d8b:b0:38e:1497:af5b with SMTP id
 98e67ed59e1d1-3933b77ece8mr4578497a91.1.1786693276690; Fri, 14 Aug 2026
 00:41:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813070020.719810-1-shengjiu.wang@oss.nxp.com>
 <20260813070020.719810-2-shengjiu.wang@oss.nxp.com> <20260814-lean-classy-hyrax-60aab2@quoll>
In-Reply-To: <20260814-lean-classy-hyrax-60aab2@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 14 Aug 2026 15:41:01 +0800
X-Gm-Features: AUfX_mxVp0mCUmIh3cD49Kgp4iw4sN-NjfTifnUiJEeotRXNzWAYJPCWyxB1G3Y
Message-ID: <CAA+D8AOdF08PyOqQX6HTz-bWZmyB0bmKoW2DxYtnGS3g72aWrA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
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

On Fri, Aug 14, 2026 at 3:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, Aug 13, 2026 at 03:00:16PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
>
> Each one or only the newest? You will be getting the same questions.

Each one.

Best regards
Shengjiu Wang

>
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent independent conversion paths when multiple pairs
> > are in use simultaneously.
>
> Best regards,
> Krzysztof
>
