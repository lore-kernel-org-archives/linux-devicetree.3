Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8522571DA
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 14:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785594114; cv=none; b=JcT7YjsoEjnHu69ODEFLFv3PIv8y/KmTUlsaRs4pQNDO1qZPfr/C/3gdsbcta1oNuk9JvJJj/2cTW0svJ2+GKBa01JXBORKOmICCyMsXm0SkulN0SpFDrDa096xQ/919+uol+GCQym1/2eFm3ZZQABtug0cNEZ/tneFN5EYqQTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785594114; c=relaxed/simple;
	bh=exVtmdZX1PynSEBKENYO3hisdMk45s5LzWWiu21HX1Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P1+9IBsktvKjHh3q0t218JfV0UzKzVJcbcQOT8NbkYiiOmGJ3AowsAwTgnN0gL7g8B/vG9qJ1/pxbELZ3fAARcySuo0hHC7OIkF9hw2TR86NDowBRtP12mAEK6Clhq2DLeEuIBPLBiqEN9MAhfniqF6Vd9WdjikEjbYApX9zeOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqG3bm0t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqG3bm0t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6021F00AC4;
	Sat,  1 Aug 2026 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785594112;
	bh=4ToByyrzT7Na5Wq+L9ReonOn38erB+TK6o9NUr5epjw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YqG3bm0tvCd7ViwGqnQ84HV+MhleXOeUmpTK9ITXujp8HTvmtH8qtc5mvFJZxje66
	 s6WJsQW94o7/4JQlWEbdHdhGYTxhg1aZNfG2veBW+y8UyPCw7QbGGkW2PGXRYakfqg
	 SgLbVZUNzkdsrHOpT7a4iB/tw84mjRMPN7CgM8kij0Ua794YbpYWC97LWgSYJJchX6
	 9RcwjSFnbJCt4+r8McrHt/QKpMMje3uwsmw0Fi4hoJE1OUrhrNQ6yREMptTBz7kSlN
	 74iAWw829jM8Gm/gVqA4W6SMPVyAZLbCuwAGajKtBwnNxBFGld3dk1lQUjGm9cb71L
	 JoRulhdsumV0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: clock: qcom: Add video clock
 controller on Nord SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260801-nord_videocc_camcc-v2-3-674d7718e41f@oss.qualcomm.com>
References: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
 <20260801-nord_videocc_camcc-v2-3-674d7718e41f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Aug 2026 14:21:52 +0000
Message-Id: <20260801142152.AD6021F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch references a missing header file `include/dt-bindings/=
clock/qcom,nord-videocc.h` in the device tree binding, but fails to include=
 the file in the commit or patch series.
--

--- Patch [3]: [PATCH v2 3/6] dt-bindings: clock: qcom: Add video clock con=
troller on Nord SoC ---
commit f2d65d3dfab04afd16d30573dc1a05f462740b53
Author: Taniya Das <taniya.das@oss.qualcomm.com>

dt-bindings: clock: qcom: Add video clock controller on Nord SoC

This commit adds the compatible string and bindings for the Nord video clock
controller.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.=
yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index 1e1fec1cd7ce9..65620a656600f 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -18,6 +18,7 @@ description: |
>      include/dt-bindings/clock/qcom,glymur-videocc.h
>      include/dt-bindings/clock/qcom,hawi-videocc.h
>      include/dt-bindings/clock/qcom,kaanapali-videocc.h
> +    include/dt-bindings/clock/qcom,nord-videocc.h

[Severity: Medium]
Is this patch missing the header file it references? The newly added device
tree binding references include/dt-bindings/clock/qcom,nord-videocc.h, but
the file is missing from the commit.

Any future device tree source or clock driver attempting to use the
qcom,nord-videocc binding will fail to compile due to the missing macro
definitions.

>      include/dt-bindings/clock/qcom,sm8450-videocc.h

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-nord_video=
cc_camcc-v2-0-674d7718e41f@oss.qualcomm.com?part=3D3
