Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FE34D7D4D
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 10:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790849713; cv=pass; b=V+8RNptg6VpM6O89Q1+sC2R48EJypfEjMOyCgQoAbXXyRay3yskmrREOl0J2MonVI9D5bPI5KOF6MvBXxuvK8G2cYSl26VFbgA7Ckb0aeq8PqGlzTKilA8S7gzaXYAAz0Kg+ra+wEhzeTBpXDFLjwqaSp+daMww5OAn6QZTWvcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790849713; c=relaxed/simple;
	bh=oYWMzc7dzXRMIQ4WDnbpQus1ZRBA7rO8qi5HTtl8Bo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PBw7OG6kG2zTSmrbZJh1fRuj8+twNBSAZcG/WIqZj0CfgA4UohrX5dRU//w4xruLNOJxfnEwXn+cFN1i7m7BcoPFJS4KNaGpf7We7SsQGf4LKOFj9z14BnS52/ABMTa8pKbt8CXP9iyeBrLzxEErgIgwxwp1V3D6WbmrJgM+sMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdcDd4uJ; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdcDd4uJ"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba447469b1so511564e87.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 03:15:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790849704; cv=none;
        d=google.com; s=arc-20260327;
        b=rvYi7+RESrKCRFYzc67U8kCqzZ2zcGAwqWPsGds43pNeknSjezCe5jtW90aNCcA2TT
         evv+L90IsP0kuPGg9dRv95VjJL6rfgFXEqRJ87Jo9NH7DRsP7RXfxThRN5xmxCD0rPeT
         ucK6v/GA9djN99RqueMAZdHyhzrXAA2B3WReAJb+rYR7fmUadGyJrhTNyYiadi7mxbAI
         epjzG7u4GyV/nrx973y2rG3LZLuBhpEfNkPDiCCVXw5pU1aCTYzo9VQspFJJ+2KyXwL2
         rzCVYouVlV4pIqDPIsSZmrAby6uOKPfna265La0GXsmqoTAX9zGxRk6WM1Cw4lx3jfFy
         bCJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oYWMzc7dzXRMIQ4WDnbpQus1ZRBA7rO8qi5HTtl8Bo4=;
        fh=ALZokl0M70M6wXvgjJHErj3+qskHOlRZyfPuWYf6NEk=;
        b=ev6yxRxXZ9RqpbXOxs3rQsSI72h1nmvxe24TyBYSQVXguyUqIiHHV49QTYBmqoqSr5
         1pudOuXtB7Iz/g/1/7l0PeWb52eLph0AH0X0A4svRLdWZHCZj3K//9M+sA7LIvdT87Lg
         em8xcIHQLCqomir5hh92SA7z+LRi79oEndj0v2NsGhBUWCvVMxnfa3hRKgMD+aMSRAxl
         AA/2jyWalgtoAjH9M6jgnTvPdVq4hLr9iNhehstEgm0GtBKk13TFfFrgHgAeiRXrumDp
         8TS6pUebH+uoIM79gYnqHigwTRk/fFcqmB55j58wtPbv4icQ00HFHqJfgFfU0BW3PUR1
         Cbzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790849704; x=1791454504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oYWMzc7dzXRMIQ4WDnbpQus1ZRBA7rO8qi5HTtl8Bo4=;
        b=CdcDd4uJs9/e5t9qr6Wik6pzEXLJaQMPyb46DJzd36w2r6MkwIM1xmYZ1Z+ESQ1jMm
         iqyKdL/0VXk82ndLm5zV8LMPViXp0QZlpLlAdzHSv3sUUVxJcsdcovhTjZ0AqNTKEnwJ
         NS29ObGeppA8SxDJIx0SNmpk3UROeEJ1QYR2ioAD2thhczs9cKJvo/noGCTF54qr2fRU
         4v1Y3QZS+jPxxbCVuid5kYqCnR9B0AWp5/bZZ5mNW7f+N53NRGEeMou+FJJUbPRjMp8F
         1GR2CSkmqX9+Tqe9Rj+b9ABeXXCGpo5HxHAR6n8hRkWCqDtIVP+1lWuj1rpbdXWfJQ4o
         hB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849704; x=1791454504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oYWMzc7dzXRMIQ4WDnbpQus1ZRBA7rO8qi5HTtl8Bo4=;
        b=eMf3W9Q/g/fVQUCSHvmO46lLrIGZtgL2v0Ta4DFhtViOgyv5TP1PjPcQlFmNex0kDx
         4qVcw+tqmgU7ejJDWadLiLzp0NrwKbyckzc8V8+8vdTvmqycKTsF7ERnKPs3rPd7roHQ
         JvgmvSx/+L5Dxub0LTPM3965s0+pIsKa5g0sdj51Mz5khckfkCKE1xphdDq6aGemFQZO
         EsJI5iA4CRgxXj+9f5oY1o8lcREEe+4n7PVAxnDnOt29H0SoVE/84vrN0wk1FjNXmK8k
         mRB/Sr4G1HgLh/WvC5y0FnyCNRMWMie7Y7kHAdLKZr7/sB5fZVlEs9PsQybCM7IFpXHE
         OQGw==
X-Forwarded-Encrypted: i=1; AKwUvBxtoKxTnS334kWPOLUZfxPdjVcR3LGUhRXIaso/KJMNiDFSjLwKGNzHL696QIedcRFhQeonIqTxOur8@vger.kernel.org
X-Gm-Message-State: AFq9FYLXqRyv+rUXUqkjAbhLvNtGHP3TN34UkmPa2xx4dqeOEcGH0G2x
	M8q3s850vqu/UB3dm0piDDcbhvnzil27Ju3wWPqcdUifWH9uElmsH0jaW6hF9JIpbztr4zJmkTD
	WmyC1NZMIdq1A/1jr8P92uq5jPLDb2ng=
X-Gm-Gg: AYBFou27zm57h2VBIkZirdbosIAkZyGRXRiw9kG0uvYPeWQwFO/pnWtW+o6eKWvLZzc
	tgD4xGbLi8Jgv8vAM3BpCQ4sjpw3DjxqGoFwV1J6SnASSWYR8IvBTneOSPF09iQv+127CmsrFzh
	xG2+EqDGOk+wgHOEF+LQ6x3zPEyXarIy5snR7oMTebjObhnFGgqN27u97d4946wWSH/JxQXWqN8
	BHa1NxToNfsZhpEL5z/tukR3mpEVtLx6epEmq7jS6fWj6rXmeGC5/3MLq50b9m4hacAbJb6vdWU
	O2oq69/BInzKhULaSQgw8srmcuC/5T1MScpPTfx5lqWboTcPTJ0st6uQoS3dP/jLt/RGlJ+fyRj
	tenmsdrOFb7l+4FJCoJosBsTQ3N904DqImKPIoPxCQwhs
X-Received: by 2002:a05:6512:6d2:b0:5bb:784e:3df4 with SMTP id
 2adb3069b0e04-5bb784e3ee0mr282162e87.46.1790849703308; Thu, 01 Oct 2026
 03:15:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001081005.2209755-1-primoz.fiser@norik.com>
In-Reply-To: <20261001081005.2209755-1-primoz.fiser@norik.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 1 Oct 2026 07:14:49 -0300
X-Gm-Features: AclHuK-74KPyiquqCXZSrY27gWUyd7LOlkpNPte8XIS6tTUYVa6o1fJvZXPOZX8
Message-ID: <CAOMZO5Aibmm3d=9Ucro0Tqvyh_s3EozLM25axV3XxeLuG67PCg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ARM: dts: imx6: phytec-mira: phyBOARD-Mira fixes
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	upstream@lists.phytec.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Primoz,

On Thu, Oct 1, 2026 at 5:10=E2=80=AFAM Primoz Fiser <primoz.fiser@norik.com=
> wrote:
>
> Two small fixes for the PHYTEC phyBOARD-Mira-i.MX6 boards:

Shouldn't they have a Fixes tag, then?
