Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D117C3793BC
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 22:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788387782; cv=none; b=TZJ2872HtGYx5MGkPTHg0i5B04nTP+S4SUNiik1AJ8C2X6TxnWQa6nWRVSHu9I1YCf0giQV504h2WfepyzB1T3RJ57Op7WKhGL0OpsHD12O5G5SI49JRgUgL9K06YlxM4Pjx7uhESb6vya/Hzf1hHGNQYgPvYJ8xfLYEki3Fptw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788387782; c=relaxed/simple;
	bh=PlnA7pZPe6iWSdjPc1ZWRfK3KN/vULI5guFytatqI0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lShf3h7cTnyO17akVFc/ulCDtZs8wqPk+4WHtWtYPrlOlUUdPdybsUMWiQW8y5fVdHGVLE4MtCP974vKIf2s1gVF3cJdKWpZ5qbMYdh+XdBP7/3KpgRQX0Ldc+Np/6Z//nw3yUOrF2bUWFR0SEKFwI0ONVIKIIBpeqWMhziym0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/0PMuaB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/0PMuaB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C766C1F01559
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 22:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788387774;
	bh=PlnA7pZPe6iWSdjPc1ZWRfK3KN/vULI5guFytatqI0I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=H/0PMuaB5u3sU0s5hGkJY/59TXNSJ6KMAwYT7jv6DQQk4TtUUnWB6gwoPXSKB5Rsj
	 r4Z49dhd9jT3aUGdIDvQvSx2jXHh7nmrk1eL/pVGRW57SrHoOUVySaQI4c4bHmzL7Z
	 Lpf+YhzuvGrgZx5m29WGHGdkKMAoHVVd1k/uwxdCbqJjjqbvhvx8hv2081gBeqk7mp
	 a8QaMrjXU45MrqQNdtkCKMiBWIty0Rv59P9hLA6tFE1wHkHHHXi6u2YKUKXyhXZZoI
	 O5SHXVF3IUdMPgLdpJHyA6hgRNjg3euZjqaR8SWtDF8djMZTXYPUabNECvqHEqCuGa
	 8s62cWc4bBdtg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b4ab4b4179so1536992e87.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 15:22:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz7H7MrU+9WsxIwSgF0xXpUkNd8rGhcbbtPAwRj9hO9CDpw/TkcSuDFybcPqUzT702pKxQ1iQmwodWs@vger.kernel.org
X-Gm-Message-State: AFuF++nelGNRGlD9eQkAn6/dtAOwqbI4KzVMC317cw831hXCzqs6KLny
	tgh6eGggI0Y3IfaKagSJPFE2uV7+6vvnonziadgiBzJqF3qknNhMFvCx2A9Y3PnvbgEVxcEYSrX
	3vfmoO5nji4wz2FhEWH1xvL6U7A0/NUY=
X-Received: by 2002:a05:6512:31c4:b0:5b4:5846:d925 with SMTP id
 2adb3069b0e04-5b60869986amr2881504e87.21.1788387773462; Wed, 02 Sep 2026
 15:22:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
In-Reply-To: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 3 Sep 2026 00:22:41 +0200
X-Gmail-Original-Message-ID: <CAD++jL=A5QWEfNXnmpKFMju8X1BQ8CsxMuqhia7mfMFbUaFfHg@mail.gmail.com>
X-Gm-Features: AcwNN1VW1RszHvTzjuJbWoFCZNyLdzuqFUCfNXCFY75SAWSdMQrzlNz5Nhvn0yk
Message-ID: <CAD++jL=A5QWEfNXnmpKFMju8X1BQ8CsxMuqhia7mfMFbUaFfHg@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] drm/panel: Add 5 DDIC panel drivers for 14 Sony phones
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
	David Airlie <airlied@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
	Martin Botka <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marijn,

On Mon, Dec 22, 2025 at 12:32=E2=80=AFAM Marijn Suijten
<marijn.suijten@somainline.org> wrote:

> This is the second version of a largely reshaped series that brings 5
> new DDIC panel drivers (4 Samsung, 1 LGD) that are compatible with 14
> Sony phones:

What's up with this series?

I am officially a fan of these drivers and I liked the work done so far
a lot, is there something in particular stalling these from rebasing
and merging?

Yours,
Linus Walleij
