Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E614A3BB9EF
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 18:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776711324; cv=pass; b=i+GOOXsDe2u3RZeg6UkJnVD9/YxknewPJWbk8b3VeBzlTu2EB7BCGtqf5xgcBV6Jj9rCXCZmdAq86056AjCiqaCEx7W1fazELPZ5i+FqfyiK5VTuIksjURJLSwGC0emtKb/Lcbg+xXMER2lvjTcDUIYHo7wd+uEFN0sL+Cp2KTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776711324; c=relaxed/simple;
	bh=/TbSc4wIaTNekDpWJoEia/VNp42iN/javNkAebojTos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qb7FsOamH1gRUw48EUlGJh8lfSKCRrHeKa1egKUbqZuvlqo6Cv4yxqjx2AtrfYKZyL+rnJNR0fArsloAM5C5qmmQ9wTinJVfeh9GLSkhVTSieevQgSoXBXb6E7a85LoMLmSnS10dk959Qv4cXoKxDrr9AKZulny9uW4ba5W7sWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4yB+TSj; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4yB+TSj"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1279eced0b9so4894729c88.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 11:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776711322; cv=none;
        d=google.com; s=arc-20240605;
        b=N8Pijq59B/WvOhvFJZjmWNFEQtyDywARJ7L3nzIy8ugtUyF/mIsiFvk/Ojmo2PMy5T
         r4+5WgrH2A2BdYTvPDQ4zFuUTh5+hgWRdilDd2QumGAz9ydQ+oE0dkVf3+smVvH57LEf
         zkGuVpl8FHNCDGPNK2yn7GFur3DvBCm4vsHqoRWkkKuWKzmKsyEmClVcyDrGkZSc1wwF
         1F2s0tIVs3YXXy019+jJCD+luNlqZQ1qxR4rgiQv2qENvsj8I5ax6V0tij6BVtkOAbJi
         677EOkOi8fXp6ZmYRPr+57vv1m/iB9xEgVP+y6CjSOxEjwKcAiAesUaZY1jk3EH25cxS
         Z7xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tt9B5hG1IL0IkDEHbywRyGxf1stTa56hMDH0jd2Y140=;
        fh=kTSaKE12e0N1mtmpbOVsmu9LWI8E03iHLox5NI+OZeA=;
        b=NkxLNVFuJDpnSvQSUtWR4jAB3Iy6i/qYKOVRfLwlm4E162Ux99lE7E+3GPwjmlQmvE
         yIc2jLjcjzASj+AdBCrDQ7VYmzhhFAOEmJl6e5j/kOiCBAWupP0fRn+EoGhxqjHyC9ri
         AIE/+knfAP4aUFhvAD+GmL4ray8gFOn/KlN9Y4qNHmeTG5rZ9TJeFp3Xo3Usf6OhAVxJ
         d7iu2XWNfJBjc/E/K0x4pAeZYPpf7o4kHj8iHdqfFK4+q1l7E7XT8XMQMr3TbumYNKjs
         mU7yBy9ZHupywg5T4AmWuW1URnBEmbtDowa0ZH9hB7ehwIQs94SECgRyleEcFUB9ny1Y
         HzEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776711322; x=1777316122; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tt9B5hG1IL0IkDEHbywRyGxf1stTa56hMDH0jd2Y140=;
        b=g4yB+TSjtwdRwPpcfeNgQgyTdK4STAjX+4YdLz7AwmFnpgetH8fRxqXbPd0NGwcspO
         sPSH0XMS4hGxGV5Hvkje5+VHGBgLg9FqL0v0flkq3bgf6HwYg1f1Z8cp+1okvOWpUvZI
         IKuLHxQs9L9NRMf59NOSy97vKk0ZFdvcAfJVJH7IKkB6NHr4HpdHr8VQTWRHRnax3nLc
         73g9eKAT1FxEpYTjRlRt+KwgtGJX509iWYWPiOJIgXikS4z8rSXEG80Tn67U6KGr4Etg
         3c8a9Vd3dqeN7rquzW1IVTP913vEspPzoHwlBLabBfR08BbNk8q/pCFFse0jh677zSPr
         kjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776711322; x=1777316122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tt9B5hG1IL0IkDEHbywRyGxf1stTa56hMDH0jd2Y140=;
        b=Js4k7Ia7QfrFait9HPvX9kHCZKSfujvSJc8cAMy6HBjL5zM1V4Kw2f4hFXQuS22sRV
         D03PmdTymHLQSqPSbHXma8o0gc7qXprAeZfvmMI7/5n+JsGqDhToA6nXRHEPl8vrVRbC
         4KZzsjPI1e9vWDA7O1gA43AV6cfmoTqQH5X4oos24zY4dOmOPwA2lSS93lfW5dcJ9Db9
         zsOCJMB9/ojiz3I5TG+AW9DIKqPBRoGVPWZDD+3XwuhyM4jGxX42KwDH62J/oZTPxcf8
         oETTAb9TpbtvdYnO8sEd2c8O8+d3v3bLvF2pZfAGoCmlBYz1MYV4vu1BlQ9P/MKHWlbd
         ATLA==
X-Forwarded-Encrypted: i=1; AFNElJ8pK3VCw8jZFXPkPqnVSKK1pW8uZT4SjywGM2/EYZJIhJHEBJOP65rBYqSbTslvqOQUcSi9ICJ++VnL@vger.kernel.org
X-Gm-Message-State: AOJu0YyTP7lIdzgLy3dyudCecsmRCzIpCpkpXJjCe09EZublW7ma4OMQ
	RyzSrQmMyA8s1w8hmrmxagLA62yYH1wZx+UV+4dvsupi4n2cAzEkFLDbjIg1FZKAsFjyvixFkJu
	4xJpztNUgQeCnh1sfGIDsOnzTp36ZGYFS+XZ5XyyxdA==
X-Gm-Gg: AeBDietLlqFcU/EPfkjsqVyQCVosEKKmDyQoywq4aa6G5lrNogRA/8QeY7xAX2DfS/a
	dDrDKD8cPi76b3Y13tzmksrtbadDQow8EThD6fp+pjYJu3iGIIT39+bKKNjJ5z3DQZB5+j4jYzG
	5l2J9LETSH4czvq/FDxlex0PvMpp/OMk/7V4DsoWeTFRBAzZ9alZ7b4OSVuC4dzoubI1Z04nHJ0
	+RIpIoTvx8NTBLNMLh2n0tlliEOrXu9aGzDtI2RQrYsmYZKw69d+uoZxYRQl/1zlN7Weri9Q3nB
	MdftL0NQUwYCTgSD
X-Received: by 2002:a05:7022:6882:b0:11b:923d:7753 with SMTP id
 a92af1059eb24-12c73f6d69dmr7548688c88.3.1776711321897; Mon, 20 Apr 2026
 11:55:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAmW3WY3bhUXvUZcPpwkD5NhzGRSv7b+tUKbNZcROvkqQbyTMw@mail.gmail.com>
In-Reply-To: <CAAmW3WY3bhUXvUZcPpwkD5NhzGRSv7b+tUKbNZcROvkqQbyTMw@mail.gmail.com>
From: IRRatium <majnkraftiigry7@gmail.com>
Date: Mon, 20 Apr 2026 21:55:10 +0300
X-Gm-Features: AQROBzCzIaFYoierQgC1E5PGXrG15FutaN7xBA9MGwBT0tTAiodRFuX-9czHqAw
Message-ID: <CAAmW3WZvTB3Xr0CwVWBMJ1_dR7XOizyuc=XDvK8dw-bvEsVYYw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: cs35l35: fix typo 'overide' -> 'override'
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, david.rhodes@cirrus.com, rf@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fix typo in property name 'cirrus,classh-bst-overide',
should be 'cirrus,classh-bst-override'.

Signed-off-by: IRRatium <majnkraftiigry7@gmail.com>
---
 Documentation/devicetree/bindings/sound/cs35l35.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cs35l35.txt
b/Documentation/devicetree/bindings/sound/cs35l35.txt
index e84f30c5c..1d364b3d3 100644
--- a/Documentation/devicetree/bindings/sound/cs35l35.txt
+++ b/Documentation/devicetree/bindings/sound/cs35l35.txt
@@ -82,7 +82,7 @@ Optional H/G Algorithm sub-node:
 Optional properties for the "cirrus,classh-internal-algo" Sub-node

   Section 7.29 Class H Control
-  - cirrus,classh-bst-overide : Boolean
+  - cirrus,classh-bst-override : Boolean
   - cirrus,classh-bst-max-limit
   - cirrus,classh-mem-depth

@@ -155,7 +155,7 @@ cs35l35: cs35l35@20 {
     cirrus,shared-boost;

     cirrus,classh-internal-algo {
-        cirrus,classh-bst-overide;
+        cirrus,classh-bst-override;
         cirrus,classh-bst-max-limit =3D <0x01>;
         cirrus,classh-mem-depth =3D <0x01>;
         cirrus,classh-release-rate =3D <0x08>;
--=20
2.53.0


=D0=BF=D0=BD, 20 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 21:53, IRR=
atium <majnkraftiigry7@gmail.com>:
>
> Fix typo in property name 'cirrus,classh-bst-overide',
> should be 'cirrus,classh-bst-override'.
>
> Signed-off-by: IRRatium <majnkraftiigry7@gmail.com>
> ---
>  sound/soc/codecs/cs35l35.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
> index 7a01b1d9f..7d9b42c5a 100644
> --- a/sound/soc/codecs/cs35l35.c
> +++ b/sound/soc/codecs/cs35l35.c
> @@ -1311,7 +1311,7 @@ static int cs35l35_handle_of_data(struct i2c_client=
 *i2c_client,
>
>   if (classh_config->classh_algo_enable) {
>   classh_config->classh_bst_override =3D
> - of_property_read_bool(np, "cirrus,classh-bst-overide");
> + of_property_read_bool(np, "cirrus,classh-bst-override");
>
>   ret =3D of_property_read_u32(classh,
>   "cirrus,classh-bst-max-limit",
> --
> 2.53.0
