Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711DF47CA9D
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 17:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246543; cv=none; b=UaoofYBOemQlygBT7QIJI/3uHuC3heaTHdAhCTpSQCDkdUaWx9W0DdRX070iU6uv4MPHnP6nHGBmzQD9szwj2SAQ+AkXws7shdyrT+F8FkCWfDXcXFNJzjEz1iLXZUKCgED1pcWNfhR3qoYZ2y0H7zEM6hcdm0+tFDJKvHaNFCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246543; c=relaxed/simple;
	bh=SAJrYqbGk1s4xK6V6dw0Lh5Mwx0RBK1vXRkc5c1kNhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IpmQm44c2+bJ7m53qNX7utjeFZnFEPOYMXvVEbuFnJaMHuZLiUON7BT1rOW6P7xwzeay4C1Hslgure2Qgnipsmzq+s1RhdAUoQWVuMJ7V8XikRPsx7lmSECuBeu/yAPmByUu7nG58YUexwvxI8fURqrGgAmtHWfXqzuCrHo+3kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=dFz34+G+; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="dFz34+G+"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8efcef23d21so882836d6.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1787246540; x=1787851340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJH818idnhGd0jN2j2NKg/qLJJl/ayYbpw4TVR9577Q=;
        b=dFz34+G+1WCMAoUhot2+4CYCkk0HvsFbIvPq4KtpJsTJebf4QhCWMKyNQu80OPgHpz
         3bGjzt4yUXosemgIQi39sUQhQcNU/hSDomtxxNdQHFJK/3uVnjoxEgePEnxKNK2sZ2HA
         A5KG62dsMcfnmzpWwDqWPtPkqhrsgUSRUL5ZCYseW4utSx0/9dCXL468izjo6DWFJ3kX
         VKPS2Ji43qpUTo0gY0dKrU37PMVTD4dGZlfqGInozQ2DYFOcThKMpgZCP5G9zUbWCGAh
         Faro4Er1BNmvT8lFR50k5H7qLd5iWuaK8QLxtRWrCHb7Ftt/a2EZsJiQfpRC8bp83Ohu
         VlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246540; x=1787851340;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PJH818idnhGd0jN2j2NKg/qLJJl/ayYbpw4TVR9577Q=;
        b=SRyOhKY2YLNVAJC1rchDVD1VjCwN85wwQ2zERDvJ6f7oRqI6O8aloDkjOVsoMyJDdr
         kSbJ3Gy/b686p53vXonlsMtoNOq+AqHZg+50rsHyebNqL1TSxQhMtgiIvWor7LsyDbdB
         eqmCdn6olL8KqP43zycLmGL4kf8NXnRRe81Tfqeeu7TaVegcCzp/lsdV0oxyUDC3n4cZ
         V67wqtj6DUxJwE3OCIBVtD7T15qOLGsBVuMSSU1Du29Mkn+uGuKu1Atmn6KXXAeH7vE1
         Gud+KWR9tcS17+YIifCB+WE+1O4LnF9vD8UkyIPjS5KkRXNiKAyvZj632xdSPKu23ng4
         EVzw==
X-Forwarded-Encrypted: i=1; AHgh+Rqx8o1mWStWmm8XPCmeNyLzb+DBSL3hL6y5j2kmqHOmotZMkLz/UM8UqhkQ0Kq6TWPvieBNEKXMKnSz@vger.kernel.org
X-Gm-Message-State: AFuF++m8lPnHSpP+gLy3wggpit8o1WWd+JViKs8ti/B+zf2560GcPFYv
	csiIx8T/ZKwYz9/zm7y42UPQDQgRzOisHBtPVWZ9RvIEFpNY1q6Bmk5KM49v2sYycOI=
X-Gm-Gg: AR+sD123OqG0oIE6zxrlfgND2ztdoXv7HjtxoBjtuRlM2KSb+xsyw0leAn9eP9toKhR
	9gcopcMgFadepmrnmDLYG1mVlYrK8g1BroOucM0Da93xlx+4fW+y9PDQTGNEYhBM7CStMx7cX0S
	U3lk++yV/k/73mAlWAEKNmNGIGiyaU8zuWRAiufEDBIcGpufhBUifg5i938/XXv81QXJIwb1WI7
	37ii1BUuPDKTJk3xBvE3E9XAqbRCPFCu28bkKwkjVJUzfth1Ull6MggJCLO4Bgftxi0YUF2agYA
	Afmm3xuKQlMHP/Y0rybbNnvEXa25nGqM15f4vYz6iU2Ah4T92BZqADSQFz0vjWABIvscxwTWHwX
	I/tes9L8sl/86KkcR3odoFmh+6f0487Xh4f78M6tg/bf9Cnhx63BbAULAPnzJqKVWC3b8KIwBME
	Ym/de64QnxI+bTyY0VTnB9tZfZqIFMXpe1U6DFYwPOH4iNEXOSi6fRtLFYXvx1
X-Received: by 2002:ad4:5d42:0:b0:907:5460:601d with SMTP id 6a1803df08f44-90c5e7036f8mr156204246d6.3.1787246540087;
        Thu, 20 Aug 2026 10:22:20 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2b2b38sm42839666d6.43.2026.08.20.10.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:22:19 -0700 (PDT)
Message-ID: <c3212784-1144-4d09-bf58-eb99e8f06517@riscstar.com>
Date: Thu, 20 Aug 2026 12:22:17 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: misc: introduce pci1179,0220.yaml
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, bhelgaas@google.com, daniel@riscstar.com,
 mohdayaa@qti.qualcomm.com, lbiancon@qti.qualcomm.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260813222943.1655453-1-elder@riscstar.com>
 <20260813222943.1655453-2-elder@riscstar.com>
 <20260817024317.GA32943-robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260817024317.GA32943-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/16/26 9:43 PM, Rob Herring wrote:
> On Thu, Aug 13, 2026 at 05:29:41PM -0500, Alex Elder wrote:
>> Define the binding for the Toshiba TC9564 PCI endpoint function device.
>> The third downstream PCIe switch port within this chip has an embedded
>> PCIe controller, and that implements two of these PCIe functions.
> 
> A better subject would be "dt-bindings: misc: Add Toshiba PC9564
> endpoint functon device".

OK.  And yes, I'll do a better job explaining that the TC9564
is (to the best of my knowledge) also sold (but re-branded)
as the Qualcomm QPS615.  I'll see if Qualcomm has a particular
wording they'd prefer.

Thanks.

					-Alex


> 
>>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../bindings/misc/pci1179,0220.yaml           | 150 ++++++++++++++++++
>>   MAINTAINERS                                   |   6 +
>>   2 files changed, 156 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/misc/pci1179,0220.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/misc/pci1179,0220.yaml b/Documentation/devicetree/bindings/misc/pci1179,0220.yaml
>> new file mode 100644
>> index 0000000000000..30a76f377eec8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/pci1179,0220.yaml
>> @@ -0,0 +1,150 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/misc/pci1179,0220.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Toshiba TC9564 internal PCI endpoint function
>> +
>> +maintainers:
>> +  - Alex Elder <elder@kernel.org>
>> +  - Daniel Thompson <danielt@kernel.org>
>> +
>> +description: >
>> +  The Toshiba TC9564 is specialized SoC that implements a PCIe switch
>> +  as well as an Ethernet AVB/TSN bridge.  In addition to these, the SoC
>> +  implements other functions, including a reset and clock controller,
>> +  an address translation unit, and a few other devices.
>> +
>> +  The PCI switch has three downstream ports.  The first two are exposed
>> +  externally, while the third is used by an internal PCIe endpoint.  The
>> +  internal endpoint implements two PCIe functions, and attached to each
>> +  of these is a 10 Gbps capable Synopsys Ethernet controller and an
>> +  interrupt controller that converts internal "wired" interrupts into
>> +  MSIs delivered to the host.
>> +
>> +  PCIe BARs provide access to registers that manage almost all IP blocks.
>> +  The SoC is modeled using a PCI endpoint bus.  The IP blocks are bound
>> +  to platform drivers that access the hardware using MMIO through the
>> +  PCI BARs.
>> +
>> +          ------------------------------------
>> +          |               Host               |
>> +          -----........---------------...-----
>> +              |        |             |   |
>> +              |  PCIe  |             |I2C|
>> +              |        |             |   |
>> +    ----------+........+-------------+...+---------------------------
>> +    |         |upstream|          |          |     ---------------- |
>> +    | Toshiba | Port 0 |          |          +-----+ PCIe pwrctrl | |
>> +    | TC9564  ----++----          |   I2C    |     ---------------- |
>> +    |  SoC        ||              |controller|     ---------------- |
>> +    |             ||              |          +-----+     GPIO     | |
>> +    |             ||              |          |     |  controller  | |
>> +    |       ------++------        ------------     ---------------- |
>> +    |       |     US     |                                          |
>> +    |       |            |    ------------------------------------- |
>> +    |       |         DS3+====+          downstream port 3        | |
>> +    |       |            |    |-----------------------------------| |
>> +    |       |    PCIe    |    |       embedded PCIe endpoint      | |
>> +    |       |            |    |~~~~~~~~~~~~~~~~~+~~~~~~~~~~~~~~~~~| |
>> +    |       |   Switch   |    | PCIe function 0 | PCIe function 1 | |
>> +    |       |            |    |-----------------+-----------------| |
>> +    |       |            |    |  BAR  | |  BAR  |         |  BAR  | |
>> +    |       |            |    |   0   | |   4   |         |   4   | |
>> +    |       | DS1    DS2 |    ----.---- ----.----         ----.---- |
>> +    |       --++------++--        :      ...:                 :...  |
>> +    |         ||      ||          :      :  :   -------       :  |  |
>> +    |         ||      ||   -------.---  -.- :...|clock|       : -.- |
>> +    |         ||      ||   |translate|  |M| :   -------       : |M| |
>> +    |         ||      ||   -----------  |S| :                 : |S| |
>> +    |         ||      ||                |I| :   -------       : |I| |
>> +    |         ||      ||                |G| :...|reset|       : |G| |
>> +    |         ||      ||                |E| :   -------       : |E| |
>> +    | --------++--  --++--------        |N| :                 : |N| |
>> +    | |downstream|  |downstream|      ------.----       ------.---- |
>> +    | |  port 1  |  |  port 2  |      | XGMAC 0 |       | XGMAC 1 | |
>> +    --+..........+--+..........+-------+.......+---------+.....+-----
>> +                                      |       |          |     |
>> +                                      |USXGMII|          |SGMII|
>> +                                      |       |          |     |
>> +                                    ---+.....+---      --+.....+--
>> +                                    |  Ethernet |      | Ethernet|
>> +                                    |    PHY    |      |   PHY   |
>> +                                    -------------      -----------
>> +
>> +allOf:
>> +  - $ref: /schemas/pci/pci-ep-bus.yaml
>> +
>> +properties:
>> +  compatible:
>> +    const: pci1179,0220 # Toshiba TC96564 (a.k.a. Qualcomm QPS615)
> 
> Perhaps somewhere besides a comment say what the relationship to a
> Qualcomm device is.
> 
> Rob

