Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DC23BD241
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495118; cv=pass; b=TgQ4ndBFb5xxxmhCG30SOu9KSxs3CkxdD2560wR3sNrgcAM6LHPkGZl/AsgXbVxW2J79yjxbvspE7ibEanwuLHjBs0igdnr5msQjBGwgiga8F5o+twukPowdEk1hLSCXWW7qrMszk9v/kFffXRX2YfDblIS3OQ7rYtP4kPh7ld8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495118; c=relaxed/simple;
	bh=vH2RJlYCeOfSYlR5bu7uwY8+vlQvHMHRiMHpKSYXzQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p0H1cny7jbQ4l4hlObhxkJL5MLOI6wecd25OdhbxlI3gbqYea+Jy435axuk20S+XvoF3fPBN313Nw9+bJVzcl5Y+yszzIfIHZTtwRUPkBMaUcdwOf6EaoplswvsG/Bqzxlsojnsqq862bJCCR9lMoQ463q1fhcDfA88f3G0R0v4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HH4NEwh+; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HH4NEwh+"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-368763a1bdfso371050a91.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 03:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778495117; cv=none;
        d=google.com; s=arc-20240605;
        b=WGqP+vac7vQPiTglbndVF4NVmEAhvK3hkyylIolF5oCsq4SMk/lu+uOQT7A7BLtfET
         RPOO1H36zl1pPL8efWD+YO2TP5xQ+6V8WElhZqRi26C3kVQ9tMyiEAhWCGVf/vaqw1Oc
         Aug6VPoiW1joi0M2LIop8J2QWgP58m2DSKH/2VgrpmAi30dqdKemFL7jZytpeSStW0cJ
         5jwvtNxrlDUVWoC/rFy45xYqVnb8+Q17FDkFaJNQ2Fn4QY6KyoL2bSyVXnA06N4a/qU4
         fC6CG1jHp0eHxI5iQDj+3bYVa4kaf/X7RFKFF3UTtPZ27Z/iDvwLjMu4pvhBnvEL+SNn
         40IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vH2RJlYCeOfSYlR5bu7uwY8+vlQvHMHRiMHpKSYXzQE=;
        fh=xZLPyxrZZnEwMVoM1ipzQBWYtD3flKdonUXiZib7Ejs=;
        b=Zu9xDu5R36fiCyffg5tFFyM2DsT6DmNsQke0FOVtTD9vh9ekG5p2gXnw8jQWP8iowe
         PEmvt1bTMQBpo8KlZQZOSpgqUYUG3bakP1AicTduE2m9ALikX2wJGH68HKEOvBZtf0/z
         phHVx1VGMzqbvODDHXdovodXp5DJ15D1xJf5NbtxekU+gAMEpIEuTEg5QJo910hWWmIJ
         6HXC+dLCR3NPvJFdbFArav9vI4w6pmaYnPy5xvgthekMy8AekoaHq2gf+ZBpfH7VVBGN
         ERSZkxJnTb4KJlumCKkXih+TTIwLU01eIXPxF7gv4XjJYaNt0fP2XQ1n0SG6RztL5NUb
         03yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778495117; x=1779099917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vH2RJlYCeOfSYlR5bu7uwY8+vlQvHMHRiMHpKSYXzQE=;
        b=HH4NEwh+1UCpRaJFe9aySXn8u3SZsRMIKKjbb9ukQVP9nP+V5B2PCU+p+0+Wo6GnGg
         EaSF3hfAkNScQ4cNxXoMu0US6hjeDqLpfGNwxxZf9qUgvzQG4wgepDlkkl6DoV7OGLJr
         DcxzURPZuECKH3mZP0JnlVqIW7CUMbn3qwRTnpuK9XaPLCIh5N1vgLcsnr98NjzAT3Ba
         g8R5KC1eXtqENiyvlkDjcXUdkDXkJbcYLlbDxTAR/wMsDm+TDwfh4D/rUO49q6aWv+g5
         tyhX6oH83OS3xFM+jlvkrWXo7Nl7E8Kqk9fCuAcscfytFSFsZ/NiKzxSdItGXVfO+XQZ
         GWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778495117; x=1779099917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vH2RJlYCeOfSYlR5bu7uwY8+vlQvHMHRiMHpKSYXzQE=;
        b=X92xKxGTi1/qJso8Caqcj0laKaJY0MSRqkyxHQCL2XDZHUVs9lIjLdMGdjdzMbPRPt
         xq6hFGSaW++A7y1k28Iw+QUYvtBE4BvvwIMllZcbt7fZ2Tn//1NQAvuQd2163FcmBL/z
         sqPPyMkknzTUQnwby5Ry0aYgy475lrmjhPOhCdwOFd1iw6kRzBoJnRsl4U0atnqxPpkM
         BgYH/KO+8FLhrBOFrbC0MEyZRUFed9rbZ7g2OXvIYwVMzTx099Yt7pn6V8H+iPCYT/JW
         VgiGTJb2zTzBrhCwniFidJ4HrbngMIytT2PSyrrpuXE/THJKfdpFUJIXz94wrF6eXqzx
         V8WA==
X-Forwarded-Encrypted: i=1; AFNElJ8SQHuo1gBMiRhW2dM3/RJypuxLWd7C/pdkzZRSv9Fk2D6J6TYrKpSKev0dL0e5jllYX0SdXFRe42bm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Smjp74410NdnFYUbhZxBFPJWlgwVRzW6vN0WIptvzb5bAYza
	7XSWDZGVaR4Sxp0yl/wTfS4w7AVHq2z9y7jZoz0RYj9r+3OeAp8J5C1yeLkccgspfF1UpoS9pZA
	eYLw1cY2Zm4yzlZXEgl/6llszudJQDQA=
X-Gm-Gg: Acq92OFeQYUgV9gbDkdLlfgZ2mngqeQJTl4TgvmTdetKgxYR2jkHuYTDJq3GWtH+JjS
	5WhFCVuv8uDt2APpK2xuykIs61A1NQR823XAU3qWE8VPto64HZWr1QxLGz9LnN772ELe75NaJz1
	b8r7lpJQ8i81tXKELoTEsL51zHnRvOK4uuOqQ+LT5eThnAcjXxPFppuFl/sXCDsD97OEKPW4LOB
	lfA+zDyAJp6r9qinBOh1FBAsD1h1Won5PiE21c5pHbPzW3ykulbW+uL4vEHe+6B/Pd7zT/aMiXi
	ccXXGu90bVcy7ZkDln1RlfbnqwUXVT0xZSBNVA==
X-Received: by 2002:a17:90b:33cb:b0:35c:30a8:32a with SMTP id
 98e67ed59e1d1-367d4704ffdmr9410585a91.9.1778495116902; Mon, 11 May 2026
 03:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
 <20260510084303.122426-2-phucduc.bui@gmail.com> <CAMuHMdVrPChcwzbwrNLZBoRXGQ-Gm4e7UwbOm9gfAzQ-TQzFqw@mail.gmail.com>
In-Reply-To: <CAMuHMdVrPChcwzbwrNLZBoRXGQ-Gm4e7UwbOm9gfAzQ-TQzFqw@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 11 May 2026 17:25:05 +0700
X-Gm-Features: AVHnY4LmMwmb8HoXnC7e475rElbDBQl1aVeOa5zbVkNS2rNSLdK45V-U6OAhPp8
Message-ID: <CAABR9nH6QidCNYfTnkMf2_Mhi56WoYau1fgwxDrkqH43jb=_qA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, krzk+dt@kernel.org, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, magnus.damm@gmail.com, perex@perex.cz, 
	robh@kernel.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, May 11, 2026 at 2:31=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> > Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Please drop this tag: it is intended for giving credit to the person
> who suggested the creation of this (full) patch, and not for crediting
> review comments on a previous version.

Thanks for the feedback. I understand the proper usage of the
Suggested-by tag now and will remove it in the v4 patch set.

Best regards,
Phuc
