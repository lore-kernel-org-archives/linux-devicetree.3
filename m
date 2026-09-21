Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A1041F5D9
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 10:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986996; cv=pass; b=M0IndqjN1qvLxSASNfO8ameU4C2SkA/S5dOJ07E8nYteXBT9n4jFKiCa81sqSYtArJpKk/0ldJ56Wc1yLfq9bJDSbMV4tids468cOK8NWiZlSwdLOEhhx42U/v777aa9K6roswgoIcxpAFMde57vT8xqZL3HYZDcJu/RRLa0n3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986996; c=relaxed/simple;
	bh=tgcbeSCZ60V4Uq3SzPkVuSOvbwuE+Wldbt8NJtFM49w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mI6Qgn3/0jjF91GcJ2RiEqoYWgyVFRz7Gbn2iUz4JZpydHtuYJWmBFi1d/jN3tZt1fv2qhL9l9mJnxZLmRhbeVKT/Z/zK0Ft512gEaC1JE56550Xn00bFPvWNOux5yXdeYuvr+8CnAYfy27QSZD2OGirpmGkwQ1LXzhBqQa5pfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sd+6JFXq; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sd+6JFXq"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056be4d1so1925888a12.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 03:36:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789986993; cv=none;
        d=google.com; s=arc-20260327;
        b=BMl3ALVUxoOyNhU7/xie+BTfmAgW6ZZB2z6GWvS3+HzONJq4rKHlBoXAx3HKefjDLi
         vuibXO59whITw04hSCR85f84NU7X0HEEcSit4ymcSXST6jNrFAkGe1I2nkRODXWdKJdT
         AacgeYlIIAmuJmyBdtXVp/yLA3CIziL3Np7mrdUQNXFfhZvy9hejZx1y28WR9Bx4Vx0U
         qBaCysapSBULya9HZh3DkFpZKFwqkhzK8i4/jECYTD2Qb63+7JIsBh/9RBCnwZ1jhY/0
         bz+1bmVqD4qIvZtkRAS07ZL7FRW7zcsT/4Yebt5d3Y2zxknAhtO34Y+6+JZvwjjgDyoI
         Xx3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h/tDLQ7kiHFPBmC66BABbwtjlpncgEgg8G3PARGPN7c=;
        fh=87zdPseIj2TAsuWj8teVmJkbjSkeObDrSw5is/4c92E=;
        b=RnxanbtwwTJmZL+05oMRvFf8QGmdLDY4jhljOjuUnQ/O8Bf1qlKM9jJDjY+wixx8kY
         a5ijm3MtNqdeLfw6NWpSic/L2cEa3mhFf0jB8e/Yibc++fSJbuFNThdDtymRlvf1lMYr
         lXdagoaFyxV7XE1hHroXnuokZvASEQkJSurs9plYSu4CP99qNnQuQ5iG8C1pKnox46Ja
         IM9/ZkgUgA2DE9KcxclfrrYF1Uy5jvEuf+NDW9ciyOQpSFQjap1O0CA04143PZiwOH/u
         exbQyzDDJh2g2ThxHecIMUA9tAOwh/CQw9qtiWoKhBfPMFhb7EXMLfIk3VxAwQDeFQ3v
         i7Bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986993; x=1790591793; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/tDLQ7kiHFPBmC66BABbwtjlpncgEgg8G3PARGPN7c=;
        b=Sd+6JFXqGyBFMEWfi+fEPY4u9Dp9u6tdPWZjrQa1b4oyWG4vVy/tHid3sWNRjKbhzR
         mJt/q1cnfu45peb8OyZsWdgYrZlfiWelKFywkibA4xFeBbnoXnoPhFsDD3u70QcuJa9R
         /fmSEuUZiovgFLf1RZtbueIax0vY0a+QSi72a2belA1XYUo4Q0SaV5uCxjdRGdRQCzWT
         GD621IWI+DGJ20dEHSSDtXRbfvDH2W8ZP+4ptCkaTlpfIuM6g4/F6RWTd2G73punhYSI
         4whdi4sbDv3FYeshDeWtmYPbO9RY1GzhHKPEJbDbzRWC5C1csDjzrSW2/7HqBZp/eQq8
         sElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986993; x=1790591793;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h/tDLQ7kiHFPBmC66BABbwtjlpncgEgg8G3PARGPN7c=;
        b=n89gDnMw6g55s2aqeckV+5KG+rpRxe153KVozvfTJes0DCEUotbpbCOi77GY2OEbHS
         7mcqSAs1UEM2rdEmqIr1/gfUkk3P7KOtG92fi1H3uZvo9syUhvsyFGxr66NtczZPdpjn
         fm8lV5XGAhPuuTGfLuFUVHx4lojQqmeeIbrVss6FNjNwMyqnGydHXdNhcjvnJ63kHm6c
         rWUHIdGP01LnIXr++dVAGj01a7O+93TK8RbWwkTI35bunMFyoynr/nVi9CUgSam+xxJJ
         qtTd9Jszsgq9pSOFrTppIsgPR0q7Mc9n3VeqxQiHwAb8Zar9sw5jZk6Zy/VZDr2VXVnG
         STPA==
X-Forwarded-Encrypted: i=1; AKwUvBzT+Zapk2wHD68GingY0x6l9wyuovPNbDx7C8HWbig6ae5Y62+s33zWcdk9+JI92Mfb7T5zPVn4ooYC@vger.kernel.org
X-Gm-Message-State: AFuF++kLdLAIsKmBu5cL6j2acWWKvm96T0kh/NPzDIZo3YGOYrCAqdaf
	0CiKfL54wKeuDKfbtSDhY43rWggeOynSwueI2jk1BhuIT4/s85QJqkRtT2kVirh/BPpqbOQnoZu
	jbIW0gvBfGMEitiIzRaGhjfHKVrQ5Ywk=
X-Gm-Gg: AYBFou22hJjRpp33rSafw6URyUCvlE/VGmF4wq0B/9q9ZIFZpnX+tcORnLXC175GNOf
	DqAf/8Jz467/i6sC3LGkpokw++G/KP0IupyC8xxuMSM5c7Ic8VXow9Dg8ZRGOWuEXHawzU5/qyV
	bf2/3PQuigM7PAcyfeB9DjXYJDTExYMesxzgqlayvv2Sa4hHJ4DFoqx2d+PzEyoBN0sU1aSBMXY
	H+WEofG/IL4gSxUzSCAD4kDKkbh0NQdBA8aGvfp00KM2cIBpCZT+kjJNwzkrJ4HNthK0DakpW5E
	Ru1kxHNHKi4YtcwvxJU0OkhyxCNjHY51E5RuibU3LoP6+Pdh8AAL1w==
X-Received: by 2002:a05:6402:4547:b0:6a9:f88b:14dd with SMTP id
 4fb4d7f45d1cf-6aa4f97d7cfmr6238277a12.1.1789986992392; Mon, 21 Sep 2026
 03:36:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918175736.355305-1-l.scorcia@gmail.com> <178998607025.21155.9680834242820851509.b4-ty@b4>
In-Reply-To: <178998607025.21155.9680834242820851509.b4-ty@b4>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 21 Sep 2026 12:36:20 +0200
X-Gm-Features: AcwNN1VQ6S9fCy63ty823Nyxcerwh9XF-bIr0lhnPcmyyBWQe3Ulp9EvTrhD9Cw
Message-ID: <CAORyz2+E9LY+6sb+0G-deR8ZVZK_xu+p_hvp8aKteVVhHpeBRQ@mail.gmail.com>
Subject: Re: (subset) [PATCH 0/4] Add support for the mt8167 display pipeline
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> Applied to v7.3-next/soc, thanks!
>
> [3/4] soc: mediatek: mt8167-mmsys: add routes for all display paths
>       commit: ae0968038f994d6e275f5dc94a27325ee751fe58

I'm sorry Angelo, please revert this - I'll post a v2 with the
corrections spotted by Sashiko [1] later today.
Thank you

[1] https://lore.kernel.org/linux-mediatek/CAORyz2KEfzcJ_2AphkPU6o-YhLAqudCXVdY+LDoynUx_FsTMJg@mail.gmail.com/
--
Luca Leonardo Scorcia
l.scorcia@gmail.com
