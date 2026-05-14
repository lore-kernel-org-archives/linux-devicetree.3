Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D68389DE6;
	Thu, 14 May 2026 18:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778782237; cv=none; b=hp6jkepf+q6MQIAnA6lppl5eBa+azMHs/FVzWPLAxoTVvMGryMMfQXZJu3f+qtAmR4sS5XXee1AbEJZPiEWlB2hWWtgbjQb1iRKMDhAaHQ8ngolo0kvzfTAiGbGb9eyY5n6MYc/g6aUnLL6FtIyNkuI6af+M1qH0BesPzoNa60M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778782237; c=relaxed/simple;
	bh=AhvkZJuzLnoXeTp6OfzpmSTFhU18gs2QLkv7PeMD52A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JNq1erEDEUdvongs3d8v+kPzpuhgLECkcqxMNm8cLhh7tMoKoZQbjmX7Sf4TUGmoDiRHAuPPlA7nwe3CdtAht4kuWMiy89xk1z7/3urWQoXLl2eOBaYH4E5+gCsscPGDNDwt0w6dCrDqefcBgVciM326iePsF9mg4RKM8c99ULo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf06.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id C2DD11C04E4;
	Thu, 14 May 2026 18:10:25 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf06.hostedemail.com (Postfix) with ESMTPA id E4BF32000F;
	Thu, 14 May 2026 18:10:22 +0000 (UTC)
Message-ID: <1eee92b884068d649ef7be9f7d931da27aa04536.camel@perches.com>
Subject: Re: [PATCH] checkpatch: Don't emit warnings for USB & PCI device DT
 compatible prefixes
From: Joe Perches <joe@perches.com>
To: Brian Norris <briannorris@chromium.org>, Chen-Yu Tsai
 <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Andy Whitcroft <apw@canonical.com>,
 Dwaipayan Ray	 <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yingying Tang	
 <yingying.tang@oss.qualcomm.com>
Date: Thu, 14 May 2026 11:10:21 -0700
In-Reply-To: <agYJJVfMBVL0KB05@google.com>
References: <20260514105151.2771474-1-wenst@chromium.org>
	 <agYJJVfMBVL0KB05@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: E4BF32000F
X-Stat-Signature: yye39xuupwxyk9kjkbu1zn7cc7gs3wn7
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/1P6H8PNwd2Tn+kj+N7UnUkLxDUxI2r7s=
X-HE-Tag: 1778782222-13746
X-HE-Meta: U2FsdGVkX18fTAuViOy3ZiW0ezDJo1BSI4HFISUYNZy0v+NnKnk3VCPZyXI8MUjjZAanMn4HmKcutbpkkylTiCAQUI3nwZmBNcWr73amZf9qXTGBTTRN3xR4AI6zjpxaXeWwQ5n4T75+e01MnY/UUh60ET6rP9YS5ldh9Z5cyJpkdgMrQRQqZXl4487JrNLyJb6+cTj6zARpUi+s1GyBwQ88S519KKoqcE+AX1z4zxajp26tufeW4yYq6VMW667XuP8BojIO8eXNmuRtXigkU2SF36UJmveBYrTzZ318ejmVYxrzNx03v0Xn8/KULzBI7LYD4+A3rIt99yweFA5tMy06hzIu8X61

On Thu, 2026-05-14 at 10:40 -0700, Brian Norris wrote:
> Hi Chen-Yu,
> On Thu, May 14, 2026 at 06:51:50PM +0800, Chen-Yu Tsai wrote:
> The USB and PCI device bindings define some compatible patterns based
> > on device IDs that use the comma to separate vendor and product IDs.
> >=20
> > These patterns include:
> >=20
> >   - usb[0-9a-f]{1,4},[0-9a-f]{1,4}
> >   - pci[0-9a-f]{2,4},[0-9a-f]{1,4}
> >   - pciclass,[01][0-9a-f]{3}([0-9a-f]{2})?
> >=20
> > These are not real vendor prefixes. Don't emit warnings for them.
> >=20
> > Signed-off-by: Chen-Yu Tsai <[wenst@chromium.org](mailto:wenst@chromium=
.org)>
> > ---
> > This is a simplified version of what Brian Norris previously posted [1]=
,
>=20
> Wow, almost forgot about that one. Thanks for the blast from the past.

You know Brian, you're different than me.
I completely forgot about that one.

> > but more comprehensive and more perl-y than what Yingying Tang posted
> Is "perl-y" a good thing? :)

My sweet wife thinks so.  It's spelled differently though.

> > Hopefully everyone likes this version.
> I like any version that eliminates obvious false positives!
>=20
> But one thing that can be improved: your version still requires that the
> full ID string be documented explicitly. For example, this still gives a
> false warning:
>=20
> $ git format-patch -1 --stdout 24af105962c8004edb9f5bf84bc587cbb30e52de |=
 scripts/checkpatch.pl
> [...]
> WARNING: DT compatible string "pci0014,7a24.0" appears un-documented -- c=
heck ./Documentation/devicetree/bindings/
> #234: FILE: arch/mips/boot/dts/loongson/ls7a-pch.dtsi:37:
> +				compatible =3D "pci0014,7a24.0",
> The dtschema is clear that anything matching the pci pattern is OK, and
> we don't need to list every possible variation in a yaml file.

> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> > @@ -3795,6 +3795,9 @@ sub process {
> > =20
> >  				next if $compat !~ /^([a-zA-Z0-9\-]+)\,/;
> >  				my $vendor =3D $1;
> > +				next if $vendor eq "pciclass";
> > +				next if $vendor =3D~ /^pci[a-f0-9]{2,4}$/;

Maybe

+				next if $vendor =3D~ /^pci[a-f0-9]{2,4}/;

?

> > +				next if $vendor =3D~ /^usb(if)?[a-f0-9]{1,4}$/;

