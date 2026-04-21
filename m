Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F91363C40
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 16:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787891; cv=pass; b=BRjkpL0dIRmVOYP9PejFCnr5OafTpPFhTaEO4pWgYSOne+JxxHCb0jUQcIoOLu7AI58RfLTy9btDBywX29zRe0v6x6O0yQH4i95jojk/mWr/bM15TnDpeNZVW0d/zoE0DptjjhXtTqIVbGxKKVGxm+SlbGYvhBv8K/WwwNwFTNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787891; c=relaxed/simple;
	bh=23fmHe/a2B9RZiflbb2UW/w++uvf3lhAjUE/+MLJ2OY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BSjx90srPP4jdv42Yy7ODAIb0Yg2SynoOHYj10K63e/uniYhJPVbkwQ/wPF3mfR23/oHa0PskGFcHT5J0jc7/KJjJ/K8irPuqiNKOHS+b0fK8e5dJP3ZtEZ5VwEVP8OkiD+Aany4zoUZZS7nR/dnlZIeL3g0pWM3w9FP21vJr0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDz7Vmkr; arc=pass smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDz7Vmkr"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-466ec4c6846so1387913b6e.3
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 09:11:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776787889; cv=none;
        d=google.com; s=arc-20240605;
        b=j7/SLmTjTKgcFC9T3EncSeMOn95nxxuqOEpBuICxWfCWJPny5Q3Fw4Vu/X19650joj
         D5xadkaUB/80dBAwAbaWePI2ta9ZkUFOzepQNYI5M6Tcus9aZIRJtRoEl3e6dgZPIirN
         A4Xr+pwYw1flI0o1BpUcQtR+BWlYRimooOk0/5lgIAJy6KbhiLHsLhfZZR3qaS8JtY2y
         Od8IhE1qhN778J27HUccGMrWEB70682gBoLOjjPfhBeZVvIuF/k+skv8xQu1ZKIYlwy+
         U0sNmOHoUqwoGHUt5FDxihBB2k9iwb8Bx7/5iBXEn6Szki88XbHeXUY9JeeG5n6+x4Ds
         5o2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jInUirkrCYPP8V5B2fobD/SlWrNOrVioJ83jqBg/g2U=;
        fh=REKZT0JdLplagVmiMHYJqwygUUs1aSZKW60yYIVtJCs=;
        b=CXYqJBOjOiEHKOQht9DQYmPkvj8FwA2aUCXnHwArzqudNlBvrVJ0kwgcR7xoBsT8NI
         lSIfQMO6Lx4dkq7rHrltVmyt8VQHHPlhc+JJIrEzZ48U4wHfY/XE0suq7LL/fmJ67HNu
         J/wc8pMQ1MSczJ79iO+Vc+qSx9BGZdeyKFIQprSziUQrxVkuV88WRuIHG3cKBnZYYTBJ
         AXUzE5IaOGNHQzf4jQs34QbUVaBl1n562drdvRcWxalaj2q/BJr5NLOSiMhBzYHBh5YR
         HLznlvhoFYP9kol+VpNRJmzYubkEXek+qt28bXUwLUhqkKeI22dQiBK6Yv3dCvb2JmYI
         rJYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776787889; x=1777392689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jInUirkrCYPP8V5B2fobD/SlWrNOrVioJ83jqBg/g2U=;
        b=bDz7VmkrB/dYhuFV3mR8gDp4Im12aPFYwOTS8peOjt8huh5yR6vzr+sE1oJDUZd8yp
         j1p02+l1KJSVLNQ0joc59x+qDPs9X3cPvmnlTpQ7uncRVZNdGaiOdaNl7d1kH4YVApnI
         lU6Ip+OVE7zOji7HbdUHZxhSXMRD+cOtMao/bIdxPJ4ddW9nPK4ZSPOUABSIEwWBSUXJ
         Mdh0efDXsAG/Si9I+rLjVj2qAlQoPJq7rCCjRizfQrI+2sbp/p2lznWqbPONZ28LWevo
         citXndxfZbZk1/feTbUtyiFzO7S4LMDLIAHv6W8OUI/Jv5KQpR/5JSG70Tc3mZm0qoa3
         wy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787889; x=1777392689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jInUirkrCYPP8V5B2fobD/SlWrNOrVioJ83jqBg/g2U=;
        b=cSSuxzW121U1DkjzAWoSHmocP6vD5efzYYd/qU8DQKksXeC0BMVeL/FhDqnwc4flmZ
         53p53H4qEpiAaI4ETlfxAox8REzhy36/Ev8tnwA4FBu6xrIPnwZTPARbQ0GJsOQBg0jg
         +f6q6g85CNz8z/U2hw/B4pYv1Ea27VlVl2brJVbcU6fpYYixV2wtUsf2XXDkG9VAGQok
         5mLqc4D2puKsMg/SBplSe0k/Sy8Ffcd5wgySvLNdz3wpoBo0wi6AU0VeyUhcq9w+Oxr7
         0uc1k1gclssx8hzewMKyAh7zOOs7nNoS0p3M1Lt11QdN6mOs+D+Mew1Ooh8xOt2cq8VS
         zFsw==
X-Forwarded-Encrypted: i=1; AFNElJ/NxTMFBvPIeFptk2rzQFABUx34RUyxYQ0J454jcT+YtiW3S577/+YcJmPLvN/m+TIp+1yuCVqfwaym@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5IH3xfY4uW1ezTO4f84LFgq5B5393LIp15kvGdvjGFbNHqwZu
	m8IMeqRqfrFVUGJ+dLwNPUvPTaXP+qhnuiv3mshg5oQpA/HJQGm+3qn1N4N7z+y9WZGQ+R8Klao
	M9soK6p1Og15aVMnKoV4v9ea7yBGJPi8=
X-Gm-Gg: AeBDiett77n1oJ1At5sPVnPIz5+2IwmKbZwQ+TFp5UUyyfISDdAqqDci3D1YKDzJ0wZ
	LPtoYef2AuY32JqlJ8ouTf8j0OqfOFw/IO2UFXSr8oD4ukQKFumimd8kuWEv+crSHJ14HPAudIU
	hFsawlrf8TTFQEaW8uoLa0pd1LRqpT0O1z6gS0amTNmcIC0ApgDblwdG6ckqQVb+jkmr++oscRz
	eJg5zXqhc/gpaFzkPl0ZQvWNIYZrNjQIRx4BNnm2czJ1hJMmmsi7kVALqAi5vYzp96MoACAoUDd
	i+xSK0rlCKE3JVXLYibFSSOPeh+9KgluIC+2W+GrX8dA6Eztnj6dm5pa05bFB8HuK8LIU7M4XQE
	9csGdMeDGpLcz0m9mrq+vUcRAu+8iJEz3PRbLq8z0
X-Received: by 2002:a05:6808:198c:b0:45f:481c:e258 with SMTP id
 5614622812f47-4799c97f030mr7889576b6e.16.1776787889137; Tue, 21 Apr 2026
 09:11:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403111516.379795-1-josh.milas@gmail.com> <20260403111516.379795-5-josh.milas@gmail.com>
In-Reply-To: <20260403111516.379795-5-josh.milas@gmail.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 22 Apr 2026 00:11:17 +0800
X-Gm-Features: AQROBzBlh98NyBlEmbYmzw7vICUUUiwt5WFp1mPUvyil0G8EdaRkcbgAdW60Bs0
Message-ID: <CALbr=Lau_7eRDP5HCh5dQ5aXumvGKkNS4fX68d2CJp9ZjNxzDA@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] riscv64: dts: sophgo: add SG2000 dtsi
To: Joshua Milas <josh.milas@gmail.com>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	pjw@kernel.org, samuel.holland@sifive.com, unicorn_wang@outlook.com, 
	inochiama@gmail.com, daniel.lezcano@linaro.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com, 
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, dlan@kernel.org, 
	chao.wei@sophgo.com, anup@brainfault.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, michael.opdenacker@rootcommit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 7:16=E2=80=AFPM Joshua Milas <josh.milas@gmail.com> =
wrote:
>
> Adds sg2000.dtsi on the RISCV side.
>
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>

Tested-by: Gui-Dong Han <hanguidong02@gmail.com>
Reviewed-by: Gui-Dong Han <hanguidong02@gmail.com>

> ---
>  arch/riscv/boot/dts/sophgo/sg2000.dtsi | 53 ++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2000.dtsi b/arch/riscv/boot/dts=
/sophgo/sg2000.dtsi
> new file mode 100644
> index 0000000000000..412adacc00576
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2000.dtsi
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +#define SOC_PERIPHERAL_IRQ(nr) ((nr) + 16)
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
> +#include "cv180x-cpus.dtsi"
> +#include "cv180x.dtsi"
> +#include "cv181x.dtsi"
> +
> +/ {
> +       compatible =3D "sophgo,sg2000";
> +
> +       memory@80000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x80000000 0x10000000>;
> +       };
> +
> +       soc {
> +               interrupt-parent =3D <&plic>;
> +               dma-noncoherent;
> +
> +               pinctrl: pinctrl@3001000 {
> +                       compatible =3D "sophgo,sg2000-pinctrl";
> +                       reg =3D <0x03001000 0x1000>,
> +                             <0x05027000 0x1000>;
> +                       reg-names =3D "sys", "rtc";
> +               };
> +
> +               clk: clock-controller@3002000 {
> +                       compatible =3D "sophgo,sg2000-clk";
> +                       reg =3D <0x03002000 0x1000>;
> +                       clocks =3D <&osc>;
> +                       #clock-cells =3D <1>;
> +               };
> +
> +               plic: interrupt-controller@70000000 {
> +                       compatible =3D "sophgo,sg2000-plic", "thead,c900-=
plic";
> +                       reg =3D <0x70000000 0x4000000>;
> +                       interrupts-extended =3D <&cpu0_intc 11>, <&cpu0_i=
ntc 9>;
> +                       interrupt-controller;
> +                       #address-cells =3D <0>;
> +                       #interrupt-cells =3D <2>;
> +                       riscv,ndev =3D <101>;
> +               };
> +
> +               clint: timer@74000000 {
> +                       compatible =3D "sophgo,sg2000-clint", "thead,c900=
-clint";
> +                       reg =3D <0x74000000 0x10000>;
> +                       interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_in=
tc 7>;
> +               };
> +       };
> +};
> --
> 2.53.0
>
