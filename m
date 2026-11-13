Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794591103;
	b=BLwyfEvpHlbt2wmudXy+Rxq8982oyrEncrtcd4cJ7a6kBPz6SdmNcpFXFqor8YCWY98L
	 kHm4kns5Uv/fGTFJGcnNIdaBjzYifFXHCd3K3WBxNFG8zTSOOpgJ5OJiTB5CFOazA+5fQ
	 zzWDetwK+nfi9sF5eXG3T2oKM/JDi0ar9jyhJ/RfQJifM6KAxyFS7gAWW98Gsdp0LsAE/
	 4yqLknYpZQdGZRPhOV1NXeeD3O5kpb0+y+JO0pb0kzXVOqWGIdJw8XSGuq5EyY48g1Gdx
	 d10xEbSuFliqUeejgWQKbsvk7F6CZznfQy96cySIqC0UuhlN9rz7sZrOoNKdo1qDujQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
	b=rKPvrEnwcXLNNUP1vealOTc+pMtuw0lvKC10VhhwHMyV6WTVoWXSVTdA3DiynAmA7Uz4
	 kcxIDH3cII/11EX2kPR6pmWon7LJk6KXA3z+1otNuWRLVNDBZxnQelVtqlExYaeH2uIqQ
	 CNHZD65hBWPK3BfU+934t1BevF4TARDbGys6jY3BgMT5h2aOGn1gXEKZ1AzdTkaXafjjg
	 aq3EkaeQb0VgTLbSgI9dtXlEbjQ+GB9Q0eK0JhWiESxmoZd1ePGAZqIvq2nZm/L3wyhXC
	 9wf4NO83TfqFCcpphSclRCNZP2mnF8OKHnVXRAlLuB2lCMfOU2AUdkoZscs2MRsMMlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=le7K08J2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CB5606B36D
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67CB5606B36D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=le7K08J2
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67c0bd676eeso1077823d50.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:31:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794591102; cv=none;
        d=google.com; s=arc-20260327;
        b=ENtLdI6J57b8dGmUf/4an5fgH+h8JhxNwwRxDaXSzwmWIoDc+R/Q26b+YjRWuvVeCh
         91w7iPCexhqzVIfR/MZGqDgW9d0qcN7SzzrCc80C6wDEOgIDxCU0Dnx/qqDfTju729L+
         Xe3JMFfGKhJrJ/LBYdLpBvACFLfooo/ldwDezTBAMNiq1u1OdV7IQOp2YVwVe/GlR+hq
         3MjtZ9XGOY4i2zNRZGL7oaxtwDOHEQ8j420CLmCc56y8URO+aPwPzJheAxFhKeezPgYl
         h6/dYR7IDhnlrZhwNLa8jKZwAHHB3PQBtp1XoVYPk3jrzSmVR0tzNtBrygRYuY6fVDNj
         /B+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
        fh=YqxYcPpJjAtW6ql6cCKZbdjw6NROknkIm+5HaVQGQfM=;
        b=mfYMIRgJLcQFBBj3Lw4Mq7Q+lqqhLN2aqoOZAGrGhFqgv9FluFN1BT60IBlzp1U1vN
         tMOlCrngoJKtFF2q13XTMm4fScBy78pOnBMx2X5cxXrdbPhzmDNjynC9dhWo8spTXLBp
         EKp9YHwdYbTT0LtD8RXwe/5qCtVHAerx/SMGVNM4kmRBFXHN7lrNhJcEgLm5a0JN9OBz
         ZFnRLN+Q6fj1+8z/AR/aMtNDIQYG13f9mp9YSQaSGrYB+p1JREGWkjpvEymOLUm1ZnCZ
         RifBQ8Ok17gbuTlcGVTohrzCIjBrhJu4JBF+culGYj4hE4mQ9kl3WYDdbrj89sbRrCAv
         u19A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794591102; x=1795195902; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
        b=le7K08J2bA9Hr/68cdqwbf46C9tMiphP0VQXGYffptEgLGcYlBKFs1xCYmmjfWjy2E
         XIszWAT/7Xhu4ghnVl3bc/lkD3OXCS+X+Sm9CF+iBsK3mKNKSdMaYb/9r7sGzSB1TqX4
         00vaf2a2WnZQMW1Xe61TFGa6iALCGdNBSUY/M2ghQlI3neAa9DiyMLIG7WIID9pwE+XF
         M/t3wHfr+NXVnw+PnTtamguLyZXa/fpwaLUAg4I4Frca9/0u8MW0fZ0xPj0dCGmRxMrp
         OeKijB7gk77FddFRj8+DPtNF3nc5508pL9LOQe+rsb5MZGk+5Fd5fWLJtsbl2ke2sY/d
         uMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794591102; x=1795195902;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
        b=lDsa7jzkHMjgoFzfe3DIirWg9VTH1eV0h+ASW1P431dExkVrwRTWoVbJaEFZFIX7aV
         TxGw76ewqBEZr5n99HD4YbU/amLc+2RbWwqeM83Seb2LZJqYiIiT7j8ZM/IkJpML99El
         ovRe3iHitTmfACHxdtEd07SbS830VNluGF3Wk3RXAKse3QQmH26A3DI3i/lBBJvzNBQf
         8d/dxnYQ4BJQnks4Q22phXReqSH/aInJPNel6nevrhTcNY+PmW9ZXa61sIPYdwlF42UX
         bFPNzB4WGmTy/tw/NptV4tuZUW0W5FwGDblzOBvt4WrGGeOZaJ3MgM2owZSnsuQWOORi
         3NLQ==
X-Forwarded-Encrypted: i=1; AL+hErFXlFxHx00xYYxQyR7qv+I/E1LAzClPILvHbabd2juQQ+aWW2bv1o9+liqxH1qMg/zoXlZFCKbvVc3A@vger.kernel.org
X-Gm-Message-State: APuU4Z/oOD7Z/HB+/cg+kDHiY7GMjGJhMM++80fO9DZrV8c62LV061Un
	FW9xajRI3mlX3ghcy2jiT+ojLFpIfywDOrfubItXmA+dGgVSo/0d9Ml8ckm6rHMyNTCSbsbOiz0
	W/IojJA7yvkGeFZKaDCMI5565n9mg11M=
X-Gm-Gg: AYBFou1ZwyswzgFZPxxuAptk5xJ3hcjlWfVeTlp0TvGseO6mHfgFRrfzNhpXwuvH9oP
	Z8NxNo8+xCw4JBbTRfYEll6kDVNWS+unW9/rR84oe2mEUfCraudMAgwiPaLP+YFGqiVIvFApCXy
	pb3Jv3B2aaRZfygUGNHnDO1sk0TczraUTW7h8ToXCogVIvPyNiKywPzh3TqLPHBrGjfMBTlBTk1
	QJc/Q4c+cvPCP6VLuH5Cq3Y8jZcWhugGScxZKRoEqvHH142N79sjHDsP0Q+iTsow7slo8N1MX82
	FcqG7bk+pOgRVsGGvg9Nc3jYYYFLYvuzNFSIyKrRxZxFlS8lgTPaOpeJoCKLwrkQcGz0+3bvyP9
	a8TF4G3+6dsiRGUuHXoepvVZJLpRdOIuq/YXfGSvky+kTmpR1CQISuve7pQq77We/oxBi
X-Received: by 2002:a05:690e:4510:20b0:675:47ba:2183 with SMTP id
 956f58d0204a3-67d89709f2dmr1486987d50.53.1794591102378; Fri, 13 Nov 2026
 09:31:42 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113003217.197757-1-ansuelsmth@gmail.com> <20261113003217.197757-11-ansuelsmth@gmail.com>
 <737e3c57-9aad-4081-ac75-f79cb2084349@kernel.org>
In-Reply-To: <737e3c57-9aad-4081-ac75-f79cb2084349@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 13 Nov 2026 18:31:31 +0100
X-Gm-Features: AclHuK_T9pn_LFNwcoFkFSy1mvqcLyRF0a8TMF1gVMEOv5saT-u9fzFGXIXxZrg
Message-ID: <CA+_ehUxzPo--g+Ksd_0xJZo7_bhYZ-B17wG3OyGtU=3aa6B+WA@mail.gmail.com>
Subject: Re: [PATCH net-next v19 10/15] net: Document PCS subsystem
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 13 nov 2026 alle ore 11:52 Matthieu Baerts
<matttbe@kernel.org> ha scritto:
>
> Hi Christian,
>
> Thank you for the patch.
>
> On 13/11/2026 01:32, Christian Marangi wrote:
> > Add extensive documentation of the new PCS subsystem and the fwnode
> > implementation with producer/consumer API.
> >
> > Also update the sfp-phylink migration guide.
>
> FYI, the Netdev CI seems to have issues with this patch when building
> the documentation, because a new warning is visible:
>
>
> /srv/nipa-builds-contest/testing/wt-doc-build/Documentation/networking/pcs.rst:3:
> WARNING: Duplicate C declaration, also defined at networking/kapi:486.
>
> When executing:
>
>   https://github.com/linux-netdev/nipa/blob/main/contest/tests/build-doc.sh
>
> Logs:
>
>   https://netdev-ctrl.bots.linux.dev/build/doc-build/results/909345/
>

Hi Matt,

thanks for checking this... Yep I manage to reproduce and I fixed it.

Will be present in v20.
