Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71B44D597E
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 15:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471963; cv=none; b=TuHzf4ra0taMSPjGT72wCd+oEkcfAWGDba4i76f8sP8ufBlwU5q7KUQ/LUsCFlvhpRzug+TyDJeJMh8WkdAGCx9/WUrP0vDXG1h175HGqFJjTfvoZDx7uQRsWgbLj2Od5vPGOPLUPl03UDXDAO7XquAHIAx1Fipx7JgkHAsYejU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471963; c=relaxed/simple;
	bh=M3eh+eqPsqcE5YvVl5FSV9uki97nCFfIXkAkKL28Dxc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TBXm41Vsmnp0B9xJjKUYk9pj9qx0HFUKw7peSymyHQl8s5jz/gdJNINzv/ca85DrT5cpOhST5rb3ecOoFHHetuzdO4yYzL9k7RPRkRv8YDd+4A9pfmFeCrAG+A/9na6EUKCJpzxSAaCP2e4nq9r25MlcFpN07gxkd6jwvj58qJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZye8FHs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZye8FHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B901F0089F
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 15:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791471959;
	bh=M3eh+eqPsqcE5YvVl5FSV9uki97nCFfIXkAkKL28Dxc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=JZye8FHsMGO+Vhak768IyEeJ7EKz1SQUH8yovlQE0RC+CJfM6kyzx7gtXKzSUDJtT
	 lw2phsBV2qzm/emoM9GUXUs1ZAz47wNKvWCR2GPMGq4q5G1j7j+UakCqBZp99h0gNk
	 Ta6y2LRBQCiAoWgMqMl5iCXq3ajFAEhyuxLRkLtpeYqaK4gYaLaaGEcr399vTsDbl8
	 O9n9wvIoLO2y6U7CA5G5enfSsELTRPH/H3wVyeDgK9UMyLU2WK6jGLe0auIXpE09PM
	 lctSvIo87BT3yzTrAzGAfD6rKrK3J3LQI8OX7NX7UaWwdncf50p2bDlEO8oR8pwO5G
	 vgWtxHHI6waVQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a9787a156eso23887361fa.3
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 08:05:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxWqasTYJBbXwaVjhjs5JfxRy6VJNgugz3HyNtxF5YRCKG9gN0LRL5+a1mqfq+0Fj1m+ZWAxBzGum94@vger.kernel.org
X-Gm-Message-State: AFq9FYJiB39opNqlCeyyu0YyulOYDrTbrSpEwm/vYUCTKowNTH7quSP0
	lNa1vW8mmpmK3fJ4Llmv0vAa/opyZN0AKhDc/mfK1OZ5fcdyk0v2oLBJAv4VSfIvo4JooDuvLyj
	u6I0c6jVk/U0WVEoz6HxXpcFup9AAQ5gl3jfaSCvxKQ==
X-Received: by 2002:a2e:b8c9:0:b0:3a6:95a:52a6 with SMTP id
 38308e7fff4ca-3a9a2d0dc0cmr14079951fa.20.1791471958269; Thu, 08 Oct 2026
 08:05:58 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 17:05:56 +0200
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 17:05:56 +0200
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jLkPeEQN07Qk9RrmxkRf5EbMmnuwdq2yBFccwM_QpvjsLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
 <5555b1ee-1355-429f-b3de-f0926e4c30d6@oss.qualcomm.com> <CAD++jLkPeEQN07Qk9RrmxkRf5EbMmnuwdq2yBFccwM_QpvjsLw@mail.gmail.com>
Date: Thu, 8 Oct 2026 17:05:56 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdTYic6qG+gnnOExXWhfgbjygi-hR0Rr-FKVAhBkw1C8w@mail.gmail.com>
X-Gm-Features: AclHuK_vfKWdSTRB1YkJ3uHKdqAfTiQySmCCqB7eRtdQW3xirznTZ4Z9gYURvgY
Message-ID: <CAMRc=MdTYic6qG+gnnOExXWhfgbjygi-hR0Rr-FKVAhBkw1C8w@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] Add initial support for Qualcomm Kuno SoC
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 8 Oct 2026 15:11:31 +0200, Linus Walleij <linusw@kernel.org> said:
> On Thu, Oct 8, 2026 at 5:12=E2=80=AFAM Hardeep Sharma
> <hardeep.sharma@oss.qualcomm.com> wrote:
>
>> Hello All,
>>
>> Both of the following patches are ready to be picked:
>>
>> [PATCH v7 1/2] dt-bindings: soc: qcom,geni-se: Allow 1 or 2 address and
>> size cells
>> [PATCH v7 2/2] ARM: dts: qcom: Add initial device tree for Kuno SoC
>>
>> Could you please pick them ?
>
> Missing from the To: header of your mail: Bartosz, who actually maintains
> Qualcomm pin control.
>
> This is likely why it has not been picked.
>

Devicetree sources are Bjorn's territory. DT bindings should have probably
been sent separately though. In any case, we're at rc6 now, so that ship ha=
s
sailed. Please resend after v7.4-rc1 is tagged.

Bartosz
