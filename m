Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0974B3EFD03
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180778; cv=none; b=iHPZvhFogxPNkLoXxpKFvmP26Ql0e39SnawwPf3A4srSoTOxddDv0Ddp+Exzm8xXzUxv4pr8upQZpdGBUmB3XmFUx/rXXbiDpYFYSrdEw66UJ9wi7XdEywT3N5Zk3imY6zSZr4ELlCrsqGC7UCWS2FmmXN6kOb5R+lFo3GSimlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180778; c=relaxed/simple;
	bh=g/VnuIKvkGWSAajf8vvIgUd13LyTGZr4shl0aUhfam8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nhw4If7KZ3rSL+vGc5S24DBfZhjRdfuu73uWjQEhGGb5NtAgIcw/LukxjoxW0DOEGYqWQAEVPzamCMeykl0tAI0IsAFcP81UGrdVNqMEYeqd5/g2Q1pxiylxKQ41wYS3RowSam+ZbLwPNWNAXq6FsldfSEC3Qt1oUpnOX8t4mxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnlHs3vu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SnlHs3vu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03941F00893
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781180777;
	bh=Nj6I30dESBei2Zmp1z0LfF/1I7GCQA0Q3yZdhfFji1I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SnlHs3vuJPcJW75myJnz3dI4AwoX607x4PnuASHDNWxd28IFxcdcFVf/1P7kLzdvu
	 DvJpAMullkHv6B4OijQvNEyBpRxRTaPYwpIGPlzdSOvNsFGSBlsb0kVjrqTxuWeXVw
	 xtBOpjHiysyHhBYOpwaP2X54HdpJaahbYXByLRHb8wbf3A4hqIjolX6auq26e2Fv3s
	 CFJ1Wrc+j1E/XRsDyAiJg05zC/44qa+5k+yWpYSdnL2o3n5USwz8jyfEMvJ1ExZ5WY
	 pkg7EyKleS4vpAiYz1qIMTf/AOpycZwOJCC+YthxdPuZAVI+QdWQxunCzgxIqXZnpo
	 T3c3vBBCX0sbw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aa6cdebc33so7248259e87.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:26:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9uen6QG+3apFqZNl+uHj0cNg/3qPNqDZwRtxh85UyfvXJCBawGVTR9P+xVJxJ3tj1qT5Ny4nXWOvB1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Z9RFnHHuu4ejK06MhSOHJ5dSBtqEntaqpbms/rDACg3tv9CZ
	hGNoKH8CLvQqzXfDmK7V/yCYtfBJ6FKmNbVgQ+Xk50F/HEek/7WR9R+tdN6qlC0Gbd9P7CcyUZF
	vL9tbOKOBQxBm+gPqSaXXUS/zzYsG8TU=
X-Received: by 2002:a05:6512:1282:b0:5a8:8db6:b3d with SMTP id
 2adb3069b0e04-5ad27ae3258mr738931e87.24.1781180776604; Thu, 11 Jun 2026
 05:26:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
In-Reply-To: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:26:03 +0200
X-Gmail-Original-Message-ID: <CAD++jL=SSUOZTyE29C_z0Gj_1iKgdLnqWaMQc5BKdsY1h5OAUQ@mail.gmail.com>
X-Gm-Features: AVVi8CeqWNRQFQ5gUdmKUsibk9c4XCoQP1UEG8vW5TTxaputcf1j1B_Elc7vDYQ
Message-ID: <CAD++jL=SSUOZTyE29C_z0Gj_1iKgdLnqWaMQc5BKdsY1h5OAUQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] EDITME: cover title for pmg1110-gpio
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Collins <david.collins@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 9:05=E2=80=AFAM Fenglin Wu <fenglin.wu@oss.qualcomm=
.com> wrote:

> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
> Fenglin Wu (2):
>       dt-bindings: pinctrl: qcom,pmic-gpio: Document PMG1110 GPIO support
>       pinctrl: qcom: spmi-gpio: Add PMG1110 GPIO support

The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
