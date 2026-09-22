Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6004233F59C
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068598; cv=none; b=ewij+eSoBzfT2B9DS9FWhEzfS0EmcEK1Guf48Qlbrli5X9ZXkdwTnyzSwipNHUODM3CRnY2LtW0mcPKqXz8in9ajR6Hm1FItQUJuFhx4ORmDIGhkPPWnEDgzHGkaDQKADJPjLuGd4Sy/P/iAtwpovkWEQUr+vYJyOKicH+QTCs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068598; c=relaxed/simple;
	bh=1r7uDHjEXvo+G75f6LUg182oeXEOGzY5+0PPaioBiN4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DxiSLymxJ7moPjRpU3z4oP7mH3GSib34NW+vCTPu9jwUUbEM4RvffAeiaRvkUo+gYsJamzvSf8oPAgnE9HmDXPf/xPGhEc9Tmb0PbrqC80z7743JFP47s9P/kLYaRKbm7C4fD/FlOklXVgDmwT+7hMnwBgLeGWFgzoNf+h+dPjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAgrGURz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAgrGURz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A401F000FF;
	Tue, 22 Sep 2026 09:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790068596;
	bh=sV5JgPRdRMXZqKHWJ0JeWpVgrn8ywj/HaIOdCVqx8Xk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gAgrGURzzyR+QtuvRiVRizddcl2xQlWOVrm3g4hVcaMZbQTM+CiHD15xDjZjlKq4q
	 T7adlGXYSnVD4nZcEhv43/yw7To72OAC6VneTpCheIhviMOgoRdT0fUg+262ophLSl
	 fHgpaWxlDa6mGsYULjhXldkzi6pdVZDg055JniE4rOZ5XGOGcvDdxyA0X7iDOQkjbm
	 KCOf3jEeLQDc+U809+aTj1eRzAJcz+PY9PMagKgZkgnxZl8KRNJKCQgYT0aYvEB/he
	 ZhiGNZ4s0oLhtoPXYnqhY0fTXfzVYYgCsmDk+75kQe0QvWePLLO9Zz6swZrgoqKFkB
	 CMYkRuX1WlD5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm: vexpress: drop the obsolete hwmon
 and regulator text files
Reply-To: sashiko-reviews@lists.linux.dev
To: Quchaosheng <quchaosheng000406@163.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260922090836.111516-1-quchaosheng000406@163.com>
References: <20260922090836.111516-1-quchaosheng000406@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 09:16:36 +0000
Message-Id: <20260922091636.A5A401F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] docs: dangling link to deleted vexpress hwmon binding
--

commit 49de6b25b319a6b7c33aa41c9b596dc97f03cb2f
Author: Quchaosheng <quchaosheng000406@163.com>

dt-bindings: arm: vexpress: drop the obsolete hwmon and regulator text files

This commit removes the obsolete hwmon and regulator text bindings for
arm,vexpress platforms, migrating a note and required properties into the
existing vexpress-config.yaml schema.

>     One sentence in the regulator file is not a restatement: it says that=
 a
>     supply without regulator-min-microvolt and regulator-max-microvolt is
>     treated as fixed. vexpress_regulator_probe() implements that by selec=
ting
>     vexpress_regulator_ops_ro when the two properties do not both define a
>     range. Move the note into the regulator node description in the schem=
a,
>     so that removing the file does not lose it.
>    =20
>     Nothing else refers to the two files. Remove them.

[Severity: Low]
Is this completely accurate?

Looking at Documentation/hwmon/vexpress.rst, it contains a direct reference=
 to
the deleted hwmon binding:

Documentation/hwmon/vexpress.rst:
...
in Documentation/devicetree/bindings/hwmon/vexpress.txt.
...

Does this documentation file need to be updated to point to the yaml file
instead of becoming a dead link?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922090836.1115=
16-1-quchaosheng000406@163.com?part=3D1
