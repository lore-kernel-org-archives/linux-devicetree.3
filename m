Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003397;
	b=VSsLGfs1sa2xU59wUsUTcLKne8qhM2viKACv1etZmG+JoY7Leu6d5O20SoyrWLvE+vKB
	 RsrNEEP6GOhA+zd+DxnO9PetU/l3HaOSZf563Oq/2DN2M2B52YiV89u5poeZYJ4UJy5MO
	 yd8B2v1bRp7zQZT1sUwpFGE0p7CysTJWrIzDIPdRwXbFIfLwazXzNofuQIisdYjMpwScB
	 VRPZgJelbId/wjd0Xzl2gvHERegzRvN0u3ggCfEVWi85gUhWsHQgm3sWuS1GsAbat3J2o
	 4I+kOnNtyUOUS/wbTXVpV1UGkAXkLIx9/E78v6u+Az+wC9AQSZ5RV5zt51RdEy2Rtzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=diTjf1RR+6hk2NNUcDUFo32N0NHYnwNLtS5/2ivO+gA=;
	b=DmdxinPHgA73i8wa8R8VcLsdMQJ16FqCQC/62YjjW0es89o4g0Wyp36AfB4qJjI6eves
	 eWokX42LZuB2eFos2KYxBzK1H9ZkACvy/WMqmT8pv12ArqEGaub8P261grwjHwdfT+P0u
	 Eeo071DQVN4IbSgcK8OGx7xwymCEewxQ5OyjtYZjMTdpgCc30cEo8x3ecmOFCHp6L0+ng
	 aU/xtxitM93EWXKGiw2T/xuW/XRttnXvdUec4XMTT4EmgaLH+AWwseScQo+pFiXiS1ezW
	 OLtSyhNDXKmup5vF5TYEbiBoP4n5kK96ZB0c+UkcgIO0yaVGRarB8UMARZ/M7KaKiAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PcMnkS3+;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D1360A3833
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35D1360A3833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PcMnkS3+
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so16922585e9.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 01:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793003383; x=1793608183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=diTjf1RR+6hk2NNUcDUFo32N0NHYnwNLtS5/2ivO+gA=;
        b=PcMnkS3+1NI/veKUH1/vnspLlc/oWAZUCgaIafGPCeeW6eTHZMysPWywJphFM0LQxX
         DgoAnkzZ2VkLBFDDRJ0zTMUmKnxmRzpQSCgbqBtef0JUVFigno5cao78qS/lDcf354sF
         4alnfATnX1PteE042AsHWHLsarVg7hTlUe1SQbrVEvvC61PdMhJErhavalbJjUm9/DZ+
         W1Ee4YwO/T5jA+rToTbc6I28XkdoZ00yZXFfX7tBALX/CiqluKz8qKC9Nnwf1D/e8lN4
         cXXCM2LsKzE2GiLQq3DXrr1WK/ir3PZkoSC7xGYEWHTyvgr+yA5Hgbk4KYtE57MjysgJ
         96Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003383; x=1793608183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=diTjf1RR+6hk2NNUcDUFo32N0NHYnwNLtS5/2ivO+gA=;
        b=h6QxYKymSKa9Jpl9lLUYSuoYERUY8Xj4DsjLukBe9VxvAFvZ+YNkYij0lEmPw7Ef4Q
         7uNMDWui3vyVVxPHoNCRsCQBXQqhNYy6PuFPdtWGIpFlfKNiyQqEOSducLqnxTyKgo9m
         uO8q2m6WgISmWVoChxW0CzIgbTPqk7wYrRXKBpN842usbL8LR/pfp6TaL3yJiNl86sbL
         tgOEEdo2UKXo6UlJInOBzqjW5brH0qCg4+ObYX4d5S5zzMdbh3WhK1hqMbPlf3AxPzAV
         3dAgolWO0fhr8mV3n0ohp2E9z+HYgemIquOC92bktO5t8lN3QacrIuXGQni7ap9qXTa2
         FAlQ==
X-Gm-Message-State: AFq9FYLBZX13FN3JRwJB0Q8/JV1fO0UW4xCBxk7wV6IYGFW7exbx7ADn
	e80WuwQbFwx+fa0eghOd3Wr5/6M9GhWjQ3P77hwczoBJgfFzRaYemIBE
X-Gm-Gg: AYBFou2RSnZoT1XCpsVeCE64tWi++cmHtKYqxkQbuHykrRFD9RidRQ0l3ulfBQOaUb2
	kcz6Q2viukCW+NkzNbevbtsqigq9NvVE1qWCgqIgUuZliRJts5emruP0qm8BvRnH4WJDvpu2EgZ
	j2c5DQJyWeVNjIl5n6+OTWSlK89pkzMFHcSGQ4Ct7UVcYi9sQ50fXOmq/PBoVzDjJhjslAlHNrp
	Y0WXdJjgP/7UIwsrh8BZoI6nRN3DxsDpB0/ppfi4X0nUoZmgE4vO35OaMoFF8YlGrHFSEm4enJd
	WPnI5CSfvGUA/2hbHc3xgjGdTpv8MsofRCAkPJXI/uhTh124Qz/riS70Knb3MTQOuIQ1kKsycQD
	LyzadCEkIUDt+4G1XT7bQwTK7+Wxw6EDc55zECyFrgABEg4FtqBkTyPrWAMYMasBNOqo54S9ls+
	852ACYOJR+m+qOqaj5VPMOtvpa9TTC9m+xGemhXPvhr0yCq/qLbURFCS/NOlcICiUmqxM2oJGkW
	I2ENx3p6uh3b7XPV2bbsehOmDKQN7TcH9A0WmkBjCz4572Zfe5SZwJkM8HZTidT40+QRiZD4Fzd
	Ba3s2OqIGo/9cOJbaSPql08TmGQptM3vWJYJjfN0ORtFKG6Kvj3T+flRICfzQ10UsYzAI0gIaLb
	dR5QGOAA=
X-Received: by 2002:a05:600c:4f4f:b0:4a3:5a42:b29c with SMTP id 5b1f17b1804b1-4a35acbc00bmr116641935e9.26.1793003383367;
        Mon, 26 Oct 2026 01:29:43 -0700 (PDT)
Received: from GLaDOS.station ([187.13.216.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm178673445e9.2.2026.10.26.01.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:29:42 -0700 (PDT)
Date: Mon, 26 Oct 2026 09:29:39 +0100
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
Message-ID: <at8Pc9jDy0dX8Sr9@GLaDOS.station>
References: <20261023115242.11197-1-stefano.r@variscite.com>
 <att6GNZAVv64Rlnv@SMW015318>
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
In-Reply-To: <att6GNZAVv64Rlnv@SMW015318>

Hi Frank,

On Fri, Oct 23, 2026 at 10:15:36AM -0500, Frank Li wrote:
> >
> >   imx8mm-var-dart-2.2-sonata-1.4.dtb
> >     DART-MX8M Mini v2.2 on Sonata v1.4
> >
> > These are proposed names, assuming that the same DT correctly describes
> > all the hardware combinations covered by each entry.
> 
> If new boards 2.3 appear, do you plan change to
> imx8mm-var-dart-2.2-sonata-1.4-2.3.dtb?
> 
> Rename affect addtional problem or efforts when back port.

No, our intention is to keep the filename unchanged. For example,
imx8mm-var-dart-2.0-sonata-1.0.dtb would retain that name even if it
also supports later revisions, provided that the same description
remains correct for all previously supported hardware.

Regarding the filename itself, would it be acceptable to include both
the SoM and carrier hardware revisions, as in the example above?
Or is there a preferred upstream naming convention for distinguishing
these combinations? I have not found a clear example to follow where
both revisions are included in the filename.

We would introduce a separate DTS/DTB only when the hardware requires
a different description, sharing the common parts through .dtsi files.
Our preference is to distribute complete DTBs that the bootloader
can load directly.

> How about use boards compatible string? You add new compatible for new
> boards, so user know this dts cover which boards.

Could you give an example of how you would handle the root compatible
property when the same DTB is used unchanged on multiple revisions?

For instance, if SoM v2.0 and v2.1 on the same carrier can share exactly
the same DT, would you retain the existing board compatible, or
introduce revision-specific strings? How would those be represented
in the shared DTS?

Thanks,
Stefano
