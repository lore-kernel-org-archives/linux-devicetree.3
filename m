Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ADB32ED55
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 04:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779252819; cv=none; b=Mb4aZxcko0dNRSBBglmtiZyO4+nUIGSv/TAyKWnlzwxX4oWVEhYyEqfZJoM+HgzfnoLlSRC2pYtt+SwjZdi6wfO9c6/yvg6iFg6mxCISPwebsG1fZnpDhR2c8y/StIR8hsQ6W0jLcPd8ARyqU3MsHLUNi9ezeJjERnbfgmYzlwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779252819; c=relaxed/simple;
	bh=A/70exiy/2K0mj3HP4s+WYIp+vMhVWnDct3Z3acCb54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lhIB2iI1obGrNWLfkpLH6kgPRYc1zqNyORCJfbLE15Dw/iQTNYBNOyeryZhS6hR8dvu7IjOhSgEJXYR9l9Xf8GVEoS9MBP76UL4sT3PCNC9TTQ10e7npjPw+ONKJvmY0wev5sIO7FA4VDWRxwr2DEc7fe2Iedv29CyCtw03FrZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ss78Q8On; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ss78Q8On"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-47c7b282e21so1736028b6e.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 21:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779252817; x=1779857617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mg26S8t/TkGRXzhhdHCmgve0tBcd/dsW907d4GgRAv4=;
        b=Ss78Q8OnvijQPwdBH8OmOkhzKmMpYFRgkcX6h7VazKYQaQCacY2FY2eB4fpf5G91QU
         3EZ7hPuvHmEONDSWATaNey3CI+mwEAPLlHafZ3/R3VwzULT9eCEjS0AJKZ2Gc5Vzf0GQ
         Sa0CT4t1fkuj1tC8f7C/eN2Qa/YC7UXAlkBSbcOjWANFqnqkV/CwFTOqpkBD/sulSLJE
         m8BUldMkBt4AqGcl3qP8+6F2oL5/jx42XwWMMCNZEagnJ6oon/sLD0VUj4JLRrraGBvg
         CDSjifZPghdoJlxnwL/lnnmsQ9siGgeD+ONogeNX3dOwayIExUWPTdlDCTxlTX8UOjAf
         nkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779252817; x=1779857617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mg26S8t/TkGRXzhhdHCmgve0tBcd/dsW907d4GgRAv4=;
        b=eFp8rtNFgJMxtJgqeuJzPmuxObUUI0yZNY9g2YpmJWLvPnVGX+WV4nimIV2z0JFIF/
         85o6AU69wtk4eomDSKeXtkGiAAuv/tREBQgXwLJR8TzQYv+W7wBmCbOHmfhkD7XXcOCK
         iXwybZKc8cexebJupAtYNy+SxNthZAfKVXTVekQ2Pu8aJzGd/1omVncqpn8CX178TFP9
         vm6G1RfEMGTiuWtwiK5kqU/eHJdONSbAVJt3/8YjTvIOobP+sRVvkYloK2gF1VWd3D8h
         ER22wRtS6hBPhSO/AZcjXfrFBmtg+0fKLaWBXx9Vx2LN5p0c5xfYI3BeeCsaL9nFouCS
         /AfA==
X-Forwarded-Encrypted: i=1; AFNElJ+H843u4FSjYvG073gk1HWKUmXN2t/tDtxgjAnUe3VRZKcdw87880Qt8UZBLvJquYHVulk9Eq+70aZU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9PAN0TbbZpa+QqliLNiV60mxwwCNtuvtKCOxwQbtTUf2OJ4LM
	mHLCx5L+2H6YD2o8CswDc9a1nIw3D2u1tVO3F6JH+9D6OFxO6bWyHRJC
X-Gm-Gg: Acq92OGcJkTPh8FsgmyDd2oQlHn7//muobEf9YH55iPdY+bDLmYIAPegDMc3cPR5ZAl
	vCbbSBHWB0QHIGOUA0+f9FmSshRtEx/8TdyDubXaRJhnTrE+4weJ92wNARRwcFz/QkmTlwEVug/
	yG8kBc1PnVVbILgcyVpYsi07r8LZuyjeuXz5L6l3qpGauOo/riRCK/eC2IXK13Px5hwi6JqtafI
	wZI7JYvYX5UTBV128/6LezJGY1swvfx4fZij9qRil4BNn1R+LAm3OwOxad1sImi3MG0ticb46Y8
	hu7aPll1BTT+gVdzD6fCpbY4bPFIaiCfA8ct/cybx0ZqZbzFEad/TelAZjEGOIUjKuPdrY7Noyw
	uj6tiE5hoaCuE9pgP5pU+kOBQIf/vzb1h69teaw4cBzd3a2le4mCnvig7Q6W7qDdBSJrF/lEr/I
	4NkcGt9P5gqiaJSp3twpRxZnI8QdtZFF63uoX5fxwI/K4TGn2q7A==
X-Received: by 2002:a05:6808:c1f7:b0:479:dcb1:dce3 with SMTP id 5614622812f47-482e53affd3mr14763463b6e.0.1779252817466;
        Tue, 19 May 2026 21:53:37 -0700 (PDT)
Received: from Dell.attlocal.net ([108.243.219.47])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-482ee0999f3sm7592870b6e.0.2026.05.19.21.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 21:53:36 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: krzk@kernel.org
Cc: akash.sukhavasi@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gene_chen@richtek.com,
	gregkh@linuxfoundation.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: richtek,rt1711h: add missing 'port' property
Date: Tue, 19 May 2026 23:53:31 -0500
Message-ID: <20260520045334.159097-1-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519-quixotic-lobster-of-experience-b894cb@quoll>
References: <20260519-quixotic-lobster-of-experience-b894cb@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, May 19, 2026 at 3:08 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, May 18, 2026 at 11:20:14AM -0500, Akash Sukhavasi wrote:
> > The schema declares 'additionalProperties: false' but omits the
> > top-level 'port' property, which hi3660-hikey960.dts uses to
> > describe the role-switch graph endpoint. This causes dtbs_check
> > to emit:
> >
> >   hi3660-hikey960.dtb: rt1711h@4e (richtek,rt1711h): 'port' does
> >   not match any of the regexes: '^pinctrl-[0-9]+$'
> >
> > Add the missing property using /schemas/graph.yaml#/properties/port,
> > following the pattern used by realtek,rts5411.yaml and other USB
> > controller bindings.
> >
> > Update the example accordingly.
> >
> > Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
> > ---
> >  .../devicetree/bindings/usb/richtek,rt1711h.yaml    | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
> > index 7ded36384..05ffc33a2 100644
> > --- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
> > +++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
> > @@ -52,6 +52,13 @@ properties:
> >      description:
> >        Properties for usb c connector.
> >
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description:
> > +      OF graph port describing the connection to the USB role switch
> > +      consumer (e.g., a dwc3 controller with usb-role-switch), used to
> > +      convey type-C data-role changes signaled by the TCPC.
>
> I don't think this is right. There is no such data link for "role
> switch", so this should be part of standard connector ports.
>
> And the only other binding (I found) having these two is
> qcom,pmic-typec, which in practice only uses connector in all of DTS
> files.

Hi Krzysztof,

Makes sense. I'll take a look at hi3660-hikey960.dts itself since it
also has the port@0 required property warning on the same node. Will
send a separate patch.

Dropping patch 2/2 from this series.

Can patch 1/2 (.txt removal) be applied independently with your Reviewed-by?

Thanks,
Akash
