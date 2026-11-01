Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571192;
	b=gOUV+np+oi7JZY7NJZxFWsOCu+S+RIsuxlcXpKcfHVmAAtzdcd1SOEw4KOMMy6/k5SAO
	 /zlNOUbqYmjjo0ARDSUfwPZy2UihSv2MtZggE5SOEHLw1x+kkVHjieXlHobbXhV2/LCEq
	 0V/nvuSBp6eOFHSTSqXSUjgdKZAM7GYSS+GdxDzc6FIVcs2TZuiKh0TFEUDuQDWofAlcG
	 A8j+zZYoAHTkq7xoufj1sXuWvnU8+Ie+x0MPzvIor0R//726nc8ihLRs9WMfT6OMQXvxW
	 LHILh9lI9KE0Ppjye3U21PCveHNzs1IOwbwUhe8ilZcIp8wTJ7h2BMUPB9e/FFZUwew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5Me/9QJm4Q38T465J3XjzPEtQTmtBofSNTe5eAQE4wQ=;
	b=nSSgmnuC4AE2qlmq1lXA8u6Idmbg3/SdbBFU+q7yharyP4XgqhyZCWxb9ViatluL2W5q
	 vjUAuET28WC93tyDZ7rqXLZAb8mnGI0ro5hKPQwvTF3JmTiGrnevD3SFYaQGb13QAR6nB
	 k9WlTcJQ19ZBYA0dTsQRcW0BgEp/hXIO5fKS0P77pQqPnxd81q70cAfrdYg6qxuqtE4CM
	 BNDatB4bpdbySoY0awad2F2BZ7LWOmGej+4e12hkDLvDGgucmhYkbwF1Ai+4X5mSM7MFO
	 spyvwGxsvoM2dUyAvxQguOoj6QYxES1rcbzJfxxR71jOlcyxprBID0DNkp0viihHn2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Wf/aDDQe";
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F23606A324
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6F23606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Wf/aDDQe
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so18657251fa.3
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793571190; x=1794175990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Me/9QJm4Q38T465J3XjzPEtQTmtBofSNTe5eAQE4wQ=;
        b=Wf/aDDQevLju08zKiDXdwoHJrG1e131ViFtawh4/JM92LGMHeBv9EHOhZhku2MarXn
         uu+XejU4TRvlsket2nzzcyeHF/1g8wnWJHIn88t7lUwk6yFnLx5uJ++7g4W/RTRXavws
         oZSMjXkuSxxej5p1n0MvyYwQ75KCKaXozlOhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571190; x=1794175990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Me/9QJm4Q38T465J3XjzPEtQTmtBofSNTe5eAQE4wQ=;
        b=AQKhRAB1Q5ttlV2HTcskZDGgbheo4AKdNXRUSeTn0fp0wp6sX2czZR4TjUn9kxCddq
         d+D1aVNNHPXtCMFqaxLX7p+Y339GIvzwy7hYTKDkZxcnlhrJA7QmAtacgDKu+S+YyYFe
         zuDQx/5UyjXb3txew2IufE3cZtWwLd6zgbt9T+Tlmwuf/LJ9dV3xYjhQ7uVGCuVw5+4y
         5RH0JKuR4Z7kihxSuVUmlvx5Dh5EdOQwP0blh5IcVvpC/6/RE2N5GZdA5rev786trwWN
         3ONryVdMW1uVM8D8oaKSavHQeYKGtOmxGmA7qZ/N/McBv6e2vVPjH1xHBFvbtrdCxfbW
         XRHg==
X-Forwarded-Encrypted: i=1; AKwUvBwU5MtJUqkzGV8czmyRndJsgI6VLrd30ESTkzxKNMbtArp2nWk4KkzBk9MQ3TDTMBcyTQ+8IZfmlS6V@vger.kernel.org
X-Gm-Message-State: APuU4Z8JQPj3Bo09uHO+HYKB89QPh/+1wDHRKWdaqxGs2FegAobeDsDK
	V94gg4XQeLzgc8HzqWiGwVl1m9EJkH44E9IaWR8i4WHLlhdWZNoppiaWN1TDZL4Qn3jPcGEqJAV
	06SiCxcvy
X-Gm-Gg: AYBFou1scnAxGn4MlC+c5C0xhAXmeEoMkf5wSVl1WKakSOVHibv/Tcm56oV+5IBNS7a
	STvl2H4Tv7B3HeR9q3e3KSep/htBC5dL4PKSUPQrJqN6E48hcU4jQPo/6PVjpWjUBOdr5XCNBJL
	zEXoXLBbw7l5nThAlZEOphL1HQhCm8tpnhyrSGALYWIhoAlaeh6JxKF1CyFg7Whq4v1jc6Aixpo
	8p9bB8XlpbBEUhAnVI59u2LEsYd3/BwwdLL5DfP4M9f35/OokMD1XqdEMSy6r+3Q1kk1c7YS2zJ
	tHH1hbrJe/oCFB07pXUlPMuWUjyssqdLBAXw+5/P+zXBSbBuroz0/gyBzDMGc9H5AlwczFnlrw9
	HFayWP25Yqr9QDFklLB4tfalr2ZYhgcWz938WzAHqPu5t9qA9/SUIM9D1T/SKjJ4hhdJCSfRzx3
	UZqXIac+BVbFwxxJAOV3DREy93pGoylVr+BDCeAVRaGEeDGTCrPpqzUkOgM6ODOl1Ystu0rSk/w
	2cBmSel1dUd8WYZz6Q2s0h+5tbNrSazZf+mRCUTVafXyM0a6vpTDok1tlKm3RQqsmqrkAXcfSR5
	PQhsS9buw8rTRIgy4oMxLSwlnNNK/Ir8uWMVjFSD4B9UTU5vtMtgxrgOjwfIsEi6IoI=
X-Received: by 2002:a05:651c:1473:b0:3a2:f233:5c6e with SMTP id 38308e7fff4ca-3acb7a4d797mr21933811fa.6.1793571190194;
        Sun, 01 Nov 2026 14:13:10 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbedfac7sm18302191fa.18.2026.11.01.14.13.10
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:13:10 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso2088872e87.2
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:13:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByDqPvG9TYM0NRUrfEklNasdhStDBZpc0e0DWjKHCkMDT2c3h5UCDj1CQ1Zm53coU5fR/cJzGUJFDAq@vger.kernel.org
X-Received: by 2002:a05:6000:46da:b0:48e:73dd:855a with SMTP id
 ffacd0b85a97d-48e73dd874bmr11427269f8f.51.1793570749483; Sun, 01 Nov 2026
 14:05:49 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-11-dianders@chromium.org> <CAFLszTgXZ8fcHuMbMAorsDaebj43gU47bS48pO8dKtnL0JF+Fw@mail.gmail.com>
In-Reply-To: <CAFLszTgXZ8fcHuMbMAorsDaebj43gU47bS48pO8dKtnL0JF+Fw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:05:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XG-YHW2__uxUdJr4vC3e_mW=P==F0JUvkeepXqmKMSNQ@mail.gmail.com>
X-Gm-Features: AclHuK_naoI8TgiOEvg2nlmaOCNYlC5UGiEf6u-6ngKNFsppEgRdoP0YA4HjfTs
Message-ID: <CAD=FV=XG-YHW2__uxUdJr4vC3e_mW=P==F0JUvkeepXqmKMSNQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] fdtfactor: Add compiled FIT image factoring support
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Oct 30, 2026 at 5:23=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> On Wed, 28 Oct 2026 at 15:56, Douglas Anderson <dianders@chromium.org> wr=
ote:
> >
> > Add `-F`/`--fit`, `--outfile`, and `--single-base-dtb` to `fdtfactor` s=
o
> > it can directly factor `/images/fdt-*` blobs inside a compiled U-Boot /
> > ChromeOS Flattened Image Tree (FIT) image.
> ...
> > Assisted-by: Gemini:gemini-3-pro [edid_decode] [gerrit_and_build_artifa=
cts] [gsheets_gdocs_cli]
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Moved FIT image factoring into its own patch.
> > - Replaced external `fdtget`/`fdtput` subprocess calls with `NodeTree`.
> > - Added FIT `hash*` recalculation (`crc32`, `sha1`, `sha256`, etc.) and
> >   rejected signed FIT images (`signature*` subnodes) and external-data
> >   FIT images (`data-offset` / `data-position`).
> > - Preserved per-group compression (`lz4`, `lzma`, `xz`, `gzip`) on
> >   factored FIT `fdt-base-*` and `fdt-*` nodes.
> >
> >  README.md                 |  19 +++
> >  fdtfactor                 | 408 +++++++++++++++++++++++++++++++++++++-
> >  tests/fdtfactor_lz4.its   |  83 ++++++++
> >  tests/fdtfactor_other1.dts|  21 ++
> >  tests/fdtfactor_other2.dts|  21 ++
> >  tests/fdtfactor_test.its  |  83 ++++++++
> >  tests/run_tests.sh        | 156 +++++++++++++++
> >  7 files changed, 789 insertions(+), 2 deletions(-)
> >  create mode 100644 tests/fdtfactor_lz4.its
> >  create mode 100644 tests/fdtfactor_other1.dts
> >  create mode 100644 tests/fdtfactor_other2.dts
> >  create mode 100644 tests/fdtfactor_test.its
>
> Reviewed-by: Simon Glass <sjg@chromium.org>
>
> BTW, 'FIT image' actually means an image in a FIT, so I think you
> should try to call the whole thing a 'FIT' instead.

Done. Updated the commit message, `README.md`, `fdtfactor`, and tests to
refer to the container as a "FIT" rather than a "FIT image".


-Doug
