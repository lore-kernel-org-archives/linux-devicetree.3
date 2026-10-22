Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689108;
	b=S1rAnW/xjMAHlljkltuoANlguixcF6Xkkj2SIaCxXpfizBUY5nHjEBVJACFpxHqWlISC
	 ai6IjR4HxYTPzDFtH6lRzwKh4Iu9llChixtC5nTDYd1GAQYFw62geBiWGRRKSvGpoacsz
	 HNVeb4fq72lRoXQYrslN0gQnPii/LNVGKUxR4MTBU6/2F2vXm35yeySVgJS8aaz9hYuQe
	 CAXrB00AzqeOnNx2dbM5K37JrXs2ID9HJWDn8SO7IMDHpAq0aEbvVEpcKvhXVUdFqGoPG
	 lI7AJDsU2e1bEYUty8LBhNOkzL5w045W3XQ8pWROPAwsZWIUNITkbgjUizIKl8zDxCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689108;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=X2uug97+9g9Ifw2alnlucQZ1byzTMHdm0Mg+gmOCcls=;
	b=Pt3vAUPZ1b0KoNrmc6d3A9Q6/oZL+RIANoWH6yMax5miNazY30nzh6gAUvGvyOhsOp1Q
	 zjH9vO+CcvaMFdx/8W566B+1WwqgwGdQYYs1OV4hvIEPhBYmv8D20MGLuUp8zISzw5ioU
	 Uueir5J/CDlM0yBtsNz98R4c3FXiCdnuld0ai19WKumd6xZsNibTNz/waqUlJFbpq+D/R
	 MDwR8MLksxps4h0+9sEu8B/gGWgh50hw5weo+PAZx5TzzqEtD6Lzj8L+up8EDXHBUeYET
	 Iiprp2Kt8lwuGnimgiI+qLyDDBWAvACeze9tgaXFV+Ms49Osy4bZ/EgyTCaj9PKZ8cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BA5606A320
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8BA5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e04773687so7868f8f.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689106; x=1793293906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X2uug97+9g9Ifw2alnlucQZ1byzTMHdm0Mg+gmOCcls=;
        b=jjRWiiwTij38+z70jQ/P7iXf7g9NW+aUJ444uwM2Ncg5F9/U0hF5rhGOKayPQH4Qig
         nAKhPX/Q2i3r4lTiPNM6Y5H3QUxsqNWGCuWDBoPSCadXSkF+69wHuQ2GdvCi30rihEhi
         RoG237Q85yU1z399rO6kKTJUwYnRJy+R1ydVr+Og1otrqipn8XtmNMYReI7F6nPH60n+
         eL9IDHMW+GUK4fxyBm+aWuZjZwQrt5OZLZXeUnG2Gy6gNQSi7UMCxENrTWOqaKUrJ0m2
         MhIjCqjh3F43xY77eHdC657TSwmt/DtQv076noddzI/KE0EcHEazM8iASFwCvL/lOBgQ
         6tKA==
X-Forwarded-Encrypted: i=1; AKwUvBweUvgG9ggFdMZoQBW715xNA1/ytjHIA0EfURHhJqRsBZkaJhBbJekq1eg7iCJCSghOayLTBYIB9fp9@vger.kernel.org
X-Gm-Message-State: AFq9FYIwu6BZm2NVtgqGqgvTJl5iI/o5SMo8ldrNii+87+zyrHoN3INf
	X9eIxrOYtEzaLeVdyCyenmYztS4TsNTW9Np4shOviJyDKk+jZNAnBl6o
X-Gm-Gg: AYBFou1WD4HGcx5aTzwI9/YtQfvjJmcFYpS/cL4fH91IvDu0xsU7AU+9mYOwkkHPtGR
	t9dFWGxPTVVe0XRb2GKwNVRJavTUTUKzrmXw/SGQ/F6QiQRDb0bANdYWPZ/MqOSGzFhh/hk1Nbi
	m2UyNZ639skUnFGnZy5urgw7RaN+/5XNoMWLHzGrC1p00nB9WcweDvlB9y2udw+AWg5bBR2yDpD
	D9p2ToPZTZ2WJnDOOcrHZbXPVPZnVX+4vhDpFj0vTyORTTFQy1Fpr6DANcywDBNz+L9BkMoGu/T
	cKyALktg9h3jh/jN+kBY4ymRlodfPblGzjDZZc9pPNll9wAMlJ/BE7hYtQxqt75WPzu+JULTcr4
	7YmU/TI5TznUsx4KFNy4PjpGpuiAZgM2NRQ7uIzXglQgg6B1nrYaxisLKGE3G0VhptwqtYOuTW3
	SGmBo5sPY4R27jYvG7yhXyw3gfFtBbp19fjWNlQjM8Q9qajPj/pVxd9mIwVDpA71JowIaBe1a1Y
	5h4pGeds8T+x5dCLmoSZ7aTwgVUJm3BNifCN+DwRlN1Wl2uyJRVJrfuBN5RxKLcfTrovsylT9Hq
	6boRZ6s0Oi6hICpBComKHjKfbOLos5w=
X-Received: by 2002:adf:e004:0:20b0:487:1ddc:aaff with SMTP id ffacd0b85a97d-48e264a640dmr8341797f8f.44.1792689105826;
        Thu, 22 Oct 2026 10:11:45 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2582a53fsm13532427f8f.32.2026.10.22.10.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:11:45 -0700 (PDT)
Message-ID: <5100a774-9c85-44bc-abf6-9679f8395856@linux.com>
Date: Thu, 22 Oct 2026 18:11:44 +0100
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
Subject: Re: [PATCH v3 1/8] dt-bindings: net: amlogic,meson-dwmac: list the
 compatible combinations
To: Conor Dooley <conor@kernel.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-2-tanure@linux.com>
 <CAFBinCAejxmeeHyDy+vMSg6dBm+9prhEo9qZ7FAsiWNB1W-HXw@mail.gmail.com>
 <CAJX_Q+3JLn6oTt8qTPM-muKsY9JbTEMwqRvbamZ3vqg_Yymsmg@mail.gmail.com>
 <20261011-starship-foyer-1105c1b35e31@spud>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <20261011-starship-foyer-1105c1b35e31@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/10/2026 22:13, Conor Dooley wrote:
> On Sun, Oct 11, 2026 at 03:16:18PM +0100, Lucas Tanure wrote:
>> On Sat, Oct 10, 2026 at 11:04 PM Martin Blumenstingl
>> <martin.blumenstingl@googlemail.com> wrote:
>>>
>>> Hi Lucas and Conor,
>>>
>>> On Sat, Oct 10, 2026 at 12:59 PM Lucas Tanure <tanure@linux.com> wrote:
>>> [...]
>>>> +          - enum:
>>>> +              - amlogic,meson8b-dwmac
>>>> +              - amlogic,meson-gxbb-dwmac
>>>> +              - amlogic,meson-axg-dwmac
>>>> +              - amlogic,meson-g12a-dwmac
>>>> +          - const: snps,dwmac-3.70a
>>>> +          - const: snps,dwmac
>>>> +      - items:
>>>> +          - enum:
>>>> +              - amlogic,meson6-dwmac
>>>> +              - amlogic,meson8m2-dwmac
>>> Meson8m2 dwmac reports: User ID: 0x10, Synopsys ID: 0x37
>>> In case it helps I can submit a patch to change the Meson8m2 .dtsi to
>>> use "amlogic,meson8m2-dwmac", "snps,dwmac-3.70a", "snps,dwmac" - then
>>> we could move it here too.
>>> That leaves only Meson6 with a single fallback compatible. I don't
>>> have any Meson6 boards, so it'll have to stay that way.
>> Hi,
>>
>> Fine by me. But I think it is best to wait for this series to be merged.
> 
> In the second sentence, you're referring to the dts patch I assume?
> IMO, you should submit a new version of this with the 8m2 moved to the
> other enum and Martin can submit the dts patch now, since the current
> binding permits using dwmac-3.70a, no need to wait for this to be
> merged.
Ok, I will move.
I will sent v4 with your Acked-by, since this is the change
you asked for. Tell me if you want it dropped instead and review the new 
patch instead.
