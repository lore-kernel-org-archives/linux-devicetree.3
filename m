Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531244;
	b=h6iu4uOmdKoKpbG4cfMB8GsZe0uNSOh8y1JOpfMOaXEBkjxkmKI1Sxss6t9lHpz6na7f
	 MbaBOEkxRwDSZtdPO4vZ5+4+27jbHyUF9+1YhkUs4okabbdKi+NWIOY9apItBsgUJf+LD
	 FMIJQaNXOvsMeRolp+L+eOLosHK7eIxdUk9jp6euAq+yq7DHFxIEJATp0ubQYwKAi4f0L
	 PLQfwzhuLU0Gw1lFn6sxMor76CLWxsOrLEs/qu7r3lWZu8SFt6n5oXwwdpAq8kUKukJ63
	 wCnyhtU3MQHE0ikDlDqmwAZIbeD6OfTfDz+MznA1/PjS0s3DLHplIQM+215Fs71xOEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531244;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=DYyKhOlXW9vNO8qOCDfkv3Le21KXtwEtRqqQk168OAs=;
	b=XvC8rc4pAiGzbrG51kVYTDoadMbicsLJ11s6bLLpeLxSJePHEKsJ120CrZFUGQkSwfg7
	 C5Ns1blLxUaJvEAUzpYnEz+4tEHJ6VFtPc3kPkgZm5AOgYtd0vWJ0Ut2MCENnJTYmwt1p
	 gtpEmjMHrcRsZy41rKehoT237QbcChrbuJprSVnjIwXkZagGx2XtHu/NCsU5ZyV4aXmoa
	 vsacj+HrAmRMl1CbS7pBlqkAhyTM4Cx3uRaOSgZERL1RiK66J3LKcS9+x1WGeRi3BWZ+R
	 OReHHw26hVIlKjkJoWq3luWdkaYH8stJk/HfVikvLHPPczYbsiTDHfHBEP8/7yfvnag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=h3OJZhmJ;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F04606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1F04606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=h3OJZhmJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=DYyKhOlXW9vNO8qOCDfkv3Le21KXtwEtRqqQk168OAs=; t=1795531243; x=2110891243; 
	b=h3OJZhmJ6ODTiTd9MSuIA8BhXUWrEa2jGT8521iidJptWJoFh+FRcBrB109uHeJ9ryDam0WeZvd
	jCrSh8kRsYRCvu7XLPHGPLYfm94OsszTjtv3aHGSK1erSgauyqySFjv5ED0Ev28EbX9vpHInq8Aml
	o+cd+2hSaZZ3kbcWjoGNsp5ETOiliSdxKg3qUid3fsj0Vc3RbN38Fxm6XiP6XDIdfd6xwOTDnBY9g
	GfvFncOlnGFHVqpZnnmti1UVgg7TdZzwepMpXZaDKCCVpYbSJnb7QmdiT6MRp4Ge6QOJs5cHA0pHx
	zXDIkVHNvsodNMo53MkDBIpIggfL54NDSdGw==;
Received: from [179.105.94.163] (helo=[192.168.0.4])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xVrhH-00000003Ou7-2nE5;
	Tue, 24 Nov 2026 15:40:39 +0100
Message-ID: <92a7f98e-60d9-49c4-b8aa-bf80ebe73283@igalia.com>
Date: Tue, 24 Nov 2026 11:40:34 -0300
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/v3d: Remove V3D 3.3 and 4.1 support
To: Iago Toral <itoral@igalia.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Melissa Wen <mwen@igalia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20261122-v3d-remove-33-41-v1-0-52152b454ad8@igalia.com>
 <20261122-v3d-remove-33-41-v1-2-52152b454ad8@igalia.com>
 <164b646734156ec16171abdb0de4ce1f3a723b6b.camel@igalia.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <164b646734156ec16171abdb0de4ce1f3a723b6b.camel@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Iago,

On 24/11/26 05:18, Iago Toral wrote:
> El dom, 22-11-2026 a las 12:47 -0300, Maíra Canal escribió:
>>
> (...)
>> @@ -210,8 +194,6 @@ static int v3d_v3d_debugfs_ident(struct seq_file
>> *m, void *unused)
>>   		if (v3d->ver <= V3D_GEN_42) {
>>   			seq_printf(m, "  BCG int:      %d\n",
>>   				   (ident2 & V3D_IDENT2_BCG_INT) !=
>> 0);
>> -		}
>> -		if (v3d->ver < V3D_GEN_41) {
>>   			seq_printf(m, "  Override TMU: %d\n",
>>   				   (misccfg & V3D_MISCCFG_OVRTMUOUT)
>> != 0);
>>   		}
> 
> 
> This looks like a bugfix, since MISCCFG_OVRTMUOUT seems to exist in V3D
> 4.2 as well, maybe split out to a separate patch? Or at least mention
> the small fix in the commit log.
> 

I can mention it in the commit message, but I don't think it's worth its
own commit. It's not a functional fix, as we will only expose this
register to debugfs (and I wonder if this information is useful at all
for V3D 4.2 development).

> Otherwise, pending feedback from Floarian and DT maintainers on your
> question about removing compatibles, this patch is:
> 
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

Thank you!

Best regards,
- Maíra

