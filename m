Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793012904;
	b=L03wYQ5WtSiaJHBoEehSzTKQL3kUXtFFGOIfNycT8u6hp0EBtq8dDHHvroYQGPxp5JLY
	 2wcrtPZFVrnVL1FDUku+3tWjs1GtIZyJwWUDRDLgLLhL8mCNdAD6bNZPcLpAiKPejA1Ns
	 u3oArafGBuLq5Pt6HbSNlG81U/OKS1+1zUFZV1v4HPTCt0xk2PhIVyZTzrFoCI7xqK/+K
	 Wv2ftNNkRAzF7A2Wk0ZU0PR69b4INuUqToKC3RAJmEPrfEzo73lIV6tJM+caEYw6aHhu+
	 s1/uBPD0OPUexhQyNmZAtCY492R+81nYA5BMzyfvw5jgIo4B84EMdAG9rz8Ub1qwwFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tD0Lls83Il+mQLYthxWqSv/YIy5kSUrF6JCqhkv/8Wo=;
	b=RmJMiiYULONsohuuYzaKlLQn20BswUBTs2Otyedi3aqhYR8mgmEqcHvMHgxkG+8Ulg+9
	 RwOyjkwSBBrmhozjriZgOPBG2sJngUAsvUZt6b86tLFyIJ0zPzjPfB8oPmCA4e5gSQlDG
	 ErcSC4Vh7KWNUoDqQO0vAyAY1RpW6OiY7KFAff9xjNR3CkCasnIiBkwkA0STnqRfGPWAb
	 IdW8jv1W6QcMj+mKb7VtoSt+tj4mRUi/R96ynLYly9Lhdp9Lw3moyUvBldTHSo8To8yw0
	 Qxzacpf2Ia8wzeE4GdLiyZRbLKNesh7JTz4RY93z6Jgag8qfqfYsPHBHk5qn4fzzpDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kONUb3Ja;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED9D606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CED9D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kONUb3Ja
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b10d24345dso25041877b3.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 04:08:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793012903; cv=none;
        d=google.com; s=arc-20260327;
        b=TRO11OWx2x5C5GUbiarV6PzHVccRqnZs2ZYhvrDZj1Kj/p/LFIy/VOwQpJTamP8XSg
         QGcd7L5Bfz/qc8DDd/Roj711vRwwlKoAmg2fkC+giTzZ/NOaSzzxZQ4ijwGFvj5MlLZO
         FsNoPJ1pmR1rN4anbA1jm1JVp0vULIYdPw4PLOjEJMUgsvExaz8sJTuXscSTrKeWI1Vt
         +GnWTDuSA9udGHhxvNq4RHoPp6JoGNQ2qW2IYoo+YvmuEs6dWnSrmdFrxv40xpc0nq1j
         7QKjFwnzFowfTyBG7d6FiwzspMZQSVb6wMJSySerTYd+iwAGhO8kisBfpX9Z3Xw+KaUR
         pVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tD0Lls83Il+mQLYthxWqSv/YIy5kSUrF6JCqhkv/8Wo=;
        fh=0sHlc3cvXBzP3D86p3ycwqsc8UyUZadAillyKt4BMZA=;
        b=RHi6uA7+U+AbIoIpmdE4xwc4kw9eK01LnuUK5geDQ90upEJ9QkbaQ43nbwMWsIud87
         jvGo+mxlSRdIp0+kLnASDd//isVTyRVmPWXEhsWoblwwdE/aDyoLGOcJvZOgLQM5sG/4
         Eka+C+AeI72xDqEQDxAneX+L3UIrUM7gsiqD2DXiqPBrtr/1WG/6XeKNRW+Pt1PHbgbG
         udhpl9ghmrRA7BC5PQcMgdktusVXmx6vZCxldreTmYjcCVxT/hzEe1Mr+EDq58+oMZL+
         lcYh9QC+yJ54v55AxIsBR4auNJTydYysGDuB/2eaNHI9QGm97PqS5SEkzpC7rFrfU7We
         ANcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793012903; x=1793617703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tD0Lls83Il+mQLYthxWqSv/YIy5kSUrF6JCqhkv/8Wo=;
        b=kONUb3JaBAK8wTQDInDU2XWgyO/RAsHotSFSI+dVDyPZpSonRhgJrEBKOOJB0f/ACS
         GjuNp5TuITi8doe5+QUFouuGQMFX9KUmABCWw3a5061DJqSb4XaTr3slwiAGm7qFM2B6
         /HSRoilJ6rXUrydteijSi/P/hAGJWxp4VgHULYhcJnF0cXnQEFxl4FSy5N36o3+R+E/w
         bq5bhMruoyTlRYFBEoIjzGJQDxAIgXMkX6QAPPWFDrZskRhMmoGWXvegbA2wSlcrPfkk
         b9vSvK1GhSHnCSjfXCCSwd6uui2pzeXPvCUNOOG4s7TwwSnHN1gLxtrFEszwQk81LfP1
         9KYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012903; x=1793617703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tD0Lls83Il+mQLYthxWqSv/YIy5kSUrF6JCqhkv/8Wo=;
        b=w7++zf9auQ8d3lYlIG0W0vi+Vu2Wswwitnn8EHw8kGHxIewDDpDWeuEY9kkrdVQGRB
         CuDmGIQUO/t5/NzkHCN8a4xNf+w2IMTJtaPXoBZ4ZoRHUO/y7Li3jbx3FWEZJt25Jm3U
         X+Kf3Roj1WJa+nV9crWMaYpvPmfeuO+vGRk20HIZZJJ4cxmrThzCQVfw4CoP4c2Zr/n4
         JSXFWeNGBB74LFB8gfoF2Fe8E4qCsUZPRzBQ12/5rWOdmOA/vuEG1xnaZVi2L5KAp0WV
         ugnK9FsG8frRWMnHxYDz2ec2CAkE7c6DkGgJ8KU45Sa1uFdtxWIHZQWHUIJ0gY7dZMql
         EIuw==
X-Forwarded-Encrypted: i=1; AKwUvByyJqXHjHrGQd9hdz4uu0Q/kTFhPnvybHM5tW6r/ZUKSuh8dm+JrmvwNCbK7KWpONT0mhZ9QZllmD2Q@vger.kernel.org
X-Gm-Message-State: AFq9FYL2XBfDcvJnXDXvNN3aJlTcBJ5qiAJFLXVTutdNcRfCiVwg1tHS
	z2YsSzUL27A5i1CEOBalFTTvG15mx0MwN0G88JZfD/xPFMLyN73qLxgRBxgRk42IQCen6veplT9
	O+5O4kqvTSO/8KGy1SkDO11HJXPD+5S0=
X-Gm-Gg: AYBFou3k/YvekYuQVvDwFSfBaNARqqCsKejY3nZ0iyqdnIWgEYctOIpjgu9Swdp9zVT
	pXARwMYCe/pmkLgMb6m8dEm0oL7dfMJGa+Qvy3iNZO30la5v0qq4soOOFsoOdwp8zp/+GjSHJsU
	j6e+h4LbEqWetFTlMNHqudZs2BfQWJmIciUgkhZtT/k4drXBH6eYneWAoycenh8MGyQ/WuHx8Tj
	mEfPJdSG6R58Ccnk+zjSiVbqJu3HZbU0SWIsN1HqlB99cvkPBf9X6503Q/Uobl7/bfzdPbVIeNK
	jAC2kxIBUFW/nX2+JUmk3ZiXpJ6201y+EoDZRV61n8DCnnnoxXEBVLzbKd1Vt6E3ksb5c16E8H7
	gU4C/3ljz3+Nn53NOJvrcRV6/85ExJ/Vl1GBsPw==
X-Received: by 2002:a05:690c:c50e:b0:8aa:148:7706 with SMTP id
 00721157ae682-8b1669caf65mr45460507b3.8.1793012902608; Mon, 26 Oct 2026
 04:08:22 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAD_a9macSzuBsmmoLu2Cu1doLADvcpASFi-6ADnOvmMdgDEfHA@mail.gmail.com>
In-Reply-To: <CAD_a9macSzuBsmmoLu2Cu1doLADvcpASFi-6ADnOvmMdgDEfHA@mail.gmail.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 26 Oct 2026 16:38:11 +0530
X-Gm-Features: AclHuK8Cpr6C86Ogdt3iNPcZespgzJH98h_TGBqL0O48_bvZRHN6DW3ckIu6Ds0
Message-ID: <CAMFFDGgygzu3OdFkq6+ztZOzaFMMTdYFqtkvmOtHNovQvabXQA@mail.gmail.com>
Subject: Re: [OpenBMC] Guidance on Getting Started with OpenBMC and Choosing a
 Development Board
To: KAVYA M M <kavyamadarsh@gmail.com>
Cc: openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org, 
	andrew@codeconstruct.com.au, changhuang.liang@starfivetech.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Jani Nikula <jani.nikula@intel.com>, 
	Vitaly Lubart <lubvital@gmail.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Usyskin <alexander.usyskin@intel.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Breno Leitao <leitao@debian.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	James Morse <james.morse@arm.com>, Paolo Abeni <pabeni@redhat.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, Dave Penkler <dpenkler@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Dan Williams <djbw@kernel.org>, 
	Mukesh Rathor <mrathor@linux.microsoft.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Alexandra Winter <wintera@linux.ibm.com>, Julian Braha <julianbraha@gmail.com>, 
	Karthikeyan KS <karthiproffesional@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>, 
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Oskar Senft <osk@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kavya,

Thanks for sharing your platform details and starting a separate thread.

I am also Working On OpenBMC through ASRock Rack B650D4U enablement.
My work is still in progress, and I have not worked on the Gigabyte
MZ32-AR0 or evaluated development boards within your budget, so I
cannot recommend a specific platform confidently.

For the vendor-restricted shell, I would suggest contacting Gigabyte
support about supported debugging access and recovery procedures.

My practical recovery experience is limited to the ASRock Rack B650D4U
that I am currently working on. I use a CH341A external SPI flash
programmer for BMC firmware recovery.

I have not worked on the Gigabyte MZ32-AR0, so I cannot confirm its
recovery procedure or programmer compatibility. Please verify the
flash device, required voltage, and board-specific recovery
instructions before attempting external programming.

On Mon, Oct 26, 2026 at 4:07=E2=80=AFPM KAVYA M M <kavyamadarsh@gmail.com> =
wrote:
>
> Hello OpenBMC Team,
>
> I am new to OpenBMC development and would appreciate your guidance on get=
ting started with developing and validating an OpenBMC image for a server p=
latform.
>
> I have a few general questions:
>
> 1. What hardware documentation is normally required to develop a reliable=
 OpenBMC image for a new motherboard? Are the user manual and BMC reference=
 schematic sufficient, or are the complete motherboard schematic and board-=
specific signal mappings essential?
> 2. If the original BMC firmware is available only as a binary and the mot=
herboard schematic is unavailable, what is the recommended approach for ide=
ntifying the hardware configuration and developing the initial image?
> 3. Which existing OpenBMC reference platforms are suitable for beginners =
who want to learn the Yocto/BitBake build system, device trees, machine con=
figuration, sensor integration, and required services?
> 4. Which hardware platforms provide good support for testing sensor monit=
oring, fan PWM/tachometer control, Redfish, GPIO, host power control, and p=
ower sequencing?
> 5. Which functions can be tested in QEMU, and what hardware documentation=
 and recovery facilities are necessary before proceeding with physical-boar=
d testing?
>
> Request for Guidance on Restricted BMC SSH Access
>
> I would also like to understand how to access the underlying Linux shell =
on a BMC when SSH access is restricted by the vendor firmware.
>
> For example, some BMCs provide SSH access but expose only a restricted in=
terface, such as SMASH-CLP, instead of a standard Linux shell. In such case=
s, what is the recommended and authorized method for accessing the underlyi=
ng Linux environment for debugging, inspecting system configuration, and un=
derstanding the running services?
>
> Are there standard OpenBMC debugging methods or configuration options for=
 enabling SSH shell access during development? If access is restricted by t=
he vendor firmware, what documentation or permissions would be required to =
investigate this further?
>
> My current hardware
>
> I currently have access to a Gigabyte MZ32-AR0-00 motherboard with an ASP=
EED AST2500 BMC.
>
> I am considering using this board for my OpenBMC development. However, I =
do not have access to the complete motherboard schematic, and some board-sp=
ecific hardware mappings are difficult to confirm from the available docume=
ntation and original vendor firmware.
>
> I would appreciate your advice on whether this is a suitable platform for=
 learning and developing OpenBMC, or whether a different, better-documented=
 development platform would be a more practical starting point.
>
> Request for development-board recommendations
>
> My budget for purchasing a BMC development board is approximately =E2=82=
=B95,000=E2=80=93=E2=82=B910,000.
>
> Could you recommend a specific development board or server motherboard th=
at is affordable, well documented, and preferably has an existing upstream =
OpenBMC machine configuration?
>
> Ideally, I would like a platform that supports learning and testing:
>
> - OpenBMC image building using Yocto/BitBake.
> - Hardware sensor monitoring and integration.
> - Fan PWM/tachometer control and cooling failsafe behavior.
> - Redfish and other BMC management interfaces.
> - GPIO, host power control, and power sequencing.
> - QEMU-based software testing followed by physical-board validation.
>
> My preference is for a platform with an existing reference implementation=
, accessible hardware documentation, and a reliable firmware recovery metho=
d. Used development boards or server motherboards would also be suitable if=
 they are available within my budget.
>
> My goal is to choose the most practical platform, build and validate an i=
nitial OpenBMC image, and gradually learn the hardware integration process =
before attempting to flash a physical BMC.
>
> I would be grateful for any recommendations on suitable hardware, existin=
g reference platforms, documentation, or practical guidance from developers=
 experienced in OpenBMC platform development.
>
> Thank you for your time and support.
>
> Best regards,
> Kavya M M
