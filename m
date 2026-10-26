Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792993135;
	b=jRYF5RvPqTJzc5ATpG9eBvXcFIPBAhbHqgybl7TRscTgipuZgO5eTTZbBtDnfyD4dbzC
	 N2pKkjkUx4oQ6fFWPGrnC+nI9UX1l9z7pc8aES78YsmO35n5PKIKn0/jIWhJXlgAZahXQ
	 /TkGINjA5nS3uI8DvLsOuBRo9Cl53qbMqJDuPyO7XeqVb0yp7f3ePKnx4DnS3v6XT7mU+
	 KxnZV89I25ih1gOIHt4jc+HoB1ehi6aMnYtOpvfHiESS9JmMsTFLuzzWCUTsiqnjsczXb
	 ORxwSGPH4nDAo01rQL0gml86CkIlRmOcOR5v+PzKcVZsPAtnqrtWzzh5XvCWCkxuBDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=KRC9z7Hf6UT0/DB2ko9R8MQynM5giNRybmjOpJEixmM=;
	b=o3HNyGc3HZdNg+HPyVkSqOH4CPu7pRe2gBLkIXGFfX0ow0m4wd0SEm4xLUKNeSXb8JGb
	 HAD9U5h885UBSt1Swy7kwuky5JgvapkrWCzROhDgtUSSk0vTZXIs49SU9YZkETF9oi8gH
	 i/hfVehLjzp/V47c0hKOe4f/fJyd0K+7ABVyjs3n8o/9oviaScvpZ82XO99NmmvqmrasS
	 Whhf+FxCM3Jnyst8aoO7pk4jwaDFSrKE3xEjsevb5IU2V8n9Wf35gSgLzRZDaMn/kuXtN
	 VPkqtFAX6byRjM1S67xkiupceHXo842KIVzglzU2OFqh9cIO4VfTu2GhaQoaZn74L6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h8cwqi9W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BF6606A32D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 05:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6BF6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h8cwqi9W
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so3376152a12.2
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 22:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792993133; cv=none;
        d=google.com; s=arc-20260327;
        b=dlyVUlK+Jq3jZ3VKO00WbnD/qNNKryJTQe6SvfyvNnm9/dVnyTFcf7VeR2PdqaC1dE
         KE6Q8bKBrV/tIMkiT9Tt4WQmTuoKJNTSxRu2yPNnjXFhBts3duN5i5aEF5j7/lL6wPpA
         ZUcLjKlg83yzcX/qDQ6xS3/gaTmyP8NCaTiY6BOlF3eRc+RdvlSoe318wKY+PaMOgxe7
         Mt7kPpWJmOvTI0WdE7pwfcqCtmBWJQkecC/Ayuofj0GJ8cH/8ZrGD/oReh3JMR7yJoq+
         PPfuN4ghxllOvPUjg8b6PWa2Oqw3YUnGqIcDBDYPIo3v6Up9znzF9z/EVgJFfmFr/lMA
         DpqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KRC9z7Hf6UT0/DB2ko9R8MQynM5giNRybmjOpJEixmM=;
        fh=at5jQpaijociT0nku/icBpluzQM5/gOJPpOgY/Ct5L8=;
        b=sbdUghu8K3H4uU6JkzUbA18WeF2zuVhjbCHzglJn9GFYbrn2aJT+2ElTHq2o8JkzU8
         9el85hZ2w1gWS4IOWfU0ScFdEd/FURxfoPsRYxXtpGdSpriqxpuzM7k1/n0GzfZEsxQi
         3yBeRe9LVWBk/7s68YK53CdDLkKhy+BMc5zu2ZBKbioyQNFYQNqoA1Ydc3T/I87HHVvW
         FswHtGaX5604onJl9wdtzf6nI90hFVd2YHYfCUREcAwbHah3catDvuKziUG+7GMeeyMt
         U4kZ3vn3GO/UQARkxDm464ovtpDDg8bEKj41A0uuUZt9XASM6PMG6EuiBhLFRlIi5Zju
         Aq8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993133; x=1793597933; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRC9z7Hf6UT0/DB2ko9R8MQynM5giNRybmjOpJEixmM=;
        b=h8cwqi9WjlJSAGSKlKfOTcAaAxe0tfDFqa0Gsvz/Ndbe1JCZRvUVXa5DCTLIQ9NurI
         QsCFc2vC1jnTzzDdB70Ldr8nslkMRgebFxlEZUEi2B2fbFVEuR5T+HrDekjewqQ1YyDj
         D+LspUaRacgvWOb5usMfUhg4cv1Q+abRzNv8AGeAa2qO/o5NR2nBLsZ+NYk1VCAueEU/
         YXRzTQmtF4M5yTOLJM7VDQ9CPhz2/VB6830idnQg1ppI+QKcJ6IHU02BlOHuVG737+p+
         gl3lGAkBUAblr6szfDi6RidfGiukhRUisqKezznLGez2ZRQ1+7U55BqvrjLj8quk+d4d
         Gmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993133; x=1793597933;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KRC9z7Hf6UT0/DB2ko9R8MQynM5giNRybmjOpJEixmM=;
        b=2yFPZFtcj4yzWO3qSX/TnviEu4z69j4JBEqDacXvsPeCGUQ9xEZUnWxgFnUnZVO0Gl
         wiWQw3HFpW/MeX24UOOWit8b3ysaCTzVpoiNcNyESEfcEhfphnAiDtNy1+S6Yrku03Y3
         qUt9uJ1tW/CQ8ZhwJT12jVs4T0fMvrq5ZRmUKfiAoheNupWZdpeqkIo4jQK6FCEtINTa
         oFym6ydtXSDkL3M62O07yisMgfz2bn6IMqVI/80JxPexUbKZQiup5E0aU6DKyOU8yrqa
         3yAG6mnwAukFZ59ffn0SwBnSdHe1ZXbm/gXNFqdT/mL30fqYMpLRsCLjX5HWzwT/yKCJ
         nS9w==
X-Forwarded-Encrypted: i=1; AKwUvBxHhpQPUAPcyYdwxQ2XDszQywHRr1/8TgRlp0CNSmDsuk1hP9q816rmOiIMnXVsIslp/JJ0n7IgyPDU@vger.kernel.org
X-Gm-Message-State: AFq9FYK7GyL0CIXAaSLwZlxIfLfx99Bd1IQSn2vPQVzVize/UTf5nA2S
	OQj5ELhXtTAiHP8pS7gm/kRLTCwhJBUslOQo8beHi6msbvMhospZsKzGO/rb/mPfMeIZh7TGj1Q
	x7xveHgqFN1bXXGuoAWikdDrlgx9FOxs=
X-Gm-Gg: AYBFou1/QvQotDxJ9FWmjVWrpPmM+hfKzzk23qGLUoMdOq363q7HNgb79fsn9ucTj7D
	fpzVnKRQfiIsA/Jd7VsIzrSl/iX4YTEb4EHpqBL44xzWE+TnRw7cs9p6wCPGz6igeTM8oK0s03O
	PaNEC9Yy6l5PkxxIdO3L4T3po54EdmWiUHVgor5DGPQ9AnhCY+9SmIb1U86ViIo5HP+FGtJ+gGk
	s16SFBSVu8YcETC8ESE0S7GLD3NCupOjS9RUjEK+B483bubceMxYyAddDxdtIzenk2kDEB/6R3W
	fPOlO/Qnb7kdmCb6U/MXDPs97pw9lRR9hOcJwsHCDvJM4ppJ+lit35fmjpKMfRYFYqQMtjjvGvi
	SBQI2QfZUlp0JMhylbk6XgP9jWdCeGRm/6RQ=
X-Received: by 2002:a05:6402:5630:b0:6aa:1112:62f2 with SMTP id
 4fb4d7f45d1cf-6b442fcb0b1mr5488509a12.15.1792993133095; Sun, 25 Oct 2026
 22:38:53 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
 <20261024092558.143621-2-alan.tseng.cs@gmail.com> <CANAwSgQ=Djw_o89MgvEsmKVxuNiE3Yuy=e0T5DcLfqCYy6eWMw@mail.gmail.com>
 <20261025130206.187282-1-alan.tseng.cs@gmail.com>
In-Reply-To: <20261025130206.187282-1-alan.tseng.cs@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 26 Oct 2026 11:08:36 +0530
X-Gm-Features: AclHuK9RjSFEksyS7-_jnVXSvRIxT2GkoKRYV9Xd_PqlQ07C_F6NfX7RJdwzzV4
Message-ID: <CANAwSgTiSiEfdLD7yUwcbFnXfRpnSNZu_GXLnQnXipc+ansnPQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC
 nodes bootph-pre-ram
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: dlan@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	e@freeshell.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hung-Chun,

On Sun, 25 Oct 2026 at 18:32, Hung-Chun Tseng <alan.tseng.cs@gmail.com> wrote:
>
> Hi Anand,
>
> On Sun, 25 Oct 2026 at 18:43, Anand Moon <linux.amoon@gmail.com> wrote:
> > Could you update the pinctrl and GPIO configurations, including all
> > necessary pin
> > assignments, to bring up the SD card, PCIe, and Ethernet nodes?
> >
> > Please ensure that the required bootph-pre-ram properties are applied
> > to the relevant
> > pinctrl, GPIO, and other dependent nodes wherever necessary for SD card boot and
> > SPL initialization.
>
> I'd like to keep this series to what is needed before DRAM is up.
> PCIe and Ethernet are not used in that phase, and their pinctrl-0
> entries are already in the board files.
>
> For the boot media, the BootROM has already set up the pins of the
> device it loaded the SPL from. U-Boot's spacemit_k1_defconfig does
> not enable SPL_PINCTRL or SPL_GPIO either, so the tags would have no
> user today. SD boot on a Milk-V Jupiter works without them.
>
It is partially working, but the current approach is not ideal.
I have made some driver and configuration changes to get it working on
my Banana Pi BPI-F3.

The main issue is that SPL_PINCTRL and SPL_GPIO support are required
for board bring-up,
but these options are currently missing from the U-Boot configuration.

Here is my u-boot logs with some debug prints.

[1] https://gist.github.com/moonlinux/a491bf56bfa914e4bf5f661635eefe9c

> E also asked on the cover letter to keep the BootROM part and the DRAM
> part apart, so I'd rather not widen it.
>
> > Additionally, could you update the regulator-name properties for
> > vdd_core, vdd_1v8,
> > and vdd_1v8_mmc?  On all the boards, the SPL code requires these regulator names
> > to locate and enable the corresponding regulators during early boot.
>
> These names come from the U-Boot SPL code, not from the board
> schematics, and U-Boot already sets them in
> arch/riscv/dts/k1-bananapi-f3-u-boot.dtsi and k1-musepi-pro-u-boot.dtsi.
> I think that is the right place for them.
>
I have made some changes while integrating this patch series into U-Boot.
I am following the approach used in configs/starfive_visionfive2_defconfig
to keep arch/riscv/dts/spacemit-k1-u-boot.dtsi as minimal and generic
as possible,
focusing only on the essential SPL bring-up requirements.

> > I am verifying the changes against the existing U-Boot board device
> > tree and configuration to ensure
> > that SD card, eMMC, PCIe, and Ethernet initialization work correctly.
>
> Thanks for testing. Please let me know how it goes.

The goal is to move most board bring-up configuration into the
upstream device tree,
allowing each board to enable its peripherals using the existing
upstream configuration.
Once this patch series is merged into U-Boot's dts/upstream/, we can
keep the board-specific
configuration minimal, avoid duplication, and reduce the maintenance burden.

>
> Thanks,
> Hung-Chun

Thanks
-Anand
