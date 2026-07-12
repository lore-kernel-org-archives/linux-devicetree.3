Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931BA242D84
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 20:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783887408; cv=none; b=ZvtNF6Mw5Cdozff+1DrnOfGOLfBnOIOFGM9JI3Ja0c2NXwPpR0gI9sJiR3va6jQqcJTTFA3qLGCkgRSFh/tJc4Lua+fmfk91r9eeWAbd9zX4iaGqbwNiDgUTyYWhkopGfSs0LiQTPMcpchkPTbV5dN3qWonKPl1pf8PSGTVHgko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783887408; c=relaxed/simple;
	bh=3QLR3KK8Id6mI23Kry/sbc3hYjkLOFnlNehgggqEwkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiC+ZQIIBrx4aayB/XcZUaLDB1OioRcJUXswYiZ5srdOnw/4QttImEZvmbaOATbBC2qe0sp8FmkwWD1ESMwVJBwu5DXh0YosMgrLj8oYnV7zPSlhb/135SiEGQslOySaDLcVNNcen+vSH98W7U+xOBVgISoe6MFrBSgAM9b3l4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=WiNtvB6V; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="WiNtvB6V"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81e86df8987so24107237b3.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 13:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1783887404; x=1784492204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sexe2OJDiMkFGhURClJc1NsMoa58P5WaL0Byl520pbw=;
        b=WiNtvB6VOqUyBMNBFIfKB7RbXWlRSxzqtOwrhRon4lL7K8XxCApY+/SJ7ba0nxDLIC
         lozPBy/7nEqv41IuNdpht84WFu1S0SmgtopoWXtdShRV8szRnwKzHBNmVglVU7K5ODnv
         7CKt41No6cvWST0+1ZMlYjoy0auu+FWQVuYwlIHHkDlaBMfNQeNnYGiOWI1uMxieKrrq
         oFbyRt4MWZ5tpi8WVK1RWbYJHGCYwhflkKImif7K5Ez8TazAE/7L6Azb4RObxD947/nn
         GUnBSZ8ldoXcQLTNyufvy5bX4/Xsc7p6cwgKp1l6RUtUmnqHxzbvdL/QTSE3P2iupsY+
         NSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783887404; x=1784492204;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sexe2OJDiMkFGhURClJc1NsMoa58P5WaL0Byl520pbw=;
        b=i8H0K02Zn35kHrF8dRIt9vATs7I3mzZ3AocZL1h7OYH17YWWNZHZg2YPYPtZkCJoUr
         ZvURwJ54hK1SxlFwIw6cWT/uY3OuMUH1ktsx6xzocyHcPu0xnxm9efRwt5UxqguVc4C9
         3b/sqrC+t2fLDYWZG4Zlh2Yy4xG77Itg77bbY/GueubIj+9l9q9XTh48IKCyGjGgMVk9
         vlPy3k5xOPUrGE82R37aQ87pZiJy2oIKG9kAye5z14K1Rp+fJpYlXyeN9rNthWUDwS0+
         iNJ9yud+F3Pmx+CEg4Ikk0MbDF6A2sWDXWDpDV7eWoF6mr8b+ARE9bA9gIR2XAj0W5TB
         RiTA==
X-Forwarded-Encrypted: i=1; AHgh+Rpl9EyMdY1JyFGu321UWyBRSI71uFENF02AXmnNjSRqz/JCw3BJE4dOGku7ACFEWvIjf7CUE5Mc3fq3@vger.kernel.org
X-Gm-Message-State: AOJu0Yztv2xhljsOGXfNFa8lhi9DocMAgKyR70NLiFhGOvFKfTbzN8NC
	12MAeul0CxoB/Ra5QyE/Mm+AewhKlIFPpiRDIMTvwB2P7UsuYrIVKsZhMNeG0kZqYz0=
X-Gm-Gg: AfdE7ckJEpzyT0jSeYWH5h9mMNvnef+gwq426z7ZU7Lu3h/ESCoX3Y1zJNM3IIOAG1u
	kpe4LhD2BWuGdII+EWErwoUjnkZsLcOHnBGPSvEOorR152zACRhheiqykGxQjG+ovPcZuqJU+Ry
	G5DuiRaQ3CbzkyP9bgqIUbEWE0BAgOlSbxUTtmqdO4SFfYp8FWZINxhAz5crOaGhnj4CRECKf4r
	WcbEd0/il5AiNhFJBDQml/tJhDHXKTa4AIyGi4xtGDsPD/qDh/57b6ICiuNJ0N3nFqVT4PYzmIe
	XBFvqPaKNzb95TzexVAMXabT+zo8N6NcGTRrGGysB7lj3SPceo7nsoFtPdObIaEInB8BuyCE8vV
	G53cEBlEdDoJDZeBbSd9IYm0jWCsKgaPMn7QWHCVBAQ3p69KBJ97vjwR99ockVSttHX68PfL90X
	SOb/33r7HnCFSGbjCV1OsMj6Eu37a6pNsyaSHrWAFyjHlwlrqqvyRNTenhWhklMMjtMEAW
X-Received: by 2002:a05:690c:250a:b0:81e:68a2:89d5 with SMTP id 00721157ae682-81e901b3d89mr51627807b3.55.1783887404652;
        Sun, 12 Jul 2026 13:16:44 -0700 (PDT)
Received: from toolbox ([2600:1700:220:59e0:5e9b:73c6:ee82:165e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c1f11bbsm98699367b3.35.2026.07.12.13.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 13:16:43 -0700 (PDT)
Date: Sun, 12 Jul 2026 15:16:40 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] scsi: ufs: spacemit: k3: Add UFS Host Controller
 driver
Message-ID: <7x3b4sttnc4oxkuvxmpkihfi76lkapjcigo7khgcgfytvol7w2@v5ykuyrk2z3m>
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <20260702-08-k3-ufs-support-v1-2-1a64a3ab128f@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-08-k3-ufs-support-v1-2-1a64a3ab128f@kernel.org>

On Thu, Jul 02, 2026 at 02:31:36AM +0000, Yixun Lan wrote:
> SpacemiT K3 SoC consist of UFS (Universal Flash Storage) Host Controller
> which has features compatible with JEDEC UFS 2.2, MIPI UniPro v1.61 and
> M-PHY v3.0 standard.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/ufs/host/Kconfig        |  12 +
>  drivers/ufs/host/Makefile       |   1 +
>  drivers/ufs/host/ufs-spacemit.c | 931 ++++++++++++++++++++++++++++++++++++++++
>  drivers/ufs/host/ufs-spacemit.h |  90 ++++
>  4 files changed, 1034 insertions(+)
> 
> diff --git a/drivers/ufs/host/Kconfig b/drivers/ufs/host/Kconfig
> index ff170c0b6da0..4f53b7f7688f 100644
> --- a/drivers/ufs/host/Kconfig
> +++ b/drivers/ufs/host/Kconfig
> @@ -132,6 +132,18 @@ config SCSI_UFS_VARIABLE_SG_ENTRY_SIZE
>  	bool
>  	default y if SCSI_UFS_EXYNOS && SCSI_UFS_CRYPTO
>  
> +config SCSI_UFS_SPACEMIT
> +	tristate "SpacemiT UFS controller driver"
> +	depends on SCSI_UFSHCD_PLATFORM && ARCH_SPACEMIT

Can you add SCSI_UFSHCD_PLATFORM and SCSI_UFS_SPACEMIT as modules to
riscv defconfig (or just add the former and add a default y if
ARCH_SPACEMIT in this Kconfig entry). This will let defconfig kernels
to boot with persistant rootfs on these devices.

> 
> -- 
> 2.54.0
> 
