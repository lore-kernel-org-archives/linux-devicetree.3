Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FA626ED3D;
	Tue, 28 Jul 2026 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248952; cv=none; b=SpbhxNqj8AvvMYnhaUn87bPz+w52YhTvLvkQzsbx8JA1nDtyIYqQRJmKh10h02iGBzqTlnuEDOS/fagtbOmXaIRz81I0KEXupQMO4Cy/8GYC6roPF01FICV5rjcJjRxFIlLzY0yaQruRDO1Tk4aDrHdXjjsOyvk5K9qv7IMs/70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248952; c=relaxed/simple;
	bh=10JclFPVdboBvxaAjM/u85JIoTF+zA72ue53lY10LwU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=lQbX+7J636q6YgNKCnRYg3f1oGKQMfGaEaLGJGU/sodBWt6JlWZEusYX7s7alFeI5uhDEs/szHPR0CkIl1vo2z5oWZ1/hAUpXyxFHI1++Dx8CSBzWMIfgf50+4UsU07R4NAA8EXk9wOYG3qN8U7eBExoUeoZXu39oycXr3EhTX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPm1nXxV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPm1nXxV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944591F000E9;
	Tue, 28 Jul 2026 14:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785248950;
	bh=vCd30UH6iK+tXTcvP4Vm9ChAINRQWuadgRd/kVcFUX0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=GPm1nXxV1yWl5usVi/cufz3kmhNCob5Fxj1ZlJLh6weRbpB60pVGsKlN50dxoAd5R
	 cX2oWKl9yjAvayxny0/FNLUCOeTkzsqC+6o4kWnO9i5G1O0F5GvXI7tnF2gZZQ7q9F
	 5sPaTSvcF3B2bcqfLFIJqxKfrHX2vrJAPKjkyxJXdkLDQRqaMDgeUYJQGAxSwGiGj3
	 MXMFwCKsu0Phgbyg2hNc6fOOccy64xhBCofD6fQF9VKnDtPFFHCzA1KRI29GeBmI4r
	 l7IOg/GkhqNhgs6yTPjx+f6kClwsSJIWqYX4aPSS9v41YN9XRnHNVlT5+I3jkWA9AT
	 PQLNqjWP3QOTA==
Date: Tue, 28 Jul 2026 09:29:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Laurent.pinchart@ideasonboard.com, j-choudhary@ti.com, 
 luca.ceresoli@bootlin.com, andrzej.hajda@intel.com, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, s-jain1@ti.com, tzimmermann@suse.de, 
 linux-kernel@vger.kernel.org, yamonkar@cadence.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, b-padhi@ti.com, airlied@gmail.com, 
 jonas@kwiboo.se, tomi.valkeinen@ideasonboard.com, sjakhade@cadence.com, 
 r-ravikumar@ti.com, conor+dt@kernel.org, u-kumar1@ti.com, 
 mripard@kernel.org, neil.armstrong@linaro.org, jernej.skrabec@gmail.com, 
 devarsht@ti.com, rfoss@kernel.org, dridevel@lists.freedesktop.org, 
 d-mittal@ti.com
To: Yashas D <y-d@ti.com>
In-Reply-To: <20260728124224.774785-2-y-d@ti.com>
References: <20260728124224.774785-1-y-d@ti.com>
 <20260728124224.774785-2-y-d@ti.com>
Message-Id: <178524895001.2116102.6714678554328277201.robh@kernel.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: display: bridge: cdns,mhdp8546:
 Add no-hpd property to the cadence bridge


On Tue, 28 Jul 2026 18:12:23 +0530, Yashas D wrote:
> From: Rahul T R <r-ravikumar@ti.com>
> 
> The mhdp bridge can work without its HPD pin hooked up to the connector,
> but the current bridge driver throws an error when hpd line is not
> connected to the connector. For such cases, we need an indication for
> no-hpd, using which we can bypass the hpd detection and instead use the
> auxiliary channels connected to the DP connector to confirm the
> connection.
> So add no-hpd property to the bindings, to disable hpd when not
> connected or cannot be used for hotplug detection.
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> Signed-off-by: Yashas D <y-d@ti.com>
> ---
>  .../bindings/display/bridge/cdns,mhdp8546.yaml  | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml:66:30: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml: error loading YAML: mapping values are not allowed here
  in "./Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml", line 66, column 30
./Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml:66:30: mapping values are not allowed here
make[2]: *** Deleting file 'Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.example.dts'
Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml:66:30: mapping values are not allowed here
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1703: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260728124224.774785-2-y-d@ti.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

