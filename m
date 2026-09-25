Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8498B4D9F98
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351865; cv=none; b=X5HG6j0H97ET/Z4eCgcY8N0Ujy7AycVyjXzTbVcXPVv4XMA8KjalKpcqAu/Cxw56DLHv62Q9NGtWuDPsUcPfb10RUbMj0NPdUakxxQUOLSsGKeMpUP8qI48q8OYc1sg2+tyaccCsW+ccIzOZsH9EnAfwNW7xQH9RcpyZfBCSdzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351865; c=relaxed/simple;
	bh=EDelbTNsLGwr16sy1/ve2CrvpZJX80YUMKX0NU3F20E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMyI0zZdf5jq2xU4JJ+z13IkxoKPkE/d/r2fTApkLjRVRz7nu0VXe1NZV2T25MlAYlXgfBcZeqZ0YUKlHNErg4njZ+fKdzxFCGCAmcFInyIDiuAgJCXR/UfqZYS/CmbOZ9XcrCBbLUvLGCbCv9JHzqqh/9YgA0isHkoEjWTM0II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4L2y4Tc; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4L2y4Tc"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f690df6so603842f8f.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790351861; x=1790956661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JDj9ZLoDuXLeZ+ESPsWzwz0ze3YEaXzdQ65mT9PQEa0=;
        b=N4L2y4Tc+Rv4L5beR6/DjOIpQjyNUB42kUhmYgxT7UjCasPYhBBZ9TTq4WyWvQeew3
         /Cb+2TG8pD5H86aD5x9AlYeBTCtuZWEUO88A2qPBtTj0S5NDdHUEIaKt5Xj5oohJ4fQR
         r1Fu7QypSFS5H+gdP24Qf81wLA4rDLce6AdenH9cp3ouEFFbgbmFoxdwE2zLjJHTdQD4
         9wfgR8f9iIhbUU3LRESyu94+B9XTKhvp8u6UgGPLThtYWtHqsyAL85Ht2HxJsLUXupdZ
         SURUz46RxmfAROl3PXcPRtE/4PFdmQwbqsCC2aiGj9x6C245yHcWzZFMIDddaDhMxb0b
         h8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351861; x=1790956661;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDj9ZLoDuXLeZ+ESPsWzwz0ze3YEaXzdQ65mT9PQEa0=;
        b=VrkPja+bYyVFV5++WC0CW1uIeFEysgyAY3U4ZSeA/TS5rX/NP7WJGdC0WANb36+q5m
         J50Jti0OTL7n75nb2PL1mRwTb+oOEh9k6Y/qam2zlFhe8RtSmOtAvHtBZgmNNgxg/0pi
         Uyfk7IoPBqNlPI0K9a2G6kjbq+fqMYD6uvqWaWKeWEaF1AGIi7n1doO5vCr/ZQfiu9qR
         RLf8kUoera5V+4Iqy/pPilF3iBGBhtRHmFvCXqn7WOcpwIttuOB/irBcn6yvqIj3LTOU
         L1ja90/AVq2H7nl9Oz6hXbYI3Hv289u1CNKLwmX8pEbmBoROkCNz0ira5iLUsL9WbHy1
         cPgg==
X-Forwarded-Encrypted: i=1; AKwUvBzxTTFJzX/qlzHBphXRBi9CzJrcK1/zf3PqQE4LoDOTfQ70bAASACV/NIs0WEKdSdUMA/CWP+7B6hWs@vger.kernel.org
X-Gm-Message-State: AFuF++m2r5Fv0GLQeabGihuTBhKNmpLpqD2BOggNY6Af0L80km7KYzQ2
	WA4BVIFBj0ZQ51kzwUR0Rh2rNuwERtVjKzUWKkarugATVUa92cFg+5J3+PqCEAmCsNp+NA==
X-Gm-Gg: AYBFou30gSBcRAtdDWGQe40wr52qBNe0pSRLc3/F28HfMCMu5WUfUSYSdRLSEcB21U4
	u4VvdmckmQ7Ix/Hmyywu/GE+34l+YH5ZQpeIOOwZoGNdvgWZjS93Iuba+RBsTIFBpXxysjRzuec
	ST53h0knmxS3D30TDh4pJS1OHiD2ojh3iFA47k/QGfcBZTumpUv0gBqaMO+5tFwkIXIRI5FRLll
	BwcHokmquMN36S6BN9RIL5Zg+ERK4tWAuu+afUnx5xLos0fsvz7ILn9788wqeByfBFl81YsYb/W
	wDv1cT025zOFX7yux/2Dj7zHAE0d6DIj7DEFHRWuTfEMns2W1XvmzRiG8EiJQb3YP3yvYTgmVO5
	VUZoZcAdBZOg6FYSuPE5A/rDCeYh/s+/ETEDc/EBsGcXHFSNA2jdf/n+eVGBdfjINme/iyOBJGZ
	SL/SAW94plateWZtFggzaP7zXfqrAOh9uPDkfVvQZKjKlbzHZ1rnwjymOhzM3gMAcxbW0xGhd1e
	sxDkyKPD9SO8kUPAmK0BMPIpX0ZCTiD+6JRZWiauiBaorvxcw1UXjEYiEkeM5jtxAktHqNB8aWl
	UBNHWStSOe2jkSjZeEaUdFWCaQiS
X-Received: by 2002:a05:6000:2509:b0:487:27f6:a4d7 with SMTP id ffacd0b85a97d-488716b0361mr12527019f8f.39.1790351861320;
        Fri, 25 Sep 2026 08:57:41 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3627a8sm8964225f8f.23.2026.09.25.08.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:57:40 -0700 (PDT)
Date: Fri, 25 Sep 2026 17:57:38 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>, Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v1 04/11] ARM: dts: imx6ul: Add Variscite audio codec
 files
Message-ID: <araZ8pJGmDVXMjvE@Lord-Beerus.station>
References: <cover.1790344389.git.stefano.r@variscite.com>
 <ef56f98137eb9d1e0af3aa1b801186d829dba521.1790344389.git.stefano.r@variscite.com>
 <araMJFirhP86Dcb6@SMW015318>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <araMJFirhP86Dcb6@SMW015318>

On Fri, Sep 25, 2026 at 09:58:44AM -0500, Frank Li wrote:
> On Fri, Sep 25, 2026 at 04:02:21PM +0200, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> >
> > Add separate DTSI files for the WM8904 and WM8731 audio options on
> > VAR-SOM-6UL and DART-6UL modules.
> >
> > Put each codec node, the SAI2 setup and its pinctrl in the selected
> > audio DTSI. This makes the WM8904 option explicit instead of placing
> > it in the shared module base.
> >
> > Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> > ---
> >  .../imx/imx6ul-imx6ull-var-dart-wm8731.dtsi   | 71 +++++++++++++++
> >  .../imx/imx6ul-imx6ull-var-dart-wm8904.dtsi   | 88 +++++++++++++++++++
> >  .../imx/imx6ul-imx6ull-var-som-wm8731.dtsi    | 71 +++++++++++++++
> >  .../imx/imx6ul-imx6ull-var-som-wm8904.dtsi    | 85 ++++++++++++++++++
> 
> what's difference between imx6ul-imx6ull-var-som-wm8904.dtsi and
> imx6ul-imx6ull-var-dart-wm8904.dtsi?
> 
> Frank
> 
Hi Frank!
Thank you for taking the time to review this huge patch.

The difference is in simple-audio-card,routing:
on DART-6UL, the microphone jack is routed to IN2L, IN2R and MICBIAS;
those routes are absent on VAR-SOM-6UL.

Best Regards,
Stefano
