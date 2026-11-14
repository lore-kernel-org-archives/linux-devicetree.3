Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794700462;
	b=unK7BenwbgUtdfPFjDed6ooOrr5H2xC48TfBOwrXmfANRAFAbrCqNRvoAoBCQfxHFvpo
	 PWnzDqr/u+ooWqqWWzEv754XfpcdrkpFRnS4RJ+daybzAQfoAMZSzCpYsy4oU0bHBElGQ
	 4zpSNWgZuJwXYJOZ824rBxZdM1t49ro7b+//QE+0oixSj2W4begck5vO+TXPHgh2lQnX2
	 Lb1x1C39ojTVS0VYuPS/iqO6Vv3wNkUIVXC9hJi48sMWxaLkGcwlvf6E3opVY7XaKADba
	 uqQat1U8H1GIPf4xD75XC4sAOEoFa96BWhnANNFQBrWneSfADGXK8U4pJaSvuV/KYKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794700462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IufCbieA6Qd8N+6xo9KKOPiazDCkVPjgFR48LE6emEs=;
	b=I5gRqKUXe5kavMwQ9UlfL1xvU3Aub0GG3Opig9ZY3NMSx5ntnW67/NT2ATQiw/UTbUPt
	 hcBYttWOZBCEDCvsw+qKg4RWcJRSPrdRyG5a7ESeiBObQ/Iu2pk9z+YYF6JHmzJLeU3Gm
	 ekIS7qa4lJZgTnYQs2F3ppTr5lY9GTzhspkF0OWSkVTJTSDxyHb4Kjhad/fU8b524e8MU
	 bLif4oOL+XOnXkKFR9vu2vxTeFUpklXuassDCSXugEdS5A7PYp1+tJKj38RtaO9CSaO8E
	 pgRkO2Nh01swkvRDjekCE8CDwc9vigMuJMAohqUIHySSwLEWElKEGJ2OnCHpBEzR6jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AcwcReT+;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966B4606A32D
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 23:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 966B4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AcwcReT+
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37d424f1ae8so436067eec.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794700461; x=1795305261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IufCbieA6Qd8N+6xo9KKOPiazDCkVPjgFR48LE6emEs=;
        b=AcwcReT+QC044IPHT6exIOLUEgeeK49xIuqeNAggMyZFbImm4qBXyiu6GnzPTnzF0O
         LyIgtMrKl1ZmN5XjVs6vL7C8ALbllys6YBCjcALl19AjHF8kZgB1gaDggpQyV9VrU9zD
         Syo17s9Vq08yv2z9WuwKPD8uw8rACx16MuX7r7bj7/9DH99+LefTGqCCMB9A23z2HZzR
         NWFuOGadUVdkAKILcwFUnEClxLZ/UQG5X4y1k43QRdgGsC8Sskrl/RDLXBMgJBxzkKIE
         75LEOqBwq0+MFF9sGjLZOZiDzItFi9AM+cK2i747T2pMvMN6mbeU3OG5qAdFEuGCGk81
         +vIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794700461; x=1795305261;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IufCbieA6Qd8N+6xo9KKOPiazDCkVPjgFR48LE6emEs=;
        b=vKE47+5NnAyVfHfNEnyRmKwgEDxESx2S4qYmApmqfYrNjF+xEJ6kkKTzpuahzMXLZU
         CaaNzODU+2XeAl7MhJnfpcLMwo0iRK2Qf2Kid/rPyplYPw/OcwpLeUvhAs2wzgp3Ey1m
         EpSzrl82SUuV9RAQYodq2RiGOFLov2LvXlr8IfBI+Kwt0nb3DkxE+hvy10d2/xTw6H+x
         eiuRakQdo68r230xDiVFU3874Jbs6+0DArQGRW7z/4zPJf0hx3IZD4t8uenbRtRFAJYv
         7RZ35IwrOOe2/SNnTqxX/YT66vivC9NjY7mVM4aEJfMJOlfNtJMGRZCWdFY5WBSNJoo2
         Rv6A==
X-Forwarded-Encrypted: i=1; AL+hErHT+RnyggK4j9PBJtG/khdZTnHYJnMdDRpDu3hwwOwjwn8S/QeFqoNZRhaP4pi3b3QACMrMc126qMr3@vger.kernel.org
X-Gm-Message-State: APuU4Z8yZVRFqKgmmPniVwfd18cJa6W0ofuzIlCzB8LF9yFMMmI2Bvkn
	BeNzc3gPWCarkdLhlLu9XSkXiH8BlWvWe+3En6Q0M9MM1K7SzVuNIya5
X-Gm-Gg: AYBFou2qmgZmAKz45SdI+XH+rFrLOzfuAaOCfzOKz7MHKCCCctyPh3371l8zrQSy1hX
	HmBnSJ9XeXpYqUsphsXNthgC7+clw4JDIVTwF/wKuXOGTcJdvrg0hhs1FNFN1/27/LDPn1HBCU6
	g5yo5x1gBqGd9lznAqo1xQPmOrDb19XArXuEV/xFFXOgvt7aT9ToDdxrMSqspgb499le6gh/g5q
	e0MVUTV3j7/6bt3qdnmhsPYOoPRXrYbvtC687oph1an1cPTFQ4Lim+v2S18iD2B+AkhECniSL/O
	uun0AJFcMfeY1Gz9P4Haf84/o2ERkEkQFt5jde42t0xUWGhls7AXiuz/UiROYxlZKdz1ujnXJ2I
	qmOHEavZUrwq6CbBBs6lIzL95e+LvMFqRXoWnR9E9v0D99oqZ6v5oeSh/eISxh2FAemoOkUxbnG
	wRQzZZ+Wo4+Yn/syABGa88QaYVXyG32y/TPMoCNsmcjn4rPX1yH8d3PQwXSWZ1eTn9bNGNrjQdK
	JA3cUvWNM1qKsFQgAzIeHXYyOOoqicGafYe2X5MlpW3nQcQUaisD/2NaW2mGOHiLeDM9DAfZlTQ
	0LLXMOxphloAf84Gs+7CZSRzhCKtfGgl3dkWmPVIkavZs5XnbN0JjKvEJNNRCJKrj7Y=
X-Received: by 2002:a05:7022:f116:b0:1b3:af3a:e793 with SMTP id a92af1059eb24-1b502fe37c6mr6384471c88.0.1794700460496;
        Sat, 14 Nov 2026 15:54:20 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm29226208c88.3.2026.11.14.15.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 15:54:19 -0800 (PST)
Message-ID: <4b8a7510-808b-40fc-a6c5-551e7d88d5e4@gmail.com>
Date: Sun, 15 Nov 2026 08:54:17 +0900
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
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v2 0/2] PM / devfreq: add Airoha SoC Subsystem scale
 support
Content-Language: ko
To: Christian Marangi <ansuelsmth@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261009073330.18175-1-ansuelsmth@gmail.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20261009073330.18175-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/9/2026 4:33 PM, Christian Marangi wrote:
> Airoha SoC contains multiple subsystem that are scaled to a
> specific OPP taking the CPU clock as reference. Such sybsystem
> can enter idle or performance state based on the system load
> and power consumption conditions.
> 
> Example of such subsystem are GSW (Gigabit Switch), NPU (Custom
> Risc Co-Processor for Network acceleration), SOE (Crypto Module) BUS...
> 
> Changes v2:
> - Rename to a more symbolic name
> - Address some sashiko bot warning
> - Better describe the use of this devfreq driver
> 
> Christian Marangi (2):
>   dt-bindings: devfreq: Document support for Airoha Subsystem Scale
>   PM / devfreq: add Airoha SoC Subsystem devfreq driver
> 
>  .../devfreq/airoha,subsystem-scale.yaml       | 114 ++++++++++++++++++
>  drivers/devfreq/Kconfig                       |  10 ++
>  drivers/devfreq/Makefile                      |   1 +
>  drivers/devfreq/airoha-subsystem-devfreq.c    | 100 +++++++++++++++
>  4 files changed, 225 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/devfreq/airoha,subsystem-scale.yaml
>  create mode 100644 drivers/devfreq/airoha-subsystem-devfreq.c
> 

Hi,

The devicetree contains ths only clock information for scaling without any parent device
information even if this drier has used the passive governor as default.
I think that you better to use 'userspace' governor.

Also, are there any connected device to provide the utilization?

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
