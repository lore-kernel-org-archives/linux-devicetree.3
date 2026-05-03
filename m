Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABC428FFF6
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 03:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777779765; cv=none; b=gwCld7fYyRpSgn4YTMmbOBjLeWDywdsnDR9rBT6W1/T5S2jeW9HwEjfrgPwF5ncqrJ/7vyCZGMxwtgKnsDT5k6qja4MZJH5sD34NTMQEWMWo4l3KjJiFm+fFniLBzKlan8zV3UbYsLNQTMe1JjUEFqGZECMj/fkiw6WIuDT04CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777779765; c=relaxed/simple;
	bh=tjG1kTWygatN70wVlmDcJrkF7ZiwlCkEtZ14WpNp9YM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8/RWmD2SZFW6TY0XwYxIraNOfpzBPrRQD0TwfR3NEZdy9A9iCHADgqHhH4hboQzIcqmY/qT2rQRvUe6q/lNpKAVYb+yUA9Idp3/HfqhsMkRHo1gwQdGAUp1dlM33emzcuVunbjxBS9VC7HOdKmbQYp7Bf2ZRVrza0q4LXE0czg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bogIRTBj; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bogIRTBj"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso2063460241.0
        for <devicetree@vger.kernel.org>; Sat, 02 May 2026 20:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777779763; x=1778384563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PiiXKGJux6g44aioDbCLD/YNgU+NyVlVqd4RaEM0CyY=;
        b=bogIRTBj2NYB1Wx+NISe61rixqiMmilhr6CMCY7MKJG9isjO5Seco0qVA/yOZsaVcG
         5pOsfzym9wWCYc+pUCe6ybYbOqDaw5zC0prMnbavrZN7dY+N7ngFWBC2pIh3QZYnKi1A
         MXRpArxUJogCawuyP3oz0W1TlDavMuTk+pzBS71GlcJV/OQ/DfIqTQmnc+REdEkj0Z23
         ypD37ohPkyq6mpAQIl6Oci4+/yiHktxJXiKQTsRzk7G4WARSfY3POLfuEX+YzMzRsQVn
         YCRXv2utqrytLSwHwSQ5lGMMCAVityzCZ7CO7b2wBaQGFvkVWyXqQ0wCLDnkKySuwXAh
         +ZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777779763; x=1778384563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PiiXKGJux6g44aioDbCLD/YNgU+NyVlVqd4RaEM0CyY=;
        b=Mzj7LpaiX26bVkyAhxcTb+0oS8Bzo7yQ6JMAkrIIj31sYBU4pdiRm1AvKF645M88Yp
         Vbdn1RzPU2Eg48c+kqCZGFIhKp/9iZz6TCFSCE2S1cwu3YuiSDSL7yw1P1eak14asG6K
         B8iA8eMXy2llGtbm2xlrac11dNaI7CN+8hWQEq7k3uBO2rrdBuUkOMdL88KNMwVcsJty
         OQ3M0GWyjiqHAbBUKiHRT454vRlWK/CKREfXznmANYB/1cXAZN+s6cMoXOM+eRayuXV+
         PsblRX4fzN5DfooOLkdkr8oB68VCWCPCvKejtE/y39EiuECkUUhDeYMCw9xDQEb5o3mg
         Tr6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9uMZsvi/c3DCOucu0hkFPprmJxY/HXMnR7ymz9ySdmLyxC0wPCR7xb/rI5W/oknIxQkuudOUtSTQT5@vger.kernel.org
X-Gm-Message-State: AOJu0YzLBfmiV7O/bRHmRJDRd1AWJn0mYKXiHbbJL4EDMDZtKd4wiR6j
	tp15ziIQhpfD+SESLBtwQWXfdLaKo+RjDbGbSpnTPzQS0799JKvAXPJc
X-Gm-Gg: AeBDiet54Zi0SplKSRgNKpbuBBEUeonBlVsdwjktCRP4D/mq6DDK7PYx+ZttdxaPl+2
	GOOBf29sdBCGbctXDB0WwvAfd+YnihorD+qbS+tn6l3MHCJvdFfLJi7bqp08xoSYiVURR0jQJ16
	jY4yoij31r8ntxQYLe4mqWEKmfhK4//vqONEN/A1xrDNcpTkJYsYkOPOlRVY/aRiIcuGstQ+oK4
	CYd8Xs7RE2AUPd+/BsGZ48f/3j+slMLk/7FTtOipAIo9LBo0pIy5jWZfONFnP3b6dX9sWIC720j
	D3U3rSVsBBR0MurmKIamphuZkAkVJn8dWhaB3CgHnPPp/UUct2J3sai9DNx06KcfIj1Qr6GLadd
	BEy/vkBy2x/jrf50G7vPtMXUftT3VRfkPimN2yUD5GDujke94kh/jP6gfPCZGw3QgZelIpPHSCZ
	JXv8DE1T2RGBGc2f5ukie19GX1WbvkmyXfJOC8mUZybac=
X-Received: by 2002:a05:6102:4b0c:b0:604:f29d:84be with SMTP id ada2fe7eead31-62d84a67460mr2488161137.3.1777779762631;
        Sat, 02 May 2026 20:42:42 -0700 (PDT)
Received: from [172.27.209.232] ([129.222.53.215])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0af57f6sm3669350241.8.2026.05.02.20.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 20:42:41 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <1fe6bcb7-b5c0-454f-ad54-5014006edab5@gmail.com>
Date: Sun, 3 May 2026 04:42:35 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 09/12] gpio: tc956x: add TC956x/QPS615 support
To: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
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
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260501155421.3329862-10-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/1/26 16:54, Alex Elder wrote:
> +config GPIO_TC956X
> +	tristate "Toshiba TC956X GPIO support"
> +	depends on TOSHIBA_TC956X_PCI
> +	default m if TOSHIBA_TC956X_PCI

Hi Alex,

In your Kconfig changes, this condition 'if TOSHIBA_TC956X_PCI' is dead
code. Since you have the dependency on TOSHIBA_TC956X_PCI, you can just
make the 'default m' unconditional - assuming this is what you intended.

Perhaps you would prefer to use 'default TOSHIBA_TC956X_PCI', which
would have GPIO_TC956X default to 'm' or 'y' when TOSHIBA_TC956X_PCI is
'm' or 'y', respectively.

- Julian Braha
