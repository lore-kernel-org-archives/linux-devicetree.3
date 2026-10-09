Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36C13D8900
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 17:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791566617; cv=pass; b=u+wWwXRpWuMZLX//UTy6CLIGuPZVWuv40VuU4pxXarFHFRmTZlA+5ANUgW+Ehdj4rhcS+Pzmv7aMIhoU8t6Ejes5WaG5e1RXlgeM8cydXzFGpEuIkXgyLUnAcqfQAO03eeN7kuQY4gFKzhWZEw92fuv6V4FHEmVMIq/tkdnwAiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791566617; c=relaxed/simple;
	bh=G2jxbatKwQbZzM49tr63rk6J2FHSq0Eo1YA3a+2vpVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dV7dRgulkAUEQOgAN4Ws8ytycJe+TkkGPPAe5dKDGgbTQRtJU/YUgCt9fETAFZmLRZJn3QoSdP7ub6+kPJhVF4WrxF6gQA4lL5aFJRS7vFgk8cvD4e91V2+ODY/UP0ypU+y30urKi260rxHYX9+gUzGyTFE5tpkqA5IKI4Wl5/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcJNa8ya; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcJNa8ya"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67694513f2fso4327980d50.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 10:23:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791566615; cv=none;
        d=google.com; s=arc-20260327;
        b=iXc3CHE2BtMwXLR0G5hctZL9vzE9My4mxbIyOVjuiuk4M4CwnOJG6u9PtoCBmcno+n
         wY9yp+W45Ahhlff69sVoHKtvTL8I2Hl6RQMV6yrV9ue6OPIulvZJ6NJBERpsn8WZ2rzu
         5NemQyCSB05WlFwd9aYz02sDyGIMqQZhY0Omz80mpx3genJiG8tsiIAwt9yV9wma7/c8
         LbzHht5cPwUEaP3sniZLkzavyXm8lizA6gLcqSBXslxE1ehoF0dQEZwD/F+g8FA2LkTx
         ql9ZFj+dGxXiEsF8UqNwnPiYd+sdhzgcfRKjnpr7EJ6jgrCDUTHEaaA+8yLd2J/S3jn7
         gO/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G2jxbatKwQbZzM49tr63rk6J2FHSq0Eo1YA3a+2vpVg=;
        fh=dH2ttAVb6t8c62+VjKwDgmA1aubmNxSzRlRKLU6GTFU=;
        b=gf4ihRRpkcWJEXZSjWkXAUHnJlYzxjOZfGaRjS8wu5CFGe8VeItlY1YtxF4AKDvPHy
         6s1ln+ZxRza38gEnlUt02ASWlJMy0Cr0YOdGKL0Lbd8YkMIRBa2Nc7ZrGbnDy2yfLOr4
         +Al2gmNxhiyl4a8Nph+7BZD5lm7/hI6P+hwRQJLVmIfIwn9NUOgN3eQTkSmyTfl0Hz2+
         +8vls6pEq8UZy+5bwRYfhNaUF+DMghtpTqahS6wYdtGhVrwkjrEfbGf7k1fXyXIHAEW0
         sJGLoRA/nZiP6KQ4v/VWMC7ROo7NpftwjKIgJuK2LjmVRCawF49X4CTp6FXdwBKxfdAg
         hpzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791566615; x=1792171415; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G2jxbatKwQbZzM49tr63rk6J2FHSq0Eo1YA3a+2vpVg=;
        b=DcJNa8yaRGkTNfc5n+yZJlUfiZiqIn7hfBJVpaV2A/uzuelRa1Q0IIhOLtQP4WUGpR
         gZOBUKeKNHPWCDb6ID0CANwB/aIfR446pSEH3KXl7YK1CUsBBael7zcf3btBXCXNidvQ
         0zZaNQuHOcPqjrj1CEzjgEyV/chixJe0kUpnZRIy3oj1x2H4IecbAA9wVqymQ+mXrWrz
         BD4UbqzePLfVuJAzQlWAhAYCdf1V7NNKAI/2gGLLfT2Sr3kWR+dkqhG3A7poHGNH4j70
         ELln9UTkS6yeMZO6jSXuOQ9iZzEKBOeqBsm/6voSaU+D9LGTVKDqILhQ6IORg/tOkBJ9
         g0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791566615; x=1792171415;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G2jxbatKwQbZzM49tr63rk6J2FHSq0Eo1YA3a+2vpVg=;
        b=hI7oFspSi+S312TQNaYGapHIGdO+IIP5zSb1CjCLogh9DcX1Q/H/jVJ63P8unBPUa8
         3beljkH9K8tRzpd7oX68ol6GwqgnwtGxKJjwIhNwkCxtzRcu4penc6DmE+coLGZXiEW8
         086Z5hDiSWzrnTcO6xUIzcvB3NTy9PT6QpZV6ZNixCJzF+raszqCcDOo+RAscs2UsQst
         oxDFgDgwh/XJKlYkiGqYVNbXaCr4bNiRRW/mNh1u07Awnkrgj+t/UcXrML5+1Kqaa5/m
         OXYx0N8y2sscpPDFKhRVuB6mi06Qimuv6ony9Sn/iz03Qd54IUE47mXNCO95WFYI9vHh
         fl1Q==
X-Forwarded-Encrypted: i=1; AKwUvBztyDo9b3iNfv126M6pxSwLR3jiGPDCiCljAreh+N2pEP6l290/Vddi5vPux9pMhAt5mJA3+uyo+8me@vger.kernel.org
X-Gm-Message-State: AFq9FYL7mnghwsIngRq4mutNn4BdSM9cUzNz2olEqMR9rNdvazbEVfuB
	iSIOnFSJ5h4+YfjOGNVyKkDm8SZioTzlfQqhKIIIHUZHYsWSLBrsi9BX9YFAlX/uni8Gh6bUEmx
	GusYORhIKp4VEI58AijXsxDEi9z/4YBc=
X-Gm-Gg: AYBFou1K8H4NLmvj8/4Cf44ZxsLtu97vPtERdTEqJ8HS2Z8Wzt8959eoCNKymE3qhu7
	EjiwJrN5o3s7YRwdlHkZZ3IuAIZlCR6EpRJDfsXKwcwk8Nq5/OOvNVijmO0RbIp/QEhIXSi8b1x
	3Z9JZIOW5zaxMIFRRsnWDcv3fBfUiZ26SXNPAqcuGqe85n36CEoFMcQlrEiyyZ9Y9imoQk8RTPY
	ColTX4HIB/1p7EFIRPHQhPqo3tNAZJGkKDWCbPWThYJwdzXzVbhFUmNarjhZeHqM45pOfARPxsf
	ybLCTKS4qJYXrwVFtIgt/X7XzVFHCV9mHIaEsIrEu8fnwoZ+qomm/j5israOhOKOayqVPCWawSu
	EYZdzwNWIeuk4LgDo02trSZw=
X-Received: by 2002:a05:690e:13cf:b0:677:d251:ccd3 with SMTP id
 956f58d0204a3-67935f20994mr785504d50.13.1791566614782; Fri, 09 Oct 2026
 10:23:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009070725.13196-1-ansuelsmth@gmail.com> <20261009070725.13196-2-ansuelsmth@gmail.com>
 <20261009-b41aedc4c5583a8a94926925@squawk>
In-Reply-To: <20261009-b41aedc4c5583a8a94926925@squawk>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 9 Oct 2026 19:23:19 +0200
X-Gm-Features: AclHuK9ImRwdPwJQHAaZVf0ijPl9QjRVdptD4lXqbW_LJijH32tMCETZU-OfmLA
Message-ID: <CA+_ehUxMyx-aejgcve4+naou=LQ8-OOSTPMHvSNVhCEiEiw3Vw@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: clock: airoha: Document support for
 AN7583 clock
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 9 ott 2026 alle ore 17:12 Conor Dooley
<conor@kernel.org> ha scritto:
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

Just for my own info, what is the meaning of not-applicable in this context?
