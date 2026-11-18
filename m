Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004877;
	b=R+2dLcSkGQvRxZ8H9eWX7/l4TRQB8bURmBFbwm/QDUw4KrtsiRlBf+D+JtpWQoCMN05o
	 KGX0gk0nECsUtz+9gs5MIosgYDFGou4HnTq+XGkj9J4vLz8oRQodiiizky+rDkTVOtBzu
	 7iRoAh1vDOSpl7znC2UE5GynoryqNl8G+V+Gkt+5waKoCrmjRNeI3+qaRRCASoWT1sOEn
	 YmouUDBySC7hDMxIP7RY/8F/9thH6AhGjXtBR3npG9I3TF5mbQuka7TE0UyZg4p8hMOYz
	 jT/LluwXk30lLZ6K342+kmvEq2yeb1S0t+5lcq8C2PGvNdaeSNlXhwcUQ7JLAsNPyqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=pWhnfvWenZjOfquzYUSnlcmZobUEBcHEFf7Qs3x3jIo=;
	b=g20B69WuWMnIwjPhTOIgX2cTvijoChSsnODLN6ijE7hSFYIA3Ke7/O/mRI44koqYSPcD
	 Mp1AboHeS/3e/i87aLXc1VzUAf1Qd7nrP0woSQlyYPGGl/SZY3ouvl+t0vllBvDd/1XD3
	 osec8Fs0amJgxHY9ceB4GPNQBKB0ThjJMhzaUoqEZ9zPiZtGmFjbhnz+6Q+8DMTFXOOzU
	 yI/Uy53ZYtIHfZUS65rhxj3/oK6F6srieh3zAEFqhGdTh4Kd+6bN7k7pOQGvK4faoFtMO
	 nqCvFZjz6/HRBiv5HoqexOIffs8ZJjmK7ppP/IgBkireCQPT7zuZr0Gmf+fVD/FMPAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gnUqbuf3;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14411606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14411606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gnUqbuf3
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49465892f7bso653873f8f.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795004875; x=1795609675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pWhnfvWenZjOfquzYUSnlcmZobUEBcHEFf7Qs3x3jIo=;
        b=gnUqbuf3d57Xuwjq9mArqq7froWGp0MlQS9x6IlNT2NGP3q3w0Sjo/kyiHGRTKiB4q
         P92nJhojgEV0yC+rIzGu8L1gqaBLRdfnpQ/GixH8reLCB3FQyZOp2jEL3KxKSJL/Pg2W
         XpgDghUzVyPVrApQ+sPpAAFyZ2Aeo2PF2N0w0Qz1WukGOaa3CSp8SpYNcCRJi0JqSTpw
         kdxcDlbsA4BPzGLa8nc5dSe85aI+2nGCi9owQInYgrxQBbn+gXTI7eUgLzyrhhFjbeZQ
         KfZ4jYflBxgYv4XHeP37RUp+6rVc7fKTxM3p/9uHjaYt3O2RxDTnNOeL2E2HxSOjIEc4
         XCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004875; x=1795609675;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pWhnfvWenZjOfquzYUSnlcmZobUEBcHEFf7Qs3x3jIo=;
        b=JF4tjG+vuAglNGtYl0EqiVg/IMwbEslsftBL0IqxxuLZzhBVzPBWDrX7fIEwLiawEl
         RYKA7mk3VZOyVtDhHIxXx+voFTUCkQo9k7ejJMHdYsRzR2W0Ewh/R0XOZsxKlc5tK/0X
         Q6+sSoc0qNJ1V12z7AEbUle9daGY6em/Amklob52KI5JC7AbWjdi1FswxcG6gdfzoAo6
         C3zZWfatZuAF5WdguLePL4rxY574hQDeF43Pbi5l7wNecoqzhIWwYMct1GErQGpCZGGn
         utMJRLcjdVXQucG2brU+A6PTC4kSKeO50xS3V8a5la2TG1uSOpzxN/jNgNzVT3TsTwG9
         3Omw==
X-Forwarded-Encrypted: i=1; AL+hErHhospruZk9QAKWnw4+a+qDYlEyOjqPBhTOsWKKmokPPZPw0cmwFuu9DU2acqAb2MH+RsVm7G14dpye@vger.kernel.org
X-Gm-Message-State: APuU4Z9puKeVmy2cNdddsvJCPf0SoJQZj59scdC7q/dyc4zs1e31LXuN
	+muau6BFDJBtHeCTwXUUspDg8oypVu8wekOw6nKMLK8E9CD4jx/VZaHv76qNMBjBlGA=
X-Gm-Gg: AZFdTZfuydgPB6a3nS2oXfsVTM5FtwWCw2cDmctgxbGTXrTeCSVmkSRGbSjWuRLaMxp
	wjYZw0AVFSqunFX7f9TRNUScf0YJrMoHfBVjf9jNkS96XKLarxHIq+3DDTHMe5FHd6lSkDX+8Z9
	p8pGgYGIAo5S52coLMQbqTYywvUrdAqZ6j46kZ0g89WPdo+3NgcgqCm0KiX1kt1gkO+JJw7Z93t
	2ssG98h5SpDh3xT6wDwaI62jtUuUAz0CL6RfvaCjIBvuhqQhSuRvq8hoItKTxT5KENowYSba21N
	vrNKIGtDbhHVtB7ckhh7d4XOkR1/U7w6IuvE4LaYUaEYKCPm3fg7AJUWOdVS9ld3oA9R9n7oOmt
	6m5IJdjOBoZ/2sZq7Wj7yt2oahhheaMmnXJaLovUpdl72Wwy0e/k7CH/HfeAtydawZDlvupbGji
	cYa88toNLM8/nYpmL7OR52HBg2JBZniUjUB2EGSdnNo4ROKGlzrNWacGkcsY0SzS+PxKCNg7eLj
	Bv4hbxH8SjS9KCwcZad25aYAQmKtR2da7dwz0u9t0W4xSENLIYpaIoqAXCW6xkqxquGWvZ62pEd
	vL1FfU9gXt/Ltf9vmJGiyYQce1jILq19joDcqm80tlgLorsl/OaaG26pBm+3CsziA0HykRSdnTC
	tfAtqZfxZrsv1tHHoHY5wpCc=
X-Received: by 2002:a5d:5d0f:0:b0:4a7:9630:7b32 with SMTP id ffacd0b85a97d-4a7963080d9mr2359433f8f.46.1795004875475;
        Wed, 18 Nov 2026 04:27:55 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a655f9f4a7sm4675322f8f.34.2026.11.18.04.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:27:55 -0800 (PST)
Message-ID: <0bcd84bb-6a87-453f-9b68-04dfa95f34a4@baylibre.com>
Date: Wed, 18 Nov 2026 12:27:53 +0000
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
From: Daniel Drake <ddrake@baylibre.com>
Subject: Re: [PATCH v17 08/12] accel/rocket: select the per-core clock and
 reset counts from match data
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, ulf.hansson@oss.qualcomm.com,
 abel.vesa@oss.qualcomm.com, sebastian.reichel@collabora.com,
 sidong.yang@furiosa.ai, u.kleine-koenig@baylibre.com,
 chaoyi.chen@rock-chips.com, shawn.lin@rock-chips.com,
 finley.xiao@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net,
 leonard@lausen.nl, vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 rfoss@kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1794615324.git.gahing@gahingwoo.com>
 <fcdd7117d3d7fe99ea1658c39b6d1a05428823f4.1794615323.git.gahing@gahingwoo.com>
Content-Language: en-US
In-Reply-To: <fcdd7117d3d7fe99ea1658c39b6d1a05428823f4.1794615323.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/11/2026 03:05, Jiaxing Hu wrote:
> The RK3576 and the RK3588 use the same NPU block, but with different
> numbers of clocks and resets.
> 
> Take the number of clocks and resets for each core from soc_data in the
> match data, so the driver uses the right count on each SoC.


Rather than these clock and reset count rules via soc_data here, can we
just rely on the DT validation that is almost equivalent?

Then we can use devm_clk_bulk_get_all() and
devm_reset_control_array_get_exclusive() and not worry about checking
counts and names within the driver.

dtbs_check will already catch cases where the wrong number of clocks or
resets is provided, or where the names don't match the ones expected in
the bindings.

>   static int rocket_probe(struct platform_device *pdev)
>   {
> +	const struct rocket_soc_data *soc = of_device_get_match_data(&pdev->dev);
>   	int ret;
>   
> +	if (!soc) {
> +		dev_err(&pdev->dev, "no match data for this device\n");
> +		return -ENODEV;
> +	}


Since this would only be caused by a programming error, no print is
necessary.

