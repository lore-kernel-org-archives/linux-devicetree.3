Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F9045D93B
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981858; cv=none; b=lJKOalMcgBJ1j13z9CYLDtIFT1SPvT2whmAHX8822iPHYW5ZSYD35aiPaNHl8sfc39Wc+7ZhQEw+DgGwAls77UHWAiBvIuqVPsQ6+7+pltUTp/9NaHjQ1Svw/8s36VpmXvf5ZqPvq9DSxoMBUf0k1e5kp2JGSW7meHbkY10xfx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981858; c=relaxed/simple;
	bh=axneq8gkxD7EAbiVtosyo7BUtFRdAppJJ46JJn30WTo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F7UWQDk8f+3saOdPxXp0Nr6Ophec59r3quxJfWTnMT118fFbBMzKkvsbXSSBKjC9d4u64Y/Hf2CLZv7swtL5n2XODQladKzOfKmFlsHOHb5wKAapNiqWIz8CjgtXAtjmpz0oXEIBVBQ/bzh3K4CQuKYwW6S37t7Y0sCCm58D4G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gajQNoGs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gajQNoGs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C793C1F008A0
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789981855;
	bh=axneq8gkxD7EAbiVtosyo7BUtFRdAppJJ46JJn30WTo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=gajQNoGs/M/AUCfolP6RW5/d2qOyyhpBzdkoYoMkgOv9CxGw5XiLwT8vhvJjVApJb
	 6rk/L0PT3lt7wqau8D4ytlQkH8LbiLKEPrv/vTL1bi8bd7gtvS7n43Hq2rxKUjX5KS
	 cPDS6V16Fv1hTUf7NGXhmODw95w8mws7u4wh1rp5xx2kJ/YLGxrcVAoKtOHeuaOeUc
	 kAHa++r1JYhgW2ET8kG47wgxeRvtnLsx8oS+8AuuTa4t/HhRJLh/dNVmrhol6IYbYA
	 Jw8YT8AovXHA3gpQPeC8R7OIU5Hfic78OGIQIGGIEr3bOy1PWmMoVpCpyAOhGn2zO5
	 cT5hietoIpqVA==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5e21a5408so19528851fa.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 02:10:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw1Nkw26E0AfMSXQmAUXnoganNWzfEQ+Xz/U5qo0YmcvgLKHH1up3METwNY4dyvu7cEaQ/WSap6ntQ9@vger.kernel.org
X-Gm-Message-State: AFuF++n48IEuGNmexmGOZMoDA/0/9xyKjiNBEk9NO1ZSW6MfXXci0S02
	WImaMb2vLJgGQNeFx/EPFHYLG57/6vNU9geRCsgR6YnkCaZeKphoMQ2P61u0JS+342BNqbO7jE7
	AN2yw/bjUJYqccnyGz+6t9HQM+cFajwD3AMNsUhM7Qw==
X-Received: by 2002:a2e:a9a5:0:b0:3a3:476:2e37 with SMTP id
 38308e7fff4ca-3a5fbe36d88mr21985301fa.6.1789981854399; Mon, 21 Sep 2026
 02:10:54 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 05:10:52 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 05:10:52 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <arDwfm8kRLUoyxwO@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920081049.2183845-1-shengchao.guo@oss.qualcomm.com>
 <CAMRc=MfYX9HNThU-iKz96E=SuxYrbzvnBvydgFg5Zzm4W6DYAQ@mail.gmail.com> <arDwfm8kRLUoyxwO@QCOM-aGQu4IUr3Y>
Date: Mon, 21 Sep 2026 05:10:52 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mec3MgPMpoosEw+JtAMpX+27WbgTuyBD55wUuFZfe5yhA@mail.gmail.com>
X-Gm-Features: AcwNN1WB8UeDbJbMKR0HHrJTm1Lf3yIvgfMAVU4j7gNXiA9xoJmwU3ZNDtRuRaw
Message-ID: <CAMRc=Mec3MgPMpoosEw+JtAMpX+27WbgTuyBD55wUuFZfe5yhA@mail.gmail.com>
Subject: Re: [PATCH RESEND] arm64: dts: qcom: nord: Add more clock controller nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sep 2026 10:53:18 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> On Mon, Sep 21, 2026 at 04:49:20AM -0400, Bartosz Golaszewski wrote:
>> On Sun, 20 Sep 2026 10:10:49 +0200, Shawn Guo
>> <shengchao.guo@oss.qualcomm.com> said:
>> > From: Taniya Das <taniya.das@oss.qualcomm.com>
>> >
>> > Add the GPU, camera, video, and display clock controller nodes for
>> > the Qualcomm Nord SoC, along with their required dt-bindings includes.
>>
>> The last bit should be dropped?
>
> I think it means these lines in the patch.
>
> +#include <dt-bindings/clock/qcom,glymur-videocc.h>
> +#include <dt-bindings/clock/qcom,nord-camcc.h>
> +#include <dt-bindings/clock/qcom,nord-dispcc.h>
>

Ah, I thought it's a leftover comment about *adding* these includes.

Nevermind my comment then.

Bart
