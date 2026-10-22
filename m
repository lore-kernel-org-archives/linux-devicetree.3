Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.135
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792689143;
	b=ED70oF2960lGmxegG3q/f+DmblCDYHjS7n5l+6XdgkmoqzxHH4TxTO8xnmB4um+BiER+
	 rXfrZiv+119t8zhEdG3htztUXWquaQtex6igg5OEh0sA6wGJIg1ml9WVvrfFv3JrsdkQw
	 2LbeaEJOnp6GLP/wFN9hJGsbmhkhL+MIY0aAfEH+KlMP5Ay5iYEVpkKEsJ68F/Q9m0y7l
	 BK1cJpeZOvyyL/Esfc8x1zNEU6syqTjdGkVMbO5taJm8C23s7PTV7Hwr121POc1WrbLnE
	 m5WcxZEFK0wCP+rCs6u6ZWF4w50Iew5Gonq6gOp0tHrWuRTSxKK/DCXklgoz46US0uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hs6z4qUCneEFm9kHDK24+LRTeO4FQK/dQ4HNM7ckJB8=;
	b=XnRdFZ0Whp3Na9MDVKPplVhKyE4koMMoEXtdNxsv0oaFGvipQqDY0F9pimFGe/AE0Qyi
	 mEH+tYy1IIXIkzt7mxYUbUEvbyPQSx+fICzW4ck6F8vNSPoeicKUKvoNDJgs+g3EO4A/O
	 gFwxgUoafrtCGUfbOOegErXIMxf4WseRS7aJe6FRvJxtnhynCm6hd/cbP1g1oDKAy7EBL
	 68Xue3lRzmWwt6VIY3sH1zM0CTfaBEBBLTfskxYiebs6d1Ifap8MbzxVoSvXrHsJtbX1l
	 tz5+UuNRehSDxi0RJRx1W2hOn9m/TkoXHOCFndciYXhjDljJtszJvSMfFhPFgsKtetg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RRsdoMC4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.135
Received: from mail-ej2-f7.google.com (mail-ej2-f7.google.com [74.125.228.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CD9606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1CD9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RRsdoMC4
Received: by mail-ej2-f7.google.com with SMTP id a640c23a62f3a-c3ff043bce9so1255166b.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:12:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792689141; cv=none;
        d=google.com; s=arc-20260327;
        b=EhN3QEKtBCcRjeyydTNZHGGc4UfcfDE67wsMa4hFEsy7Askuk/TAUkJjTeJJmQIcI3
         oEJPCoBaxPtJnCvEtQudjaQVoreiHmbYfoSDzCBq2rDWZsl0TrZGZtE3hPjLE5oZBfpI
         z9pak4zBqu0YQusRgZ8ZKWiFgSStOcFT9rEnsRhDnJIceujRWVoHk8KbduY5GVQUykml
         5u5iWaglEhZqwgGRWvaAZY9Q6P9d1S6B7uRyIZLLA8C1qAX11Eo3d1FgEMSQ0mBDvuqs
         sqMPbVC/Xt+kmEhcetX2zlqyQizq3521hNDAGaHFXd4qYZaJvj+2MBuOStr9cfBGIcma
         cvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hs6z4qUCneEFm9kHDK24+LRTeO4FQK/dQ4HNM7ckJB8=;
        fh=hv6qPP/rHj80EowLpOQaS8M7Mti7k0gYPDO8CLqmjQk=;
        b=IZTwb1NlKhFfLMGHkS2/i9hb9rEuQ6cjzMJLUrHS9iaX3hPyQb5LebObaiC5elGa+5
         cGFp6DobbTMTfWtvHGu1JU8jdQrkZEIjYG45dtHzH/BVrdW0LvNFy37X/dsnDQHDjlaV
         6nbE0HSyf5Sz/TCctV1kTm6fAtmEfQwMCgoxDuLJOQKUfk1ZennwvGvz6sFdjPO7XqAp
         OS1OsaxCJAuhW5uDQU5edyC/6k/+WcXogY/3K/AgFiJtABknsTloTYsWZtYch3qB/63Z
         Eu7hz6HsAlsEZyeWn0odSktZ0i2QCuOwKZq+vB+RFvAWEfg03QkaK92aQ4PfSEitzuqx
         Qw0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792689141; x=1793293941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hs6z4qUCneEFm9kHDK24+LRTeO4FQK/dQ4HNM7ckJB8=;
        b=RRsdoMC4w6FJhYM7da1YZGYH+aI7aUNA6hb0JJyxgACKGqJQPURvwxkRxFil4ma7Ku
         +DuxaHMAPxbnSrT+hFH1YTS/fY3rl4rTWtt5YpBZ63/Lgrm0V/AR3+T+9mwDQPuMHm+V
         BaXurUbGbIXrlNGzjov/ItXYqf1LgJMTgtrm1uleBFlopLYuqhOwXBS7joz1BXGDNAIM
         JhFoY/y5XxJz3kyn3nKrHje70rTKkMo5ve40ovAnZQbQk1s1iRyOZRUJ8GL2PBuj4sn8
         7ib+fgGOchAPXyq59g4fwhX2ObS/Q3yD7EQcszramjKqUKn0dc7wn6UFI7RYUdsOyPey
         RszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689141; x=1793293941;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hs6z4qUCneEFm9kHDK24+LRTeO4FQK/dQ4HNM7ckJB8=;
        b=Ydocgiq1+yHXJ5vXhYhlcNDhuctjTyNTge1Uqnp9xTpuBlWHrLbbLPzZixhlZyP3k+
         EcDKu/k7vBAeYOZ9z9nWRfypswKDwJDmiesnbYXTRJDSeR53yBnceiV9fsqg+GlLoQYG
         uBHv+icPckuRje3VjZUKCE+GPfB1O4N2QlNPU+bycSJWd4H+wn3KAlIA9HisMUGAXaKF
         xzwa5TnS20+Sw/zPnk9r8A4buD45YslfhC3VI2bti5gPTwaEhMnyiWgVYKvUXOC6OLwA
         DMT1R9Tt3Bt0nMgbb5DlAA8iTKSfzS05IaQoWJk7OzdOZ50lg4WCOxIvW2xSVhle4LQa
         /x4A==
X-Forwarded-Encrypted: i=1; AKwUvByVXxyE4pC1c/GOgL8utUfisbJiw2Em7tC9UQJt7bsBxSx51foF/km0zCDNBbkSkpEwWafsJ/cPNxHy@vger.kernel.org
X-Gm-Message-State: AFq9FYJjzG8Mda/VMqQ97g45/AnZpDskaotkrWfoYGpWL5oKmVPZ0T47
	zTtNEngJEguVp6kV801g2sZWO0bb9wXSP7ey1dAsmvZnw05rgfwvx7kqw2ixfgmoBakEeIEoPWW
	0R3qaRR1ZH8FlZEpxPNZzJOI9sCzDr8g=
X-Gm-Gg: AYBFou0Ze//P4gu2ibhjEQFgVfDXEmM5eYTaR5RajjV3yxwPtmE6T+wuxw00PFjYxvz
	Z9Umen27S69clvZK7JJTL1/a0W3dq/KrS/i7sn422Nixypy18vCREhR0J8t1TaMVvQSD3q3AGVq
	o4dm9nC8pU0jB2jBAba2C5QGWMJS0K72tuj6Eg/8WntF5uUmeS+8MEZK9K6sfHM/TWK5kAeWqkp
	Vq2cq44BCMFtbliIRMRuLIumgIzPlpJEc4MbTBhO/kaOb4qTIR15CC3VbdwgiHaJia8JbRbZRIX
	H9O/pQhv7Sr8k8CDs9yhUeHIhK6sguBOvgbhxnmKWIYswczBGTehLqU+vbwcbKibHvxAjxkJcp9
	dB66kK4RXDKZIAExsMixkY3OPGllauVZgO6JuNh8Wd1vr/e/OiGn//qwvx0PT
X-Received: by 2002:a17:907:1c95:b0:c26:19de:9aec with SMTP id
 a640c23a62f3a-c4679b577d3mr599686166b.43.1792689140926; Thu, 22 Oct 2026
 10:12:20 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022025844.150320-1-coiaprant@gmail.com> <20261022025844.150320-4-coiaprant@gmail.com>
 <e7f68299-1c0d-4b0f-948b-4835086c0df8@lunn.ch>
In-Reply-To: <e7f68299-1c0d-4b0f-948b-4835086c0df8@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Fri, 23 Oct 2026 01:12:07 +0800
X-Gm-Features: AclHuK9Aw-1KGTe0rcDr7TiLvHCZz-VKOsYzCIMnUV4-DQLpiOO8Gle6TTGKUh8
Message-ID: <CALj3r0gMA45HG2khs2SyehftU5KAHR5i7__CKXSZR8GSE1Q19A@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] arm64: dts: rockchip: rk3568-photonicat: enable
 SGMII LAN port
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2026=E5=B9=B410=E6=9C=8823=E6=97=A5=
=E5=91=A8=E4=BA=94 00:58=E5=86=99=E9=81=93=EF=BC=9A
>
> > +     sgmii_phy: ethernet-phy@3 {
> > +             compatible =3D "ethernet-phy-ieee802.3-c22";
> > +             reg =3D <0x3>;
> > +             max-speed =3D <1000>;
>
> Pointless. SGMII cannot do faster, so there is no need to limit it.
>
>         Andrew

Hi Andrew,

Right, SGMII tops out at 1000Mbps anyway. Dropping max-speed.

Coia
