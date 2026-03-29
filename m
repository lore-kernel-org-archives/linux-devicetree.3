Received: from buffalo.birch.relay.mailchannels.net (buffalo.birch.relay.mailchannels.net [23.83.209.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CB22F12D4;
	Sun, 29 Mar 2026 21:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774820271; cv=pass; b=UdUTsbMMfaGCFtrL5/laWXwJwX2m51J50c5jSJgCUxsJJEX+FlKKivCLQ7tLOpqZoQEqc5BFkb9W/KrJ4q9Xlb7yu8ImPVP6btKZhuapgOj2WXFDR46oZ13BS3AbbHS9VC26HkvdPMVBGbu0uqz/ptqxEGe2BKiecVRKpGSSVtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774820271; c=relaxed/simple;
	bh=a2KlTregbBCeGLpcEz7X+asDE9hwzE6/fbTCXrJVpkQ=;
	h=Message-ID:MIME-Version:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=oU3HbOSDplHACn8uWi9VXKfGq3F8RW7BPskjPFbctlGxckUSA7jRBYPlH+uEdwD4gHoHscLOiLZvd9qky2BURNrTRhs5WTlo4VOwc6EVVvKwa/yBa3DeO5f7fF2qfLKijTBv+nfcsxYw7NM8a6KGi6TWVYKUoiUIcFjAc1tUOqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=Oo38zP0i; arc=pass smtp.client-ip=23.83.209.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="Oo38zP0i"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 065928C1A10;
	Sun, 29 Mar 2026 20:21:38 +0000 (UTC)
Received: from de-fra-smtpout7.hostinger.io (trex-green-9.trex.outbound.svc.cluster.local [100.96.234.227])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 754D38C1D5F;
	Sun, 29 Mar 2026 20:21:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1774815697;
	b=VMwkMmkWwvO97AmeG9NVxJBewLhiskg4s9qLfbfnRnktpeFK6/M9binOCm/z6c/Oc8x0ZF
	6sMCkHe7OHs5sAQiQ9+PZHJ2T3fD09UwJWm9T6PM1o7q4/rNB6zHU8wLE2kzbVh7JUF8fd
	JXdADRqPtp7MTQWN64bOuG4kT3j+xriapFf2iKuLGQko7JDTr2cKlqrcCuvhrtTJY3gEY0
	12hQFKcPRBT950aaPTQgAhGraaRArVuc9OZ/czTcvc2GBYwY8fCqJ3hArPHURV9GbaPVYu
	z45z3+oAmEiEv6/1qUtmYCASjzfIJi+uB/Ew4ejZNg9TWT6y3tvdG8Uh9RoLeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1774815697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=GTT+0C4RGESjWdKuh5Sp+1h0pCrJm+O+8LsKG2eiHy4=;
	b=KpuRlvu+G+z/ihkV1vZgHlu6F1G3PIUNMIlGt820WImTuA8Y4LSfSG/zYk3InMacfM6x14
	2+KemZ1CjJmSLXBeE6oRsAq3yXVXO6ZrmMsZo53a+f36cn+ilSmzfysxPIFq3mSSbW97Gj
	wGS7WSGQpudUEOZxjzjwLAREvi9rTncOeIf5Ju8AOPSpHJt9EWquCkxq2OC5HFXudzXFdr
	rmyQNbAsW9ip2ekK1gVIKgyNNigX1Y+lh8FQbCE+p1do+EGCDXcgSyUuzwlD7YsoIx8bqT
	nZQNstLlr1wL/W4LhO8CfFyeENT9FAVEHqQJRtWf1wCT8/n7STlJm5DXdcLk3w==
ARC-Authentication-Results: i=1;
	rspamd-db964497c-ftdgs;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Reign-Grain: 41a1945735c5026e_1774815697815_1963226876
X-MC-Loop-Signature: 1774815697815:123364582
X-MC-Ingress-Time: 1774815697814
Received: from de-fra-smtpout7.hostinger.io (de-fra-smtpout7.hostinger.io
 [148.222.55.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.234.227 (trex/7.1.5);
	Sun, 29 Mar 2026 20:21:37 +0000
Received: from [IPV6:2001:861:4450:d360:ead3:9cb3:74f3:aa3d] (unknown [IPv6:2001:861:4450:d360:ead3:9cb3:74f3:aa3d])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fkQky3w0Qz3wln;
	Sun, 29 Mar 2026 20:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1774815691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GTT+0C4RGESjWdKuh5Sp+1h0pCrJm+O+8LsKG2eiHy4=;
	b=Oo38zP0iAM3Jre4Kk3fV5VwfSRkA3r4MhpQ9v3gvp+hdPPmyTGMvqRbXRo/yJkDjzYFpEG
	G+ABbKrfDok8JBvtmX3AUjUMD/W/AmJxpg90iC/aZktENTfFSnzrQ3FD9Mb28ljC3cQy/f
	HZURBmSnKx7ailhnJdzswpsBihGMrj7LLCmEDuxOAu6BS4VPvDf3Jv6syAXvX2XzV3hOV9
	uLsnj4SX39O7o/1aSO4zElVE6MUmP+HqcV2QNgu15wX9jTbWvHHLStb50/8ly9x64SfVPq
	o62iKP/M61QECvnBFlQYd4NcngkPGMI08bOW7kAL5QcPtvnrmW8S6fmj92+hLQ==
Message-ID: <11e7fcc9-c8dd-4bf5-a600-3d130407bb82@rootcommit.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, hanguidong02@gmail.com
Subject: Re: [PATCH v4 2/5] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
To: Joshua Milas <josh.milas@gmail.com>, tglx@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org,
 samuel.holland@sifive.com, unicorn_wang@outlook.com, inochiama@gmail.com,
 daniel.lezcano@linaro.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, liujingqi@lanxincomputing.com, alexander.sverdlin@gmail.com,
 rabenda.cn@gmail.com, dlan@kernel.org, chao.wei@sophgo.com,
 anup@brainfault.org
References: <20260328173450.219664-1-josh.milas@gmail.com>
 <20260328173450.219664-3-josh.milas@gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
In-Reply-To: <20260328173450.219664-3-josh.milas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Sun, 29 Mar 2026 20:21:30 +0000 (UTC)
X-CM-Envelope: MS4xfGWBeS4HaIIbYUVeHIpwUThPv/HDm18miWCY/sSEUY2R6jsqziGdG8060qerCh1EaXbzH+5FvijtrYgH93cSQOJiT8QF/edNygNivc587K3POZOMLZe5 Jo4jDnr8ELIErEZAhKsQgMZmLt9YcA1Du9ncDaCihPLvqLwU/9ikhGRxd3BLp1sfmo5pourlDWH2W1RQcd5H3wtb2LM8lhxF/IX2ncRk4gDUO/8LmYDOZ+8z ZXwLIudLGFY8NWcC9Siq7uigjOoUxpodbbka6r1XDqWbpDPDHgaDL2gvr6tpVS56uv6HxjSoUBz4Rljww8zJNI4cCnnUb5w4O/B4dq0s5GMixgov+ZaksS6t YEAHOUSSyAz0fwD/TJuuozxrE6UmrCW7ID3kx/tfw0iJsL9A0FQ8NdhXxzRM8u1lAIS19lznWkBHGYBp4FC3dwQwzWRyWpnjbB3wie/Uup0d+inPmBIPvlh2 NIebAlrVSkotvjjWE6HuItwmkNaYiuI+1ofZMk2YYTRR8Aoi6UnXu2u+FtwjWBfj4Pg8DAvyLgwEhjKayKFHKknOg+UFGeD5FOiKJg3MdtcBl7SMVuoZ02Bz b+k/9eYWhmZfa9t7r6fvGKcTGuw4lWz8+xmkka3must0aQJAjxQS5xEvMfUO89TvmwAk3qo4rnH0zX2KHV40kriZd9Oz/VhgYj5R8MkMuUNGiFnjnQ2U4jP1 8zamUfqnhawddvFCDSAbA3DYTIUW+D4KbRr6BoH3Jy+WyAl2Y3jRmU0t7tQxiie3DdVPJr8qjPNQMalFM4T1Lf+GG6sVG8x7w2s3l1VTsq+LnZxEAUipGfjG I/2zjfwP4exSP4F6ISbnHNeysMGWD3FKtSPb4mIUxWM7G/1p21knhYMpsLU5vdsTDooXHdbHWIedYZ2xcdNTujn30Pu5dWO/+WlSrmNAdqUlZUtlNSPxwrCY b3rDFghcXj9wCqh
 Ov+Kg7SJWr1n7G6AocPbpdMwAu7BQbJzJ0LkCUBTAhLEc6UWN3/dDsO07LWHrH9CuAvyrbloNmS5O8LCscj/3wCIwzoyOVr/FRZ1010tw FbeOBfof1DnDRuI1M/okZhV+kyA6llCO8bHiGJmew3/vIADKZPqklb/A
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=69c989cb a=FriOl7xEJMI/2lIB2BrE0g==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=YzZgpwwcAAAA:8 a=d70CFdQeAAAA:8 a=pGLkceISAAAA:8 a=-n5Tolqylb7eT0ueGtgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=diELbSsDbaqdzccPbx55:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com

Hi Joshua

Thanks a lot for this new update!

On 3/28/26 6:34 PM, Joshua Milas wrote:
> Adds initial arm64 support for the Milk-V Duo S board
> [1] making it possible to boot Linux to the command line.
>
> Link: https://milkv.io/duo-s [1]
>
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
...
> diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> new file mode 100644
> index 0000000000000..4ae44b40f9edb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
...
> +
> +&usb {
> +       dr_mode = "host";
> +       status = "okay";
> +};


You have a small checkpatch.pl issue here:

./scripts/checkpatch.pl *.patch
...
WARNING: please, no spaces at the start of a line
#120: FILE: arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts:82:
+       dr_mode = "host";$

WARNING: please, no spaces at the start of a line
#121: FILE: arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts:83:
+       status = "okay";$

Replace the spaces by a tab as in the other entries in the DTS and you 
should be fine.
Thanks again
Cheers
Michael.

-- 
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com

