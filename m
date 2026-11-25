Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630437;
	b=WNzKftMuG/UB4NF81SrXNiDreCvrKzdA/pRHX7kjH086ztjeZtDxXEofWe7OaEcuG0YR
	 xJZjZl+8hzEWiy5mXLTEpWnB4BPQe2wTdkJl3C+6pBgoBl8A4nV41gjcLuEycOPLzVFss
	 q0q6He0SjRm4Ae4t8DxIWkHu9SVf2Fa562iqk5cg425VV71Osxmj5SxmZz12lLEkIRuWG
	 9HUi/SwSNjtQOoZS65O5oYVlmZXLzhttZL3d5MQgmSyZquZfgsIISYKH07NtNLZhoj4WT
	 dZ3WV8F6cjYWueAJs6VMrGNUOFvpShpn04eXswF6wKhRh/M5jUPNrkT7xYIgEG9YHSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630437;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UQyjdIZXnyN7pbRcpgqMvYP2FTIzZjKLrH9OPluFP54=;
	b=RKTKPGgng/TLMkwVJ9MXXTULsmcdfAeXDueZbM6CWT9W4zFHm8ZmjN6eZ4/EHV+5teos
	 bh2zQZA5JoKcuRIID8MiLIB6vjoTpdVQv1e7e8eD2T1zQNZ20heK5zb1BG/EvsskDcQ0r
	 CZ3O/nL8cM19uI7QPYtQCyKyM6jq/kMGlx430YSfeWUBx37sIfhcJElgwIbdN8rYasMz8
	 9aoWmq0kEfLaSZKTzwLYGmaErEhxjqPDDtmYSU3V8pWxgVyZeUyPUAUyoo4m4cbPQjFnL
	 htqMtLZlJmXgyvv+tAB7Zjytcl6ArGm+TJ9tLO8sV9SmRwSWraVGXTN0T9hhZkrCesQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iz93ajdg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA099606A332
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iz93ajdg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FD91F000F4
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630436;
	bh=UQyjdIZXnyN7pbRcpgqMvYP2FTIzZjKLrH9OPluFP54=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Iz93ajdg1Nd8CJzVL1szboFhLn8kqrwe/ZCcJh0uQLv97qGaDfCqudOjhaTObJBfO
	 BXliTF/2V/TQYgVUCimigeZEPsiVStwzRW9nTEorwDTwgV+1TdSU3Sj3OJotAvi4f3
	 pboPW9r1qTUv2Kmgl/FZmcBd+gHS2PVVDPbSGlTWWJHmygCPpZDJlJj7NFMQnsgMJF
	 uTzw/hoQUm28x9z/+JEJKdADDjK/nyr/I20r5dNvMXoagOwwilIjGY207fwZ1PpqQN
	 43F5dyWPzJx37IRk/janFiAMuKhnZYrpEgdmaGC5zeyma92Y8ooRZcnw47XBw3qZGa
	 4/qGZJmZB82tA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so5832418e87.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:13:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH+RIHBODwfuTgE/lSOrl45miIXjrF+FYgsgThqduPaYwAAO+IW8ENtfzEreVl5kGhapzwfO5uzALo9@vger.kernel.org
X-Gm-Message-State: APuU4Z/+sR63/9u2zTGUlLbOmL1/GyfvjBuZZy1Q9+UP8D9bmnB30jRQ
	f/mcrD6mGddyu4fI75psmpJWTI/swQF3YfJPXEcGbgCmncVlEkxg6nOgpKlB88C+UHitMW7ItKs
	xNlQ1/++MyyVZFD/DmOOkKqAt+mo6e/Y=
X-Received: by 2002:a05:6512:2313:b0:5c1:5457:a147 with SMTP id
 2adb3069b0e04-5c1b7c5f28fmr4759565e87.32.1795630435118; Wed, 25 Nov 2026
 10:13:55 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-kuno-dts-memory-unit-addr-v1-1-89e965f2c3ac@oss.qualcomm.com>
In-Reply-To: <20261111-kuno-dts-memory-unit-addr-v1-1-89e965f2c3ac@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:13:40 +0100
X-Gmail-Original-Message-ID: <CAD++jLmnHp-TVDj4-CKqH-020GkmRZmgVx5-u=Uem8c0_NhTBQ@mail.gmail.com>
X-Gm-Features: Aa3M54qKCffdcCQPk9s4DaSpiTPHhKFZVElFuVJfZUz3prnPo1qEkIVkhJwQfoU
Message-ID: <CAD++jLmnHp-TVDj4-CKqH-020GkmRZmgVx5-u=Uem8c0_NhTBQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: qcom: kuno: Add unit address to memory node
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 5:16=E2=80=AFPM Hardeep Sharma
<hardeep.sharma@oss.qualcomm.com> wrote:

> The /memory node has no unit address. The dtschema root node schema
> does not allow a bare "memory" node, and dtc warns about the missing
> unit name with W=3D1:
>
>   qcom-kuno.dtsi:89.9-93.4: Warning (unit_address_vs_reg): /memory:
>     node has a reg or ranges property, but no unit name
>   qcom-kuno-idp.dtb: / (qcom,kuno-idp): False schema does not allow
>     {'device_type': ['memory'], 'reg': [[0, 0]]}
>
> The bootloader fills in both the base and the size of the memory node,
> so keep the reg =3D <0x0 0x0> placeholder and name the node memory@0 to
> match it, as done on other 32-bit Qualcomm SoCs such as apq8064,
> msm8226 and msm8974.
>
> Fixes: 7f6a63bc5fc9 ("ARM: dts: qcom: Add initial device tree for Kuno So=
C")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202611101833.G7LTXoJv-lkp@intel.com/
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
