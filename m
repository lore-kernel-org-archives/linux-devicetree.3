Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B4A4418D7
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 18:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778093479; cv=none; b=oFfrnEKv1LE9MQSqL7kv42esio6JQboB37Kv74u8N/yENimjgqa+jUIgRSzs7oppDAWdli2hwvfRxHze3KShUkaGcdf86mAxvddo4fCPF9fSjoXjwOM7giDNyyRobXuje1NeEiqIeK02/ymHjbzZMswmIsBliJsnNVuJmSanvl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778093479; c=relaxed/simple;
	bh=s8SojpSoc+YK02FQkvYYyW4yXNu4hN2c6ETT93ArWJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V3X9f/LhACEhTsjBndmucT6rL8sfMNvUVPt0pgmEzyZIr4qJgBxD9WyL8M1MmaqExzo5lp5KZQIRruvii7C/f0AJB5f5Yze33JN/D79tlIXoa4tmtzp4i1kukldbOaRXJb6/IKd70XMYgsET5CAC1xA/xVl4QsukfxR3UGu1lCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=yqlozRSf; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="yqlozRSf"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8ef45a6d9dfso3878885a.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 11:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778093477; x=1778698277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qVXRMaORBAm1p+hmPERIzD3vaX/XPR3tJcXrI0tApsg=;
        b=yqlozRSfuCUJJ9D/wW3WpVlAitl6p+MalJd4d+qGeBPP7HHYOs15Ifo4zv4JyQM3RY
         oHUbujbmeUjmk/O4VeGR+RGnA5ACtoV1slnTP6zjtIbj9FGxzvsCksN3JeAJuUeQBmX1
         nRTiF8ZF9styqnDRIE7ecUgF92XqjybzmU2tpys//cSjNx11JXVgSmQFJy+B++GX2ZOC
         u6zWm0k2NWbcK/N5MW1WjdBqxvdMsVhpGXTL2VLC3zGDINTcSdycmkw83ftcdERHrH5w
         WiRYxhwO/qEdWGPjZdrnDZShFy8obFYV9aNveGpk9ZuEsT82efZmnwLdExxspdhvUjsj
         3Z3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778093477; x=1778698277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVXRMaORBAm1p+hmPERIzD3vaX/XPR3tJcXrI0tApsg=;
        b=aYww9Agz8mG1azz3eYiQ3PyE3dq2IFYykMIJv91gRho3tNTFkgje+OoXNJZKYE6J6R
         RGEznnU2MlWZaFAP33Dj+jeHteZrzJ5a71aDnEXfoSXi+XDyZaBsaZB0SBsqL+ClTNZh
         hXPlcjPI2fb12Y+uAxCBUWijHGc9yo/ZdyOn0ogdlVPOnAqpyqjBJw71WyOHYrPe8UPJ
         lA6feb1kYbmW1Jd+6uW5UTOn0sXBWh66wCJzl7uUojBdpao5bmoLfcqr31E8PkO0niqH
         skPgcCGNY4pY7IPNFdJGtcyFJq/yOEEtmcz9ZhSre6p4uaJowsbMZMwZTo5JjciYj0V7
         k9QQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Y7ojh4EpRcCpcGmOY32tWC5De8D0j3sE8Y4ZfNQC6Y46h5wF6Ns/eCuKBVcmzOTd8xEMESHE8y1JD@vger.kernel.org
X-Gm-Message-State: AOJu0YycNcpVVXX6XKC2GykXPL57f8n6OUep2moM3VdPfvzkl7CJLGKd
	vj7gk9tGUXHE0d0kVIsCG93/4rcSlISdPG2iI8dFmKmwxYpyvDFEPLMN1B9sePzofMM=
X-Gm-Gg: AeBDieuB5N8hebTa21wGC55H4TtU1NXEHqBFFl7Sy/SpNmZwqv3z/BWLlCoO6syIc00
	Sq7zeouldH/oBgxNgKPF3+p5LvLqyXcwlsQtv2R2cgGIMtxF570zJcuwYE25NIV5nMYEvsDkjVS
	z16veTdWvph+71NDA+yxn5gTS7lNnr/1GcDWKRHILtf8XnEl44W4a1AKejP4yXqDZGptinDCeoI
	tts2MqTdeknd1+DgnGpxVWAgrWusm5zlkBJcfp7KU5EXz3HS9XwJM95IvTZuVtj2zuuZcbNyg7X
	7W0dZd32KsELX8s41SwXDblEQ2Gfc701JuNDEYohLH4NApXR7ZLezp1ncHImFxFo/CVNVqiXV5i
	WhwwpXNEIT2MnEh/VohPoIiEiuiNOgiCI+C7CxXqoIGjX+2m+T49DDheo7JhUc91Kavn5NcNEio
	Y14PqkQvk1aKiMqIvstbI7uFKe/CgpqX+u+kBfZvGeJaSZW7RNFM9p270sJ7XEPR/jNMokPcEUk
	A==
X-Received: by 2002:a05:620a:1a13:b0:8cf:d804:456a with SMTP id af79cd13be357-904d4c54265mr713100885a.20.1778093476942;
        Wed, 06 May 2026 11:51:16 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc293837b5sm1889639085a.10.2026.05.06.11.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 11:51:16 -0700 (PDT)
Message-ID: <a52659e8-0382-4eb2-ab2f-5563bbb73fcc@riscstar.com>
Date: Wed, 6 May 2026 13:51:12 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 09/12] gpio: tc956x: add TC956x/QPS615 support
To: Julian Braha <julianbraha@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
 <1fe6bcb7-b5c0-454f-ad54-5014006edab5@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <1fe6bcb7-b5c0-454f-ad54-5014006edab5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/26 10:42 PM, Julian Braha wrote:
> On 5/1/26 16:54, Alex Elder wrote:
>> +config GPIO_TC956X
>> +	tristate "Toshiba TC956X GPIO support"
>> +	depends on TOSHIBA_TC956X_PCI
>> +	default m if TOSHIBA_TC956X_PCI
> 
> Hi Alex,
> 
> In your Kconfig changes, this condition 'if TOSHIBA_TC956X_PCI' is dead
> code. Since you have the dependency on TOSHIBA_TC956X_PCI, you can just
> make the 'default m' unconditional - assuming this is what you intended.

I'm not sure I'd call it "dead" but you're right, it's not
necessary because it already depends on that symbol.

> Perhaps you would prefer to use 'default TOSHIBA_TC956X_PCI', which
> would have GPIO_TC956X default to 'm' or 'y' when TOSHIBA_TC956X_PCI is
> 'm' or 'y', respectively.

Yeah that might be better.  I'd like to eventually include
COMPILE_TEST as well, and that might need the "if" on the
default.  I'll find out whenever I test that.

This GPIO feature should still be a module even if
TOSHIBA_TC956X_PCI is y, because it's not always
necessary to enable the GPIO driver (depending on
how devicetree defines the PHY resets).

So:  In drivers/gpio/Kconfig it will be "default m", and
for drivers/net/ethernet/stmicro/stmmac/Kconfig it will be
default TOSHIBA_TC956X_PCI (at least for now).

Thanks a lot for the suggestion.

					-Alex

> - Julian Braha

