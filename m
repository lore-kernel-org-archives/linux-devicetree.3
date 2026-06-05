Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA9F4D8D92
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 11:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780660518; cv=pass; b=b0xtLGVGfUKjhuJbJWQcammCBL3Ejx5XKyankWdolScj5xLuWXMqWUk81vlktaHmNAjH8TVxOpHZh+OBmO0q+R9PPEWc6O/0VoOnv84PDuP69JTOSCs2UsuZRXulPuqnUZ0ZjkPcgxe1RDJcX/Ednbg8PnZ/RO44rMkPrSk9G/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780660518; c=relaxed/simple;
	bh=yAV2IqFZk0cBvmTqD1yhsCjtpJ5DzXtfK4LNoJf4AHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tc7CkwV+n0RN02OYChKte0v3m5TrcNr/hKF+D8M46XG1vcr4G65FXWsxDpHMLvPkL3VGPWN9QCZnaTpwuDNZgDFe7EjuhuR8TPP4vZdKIzjsVPOk7Qqf6jda6scs9tq9ygAbtnzKTR3V0YmX62Bybkk1L8e3k2LkE7jkBsl6nAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOiYAipi; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOiYAipi"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4908b92904fso21089975e9.0
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 04:55:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780660514; cv=none;
        d=google.com; s=arc-20240605;
        b=U0/ovBDn+lis9617/85gWI8dosxfqE8WiAcXrcrh74VTbvCUYG4swIC64PQJTtecRK
         3nQ7SWFI3pRMkfbFCat+fSIWZfMLpi6jQNUB7yal5LLpVfKMfEkWKulnLEjpYTlY9lpV
         sGDH4JWvaxZufewduF52fNio7W7jgPbmJFf7bp7uqeB2nWBDUdrKLBSIxncz68wlqjN+
         EviMVuzdCbzH335Fb4hOp8r7lmFM4/wC41Ft7lKCmRCuVOLwT5zdbFOEBvddzPqbmA2s
         hsTzydTUQTCgweXaJk3I8TQD8v6r/ednraWSOTS649JaSC9TiOILOU3a9Bv7Hr/ZHaHV
         wGCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=//GYdD1yw302I0yF7ELThPMAvwk15VF1Q6zXK20rZgU=;
        fh=uRfbaQL+AaI76rmU+2oFslc83Uu+NFRxaVk3Z7J+Bfc=;
        b=R4h4XiFbairDv4t98YGwxQ7VexXpsBH9cp7i/LmD5rNMFuMMN3iv1WXVoytjNnzwTE
         alStds72LX+9WDrUeGEKN0pzHqtgFSVDk6JitkRrNNZrWfk9haMURel6wwi86Y6MwWOz
         XFPdbh8Kjllsc54tTcxvTWd0STwzNclnUljyOAdRSyS45hVnKEvOyRRl8O0V/kcZuK3Y
         ftVh+3lEGkDQP+vL8O1xiApqOVJly+4rglJ9OE25JPHr0BBmhbrqEJmHksvEUz1lWTfa
         /BY+MD4jc4GqjsIM2bGnkYO9St22a7ZETUiULZlgY2jpeeEQCinv0TpNdJe5T//roDa4
         nDIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780660514; x=1781265314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//GYdD1yw302I0yF7ELThPMAvwk15VF1Q6zXK20rZgU=;
        b=rOiYAipiboBVsqdOJTkr5py9fojcBM6dvHDyQCrLMVanyH9xZq8xCfa2bteJn+LCAe
         9q3qAYB/48tTj/MIXofqJECKeY15EaM0jMx4GCBjuSC37tnaDViyw1J+HGOnta9kXtwz
         KZs/obvbgo1RdqQ67cp9DVDv0AfXO/AuNgov6kzKETEl1NVAtxrzGmvI1sC4gqO703g5
         nEG1MD5VvXddAwKfZP7eTrRGf8iVw95HVH9j0HbOVcfnsJErS3U42BnhBg0vQhsKMTGe
         sOmU4wGkb4BDCBMS4oFh/g0gZcx+YvH5qQQnbldqKjYBAmJfqHbcI2IITbF1aovmJIhY
         IMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780660514; x=1781265314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=//GYdD1yw302I0yF7ELThPMAvwk15VF1Q6zXK20rZgU=;
        b=K9/3r9AFp5yFdHVUmvZptFOXTUpRPzxnKab+DPha4D89YD/UR8KIxWtmZp/fkegr1+
         AX2YSW8lWRGtW+Cm2pud57IrR2IYChY5AL0N5pe8Urtwevwi4GjNnqcGfdN2x17XWmDA
         nzSO9UNVaZa7KZQyOaQQifQEXwP9HJUptPuGGS8zMrsRWzGOxta32oBp/9XQscNeEUEE
         1H4GkIrk99/TH4XZsQQuJKWUHU+crn7QeFzoAZTGrX6VE2PrxZu5d3EjVvxgk9+CBMhQ
         5yLUSk9xxrZSr1jvfTi+/DXV52bSCX7BOcJaVD2hA9Npg/b6iHryWf3ziUdaOVX7Ho1/
         ZODg==
X-Forwarded-Encrypted: i=1; AFNElJ99xWzVGqFKepvmXFmrCe9V23j+LqACbN3NxlyHfKfH67Cmnl9aiGCoMYv5pb2ufBIARGh+hQEFTqah@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8nwtDIaNKky74JVYirzIfcSkebuSs0Gpc1NY5KjOUBCRMnvkF
	mxzExTp+1J0fZS/jqujpToejzcXAdNkHL//i629rgpYFJ3RJ5YUFi3lp6B02meMiHzy3DL02u2c
	oTiqAiUaWaaaMTtZFBZ7/nFitoCCxsQw=
X-Gm-Gg: Acq92OH19DuR9+trXEJwnsjFylDd3caurRlkWR2ndhbpSfiG85ORpOALjOvu2Rb9x/2
	wZl5G/VtCIwOMnRmh+byAHqIjHu84gvkVVK6Wnf7oi+CO+1FCmoZvEL+QJ9ZfrcL4bLCKCJJdCf
	9J+gCynoFVnFEQhRr+Z1YVr7dkELVCPal5GMxvmAoSJE4/7rlleBqli8Ct330aRBDgw+N57oO7B
	uBD/8YThv0BN8ute1B5D4XnTxYG9ZAzElGjeGWxM2FJA/Q9enRPw/BryWjb//FnEGch4thLGqK/
	jQlV7WsVd3BA79ti8R7+5I4mAmkwAPmNrj6GvahLBfgqaJsB1vXsXfejKb7kfQJdgypUXhk8Z38
	WBFA=
X-Received: by 2002:a05:600c:4fc9:b0:490:b8c0:d474 with SMTP id
 5b1f17b1804b1-490c25eee06mr49053305e9.14.1780660513812; Fri, 05 Jun 2026
 04:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602195019.1798126-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260602195019.1798126-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <50a908557bb3ce5f14b67396d1e73e70289a583a.camel@pengutronix.de>
In-Reply-To: <50a908557bb3ce5f14b67396d1e73e70289a583a.camel@pengutronix.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 5 Jun 2026 12:54:46 +0100
X-Gm-Features: AVVi8Cd2p_5wb21Ju7uN_UymgXZMavWTnmT2NoxOvQc6wSw-uyndN3rDgEYj9Gc
Message-ID: <CA+V-a8uGho2RMhreDgieOOZTggUALoF0bGyjdEEDvyL_75sAyw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] PCI: rzg3s-host: Use shared reset controls for
 power domain resets
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philipp,

Thank you for the review.

On Wed, Jun 3, 2026 at 9:16=E2=80=AFAM Philipp Zabel <p.zabel@pengutronix.d=
e> wrote:
>
> On Di, 2026-06-02 at 20:50 +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Switch to shared reset controls for PCIe power resets to prepare for
> > RZ/V2H(P) support. On this platform, multiple PCIe controllers share
> > the same reset line, requiring shared ownership of the reset control.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > ---
> > v3->v4:
> > - Added RB/TB tags.
> >
> > v2->v3:
> > - No change.
> >
> > v1->v2:
> > - Updated commit message.
> > ---
> >  drivers/pci/controller/pcie-rzg3s-host.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/con=
troller/pcie-rzg3s-host.c
> > index d86e7516dcc2..a5192e4b58df 100644
> > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > @@ -1276,9 +1276,9 @@ static int rzg3s_pcie_resets_prepare_and_get(stru=
ct rzg3s_pcie_host *host)
> >       for (i =3D 0; i < data->num_cfg_resets; i++)
> >               host->cfg_resets[i].id =3D data->cfg_resets[i];
> >
> > -     ret =3D devm_reset_control_bulk_get_exclusive(host->dev,
> > -                                                 data->num_power_reset=
s,
> > -                                                 host->power_resets);
> > +     ret =3D devm_reset_control_bulk_get_shared(host->dev,
> > +                                              data->num_power_resets,
> > +                                              host->power_resets);
> >       if (ret)
> >               return ret;
> >
>
> I have a few questions about this.
>
> Can you move rzg3s_pcie_resets_prepare_and_get() and
> rzg3s_pcie_power_resets_deassert() up before setting
> RZG3S_SYSC_FUNC_ID_MODE and RZG3S_SYSC_FUNC_ID_RST_RSM_B in
> rzg3s_pcie_probe() without ill effect?
>
> Can you move rzg3s_pcie_power_resets_deassert() up before setting
> RZG3S_SYSC_FUNC_ID_MODE and RZG3S_SYSC_FUNC_ID_RST_RSM_B
> rzg3s_pcie_resume_noirq()?
>
> Those would have the same effect as the reset already being deasserted
> by the other controller.
>
Yes to both. I have reordered the sequences as suggested, and it works
perfectly without any ill effects.

The RZG3S_SYSC_FUNC_ID_MODE and RZG3S_SYSC_FUNC_ID_RST_RSM_B
properties configure registers belonging entirely to the System
Controller (SYSC) block, whereas the power reset "aresetn" belongs
directly to the PCIe 0/1 controllers.

> Is the "power-on" mentioned in the comment about the delay in
> rzg3s_pcie_power_resets_deassert() the same for both controllers or are
> they powered on individually? Specifically, when the first controller
> deasserts the resets during resume, is it guaranteed that the necessary
> delay has also passed for the second controller, which is resumed
> later?
>
Because "aresetn" is shared at the SoC silicon level, whichever
controller finishes its resume routine first handles the physical
de-assertion sequence and absorbs the 5ms fsleep() stabilization
penalty. When the second controller triggers its resume sequence, the
reset framework safely intercepts the request, increments the
deassert_count reference counter.

The delay is the same for both controllers. Since the reset is shared
between the controllers the one which comes up first adheres to the
delay and de-asserts. When the second one comes up it just waits for
the delay, and the de-assert operation doesn't happen (instead, the
counter gets incremented) because the reset is already de-asserted by
the first controller.

> Can the reset_control_bulk_assert(..., host->power_resets) be moved
> down past setting RZG3S_SYSC_FUNC_ID_RST_RSM_B in
> rzg3s_pcie_suspend_noirq() and in the rzg3s_pcie_resume_noirq() error
> path without issue? That would have the same effect as the reset still
> being held deasserted by the other controller.
>
Yes, as mentioned, RZG3S_SYSC_FUNC_ID_RST_RSM_B configures registers
in the system controller.

The only downside is that up until both controllers execute their
suspend routines, the reset line will remain in a de-asserted state.
However, this is expected behavior for a shared reset topology and
ensures neither controller disrupts the operational state of the other
during a power-down sequence.

Logs:
root@rzv2h-evk:~# lspci
0000:00:00.0 PCI bridge: Renesas Technology Corp. Device 003b
0000:01:00.0 Non-Volatile memory controller: YEESTOR Microelectronics
Co., Ltd Device ef25 (rev 01)
0001:00:00.0 PCI bridge: Renesas Technology Corp. Device 003b
0001:01:00.0 Non-Volatile memory controller: MAXIO Technology
(Hangzhou) Ltd. NVMe SSD Controller MAP1202 (DRAM-less) (rev 01)
root@rzv2h-evk:~#
root@rzv2h-evk:~#
root@rzv2h-evk:~#
root@rzv2h-evk:~# echo mem > /sys/power/state
[   56.187674] PM: suspend entry (s2idle)
[   56.192194] Filesystems sync: 0.000 seconds
[   56.203463] Freezing user space processes
[   56.210884] Freezing user space processes completed (elapsed 0.002 secon=
ds)
[   56.217890] OOM killer disabled.
[   56.221149] Freezing remaining freezable tasks
[   56.226901] Freezing remaining freezable tasks completed (elapsed
0.001 seconds)
[   56.234336] printk: Suspending console(s) (use no_console_suspend to deb=
ug)
[   56.281005] renesas-gbeth 15c40000.ethernet end1: Link is Down
[   56.281829] renesas-gbeth 15c30000.ethernet end0: Link is Down
[   63.409122] rzg3s-pcie-host 13400000.pcie: PCIe link status [0x110034e]
[   63.700160] rzg3s-pcie-host 13410000.pcie: PCIe link status [0x10030e]
[   63.915436] dwmac4: Master AXI performs fixed burst length
[   63.915549] renesas-gbeth 15c30000.ethernet end0: No Safety
Features support found
[   63.915681] renesas-gbeth 15c30000.ethernet end0: IEEE 1588-2008
Advanced Timestamp supported
[   63.915908] renesas-gbeth 15c30000.ethernet end0: configuring for
phy/rgmii-id link mode
[   63.924556] dwmac4: Master AXI performs fixed burst length
[   63.924659] renesas-gbeth 15c40000.ethernet end1: No Safety
Features support found
[   63.924778] renesas-gbeth 15c40000.ethernet end1: IEEE 1588-2008
Advanced Timestamp supported
[   63.924996] renesas-gbeth 15c40000.ethernet end1: configuring for
phy/rgmii-id link mode
[   63.936404] nvme nvme0: 4/0/0 default/read/poll queues
[   63.936559] nvme nvme1: 4/0/0 default/read/poll queues
[   63.937729] nvme nvme1: Ignoring bogus Namespace Identifiers
[   64.032789] OOM killer enabled.
[   64.036185] Restarting tasks: Starting
[   64.042572] Restarting tasks: Done
[   64.046083] random: crng reseeded on system resumption
[   64.051750] PM: suspend exit
root@rzv2h-evk:~#
root@rzv2h-evk:~# lspci[   66.985040] renesas-gbeth 15c30000.ethernet
end0: Link is Up - 1Gbps/Full - flow control rx/tx
[   66.985076] renesas-gbeth 15c40000.ethernet end1: Link is Up -
1Gbps/Full - flow control rx/tx

0000:00:00.0 PCI bridge: Renesas Technology Corp. Device 003b
0000:01:00.0 Non-Volatile memory controller: YEESTOR Microelectronics
Co., Ltd Device ef25 (rev 01)
0001:00:00.0 PCI bridge: Renesas Technology Corp. Device 003b
0001:01:00.0 Non-Volatile memory controller: MAXIO Technology
(Hangzhou) Ltd. NVMe SSD Controller MAP1202 (DRAM-less) (rev 01)
root@rzv2h-evk:~#

> The power_resets are initially deasserted in rzg3s_pcie_probe(), but
> never asserted in .remove. This unbalances the deassertion counter if
> one controller is unbound and rebound while the other still holds the
> reset requested, which would cause the reset to never be asserted
> during suspend.
>
Since this driver explicitly sets .suppress_bind_attrs =3D true in its
platform_driver structure, manual unbind and rebind operations are
completely disabled for this controller.

Cheers,
Prabhakar
