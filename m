Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845C543E06F
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 12:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791116017; cv=none; b=kf31ulRkT4RaGmsy0qxO2erW8p7mF8RBkq+70xajEBySSboNMilNlnfIYwvWRYOh9Fy2Om98euzHvt5Cn1+U85Snnc+9h/+WdbWP0ltpg0/My5zkaWnEqLEOkQvl9Qsgj/tbfKaPSimbKkcDWm0PxSp/A/XkNkhSH52n3Ya5h8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791116017; c=relaxed/simple;
	bh=5Pr4pI6UHbC0U2MKjSQsGnO4riVPy06dn9dWWcRzV98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dMxyu29Lp3KJIy2N8N2qav4ieue/XCCGA16F/aMET+pgKO5Ln9UChDGGWyjJ7hvW7TBJCmMuOI8ycQspdnx5HpXdTZYe1g1qNU9kljz1GNIWnSyX7MGEw1zss0fw0O3AStYzIjYp0zp1nZQAFhStlYwfcAwL39G8LvDc8eO9PhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66e4ab201ecso509566d50.2
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 05:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116014; x=1791720814;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfYr76LOTu8jVRzggIwBN8xVUqu42mEkcSJCjGTgQ0g=;
        b=SsAKCuRF2muzcJKMaks/QqPzhrvF/rHVGRsAw21+n1K8ln/Ql7E388dyqYoIB/ZfkK
         +7dya+wa++gRx/mUovNLbCpsdx/3AGCrrbf+v7XfFMmIL4S0lauX9K3kcs1/bE8GLshr
         tVw4TuyTpQx6iuhhdvRNxw0Fwz1+2PjSaTFrog99jv/6uwrC/d7cLhrvBHF+QUTY0Nqq
         f4uVunysoQIjGT9FdKqr3wt2UfVizTk9hK1y69aZKMRI2gQbn1Sj+ehgXp/D171Au2fs
         heTbh8UUyZwVBrqBn0of6YfciArSHkZLkxMBp4PH1MkBQuz1FJHXXlmvupXcTnvyZlMZ
         I6RA==
X-Forwarded-Encrypted: i=1; AKwUvBzRpWYkekwiwLr/ZXEx5v1Cnw8+7GmvErvhoCLnlA4plhwHXBLQXr290OU+94bXl1w2cA3I+JprI9wS@vger.kernel.org
X-Gm-Message-State: AFq9FYKPgGB2mwe1HOfGLglfNALrayykCnk2HMgVGdHK2S3UnnMGvTS+
	4udAk1nnzNyB/dSKwNzNAl+4rSskTydt0ps9tbLK7Svztx8FeUL4XbVxZJez3w==
X-Gm-Gg: AYBFou1CQ/DBD8gaZZ5kMrJ5QE4ez7scFQxaCMI9zNSGu/5YG9bGhj3hafiRXMErvFj
	MjdGnkte94uT5lkCusjk/ZVR9jNVE+GEVVkjZvlJasnGG4uE0yn2lEOAiwM0XO6JEdKb6+GRq0O
	eDWVtkELi7VIGI6YsW4uKOR/QfSHdsMVonCBMKaq8GLOYDh+tDmDnl0pTiv5nc8eCTPPEk/FBMM
	9HDhjRmM7aOzzBuriDH3slRMKGtF21nSdu42nC4YYd8IfFXoQEf/kZP2x73VGyXwemQn8cyAZZJ
	asdemNTOyBPNlBm3TnNuBHqStkzYdhrMo0VF+3jvT7KFF95oWUOxudvvZRhnTxWkMk6Eu/njeFa
	9xEEwncY80Ree1c5bMXJ8IBEkT46iwhlfaGhlNmRnqKsi39LhlzOzppbAz4V4IT+b9H6WWfuZiW
	r6JViVESFyioxgKnW56hs3Q9q1uzgtQNmnMEz64dr+2OV/S1++Of8CSXgWRERRAzWtgPP+KUFss
	2Nurr/qmB7hsU9WLzpDIT799pz9xrxj
X-Received: by 2002:a53:a103:0:b0:675:405d:643b with SMTP id 956f58d0204a3-677ac0e6b45mr1958701d50.98.1791116014581;
        Sun, 04 Oct 2026 05:13:34 -0700 (PDT)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com. [74.125.224.141])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae33cec59bsm27701177b3.44.2026.10.04.05.13.34
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 05:13:34 -0700 (PDT)
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab201ecso509564d50.2
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 05:13:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByXcB0ylkxuPwShmB7NP8AXf+NAFxFk3HU8nCcS3vYH1kEYEWKzi2GitA+NuQDbyablZB6GdbfZgag/@vger.kernel.org
X-Received: by 2002:a05:690e:d01:b0:66f:7e05:c3f8 with SMTP id
 956f58d0204a3-677ac00785emr2680725d50.42.1791116014048; Sun, 04 Oct 2026
 05:13:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905153234.133217-1-tanure@linux.com> <20260905153234.133217-5-tanure@linux.com>
 <aqSX-kUvYaixESxe@redhat.com> <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
 <1jcxui79k0.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jcxui79k0.fsf@starbuckisacylon.baylibre.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Sun, 4 Oct 2026 13:13:22 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+0T=k44tHbJ5BSAsD-RvpytA6mLu1FKu_2GZgYucorXNw@mail.gmail.com>
X-Gm-Features: AclHuK8rosb4K--WkyZLuEcRV46M1KSWdwcM-4rWMY7HfYobH2sNfTEc1o2MX3w
Message-ID: <CAJX_Q+0T=k44tHbJ5BSAsD-RvpytA6mLu1FKu_2GZgYucorXNw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>, 
	Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 4:51=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> On sam. 12 sept. 2026 at 08:50, Lucas Tanure <tanure@linux.com> wrote:
>
> > On Sat, Sep 12, 2026 at 1:08=E2=80=AFAM Brian Masney <bmasney@redhat.co=
m> wrote:
> >>
> >> Hi Lucas,
> >>
> >> On Sat, Sep 05, 2026 at 04:32:34PM +0100, Lucas Tanure wrote:
> >> > sys_ampipe_nand clocks the pipeline stage inserted in the bus path
> >> > between the SD/eMMC controllers and the NIC_MATRIX fabric. It does h=
ave
> >> > identifiable consumers - the three MMC controllers - so marking it
> >> > critical was the wrong tool: the clock should be referenced from the
> >> > consumer nodes and claimed by the mmc driver instead.
> >> >
> >> > Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
> >> > sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself =
and
> >> > have no single identifiable consumer.
> >> >
> >> > Assisted-by: Claude:claude-fable-5
> >> > Signed-off-by: Lucas Tanure <tanure@linux.com>
> >> > ---
> >> > This patch depends on the MMC controllers actually referencing the c=
lock:
> >> > the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
> >> > clock must land before this patch, otherwise the boot hangs and memo=
ry
> >> > corruption this clock caused are reintroduced.
> >>
> >> This series should be merged together in one tree? Which tree? I can
> >> provide an Acked-by if it should go through the mmc tree.
> >>
> >> Brian
> >>
> > It's definitely best to keep the series together in one tree to avoid
> > boot regressions,
> > but I think the clk tree is the better fit since the core changes
> > revolve around clock logic.
> > Could you accept it ?
>
> No. This applies on top of another change already queued in the amlogic
> clock tree. It can't go through the MMC tree at the moment.
>
> This clock is not critical in mainline right now, so
> 1) I could merge this and it and in practice there would be no
>    regression. The problem you had would still be there until the MMC
>    change lands
>
> 2) Or you can wait for the MMC stuff to land and re-submit this in
>    the next cycle.
>
> Your choice. IMO, (1) is fine.
>
> >
> > thanks
> > lucas
>
> --
> Jerome
Hi Jerome,

Sorry for the late reply. The MMC side is in next now, so the clock has
a real consumer.

Can you take this patch dropping the sys_ampipe_nand part or
should I re-submit a new version dropping sys_ampipe_nand change and
only marking sys_am2axi0/1/2 as critical?

Thanks
Lucas
