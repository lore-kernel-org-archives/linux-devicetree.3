Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795433145;
	b=fFQxWsjs6HWrFKu/0NQvW/XdRqEHVM+APqpLjbU9nyho0Q/1VTIB8C4y7BwRIm5lhCd3
	 ETmO+I3dL4UHDfCPKveQNhsqZhLQ8kKfqKvtxv05Dbbwq4D0gOc02HrbhXIjHC78JOGOd
	 O9BM1yNoXrmiBfj9xKs81ETg/n1w0Bz1OVpKl0A25ABvbZoqgvGfPtRbumWtP3V0ZCzs2
	 tOrrJr5rFHvYZzs1sO/0s7yYp5jvoTXrqCFDdHr4zlj7bDKGOo8V7ZRJeYdpVZw5AR5O/
	 2fMghkozb/r25/zbLbmZOhUFFuEj+Vx11OxPjL8A5De0A9dWfoSC3676Vlg1/zTyEDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433145;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=vb+EIciprrYd/5g/UVRrx/Fk4f8HJXZeOfqJKIISy7E=;
	b=valaigZqiuVHlL7N29Osb0sWbEe5qCBVWe6NeBrx4xsM7xGYLEMHlDZsXmAguC+dzakc
	 uu4RFfq5ZZS+TipIdll4GoE18ysUWVIBzGbc0ypSE9siYm9X/fq5U8EC7otGUcp+S1eOb
	 zLuvKD/my2JFoxZoS8wD4dU43N8xwZbfFTaeQ2uv9jyS84otE9v2z7hWaYjkkAjerh7az
	 nOx6siBWXsMejaLKfD+LlcVZ20uMmhq4HCe9+VdF4hiRILW2sk/euaf1i1viu+QyB0gMy
	 oUJKUkbKlR69+O7e4H5W4AEi3LnvOn18Q0lDSDBUCTPgwEwfDGkKeHf1i3e5yTDJFwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Kcbwldaz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B10606A32D;
	Mon, 23 Nov 2026 11:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52B10606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Kcbwldaz
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id BDE3E2020E2;
	Mon, 23 Nov 2026 12:25:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vb+EIciprrYd/5g/UVRrx/Fk4f8HJXZeOfqJKIISy7E=;
	b=Kcbwldazoug/OEH9qzqxE23OE/hpd7ZMSTBczCp7ZqjVA+aLlboiWgIr24ZmgRoHIi6lsx
	2tngYanTqlFEuJ6BCtqESGcL300b1srcjJtOeNH2S+zpEX6fa48bO9lKo7POy8ofzzx8GB
	x6eQCRzcjOeZxpMuTMRCWtX91+dy9Yy6m6xYjYutGJR3B2HFiCrsOd8manfFBN+7mBeTac
	k8uLN0aGinjJ0zzRPY3wvYudXD2avRztNG4wbhoawInNBm+EAOqZ7cGGC176LUYXTrZYs8
	S1TluG16DVLaHF/bDqyey+zTgqopTY8zTkfQHte6afUAC7CvQxCUTNeyYrRDQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vb+EIciprrYd/5g/UVRrx/Fk4f8HJXZeOfqJKIISy7E=;
	b=ZnHVuBY2LXNoH7oAykr6PpYW8fpYm/Wjb8VRlh2LxZFTrEEkHAxpvEOqw+CzDtpgGNcyad
	CTo4JDo/1shhRRwgAeFXb57uvkQ14h0Oh4qIv2r8dN8GmjuUjs+R1UvQyJLA3CifhKY2QE
	RtrYqWOZSbnwX7a2UC84D2qzBDMWFbgVm6en2ucfn0jEgi7u/KgleWsZtisynwdGnOMEjH
	jhCvVZX990W7fxNeLIIPFzYrjqtOry6S8ZZo5tGEA9jBNZNzwH+5nK9E+DmUnbfC/hWHhS
	I3Cg4spqe0QGir36LlkAEl9QkQ8M/VjcWrb1BOla/aO6JUUhbZWhAwWPZE0gfA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795433142; a=rsa-sha256;
	cv=none;
	b=OPxuAL/dPMmlWns16nGx2Ai1y6mNba6rldF/0KPzv2N+PcZ1kXpI8iIMscfAyumfcPvoqP
	9QzyM+d0H1vIJi/+CNf0WJSWxEIseFW2pvNU325cDgwrvjj/z6ngrOxwYY+do8F2VNhT6G
	16kEooZ3SkbdDCR+zbi3GiW9kG9FBGbh9XFGiwSFsHWI6fRot0gDFAThSODNckSkklgNEg
	ACuDCipoT4IGCHwtLRTLGmrSLPNDO04tQIS2NSBMgPJ3nXYIeO+LKcFYZIe3xaWyurDw6e
	JwF9fCqQTGS16Us44nye1JyyeEvEPOPNLLKl29Bne1wtG03N47FK+jpCA81GZg==
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xVSB4-0016XI-0a;
	Mon, 23 Nov 2026 12:25:42 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Mon, 23 Nov 2026 12:25:18 +0100
Subject: [PATCH v2 4/5] arm64: dts: freescale: imx91-93-common: Add EL2
 virtual timer interrupt
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-imx93-frdm-fixes-v2-4-dd97c7fca4b1@pengutronix.de>
References: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
In-Reply-To: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Freimut Diener <f.diener@pengutronix.de>
X-Mailer: b4 0.15.2

The Cortex-A55 CPUs in the i.MX91 and i.MX93 SoCs support Virtual Host
Extensions (VHE). When running at EL2 with VHE enabled, Linux prefers
the EL2 virtual timer over the EL2 physical timer.

The timer node in imx91_93_common.dtsi only describes four architected
timer interrupts, omitting the EL2 virtual timer interrupt. As a result,
Linux reports:

    [Firmware Bug]: VHE-capable CPU without EL2 virtual timer interrupt

and falls back to the EL2 physical timer.

Add the missing EL2 virtual timer interrupt (PPI 12) to allow Linux to
use the EL2 virtual timer.

Tested on an NXP FRDM-i.MX93 board. Linux selects the EL2 virtual
timer (hyp-virt), and interrupt counts increase on both CPUs. Timer
operation was also verified across CPU idle transitions.

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>

---
While this change fixes a real bug for me, this same change was already
previously proposed by Marc Zyngier <maz@kernel.org> in May as part of a
larger series.

Link: https://lore.kernel.org/all/20260523140242.586031-10-maz@kernel.org/
---
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
index a68ffd04ee084..af4c93c128d31 100644
--- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
@@ -82,7 +82,8 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 		clock-frequency = <24000000>;
 		arm,no-tick-in-suspend;
 		interrupt-parent = <&gic>;

-- 
2.56.0

