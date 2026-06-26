Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284513F99E5
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 14:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782485081; cv=none; b=I3uF9Cpzw4d+fZrAU3U6wAsqAK+hEiG+5nfNX+ztFzm85tC4ncoF/5zs6LOzfXxy/EiuWDwqDV+6qPymi7yovkNI4LbcJsOvDvsaDYz6ripSXv4V5+FAkzpQGcoJE22jbna+AhsSDeY3pMfSI1QEFZ72pTVM+lhFoRMtAXExwFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782485081; c=relaxed/simple;
	bh=wo7pqiPSksjfBjenX/Wxro0deCHdEvK5J0TuZLF/5UY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jGyogZIOWMZtWRtVJIFgc5kFk3f3nMe5EVMFGGQqS7ojYUGwDbaav0JxmIDDmtN/Fb+UbY+NHngc125dhH509bQtgC54sWv4tlUYqG7STCbJbQ7I+wATZ3DovsuUQXkM5RT45NaP2eu6vnYUkoqC9EpeteD9xayRtZFkhaCpjwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVD8uPN3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVD8uPN3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82411F00A3D
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 14:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782485078;
	bh=wo7pqiPSksjfBjenX/Wxro0deCHdEvK5J0TuZLF/5UY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=BVD8uPN3vhmt0tTw0rj494F8jx124fRzJEOPzknnpt+UojIS+RA447uyv4AR1801l
	 EJKnXcXWotk8q0TVzCl3xTH2SGjMWRZhmYyVq3zgj4Pp8ltjXOenXA9FjQobCEjyVE
	 N6IVR+t6Pe2eAOiHBKkQahrPf7G8jkR3e19/aLlzm6uyp5QYQ/ZaOLPw7sr3KiNJg0
	 +t7JBrUXF2i4RjfX3AWgH/bSQz/5dJFOQMRh1wOC63qi7kflaSWud9i8t4Qdr6J4F0
	 nzm2Huw3SqXGDEy8cXLIihvlvaO4lGshb97ke4DoaH/UOKgQSbn1cGG7wHX4E+bFFo
	 DdqY4O/i5UtKQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aa2c25c632so875235e87.1
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 07:44:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrhh5EuaAe+kIQgh2hRsDDxjgO1+dHuAmcTik1yAImTW4AkKB/H0B96mTe5R8qpSC2b1Gjj6dxNtPhd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+0n4SPe4qxvjnDklzP6VVtV7lXQ+jrrb+Ooewq5JcOKJXjYcy
	Ft3OSU9uxYmRQlVo5y7vyCcqnI7/robxUpRZY0T5fVQZgirXGbszKPmOkb3oOMYJIyTAqqw6+gl
	39lx6fDZVW66peWnmnfJZlMvSr1Z7A/ALVntxYZ8mqw==
X-Received: by 2002:a05:6512:1325:b0:5a8:8db6:b3d with SMTP id
 2adb3069b0e04-5aea1f4b9aamr2215524e87.24.1782485077659; Fri, 26 Jun 2026
 07:44:37 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 07:44:35 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 07:44:35 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jL=_27BOr28Pi_UqjDpJSuRztYGKO2CXynOvwSVpe1-uBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
 <20260610-pmg1110-gpio-v1-2-a9c50cd8b5d9@oss.qualcomm.com> <CAD++jL=_27BOr28Pi_UqjDpJSuRztYGKO2CXynOvwSVpe1-uBA@mail.gmail.com>
Date: Fri, 26 Jun 2026 07:44:35 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me+ZBSMaOYGRUKonA=dbNkHY3Ovag0J4E8rr8oESSkGdA@mail.gmail.com>
X-Gm-Features: AVVi8CdivKvRCew0jR-PMn3z_xAGV9V8TCmmlzMbwwdMXjc2U3bvSB-7dauR6_Q
Message-ID: <CAMRc=Me+ZBSMaOYGRUKonA=dbNkHY3Ovag0J4E8rr8oESSkGdA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: spmi-gpio: Add PMG1110 GPIO support
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Collins <david.collins@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Jun 2026 15:00:36 +0200, Linus Walleij <linusw@kernel.org> said:
> On Wed, Jun 10, 2026 at 9:05=E2=80=AFAM Fenglin Wu <fenglin.wu@oss.qualco=
mm.com> wrote:
>
>
>> Add PMG1110 GPIO support with its compatible string and match data.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>
> Acked-by: Linus Walleij <linusw@kernel.org>
>
> Bartosz will queue the patch, I think.
>
> Yours,
> Linus Walleij
>

I will go through the pending patches next week. Thanks.

Bart
