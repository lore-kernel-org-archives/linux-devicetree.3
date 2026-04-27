Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488FF246768
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311179; cv=pass; b=qM2zzrqlSCskvNI5c3Wlm/Og6qrn75npTyF/QH5iYIm8m4BlYTQmBLV2QS1wo7YzgdIA8M6Hlo07GSSMImuosO5M2VMwLjnFie0rOxAf6JQPDBjYtCLE+BLKrMvvL4xkUBmQQBCe/PtYOtqICpVL0NebEDb/Cp6lzKbFVvHcrdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311179; c=relaxed/simple;
	bh=DEaHIjde2rWQVcukmPbcCg6DBKxDOko3C8ZJqFbHS7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrgMNhmbfH8xsQMKQBh1gIlp0WTaUoNzR+/z84cDr7GYVdmqiO2jgRiEh33sJ12OZ0syEM9B3ivMZlL7L6eeKz+UT1cs+n6ZJyVpyA28uFzKNo+AODdhh7sLHDFXklgBEnCB+X9NWqG3WqaQ9vRP0ywOE+vg7zvo4JSkktluVNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+fUzGe4; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+fUzGe4"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a3fcb2c718so9048628e87.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:32:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777311176; cv=none;
        d=google.com; s=arc-20240605;
        b=FWZUwTjRQkxXQmnYwc7N/AOu+yfB2gkNyhNQjMoUNbDh082tssVenI4vTcuOuLYPXF
         qoU386+2ry9y9ZA+H1ftON+XSdmP6uc7q1u3BADVWongEWmQw/x0LqO+tghoCKdMYzvS
         b/jS1Qo0X/q2P8e20kzPdqJu0VnsACx8Ce13uW5oWbeDePJfht6QBjDDrpiiPjalmhap
         rhI8p4LUP6KiYO6Am1xTkaeQ9CO0WT1iEs01PtysUtM1s7SQbER79TrlTgxicvOWEzmR
         se6K/E0mykMwnYWjO3Bvy0Fq4qs5kmbEyt6jRyOkw/j+BccY7tyImNVrqcgTf45o+uz2
         PGkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tr7/1KiVLnLIdVAaap8zvEgM4/GvQO6ELzEn1RpMrRk=;
        fh=u5REX5Zps47NGwKxWlM4CgYimJxw9dk5y+MzUTN1UfY=;
        b=DR0xEgBROzMLovTzwHRTf+CHbAF49itKVX/9x4YHpB1cRYJHal1r+ZUxSNsWyr94a/
         7uVjuFL7eT7EHmlq6jaSc1524DNYyi4eGiMrjE1Z8z6rHclZlSjKUhC9Ab/0P1E7kPIc
         ipPQ+uXVFoF4xT/QeU6pG635jXHLh6FbTPWxk6dd7MXNf/8HkJq0nmS9zPFsnBexah3K
         UnBpnr5YaWh0PiY02lFmic0CIA+ZDuxW/NpN5OcBDkioVcQXbkI7bsBgXkkOwNCw2Gcu
         kt8KI7HPNA4rPJaom17MfyudV7PYhXh/Wt8da9F8KYXRgVQL4ITgv0bQ1CKYm0dVU5X3
         3zKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777311176; x=1777915976; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tr7/1KiVLnLIdVAaap8zvEgM4/GvQO6ELzEn1RpMrRk=;
        b=b+fUzGe4AzIL0vqtIBfA4A9eylZVt7O3OODNSg52hJrFRfI1KrZbyVefAxdT1JMEqE
         Pd4ZZl7gLhqOlNzn6mzw3vUo8B/5LW3Wk/nQsvAKzTP/Pfj6lBor7nrmbmC5UmxAx4GU
         IJiOtytHfQpR0aeHbZn3qJcWN4WbKKd98ZBCV5F6K6Rs+B28i5vU6J7bSm/8KEn8kvBp
         sluRi4TwsrwIeM2zXcdIi7xGIphDKkGfxPE/2m/1JjuIk8Y2g2+KVnxHxVBu883Y0N8w
         TWGHqy9eD6eMammMwC0nk34l7XIh6a+7V6P6O7sTJ/WH7hlHxEMSPXjjSxcCodEiR88w
         hang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311176; x=1777915976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tr7/1KiVLnLIdVAaap8zvEgM4/GvQO6ELzEn1RpMrRk=;
        b=SJwCVkszP+3kLjVEhoU97GD61RHngQh2HkVLQu3iAndCywQ475jlW1p2M4k5SjXY3m
         x4OGJmxDaVz5j6O+kOC+6dQe0WmUiwm2MG6S/d8Q3c0lO37CAn5HKFjf9lQvHn5Ir0iB
         GM/QpiFPQGFTG3v4jx5pYREmtofA5qY8aIhGYeIe/hfkkv05EZtx3voOZMgtXmuW9Vec
         xKWIgg/olxAX2w3owfD6377lQV9ti9pA/2gCBO5OwA5Cz2N9nTyOAbNVturOP3yNkdhV
         +erTIyvGZF66Nje/dQebR1G9Vz9blPT1/bv5/ZRcs0pMllj/tp0z/dbvYYCzFWLOFxhf
         saDA==
X-Forwarded-Encrypted: i=1; AFNElJ8PRYkH5efuwpERzTUMrB7Kgeef26NuKkGoSWO03Knfn0JSzuPTYR7M49Z7TX+WEsQCzBHxxQpMNVi/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy154J2GjxovvpAHyrBb60wPMGaPiIHCDTVWk1td0rSwFHnTcI3
	sELwOLSBkQlkqH7UoupmStb+BPkxye1f2CdIntu8leBxAagaB18RnIRUMsQSNibrCpq+RhJO8Zv
	jvNlfp7qhmtsLTrUKtNQLYvYZelIjneY=
X-Gm-Gg: AeBDievpvbOXL+L1/adbj+rIv8cFpLhb5AmNlsPf2jP1sfAVOHVyYmJ0KnnNYtmqpY4
	xpRNLbgluW+3lr0USqnnY+YFLu0cb3al0c3BQMrti7WNYVsgvpwRG265SmVN8y8gWtxgwGmAvAn
	o9CT5jB0ena1aFBmzQnJcO8C96BrAG79EWXE4UrBIQVMX5/vfZRjApbvFMfF7F9jf3aflD+9G2i
	FXjbg+SlUZYsi8mHPzQ6PS9hgqm0EWsa/nZOYS88CJV4f0w/NIE1cS2xWna8AwWfWXAonjt8f2w
	RoTVb//SN3T3bZR8sCTodxivyZcMbfUIkkycovhgfZgqcaMxVLQohjhPp8y0FUtadAiqJzEjCsl
	p9PA=
X-Received: by 2002:a05:6512:1248:b0:5a1:1074:e1ed with SMTP id
 2adb3069b0e04-5a745e3b8b8mr69372e87.11.1777311176097; Mon, 27 Apr 2026
 10:32:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408-ayn-qcs8550-v5-0-c90abeb7a152@gmail.com>
 <20260408-ayn-qcs8550-v5-3-c90abeb7a152@gmail.com> <de40fcbb-f5a9-460a-b9f5-482b0c245c4d@oss.qualcomm.com>
 <CALHNRZ-8r9KSpAEsv6F1YfSjWUfJihwKfzdeDTkRsPJfwr_s5Q@mail.gmail.com> <06cef5c0-3473-4e3a-81f2-37a41216f67a@oss.qualcomm.com>
In-Reply-To: <06cef5c0-3473-4e3a-81f2-37a41216f67a@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 27 Apr 2026 12:32:44 -0500
X-Gm-Features: AVHnY4JuIhO-peAFLy29ECv7gAaIDDSgLIGnGy-SoVGVhJK9GRSX-0GN50ZzCiY
Message-ID: <CALHNRZ_+wgtKdZ+m4LC36BFPZCXVTo6nb8Qwa-TpchzQ5mquEQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 9:45=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/27/26 12:01 AM, Aaron Kling wrote:
> > On Fri, Apr 24, 2026 at 7:11=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 4/8/26 9:41 PM, Aaron Kling via B4 Relay wrote:
> >>> From: Teguh Sobirin <teguh@sobir.in>
> >>>
> >>> This contains everything common between the AYN QCS8550 devices. It w=
ill
> >>> be included by device specific dts'.
> >>>
> >>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> >>> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> >>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >>> ---
>
> [...]
> >>> +&pm8550_gpios {
> >>> +     fan_pwm_active: fan-pwm-active-state {
> >>> +             pins =3D "gpio8";
> >>> +             function =3D "func1";
> >>> +             input-disable;
> >>> +             output-enable;
> >>> +             output-low;
> >>
> >> Looks like this should be a regulator then, probably?
> >
> > Mmm, what would it be tied to, then? The fan already has a reg. I
> > presume just modeling it as an always on reg tied to nothing is
> > undesirable. I also have no idea what the voltage would be.
>
> Or maybe it's some sort of reset/enable GPIO. Or an enable pin to
> whatever feeds into VDD_FAN_5V0. It's hard to tell indeed.

Talking to someone working on the downstream kernel for these devices,
the purpose of this is to set the pin to 'func1' or pwm4 output. It's
not a regulator or reset or something that needs otherwise modeled.

> >
> >> [...]
> >>
> >>> +     wcd_default: wcd-reset-n-active-state {
> >>> +             pins =3D "gpio108";
> >>> +             function =3D "gpio";
> >>> +             drive-strength =3D <16>;
> >>> +             bias-disable;
> >>> +             output-low;
> >>
> >> no need for this property
> >
> > I'll start with saying that I know basically nothing about qcom
> > hardware design and what the average pinmuxing layout looks like. But
> > I do note that a lot of existing devices have this exact same node,
> > for example the sm8550 hdk [0]. Is there something that makes these
> > devices different? Or is this unnecessary everywhere?
>
> That's my understanding.
>
> [...]
>
> >>> +     usb0_sbu_default: usb0-sbu-state {
> >>> +             oe-n-pins {
> >>> +                     pins =3D "gpio140";
> >>> +                     function =3D "gpio";
> >>> +                     bias-disable;
> >>> +                     drive-strength =3D <16>;
> >>> +                     output-high;
> >>
> >> This is probably not required too.. unless there's a hw bug?
> >>
> >> fwiw 16 mA is a very high drive-strength - does this come from vendor
> >> sources?
> >
> > I do not see any pinmux for gpio140 in the downstream dt or anything
> > matching pi3usb102 at all, I'm not sure how it's handled there. The
> > original source of this dt was written before there was a public gpl
> > code release from AYN. I do see other qcom users of the pi3usb102
> > doing similar however, for example the sc8280xp crd [1]. So I've got
> > the same question as above: is there something different here, or is
> > it possible other existing copies of this are also wrong?
>
> You can retrieve the settings from your device at runtime,
> /sys/kernel/debug/gpio will read back the hw settings
>
> As for the CRD, I don't know. It may as well be board-specific.

I got pointed in the right direction to see this on downstream. The
active drive strength on gpio140/141 is 8. Does this seem more
reasonable?

Aaron
