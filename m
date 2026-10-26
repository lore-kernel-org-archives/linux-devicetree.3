Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793028670;
	b=lnJ7zdxivZtanWg9ff5IhxnFTIV9k3zswGu+bASweOY7JtDruTtyoH4ZOY8rx1r9ZSVU
	 z8Zt7J57DpHUS53uX1Hty02lnP22C3nhIaxX9i1nTOP7+0OGbJpC+ctoC2YvJnz+yKgTc
	 UoNtNMEqMOxz50xsnV9hPhRn5lrhDwaqXO4cJp+a0k75vqFPxavPmRZUpYtIVCKuSQqTz
	 ZslAZbRZH7JzZuGFf7TDXIrD/e97K9bbDAKzSLf4LQlbuvtBKKmYey6WktrXSLGwY9qXr
	 I3anOfQxcmyrJB5bKFx26c1KoUCa5NgQsEObAtE2gxYH7zxNWn2eEO41i6DiNOHSU9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ByfudzbZBmPdop+tQLUNKnJBViZnQ8X/fNaZs09u0EI=;
	b=4s00TXflrCHykZccexTtqp5sRjt6FKCTUG+2aiSFsWca9AbFIbUQKtcigakMHBnTY5iq
	 Zyyhz++JehW696tL8Im+vtRMmzy9vBnF7kprjTQ0o7WJLQXUgJQHhQAfvtMXjoA2qRTuK
	 ncdlCQzSPwJ0DzKhoUK9FAY0OmhWG3KY8t2Q9OArEhby0No0Bt5CjlPOT84oqiw9BRwTL
	 nyDNCu+ocX/v83Et5n0SHrxaXz0NL7/dnsSnYMiFE3DBlLyLNs/jzQPmoaDqxaSudw5wm
	 2vHPypSVd8wz0vxWvo8tc+jok72UT6HQdO14JygN8ygrX9LYv27MCZC8Wy49E0DoMCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=i34fDHbk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E88606A32D
	for <Devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49E88606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=i34fDHbk
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so4557743a12.2
        for <Devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793028668; cv=none;
        d=google.com; s=arc-20260327;
        b=LwF2ZJw0JF+QtY1G4UuzqyhNxk8r1daf8lgAqs98Y33wzb1eX6zxYahcpqaZxpcOpm
         +rmr4buUhpmUdGcJCG3dnVqPsnS99nM5nEt8gGDbDB/CDWUDf24tStw4pGh7KUDZrlb4
         X7jN9MPqroOTCuof2dalNi2Fllcw4/Zjkp8cqxa9QSX93hCjRxk3AQGZYQf15NFitfBw
         Zv0q26W6NoP0yeGXYj4wwKKLTzQyR/0GbfRgVywUv3btspB0LD3zlddHrPxmBLkflt6s
         wEZchNHFMn4LkQf0w2wXASeAiUPG7pxsy+5bSaeFaegJcKyvFDntflVYME7B8+464oxl
         zcVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=ByfudzbZBmPdop+tQLUNKnJBViZnQ8X/fNaZs09u0EI=;
        fh=pkhdnnaF5ZbB7Jn7gQlLm5Kr9nMsNnjLvAkbvtNblKE=;
        b=kgdEldFcCXHDlS+JQ/Van2zIY5HDqesjaJDS9KDdfQdAzGqyluM1/lxVrTAbTh3CWY
         hfImTn2wyb1J11LfvgGBqIRVRdfcr3dNq57ppmcmzN9Y0V09E2CAev+Sox9XdGgeGyl1
         WGqBbgyqR+fOD96LnK5NuPetPs04waq8RtDJ4L20pIFZU50/ykZ9POLuG+ofySvC9JCe
         u4Mldt8OOv5PCAfURRJEfW2TaKeepKESN07plgFp32lRdkn0tjRa8vfAL80VRywoLkx1
         gZxV4zrGYus91Gs9Z2Sxv4JkbDId2HYy7A3r1euzeT57c4UMJYCV+YOynfUfW77+F200
         YkvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793028668; x=1793633468; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ByfudzbZBmPdop+tQLUNKnJBViZnQ8X/fNaZs09u0EI=;
        b=i34fDHbksXBPhSy1Qhx49uDOu7YvsAAUs+Vx/eUgeWkTxWdpNpDGYUbQ196Eg+pygP
         u0VFcXxm6B/Suu+/VqrGDMYtYD7FGEG+vU4m2RWmBqGAjJasMNcSo5eWT3d5zOxe1gcd
         riQhyhnZAwL1Xi8ML74qobUivRjlg37e9Twbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028668; x=1793633468;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ByfudzbZBmPdop+tQLUNKnJBViZnQ8X/fNaZs09u0EI=;
        b=L6tjAUiyySX7cqI0lI4OUrcOB//PRcWUq7mpY0iQb2l1yAqkQs9Mfu68Wwu4Gb1mVu
         hJrRuJrZhVy72kE2AILkTziDVco1CMEKb1+1TvoGkZ0ptGmWJOVYoBmQGWqiHe5GSPtB
         GmMhUP1n3rmxXaUsiBAiasrrhom2JHQtpBY2msfqgPmanfuTDLjV722ZbI7WC98jsXat
         4YjSEW78WBubRqxrlFtPj0Ih/luA4St7Hy3kizjheXq6fDKDHqet5BkeKV8aXXEq/mWI
         TjWlE7qkIcFAWQAeIHjNjlVz05JiXtsB7JjulabQTAUIVqjpG14ZqkrFSN6i0Najz5z4
         q4zw==
X-Forwarded-Encrypted: i=1; AKwUvBwoJaSJEwo5Dy9NA0YI4I2Nra8PLg4wmT0RpCU3GotCECQRBeyMlYcR1DAVjf15/o5vPLBe+7/2kD8l@vger.kernel.org
X-Gm-Message-State: AFq9FYIeB3s2RJESkq0Ku9QZEviVXreGvdz+eb6Psgqvit9UdQGIJCd1
	Wf1IAM2LTPmO8frmSJhGSdwCbTTKVhIOmT4E2VKO/k6qDOqVdXmLhONqjj+FVDOuUwVPDTstaDh
	JrZAErqTowWiil6tNUcUlLbvYhlX4bRUP9p8ijMPS
X-Gm-Gg: AYBFou3gJPr11KkSa7AmdYLA643A2dODX8GTcjH67YUNwv/7yoalY8caZk5MD60Qp83
	FdEGlXdF91YEH3nbsuwqTAEa3sOWGW1hnQu9GaE1Ho3dLmXvZcX9YyaZ/bVHr5DUeV0lNnn7kLK
	AzNetBQTjQhDsKlCfpSgLI0ZZNASP+C/n42UL+hEKtbbzPUYOrJxFSjIImjAdEzzYY+KUcKln14
	39lBgtUqqkn6IdPTOOCclMn7a2hORhPEHc7jzJaoJeNktzI+T9Ru3yzxkOYSpiQg3gV6L39SqFw
	C2O47TgYbQpi6Wy5h91ldxMbmDqV4o/ODWLlerbxXINr5AoRaPmFYQ5a1Dw/aAg1I8kSe3nNRzG
	za3+HUld2pptHeaKmJ3bQytLD0bNzsvavFtw=
X-Received: by 2002:a05:6402:4021:b0:6b4:583b:daf5 with SMTP id
 4fb4d7f45d1cf-6b4583be5a2mr6346972a12.43.1793028668229; Mon, 26 Oct 2026
 08:31:08 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 08:31:06 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 08:30:42 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261015182221.2931742-5-dianders@chromium.org>
References: <20261015182221.2931742-1-dianders@chromium.org> <20261015182221.2931742-5-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 26 Oct 2026 08:31:06 -0700
X-Gm-Features: AclHuK8AS3l64pCtBVyQ04xvPLa_xotvoD7mTGNS-Ci5w-XHpRDF-10--cetNjY
Message-ID: <CAFLszThA+Fau4_0NEhXA3ntUmPB8wnuaabVvzNU=CMSpoQQgkA@mail.gmail.com>
Subject: Re: [PATCH 4/4] fdtfactor: Add compiled FIT image factoring support
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-15T18:21:33, Douglas Anderson <dianders@chromium.org> wrote:
> fdtfactor: Add compiled FIT image factoring support
>
> Bootloaders such as depthcharge on Chromebooks and U-Boot use Flattened
> Image Tree (FIT) images to bundle a kernel image with multiple board FDT
> blobs (`fdt-1`, `fdt-2`, ...) and per-board configuration nodes.
>
> Add `-f`/`--fit`, `-F`/`--fit-out`, and `--single-base-dtb` options to
> `fdtfactor` to factor a compiled FIT image directly:
>
> - Parse non-overlay `type = "flat_dt"` nodes under `/images`,
>   decompressing their `data` blobs according to their `compression`
>   property (`none`, `lz4`, `lzma`, `gzip`).
> - Partition the `flat_dt` blobs into compatible factor groups (by
>   compression, architecture, FDT header fields, and node-path overlap)
>   so a single FIT image containing multiple board/SoC families produces
>   a separate `fdt-base-1`, `fdt-base-2`, etc. for each family.
> - Support `--single-base-dtb` to force all `flat_dt` blobs into a single
>   base DTB regardless of node-path overlap, failing only if their FDT
>   headers, architecture, or compression differ.
> - Insert each `fdt-base-N` node into `/images`, replace each factored
> [...]
>
>  README.md                  |  15 +
>  fdtfactor                  | 726 +++++++++++++++++++++++++++++++++++++++++++--
>  tests/Makefile.tests       |   2 +-
>  tests/fdtfactor_other1.dts |  69 +++++
>  tests/fdtfactor_other2.dts |  69 +++++
>  tests/fdtfactor_test.its   | 109 +++++++
>  tests/run_tests.sh         |  69 ++++-
>  7 files changed, 1033 insertions(+), 26 deletions(-)

David is leaving this patch until patch 2 has been reworked, so these
are just things to carry into the next version.

> diff --git a/fdtfactor b/fdtfactor
> @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blob, dtbo_blob,
> +    dtbo_comp_sizes = []
> +    for entry, dtbo_blob in zip(entries, dtbo_blobs):
> +        img_node = entry['node']
> +        dtbo_comp_bytes = compress_blob(dtbo_blob, comp)

One thing I'd like to check, since the README says this targets
U-Boot. In U-Boot, boot_get_fdt_fit() loads each overlay with
FIT_LOAD_IGNORED, and decomp_image() skips decompression in that case.
So a compressed overlay goes to fdt_open_into() as-is and fails, which
means the lz4 FIT that the test produces would not boot with U-Boot. I
suspect U-Boot should be fixed. Until then it would be worth having an
option to leave the overlays uncompressed (they are small anyway), or
at least a note in the README.

> diff --git a/fdtfactor b/fdtfactor
> @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blob, dtbo_blob,
> +            for sub_name in list(conf_node.children):
> +                if sub_name.startswith(('signature', 'hash')):
> +                    print(
> +                        f'Warning: Stripping invalidated {sub_name} subnode '

This only strips signatures from the configurations that are changed.
But the whole FIT is rewritten with FdtSw, which lays out the strings
block in a different order from dtc. A configuration signature also
covers the strings block (via 'hashed-strings'), so I believe
signatures on untouched configurations break too. The user has to
re-sign with mkimage after factoring anyway, so it might be simpler to
fail when any signature node is present and say so. What do you think?

> diff --git a/fdtfactor b/fdtfactor
> @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blob, dtbo_blob,
> +def _derive_base_dtb_description(entries, base_dtb_node_name, comp):
> +    """Derive a `description` string for a factored base FDT image node.

This is a lot of heuristics for a human-readable description, and the
results are not obvious (e.g. ['sc7180-trogdor', 'sc7280-herobrine']
gives 'sc-base.dtb'). It would be worth using something simple and
predictable instead, such as 'fdt-base-1.dtb' or a description listing
the images it serves. That would also simplify the tests.

> diff --git a/fdtfactor b/fdtfactor
> @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blob, dtbo_blob,
> +        placed = False
> +        for grp in groups:
> +            if grp['key'] != header_key:
> +                continue
> +            ref_nodes = grp['ref_nodes']

'ref_nodes' is only the node set of the first entry in each group, so
the grouping depends on the order of the nodes in /images. For
example, if the first board in a family has many extra nodes, its
siblings can end up in a separate group. Comparing against the group's
common node set (which is what ends up in the base) might be more
robust. What do you think?

For the argparse description, you really have two completely different
cases...I suggest the FIT part of it should be worded differently so
it is clear that the result is an update / new FIT.

mkimage uses -F to indicate an inplace FIT - with -f used for the
source .its file. It might be better for your tool to use -F instead
of -f, and then -O (confusing for dtc?) or --outfile to specify
writing a separate file.

Regards,
Simon
