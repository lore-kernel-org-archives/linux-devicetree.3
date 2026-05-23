Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2231F37FF4E
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 08:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779526670; cv=none; b=gf0McrsjuklOC49eKQt+DJbAblPLg/LSa4ef1reEu/Ef68A9DsPhsswdDlt37mW+GEBp2+bOUP5UZw8wVLGkVy3SDyMyf/uD1NmZhXKwAbNjpuptuUBW6xXvqCK2vdica81DwPE364mc6+Rkpozts6T9uNJsV0nj6snDiPjnJ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779526670; c=relaxed/simple;
	bh=d5reBSpZYfHYOBAARbzQGnZEuGxGm9RjCM30/rreUD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mk5dYdayz93nggJiSOT9QmWUEbuRB9AaNAmXiMhnBkPkorsgQN/dHkSUMRXwVsUeiwviJ8gCx4KhDkJ+IdB1lTfk+CcJIysawO0usP4wfWZfsDTMqffdbWpLXpIb5wN4psJuxaJH6dLbbGgRE96XXrzgJPQWs5eiXwCQuzST7v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hL/J0l2H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hL/J0l2H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AEC1F00ADF
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779526668;
	bh=d5reBSpZYfHYOBAARbzQGnZEuGxGm9RjCM30/rreUD0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hL/J0l2HFZ1MBive/kEFmPTNoQsxc2FMBpUr8VECJHDoUFL/ZBEyFPG3zxunH67sw
	 u+RyMjqZ8Y7jTomFDmtNLySOLzKAr0fgHKqgfuqhrLsKPH+dEdO72QAYtBHglbwcK1
	 9TQW0UZg1bRZrEO41KNtiudNz+OVjIb2fG76SyCGWGuSr1CkTK4vNKmZ2qRfDO+TM2
	 dIkaFjG57ClEahXITeU3qIJe9VRa3dfTRhxyhbmfAwz9h3ENf4fQIWxeYSBoKnaR8J
	 gSIhL00fcT/DbPtusNLC8WrpbbOgfcL6dNLPMDE2iNzWKu1aRlldlYvnM8nHs31hx0
	 zszWaiVX1Kcuw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a88db610ccso8338427e87.2
        for <devicetree@vger.kernel.org>; Sat, 23 May 2026 01:57:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9nEmS031HYDzNyhSw9Ye8IXscPbzevziy3l6QZXdSCRK1QViafUkcVYC+vnfSze6CITYHZ8LrGvp7u@vger.kernel.org
X-Gm-Message-State: AOJu0YzAstf9SXeBnTZaW9ZjBmdwOk42c67i9dulTOuWo5qSCp+A9VG/
	kzar6D/we8jWeC+M74od9b4YnqY9I8AZEZ4OIq8hy10InPI2IUDbu2mrTmlNKj3TB97mV4ZHfrr
	Ci4E5A4oK2Hga3PyyzDS7D3TEYvebecM=
X-Received: by 2002:a05:6512:24db:b0:5a8:f8b3:6c8 with SMTP id
 2adb3069b0e04-5aa323b83e7mr1440644e87.37.1779526667654; Sat, 23 May 2026
 01:57:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
In-Reply-To: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 23 May 2026 10:57:35 +0200
X-Gmail-Original-Message-ID: <CAD++jL=0ptkGc9tvG3Zt17Ync3FvaLkBeo+KvzEXZs-+zAd-jA@mail.gmail.com>
X-Gm-Features: AVHnY4LlZNji26qFzLJ3wDa2Vsfu-sPHqlTEglKS0rv0xnzhkn2xVLlCketOAoE
Message-ID: <CAD++jL=0ptkGc9tvG3Zt17Ync3FvaLkBeo+KvzEXZs-+zAd-jA@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: qcom: spmi-gpio: Add pm8010 GPIO support
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Collins <david.collins@oss.qualcomm.com>, kamal.wadhwa@oss.qualcomm.com, 
	kernel@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 7:34=E2=80=AFAM Fenglin Wu <fenglin.wu@oss.qualcomm.=
com> wrote:

> Add compatible string for pm8010 GPIO in the binding and driver. Also
> add GPIO device nodes in the existing pm8010*.dtsi files.
>
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

Patches 1 & 2 applied to the pinctrl tree!

Take patch 3 through the SoC qcom tree (Bjorn) please.

Yours,
Linus Walleij
