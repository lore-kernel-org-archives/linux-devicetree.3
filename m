Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741433;
	b=efuQcTBwTJZIMYa94mrt564y/m2i8XbkHlC1uh2Rzj5pbqluNk+sYoj/5WYP+aD7+HP5
	 KzFCMoBbAidV9rzA61D4HZQKsBfbg7Sw4hrbV1Le0HHDT3ydbizgZK0AcZt/M6ZRWTMsB
	 t9BuTJXqNTmo3T1SGpY6mUHTVlkPEFDxhlfuxoTze7nb42v3lohO5AISSoRWC2AxNeQxL
	 8GwihlL/UtEzi6yVA1iMHGOSFoqwL52s8izvFo9H5gZCJ/8wWdNQhhZ/uYnFunE9Pqb6Z
	 1wTx4eRDroBcsL+Edkm9ftczk14qYrwa1pX3sVCKHwLdbVbG0prQs57kht4JqF+pVwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741433;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oeSd+2L3lDkwH+mq6tP2TIAPjrpjbhrMUnEEAVYIhbY=;
	b=ZMPf4EdLoCrRIaXfRNCdf8wHR7Ob2NMw7axhTSisB/VecWoxm6WT6oJTKk7fVGOQabvr
	 VbGlQcoRWZYfSMZZPQe6tv/JS+84lSwjZR0I0k7ogqiZjRbFjqLjGTIWtDjhDCVb19Ksx
	 tk2N4qxNwOsqGuG+1eCLI6jgmMburICmJWvS1GcR05qrarPqS2/NhovaL8dVY8UkD9rFG
	 cq+Gkn845Gj0vCeWrw44T7Lleyon+3fjuTsb9/B7AGnKsBmK4DL0AX7IAG5CzF/Hfuy8C
	 n6DSRVxHbTOb68UQuuJOn8+ccV+pd/NxqPq36hRv8R+m5czjevc7un70PCPWXhrejyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lM4MuM6v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D924D606A329
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lM4MuM6v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CC41F01825;
	Fri, 23 Oct 2026 07:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792741432;
	bh=oeSd+2L3lDkwH+mq6tP2TIAPjrpjbhrMUnEEAVYIhbY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lM4MuM6vPwIkIAZZhM+vMuttVDhxR6praZExHZa1q2ZHvvJwMrd4hXIRplzSH1fVa
	 mF10DOVM86Gs3Hzmj17c4mpdcbMRAkyCwHm7UE2dYFkIZnlZ28im2VbX5w5y61OIJQ
	 rosv2e56QSx1gi7UWPrmXgJZX3JfW2/BpW+8gzfQN05FEUOYelfSsUEPAjhBTwawt9
	 iGl+OQNTOB83mNGDZH404PU4FHMjBxrYEpnYllROPZ48LsB9njPd4whhgHYnXKqpy+
	 IzdWuKT6lBUxZ0dveaif23+tWsr6uUPLUYvKD8FWL3eldXIOiLRSUviGvhHCoUA3CE
	 5Wyvg+S0kVQ7w==
Message-ID: <sashiko-outbox-182433@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm8250-hdk: Enable the PCIe ports
Reply-To: sashiko-reviews@lists.linux.dev
To: "ShiTou Hong" <redstone.dcity@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261023072832.2642647-4-dc_redstone@outlook.com>
References: <20261023072832.2642647-1-dc_redstone@outlook.com>
 <20261023072832.2642647-4-dc_redstone@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 07:43:51 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm64: dts: qcom: missing Co-developed-by sign-off and From email m=
ismatch
--

commit 330aa236347071fbfcbc8b5b9c4e5d1913e72fce
Author: ShiTou Hong <redstone.dcity@gmail.com>

arm64: dts: qcom: sm8250-hdk: Enable the PCIe ports

This commit adds the 3V3 fixed regulator node for pcie2 and enables the pci=
e0
and pcie2 controllers and their PHYs on the sm8250-hdk board.

>     arm64: dts: qcom: sm8250-hdk: Enable the PCIe ports
>
>     The sm8250-hdk has 2 PCIe ports which are not enabled in the dts.
>     The pcie0 is for the on-board ath11k WiFi/BT module;
>     while the pcie2 is for the M.2 connector.
>
>     Add the 3V3 regulator node for pcie2.
>     Enable the 2 pcie controllers and phys.
>
>     Co-developed-by: KancyJoe <kancy2333@outlook.com>
>     Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>

[Severity: Low]
Per Documentation/process/submitting-patches.rst, every Co-developed-by: tag
denotes authorship and must be immediately followed by a matching
Signed-off-by: tag from the associated co-author:

  Since Co-developed-by: denotes authorship, every Co-developed-by: must be
  immediately followed by a Signed-off-by: of the associated co-author.

Should this include a Signed-off-by: tag for KancyJoe <kancy2333@outlook.co=
m>
immediately following the Co-developed-by: line?

Also, the commit Author email address (redstone.dcity@gmail.com) does not
match the email address in the submitter's Signed-off-by: line
(dc_redstone@outlook.com). Should the Author header and Signed-off-by: tag
use matching email addresses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023072832.2642=
647-1-dc_redstone@outlook.com?part=3D4
