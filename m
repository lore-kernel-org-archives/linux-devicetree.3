Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001013A5E97;
	Mon,  4 May 2026 13:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777901519; cv=none; b=q9FZOk8CqVZt4m89+6F4d74v7Q/mpI9pnr09CnhdWEuT35lKuUyoxgwSvxYBfDYCR++pqnLTtRoJN0/FOzTrAqRVWsefsZVys2YsEfZuIr84aV7jhF8YJpfLXwYvPruV0RxzFebhOeM+ssNV7MfLa313fHtdH2zdCkXDKE4TphU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777901519; c=relaxed/simple;
	bh=ZEqiKTXmTlNWp0lfgFzcObghy8RWuS5VJhcnNwkhYV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sE4jbQeS4vGz/p48L9dOVW7chvZ5F3h2lS7ccGCxnte6WSBI8/5ScMqcYhAuaxcGUDl+fI2OCRzlRm6CXAJG2ZN2Vepbpkvq+eKQVJbRIdCPl3sR6PV7GbAJlICie1IDL14V/gO27JKvdhklwI09S/fEu4NO+LVXT/6arOYZ7GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IcXc/eab; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IcXc/eab"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7FCEC2BCB8;
	Mon,  4 May 2026 13:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777901518;
	bh=ZEqiKTXmTlNWp0lfgFzcObghy8RWuS5VJhcnNwkhYV4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IcXc/eabGMGawAn5iHQ31lyvVA2r7opKaziMsyMvmYw+AIuDnM/zBK/kQR+N2nT+u
	 rD5RJGYP8nJ1o1Fc9t4K0e4sL80PpS3Sj3O8xJJFmBVBC6+BWkU7690WlXF4noLdIL
	 +poUGX8J7bNGAVa1T6tj+3RyIVLfBdmoG8zNRFD0Ddc7okqcZn3JTtYg8plrS4QgWR
	 2tx/xiGDJqrtujxY+qTQIUJQ/QzN/9vstmyFctCrJGvgUm8OHVQHMkHLBzMEy/yzA7
	 caeT96t8Py/MMDjZHlkh3qr0lcYdq3Bs4nEI6R3pQ9/JSLwYLonld2OM16xFSfXkKF
	 hMyGjusJKBFdg==
Message-ID: <34ad3217-42dd-4dd4-90fa-e2147d1bd056@kernel.org>
Date: Mon, 4 May 2026 08:31:54 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: agilex3: set alias for i3c controllers
 for agilex3
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
References: <cover.1777878392.git.adrian.ho.yin.ng@altera.com>
 <3a379df289c57d93bdb8d9f9f24c336e738470a9.1777878392.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <3a379df289c57d93bdb8d9f9f24c336e738470a9.1777878392.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Adrian,

Please simplify the commit header a bit. No need to mention "agilex3" twice.


On 5/4/26 02:07, Adrian Ng Ho Yin wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> 
> Agilex3 SoCFPGA have 2 i3c controllers, a main master and a secondary
> master. Setting the alias for both i3c controllers to prevent bus id
> contention when both controllers are enabled which results in driver
> probe failures.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
>   arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts | 2 ++
>   1 file changed, 2 insertions(+)


Dinh

