Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182630;
	b=biqm3VVju3C8qCCgqWMnEx1F9TiUSOA87UlZMi3JSDSr62Jcp4EM7PV6u+9WzU/kWNtS
	 Zh8pNgAm8MaMcvjmO6lfsJVWt3THDIxPshHDVfq5uBNopsBN80t+0IxBbDpcwpuKYB0Y+
	 KJto8hLeC+q77RnmBiEbs5mdimOXpWX4PAS8ooU3tsMe6ZVqbs8V3/J2ni6rMjg7QEr1u
	 fKov4lic6Mppn2qstATwGVVXcCK9VsHQ4k/MAOnX0N/zvuF4YXF+Rze75MmXmyRi76j57
	 XCXxNjYmT1inZBKl21vLxxvqKuE0BrtlvAQVydp5JTuONd1LsiAoxHDtpE7PNV3jREQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182630;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=3qRMp8vNhDyi1yKm8uF+4jffdcF8jj7SXyxOJ/lqInc=;
	b=oN6IdB5+iW1drVS51i6hhFjgBB03XTA7R0QSBkAfB50oOcVvN6gT7RfUigOuh78zGaGc
	 48sF0z1XO4T8q+a13u2Vf67+xHnIiUcBdIvSVp1PBxMl50kztvebIIFavjr3k4bbtQQ4a
	 tA7w2AehT6OVKin061HjUCfj8ua78PQJm/jiNlGmw6ICBpRGIvXwoK9Unp7S/5s2g2wVM
	 myMeEpYkNO2VFDoTGvS+8pp/brHzBQvlCszdcJsbsb7gv1EmYxTvqiovltOUyFtqMcnqK
	 5MO10nJvZTfHQY7nxwJCEWZ9KwdN7EHXQVxq+1rWHoUzXc3Jgow4yKMf//QoNO+05wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=en099myg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60486606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 10:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=en099myg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F13A51F031E0
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 10:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793182630;
	bh=3qRMp8vNhDyi1yKm8uF+4jffdcF8jj7SXyxOJ/lqInc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=en099myg5Z7rmETpkfFcW1PdgQI8wvHsCbAIPp0Ru+cPg4hoNKrbWHNj+apx5fGHq
	 VvcP9trwcYvL/7Wtmmf/gvBtxBp01srTPEY72teIqSWwZSRgKC5IUm3DB+r6+Ha7g4
	 PxtrZsMCwxZ7tH+uMLGQLWa2Q+hYTQKUpg02ficXnCjFbeEBog/mCqxTFKjNa6XgVO
	 +EgGH5klFny7xUgqfJ7u7XJP5RPg8Hgvx5ScU22jejE3WFIx7/ZzTF51MgQzeZvkIF
	 +Pgmz4OhD/w3xEoGklsL6+qWP8GZkQMFyEmL0wOrDGCzbEVQQrfQuUdjY/Q77U2K3f
	 er9cOkKFQUjvw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bfc9154ceaso670392e87.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 03:17:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByvzsQszksPIS8hdoTmDP9CWAtt0KkOrk1xNThJD5oLQCUM8LDH8N7CY+Ls+6jEPPnuLDIvkJX5uCP8@vger.kernel.org
X-Gm-Message-State: AFq9FYIwNfMONDgT+na5h20+VFkyhZvfcT4WYWJ3c1kGi2wG1tw33ugu
	Vj2lhE9qSHuxRTQAX2tFsSGCBf9to0aqyBEPXRgEXKJe9+d8Eq7HR6RmRpoCb77uzRf8LpqAeIJ
	QvIl1a59Ljc2yT8lMIREsvYGHVcUb3pjs1EHGeA4Dhg==
X-Received: by 2002:a05:6512:31ca:b0:5bf:a467:32a6 with SMTP id
 2adb3069b0e04-5bfcaddfdb8mr665735e87.39.1793182628721; Wed, 28 Oct 2026
 03:17:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 03:17:07 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 03:17:07 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <auHKt_hdMPaolIR8@QCOM-aGQu4IUr3Y>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
 <20261023-sa8255p-emac-dts-v1-2-a34d778ce9ac@oss.qualcomm.com>
 <at8Q9umfE2AP24lI@QCOM-aGQu4IUr3Y> <CAMRc=McYTWmV6iAbm97C-xs1vh9Atvy-LivQBW10iHQh5+rPzQ@mail.gmail.com>
 <auHKt_hdMPaolIR8@QCOM-aGQu4IUr3Y>
Date: Wed, 28 Oct 2026 03:17:07 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdT4KYz-yVd4ULep-4vnw4_zUN=Q+CY-sN1kzTGAgtCLQ@mail.gmail.com>
X-Gm-Features: AclHuK-WZr3O4JGEIA0zeVydP0kq-elnzPigNZ1OD5X0bmCwX3ayBZNoA3xdKFc
Message-ID: <CAMRc=MdT4KYz-yVd4ULep-4vnw4_zUN=Q+CY-sN1kzTGAgtCLQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: lemans: make the emac compatible
 specific to the embedded variant
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Oct 2026 11:13:11 +0100, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> On Wed, Oct 28, 2026 at 01:25:34AM -0700, Bartosz Golaszewski wrote:
>> On Mon, 26 Oct 2026 09:36:06 +0100, Shawn Guo
>> <shengchao.guo@oss.qualcomm.com> said:
>> > On Fri, Oct 23, 2026 at 11:02:23AM +0200, Bartosz Golaszewski wrote:
>> >> The embedded and gearvm variants of the ethernet MAC use different
>> >> compatibles so move the one for sa8775p into lemans-embedded.dtsi and
>> >> make place for the gearvm variant to be placed in lemans-gearvm.dtsi.
>> >>
>> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> >
>> > Do we run into any problem if lemans-gearvm.dtsi simply overwrites
>> > the compatible without this patch?
>> >
>>
>> Technically no, but then lemans.dtsi is incorrect as the MAC compatible depends
>> on the firmware variant. I'd move it if you're already touching the files
>> anyway.
>
> This will be inconsistent to what we generally do today for both
> Lemans and Nord, i.e. we are defaulting compatible to Embedded variant
> in <soc>.dtsi and overwriting it as needed in <soc>-gearvm.dtsi.
>

Hmm. I don't think I have the authority to make this decision so feel free to
leave it out for now.

Bart
