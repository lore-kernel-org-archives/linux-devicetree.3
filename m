Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48513F58DC
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750933; cv=pass; b=JSBjs/vh4tDQG/iiy5hKUW1gntH8mYm0iVx7z8amwDmiH/xJZnMxccobLgO8WdJeyzXYD4IptPBJqnjK4wOjc5+2vGJXwTqOyNRrQ9+ajDz6I1QHRCYOc0XzQTeAiRcFrDtXqrplLYkaUDK8g5P989xfIxdDxT10rEwbIipC5Nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750933; c=relaxed/simple;
	bh=POsdw8DAXZp9P24GbQy3+qEg0KQpZiuwyetUPJ9VFEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R4itNo2GAoB63yemXYlK7Q/tmtncGDgnXESTrHo84NRR1XMCbtM42WbUeqOzp38LkCHKEmR+BIm3OLXRKxbrSl6iSW/md+2cOpaZf/nSNd1xr/9T3BXD/YIwjQ6mrqJXzhfyEn/OC0alL0ncQrTSkFVdAadnlja97L/dFYPJhlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cptktljN; arc=pass smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cptktljN"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-1473f265b82so1355169c88.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 23:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790750923; cv=none;
        d=google.com; s=arc-20260327;
        b=Z0whsW3GwjMTRL4HBpW41++ExUtzTcVEEHBAHjd0cfzTczVQ7dM5Qjr9kPMHdrzpMm
         paGS3mwHVw1dO87Q8kKqNA8SjjagMnrZULTFw3PjbrebEfc+XOFiVv1ItsboQoO3IbJM
         fW8G9Fudx5wVQjp5icC2TCdWUADIYPmsQoDWERzqqcQxIs6K1T/Pye+XzFFWWJbFQnO4
         ht1OZLsfVBYWOKhS2ZulbePCQBFqCJ3JGvob4nhjj4WDSWrL3My9P7Asdp3fTDOsqZPQ
         R0DdTb1l0X357y59kQhVkhSCs2EGK+eGndJseZ4YBWhrO/zQho/MUKobvtx8f3vtx/Uo
         aGMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X1t6xV4OxZYPdZ6oDbVsMlrNR1plVN1+LMd+89a6Pg0=;
        fh=PuEcf2MmQlrucerBKNOinZzutxaoKvW7PJTcH1U0GUo=;
        b=eULedRfuPYpwS1Tb6EiYQIal1kaIfrKmkwAL9A+tmdLEeD9IrJYKlAu3W6D/NPyzJa
         9MFtMPBdAeW7Gusc9Tt8zAbc8yNomJ5LWCbiOfcI20KRlYJcJSzRLCsZV0Cj0sTqEFVm
         zd21D8CYZYwKsvRcHN9YI2ITbcnmuObH6XjZ8l7kNlykjzWvuaFVegEfNSt0hVgHQ5oM
         yihOJ1Lu63aFOcrlOVpiJamW30AVeqKctwxcDQ1p10Od42RfOiUPPHg6JBlfHMdO76sQ
         nGQN/3UpgfJDwSQZ8QG2xdm21Q2rs4OQ4mWYCVasfyanxLeBgtbVmCGipjBFGexMCQH7
         oRyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790750923; x=1791355723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X1t6xV4OxZYPdZ6oDbVsMlrNR1plVN1+LMd+89a6Pg0=;
        b=cptktljNQWMPFuJCNZJCkD0VCVQK8thkhVYiu6u696VirmK2DkKI+uYBMOYJA6beLx
         akkFJNzYMOFehH4so7ta0elTCy1P2JLde8PyvxPCqpIgGZ5AyhBj/TuaAnOit6C8nXrr
         2Pr0OFqlnEdPCcAFyJm1h5N8AmRbYgz3jeu/4hufEznZ100BKxVyoy5Q40P4CBEO4His
         K5iF4TVmI45p+6JultrXSEh/JS+FxmZS/MbP1GU78Wlzl/TcdXFAK52qGU45nfapgZej
         wGgPuU1ToLmUe/xos0mdKaf1fctpC0Fggf4o0FgdwKx1V9Pv3SAQH9aJOKUrHviaJ18Y
         lWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750923; x=1791355723;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X1t6xV4OxZYPdZ6oDbVsMlrNR1plVN1+LMd+89a6Pg0=;
        b=ex2ws3/pBjUTm7D1o8ioRbKqJpi2xJ8tGSORH69xc61Yladl6AL1H8MvOO7NJC8VMf
         SUjHIYQW4gHGOivnm+36uxR88tAMSXknASNVsuCo9mdEe9My7W/tsJh763gT/c3FJwqL
         Ufe4yLSu+6VlZCu7/G0DuxcwYQNegZT4FCONbgwWtN9UkGS070YUzWdiIWFVqEfLLjuI
         T848ah67VtIp7uaLvlxxBb8Qd6pA7OQM54LAE7WTO5af6Uxnh2sCvsAo9tVi6KFbwFPj
         HZtufi/oyjkf2WamLp2BQ4Y/VnSFaoB3kbKGfJBSEV0B5zEMAEGp3Q12Cp1w4IXGki0h
         jlag==
X-Forwarded-Encrypted: i=1; AKwUvBxLdY6/7rBShA9qLqWmCWcZxQeNNa8EpCcYCdmP/l/bb0/SJAtMh4+11WpNoChrBh3umKvJuc7MMQzL@vger.kernel.org
X-Gm-Message-State: AFuF++k8a5bJcbJ8Ob5Sr5z6mi944yJF1A4IRfGb/jSfloXNOYV1Lo69
	AbWDs+NpUvOg8Fp+BaD6+1RePhECvI5H0NF5HO6bCc9NInb5bAjXdTWgV94eLe5+jwx5wFVX4KE
	EypbprFGC9nSJdKstmQlHEoQVPG3ieXA=
X-Gm-Gg: AYBFou3/5/5bmp+831MGuuu65BdOqrJpk4WR+olGLe7XNvnAT9dxi1LlnuwirKzx5lI
	QMCLJsC8GKywbIFnphsUNxnHLxghpCmLS6K4pQHUKBF+QRBSmZ1HOpOY4c5K755e7+6jY2fGIwt
	pwiTIg2ehcFJziD7O8W53kYn/KZe/JPM2ueCnlm2l7ehozeXlyFhVUgO+uNO88PHwwaudQikQQx
	hiemc5ee/HJqcn6qCTbsQWjW3RCnM2GCfeg3MJrmibkLxOyq6W4LTNKoyPSyqFidZQovgK3IEfY
	OpUOhSXg5iPT8/zirO7iP2C+zqQnCXxkqvFINR2pJjhoUyBvWYGHEuPsK2CK5m2oxyH3f4YhndO
	8kMxe7YhSuFaJ
X-Received: by 2002:a05:701b:4559:20b0:137:5b9d:cf87 with SMTP id
 a92af1059eb24-14d2d8b87c5mr350558c88.0.1790750923534; Tue, 29 Sep 2026
 23:48:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-dalmore-fixes-core-supply-v1-1-4bd87fd70b0d@nvidia.com>
In-Reply-To: <20260930-dalmore-fixes-core-supply-v1-1-4bd87fd70b0d@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 09:48:30 +0300
X-Gm-Features: AclHuK8RGEIMLDdvt3o3LTWf4pTCoSeW_y63rIuDyjNVFqdJQJDqKc5Xp-ebQUA
Message-ID: <CAPVz0n02==Zq3sZvW3p_pPs7RUASvP0koWNjsAZY289gqnNxxw@mail.gmail.com>
Subject: Re: [PATCH] ARM: tegra: Add core supply for Tegra114 boards
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 07:11 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> After commit 4cc90d4c043e ("ARM: tegra: Configure Tegra114 power
> domains"), a core-supply property is required in the PMC node.
> Label the core regulator on Dalmore, NVIDIA SHIELD and Tegra Note 7
> and add the property.
>
> Fixes: 4cc90d4c043e ("ARM: tegra: Configure Tegra114 power domains")
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> This skips TF701T since there is already a patch on the mailing list for
> it. Tested on Dalmore, but not on TN7 or SHIELD Portable.
> ---
>  arch/arm/boot/dts/nvidia/tegra114-dalmore.dts | 4 +++-
>  arch/arm/boot/dts/nvidia/tegra114-roth.dts    | 4 +++-
>  arch/arm/boot/dts/nvidia/tegra114-tn7.dts     | 4 +++-
>  3 files changed, 9 insertions(+), 3 deletions(-)
>

Thank you for catching this!

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab/TN7
Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
