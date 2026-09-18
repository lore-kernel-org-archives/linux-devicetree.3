Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6787938E126
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 22:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789771437; cv=pass; b=A6wUvKtoL5YLpBiRkmE62MmGNlCxi4o1q67HiRkXD/G/hTavAZEEvBk79ayNqi/FS9SuXRfPNmxyQWSNzQ/vvpV9fL8Kn6nfbdHniOUqhFgnd3I8H1Enm51nIIv4OD1E3yetNaE76iqT6AVjJ+j68c/QLzMcSDhFVfUfr4Yq4DA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789771437; c=relaxed/simple;
	bh=1Onau2nroopvIQasZQPq5eAOthr53QBTDwhTG+pz9gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tObGCDf5D0xAuIuldlHhON30nBhyNJoWQImOv66IxMzSkQg6h/u9YwcGHhKeEPomj5FNBY7kdUPmS6vJvgzjS2q709uXuz3511ffnuIGDyS+XrQkMKAc7gdbyp5gtsB3e5OTHKmHkLKa426wwjXjyDXMUtb6sBba+HRTG3H1/Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfHUrrzY; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfHUrrzY"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1d00daaaso2152234a12.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 15:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789771434; cv=none;
        d=google.com; s=arc-20260327;
        b=L8hNEQEcy2apWm2YyKmhHWudafmEDKF/mroZaxd7fP6CI8OuzM1LP1QS3pkXWcbl/x
         MtBhyGZoLiDVzcYQ0XEvDYcZHJdMIHSGufcROMrBm6/dzvOdurnoYzAYmZ0okDJTdaDz
         6owvpKgP+sw0aGljxAAzOCxQnR8YexiTju7ZM2nlQVrvTguSZVdSXlQlsruQgF84aNXB
         uSZt2aZH8U6hXbgKPM8HVlr+EKcjKqskNzxQheTsxljeicO1CnguuLkYCkU73RJ/pCWt
         WfleedmlfU5bms1DY0Qa9PSGau9nrHWKn0+lUsJzUAgQx1R6lEm5F2IpCYZKYGJZGSUZ
         WZfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xkCUHEW8BaYz+mvJmpvhPzJPz+lQKTKEiJB6NksDW9o=;
        fh=Z4LNAXpsTTD0LM1WLb0dlasrI3JpxIGRWvvHIvw2eM8=;
        b=gv5SVboBjgA3JQXBaUx2P1uXlSwJ7YxlBEkM70yNo1BiReYd+llhKnGaHpFJqss8vk
         BvnCQZwzI5fLFmhzqExN7uaCI+Uw6q4gnfeIYl/oEn766B8gFyjmVQkZjKWcbtfZpiHQ
         9XKLxML5hbOUEFbslPBE+a782u4dYYS+63BY6avOQE4n0shIS3ggfH2nHbK+r/tOsEro
         MD4PCQKkUtgE+GIPshrn6f8yQNxxiayEisOLFC+toWuzUusl3otscmTAxg3W1eq1V9VP
         /BOHFUwfcO4NVZC3o2z0W679p1hcdGl5/RuYMbiwPLoyQoz1HjoPSbCMnhAnpC6JfZ2S
         3bWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789771434; x=1790376234; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xkCUHEW8BaYz+mvJmpvhPzJPz+lQKTKEiJB6NksDW9o=;
        b=hfHUrrzYUISnGqd4pSpG/SxQFrsQkhzSj2I7VmqFVuLrbGp36Xmb0txB/yVCod1wrx
         O6L2b8+oa1cf//VK+vOSf5k/voAScvQXUVKd9NGd1E6xfqpgrjz+g5vkp0p1Dt/qPgCk
         +dtZ/MzQnwW9mazPYr9xol3HZrWXr+oZHpfxo1FIvPcVdv6BMlUBvYUhRT3l3S8dc0V7
         CsfXRNDVlRFxEjk/iHWyiC+FZ4WVdYbzMY5PsprXr7Zpe7VVVXKysAkenXSOSskiWQLs
         Itqo5vBJksz+k+E0HiTAZBleBywv1CJ+CDTDkbUYvMpNr4V5ecFI1iMe3UhtDwDJoiN7
         EFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789771434; x=1790376234;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xkCUHEW8BaYz+mvJmpvhPzJPz+lQKTKEiJB6NksDW9o=;
        b=NvTUTZUtMsNoLqIWKfzGtCZtx4tZOmVWSf/kmav6nMSCjj6fsx9Z3r3BpHShk7E2rQ
         UqyLAtad4nMVJixQshXaESmtFaoVpcQQcmhvXl2LgfxuSEpwmOYnjaTZ2QawQwlaESe3
         VoSbBTZlR+cB1kaAaeu6pNvsm1R+GcJbb1dm/N7iF2Y+Za94nuKhSh2vohLUyGOSmI/r
         gInmwd8euYkNOm2rb5wawN/kpZxL19tleV15GObZATXPvtTCGhkYLyHtG425MJcuopeZ
         TWTApaeRDnBjf/K/ZEjO0iwy+7Al2IaxD0KG+RA3lhQY9pl0VJECMUbmCHYRSCVVG9rf
         vFbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmWoP0JqA+A2OV5Eec3L8xIpx5ojeyD794L89dJOZ0zq4vQh0zQEL2kJ1CHrM+fhdUVYY2aMq9lwea@vger.kernel.org
X-Gm-Message-State: AFuF++lJBWRR3s5oOmrNkxyebhWWtBZGDbDrGtiF7Cl+YfDzImdvFECE
	xZa6XxT9MzmNqIDi8ek3ibFkNx0IB0PPt39QLC9E4f7VNx4eDmrz8LtQLpZU0UD1prKdeKJyNKj
	/xVKa96qptYMA3UFu1DzAdT4FMdFr8NzX+uJWwxlNNg==
X-Gm-Gg: AYBFou1v9WPBNdmRvgI8NDzqlCl7pdwacUiP3LjWEcxpNZUY/diDQnN8T6tnO4iERVl
	C9BaKO1x6KTkiZjhwnbgWvP/Vj3/YLIfCLihBNRo2CXm6E4OhPMP6R850nncosd5/eWps9Hza6O
	9P143KXRcva4FCyqxYhonVt9hE5c+eVQ9o0urxAWLgqvp9kBfDrb9M1Rr4T1NZIYqMOpbWFg4Az
	rAr8fIrosPtD/cyhmyeI42+6RrDVxKcL1fIT10lTFFdTOg2OICkeE+39tay5nToFwwGMrbEeEvl
	oLIUPjpFrehHbwziHHtoLxVWpywP8gtIV+owSpiq/cHnQTDSeJjC1NUV++q5KVv0
X-Received: by 2002:a17:907:1c0f:b0:c29:d62b:fcfa with SMTP id
 a640c23a62f3a-c2a156590b7mr346464966b.2.1789756176118; Fri, 18 Sep 2026
 11:29:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918175736.355305-1-l.scorcia@gmail.com> <20260918175736.355305-4-l.scorcia@gmail.com>
In-Reply-To: <20260918175736.355305-4-l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Fri, 18 Sep 2026 20:29:24 +0200
X-Gm-Features: AcwNN1UQFOY_vCJJJdBRj6O6gZ3zFhbPbxWCZbiFNcjPHyL_aMs2Ld1pz8hUFJk
Message-ID: <CAORyz2KEfzcJ_2AphkPU6o-YhLAqudCXVdY+LDoynUx_FsTMJg@mail.gmail.com>
Subject: Re: [PATCH 3/4] soc: mediatek: mt8167-mmsys: add routes for all
 display paths
To: linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Sashiko found [1] some copy-and-paste errors in this patch that are
worth correcting. I must have checked it a hundred times but they
still slipped in.
I will send a revised v2 after waiting a few days for additional reviews.
Thank you

[1] https://sashiko.dev/#/message/20260918175736.355305-4-l.scorcia%40gmail.com
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
