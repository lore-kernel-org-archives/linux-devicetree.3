Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7C9499F23
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 18:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286709; cv=none; b=jKEUo7uJKE+ZuVPV9L+b/Vo1R0IaZx6H//uxCl8QAhwjcPJosjpoGrdhPVPQeu9USLmwJp6SX12KTEqORu3q2vf1AeKdhee+83pyaKU4FZ4xrx1U2kkZHte+Z9xmJjzmqjy215ZJ1R8JcJnW45J43N9GXWCL0UOWT+5wh5ou6GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286709; c=relaxed/simple;
	bh=pBZ72VRxSWCTqVnwhIeZKXwNxvzthrHIPi/IWXYAElY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GbuniaT0Urk/vEr2ZrIDMkPSliTQx7VUoVNAcMdx4xYJ4dP1E2+XdewkA6EsT/ajac4JM+TuAO37TJ8ZZnhy9Yaz+BEgSIpenEE2b13EtYEmyl3+ddnYCzrlZJuMbR1cKsgg1WWHDYRxSEh8up7FjpNZHxsAymjwF4O/UrwSeaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ssXUxVsH; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ssXUxVsH"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92ea24a2dbfso27777785a.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 11:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788286707; x=1788891507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bAec6ocgrNZ9bmHTFibIsazabE23fPNzJ4l70BPDTDs=;
        b=ssXUxVsHxx1mkbj2kJkaWR7dn0qTmLwtwSoArf4H4g47bQNLRzVZSJCGF41ig8q/8H
         GUptm5PB6ICvxQCHfPndGlpk0ztNU3f0E4Y4VsjThi/yuHOcn16pHa2aYGHIKZPfY0CY
         78pQfwulML64dWt9YcZp17NZf8rK1kBIETlRaFZj2NmSMaWK9zHrwFcYR1mA7eOHg9he
         IKPZeJismb8Dz/+QTD5qhPZuo6l9/MvbXgqezLf1XDblIT35Ph0ymJu9+Hjy0s6uW5EV
         xtrW5qrOfIDsfwjvxnzKLpWID+PI5dgyQV9b1Jk1VhpMYEJwVBxOhqyw0B3TVOWsUanF
         7ZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788286707; x=1788891507;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAec6ocgrNZ9bmHTFibIsazabE23fPNzJ4l70BPDTDs=;
        b=WqBPUt4UG/KpmcSL+y/TliazhUpdk71CwJNeyyalmYTVvqp4hjluMlFFIzmGSXdUxT
         qLVHHdlcMIQOAKB5tuab14bx9eFHjq7QkPT3cal1d6f2cDAcVKfkbjTEzq+Rw6zTR4CY
         jQ+pgbOeBsl1HFBef0a8OGPXhP8K2eg/d5uqX3VnmzJjF0nk2nmiZRaxKYM2BwU/jmMv
         RV4gDedgf2TgtlcYClNAdeRETUYjV39sjKxgwyPowfc0rTxBmomgSCQNBFa3IOupSQoc
         pVD+hy0NjYqKR+I3fvRUsUvO5VjObTXLp3p/m3Hok2UH5Qz1PaOIkhPjX3zBlPR/rYkf
         uHtA==
X-Forwarded-Encrypted: i=1; AHgh+RoTjMJwjxLuY9vTsMwxwQpbX2tT4JoZnezb0LErwXy/5stnKEfBE8H6wNs4SdgsdwLQGFn4s9CM9xSK@vger.kernel.org
X-Gm-Message-State: AFuF++l1mFCn5BSg+W/LJGiVGIqKYcuDOTiccsCFqiWsr/mW7dDPqQxi
	Fp1XpmAdcPLYh3nWXCdXGklj3Txd/6fCOishgqNc4rzuAxpPs0KoTIwmjSVoOatjsJg=
X-Gm-Gg: AR+sD104ncPGg96RwF1RAnND/F9ttjg4m2IE9V89tafK6wlHOLEDLph9M4CztwUAeiw
	6s06WILNIM5s2id3t0tf9t6oYCpgmYS/qX0B5jEZ5B2N61UVXKNve8cm0L7kQUEW8ceReD2XKzz
	Ea4FMjLgMI9wZP/PF6cOK3OqntoRSWB3FIOjQWdFBxl7A4h5wEsTfCEqpsPfI4pjk5KW/E0wD+e
	C4Z9U3vKc5dbxieuSJPN4LjVxe8SwXGth8NGViyAq0TuIm7XhXtf+TTS4nH0LGSNBtiO7t/bsoV
	/6bXJpPXta1arOosC4KkinP1Dsygsr4IEmYEcMHcq3n1emV33ha9MHjLi8rQTa56Mt43Xut5GVj
	UG2+LOMxnHZKNesarWDU5bzkvyzHfKBzmo/jGSiEzHoeiqunrhd4RtLrWc4Jqk0dXpMyB969+tz
	rRObo7WqnQ0LyKI6oPKQp8l7E+bM82scRhmJRRSF8Ig4MDGssJPJwFTp25dCXRrw==
X-Received: by 2002:a05:620a:6b4b:b0:92e:541e:632b with SMTP id af79cd13be357-9395ea57448mr49706185a.2.1788286706748;
        Tue, 01 Sep 2026 11:18:26 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f157807sm3232985a.9.2026.09.01.11.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 11:18:26 -0700 (PDT)
Message-ID: <5fdaa7b9-19ed-4947-8ef2-040287e2860a@riscstar.com>
Date: Tue, 1 Sep 2026 13:18:25 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: monaco-evk-ifp-mezzanine: use dev
 for device nodes
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260901172058.1512508-1-elder@riscstar.com>
 <20260901172058.1512508-5-elder@riscstar.com>
 <20260901175445.0142A1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260901175445.0142A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 12:54 PM, sashiko-bot@kernel.org wrote:
> New issues:
> - [Medium] Mismatch between the commit title and the patch implementation regarding the new node name.

This was indeed a mistake.  I will update to say "use pci"
rather than "use dev" in the title.

As an aside...  I initially tried using "dev" for these nodes.
The reason was that of_pci_make_dev_node() uses that convention
for non-bridge nodes.  This was introduced by commit 407d1a51921e9
("PCI: Create device tree node for bridge"), and I haven't yet
gone to see if there was discussion about that choice when that
patch was out for review.

However DTC complains if a node is not named "pci" or "pcie",
so I went back to using "pci" for these endpoint nodes instead.

I personally think dynamically-generated devicetree content should
honor the same conventions and restrictions used for static
devicetree files.  There isn't an automated way to do that though.

I was thinking of following up with a proposed change to
of_pci_make_dev_node() to at least use "pci" rather than "dev"
for non-bridge nodes, but I'm not sure that's the right thing
to do.

Comments welcome.

					-Alex
