Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FFA4028F5;
	Wed, 29 Jul 2026 08:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785313121; cv=none; b=UNSZQ5/Wud1eFlB0cViLPf3YWT9WYekP1CjnoeMLwgnlHaJZ+XrRhYK66uc6faT9Xi1JaqU2rpayRCzS/kr5mW3BdqT5IxGHkr6wZlrELW4jwEfUHlGW0BCkBmvUdoyqEG+pCcpkITCI7kfJ5M5YWk5mty97WGqHsco5kEyxlo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785313121; c=relaxed/simple;
	bh=5LhzBAZ6YFvkeSm6D73QOYm7iIYty+g3rP+mlJfEAcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qmcgkNaMQX7R+g/XCIM7YQpr5TzC3J8bYcE5qzyr5NJjlcFBQJwP1Y3aACktqel8JqGPm9pf0EVkknu73s/osx9zz9ZpjgWQT4qtORwKkb3pfa/tLZn4eyxLBaXsOpsHlcO3T30LSLtgDvCnAUO7DKgBYCZEZEXVR4vobW/aG9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5tkCaJg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5tkCaJg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36BC41F000E9;
	Wed, 29 Jul 2026 08:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785313120;
	bh=//Gz0k8xoKuGyoL3SetvzbbEXuy+ZNGJA64aKia2J84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e5tkCaJgFw4RW2jrpn92XuA/Z5TSnfNdMDhvw80U5oCVveRdM3O8tNOBCFNAAL5Vx
	 Il0NeKnWM9i7XTpfSVdZmMIOL/0pzCZmVfzcpVSivEPO9oVDayCEfIOjAFZ215ZRR+
	 w/rp7ZBlk2J7R3LE8hBAraCcD9tU1ZSNPijXA5Vh79UJJyQm2nBQ5ULyCEsiIgH+2Y
	 hIiqfuJ8KQFLsmVAngNbvAyAZuHkQYEcxwccun6meZ87WlUfd4vX2/3ctvu8O1Q9cy
	 qF6ndT0JisuZY+wJ4Jqia8petNHX/Jf5ofnI5SP6iVNF07Xfxlk4KN2s4UJ1YiS2sr
	 N6WPBOgcrNdHA==
Date: Wed, 29 Jul 2026 10:18:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yashas D <y-d@ti.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, 
	Laurent.pinchart@ideasonboard.com, j-choudhary@ti.com, luca.ceresoli@bootlin.com, 
	andrzej.hajda@intel.com, krzk+dt@kernel.org, devicetree@vger.kernel.org, s-jain1@ti.com, 
	tzimmermann@suse.de, linux-kernel@vger.kernel.org, yamonkar@cadence.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, b-padhi@ti.com, 
	airlied@gmail.com, jonas@kwiboo.se, tomi.valkeinen@ideasonboard.com, 
	sjakhade@cadence.com, r-ravikumar@ti.com, conor+dt@kernel.org, u-kumar1@ti.com, 
	mripard@kernel.org, neil.armstrong@linaro.org, jernej.skrabec@gmail.com, 
	devarsht@ti.com, rfoss@kernel.org, dridevel@lists.freedesktop.org, 
	d-mittal@ti.com
Subject: Re: [PATCH v5 1/2] dt-bindings: display: bridge: cdns,mhdp8546: Add
 no-hpd property to the cadence bridge
Message-ID: <20260729-divergent-stirring-stoat-c08715@quoll>
References: <20260728124224.774785-1-y-d@ti.com>
 <20260728124224.774785-2-y-d@ti.com>
 <178524895001.2116102.6714678554328277201.robh@kernel.org>
 <07f536f1-9a60-46a3-bc3e-fcec4bb7ce02@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <07f536f1-9a60-46a3-bc3e-fcec4bb7ce02@ti.com>

On Tue, Jul 28, 2026 at 09:49:47PM +0530, Yashas D wrote:
>=20
>=20
> On 28/07/26 19:59, Rob Herring (Arm) wrote:
> > On Tue, 28 Jul 2026 18:=E2=80=8A12:=E2=80=8A23 +0530, Yashas D wrote: >=
 From: Rahul T R
> > <r-ravikumar@=E2=80=8Ati.=E2=80=8Acom> > > The mhdp bridge can work wit=
hout its HPD pin
> > hooked up to the connector, > but the current bridge driver throws an
> > error when hpd
> >=20
> >=20
> > On Tue, 28 Jul 2026 18:12:23 +0530, Yashas D wrote:
> > > From: Rahul T R <r-ravikumar@ti.com>
> > >=20
> > > The mhdp bridge can work without its HPD pin hooked up to the connect=
or,
> > > but the current bridge driver throws an error when hpd line is not
> > > connected to the connector. For such cases, we need an indication for
> > > no-hpd, using which we can bypass the hpd detection and instead use t=
he
> > > auxiliary channels connected to the DP connector to confirm the
> > > connection.
> > > So add no-hpd property to the bindings, to disable hpd when not
> > > connected or cannot be used for hotplug detection.
> > >=20
> > > Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> > > Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> > > Signed-off-by: Yashas D <y-d@ti.com>
> > > ---
> > >  .../bindings/display/bridge/cdns,mhdp8546.yaml  | 17 +++++++++++++++=
++
> > >  1 file changed, 17 insertions(+)
> > >=20
> >=20
> > My bot found errors running 'make dt_binding_check' on your patch:
> >=20
> > yamllint warnings/errors:
> > ./Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml:6=
6:30: [error] syntax error: mapping values are not allowed here (syntax)
> >=20
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/display/bridge/cdns,mhdp8546.yaml: ignoring, error parsing file
> > ./Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml: =
error loading YAML: mapping values are not allowed here
> >    in "./Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546=
=2Eyaml", line 66, column 30
> > ./Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml:6=
6:30: mapping values are not allowed here
> > make[2]: *** Deleting file 'Documentation/devicetree/bindings/display/b=
ridge/cdns,mhdp8546.example.dts'
> > Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml:66:=
30: mapping values are not allowed here
> > make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentat=
ion/devicetree/bindings/display/bridge/cdns,mhdp8546.example.dts] Error 1
> > make[2]: *** Waiting for unfinished jobs....
> > make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1703: dt_b=
inding_check] Error 2
> > make: *** [Makefile:248: __sub-make] Error 2
> >=20
> > doc reference errors (make refcheckdocs):
> >=20
> > Seehttps://urldefense.com/v3/__https://patchwork.kernel.org/project/
> > devicetree/patch/20260728124224.774785-2-y-d@ti.com__;!!G3vK!W-
> > t7VTYjMiEiiyA5HnNwMPXZXIDl6mIiVFQjSxqG20XM1FTyTXYmNfyADL2cjwLH7WdrUA$ <=
https://urldefense.com/v3/__https://patchwork.kernel.org/project/devicetree=
/patch/20260728124224.774785-2-y-d@ti.com__;!!G3vK!W-t7VTYjMiEiiyA5HnNwMPXZ=
XIDl6mIiVFQjSxqG20XM1FTyTXYmNfyADL2cjwLH7WdrUA$>
> >=20
> > The base for the series is generally the latest rc1. A different depend=
ency
> > should be noted in *this* patch.
> >=20
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> >=20
> > pip3 install dtschema --upgrade
> >=20
> > Please check and re-submit after running the above command yourself. No=
te
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > your schema. However, it must be unset to test all examples with your s=
chema.
> >=20
>=20
> Hi Rob,
> My dt_binding_check had passed, will upgrade and run it again and send a =
new
> patch.

I doubt, code has obvious syntax issues...

Best regards,
Krzysztof

