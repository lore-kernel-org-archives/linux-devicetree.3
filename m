Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764318;
	b=LPFREmkZSlOBdkbVJ+8GloE++8PrhIWxGMZLDS7KoQ2E/FYLSvjF3fplWiW7yN9eOC/q
	 Kc7e5swMkV+KiJzzlJaeT2OZ1oR5O9kPAbJ70+MkB5ko861MGOYRcI8HLlGPcMU2n//7k
	 oPxaKOKQo/N1Wl4ZhaKgMS5IS9cRfe/M5pVlMFwXZVxsNKal3/5mQRGJdOp+e81R6X++w
	 kDQPVFlziDLfvn2GwRZwDI53umg3rr3pGByh2nOx7IFFDdEo1kXjksp3JOJMTXESsWulb
	 5+Xszh5A+C6up8lKBenWUTzj3cVj0UKD4Te9M+A3KskPXNhq+zy36QdPKrhnJXYiTrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SwYBO9Kk2wO9Ecr7r+S2LJi21hL4Jf1QQvneYBvL52w=;
	b=3f8Pj5tbt/V7MMd7HEPHikBbmpA5r6SvqEsutuORJEq9r38Upvb0JG1k8BRZQDORwKcx
	 VZh4Ie+HnTqaqGLEqIuHteb6GwnXbuUUbBz2MuaicFV6pRrZ406FZBrvy+++sIc3Ht13p
	 IsuVY/5VoL19WKrppKTY9K2eHjq6FT4BPmk6YBsLMgEUDzTtV/9s6SorizSlISnTHVILX
	 I+cY9eWj8hU2/UPP4P4n4Am+4L/F8D5WpkAFsnPv1b5JjeZt3z/9BRGKjd+UiNiKPG2gd
	 iAhauvYg9V/BqI9qSVmkR7R7dwbx4gCI0Va8lSXAeErR4cB9X7BLX4WAt8cM0AGSIJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eTKGlzYR;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38F0606A321
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B38F0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eTKGlzYR
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso9507635e9.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792764316; x=1793369116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SwYBO9Kk2wO9Ecr7r+S2LJi21hL4Jf1QQvneYBvL52w=;
        b=eTKGlzYRsidVuBlaW02wcQVFmAWhVBC1ONBBHD4iLoOYCCGCP9Azg+vZ03oluhIEbu
         EVfduVnauWkbmsR0ENVvhjMma6X0yOPEzQO5+NmlZcTUFxh/BfMWXqWRIgR0orWI51mq
         bUtP8Z1ZDsoA7SxH90mI6ROT5S/nonOJWovI2iIk4tLewDg6luGk6crvw1/LyuJBucwC
         IUQFCGSK9ee5GjpPDwj/l3bHhHZO5Eg8uqHC56/sW7l6BroW3kWs1pTvg3aTylXU8C5Y
         bXXwI9+d0AJDWyc/BlVSDuqs4cUtbmFjH/3vFMK35m4IBRZ8+VS2auBxMs6h49hgwq4M
         723g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764316; x=1793369116;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SwYBO9Kk2wO9Ecr7r+S2LJi21hL4Jf1QQvneYBvL52w=;
        b=gwuTPNUZJ7dUN6kwtA48Ay69XQDoBBFoXIsfNZx9Ebmyp9mt85TkbLlqZc7o6CYef4
         SmcbmT1oc2QPZY9q3beK+0Sag5x5ToHSK4YuzeDl55VmglNSuiyLzikqxBk5hmO0GQaF
         kS0LvrGmWXTv4o4eHvat24vLfz81JXQlaWw/Bnn8hDv0GLUJCZdeud4Tv/wsLIzWZHWh
         Xdf0wOYm42Ssd9/JcUD2slWW6b6DhOhZV1vB6ndva89kWocYwHEpY95gvnQYLvBq5ljZ
         IQtWHOB61AKqlno2YQ3ER+Q88sfyqSlOdGKrVvc0PUhU7dx0uiHEgYQKJFKxAgbQgukl
         lGkw==
X-Forwarded-Encrypted: i=1; AKwUvBwruSKJkRpJlJ5F9X3hbtQIGeGQ3pfohxjeA3cDKD9M6h0i72GRoTB/Yn3f+7JR9ug8TMvnXrAjP5gt@vger.kernel.org
X-Gm-Message-State: AFq9FYKcSyA3B04ZYQpb4lUv6MkrDJAl+iIwuPsQtgHJuOllf8rSMR4a
	dhIe2ax1S+ALJdvvWRRdMabboVnmej314PBcYg8G8WzBaaRZviNnM3X5
X-Gm-Gg: AYBFou1NU5Ammq3FCagbWXvzYGeSjKyxfj7tccT0Kwj4LZuGVHG2ATHiyrRMsS27Ei6
	6m3Mx7WIywUM3771LeW0N+QKCaoNpur5hj11tQ0uh4Mqb6UEnCTp5i/WaNw5SJswV4VqOjPMq1U
	TylnbhOX2J5QZkTAbmohXXmvLs8i3f4hktYxcielTVlAGapWQpdPg8gUFUZvEpsh76oR1LygTMN
	ne1m3g2vpv4ibmZFtwYd+Y1pqNvsZ6K5d5H++Q/yM7gfW/5Izhpa4bILTtKR2fo/SR48IuWWkcA
	zSk0ustXcN/cFPNHAUvOjHoFTGqKncuZbVPinez9jvjnUGXgiNtNA33LS9rUKprbvWnp+syjv+k
	NEOz9IggwPOwl7YnJ9XTcjJzt5K/0J+SuBLajpQOsX6lmA9GmBJr9DdmbUAfHlMdt8CFadaiUfZ
	EStXLW4v3YFyoI+Eko5dxuLDbsr41E0k+Uvd4FIlMXonO3CIF6yAxhp61/BkpQN4Oqv7Z19yXoH
	dGJKfTZqSRbWr8GWAeRvOsIV5cUXWNzYR/KHynj4qbYTszZBxVoiL5PD9q0gRzK5cP9fhSUvMEA
	+v6DUNINtTiC/eXgns1TSnJDHPRd4yzC9AP3c/7cFM85oSW0MY71YPoY
X-Received: by 2002:a05:600c:34c7:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4a211c9de3bmr42927825e9.6.1792764315768;
        Fri, 23 Oct 2026 07:05:15 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21545973csm31765235e9.4.2026.10.23.07.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:05:14 -0700 (PDT)
Date: Fri, 23 Oct 2026 16:05:13 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: freescale: imx8m{m,p}-verdin: Add
 camera connector nexus
Message-ID: <stl2ybj3psmedmjdjbvzj6sstzte6dqwxywa5eph634qcyuydf@6byf4ay5vqau>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
 <20261022-verdin-imx8mp-hmp-camera-ready-v3-2-90a30b0b0d55@toradex.com>
 <atp7I9fBUXhK7b4F@lizhi-Precision-Tower-5810>
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
In-Reply-To: <atp7I9fBUXhK7b4F@lizhi-Precision-Tower-5810>

On Thu, Oct 22, 2026 at 05:07:47PM -0400, Frank Li wrote:
> On Thu, Oct 22, 2026 at 04:31:26PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >
> > The Verdin Development Board, Dahlia and Mallow expose the same 24-pin CSI
> > camera connector, while Verdin iMX8M Mini and Verdin iMX8M Plus route its
> > sideband signals and media pipeline through different SoC resources.
> >
> > Add a GPIO nexus to each carrier description and stable Verdin-level labels
> > for each module's CSI_1 I2C bus, receiver and capture engine. Keeping the
> > nexus in the carrier files avoids describing the physical connector on
> > carriers which do not provide it.
> >
> > This gives accessory overlays a stable connector and media interface
> > without embedding either module's wiring in the accessory description.
> >
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> ...
> Thank you for good progress.
> 
> >
> > +/* Verdin CSI_1 */
> > +verdin_csi_capture: &csi {};
> > +
> >  &ddrc {
> >  	operating-points-v2 = <&ddrc_opp_table>;
> >
> > @@ -596,7 +599,7 @@ &i2c2 {
> >  /* Verdin I2C_3_HDMI N/A */
> >
> >  /* Verdin I2C_4_CSI */
> > -&i2c3 {
> > +verdin_csi_i2c: &i2c3 {
> >  	clock-frequency = <400000>;
> >  	pinctrl-names = "default", "gpio";
> >  	pinctrl-0 = <&pinctrl_i2c3>;
> > @@ -695,6 +698,9 @@ eeprom_carrier_board: eeprom@57 {
> >  	};
> >  };
> >
> > +/* Verdin CSI_1 */
> > +verdin_csi_rx: &mipi_csi {};
> > +
> 
> Can you refer to port?
> 
> &mipi_csi {
> 	ports {
> 		verdin_csi_rx_port: port@0 {
> 		^^^^
> 		}
> 	}
> }
> 
> because difference mipi controller may use difference port index. If
> define point to port,
> 
> ov5460 can reuse if port@0 change to port@1.
> 
> Frank

Hi Frank,

Good point. In v4, I can refer to ports.

Ernest
