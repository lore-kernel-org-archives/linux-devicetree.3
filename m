Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603138;
	b=nkQpSlULnqFhhTfLZIk/7DxR2aJVCqP728tHz7yGGpZLDxvWEWPv2se0ZCGILRdXz/q/
	 mHmJp8yJsCPYr033rJQVidPbW0/b0rYLJH9VqO/jLe8iyWmQF3pbEFf6f86KBApJ67mm8
	 kpmXexBKBOX4JT9YDZBFRehqwZlb4r2AmuEvPcHCHbAxLZpOb3oB0PuJ+1Wc+7JgOfJ4n
	 ey3WyfN2GM2XEgeMW2ZYqD5AyuFcO6kenT7Gzm3xwDVz7QxQCwUEZpBlfcFZ3RxWkbeqk
	 LeVjVgUR8vL6QYI0kFywn0U3xlOtCRnyra8BzjlZ+eq6nGKNovtaLscWbbPYB5YLmKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603138;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eHS7j7tEkMzKHHd3S/aSdSM+T1e5fkH/o/+WRgKeMBg=;
	b=W9wa+McusagVVmBCp0+59wlfps5UzpQqJp8DQTBEPw+rJOITNjZF/jKj95CJR8j4zDlL
	 f7rCsOt1dwmgEZukQn3rPiOr5XdkBAnOVBhvxGPz6TRYpXx96Ed6eZJ5iGYzJ16CfFVqJ
	 ogowxHtZf4lugbv07fVWukEu3qq68g/d2ir73sF7PSvzEFZdf50AOJfPAC12QcFKFoAOv
	 gPbnPG/5TUcYiXZUKbGHt7KFJsjsIjyx6XJWbJVTUqkr5yzYJFUN6T2sF82VmHmRtTwFe
	 r8UnxegvJLQ9K11sSCODGDNERDIbP+BT45leiqq3H/Lr8qbdbBnFxiYklY0VFwlYGLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TEPfKrU3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2CE606A320
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 17:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TEPfKrU3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E1F1F000C2
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 17:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792603138;
	bh=eHS7j7tEkMzKHHd3S/aSdSM+T1e5fkH/o/+WRgKeMBg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TEPfKrU3hWePATfMd7gCWyCVuy1tt+lYkTRB4rJ/AY7VrSNGHjyKsbjk0FpOqRSw5
	 yy1ie1wOqOUPCRLbKCS6fO0e+rDPAOIb6M77fzZfnwbb7UQqqhafWYN9E74/FfXfbK
	 VaK+SM3oir5d03zGU9Q32k+u6Jzq5arpuBmxPInwYkTYdu/jogH+SpoZhkxcPi5Hfs
	 cm7+5cHCDYpKv9cBgvMiuQXce2heg0mfSdJAOjN4FWVMdfl3z4qMGoc2Z+LeslTuBY
	 8G+wXEGVXmurGiX6tCEbvdki2trIDijvQgrDtDXQ8qP2TFOMPIAUo8iVdTWIcJp2ft
	 BBO9r0aPjm1GA==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c445c95d553so128439566b.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:18:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxsbiXQgmc7bLDlA1UN0M1DP8n3o4sXxkUHZoJ6cwiL8fvcZp4TewOkLkY1kgRRo7FWnD/TaIlrvsZZ@vger.kernel.org
X-Gm-Message-State: AFq9FYLxYzYgvt+6pxSlbd5mNqIb0M+j4GZiSPkbW494Ba1DFu1Sij74
	zHUG7kMV69NfP/cO1Dv7C3VN67cC8Kcp+pOf7EOs3wgSgFqw14FCbvznc52+t7w7PTM7LPp98nT
	z51tOlhIXdN5uZ8slRKRClMbKOKyXeQ==
X-Received: by 2002:a17:907:934b:b0:c40:f296:4d43 with SMTP id
 a640c23a62f3a-c46791a9767mr233352666b.3.1792603136742; Wed, 21 Oct 2026
 10:18:56 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com> <20261020020925.3915548-1-linghui.wu@oss.qualcomm.com>
In-Reply-To: <20261020020925.3915548-1-linghui.wu@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 21 Oct 2026 12:18:44 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLyhWzPRq6MmPJedbzVi6xLFS3zDMsnCt088jU1y0aZ6A@mail.gmail.com>
X-Gm-Features: AclHuK_dG54Pev4-B1b3uTdIw19XkA7kcf20B4_quMyapQcVcceloVU4nu1v890
Message-ID: <CAL_JsqLyhWzPRq6MmPJedbzVi6xLFS3zDMsnCt088jU1y0aZ6A@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and
 Bluetooth overlay
To: Linghui Wu <linghui.wu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	kernel@oss.qualcomm.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, 
	Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>, Cheng Jiang <cheng.jiang@oss.qualcomm.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 9:09=E2=80=AFPM Linghui Wu <linghui.wu@oss.qualcomm=
.com> wrote:
>
> Add an overlay for M.2 Key-E Wi-Fi and Bluetooth modules on the Qualcomm
> Shikra IQS EVK.
>
> The M.2 variant uses the external module connected through the Key-E
> connector instead of the onboard WCN3988 devices. Disable the onboard
> Wi-Fi and Bluetooth nodes when the overlay is selected so the device tree
> matches the hardware variant and does not probe the unavailable onboard
> connectivity path.
>
> Describe the PCIe and UART connections through the M.2 connector, the
> 3.3 V supply, the W_DISABLE signals and the PCIe reset signal.
>
> The Wi-Fi PCIe path was tested on a Shikra IQS EVK with a QCC2072
> module. The overlay was applied, the link trained at Gen2 x1 and the
> endpoint enumerated. Bluetooth UART and HCI runtime validation is
> pending.
>
> Co-developed-by: Wei Deng <wei.deng@oss.qualcomm.com>
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
> ---
> Changes in v2:
> - Drop regulator-boot-on and startup-delay-us from the 3.3 V regulator.
>
> Changes in v3:
> - Drop the unused reg override from the disabled TC9563 node.
>
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso   | 105 +++++++++++++++++
>  2 files changed, 106 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dt=
so
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 1c86e7e98f55..799faa32e2d9 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -339,6 +339,7 @@ dtb-$(CONFIG_ARCH_QCOM)     +=3D sdx75-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D shikra-cqm-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D shikra-cqs-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D shikra-iqs-evk.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D shikra-iqs-evk-m2-wifi-bt.dtbo

Overlays must be applied to a base DT to test that they apply. Sashiko
has pointed out that this doesn't apply on every version you've sent
and you've not replied to the report. Please reply on the other
issues.

Rob
