Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691430;
	b=mZI4OYsjV4Y8KHc8y9OOH41JUbRg0xxsOrlJfHSR+AEcKQB9kDzAWKoCKgblFS+3a6bm
	 2wyaNvaM/5hHXx7IBdleCs/URUlCc4QRgCc915aERQ6g/TRa2jSjpcXLar+6LskvG2Ia1
	 N5dUk2RRLujTAzoTnMHkWbFmfJrQnjN1DZ1S7QMoj85G+1HHPUybwF0BxfYhoKNFIF9oZ
	 9m4q0E2Fi+GBuwEgKHJxfXZOCmcjhc8UuLj50yH8okUfZcwweJqIbBNbX+qnFgaxPbYFn
	 P++1frF8vWnxBrO47MqWEq63B2Rw+z1y63YluDvloqle6ggZX2VUavT1kiP9YXmIQTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691430;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Wd3oLS+dcFTXkdvGEDZ+0YYIQNbTTyKN39PEruh5N40=;
	b=VLQoypgB5TNEblm+SQFSYhVyJOjB5xNvdYCW0nY9nc44XxUJaGCc4WdHLVSAhqmA1HeI
	 QaPJkY/23W/i+vygxnJOjg1m2fwRD+HIVnmPeOcvU7iKajQnQAjLwrg2JInrAAlSfhE4z
	 nkeDJ2c5R6TPFhLH9pdpzAAq9g6jbC5WMRIxzTRbPwdzNokYqzRs8jfXqjdPSeEMoZEZi
	 c7l6g8emHVodXsWWkPp3zNu7MvG27ikWifry2zZEzVNj+UISQyiAQgHUPoTH4Fagycczb
	 a+rfDQuGHQGkMH94OskAXyAehA017ekBWe+eFxKLKv0Wg7RD+3V5QXkL5b1TMLKd81A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CC6606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27CC6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so34207f8f.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691428; x=1793296228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wd3oLS+dcFTXkdvGEDZ+0YYIQNbTTyKN39PEruh5N40=;
        b=FHuiIlHovBpZyq2Fb7fAqMo3DJ4fmvyhSok9lJNI4K24PHrb7nEbSLc69QalUHGDyc
         5Kf9pJx4RVDl5enVxLlSCoD5SxuJ1cHGhKRWaCS4ftTvCQgg4BPW9JgiPs+O9n8m0w6M
         8A0LJdSyF/njtSwIoGrR4Y8v/uGUZks0KE296Ry4nStktT4uX1w0RSojECNE103RXKwv
         XxM1nLMF9e554GgK7AXLVgngX5q1y3vGh2HwL6FscvtQCQ9ZFENaBe6I4otMeZErXtBI
         EXVAsiase+Zk7ryaBPyY9wjq69rJPbFtgVywq2bUD9gb1LmWCxsekINYEwtHqIGVf2Kv
         YlKg==
X-Forwarded-Encrypted: i=1; AKwUvBwZuiDYJFkngQCej7sT7VSDW3RORXH5jQ8Hjrfh2q7XU+tcYS8HLGMKfyrgkzi32FlZ9FPb9sDblAKI@vger.kernel.org
X-Gm-Message-State: AFq9FYKsDxutBxwTHG3DQ4FgHtGH7tcmIRo9A5dUCVVRU26Zn1cfkrTd
	e8AvBnRkZLldzbBY7V+H4Glp9oc8bwTOKc0H5CHRnHM3nuQ6tcokhu5L
X-Gm-Gg: AYBFou2cc/kdizQdaogLpKV+qztxKDneD51dSKcCj0FlksbJ5wWrOnZP8m2D+8Zg5Nn
	vspjLb9eJuH7CTMLrWz5wMdPvdq9tQ6qrq6Pxk/Gi703KHIB8Pw6dVsDDwSw956KIBnNS8b0Woa
	N69Lu3sodf0NKN1UzifncAr50a7RbAsruwqyWQItydpAdin+thQY5PpM282BPG2fZ+jyPYawwg9
	WtmCl84HlteV0GIjNQioZs7OeNCIjKFbWEvJtRVXKSF6SahJbWy6fbTfGmHz2p0jwjLPn0jzYG5
	Y11r/fOAf54xd7nQrtz/rNd4soH4r/NFbFBOGpN5JSfJom+/Gd1fdeKIEbYZ5n1tTYnXHBL37+6
	efhU2QHSXsRY5HoRecF4sh+myDp1X6lfOKnSf8UhwCTQODnB9RziAa9rxbxHXkFWk2T94YcKpXa
	25tL4K92Ar7hU/VWLVlrgWr7PZPLprexwSBLgX2kYVWvbT8d/92tRjYUlrv2nIllQKqAAUFcazA
	mQATZloKBYTK+erna5tSu01HoqZsQ/LXie/v6NPMw2UFKGysfg5cNfQ7kJeDhWJ60GAQ5jjaB8Z
	ikfWxuD6Gg==
X-Received: by 2002:a05:6000:1866:b0:48e:412:37f4 with SMTP id ffacd0b85a97d-48e2641de1amr14015136f8f.1.1792691428424;
        Thu, 22 Oct 2026 10:50:28 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835247sm13834966f8f.41.2026.10.22.10.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:50:27 -0700 (PDT)
Message-ID: <c9d2b1dd-c733-454a-9281-80787f5c432e@linux.com>
Date: Thu, 22 Oct 2026 18:50:26 +0100
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
Subject: Re: [PATCH v3 8/8] dt-bindings: net: ethernet-controller: tabulate
 who adds the RGMII delays
To: Jerome Brunet <jbrunet@baylibre.com>, xianwei.zhao@amlogic.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-9-tanure@linux.com>
 <1jqzhu9in5.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <1jqzhu9in5.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2026 08:14, Jerome Brunet wrote:
> On sam. 10 oct. 2026 at 11:59, Lucas Tanure <tanure@linux.com> wrote:
> 
>> The informative section explains in prose how phy-mode, the delay
>> properties in the MAC node and the mode handed to the PHY fit together,
>> and says itself that developers often get this wrong. A reader has to
>> work through several paragraphs before answering the one question they
>> usually have: for this phy-mode and these properties, which part adds
>> which delay.
>>
>> Add a table that answers it at a glance, with one row for every
>> combination the properties allow.
>>
>> Assisted-by: LLM
>> Signed-off-by: Lucas Tanure <tanure@linux.com>
>> ---
>>   .../bindings/net/ethernet-controller.yaml      | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
>> index 1bafd687dcb1..bba27a9feb61 100644
>> --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
>> +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
>> @@ -339,6 +339,24 @@ additionalProperties: true
>>   # has added. Failure to remove the delay will result in a
>>   # non-functioning link.
>>   #
>> +# Put together, with the two properties in the MAC node, this is who
>> +# adds each delay:
>> +#
>> +#   phy-mode    tx-internal-delay-ps  rx-internal-delay-ps  TX delay    RX delay
>> +#   rgmii       -                     -                     PCB trace   PCB trace
>> +#   rgmii-id    -                     -                     PHY         PHY
>> +#   rgmii-id    present               -                     MAC         PHY
>> +#   rgmii-id    -                     present               PHY         MAC
>> +#   rgmii-id    present               present               MAC         MAC
>> +#   rgmii-txid  -                     -                     PHY         PCB trace
>> +#   rgmii-txid  present               -                     MAC         PCB trace
>> +#   rgmii-rxid  -                     -                     PCB trace   PHY
>> +#   rgmii-rxid  -                     present               PCB trace   MAC
>> +#
> 
> That would match how the HW is working on the A733 Allwinner too but I'm
> not entirely sure this is what Andrew had in mind from our previous
> discussion [1]. Adding him to the thread
> 
> [1]: https://lore.kernel.org/linux-sunxi/491f043e-6dc6-4936-a490-31a3362c5b6e@lunn.ch/
> 
>> +# A property for a clock the PCB already delays is not in this table.
>> +# It is either the fine tuning described next, or a mistake the MAC
>> +# should report as a fatal error.
>> +#
>>   # Sometimes there is a need to fine tune the delays. Often the MAC or
>>   # PHY can perform this fine tuning. In the MAC node, the Device Tree
>>   # properties 'rx-internal-delay-ps' and 'tx-internal-delay-ps' should
> 
> Acked-by: Jerome Brunet <jbrunet@baylibre.com>
> 

Thanks, But I will drop this as it is wrong.
Lucas

>> -- 
>> 2.56.0
>>
> 

