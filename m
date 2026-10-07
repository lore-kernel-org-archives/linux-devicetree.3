Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A290D448BB6
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365662; cv=none; b=AAba6vg5Rc24mpTd6w7mE9F1WiyZDoVPq1u8gg3P3WbOAtL3jLOGf0dqtMMh3u/HF/9/NloZ8/7ZsYoXkgW0+Kb2eaX0cX+Cx8sXFOW86dG+nplgof6lsH4/9zg3tKXG4GCeK8B22LFA3Qb+OPfF468SQz1rW7o7PBIbe19U1Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365662; c=relaxed/simple;
	bh=DEQoUozW/Cs8HCbMPzg7ZPhOKB0dfvcgpHAGzkIkN5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rHNkFZnF8CfhWHca9f8ukNNfc/r0s1OMCJzljfxjbRlCHpdb2ai28GKnPEJb1uvgROCQWOxywyhFE6mNFszRvDugfTYyaA/cnWZdbWSKe6vAeAwI5VfmjvhOorIh3dK/fHFMGNoCnvc0ODnkDvAJtU2vHBKhyrlEcBayRwq4mzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5hCY+Q1; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5hCY+Q1"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-98c8cbdb9daso327247241.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791365649; x=1791970449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DEQoUozW/Cs8HCbMPzg7ZPhOKB0dfvcgpHAGzkIkN5g=;
        b=T5hCY+Q1YMRifQtJNpwfpRHJrL96eu66NyO8k/fOU6xriMjkUVzewqsf+D9cDW+g2S
         y+Z1vlokkYNXulEAg5ZorFJ5Bsd3AKNI6pOR5grOajPc9/p7m1haNxusFKr5/SGG6qIW
         DuE7xac9VE4JG34//XrBq9thtiGBXDRKtWR6lPJNK+zgcaTFW5RmJdS6FC8pfXhyqvxc
         RoGCL7KD+kO+5VWDsidVJqE1tb7RzrrPhGuIVOmyd8CQhpui/9kakH6dgM+7hs826n0O
         fOhLVQ2hjPaPkjdJ3gupw+0hwXzH97/RcnF29X9h4OSOGcCzonsyE4kbsbJpqAQU87OX
         ymDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791365649; x=1791970449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DEQoUozW/Cs8HCbMPzg7ZPhOKB0dfvcgpHAGzkIkN5g=;
        b=APSqd5NtqkpaBqYe+k+zIgivLjpxBvPpbcpTd0xAheH8wPO4e1VUSOD7oKaq7WCuPo
         YSktorr7W3/FFzAhzIfZBuwiD0SFGser54BbMUIFvrKmK18wg5c5mA/LZhHlqxkt5Gim
         RHgH0uWLQS0BDefEvCswFfmxtCtcb7PzrOds2GFSCZk8i0tL2pBSag5jGAyCv8RDQVSQ
         l3AhBAfAefxgRen0qyzHaOzk8E2gTauGHSFvtVWnYAkA5C2IblH5JMedPIDQxPezsueW
         sMX7FAHRhXyZvCGd+Sp71CT/VeRWKkus8V0IyT7rSLP8XSWR0LGUAhf9ERrDO6F0ROZD
         0epw==
X-Forwarded-Encrypted: i=1; AKwUvBy43XndTKDwD29l50ffGfAK6eog/0I1dtIbluczH3uOhlVF5ntA1ikrppPXVgdt4s1vjo9EOFnIgsIg@vger.kernel.org
X-Gm-Message-State: AFq9FYKmNj6BpHO19O6YHHecg1stqzLPoqD40gOCiu5X+lUwahWDHkNt
	bjrfcSmfL/1rCMe22hc/QQQPB6NxT13oiynVobK9lTa5v5yWTyrYvSXU
X-Gm-Gg: AYBFou0UxQMxIvE7xdehsWsT9SDPE0QNC3NW7zGPjOySRi2DuR0tTUEen0LhJfz9mP/
	j806jP/bhXEuMuTdNBzRMkEcOisi44L45hq7O/mMApb6CN3Yee+zQxufhuv1/VTyDn9vPeBVjZz
	2PDTDe46hV52bgGgD1je2M9BSGwrJZXTWZ5+J6bBNQ8wvKVCmlpjYm74aJTX49lSCbxEeCBNUl6
	iwXyqq7e7nzESRSNO002LQrchKguYCMG/Ntg28Tgi2wVEfNk1HFlJ9sg0zSi9IbFvze0Qpkrqcm
	Nuv4NboJM1IaK+74uj1Lj7HBqA+5OOAvq5xC6RmsNsT05xpDmyMChXXbVrJ43SbPm9SEVDyn/Bq
	M1L2v8ecHWEzvbgdDToM7lBHfA9bF3Phiz4Okl/V83z+p+PJ2wpdT1ytP4AxsJr7Z0Xqoqpikib
	x95/A33YOd8UEfasRjxAyBuWmN2xd3aXukz5WmDQ1/s51W+QNqwcRwSitHtlvyufJQJO48+aTfP
	9HUuHfOEtmnOkLNBX9ilIV1b2CcIIeqz5zWCZ2go4aDcW27NfqGBbJNyppkxrBbo4IzMoTd6Rvp
	qLgKwtk=
X-Received: by 2002:a05:6102:2909:b0:7bd:732e:c615 with SMTP id ada2fe7eead31-7ca38e16ffamr456522137.26.1791365649209;
        Wed, 07 Oct 2026 02:34:09 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ca218138c6sm1319958137.12.2026.10.07.02.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:34:08 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: Re: [PATCH 3/3] serial: 8250_dw: Add Allwinner A733 UART
Date: Wed,  7 Oct 2026 06:33:23 -0300
Message-ID: <20261007093323.22104-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006193046.540252-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com> <20261005172538.398522-4-vinicius.eduardo.pedrosa@gmail.com> <603b4f40-2a60-4bc5-8b98-ada7a52fead9@arm.com> <20261006193046.540252-1-vinicius.eduardo.pedrosa@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andre,

Correction to my last mail: the v2 change I proposed there is wrong.

Gating only when clk_round_rate() differs from the current rate is
e5d6bd25f93d ("serial: 8250_dw: Do not reclock if already at correct
rate"). 7dfae6cbadc1 reverted it because it broke the dw UARTs on Bay
Trail and Cherry Trail. Mine compares against clk_get_rate() instead of
p->uartclk. Peter suggested that variant in the revert thread, and Hans
pointed out it's the same check, since uartclk comes from clk_get_rate()
at probe.

From my reading of clk.c, the flag you mentioned seems to explain the
regression. The LPSS "-update" gate is registered with
CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE in drivers/acpi/x86/lpss.c.
Preparing it rate-protects the gate and its divider parent, and while
they're protected clk_round_rate() returns the current rate. So the
check always says there's nothing to do. The divider never gets
reprogrammed. Hans's debug log in
<20240317214123.34482-1-hdegoede@redhat.com> has a request for 1843200
rounded to 153600, the rate already set. I can't test LPSS.

So on LPSS the CCF does ask for the gate, and the disable/enable in
dw8250_set_termios() is how the driver gets clk_set_rate() past it.

For v2 I'm inclined to keep SKIP_SET_RATE for the A733, like JH7100
(b0ad20a3b64b) and SG2044 (cad4dda82c7e). The A733 bus-uart gates carry
no rate flags, so the rate calls there are no-ops. Calling
clk_set_rate() with the clock running and gating only on -EBUSY might
work for everyone, but it needs BYT/CHT testing I can't do.

This is separate from DLF. v2 still uses your 2^n - 1 check for that,
with no A733 quirk.

Thanks,
Vinicius
