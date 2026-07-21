Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0623B9604
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625269; cv=pass; b=Id2z35RucJNcARd4tcKU/tytg+Iq/BZ9RTymBzRFMDNhEknu3LHmqH9xPVdZrpSC41WodYH+yh4mBBnu+cjJJPNJZnlASdWgz23rxz0eMx5HJQEGp/TeUKv25v1KxoFygGZnacuneBGH74EPG5xc9lFa5pYB+eMS86xUKemgaQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625269; c=relaxed/simple;
	bh=jxUJpaNgkxoxX1of+Vq0hIIqoyhWOdU80zDaUZJLUtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B+LyaGa7GrRH6VmFYR3fh/HBqIXsQLGYa1pj21Miy5YyhjdOGEmdJ/oRGbpAYjOzaicIp/EnDDXtJVgZsQYRx5UXE0+pOSFeL9PUjzCwob9JqjYhItcC4b+5Wn54OmJ1RSX4JC/d8033FFHmAN/aUHr40M0eVgkcI9VybHNPrSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAaFUscT; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAaFUscT"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1671ec8692so735183166b.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784625266; cv=none;
        d=google.com; s=arc-20260327;
        b=AyTyOycK7U8VG+FfWUM2wT5o7oisuGaGhNCCihYgjc3eMbBjlEG57VH2r0KGiPno3A
         1Cnd56acJ8mXuzTHIkQpRoL47CrsH58vGwuUi0y3DtkbCCxUFxXXacKdpS7m/9KgF8b7
         yXfA3mlW6GyIJWXXcvxnHhUhKwhOC4HE1cGCtALqLcQW9stmQDvMb6Ntvz2ePWvyOuiF
         uQZ0/wIglKl3snNYoQpM00YO0y5oVxLWmMpB+V2JbBeb6XDnVh54Jslz6NjjBml2zDiQ
         TQcDuaHCgcgW/AbUygB8LmVbFyJ28amFs7IoMjkilW1/rx9Vg0VkCl8OXofVsLx8PNUA
         BaCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jxUJpaNgkxoxX1of+Vq0hIIqoyhWOdU80zDaUZJLUtg=;
        fh=WQFfsTSYF8turIIPbmKOR9kogQh80SYA21KeN/Jutts=;
        b=a+5l5LqKPGbwx7A8yTT179PcQsCxCeOvCAr74G3YN//ehvLc7qyc2i/R5GMfBkXvj9
         +y/bIJw9FJ2l/SXSdgbb+/I3ySEFKk4L7kiaNhmk2LF1/J7sKK2gLUbKT3qI2yInAplS
         I6u887YiJBCTvT40Uie6t6lx7ciF4OGYvyIWajut08s+ebXxyE+JGDkjLZRB/+Hc4Srd
         M+OTBCPn6BJChZhmrvJq+lkqDaYIGtXwBIkUGmS/hnlDuQn6L6J5bmDvFyVDSAb5ozxp
         ADhA3xTc+p2bQyDFqxS0dgrwFqv9//dyohW4qmN1ZX6cOuSCjB0t15qbDMD1eMPz0kC+
         hlLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784625266; x=1785230066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jxUJpaNgkxoxX1of+Vq0hIIqoyhWOdU80zDaUZJLUtg=;
        b=UAaFUscT5Zdp8V2PNzIPyZXGCVP02IDJy3JbSXxCkyZbzvOC/CAZrPZbUbXjElGzPY
         KZJ5MHj4motvvHKCqPY4COZ7TdTork6TfUINTMfI9bUJF6ahkdOWDHF0Ua6x4LpiaJXZ
         E+dm2gc3dEedfvhuA/0I/PeoxZpXOL1Ired9A9zkJR5xpGf+fk9vU99R6fBt7jiI6BtQ
         RDqbsGGBPOkIhY60qW+dc7hwK2eHFqynC3GL0RgLn2/DzXdv236w8WecEH/iQ5xWyU2c
         dqBxIPLPVtEeYnfTs6GsGKGq6/bC2Ur0WX0X/23HmxQWzd35FmyLpgjgYmA27EHu6j/7
         aE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784625266; x=1785230066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxUJpaNgkxoxX1of+Vq0hIIqoyhWOdU80zDaUZJLUtg=;
        b=giCWevV0dgYq/Jhf3yqGwtHycqILw/7r2AfeU8Ox0QBjk9ernh4+teXj1idR+qiy9T
         icRq+SG6Id0NLEKWa0NVQm3f4OclECFxfZRv95xrln4pFEeJpawIf+gtHQdlKmXux85V
         HkovOGKqL/ocZR7PnIfR6AFB9HhyJLFC1xXjIbofo07XZ198sMaHbdafdrXfXgeM5Whz
         Y+2bSaeC0ubsH3kVdk5/qxyKMCBSmoH1lNumIhT2X3NarIxBu1NtFP2HuDjoh8uDb6ia
         45lpc28Te3P+7QaNeTcr9cC8rCpZDbQ/Gkb85DJxjcXiUfRBdQ+SEIn0ax75Ioiz/af2
         8xLw==
X-Forwarded-Encrypted: i=1; AHgh+RoSFZoFFSNPEzovJtdYj2WtzxUCvFMxXTpAtBNul8/TF4+gE3V0CHNdK3DAnUJ0XInn0e2ZNO/WlsVD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2pZVZZuAaE8yDntCZjYlFdWZCT5beI1xfRY9Fd1nUW6WjGnRO
	uiYAMgC9ZvlX03XTWh97cneZMf+u5CMvHlBySdoVfi/FtyUsf95wgbLm3UWIvsCjlkBu6h2grTB
	t1iZbMLBm+c4HWPL0uiVUret7WbaG078=
X-Gm-Gg: AfdE7cmnRajimPjjQpfhQB4hwZUgd8l790vp4KY199POnXcN3x3TFI2e47zhMEp8mE+
	49sDNgrXsH33kU5g1zah8V9CPi9BBj1DyLdYkptMdGhoPFcurxD9DLSeuYLrwKeFpX+4G1X5TEA
	mNUV4PGbNZDvFX6A6sTnlv//aAG/KeSrXamoWvNVd498DcNgy+M+X/2ABrhc4MmcQenRxlixmtC
	Ndhgp9NoNRk57qmBPkmFQ4+vMPUpu63QXLvdNirilisbPyCJL32OTvyHOYkhD9uLfG3SKX8MLwZ
	npEwGIUh
X-Received: by 2002:a17:907:9309:b0:c16:8cd0:c6b7 with SMTP id
 a640c23a62f3a-c16b46e2994mr968783466b.14.1784625266368; Tue, 21 Jul 2026
 02:14:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716173325.653164-1-a.shimko.dev@gmail.com>
 <20260716173325.653164-3-a.shimko.dev@gmail.com> <20260717173344.81F261F00A3A@smtp.kernel.org>
In-Reply-To: <20260717173344.81F261F00A3A@smtp.kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 21 Jul 2026 12:14:14 +0300
X-Gm-Features: AUfX_my2iLa_MdkLxTrmaGRe3Cxwt7-lD70kzqKaGy7k8URbIw76tvXSuk8ebPk
Message-ID: <CAOPX747aYkoi_aE+tkpsyRsd9BDeAE9LKyYPnE1tMkjeu7vhWw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] net: phy: add DAPU Telecom DAP8211R(I)
 Gigabit Ethernet PHY driver
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 17, 2026 at 8:33=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> [Severity: High]
> Does declaring val as u16 truncate negative error codes returned by
> dap8211r_read_ext() during polling?
>
> If dap8211r_read_ext() returns a negative error like -EIO, the truncated
> value will still have its high bit set, which might cause the polling
> loop below to exit early and falsely report success.
Thank you, it will be fixed.

> [Severity: High]
> If the rx-internal-delay-ps property is missing and the interface mode is
> PHY_INTERFACE_MODE_RGMII_TXID, does this fallback logic incorrectly apply
> the default delay (DAP8211R_DEFAULT_DEL_SEL) to the RX path?
>
> For RGMII_TXID, should the RX delay instead be 0?

> [Severity: High]
> Similarly, if tx-internal-delay-ps is missing and the interface mode is
> PHY_INTERFACE_MODE_RGMII_RXID, will this incorrectly apply the default de=
lay
> to the TX path when it should be 0?
Agree, both cases are my fail.

> [Severity: High]
> Is the RGMII configuration written to the PHY after the software reset
> completes?
Thank you for catching this. The RGMII configuration must be written
before triggering the software reset so that the reset applies the new
settings. I'll reorder it to:
1. Write RGMII configuration
2. Software reset
3. Wait for reset self-clear
--
Best regards,
Artem
