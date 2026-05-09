Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6604A2580D7
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 15:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778341103; cv=none; b=EHYi7DrqPW+TFhX9PRhl3ZlXqfK470NfG6pGoTHXaOK/txJX3WcWZJ6ewayRMD8CZeB11/oC3C64uMaahfkkOmdrbiH8qJ1XuhI+cZwng4bx9rrh0muhlWai1hao0rTCZ1/Z1y+O3ZX8jZijhnchbGLa2ijjJtE6mXWkhvJkxlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778341103; c=relaxed/simple;
	bh=gLKSdOShGg2uo9akYAxRNmgFpbWG+H/A9yxY41Cj1Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gjcijjx6Dx0DKqwhODkOjRNNKsPGbipTCouY0i8oAPh4pVkFCkdcEcdUIFE9Fjw/VPynyhGDiPIBJZHdCujMpfX9taWwII/hoNTHJ6J+oUE3cCAB6RcMGZMtergu+eaI4SrXU9Ur0Ispl4+VKhoh5amh3k7GyM1N4kt5P8IDFNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NzYYw0tm; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzYYw0tm"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2f33ae12f97so2608078eec.1
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 08:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778341101; x=1778945901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjmP2EjAZo0hE7GjYBWYjrfK9ueJxklnVjumEmxItLM=;
        b=NzYYw0tmj8AKhcs2nzO4Q8L54dGP9P4u4luMqhJ6ROPPv2HllgtB05ILwNRiqHaMBO
         yJ2miicFqOHtg99vsrYQiTHcKnKTIJ5KGEtlQBm+IDOjb+/6fpNfoFE7Qe1nYcNTWaw4
         vEyT0r7q7V3fHFeBKT8ZA028cy/zse8N+islCm15CiWniqSuNnHiN9zLNyy0OpCbuG+Q
         7v8nv/XTTnUnrwwA0D7ipwF6R51EvbrnP78JwFGDQ1YgsRplf4c+/jnkGMioUPNPJEWc
         rMgY3Q4CcP1ogpAq6AVpN9yUK59jDz3x4XLpdc4QB5LoMoELX1ZUEvrYcJcti3RBQM2H
         /2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778341101; x=1778945901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KjmP2EjAZo0hE7GjYBWYjrfK9ueJxklnVjumEmxItLM=;
        b=KXmCt89fWInf0eOvl2y2gXwCv6R9EIZ8wikshsrZUUGtlWxs7OADAr0J2QICCAa2dO
         6Oj98M4N7+7Np4YaivljkUl54T5rJxnlO43LUa5bmWTnudwGgDOzTyXIPf/61dV72CWS
         Z2fjcZfi8J7AkGXQ4MoT1/RQC7s46Yc5d+a07LvbXa4PnuJllmrV3Gg8q/UVrwbeE8Tv
         rvZoFBQ7RNVzgqtMjBJKb3DwkQoocD+5zqaOqB5JeqSZDszX50ikOl+i8mR7qiJ0Ut/3
         aR/ItMWxuvJ+5qlWJmjz9BomaXpddWjvwTxuRLd5XSnLE6kwTENEfvrY6KiHZZPPITx8
         SGEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SS/73hVNr39E2bs0jCLV/I79kgzdmb0TlLCsWpKJ3r9ACxeGW861sItgtQG4rHPcT0hlRyoieOLxQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzjSAdlKE0gkYN/jzgw+ks2e9/TkrWbu4FL0HRE5h61Ecu238A9
	wHUKFctb8MC7N6SuZ3+BfhKjoIMg0JcK7G9paBe6XL14Kezh/hvDYrIs
X-Gm-Gg: Acq92OECmf8QfoYee7eeIbgrksog5YUNInDNHuuukaxfNiT5XDPIBS5ceUS20Hd5ACX
	7MH1clJ66Q0iIHcnf4M7JQ7W8D8L0kW43g22LkeaWsS8kd1YwjJZ/UbB4+1gqaUpSam6YOn5Zr5
	89TiJiNR3KxAup7J/2sQaZxA7nJLbSp6J5afwmw3Jm6d33znx30H9Vruhp6BKs+Y07MKUEVOTIA
	bN3h+Mjc0+Vcy5YC8Heh0286Mef74I0hNtuKV+yWXv2pRWQ3lxdm7BrvfRs6Y2l1tdFT/PzeZte
	qWxVe4oePhpeJHiF3X5I+cwa0U5t6VAc2lKvnYgOYm8JpaL8O6VG18NN2nEpwZVA1SIdOe94jnA
	QZdHOAJVLbP+ZPQK+3yraFoCHQW2N+i38ME/3p1E9E8Txt1MZrR71NiZVA5VYKNjYZxdK0wAqX/
	7YFjdyaTy6PVgZ3IbJpk9eoq0oHRNCxy9LPXgK
X-Received: by 2002:a05:693c:2b15:b0:2d9:6373:ad22 with SMTP id 5a478bee46e88-2f85c07f8bfmr3256312eec.12.1778341101337;
        Sat, 09 May 2026 08:38:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88924af95sm6551514eec.30.2026.05.09.08.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 08:38:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 9 May 2026 08:38:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Chang <kevin.chang2@amd.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Colin Huang <colin.huang2@amd.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: trivial-devices: Add Delta E50SN12051
Message-ID: <cede86e8-8bee-4bb4-b6de-e9bc399d316b@roeck-us.net>
References: <20260508-add-e50sn12051-v5-0-abebdcc29665@gmail.com>
 <20260508-add-e50sn12051-v5-1-abebdcc29665@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-add-e50sn12051-v5-1-abebdcc29665@gmail.com>

On Fri, May 08, 2026 at 05:44:28PM +0800, Colin Huang wrote:
> From: Colin Huang <u8813345@gmail.com>
> 
> Add 600W Non-isolated 1/8th Brick DC/DC Power Modules, E50SN12051.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied, after swapping the inserted lines below.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 23fd4513933a..0f10368a1386 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -100,6 +100,8 @@ properties:
>              # Delta Electronics DPS920AB 920W 54V Power Supply
>            - delta,dps920ab
>              # 1/4 Brick DC/DC Regulated Power Module
> +          - delta,e50sn12051
> +            # 600W Non-isolated 1/8th Brick DC/DC Power Modules
>            - delta,q54sj108a2
>              # 1300W 1/4 Brick DC/DC Regulated Power Module
>            - delta,q54sn120a1
