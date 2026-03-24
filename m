Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F453D667D
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774371945; cv=pass; b=bvTsQ6O5v42JvsHlJyJtZ0DJdjFVo2v/wGoH6E+55W6XCJuyWeq6be7lvs6ZvNQzrAKhDsJIGilX2Q1SdUmYi+izIbxUl0+bzRALNvRHzltNLdkb2LriXIGEKpeXxEE7Q1VCWw8LkTuB2xRT7etW5c86lEFl/x6cZne/4aFBUSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774371945; c=relaxed/simple;
	bh=7U+uS9u3k8MKiXu31MQXeVeNe3hExuIgcOumm3duMAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vi8Jv6la9lUdET60ZiUKwPi4JY9g/qwV9Y5aQjvRS5KEZ9/RmLA6XY24nJcHPIyhXAMUkPf+dySa1Z1ypXXIIUTVv2EvE63Cy6VRfjMg78RXVWNjjraSy5P6YU+vHx5ZKzjdOX8WGCS0SexJB2Yf1BOV58ha0ihaf0DigfdD/1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzopNHcq; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzopNHcq"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a12c19affeso158579e87.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774371942; cv=none;
        d=google.com; s=arc-20240605;
        b=CrFf/FeF+yTnCtVLzkF/VfUTzXLh0XTVq4jxzMy9myWmImwQqyeYfDrN/XQ7QwaGZA
         MpqYM1BVdwJqheGmKGnOQhTGX7Pu8gfy2FivimoOVJYQogCSt9JmrVk1rnNExoNWMvXo
         ky3RB6/qLBwXpJeFKL8oKepCBSQDsKvSdpszxxXZyK88SiRi3WaW5fTzUw3QB3QybdEd
         y2x1Jp5kk4yVe1BoqSRmK8y2S+PgyYip/AzOme3lejj0Pp9+gY7iLJq6Z/rd0aGixrOf
         T/c/bmR1x3BOiP5Jhw6YSXwBk92vUOe/gnfXb2aGC/UjNun/Q6QcqQyX0woj59qMnrkM
         /eiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7U+uS9u3k8MKiXu31MQXeVeNe3hExuIgcOumm3duMAE=;
        fh=+P/mExnOT6YHnO4DHXKd6K9A60/5PJQOAakP0FvZg7s=;
        b=GBavAqgv/1QYZ8/uIwvA/8zk/q2KHgrgUxXvvxhrJvrIKiOgJ75ui4Npta6jOyxRjk
         AxIdXVDo6YIGYNfmVz9mR2LVmv1dOoYfC7vanzzEui3U86jfKvl27Jgn8waKQO1e5NYc
         t5pHJQtNUXoQIU/J996ggBK0IelcgQbPVzYbW47Qqub1b8aisP+QvIbkWpaak7mZTWgp
         uDbSc0maFf9IhAyey6YuediB+jhX3IjYWn8TuEjNct5IprDlzUdVrmCDpn9Bpx1i8wbA
         jqz4apVJZ6qyivpPp2WnZmXqWW34hrE/b9ZglWBDvasj6ztKI40kXGabxYec2v3hCBX9
         o32g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774371942; x=1774976742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7U+uS9u3k8MKiXu31MQXeVeNe3hExuIgcOumm3duMAE=;
        b=FzopNHcqiTJOhkLSJd1WnE/fGB/6O0plB5hJgbZAMRnZfyX6FVeVd2o+LpsdbAsr+8
         teTQoZc7KV+S1uz90jg4WIq24przdQya3UN8iT8+IO8ivs9e3onNi/OXKb/H/iEouTs5
         29gJfs7R1LkUmkTrzb2B87TRTylcojjYUzMlme/CiWdQPdUBCa3DQ0M5jE/8qyzOxCpb
         agXQdiW5DWTRpj2Joc4AqHLp9nFhDuuD+/vPwdSQ6Vpr6tBUNuesjCGFhnKAiDGK8fki
         vsq4AEzixDC4c2q8llF4qg0GsuZMK0VmUyIVn+AyCk9Fu8u5Y9EjQYh5102/8htXHYAv
         FFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774371942; x=1774976742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7U+uS9u3k8MKiXu31MQXeVeNe3hExuIgcOumm3duMAE=;
        b=XQwZb/LvSFRmUOt/nQie9fcAZLXeZh8hVtMSnFmd30GO3e78I1wwce7j0gfCjvttpl
         Qp4CzNlP9njoR2WS99quvZQctwsBwh+Mx8XsdkMuyHOBDcOButuyxXvxf4/dmk24f9Iv
         DrjPBlPCjz0cPIVsmzH/al7fh26uuiwYWtZ22Rl0l19YGle07/56EuUMtlDFGJlhg/Nl
         L8mGO+gFn8Y6FmwO+61wDg/yq8y9tKFoBlJTwgSeJ7xnU2qHz+YjYwQXnirEAmklU/5p
         XygyoMwiY+CCEMfQBkmQ5anO2EXq1bh1kTxu/iTmkaI7U5xKnSPObAK9EuwxZv71wn50
         wVJA==
X-Forwarded-Encrypted: i=1; AJvYcCXZzqOv9FUDsrMHmuX4fTr9qZJgLn0AaGslmud2E/9agEPJRSEx8+ukA0u750wIRNB66MeqrB7es7ZS@vger.kernel.org
X-Gm-Message-State: AOJu0YwLHmsYJiWlJ6eto2QS1NnM+zbxALUzsJyfzoRBWLp68YsUdc1i
	toiSOKilBB/8DezcropXefbM1TnRNJaLMoOawTKfBeLX++9gEQRZbiH9z8MQ1yldcwmGQIguiOq
	Mz0sLVuW9vS61oE2Or+hxeOm7bdGEofc=
X-Gm-Gg: ATEYQzxBZAcr8Q0MaX1ALZ/wzkUWpfwWIedqKmcTbUi2Ns8S9krkGWDGbI6AXQO4xz6
	YEa1SSh2MuYX85884LGr5o2wvKRFcpu8Vjq79USrhWEqEhQpQiqiAjEvCaM6BEH2IL5UFvIwSqD
	4p16ff1HFqqzAdD0yL5RCefbyfm3Ph1iYy3FIf1ElUgWiTvZrPOvFnxv756WbdpEyn9LR/3ALFE
	/WBqMp6ijFoMxFxVtH7ZC+YIEk/TTDH1209Dcy9Gpx5Aq0G9oWNXcCpDf/T+3+Bnp8qOH0sTeQb
	uEvsE6/RFq9hW18wgu3RDAPMxaGzU2HbAfh/RDcdkkWFtBVO3U+PUU+X+hgXppmHXIpH4sry
X-Received: by 2002:a05:6512:a85:b0:5a1:357d:8d5c with SMTP id
 2adb3069b0e04-5a296217bdcmr1702664e87.16.1774371941838; Tue, 24 Mar 2026
 10:05:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313131058.708361-1-festevam@gmail.com> <177437057319.780275.6126712599317976655.b4-ty@sntech.de>
In-Reply-To: <177437057319.780275.6126712599317976655.b4-ty@sntech.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 24 Mar 2026 14:05:30 -0300
X-Gm-Features: AaiRm52B2IjL4-VNNNNf6qbXItPEmRzE8Gd8zkY8yJVdgm6pvTVEQP-i1uoWhTg
Message-ID: <CAOMZO5DnC9ZB1w51iHQUmmhhAs4RSy=B__Es4=zgtfSvbCWEhA@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] dt-bindings: soc: rockchip: grf: Add RV1103B compatibles
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shawn.lin@rock-chips.com, Fabio Estevam <festevam@nabladev.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

On Tue, Mar 24, 2026 at 1:45=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> wr=
ote:

> And dropped the watchdog node for now.
>
> Please resubmit that one, once the watchdog compatible went
> into the watchdog tree (and drop the status=3Ddisabled from
> the wdt node, as the watchdog is not dependent on supplies
> from the board dts)

I'll do it as suggested, thanks!
