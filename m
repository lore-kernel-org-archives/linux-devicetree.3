Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493CB38228F
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256528; cv=none; b=GaUxdfKFERR66fFk54nirRYz5v33cxk5U7pKWPiSDRc3avggaseK8l+tMWIt3UqdfrcRbuPKT7vTAiyn4wPGRVbm/zlj9JcfkPpCto1fJZ8vj+SspDcox4PlV6cGezKDeXCkHWObwUj6POcQN05q7puo50fxw8WDcDKM0BSWLlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256528; c=relaxed/simple;
	bh=eE5g+1WMrIl/FHufSMBITJlni5GhlGpGfBqj9cDGjlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzB8MMKZfCr+EhShqBnDT5Lyw2srCioVOhZdqsZQ3LKCuoaX/acvhL5j46mQ+m0MMqbKIbXbN/SiQWbdMXGig8ULGHI4d89bkQ8GlFqHX+hGuk4N4hzYa+GjyH0FZK9WwtQL8flh/hB2GAQa+gT2FmW/EBs8zEmRzm/JjEF7K6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rrxkAWOi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rrxkAWOi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00FEC2BCB5
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774256527;
	bh=eE5g+1WMrIl/FHufSMBITJlni5GhlGpGfBqj9cDGjlU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rrxkAWOiFX6rlPpBcMNRA6Uj/FJt1LZOollBzR8+0huKej3lPXGPgvx05l5zUmVnW
	 doanNCWV30yFv5N0KQ2FuJ12DSvB3GIezZYhnbEFzCXoxpP6papDjj/TsuPMXgTU3P
	 hpSuk4fXZw7cPw3lCgQ0VBEfk1Mwhu3TS8OqgLdTIWl2n45lepkGUvQqb4D5HB1KKA
	 WC1CjYt7UXY3GFGmZRrPUtMIYKQ5ruUNYsJw5nXenz+O0EwCU/ZplD6ytUjjrBTmQ8
	 TQkuIMT7zjF38kpVDuU59SAG4KfW0aeH9F6vtet5Lkfrx5rUPi5MDaoG28VndT29+w
	 q4+OD497eq+7A==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64e8c7f5082so3456947d50.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:02:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFSNIhWsINPve51hF3beFIEs3/Dcj6CUCD14WyHlww9zwG6r0v6W4PX4Z3ZeHN4sLkajC4v/dtRY0c@vger.kernel.org
X-Gm-Message-State: AOJu0YzcSJQY50dX5bhI/Z+DyRUIPl3Xj5CrKKwZnGheEE9ssqnzgk86
	xOJk8/GMkvwuDk1XdRXNLmSpF4RFCvKWeWkfk95DUjIT48ddIC5VuljHOCcdCiXpxTMTzYck2OM
	64DECnD9xbeb+9iv0ZQo5dFKZRHbhWU4=
X-Received: by 2002:a53:b605:0:b0:64e:9e77:f950 with SMTP id
 956f58d0204a3-64eaa6df84fmr9321180d50.29.1774256527153; Mon, 23 Mar 2026
 02:02:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317115411.2154365-1-eleanor.lin@realtek.com>
In-Reply-To: <20260317115411.2154365-1-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Mar 2026 10:01:56 +0100
X-Gmail-Original-Message-ID: <CAD++jLnRDsDaO4vrySO9dRrspDrGiKUZkT8uU9J7mev6XHcu-g@mail.gmail.com>
X-Gm-Features: AQROBzCzwKV1FvnXp_2c75F-p7Yqf5gvJiSeAyIUKrt-md2cTLWACh1gS9JGfIQ
Message-ID: <CAD++jLnRDsDaO4vrySO9dRrspDrGiKUZkT8uU9J7mev6XHcu-g@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] pinctrl: realtek: Core improvements and RTD1625 support
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, bartosz.golaszewski@oss.qualcomm.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yu-Chun,

On Tue, Mar 17, 2026 at 12:54=E2=80=AFPM Yu-Chun Lin <eleanor.lin@realtek.c=
om> wrote:


> Tzuyi Chang (5):
>   dt-bindings: pincfg-node: Add input-threshold-voltage-microvolt
>     property
>   pinctrl: pinconf-generic: Add properties
>     'input-threshold-voltage-microvolt'
>   dt-bindings: pinctrl: realtek: Add RTD1625 pinctrl binding
>   pinctrl: realtek: add support for slew rate, input voltage and high
>     VIL
>   pinctrl: realtek: add rtd1625 pinctrl driver
>
> Yu-Chun Lin (3):
>   pinctrl: realtek: Fix function signature for config argument
>   dt-bindings: pinctrl: realtek: Improve 'realtek,duty-cycle'
>     description

Patches 1 thru 7 applied to the pinctrl tree!

>   arm64: dts: realtek: Add pinctrl support for RTD1625

Please funnel this DTS patch through the ARM SoC tree!

Yours,
Linus Walleij
