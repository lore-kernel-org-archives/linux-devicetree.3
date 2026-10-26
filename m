Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793033993;
	b=yNz/lpZ4UWpF7LqdbeL7RmxUFlFuPMW511iVgX/O9eCuNuho45hbDPjx5dc4nT3/5NON
	 yFo6cjXTrgdEfNQjEJ6AHZh4sonMLavevtxQ1qCz+dAbdhV9t4Dbol5PCQdepOY+coNg8
	 VkfyyzTX+gH6Ns3wuA67717LLK3H2chpIB2p78/lA4/rFw9k4OEaQP2XJXxZg1ExnuEqN
	 UY8j1PZgBSteDkdpJ/zdOIa1e6gfnUBOjS51Fg2nJAVpW/I8zXZWmeMBYAFyzmvHFR2QM
	 ZZEcpu90mmD+v/AQAziWIYGSAyFrYDAW9wBW8y2F1J/3ZyfmmTt0BGYpojPIUa1lj2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793033993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=BBemIOG3KuKqxJ/h5u8qdNoWNATVBlUDjRGyS3stVBE=;
	b=RNPAz+lttpavnhCBu0uE6+YmGW2BkuvS89EEuMAqgFOJET/SM1Hwi8rqvE0QMj/MdpG6
	 StcT3HZWJ/d77xTu63E6IcRWiwV87QSitjHC3Cng0f4WkVXDSJ9veXeKGWQApqZfNS/Jf
	 4jJmMm/e87rtgF0dPB3604sh5LJZUV/hraVGzDu17B/Z5VgCoI2XuZ1D7mrRd/pnMDuvd
	 BjtKKOp5Wm4uoV3cNsuzQCFueJuwQjWLpI5BLuNpnQXLeqaAL32kwq6/C6nhR65dNMW1n
	 fERS8Gz3JU1FXhcj2WskiL89l7rkn5RdhXAlnQGsqdzxCH5qfkkWfXu5bYm7TiJk9xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k2ny8Cdc;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B261606A31D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 16:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B261606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k2ny8Cdc
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1771627f8f.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793033991; x=1793638791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BBemIOG3KuKqxJ/h5u8qdNoWNATVBlUDjRGyS3stVBE=;
        b=k2ny8Cdci/Gfik7Ch85wH8K+6mL8GOhgYviK3LJhLgd3LTBfX1YK6SVNa6einUEI2P
         jtVc+SSK8Cc+hT2pCWaI0B5AmGYm52RqY6IyHm0eqXq15mtWssqNEUvHUv/Rs3woEmPD
         p8HXUDJT0x0wolHqmycUbpfv5xclxTD6ty5MXj6SDSI/4y/iaIpI7/dlRuQi/dJkPxfS
         8lnvj+TilzE6NBALDsxKxXvSxLm0EDCPhpyX3GDbSrsEpfmcHNkQEIlNUIUquVtO6+Wf
         JqLaa18lZyJihgxgXdejsgv3HhVM/z3lbwlMbGNddGAMo/Batn5Pp7R0Ul/LM8J4tQMD
         NjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033991; x=1793638791;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BBemIOG3KuKqxJ/h5u8qdNoWNATVBlUDjRGyS3stVBE=;
        b=cfoLPPNF7Cbt1olbh9tPhyXCakmV5WOddRIBPvBIymFPad043cp6AuW8SXt09JaXl8
         0mbHvt+ge4I+Gw1kNYDgcgx8fYhyYVv2vTmSy1HeFV3e4W3TuojSs/xGs9YFvP2QNMSu
         s5JKoxm/TfmTv8vA8shiImyMzn4jITRym8r6auRD6caNgsGcZ5ze07h6mw/mJEuO7Xle
         NVkzRN8/NISWLjCS5dkDGdbe1F2Bh/aHVO415byWFzvFPxFy0ZEEBCoXT9BcTLRInq1o
         cdJkb7anASz5Bvb8qUjZtqBgbCg58P6Rk5Oba3iWLGBqwh88ROu9S52TABCQI/BJYJCf
         byig==
X-Gm-Message-State: AFq9FYI4sdmRQQT86fEi0KmDEYSrFW7in2UyOMj+tx6LGzMlDZIpQswW
	yz4Iah82F7VDw/MvBhDJvsMQ1R2+gAMR6GQPqZvteyfxIBKBVDHDc4RV
X-Gm-Gg: AYBFou1Dk0Enpq5/NSSKrmxvcJeklZ/yrvk4etcRDTyPodU9EUs54bt6Ufujn+4Jvgb
	RFXfpgYcHsB9DDimoBTVKm7Cr2eGIQRKwXixFAVNcsIX/T5xadNAcKVeZezH5kIBSlqFqnRlvUd
	9MW5jwvVYs81mkf807GsP7QTM4D7i8zyYlRN+I6t9ucj+guaE03+DOI5qlLkuWREcB1/+Fcw3ru
	dq+Xf6+2kotvsm51evJE4C9GH5Rn8sBVQr5aVKacO18mxGvVgpKvCMdel0tOVfeEYvNe9ty69lG
	alFndVwGloIMsr5zIHPSZHKOg7InKq1ZBnttolY1gS2hjZ5hYgjzrx2AnctqsUYqOX4jHKgq0mq
	Q1enhoiw+egNS60KnglvK5l9EquJrkOGh0YokesUIbsYXMC1uDm+aq5hsSdOV9zInLQ6ynEI2I0
	ywimXrzMy+jvQGH1hoeK06mE69dXNb6hbaEcZwBags+w3ZqRpRzzn5CrR/IDHhWkx322h9TX01X
	TlfNmvwKNv34JYtAPSil61IeStmSJnCcz2z9XALpkcVWk/WCnXfMZtYANwIoW1HFmwQyXJM+cv2
	iybg/GBI4198OIvZqvxpbDCT/3t4Q15JRmgPbM7ZjKLzxfBAp3xCAsnKw/yNExHi/iEGRw3DLal
	1Iu462A==
X-Received: by 2002:a05:6000:4021:b0:486:f42f:6860 with SMTP id ffacd0b85a97d-48e3eba4d70mr13645153f8f.56.1793033991164;
        Mon, 26 Oct 2026 09:59:51 -0700 (PDT)
Received: from GLaDOS.station ([187.13.216.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4bc5sm17405886f8f.34.2026.10.26.09.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:59:50 -0700 (PDT)
Date: Mon, 26 Oct 2026 17:59:47 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	Stefano Radaelli <stefano.r@variscite.com>,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	pierluigi.p@variscite.com, Nate.D@variscite.com,
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [RFC] arm64: dts: freescale: Supporting Variscite SoM and
 carrier revisions
Message-ID: <at-HA7K_cWub_arR@GLaDOS.station>
References: <20261023115242.11197-1-stefano.r@variscite.com>
 <att6GNZAVv64Rlnv@SMW015318>
 <at8Pc9jDy0dX8Sr9@GLaDOS.station>
 <at-BsPCwPGlpnuJ5@SMW015318>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <at-BsPCwPGlpnuJ5@SMW015318>

On Mon, Oct 26, 2026 at 11:37:04AM -0500, Frank Li wrote:
> 
> Is it for created dtb file? We generally doesn't finial results.
> 

I meant the source .dts filenames committed to the kernel tree,
as well as the resulting .dtb filenames.

Would a name such as imx8mm-var-dart-2.0-sonata-1.0.dts be acceptable
upstream, including both the SoM and carrier hardware revisions?
We would keep that filename unchanged when later compatible
revisions can use the same description.

> 
> It should be fine only if dts can be shared. It is okay to generate differe
> combination dtb file by using makefile.
> 

Thanks. Our proposed approach is to share the common and
revision-specific descriptions through .dtsi files, with small
top-level .dts files selecting the appropriate SoM/carrier
combination through includes. We would then list the corresponding
.dtb targets in the Makefile and compile them into complete DTBs
that the bootloader can load directly.

> 
> Yes, need revision-specific compatible string.
> 
> compatible = "SoM2.1-carrier-0.1", "SoMv2.0-carrier-0.2", ....
> 

Understood. When a new revision can share the existing description,
we would add its revision-specific compatible to the same DTS,
retain the existing strings, and update the corresponding binding.

For example, if SoM v2.1 on Sonata v1.0 can use the same description
as SoM v2.0 on Sonata v1.0, we would add the new compatible to the
existing DTS. The resulting DTB would continue to serve both
revisions under the same filename, provided that the description
and all declared compatibilities remain correct for both.

Thanks,
Stefano
