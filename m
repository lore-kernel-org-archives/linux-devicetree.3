Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCEA43FD06
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661189; cv=pass; b=sMUTKDMjfkSfhIDv+D+N2DabIvZux2klGCvcIh6rv+/lASU6mXXa46xLygaBkzPAflvnN4vZjG5A6AIbhHPZeZdUrCNAOAkHKYnbKp77cg5Ja0k05ZjOjswcH3AaBs7mvgwiYRFOerHyP/ncqmSjqw+zU+FiWw3uSLwvCR1NobY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661189; c=relaxed/simple;
	bh=NGrK7unDAm/B2x/Ykw7H2riNy8GEYeiyVELFClUTNpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIspL+Mf7hz3l51HUwFsG5wIVxPe16Sl9arHiwbc6hgyWqpxWy0unobY1mehuy57jZwO97GcObKFt0f7bp+oOZDj5s4aTrfzr5uxHScEKSwMi2Fpt38qIqePySeGu+4NvtD/QfomukbG2gyvn/hLuK3BvmNW7Sq5zEH8txw9044=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBaM23L9; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBaM23L9"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-836c2907a24so3616737b3.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787661184; cv=none;
        d=google.com; s=arc-20260327;
        b=di6kbafh/Mh/1DW624M0ztrOd7No55//z5KoTa6CvOtMPD8nb4W0yE4qx9T+wZwmED
         Bp1oT4F1VOMTmTBjL300G1ssg8lv3z+P3vlyS9M0zE7vWdGqoia14kKPBLiH+AtS6qZE
         aOoL9sBSM6F2+E6BZxch8emKh1CrHxiIe5ybsVHnQDKSJIuS5Rbxdtqedc3dsuHpDCGe
         +LD+i+Tau5hMr5cX+pfJJmSavxk/0xmwTR3GnDymEXLKuZbp13nBZPavXetQ/vHsuepn
         QteUPyFRNfIFbAupwif6RWZiYNwH78hkFt9P801hhC8M+aDu0ymGYjsQF+SiX1hVCYRS
         XAlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j5Ct481F4wkRupatYcRj24aj8wwNlrEwHJD/XdnqyS4=;
        fh=zdh0YzJreCYScTOt71LGEp5jHDhsbNgqzoyXGiB4jro=;
        b=hpmoNN7HtsI3bDDAAtY3z/ok7K3v08ESICgp3Ldf3UwE4AUzw9DJjqiHba9XPoKBpG
         gGy26xv9r/JcVukY88OOzchNkBEGmkfI8v26XL/tIqH77T42+KNe9cdEbX57/SWADBIj
         eN2JIRjdepPcVRsfnd4ykrBKAa4NY8+olIkUzcEia7xfYoH+c9KU0BA5EXumbSOF9MLq
         rOyBFTjWyghvqenTYHcKdgH9Tl/P81a7essKhO+RLlB4Z8w4uVbX8kDh4TkBic4uelf0
         gQeqEeCvn+YnQ1WBIdup8eBA7cfYHziFK7ad5FvQGz009lyzWpIbIPF/r0VCI/02PMFS
         gfmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787661184; x=1788265984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j5Ct481F4wkRupatYcRj24aj8wwNlrEwHJD/XdnqyS4=;
        b=RBaM23L9MQgk9+ZaufeFEwnvYurWs7Ssr+zkOpbqY51S8ijjrv0gjPW5C80IMkUZbL
         4pgkXklBL2flWATIG10ke4KKv9r4gUChlet7+qxlzIncf5YCobkC8JWkiF9m5Xykdlvs
         bvt8p/h2+U/eg95X0QJZWhn6MCfGCMEXuGfngJOiExZFpqpoDfolmCzZXvhGxSgVlZc/
         aU6u298ywDZTqdx0HVXf06JhWSmxXJzHl0YXJfAtOIi185e9J/vqC/BhRcY5j/2qPZjY
         8M7cbvdOpowgaeNOlNipjrIC5s+p5TvYRzfervjYATt2cgO9cClWLH0Gg/Mi5DHEtW+7
         n1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661184; x=1788265984;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5Ct481F4wkRupatYcRj24aj8wwNlrEwHJD/XdnqyS4=;
        b=fxjwVtB+/ecF3xDApbr4NHvTdIsluoUjkW5gdd5HaYaJZN9SA7r/WDohRpWqAmIFJp
         P4uJACbvQ7yNzXMBNTk5soVMMkTyy2i+v9syB/mB9NISTk54QHvSaSv6Klr4pUZ6jfNg
         Xkx2K/E82LgNKWeOTe1jdFWMPeamFSRRhwLdAzriWhTREuuMP82GFXlwP232gTzyYryv
         F5rfNynGGFQAdpUoXHZgAPPiCJtZmNHVX+K9vTl8hMkfa/hq4R+bI0sYOBSgs5IcD/cQ
         vkQTmxDkfV63x2DFYpAoqrerrR0fm5nl/Cg2A9fTnT1qgC9Gb0UKdVfhLDaz6+Pl7eNs
         OlgA==
X-Forwarded-Encrypted: i=1; AHgh+RpbpB62TYSaF6GFism006PbbamniW/M2wi8jUqO2DQX3Ak1/r4HFuxRIF1cE3DdcA3rSVT6sGWf3uil@vger.kernel.org
X-Gm-Message-State: AFuF++lyuhTkhTnng5FpybI1DwuTqcC9gbgte94peg9aTbVR8Ffii3ye
	eIDIZro6DqIQ+36b3LjJCZYCU9rgLFi/IlUhpSzy7Upmv+M0pxM78scet7/tOyYWcJTL3ixQ3MG
	/8LLwrin0aScKBhaVDe/g2YAgWm+DrLQ=
X-Gm-Gg: AR+sD139RZ024EupJEjK73xTV9+H0u15RgNO4hRG4NJmQ5wnPk0W61KAizFs1B3vwOp
	zjDV7wF/7C+E1D4TDp/MCzjEikKbHciLt8gyoDF3Xz1ADdeIegf7hahjQ6zwjif0gn+9m4aZ9SI
	ZDd4E2Tlywqy/dGk8qibrBEHrTOSybN1EN1rZsDvrdMiP4J3sxJAq8pkJqr9BHLogYhCuJ+GhYs
	b+Am2vokOT6O7lV21siLpUN/aEnZFGOOOPgp4TzYnPwXTLZrPpAnj60z5Hey6nWT6Ld+sfwe+pD
	FDlB1TrVFR/FSvyHfr15jyxlXbzXqF6So0UjT/9ZURLodg==
X-Received: by 2002:a05:690c:6b03:b0:7ba:f0d0:5e9b with SMTP id
 00721157ae682-849f4692ca7mr107963927b3.2.1787661184163; Tue, 25 Aug 2026
 05:33:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f1805c2bce56c89d8ace35f67c665b24bab90965.1787568944.git.gahing@gahingwoo.com>
 <ed82f56171bbab8b150d3512412cda12e7e09a7d.1787568944.git.gahing@gahingwoo.com>
In-Reply-To: <ed82f56171bbab8b150d3512412cda12e7e09a7d.1787568944.git.gahing@gahingwoo.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Tue, 25 Aug 2026 14:32:52 +0200
X-Gm-Features: AcwNN1Xtzi2WJl1KccSUfPCnVd1JKytTLunfgDKRxF-zeJjSJm8murTNkgUrOck
Message-ID: <CAEWPSH7AcRb4uAnhmcL+kk3mQrgqYsQAYR=JQjJdkFGVK4qfHw@mail.gmail.com>
Subject: Re: [PATCH v9 05/13] dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, ulfh@kernel.org, p.zabel@pengutronix.de, 
	ogabbay@kernel.org, zhangqing@rock-chips.com, u.kleine-koenig@baylibre.com, 
	chaoyi.chen@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	iommu@lists.linux.dev, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiaxing,

One small thing I noticed while applying the series for the
RK3588 re-run: the cover letter says this patch carries a git
note naming the base and the one prerequisite, but the posted
mail has no Notes section - perhaps format-patch ran without
--notes. Mentioning it only because Rob's bot asked on v8 for
the dependency to be recorded in the patch itself, and it would
be a pity to collect the same remark again on v10.

Regards,
Igor

On Mon, Aug 24, 2026 at 1:10=E2=80=AFPM Jiaxing Hu <gahing@gahingwoo.com> w=
rote:
>
> The RK3576 NPU has two cores of the same RKNN block the RK3588 binding
> already describes, but it wires them up differently: two extra CBUF
> clocks, two power domains per core, and a single reset instead of two.
> It also has no NPU SRAM supply.
>
> Widen the property ranges to cover both, then pin each SoC back to its
> own shape in allOf so nothing loosens for RK3588, and keep sram-supply
> required for rockchip,rk3588-rknn-core only.
>
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../npu/rockchip,rk3588-rknn-core.yaml        | 47 +++++++++++++++++--
>  1 file changed, 44 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-c=
ore.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.=
yaml
> index caca2a490..3b611b64c 100644
> --- a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yam=
l
> +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yam=
l
> @@ -21,6 +21,7 @@ properties:
>
>    compatible:
>      enum:
> +      - rockchip,rk3576-rknn-core
>        - rockchip,rk3588-rknn-core
>
>    reg:
> @@ -33,14 +34,18 @@ properties:
>        - const: core # Main NPU core processing unit registers
>
>    clocks:
> -    maxItems: 4
> +    minItems: 4
> +    maxItems: 6
>
>    clock-names:
> +    minItems: 4
>      items:
>        - const: aclk
>        - const: hclk
>        - const: npu
>        - const: pclk
> +      - const: aclk_cbuf
> +      - const: hclk_cbuf
>
>    interrupts:
>      maxItems: 1
> @@ -51,12 +56,15 @@ properties:
>    npu-supply: true
>
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>
>    resets:
> +    minItems: 1
>      maxItems: 2
>
>    reset-names:
> +    minItems: 1
>      items:
>        - const: srst_a
>        - const: srst_h
> @@ -75,7 +83,40 @@ required:
>    - resets
>    - reset-names
>    - npu-supply
> -  - sram-supply
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3588-rknn-core
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +        clock-names:
> +          maxItems: 4
> +        power-domains:
> +          maxItems: 1
> +        resets:
> +          minItems: 2
> +        reset-names:
> +          minItems: 2
> +      required:
> +        - sram-supply
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 6
> +        clock-names:
> +          minItems: 6
> +        power-domains:
> +          minItems: 2
> +        resets:
> +          maxItems: 1
> +        reset-names:
> +          maxItems: 1
> +        sram-supply: false
>
>  additionalProperties: false
>
> --
> 2.43.0
>
