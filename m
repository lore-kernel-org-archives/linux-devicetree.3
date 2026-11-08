Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794104879;
	b=zVr007j53Ydo/QqJri5iJI51ivIS7iOLDlHwGV/Ktn0aFtkQrnfiyrzloWZB6pHbXK1E
	 HaRDFH5PH8W1kyuXYV3l3AWVVKAX8b+sxA/eChROwtA5yIRkDBSYdqfppvFAUUgwp12y9
	 /ZNdAF8u43SZfbbGdbwvAadg3zMecNfoveVVGyab/6xMZHTaJLEKbYSZVeVQvyPOjX2W+
	 Dzr5CQSpresT2Wq3fwSqSKUwwZuMUwy7fOOddbEFa/rG//9QKD8ETJcwXIg5WjlQciVEz
	 FtJap/+ArxHnFqv8nbRY7Kv/9xQyt3LIUcqGdEvAFa1hDvd2eOPC67SPunNiCmHrsTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794104879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CgFyMsoiKO2B1HX2AvfFumGFOpktUiaDt0kSWOji51M=;
	b=bO9M7rkLsr58P4UYlKP+eubnEAESY7WFDsCV6SXFkycfuw9hTTt+NHVHqpOZd6ZWKZBN
	 55y5fJwE/hLduyG/gCn03zTOAKkoJQ09NNvsmGhr8OvLyhh3hhkV6G3MYAlHfDHpmwzmD
	 edhqMrTbMH0uP0nP7DF35zLFVJFc0wvuky9PncS7S2eByv/dYqIkVBXrmk0ewTTygDFaV
	 wGuIqSJnbZMEy9MXxT751edZJ6BMiV8Rp2rxtFEchuw6ndfxkNfhLZMAZgSdPtSzHqFWR
	 2szzqV5HMmKzH0hY9O2mnxMpKSv6g26CixXbQTjnNybcsiWbcubfeISpkrqW08z/auQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Crtt9KFl;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D894B606A31A
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 02:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D894B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Crtt9KFl
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso665745eec.0
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 18:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794104878; x=1794709678; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CgFyMsoiKO2B1HX2AvfFumGFOpktUiaDt0kSWOji51M=;
        b=Crtt9KFlMLRjcguZk1VYPvhTgDNZMElzf0tf141OxRDD0nRpz/y1O2me5bx5zPEHRw
         DOcFer5e04/3lH3hXFl06ApuJDKLG77CFSixsb0t6MlRt5PwYzLnVHXQt/lmhfJSUCov
         8/IoZwOneMKYGudlQKvHL0tGwwIWFHD5bmHdaSx2Aca7D6KfUw3p0kAAsMbidPHSH9K6
         Vtd7DUJBiDizA1z7P9/HbJj4YxUHaR6Y20nKVwijj6Y8lmutdnjW1IMT8sE8avgxaW3d
         2oCXfkkFNdLeVsQOzUyKG8TFQRCGvgtR9ixvehQM1zvDECpHHm1ePN1spXa/oKXtzuE9
         +A7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794104878; x=1794709678;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgFyMsoiKO2B1HX2AvfFumGFOpktUiaDt0kSWOji51M=;
        b=QFoZNlMO1mk8vukdaaEf2twU524jgrD5XxURY/4TXVg5Icfth3IjjKub0e4fGfayTr
         B7w4t4CLo2GklEwb8qjGoacPCXb01sWjLPjN8vde+UcWzQ+vCKw4Ifikb3ELL2t3RQsz
         9ZTzRdeoxVUblEPSA1VnYl8f6HGX/yxrwLMR/5+D04j6MsRDXJUQNNia9afuEAPpAfuf
         jmO4PF5aNoI0GaxixHBwe8IHSJkbH496h0kuP4nqPQJ2a7zsaHt9U29OPLvosxv6wBMn
         hC3MqccFrMCL6fcdcaawV04p85Poe9aCOTCFNze4iuNUv4i3cB0rSZmOMaYU1RcpZBQs
         a4ug==
X-Forwarded-Encrypted: i=1; AKwUvBzBT9K7NoPd2zxx2Bk9kvFSsUin5D6AcUd67xv4mIpcUfrwTxLibWwUuv9NnzyaY0z2ilNeUdRKvZh2@vger.kernel.org
X-Gm-Message-State: APuU4Z+uoHyg1RnvpCCrn3XLDehf+Fu1jmoOMEvNUttMLjPN3tvqWr/8
	AHcmBboKTz/xoAD1n1jtgIsJkghfkB1QfQEyCNoUUne5FqtK1ZAXbPEH
X-Gm-Gg: AYBFou2wUSApgoHNm0KE95AvWouJn4S+XZynhzby0UVVXLEpWadA3jhivSieVgqhc3v
	IyI2selq4vHf/vmjZOXCnWVAOGmcHqhZUYqTX6HPYjo1kytG4myHTn6xQOA0n1dYKl2Gw/GgjN/
	pNItloFvWxSdrfYJR7K0qBioyphHNirJEaRiMcFrFROkMhPisUOQPAcnHatyNscNVwk7i7rlg2D
	MWrtZ5hrbOtrYC6YB8AnqJDFymzNsr9Ob06pfz+HwF9YHv8wBUAe8teVmuciah1ygGyZYdPJZO3
	93HptrnUVe3/OAYCjzvvLez3/yberg4dO1ZA+POrJfhE/FSIlU3hVXXr8M/D3L4DjH6ARVp0Zm3
	dX2dlVpwyX0WZMlFquahCSHAn/x1/XsH9QqkOYP5flAWryoD2nbf/0m1RGMh+KBDazuk2/EXxiC
	FL+nRgu3PAgmApAZRenkvME2UqZZsmmG20X8MMGiONHzbJlPKCGnB40hVqQOMgpXy04YWWc/Fgc
	YXn0s18KgF/qrhmdEESyA+Cd+fYH/KC9VNHrvnzpVpzF78fghGQcXNqo9Yn9JBKwPQNfFjd5LSo
	juZIopdQ94JrfZ15KbzC
X-Received: by 2002:a05:7022:b0c6:b0:190:d0d9:3110 with SMTP id a92af1059eb24-1b39ff2dademr463410c88.45.1794104877934;
        Sat, 07 Nov 2026 18:27:57 -0800 (PST)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm2390172c88.18.2026.11.07.18.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 18:27:57 -0800 (PST)
Date: Sat, 7 Nov 2026 21:27:32 -0500
From: Kwanghoon Son <asdfkwang@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 12/12] MAINTAINERS: Add Bouffalo Lab BL808 support
Message-ID: <au_eFNCt54nlCafy@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
 <20261029-spyglass-evasion-772697094cb9@spud>
 <20261029-amuser-savior-6a6ab062f471@spud>
 <auSDJH9V31wmbrYv@debian>
 <20261030-slider-finished-360b10521e0b@spud>
 <auXQaY25XfYzxEb1@debian>
 <20261102-throng-botanical-b244058ecc37@spud>
 <auqC9jOIQTyieQUJ@debian>
 <20261106-dislike-despise-91106ac848dd@spud>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-dislike-despise-91106ac848dd@spud>

On Fri, Nov 06, 2026 at 06:00:13PM +0000, Conor Dooley wrote:
> 
> Cool. One thing that I noticed, and felt it was a bit odd actually is
> that the uarts are fed directly from the crystal oscillator. Jisheng had
> that in his original series though so I assume that's actually how the
> hardware works?

I carried over the direct crystal reference from Jisheng's series.
But will change in v2.

UART3's baud clock passes through a mux and divider. The current M1s
firmware selects the 40 MHz crystal via MM_XCLK, while the APB register
interface runs at 160 MHz.

Following your feedback, the UART node in my v2 work now describes
complete form of clock itself.
two clock inputs:

clocks = <&uart_apb>, <&uart_baud>;
clock-names = "apb", "baud";

uart_apb: clock-uart-apb {
    compatible = "fixed-clock";
    #clock-cells = <0>;
    clock-frequency = <160000000>;
};

The fixed-clock providers currently reflect the firmware settings.
I'll add proper clock-controller support before submitting the DTS.

Best regards,
kwang.
