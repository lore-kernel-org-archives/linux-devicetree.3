Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793100812;
	b=Myv3dNCKZJm1ZJxxY6ws14ffKEu7RS55cNET1dvc6tL1HIXVFNvcj0RFZlDL1FTvNtlR
	 ibGsbYhQJf4FDvWJhrQ1LvJmmlN6d6cq49BwENLfddP1l2GIeBLVY5/k2kRfhJFuZPomN
	 BzE9HVeVnehBat9ta9+If2Pet53O7oZvHXrvDRCtQxyjdwxwqBD/zCFHgT2yoYouJuqBe
	 ++VjpjoJSu1Qe3lLfoDByQi2+W2cb91+c+PCDvkrsGgz0Ol0gWKJpmDlEyzuUlM9fTtz9
	 Hbt2Bs4BJFLHdNRubOdeu908XNtrhfYqDJZxGuyBt967VJry1WaFu3SUiAsn6qxJa1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gpExfa5+EdYVQhWZBFhx1n4JPsMDYFeJfTGAenIwYVI=;
	b=s00AkJW7K8Tfb1uD6k+7S7w6EXI3V1/z6DoYRs6SYkvh0t2qVbf1ZaX1foLgNTVrIDqs
	 Kf2TAai2TOGY6FfcrTo40aZnCPnS16T07jWhdzHvcQ6MJrncSgAwcoZV0VhysRGWLA2UG
	 jalhakk5BU7n1Fvh0D2+ePBQMrupEbyJrHLnPXKPzGgrLC2VQMjFOlQRjRt5PBxrZu3Xl
	 2G+wsigEL1yrTyxU3KiLLDodfsW2c5ReLL9RF8Yuzbxr9xMydqYAbrooyMvakyq7YpJ/U
	 OkabssIn3IXTzByod2gzzntfnKwfgfUZoWP2igQ728IerTlROvA0tFWsXBGHKApaMEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YL4KCtdl;
	arc=fail smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824EC606A32C
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 824EC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YL4KCtdl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so3424680e87.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:33:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793100811; cv=none;
        d=google.com; s=arc-20260327;
        b=RkJscUx4Npd6pKkMiE8Q2GlG1Soy3qQkh27cDHgkAkdQv3VN88w8HGYL+c+EJ4LZ61
         mdB1beCVhkFrSsrVstAzEt/1p7Te3VsRZmPVlZzsSp+bhzCCe7CF7Ja2hKv7aCLSh0hi
         hPNBXmY9zcN4ZWzUC2oti+LwlMHNeGo8mv3FhdiemJP3Fw0c0PBsmUwVgR7+rWMZ2NMp
         ZytXPuIRZKv0LJn8ecN59QimIyr1HFvx4VrIZele/6WpkejwzJYq32S2qUY4wS3ouQ7W
         iM2NIHosrx7T7UqCh88zw6atNytKNz/aGpILIX1GB6HFTBVwhoEFtBdSgqj1gKzcgT9f
         kKTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gpExfa5+EdYVQhWZBFhx1n4JPsMDYFeJfTGAenIwYVI=;
        fh=hOutoOIxF21UwHlSpyxfSm8XLRYvhayXcjOd/V14Q0k=;
        b=fMfifnbxFjDDakokHdyTj0drtnryS/mgyjXBk0k+xPZJy/5Ac0crtqexVwZPZxOZKj
         X3jh3hOUpV7dNbvhJplKTPej1pHDTekg5gmAD40EwdR71b0f1pW/gWvSRnOK24BWJW/A
         2ucZ9aOly5TbWwTPkjizKbNPk5fCXhLFNxP9CSWX2NInhxKZx5/sCovEILse8Npr9uVU
         /VseGZ9ToZWejgQUEA8KKh8wCVmqsLoLBxrDV6Sq2t+OIeOzeJbIDryM3vrU5vghf9yW
         yW1WGMzIAPy/eLwiFQHllhacdgROS5gJEJoOV9NdmUb7hS/pz5RF8E24rF/rFxLa3TcM
         A5Ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100811; x=1793705611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gpExfa5+EdYVQhWZBFhx1n4JPsMDYFeJfTGAenIwYVI=;
        b=YL4KCtdllCf6rJ/xz59xWZFaDc9zt6xWgrmgu8NukuDGGVuFrdXkgd4jRuJ0bFwMT9
         WZiVelxmhXrfqz+t/DQtVpOwn5ObRVNV0WcXXyScr99Bfl63h6PiJnjEH22dbY7LSiBx
         bI486/6hhQcMMS/QDQkeCLlKH3H7mdO0PLHZxExCUUibYXd+JUR/tX91uNctSchhxmgR
         5SIl/ftGbeVy2Cao4F0iPQqyBh1OjBAJzM6AwLiS4XWrIhqMfckZ9OiWN+R1leZeUupj
         fvGP3V4CToa/VCBuvQ55sQmuZXRtyw1WYJf8Ck3CocxeLFpropiJ57qg0jNjqv1mLoEd
         YvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100811; x=1793705611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gpExfa5+EdYVQhWZBFhx1n4JPsMDYFeJfTGAenIwYVI=;
        b=hYs0nI5TQFeVl1VO1yPN5ivTzAe9avBdChI5Y8qSPAqNe0y6GA3BZSmM/fcN/FhupD
         lYzjAcIJqBzUHLf/vTUWxoaltv6agMLrVcsjGu9Mnn+fR9k/aNxX+il53mivqSlNjOqo
         G7U3Z3XkvCFNeYyjagjIQWUk6C8EizNdXvGn4md0WnfTka8Kc6Bsn9nfW7e9kMYTK1HS
         6muWG/CdXzkxCStjssRX4me08CbNP/IRdl2XVzjmaAydbypNGdwBlitQW8sUnPTrxXYH
         WZ71R+S/trekziWFSr/LK+S/cCoQmA1J1iBWgLIcFH8ld/ndlvzaaNRGeTv5iN45mGKx
         WgFg==
X-Forwarded-Encrypted: i=1; AKwUvBzzWBYntMYrXCA2fQRXN8XmH4HhLmU7xl1VagUKS7A+pxM6zmIuYR+ifMjqqMHtc7+aV5XIGbu5nGTh@vger.kernel.org
X-Gm-Message-State: AFq9FYLGpL6niKxNPy1ejktWBUwXjuDsrYGgnKNuiJR4PP/HzrszQ19J
	bfIG1UFGr8Bxc8CbmnHb042fSv0bJpM6Wy9Z0FACRFXgAt/kjrp0EYMACHoYbT0Is/BaonyJ8sS
	kJN7xZKvGwOM2eWLSVoVz0xxB+NtXPws=
X-Gm-Gg: AYBFou2S63LhWKm2+hkTwzJvY59xxLEZIWVW97j21EYJGMxjsWioWVrUNtLJlZ0yhGo
	ke0BQBOMrlSf8eK00mifou2yaGXb8MUYm4AksjhDJhvAgXOGqHQb81TfUDH6y1sh4kw6bDbcxVY
	yxFj6AIiiXuWrhutbmQnk8qj3r/BLWXFmre6e08PjbNCWYCq8dFf6IljYDZnIYkML3pkYgTeGR3
	VEQdFFndLbb1G/xHfy4Cm6nVwA0ncVPfH+Maz4cisHCkGyUOFMDNfgZbSSjTMubPexaLgO9Y+Sa
	swhaZjA98iMf3pszIRZok53RuDOypU0nL9ZxkNjIvJXd4Nw6JDTqYxamFoM6kn9MBOagQY6TICN
	n30wPSxqqhaS2kmNyKoqxe8VQXNMAAJGbbA==
X-Received: by 2002:a05:6512:b85:b0:5be:4323:3d02 with SMTP id
 2adb3069b0e04-5bfb71d0a84mr3034339e87.12.1793100810512; Tue, 27 Oct 2026
 04:33:30 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027080758.3990418-1-dc_redstone@outlook.com>
 <20261027080758.3990418-3-dc_redstone@outlook.com> <dd999250-9b3d-4176-974d-97f0cf2fc19d@oss.qualcomm.com>
 <CALkEBsyQCJwoDiR_dnqfVynEUGBi-qNenE+1oAFADPC-6OOBZQ@mail.gmail.com> <b971335b-e7ff-48a0-a1c7-9f369a3ca75c@oss.qualcomm.com>
In-Reply-To: <b971335b-e7ff-48a0-a1c7-9f369a3ca75c@oss.qualcomm.com>
From: Stone Red <redstone.dcity@gmail.com>
Date: Tue, 27 Oct 2026 19:33:17 +0800
X-Gm-Features: AclHuK9uUZ5SH4H8JQ86BJ3eF9SERpKIB2isWpx_i340EjnAIfFER6iMdaoElI0
Message-ID: <CALkEBsw55zuA-dPjUc-MR1S7cJ330+nkHSi5MD5MkHFG1T_+7g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI bridge
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	ShiTou Hong <dc_redstone@outlook.com>, KancyJoe <kancy2333@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks! I may probably update it in a following patch.

Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B410=E6=
=9C=8827=E6=97=A5=E5=91=A8=E4=BA=8C 18:52=E5=86=99=E9=81=93=EF=BC=9A
>
> On 10/27/26 9:56 AM, Stone Red wrote:
> > Btw, there are some misplaced `status` properties in the original dts f=
ile,
> > am I supposed to fix them together?
>
> I think it's good to keep the new style for new nodes. If you wish to
> do it manually (or maybe ask an LLM), updating the file itself would
> be a good improvement too
>
> Konrad
