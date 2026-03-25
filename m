Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260AA33DED9
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431245; cv=pass; b=Wu8jCDDcD5rp+U1u3uTKF8QMa71eosiY0AqLccpm+t+q0eR49RWCQjZ04dStWTUKFzQpHZEnPvAwu7p7QmHsTZxoaLbXniaI8gf25pgrKUqOpR3c/bkTNmwDajIReLFQBvi3ERpq6KGz2qqYQwSaf1iwLxFtBGyyPiuPkXKJOGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431245; c=relaxed/simple;
	bh=MY2gl1nH38Ouss3TR0Op2BV2a45ltxMnBfWmMEGs8W0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kkYTduxbLYJ7glXOqOlOXWzJj3X5zJflJNnHHmDDTg6aXLL6stN55UYlYcjsgbuVefw8EhhO8qzQSP+dDlj3Sl04jOUo71alaxLH5hw75VAUwzAMncgxsEGwFu2tCi1nByAdpk8aLFDC5YfMT+/F7JvPnr8y4odVmhCMVBuyXHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ln0BTl4K; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ln0BTl4K"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a13a06fc85so5327036e87.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:34:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774431241; cv=none;
        d=google.com; s=arc-20240605;
        b=bxKky7wB4jVocgcyycq2eS/ffa2wM1yAMF9XG2hEm1CmtSv9qQ6tP/jZjRap4nfXhg
         tVOxY7+rxqS/Z8IdOWOl2FdRrCQdb5NqTQSZO+wJUAj+8N99RkiegVO2h0fFryBHyhms
         aX7Bxt/gXiNVnmHtTpyaHOi8OgJmXlEmLp7LxORWOq0RJl3MFma6jbASqe1F10AXw5JH
         TI8WAR9TyMiGUyijGxpBOSAM5oke4aM3w14guhjbVEp6FPDXbV+8QipLhf6Q/xzqzfMd
         +xWSE9mzmBaJ3I+2x5bHHy816oOyX12ZX0J9WZNgJDZOlGuHXvetpkrShv131uvYwsRn
         hm9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MY2gl1nH38Ouss3TR0Op2BV2a45ltxMnBfWmMEGs8W0=;
        fh=8Qmi6zmH3f/+MfmgEB2dia99SZXhPqy/lt7VuctnnI8=;
        b=YOqE0cYJY998TU54Nrq73Gmu042b2/4gJlauNgcCVjnEVCnErfg9aP437FAAz73w8F
         SZbjK+xSonkFSxtglrP3K3ChBIBK4pOfgt8rjqvKrlZYpZk661ZcaMNqd9NbJfn0xZUi
         DodQTkusycS3Rk8WnphT6EVctWVxoCxCQD+UBTlmXMMYf4kF0dIujZuLJhgKBp8IS1ZP
         HFS2gx96p996XYjBzXPAPgnNmDPYSD0ROyF+566fY69yrQIDFB+xqFyd/NdKJDB4EQSk
         orZmZYgT6vKy73EMMOHigqyzvrLc5q7dNpnAUZLlMtr59g/XlOZjHNzjqqyw2BVxiOO0
         FKbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774431241; x=1775036041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MY2gl1nH38Ouss3TR0Op2BV2a45ltxMnBfWmMEGs8W0=;
        b=Ln0BTl4KxBbkgKaKyp02cFD0NZviYDFhMDEXemA9kLNc5q7J2vV3cSbfZDI0EivJUe
         /5ws21cx7CfRr+pfF1fzQSXAPP+8RQJzWBy3QKU+FkR8cKMiIUP6lwLwlcK+jO9kh28v
         JNkl6FIvjsTHyNG9t6VdoSwQ0VWqTTGvFbjn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431241; x=1775036041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MY2gl1nH38Ouss3TR0Op2BV2a45ltxMnBfWmMEGs8W0=;
        b=doZTsRECsUSVocp4P90ScmPhMioJlq5MZ/NbESghg7/HsgbFIFWA0jRditbZ8KBD/f
         kJasvRE4V3TpqS4JsFbwQI+Tnq2DGzN9RH0a72nBDn+D/oy/f2eowWzz34f5P/NzYKZ1
         u5Iraxikg7TsRTa5lb/udZaRJtk0lXG4C+Z91jG4ltkC7JV2or9nuei7NT01FWRHVooj
         iQDGEUEZW9OiCh2lTnk4rgDul+YE7s0znaJL1JoiroQz5OAYqmlbyBWqe0SBPnBNlNsq
         zWxKJNTbtOdIvr3wHxF5o8Exhwx3Z6Kxt8yBK+uWbF6CXfW5yJ1eX1uaMjhM1uYwr5v2
         Xb+A==
X-Forwarded-Encrypted: i=1; AJvYcCUkVoIxdejQoKcy8/PR0zn3pS6V2JJ/0X/BMWFliKatZTBDr9nzv01KWwKo9p/Iu2lWbfF8e7brgd9k@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9QicfDgKufJdhISUM47Huhc82B0+M5d+dYr/88Ruqi1DBVuYU
	HwD0ztFnebVgTe7CEeX/nM+83Kzy5z99cQNZipT3nyR55QjFk/Um8Ph4RNsiB8TemUOIlEWPWl7
	rq4tpAUONTcb/3Yo7a5T7U4invk2rXSnsK/UJWpP7
X-Gm-Gg: ATEYQzyCUEPrgGf+3gUtwoS6wRXEYMXIkPaDvTIDCcxP1od8DhSkwaVnRkMpbxLI/4H
	6PWZigrNvRzcoZsEYzZtOxfdCcDSLjFI8CitaKVZStjjFkSZ6aglRs34yLPlds0hoPk8i/Jdmjx
	l6tR7+pWvYjeyR505b52u6scbAOQ6/UqE/HH5OpwpcvT8sTvh/Dzv68l2+2MFznXtWwxrNTFiIE
	X3XFitTI14XakuhiBu+5FjN13SF2l/lCd6eKc+JX5ssEx+dQYPLFPfZFYFWewNyQRA8hqrZ/B3B
	EB48tjSCGdVb6P/h5vBrBIO/9sKdhHHW+A/i
X-Received: by 2002:ac2:46c7:0:b0:5a2:95e6:8349 with SMTP id
 2adb3069b0e04-5a29b995620mr642031e87.31.1774431241276; Wed, 25 Mar 2026
 02:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325082546.1572405-1-zhengxingda@iscas.ac.cn> <20260325082546.1572405-2-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260325082546.1572405-2-zhengxingda@iscas.ac.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 25 Mar 2026 17:33:50 +0800
X-Gm-Features: AQROBzBoVW0M0QSdDVNGtSFKBNttJVM9VIsbTSnjXBMQkFjb8Ekw7FmKmmCMyQE
Message-ID: <CAGXv+5EEFtifhMeTKQ9uCvih+Le8XPafxASiVXzd8BW0swaRng@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8173: add hana revision 2
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Mateusz Koza <mateusz.koza@grinn-global.com>, Frank Wunderlich <frank-w@public-files.de>, 
	Gary Bisson <bisson.gary@gmail.com>, Cristian Cozzolino <cristian_ci@protonmail.com>, 
	Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>, 
	Max Shevchenko <wctrl@proton.me>, Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 4:26=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac=
.cn> wrote:
>
> The current mt8173-elm-hana.dts file only contains compatible strings
> for revision 3~6, makes boards with revision 0~2 to fail to match a
> revision-specific DTS and may fall back to the rev7 one (which lacks
> some gpio-keys).
>
> As I've got a Lenovo Flex 11 Chromebook with board revision 2, add it to
> the base hana DTB file.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

I couldn't dig up which revisions were commercially available, but
our downstream kernel says that regvisions 0 through 6 are all
compatible.

Acked-by: Chen-Yu Tsai <wenst@chromium.org>
