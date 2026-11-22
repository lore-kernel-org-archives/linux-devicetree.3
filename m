Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795332829;
	b=TrbNjdOeM+dlrQRDsLgwzFb/gC0K0qqNG2RCYIR7n46slrm65OknL3QXiGT7MNsYWUOr
	 okgd/SVFvmAbB2QsnwpySmWUbcqwEwLpiVv4Fs5qjBV2/+jJti1Odqss8ntDgMjaT3cwa
	 5kwsmuC6x0UG6GL+lw57jx6Py/zHOx/B5tm4G6YC/vhIa18TJqGog58xV6oNYm8Zs5/2W
	 yyXjTPACtwLl3FbwWltTwRGubFaMQL2fvX0CObn5ecDRiEWllTX7ufR4w9xf10HdSAzif
	 7Aj7c/w584zc6xzUrtQ144ZqW+RUIYDZJkZkUswTwJXrdtGZYBUCBcqzoSLBcagTQbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795332829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=4Jc9Q03F2saooXo6TTb3sNlYecivQhO/Q+XUXZ3Oiak=;
	b=pXon8RgDZRSSuPw0tjROI/iYpV1iYm81OOa35maffJ92dMFFlY7WJnuDTMk1Qw5t6SDS
	 M55kku66Iz8kKQvsKq9bSHWVllTLCmThBPoCGHGS9f5TZM+0u1E51Nz86p/y0LaJNZkQO
	 2TiwkRMwbmS+Hi/cP8G/hqhz66VvqdMHfQiprpEEYvoAP/dfec3ZRzoT/AmmUuff7hft3
	 SIKL/uXY0NaV4c7KCmhIMDSez2US1s9NvS+BCK18QmloLmup8cVIpEh+WPWyq7+8CHMQY
	 uZfMXSflwUMnWxYpo31T78OZ7TjyvsYDgCi2r9DfmuK8Qpy8SxR1cFyblauLBHchawA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iHharhHN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01366606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 07:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01366606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iHharhHN
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38587f3de36so2780344eec.0
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 23:33:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795332828; cv=none;
        d=google.com; s=arc-20260327;
        b=rY8kXqNipZ2iDy9pyKSKitxZWXDmsbQU10iHw5Fvxjy9rVVt10KF/M+S4hfq4l2lW8
         FknrA7uLTlDJHxdxPrbZsJHQTxBvQIrXBhiEEJXruxsWD1B3lMHET0/tOtO9GHDNPKeI
         1pjIHB9APMdWAQ8pcfJMAX8k/IAtdmc0vGzwg/EAVIiFRnyMwiFZ3TkFixFG8XFqV3En
         6KFMhGr4LmcA2qVoK/csltISm9j8daXwVjzusHqt2vqu3q2WWArcnijwNYpQI5CrxsIR
         sComFrA/acj0mrMf2xWzrFivV4g92cCePdvVtLqYBUk9bo4lOhIi486oVtzAS8KD/J8O
         GdNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Jc9Q03F2saooXo6TTb3sNlYecivQhO/Q+XUXZ3Oiak=;
        fh=JLtGiJAUR6GgwNuPRTzZdqZrDRt20OSMsIjw63eSm5M=;
        b=UNyqZM2ATgcpnJmUAqC7QentN83/ni79ur2BVS4sTWQoa7qq6vbMk60p6PSqQhXn2F
         6WdC6vvQJTMEWIln4yRl+Gr5awmgGSFkcv7AEThuBwIfp3zr4M750giOF0FSGOtRz8XV
         a/V3SKjJKqW3Q1cOKOrpaFkNnMvWltaC3MxYS6fq2JLZ32wNSdMNr6n1YzC/mz7DD3Mo
         kzQfdqeRDutk5tl/qjUZCNx37CRsoQtEf6kARxdEYwk7Z8pHPh+xMKUvPjVqG33uFYyd
         sIWrzP2uulUDA3LtzahK1KQItlPN03AOWLcfpLHoNJdI2pGlnmfTRdasOA+rW0MpqxIL
         bX2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795332828; x=1795937628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Jc9Q03F2saooXo6TTb3sNlYecivQhO/Q+XUXZ3Oiak=;
        b=iHharhHNAvWWmMNmSJORl9CiACUuHi3i0ws3GR9vxP9SD6imQbfrumKrQ+D+3/h4VH
         DUQz2t9UyojNEslSFUoVY0B+eVTMj5udjH/m3y7IW9TI7lh4CDy8qVX2GkJ6WJ5xrNZ2
         uiSYPjl3+zim7UYVdOOK+MxRuB9mWbWEKcTr2Aa5m4eIFeQ1Ij51S3nFtx2RzuPey4z4
         vFrTxVw3E5xL1mbSQxKca2N0FjBwLxtAIsB5K/65SkSc/BFJEELAkUPMlFodi6c8/UKY
         xZjRmXPYOcTChmt3Lp9r4b/KMaSJDe9/30QlmCGKnRQWJwZAM0vmtvtrBa/jXQF0Hk0f
         O/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795332828; x=1795937628;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Jc9Q03F2saooXo6TTb3sNlYecivQhO/Q+XUXZ3Oiak=;
        b=UsAZ89CDvFyMuSo697geVb/XRcsIJhGAqPfQYffd5Blvbasf/CkFWj2jouZbKfA0iI
         zQWv/6TO8l+17Q42ZTvJBECSbQ4Gw5gesjZk7+99P7bE+Cxaf2KXZepElvtnTdaT/YVk
         ZN0OZ6XRDvS+vqKp+psCMnWMknCQFS0kQtDdLBcSN/LGpg4UOVeSSYSfVPZxXyw2rCRG
         W85L+kXaldZaE2UVE1Iu+5kvCe4yLTvlPyeKOx/axy0Q6ixQhjrLtDCDjtNhab6EBATs
         ZUmdU1RRgrNCbgePKdoYQb/NYjEcztbZNAF560bvg7zit5davqeQnlERjmSKtSpoyYiN
         31wQ==
X-Gm-Message-State: APuU4Z+mX9v9t88mB5oZVtxOxgIZx3U4OxXdWVMM1KK/K9+CJGjQQvCb
	bguksbCaMdpkyKHpU5cZtTi5X+t3cWe57FD/BXkg/pHx56vb+L0IiVCWUjw+MLZFnEnSnf8zHrX
	9ifPKcoryKe7W6lHaxQa+sGAoZihOW2U=
X-Gm-Gg: AZFdTZeICfNVdUeNalr6u9BITeK4Kgzm/eotQMSJriIdW9+aQLIm8ulpkmCqJip2jVb
	7wE0jlAnI8/7oo4CmgJ5vUTlyWGpSuEmTzeCK0/de1P3szzUu4IhipQtX0H24nRGARO+TaoC8M7
	kVrzoP+24nS8S0GQnJEdSI1GI1CwErITtJ5JME4lsn1TtcPxHfgIaBCVo0zOh24WWITETc6DLyq
	IWJjU+DljqIYXn1Radx30+0dQcHJQ9zqgggx7wEctyMLBB4Llh8f9+08bQhaRIX0bGt79N7J/tu
	G0JUlXDcHWuC8y2yZDxiStQAoT+2dw3/0viLAQR87hx7Tkdqp8jRn5/Eyxf6eaA97tBW+oDh8x5
	P34eIJnuJEBie1HKJy7ddnLHFObYjLAS35x8735aoTg/EDJ/VVB0MEW9bJSRO39nNTtLKvccaxg
	YkXwKtC6OBIhVQZ4niuNN1+2Kyp9a7jw==
X-Received: by 2002:a05:7301:d813:b0:386:8bd2:da35 with SMTP id
 5a478bee46e88-3868bd2dbe9mr5806237eec.5.1795332828030; Sat, 21 Nov 2026
 23:33:48 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930072450.61836-1-clamor95@gmail.com> <20260930072450.61836-2-clamor95@gmail.com>
 <179305276926.4032096.5720095014424223708.robh@kernel.org>
In-Reply-To: <179305276926.4032096.5720095014424223708.robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 22 Nov 2026 09:33:36 +0200
X-Gm-Features: Aa3M54qiQFO3akCNwqI_UUbQKp2SRj0lVcvXQw852BKZ9oO4Dql8w1L3qsKBEpI
Message-ID: <CAPVz0n3-63X8fQbohNERGJMdytfpqRGSOPOMoNRpWxgmMaMrUw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] dt-bindings: power: supply: maxim,max8903:
 Document MAX8922L and RT9524
To: Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	"Rob Herring (Arm)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 00:1=
2 Rob Herring (Arm) <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
>
> On Wed, 30 Sep 2026 10:24:50 +0300, Svyatoslav Ryhel wrote:
> > Document MAX8922L and RT9524, which use a similar charging control patt=
ern
> > to the MAX8903. The MAX8903 is set as a fallback for both chips. No dri=
ver
> > changes are required.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/power/supply/maxim,max8903.yaml           | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>

Hello Sebastian! May you please pick this change, it is schema
adjustment only and Rob Acked it. Thank you.
