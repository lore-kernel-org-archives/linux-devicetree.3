Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792765970;
	b=cdmmya9uHWatGQ3sZwu3Q+6jVwstgfZf6f416dCea5kToBmZ8aZNTwz+zXyRDczV9OcQ
	 8EngiTVxwCGjmdQTWDIb6HbWEisNPbT+0FIO8cpaafVX1Pp1d8Ke8i8BwPLDW6MHYbLvI
	 tZAwXUQTLaxkNSSKaj2VcK6gnHDYk0OiR3vEDqdI3ZiqxwcYQLfbR4mQz5szEJ5MoOJ1U
	 4zqjEC9GKSC0cqOsuQTFcbAFH5Rg5o6UsKi3TpMgTu3NwxC2G/5y9Cpdm0fYpHm3307JZ
	 SPR3VYarEW4cAejUQD6nApkujvzoGVmDIuGm4lWCYdidj+JvlbxAan3iav2gJt/KnGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TW65mbXqWZmqBGg9YKq6hDH16N5mBPAA1Vl05PFK9vE=;
	b=P8gnxh/fkpQNYrzlpniq5jHR8E4/kJu6FzQR/dH4OTbLjsp/CkRIVj2un4kQ+8Q2FVIN
	 b77Vm/nv8vP+aErQV+26DoQRcyoINn1G+67O1VNct2rBNjYEf6S7ay8Hz5OCVi6U7DtWP
	 WO28g7kqkHs/j/O1BXFkNoDncMgs8T+Ety7fx1jDtIY1v5tAID+HM1NvO8G7gn2hO5z1D
	 Cz5RHCPOUP5Oi1gEbOdv6HPiOgEY2nexict3s0dn4URgS7AzAgN5xzhtK5ELpBPeNG92B
	 WqKIAseTx5jLZL6KxufEkDYrQAfR6cjliYjFdvwHIh65G6boDnXQlDwiHriXHxf/tow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=CW5cyxUg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54895606A324
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54895606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=CW5cyxUg
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso594089f8f.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:32:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792765969; cv=none;
        d=google.com; s=arc-20260327;
        b=gNuEL0bFe87kgyadsdCULtQgykWoZuaqqSPAri7yEtBF/RfPeStyDcBeRaTvLGH/1+
         0J94+R2Q2lIbNsDS+Ie7/xSQV+rO7mh1TtNcmiDKfHteAVH+4U+r3PRFsKaqD/DCy4+1
         2F57OgISyEWkT+elJf/3NHenN5SRU7glMHX0oHDOYe9L6rNKY6zAhVgKiHLaBGn0nY7S
         UP1yeSkMPhCx48kGFGvzJCXZYkeYobO3yg3q9lkFK1H18A7appQAVrggYkZv0AK+9MJb
         2ZSXzJYHNMcX36ud+d2AHrM5zqOPZDlBB4dLohqj2LnNFkWxlEI+MVxGW6raCJipztqD
         OQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TW65mbXqWZmqBGg9YKq6hDH16N5mBPAA1Vl05PFK9vE=;
        fh=KdXhnOqWtpxpwY0dTWKjG+buTNdsDmObfB0F/dfNm4k=;
        b=nAV2kfeutIubSnnybeZRvCPkd1QPFT+5APchpqrGZ/sYas3tTVZn7/CBE9hY64Sr/G
         1Nr+sTIcZiOq6HFUo3wa1YIIX0Pjgs864nYLPnwQrPfvtL3S6feJOFIVr5hEWmJTuuJQ
         OyDR5nc9S9g7kxMJdpPAjnJhyULCCV+GVGJVOrbOoRoNr8wpQ9VMEwqFu3B1CHq4hmvR
         OevjdaNHcAU3Y6xsyM+f9Fqt/MMkKu+UKH5vlA78MPUJxQN9jP4qnN3zsZPUJqpBo+hu
         8wghLvZFiRc3o8Ilrxe3XbSHPHhnQDCrKAN7l46o668y4rlVRmcNxcm6Ppe1HrOPS1//
         F/Jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792765969; x=1793370769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TW65mbXqWZmqBGg9YKq6hDH16N5mBPAA1Vl05PFK9vE=;
        b=CW5cyxUg+YzOfqAB771Axxc/ZQTVjSG578tVeQcnVRNQ09Iq5D8wRMk7XCBbNqwTze
         c+GqhhqYmVr9O4rh5ahzaDLEE91O7LNidSYja0dIH5rDXm4I7hqiGPMpNq2Pud3fqVYH
         P04LsRuk8YYsDq12j5+3GeL86cfglQwa8N+pz6a7xVT5p7hXuWRtoPf9TjwNrlqOsPNq
         4td8UbhcXNL8xXvaa+8mMdESrk9uX3rAvoPoDES/4ClvkDRXwJn8qzC2K4zuHJyV2Mcf
         351b/JhZFi8ikhC9OIyYwFwbpwzqIeI0M+enYHZn+BtqHQokd6q7Jg4r3Q12rw/50iVi
         vC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765969; x=1793370769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TW65mbXqWZmqBGg9YKq6hDH16N5mBPAA1Vl05PFK9vE=;
        b=zsAnNQXxjd6RXgAQyVGXAn4GyDYqVaCC+kcNitdpvYYc8BJnkZtI2ssBTMwmglxPDt
         JWeyxfTR7Y/NljszQJg1LwOw0HNGI7Yoyad7n2DFFg2/wkepSKDv3weZ6DPg3awFlRwA
         7YSTn2h7wwR0M/2+8G4rAKEGnQoDynNBPORB0zWoZg5xyMf5CvKbEVxf3fxKmHvcLozy
         lvMj4mF075OYFW9IrzMWhDH6XbPjRXFOo2J3WEmtdxmvg988Ut9QZV1OhVz7jU3+dAan
         0YJj4/Bo3EHSnAJsruIynLZtlqyklOIQp5dPPuwqYAEKNz47fKxozRP1iyQEpqoF4sIK
         j5Kg==
X-Forwarded-Encrypted: i=1; AKwUvBxouGGBOnjaIlyMkilqAiHrTdDyo6YgvhZ9PyjPkD/Tum1LeYgDn9gVwl/eveaJe2n9WHt2E8Z/Itwl@vger.kernel.org
X-Gm-Message-State: AFq9FYKd2lTARQIej3iq3VXwq8q3B9kkVII8+aIZSDLeFGH6MxDBSFQe
	Srg74UM9MlJ8pYRfmGlRZohNdh8ap3I6Y49Mq4T9QIs4qgoLuft0WKYeSCzu6pgZM9FHbxio2wc
	oIjtMj6rxcmU/eT9d+n1iTiz70k1+yJ30E7qqCaPIiA==
X-Gm-Gg: AYBFou1RdaaxP1fZtGkprntxKp0MV5Aa2mUbwd9tmz4cAxmX6OpGrBwHc6KqVN7EPI3
	WufkAvB6oY0rv32QCjyeh3pEgAz7aEL8kAAggm9wPQ3qLjvgDQUD0hb+j1cHhn3mMcjz/CprZ/Q
	g+q9aUHXeJR9fqxf0C6F8NH7bwWY5LimpyXdBZJjxpDU5X/iytZnkkIL99LDj7OlPsIfXqOEt+2
	g3jE6WpzHTuqGiKkzqd1YX/CpAke6gViBv9dMuyWnpYCVYBPnHxSj/LVVHI/3ob2Ojow9TYTl94
	ljijgijGmGaHqEdMmGZurDDZDmIvKpO0tQV2S7aVLbUrgNzYIjFRrk0jloWnXzsr7qX8gI0pd23
	Psz8YXt455lqGBTS1r8EYRoSdFrpUdlqjzI4eDNXxz17/Nb7uo33OXWIQtpilrIGBc609uoxuxN
	xsrHXSrETijVYMYBEcfmnnwe4bBPQbszN6X6tjRjuc2eMOb3Kzz0mdCLp4
X-Received: by 2002:a5d:5f86:0:b0:48c:6f3a:fe30 with SMTP id
 ffacd0b85a97d-48e3859dda4mr4501759f8f.15.1792765968503; Fri, 23 Oct 2026
 07:32:48 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com> <20260807-counter_delegation-v9-10-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-10-58658104e487@meta.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 20:02:35 +0530
X-Gm-Features: AclHuK-ELQwc782e_gNWzhlyxMyHtzq3L9uZbtZpWmLCC250qaSxVHzfJurC7sQ
Message-ID: <CAAhSdy0uq6AjzigiLSjTZEZ4JTOphcupx88Sf24kjBVDWB4new@mail.gmail.com>
Subject: Re: [PATCH v9 10/20] dt-bindings: riscv: add Counter delegation ISA
 extensions description
To: Atish Patra <atish.patra@linux.dev>
Cc: Will Deacon <will@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 1:39=E2=80=AFPM Atish Patra <atish.patra@linux.dev> =
wrote:
>
> From: Atish Patra <atishp@rivosinc.com>
>
> Add description for the Smcdeleg/Ssccfg extension.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Link: https://patch.msgid.link/20260701-counter_delegation-v8-10-7909f863=
a645@meta.com
> Signed-off-by: Paul Walmsley <pjw@kernel.org>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  .../devicetree/bindings/riscv/extensions.yaml      | 41 ++++++++++++++++=
++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index eee65cf73d6c..24efd3e1cf8e 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -181,6 +181,13 @@ properties:
>              changes to interrupts as frozen at commit ccbddab ("Merge pu=
ll
>              request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
>
> +        - const: smcdeleg
> +          description: |
> +            The standard Smcdeleg machine-level extension for the machin=
e mode
> +            to delegate the hpmcounters to supervisor mode so that they =
are
> +            directly accessible in the supervisor mode as ratified in th=
e
> +            20240213 version of the privileged ISA specification.
> +
>          - const: smcntrpmf
>            description: |
>              The standard Smcntrpmf machine-level extension for the machi=
ne mode
> @@ -220,6 +227,14 @@ properties:
>              behavioural changes to interrupts as frozen at commit ccbdda=
b
>              ("Merge pull request #42 from riscv/jhauser-2023-RC4") of ri=
scv-aia.
>
> +        - const: ssccfg
> +          description: |
> +            The standard Ssccfg supervisor-level extension for configuri=
ng
> +            the delegated hpmcounters to be accessible directly in super=
visor
> +            mode as ratified in the 20240213 version of the privileged I=
SA
> +            specification. This extension depends on Sscsrind, Smcdeleg,=
 Zihpm,
> +            Zicntr extensions.
> +
>          - const: ssccptr
>            description: |
>              The standard Ssccptr extension for main memory (cacheability=
 and
> @@ -1135,6 +1150,32 @@ properties:
>              allOf:
>                - const: zilsd
>                - const: zca
> +      # Smcdeleg depends on Sscsrind, Zihpm, Zicntr
> +      - if:
> +          contains:
> +            const: smcdeleg
> +        then:
> +          allOf:
> +            - contains:
> +                const: sscsrind
> +            - contains:
> +                const: zihpm
> +            - contains:
> +                const: zicntr
> +      # Ssccfg depends on Smcdeleg, Sscsrind, Zihpm, Zicntr
> +      - if:
> +          contains:
> +            const: ssccfg
> +        then:
> +          allOf:
> +            - contains:
> +                const: smcdeleg
> +            - contains:
> +                const: sscsrind
> +            - contains:
> +                const: zihpm
> +            - contains:
> +                const: zicntr
>
>  allOf:
>    # Zcf extension does not exist on rv64
>
> --
> 2.53.0-Meta
>
