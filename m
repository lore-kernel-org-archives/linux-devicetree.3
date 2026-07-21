Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A226449B18
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625364; cv=pass; b=nXHZy/rFbKbhG2YtZ93bAmx47ShK9I7K6i6rUms2/LMXOu+H9uvOxlEwKWm35UxlaZ8pSnVxKZwXRcdHuqEQn8qZOgJ3Er0bcxqNHtFCOAj+EK/r8IgNdTpblhQ4RFksJL7d6PWintPkHsK88pftKzyabyv7OoFjtdTw+VPxRhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625364; c=relaxed/simple;
	bh=iSLi3M2D4DLUvmeXcdgZGaw2pMxFSQcGo+2BrU6o8ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XTh4efHkInVanhJul8Kt2q4563eV584GG8I4rHbDv1ncvLHaL7Fifm+YgS5UBt+wSdtEfxnn0exJQ5aAqGhgNtEgFrRzqQSW9CBmWY9TarZbFALEuCiFz/L5X5LZA9hMHEGVkhzEH/ap9n2fY+JBQWqdDuS93vcQggKC/RRj9xU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPNmsuGQ; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPNmsuGQ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1c26d7e951so25579566b.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784625361; cv=none;
        d=google.com; s=arc-20260327;
        b=GCpDKVyuIoM5vw/1DjHYcp19+AusBRatBCd6y/17KqU9FkbdmC6pF2v7O4aNWFJFCo
         B5y5wbuN5z1ni7eLF9gEzbPreC0AZj2nI5ZimBzsvAtoQZdi3HWhxkiFDsnv36C9If3B
         NOILgyOs+uNqV6IrQxvqZt8TM1qGPBmgO0yHm03CUtA+XU+jwMHKFH+hCUnhumbFFza5
         AWivtFHSh25WQwIJE5RhsERlWNtj/2cVEKofJ0xJJ2zQ43aUDlYijQ+YOsjkS+uUkSxc
         XgVt7TqMcICwkdP//jcL2pr4ypLwmZajFTwt+cLP+1CUL5Hjo9LCZNUFM8I2Co1bAGKT
         RvsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iSLi3M2D4DLUvmeXcdgZGaw2pMxFSQcGo+2BrU6o8ms=;
        fh=XFMx2oTowqhLR7iSHj7kBxZ++jS9RxH8vbpotZ8qoig=;
        b=cWyClGv8ulFxkUMWre3GV36yDchntjFvppMym9mt8zXxVie31ClXWs5w04OkCxpgPu
         WjNTblc/FL1l9RUd1K0jxsLJ0NXmw/vTHy3v+aLRMhDpdSZ+uF7ZjsoDvey3x/vJO4eq
         MH6S7yfZ7ga6KzHvIvhE4oaTdY90O8v7Piex5X0lA/JFCEJqMThflbrxZGiJU5rnN3Sl
         Cr6reaCsWeZi0kkOvZxFQe3EImXCA3eUMFNFdDPM9Mhi4/SVZjhMU442dZOtCBlDCfxa
         SsTdtEPYmR78sPh+xl27uvwcBLIZfNCSOltaiJaRt9kxT/TMkUl0peCPT5XDJI/mWZ+4
         AKDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784625361; x=1785230161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iSLi3M2D4DLUvmeXcdgZGaw2pMxFSQcGo+2BrU6o8ms=;
        b=DPNmsuGQlytL/vZm9jCzgonXp6dcII/SRyqWHucdtsRA88IsmMyfCg99fIa8VDSblO
         Nekpb37BOfcfvXyQ+4oMJlmJIhpo8q7tr6CrF6SSov02yuZ1jnifv5jSxUxYaYMmTTyI
         3Vr58loHuYuQgHdSnL8i51M1jaWlagOmMMDTdynsOme0+lU6/57RkyDk6X+qKwdFO2SY
         MryG97DzvZKzS0nCFtX9ulr4/P3Xxkh4yEJa3I4YEBhl4CscnyRgZFL/P1XuhoTBn1a+
         vnCynl+CSPngzwDRu+JiFoWE6E2ElqxKzOkqvnlOY60tQxgV9vzCELBrGH/jlz760y9k
         /N4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784625361; x=1785230161;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iSLi3M2D4DLUvmeXcdgZGaw2pMxFSQcGo+2BrU6o8ms=;
        b=bzf3Q50vb2K+dxRFIiYM/SfzSS2jiZk4bPvwzAkD/04fdlZ3P/SSSp4gGTcLx4Hx5N
         I33H2FZM5PGMalfj22FgI9urQwzgN1D3QaVDQ5FYx8yKCuRgPMx7HwF03vyha1M+Rnl5
         6MSwlkHASkKtmeoEdXONX5l3WKEcXc2SY0wl7LhzqAKJK2ThOlEJZSDOMYM5XYC6exF+
         w5nhIQXAz6a9NTd+oGXmqNdmYuSf+pY+CkNJI90SeIIPYoGdBXbYVCLVdNFNxzF3bQIB
         q+ZPHvHgwdw+qw7MEWexOOsvsxA/vG52SZjtZrnqF5Pqnr18byyWTdJbvRK5ZD5IfNhq
         xg7A==
X-Forwarded-Encrypted: i=1; AHgh+RpCe/UltrxujxieelzAT9P6py+CAgijaBM3AMYDflFAptMBkeZq1SMPmnxzyCp1HNxd0xPqUfFUyfpG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw++5EARz8dVirotDAzll/Chqh0lBREcWugzDaGBI4x78NFmf4M
	0h0A1sDzXf+MH05/wAWvtCae/XkMAvZmxgv1LPktIUz0la+0ZJdgFJfrGs/ewd4JQws+3I4eeN+
	ihXyFwTSncHCQUJDKshJWPBabCSdvIR0=
X-Gm-Gg: AfdE7clp/2uORQ1AuVQbdvDd+k8jPV3JOtt7QvZ9ATSrBBjBDHwtVPDRexBgnbHADL9
	oUcAEeB6+OexN5JjCQuuKrJi3tzCbrKZVp2BbqofBjebZZZqdD48Mml7K+emj3jZ/IDBNOOsA8u
	LhkPMw2dw0e9UP0vUVzXHxXMcgH4j6HsfO7TGvYFdcLxBeqiAMUkMJJvGSlNgQoRlWieJCjczNa
	l1Ao3CjXHvfh7ALlKNCGp6cByIFqUvfM01j++1CS6Y4osGrL0KPSHd1IMkro+w=
X-Received: by 2002:a17:907:e1d3:10b0:c12:34ed:da14 with SMTP id
 a640c23a62f3a-c16b47ea252mr429571066b.64.1784625361195; Tue, 21 Jul 2026
 02:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716173325.653164-1-a.shimko.dev@gmail.com>
 <20260716173325.653164-2-a.shimko.dev@gmail.com> <20260717173343.BAB8F1F000E9@smtp.kernel.org>
In-Reply-To: <20260717173343.BAB8F1F000E9@smtp.kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 21 Jul 2026 12:15:50 +0300
X-Gm-Features: AUfX_mwuJCnsoV7Bc__nij6gLoEyjQsRRd1cfk9xj0N1tsxo1IN6pUGHjkJVOHU
Message-ID: <CAOPX747iV9HbeLERSWFxMU9wHdyv2-ftS1PVSYhYF8HO7cOKbw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/2] dt-bindings: net: add DAPU Telecom
 DAP8211R(I) PHY binding
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 17, 2026 at 8:33=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> [Severity: Low]
> Is the dapu vendor prefix registered in vendor-prefixes.yaml?
Got it, I'll fix it.
--
Best Regards,
Artem
