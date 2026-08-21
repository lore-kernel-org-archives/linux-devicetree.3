Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1C53112DA
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 05:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787289952; cv=none; b=YWlV0J+3DCSpMTvY4QLBaWMk33iHzkf+88FOnghHfgRlMqQVqyoovSQBlZjcI0e0kKFdHir+srsoS7vlJJIyj3he0mQykOwSPF/vSer1Lx2f0zzhD0NT6Vx8excHt+vOgPF2toBX7Xg80lvhZ+Yu3DC1JvNL9MvL6BlBRef+2fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787289952; c=relaxed/simple;
	bh=B+4n+MJXTXrb4ce62EyeAqbun4UtjYSKdWJfVRNW0b0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hV94GH26WwUivwZuOb+0UJ+N2eTr/Mhb1Enl4Iq38AEBrSu/ZsM0BJgNoLMimiRWf/m1LTcZ2I4nYyu8fz7gXbPUhH1oQVu6DIXzd3/A4k82pH0L9F4AB5YqEoV775Li9CKNuJbCDpbiFVV6UnSEXZFWt3OV3uZTj1VNMQPimCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20251104.gappssmtp.com header.i=@beagleboard-org.20251104.gappssmtp.com header.b=kQ29p482; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20251104.gappssmtp.com header.i=@beagleboard-org.20251104.gappssmtp.com header.b="kQ29p482"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-381b831d535so787939a91.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 22:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20251104.gappssmtp.com; s=20251104; t=1787289950; x=1787894750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MMTRiO2LCvL4OaL8CgkP71Q4mqWNH5wDDAfdSGoco2E=;
        b=kQ29p482uXFbslEWitBKKXKS1ov7Q9qG9vcRkcHqNYPXbbgo+DVM1zSTTbXVkUvzbE
         5lHdcairSl9hcwpIuwNo4yxnYr+S7k7c6G9r6Kdi46xtD8feOKaMXvtB8SiGsvQZD8c3
         oYPX4LMQ0MqCJbbuEj0SPcRwyt0c+8fPlTmXv4FJIEUmgHASoeaew/8KgDBPIu2O+TJR
         X91OuMxEFb22wtK4OL8NixXGpIbgfJ2BElHn+uGD1C2TAXJO3uLuXgZ6AEOUsyEXq+OS
         9wesmWGxwfNOkTWqc2jFnpvbOllFZIetSCYBQOEJ4IWXml5zWLgZDYGY+5PHTtrwTiCb
         EFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787289950; x=1787894750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MMTRiO2LCvL4OaL8CgkP71Q4mqWNH5wDDAfdSGoco2E=;
        b=s1Z7zf0Q+5mpyathRffJnTlZueSRqQmq3HWCcC6oFr9IBMQVtHRE8YHp26gR3mW+Vl
         gF3m7ZYEVhP+QTnfaW8UlC8queIyq5/lEGjdGylPm4Stl0tGRaDwKJ7w5NMdNXP1sweo
         N6vWveYIBKpX4lnA4TcI1OWt9vl2vGp3pWjjjt2I9zW5MZjdvQ5SFgpFSLQ857/8HjyX
         OYBecIPS2Ap3DYDlIgRyJf3iw9wyWVnzyenW8XvwJe/WpOwLx9BbM7SMC+yPPaUPKQRO
         XvC05Jqj5t1s4wL4hYdhsA3ruopQ955Cybg6HnvXZPmjUqOPShcWI8dVwm7TbqLJO3QC
         rIEQ==
X-Forwarded-Encrypted: i=1; AHgh+RozyywWPs7bucVGpT1tUA2yJKT+Or/7IfWwRfFMUKZuSQ/8uWhoe4k1Qav1F7lef74aA1H89M4CPntP@vger.kernel.org
X-Gm-Message-State: AFuF++liTmi+ogLrjYAR8Bwz3gjCVBscV/I2j5aQmFByWmDQNAekw/2T
	dscuCfOMtBuGIjEtJWgWZkCenYDB8n48OosSID5kJcm9/xNGG4wWGVsDGjurICgbog==
X-Gm-Gg: AR+sD10qaRa9rUYGMRcCv4Xh5yndSYK0XhmY5JL5fRKMPhh/e1JCtMV/x9meFy0lFsc
	dCoOvQ6jsriDRq1mpIrmMsFT4tjGfSd+pTtb6imlPZkX96I2FNCkX8e5/TNr4smWzjiGz2w7oqX
	f3FO8KO6X2I1MKWiGrpz265vNcA5a3+yuajJDwkUQkVCOsVv1HLekli2biJgMDzlDFAJitkVwag
	fxPg0PdWZPBGMq5DR0kF/xjpPaG6rGeHwC8CVPrAu5DD+CtXgNdbsAnQ3KzPfReqyO/29RENMOo
	TIS1SaqO989hOKS2trXxjXpUn9ggFjCe5yR69q2RnOsk7A57JFbB7j3x0t8V7gQNjri9bNeWzmC
	Ca73WbZcEZ95JZjn1zQKe1S1V/ZHBYefeEvjVwPbD4uLZP+BFjg6Gbp9MBddVu0c9DNnZHcGR2W
	W50CCUDqbNIq0lFEnbF7qhc0jqJFOS3WWT1AegY4jYEk2qO1rawyfYikpxB/TEKkG5qSv31770u
	U+mhP2y5q0qagRRlQoFhdSyGOXXY+tRoXdH138=
X-Received: by 2002:a17:90b:3b4d:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-395c39b1750mr6047224a91.10.1787289950564;
        Thu, 20 Aug 2026 22:25:50 -0700 (PDT)
Received: from ?IPV6:2405:201:4019:32fc:3c55:6b24:5147:322b? ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm35061553c88.13.2026.08.20.22.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 22:25:50 -0700 (PDT)
Message-ID: <93977935-ea60-48de-9d13-23454e038c18@beagleboard.org>
Date: Fri, 21 Aug 2026 10:55:41 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] rust: crc_ccitt: add CRC-CCITT abstraction
To: Eric Biggers <ebiggers@kernel.org>
Cc: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Ard Biesheuvel <ardb@kernel.org>, Ayush Singh <ayush@beagleboard.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
References: <20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org>
 <20260820-gb-uart-transport-v1-3-282da14ab7b7@beagleboard.org>
 <20260821030018.GA1961@sol>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20260821030018.GA1961@sol>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/21/26 8:30 AM, Eric Biggers wrote:

> On Thu, Aug 20, 2026 at 02:55:45PM +0530, Ayush Singh wrote:
>> The module is gated behind the new RUST_CRC_CCITT_ABSTRACTIONS Kconfig
>> symbol, which selects CRC_CCITT, so the C library is only built when a
>> Rust user actually needs it.
>>
>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
>> ---
>>   MAINTAINERS                     |  1 +
>>   lib/crc/Kconfig                 |  7 +++++++
>>   rust/bindings/bindings_helper.h |  1 +
>>   rust/kernel/crc_ccitt.rs        | 26 ++++++++++++++++++++++++++
>>   rust/kernel/lib.rs              |  2 ++
>>   5 files changed, 37 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 6008f16ae2ca..1e3b42eff741 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -6921,6 +6921,7 @@ T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-ne
>>   F:	Documentation/staging/crc*
>>   F:	include/linux/crc*
>>   F:	lib/crc/
>> +F:	rust/kernel/crc*
>>   F:	scripts/gen-crc-consts.py
>>   
>>   CREATIVE SB0540
>> diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
>> index 927fc6a6b2b9..aceb8fe8f0ed 100644
>> --- a/lib/crc/Kconfig
>> +++ b/lib/crc/Kconfig
>> @@ -32,6 +32,13 @@ config CRC_CCITT
>>   	  The CRC-CCITT library functions.  Select this if your module uses any
>>   	  of the functions from <linux/crc-ccitt.h>.
>>   
>> +config RUST_CRC_CCITT_ABSTRACTIONS
>> +	bool "Rust CRC-CCITT abstractions"
>> +	depends on RUST
>> +	select CRC_CCITT
>> +	help
>> +	  This enables the Rust abstraction for the CRC-CCITT API.
> Like the other library kconfig symbols, this shouldn't have a prompt.
> It should just be selected by the other symbols that need it.

I was copying `RUST_SERIAL_DEV_BUS_ABSTRACTIONS`, which seems to have a 
prompt. Will remove in next revision.


>> diff --git a/rust/kernel/crc_ccitt.rs b/rust/kernel/crc_ccitt.rs
>> new file mode 100644
>> index 000000000000..6042ada16967
>> --- /dev/null
>> +++ b/rust/kernel/crc_ccitt.rs
> Is there a reason why the kconfig symbol is being put in lib/crc/ but
> the actual code is being put in rust/kernel/?  It seems inconsistent.
>
> - Eric


Was copying `RUST_SERIAL_DEV_BUS_ABSTRACTIONS`. It is also in 
`drivers/tty/serdev/Kconfig`.


The reason for introducing this symbol is that normally, crc_ccitt can 
be built as either builtin, a module, or just left out. However, for use 
from Rust abstractions, it can either be builtin, or left out. The 
module state is not supported. Is there a better way to deal with it?


Best Regards,

Ayush Singh

