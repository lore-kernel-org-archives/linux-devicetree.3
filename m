Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1866D3D7A0F
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 13:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786369680; cv=none; b=p8JkK/ZRFoQx4RGZb7xLdD2f+FadjZvB8KJTlyUXiKgJPEBvkCICJ1Pu4IzBZidFyf+JRbqRC9SI67msNecpoJyM9tXHOlQXfKEJqRx1czpsMCACc7Q3ggEdz48g7N2qmO5Nb+h9rhrC+l74eHGvMKs8fiaTcCpwYtONBrs8+Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786369680; c=relaxed/simple;
	bh=3T05IBmOeKaCJnNraYH/j1ima368bvxG+vKBBAnikBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOyZOKX9hesbBT7b1A5xsixUvxsP7m7uqbggzrt+JEQvMAWu947V2Ucyyb7dpRFhwdVo0R9LpVkozIwPjfZt/5jObgSRkKp2e3zWIofsFheGzxZO2t6O7qwVb/E4J/sqMljzYNGwpWIGN12jNmPQ1vQkQxw9aiFKxa7ulgrgirU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuapF4EK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuapF4EK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60F51F00ADE
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 13:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786369678;
	bh=Hzi2DppdJujLLI2cEYOf0nPmIJfadXAirGJPaExHRXg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kuapF4EKqNPMWctlI7jOwAuG5NRR5stwYEqX5Y5l4ZACkxIBsyXFuGRYTfqdAO154
	 PhGmGTRQQaXnxyFYocGWYJjcX3g57O56va93t0v7xZ2TVNb+x5g5zhdEgt2WhN/q1a
	 ZABwnQJu+TTlt97gHZp2Fei+VznVs+GAaxQ17TkS/aptelM3z39+wF5jFenDOHcUXj
	 Lc8DruUkyR8VPzcZtR//tiDg8HKoezt2NoKx9MkjkmrGfqX8rOVwkiRmRV7FrM6/yW
	 0EwInXvzPQk0WR/VqJ7UuHt3ZIFdeaGeUL+fg4tLHg7B9/jHXuXLZC7/eo2rejBmjB
	 oRXsW7npnVAdQ==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15ba3a2b4bso211646666b.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:47:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrWKliXvuR1CjF2wzx1kzvu7s330PCsFID9fMuB0Xl+DS+Hsw/2b/xpAtvrIMNWtB+h+D9xZMP0FDGL@vger.kernel.org
X-Gm-Message-State: AOJu0YyOxUePJwAXyxafEt05Zn2yx8FVbN61vDWT8Yan17+zhPtjJ0DQ
	HH9QmcFymq4KD9Nefhu1O/iFF5S4NaMxRHxpdG/oXFBy0a7WJb9KErOxcpwJikjSEbMgpBB63JK
	5oWIt0H5F1ArZYG4Lwz5v40c1Ckg8tA==
X-Received: by 2002:a17:906:fe4b:b0:c16:6c84:4b8e with SMTP id
 a640c23a62f3a-c2039cc42bamr2080432866b.14.1786369677159; Mon, 10 Aug 2026
 06:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-4-3996f67e33f9@oss.qualcomm.com>
 <ruow4uus64krlpy2gvm3g2d6rq5kgmgxnlhstmecil3gw7lhkd@2golvucd473l>
 <20260807162405.GA896590-robh@kernel.org> <c3hVumMy_QnRbUmbFTSWGjkfG7lPjGFEcZfPsZeGQ57nWKkhlBL3wgmcDcAgT9cNb8Ju3qZ_sSKgHk8vmow0xQ==@protonmail.internalid>
 <6ee7f32e-eb6c-e264-6f0d-541555f8fd62@oss.qualcomm.com> <56b3dfcf-b1ad-4192-8199-06c80cc5d124@kernel.org>
In-Reply-To: <56b3dfcf-b1ad-4192-8199-06c80cc5d124@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 10 Aug 2026 08:47:45 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLGOz7Fh=AsM+g84=Uko10YXU4QN1buApD3CJMkOmsebA@mail.gmail.com>
X-Gm-Features: AUfX_mwrEFk7k3OtcIlR-TAKRB83Tjc8XP94YyTpBVZLF41OPIzQfo4IdSVjMnw
Message-ID: <CAL_JsqLGOz7Fh=AsM+g84=Uko10YXU4QN1buApD3CJMkOmsebA@mail.gmail.com>
Subject: Re: [PATCH 04/22] arm64: dts: qcom: hamoa: Reserve low IOVA range for Iris
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Stanimir Varbanov <stanimir.varbanov@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Johan Hovold <johan+linaro@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
	Mansur Alisha Shaik <mansur@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Stephen Boyd <sboyd@codeaurora.org>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
	Marc Gonzalez <mgonzalez@freebox.fr>, cros-qcom-dts-watchers@chromium.org, 
	Matthias Kaehlcke <mka@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Aniket Masule <amasule@codeaurora.org>, Malathi Gottam <quic_mgottam@quicinc.com>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	Dikshita Agarwal <dikshita@qti.qualcomm.com>, Renjiang Han <quic_renjiang@quicinc.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Daniel J Blueman <daniel@quora.org>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 4:55=E2=80=AFAM Bryan O'Donoghue <bod@kernel.org> wr=
ote:
>
> On 08/08/2026 05:37, Vishnu Reddy wrote:
> >
> > On 8/7/2026 9:54 PM, Rob Herring wrote:
> >> On Fri, Aug 07, 2026 at 12:03:50PM +0300, Dmitry Baryshkov wrote:
> >>> On Fri, Aug 07, 2026 at 01:54:48PM +0530, Vikash Garodia wrote:
> >>>> From: Daniel J Blueman <daniel@quora.org>
> >>>>
> >>>> On X1-family hamoa platforms, the Iris VPU reserves IOVA addresses
> >>>> below 0x25800000 (600MB), primarily for secure non-pixel buffers. DM=
A
> >>>> into that range, from any other stream id would triggers unhandled S=
MMU
> >>>> page faults that cause spontaneous device reboots. This is readily
> >>>> reproduced with one or more browser tabs driving multiple concurrent
> >>>> video decode streams.
> >>>>
> >>>> Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
> >>>> and reference it from the Iris node so the IOMMU layer keeps DMA
> >>>> allocations above that boundary.
> >>>>
> >>>> Link: https://github.com/qualcomm-linux/kernel-topics/issues/1157#is=
suecomment-4458933574
> >>>> Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video cod=
ec")
> >>>> Cc: stable@vger.kernel.org
> >>>> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> >>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >>>> ---
> >>>>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 ++++++++++++-
> >>>>   1 file changed, 12 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/d=
ts/qcom/hamoa.dtsi
> >>>> index 8a96ea1bdb9c4c409b2af997680d8c13fed0643e..87f424765d513c97b063=
03bceb75ca9f176d2ace 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> >>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> >>>> @@ -666,6 +666,17 @@ smem_mem: smem@ffe00000 {
> >>>>                    hwlocks =3D <&tcsr_mutex 3>;
> >>>>                    no-map;
> >>>>            };
> >>>> +
> >>>> +          /*
> >>>> +           * The Iris VPU reserves IOVA below 0x25800000 (600MB),
> >>>> +           * primarily for non-pixel buffers using different Stream=
 IDs.
> >>>> +           * DMA into that range triggers unhandled SMMU faults and
> >>>> +           * spontaneous reboots, so reserve it to keep IOMMU
> >>>> +           * allocations above this boundary.
> >>>> +           */
> >>>> +          iris_iova: iris-iova {
> >>>> +                  iommu-addresses =3D <&iris 0x0 0x0 0x0 0x25800000=
>;
> >>>> +          };
> >>>>    };
> >>>>
> >>>>    qup_opp_table_100mhz: opp-table-qup100mhz {
> >>>> @@ -5439,7 +5450,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIV=
E_ONLY>,
> >>>>                    interconnect-names =3D "cpu-cfg",
> >>>>                                         "video-mem";
> >>>>
> >>>> -                  memory-region =3D <&video_mem>;
> >>>> +                  memory-region =3D <&video_mem>, <&iris_iova>;
> >>> I don't like the idea of this series, because it _again_ doesn't tell=
 us
> >>> the truth about the hardware. This typicall ends up with bigger probl=
ems
> >>> later on, when it starts to affect other bits and pieces.
> >>>
> >>> I don't want to NAK it, but I'd strongly ask to reconsider it.
> >> I think this is an abuse of /reserved-memory. reserved-memory is
> >> reserved *physical* memory. Reserved IOVA is a property on top of that=
.
> >> I'm surprised this passes validation. If it does, I may go fix that.
> >
> > As per the reserved-memory.yaml schema document, the iommu-addresses
> > property for IOVA reservation into /reserved-memory is allowed =E2=80=
=94 it's
> > documented for IOVA carveout reservations:
> > https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/=
reserved-memory/reserved-memory.yaml#L56
> I think that is an entirely reasonable reading of the text
>
> Quote:
>
> "If no "reg" property is specified, the "iommu-addresses" property
>   defines carveout regions in the IOVA space for the given device. This
>   can be useful if a certain memory region should not be mapped through
>   the IOMMU."
>
> Which is exactly what this series does. Excludes a specific IOVA range
> from being allocated for this device.

But if "iommu-addresses" is the only property of the reserved memory,
why put this property in reserved-memory rather than directly in the
device's node? I'm only questioning where is the right place to
describe a reserved IOVA.

Rob
