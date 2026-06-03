Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CEE313523
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493964; cv=none; b=qneRMRaWTbvbf093q+dR00Nzw+HvybQ5BpDZeNpRMAjOMOeIMq19B1VvQt+iIxK8Jaf4TTQwN43PdDVTDN3b9MkrTBGGD0/fRtFf777Gj2duuLUqbjT4t6lY1T0rl3EkrqfgE0v+lPIzeSX+/0+wuPlxJ6pnqD6/O4ZYF8qOsOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493964; c=relaxed/simple;
	bh=JcvdzGfndVVnJar+huUhyB/yHq6aA5KVpzELIZHaeFQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CAOdQcuBKR+OnMyZGbiknl+g7f3WI+8AXscdvrCN6jEApHAVsTol/iAAq7yn5/yBLKZxEHuJ02MSUEFmM3A8xizif/zd0j1QMI7YayrzrG7r/MjlqKu+cAgjcQ7U9/GDD/JVk/1gv+bC6Z6xRfSWi16n+K3HyerRjkrzGcGOb90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=nXoSgNsL; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="nXoSgNsL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1780493955; x=1780753155;
	bh=JcvdzGfndVVnJar+huUhyB/yHq6aA5KVpzELIZHaeFQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nXoSgNsLZ/Y262TMtSpHLxtBSpsLSGhtouWr6B3y028vXlGFYHTQE8bIwmjViLauY
	 NBD8nXD7vNOIMHgv9PQqdoyQtAiOqD5SFd1Ja3QKwT7uxfdf5gjc6Ge2j01vKpSY/w
	 Y435b6nYum9GDJQ726o7GwoFa+y8M/Goa9MYyEtUnP1+VwvyuWGuF82Jy8gqCCl5c2
	 HVTHeUBNdy+twxPoiFn3iXOgGsi6U0jYnzLFG9wTrdhkT3eB/T9fa2asCMJaBFh1fL
	 DQ1iffuynsRCFqDDvUoos6KvjJSbLnwGz/upTKEg9HxOCr4eGhUgzq+YmgAQXg6N/o
	 /orDKAEifNIWA==
Date: Wed, 03 Jun 2026 13:39:10 +0000
To: Rob Herring <robh@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Luca Weiss <luca.weiss@fairphone.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add the Nothing Phone (3a)
Message-ID: <v_gzn_KoQPa_5JCT7xrvQyv-AZlsKVq0sI3QS32kfcoqLyVvI7kUClz8mXo35TbQ9nXU-mz6MWfHm6s4OsZBwAF3pVM7zcb1y7rHL-dIb3g=@pm.me>
In-Reply-To: <20260602224420.GA1290244-robh@kernel.org>
References: <20260323-asteroids-v2-0-1a35fa9e178a@pm.me> <20260323-asteroids-v2-3-1a35fa9e178a@pm.me> <20260602224420.GA1290244-robh@kernel.org>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 4433180bc5c3a08973f81c3c856e10cd01bad00c
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, June 2nd, 2026 at 6:44 PM, Rob Herring <robh@kernel.org> wrote:

> On Mon, Mar 23, 2026 at 01:55:05PM +0000, Alexander Koskovich wrote:
> > +=09=09=09panel: dummy-panel {
> > +=09=09=09=09compatible =3D "boe,bf068mwm-td0";
>=20
> This is missing documentation and gives a warning. However, having a
> panel node here is not valid. Either define a complete panel node or
> none at all. That should throw a warning as well.
>=20
> Please send fixes for this and any other warnings you didn't check or
> ignored.
>=20

Sent a change here, though realize I forgot to add 'Fixes:' to it:
https://lore.kernel.org/linux-arm-msm/20260603-asteroids-drop-simplefb-v1-1=
-34d73477c9d4@pm.me/

Thanks,
Alex

