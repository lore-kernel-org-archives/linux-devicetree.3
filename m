Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1F44A1E1B
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 21:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789594912; cv=none; b=k/Co4GwkAXUWimqzB+IPxtPr6VQcp4LSJlI+29zZW8WQftSAdZElSG5WLhmLlTEZD/Ay00UjKkMpPiCl4fDB3MyAxpSxt/prugRW8mtmuPJD3MVTEkG56KD1hC6J+aDRJe6dqALuBhIMMSKd0h/UcWjWNSVQAJUGu7iuvx9AOkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789594912; c=relaxed/simple;
	bh=IAptJyT5xluEqEiFzVEi/p861VpjcmGoy/sQvXBJe6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sbwOUSYUih8inHCotl0Ga4W/Dmas1EJdP81gcbNMTZmQ3xxL0nAzAwj5jWEPl4++LWW1+52gibedXQkd77jRgivUbxSGS2FoZW4BJo+UmYkWbpjpLo8UC6p1cUDyDSjs9J3dXUre7DXziOJSoboQbDfk8ZUso6XD+qDb+SjgLR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAnzMGfz; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAnzMGfz"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfb6so66047a12.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789594897; x=1790199697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V67/ygqzXBDTg6FpqYWmZblZ2cnQrCYnunNIZXB6fo0=;
        b=JAnzMGfzr1pYJ8prgYf+WTUz3P97ReGXI+kkUr+abDB35a+oVXrEnS/EDQxJglSQUz
         Udpq+qn9k2Z7oNXCC7xbYoIeY6HxH6mv0nqWS4j6up/TVfDM9ghv29WT+tcYuFpfcMqd
         XCGcRHBdTe4QDm3R3nTtL3jllpNrIMWnoLYnNtd7CpVolxbC8401aWHo8p5oRPPPmHsa
         L+uD4l/irpgw4sgAlE+cbaRj18MW2aud/HBktx4lNZ6QqjeFbDxVcDqe4hr7zjL3OhVd
         QnQDbpfs6mjic3pb15mkG/NTN71P9fXWwaeqW2stxRuhk4m6ZF+t58u0yall8SGg4gsK
         c6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789594897; x=1790199697;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V67/ygqzXBDTg6FpqYWmZblZ2cnQrCYnunNIZXB6fo0=;
        b=TDRv0B7Qo5XCoWgy7OJDsBMtu4KE4kZ3pYaJ1OtOhq7ewKsMSiFh3yMAmsKwXJlUFJ
         /MuVQWjifJRVANTlNzEG7GHceFmZJx31V6yhopyy4cpOm7enWb4neyrOYVYHhMXUHG+/
         zEZsZjPzQlVct2b/R7DD4yR+4OVuLBAnT3A9uZ3FwykeGSxH5qkjboFVa2g7Omouy+YE
         kiMyRIsQ6AOdcXYM8FiHtvKF4YrmpWrpeYWmTdk0sgqHsQP6Ng4z8KGF7nGlZUz69tKN
         onwv2ew2jZP92dPcYgr1Ogf8xz+9hV3m4p/5NDc2hA7ThnocVDfQCWvSICD9nyiLP1nB
         oc2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwxix1UXfHZlnH3HiHgp4J3rRFzqKE0byY9+9MpnGf08nv1qB89LF1BPqnognZw25rLBFScIuOwPCg2@vger.kernel.org
X-Gm-Message-State: AFuF++kJLHRI2iTAbw51UnAUpalo3K3rPlyPYht61nh4LeWVMkBUIy9f
	/l3aV3HkxH01IYV+I6n7dsx4zRk0kf+y6ngRvZMlACU22+DmP0//eysy
X-Gm-Gg: AYBFou3YMY7o5gaBPl6nWxLai9qyKEo012iF9T8HGdqAjFbZwW8ZRu3vnJgXU/gC2LC
	JrkIOLxYvKZeUXpA8z/OQOn10ADVVWWR3BTkN0Vy97f9NljMnD8pfixdqbRhWBfWx76Qc8dpTR+
	6xG2JTLWw9nF4PRhUR+bhLijjKMr/iGktqKq0OYg3cRQkg+J55GQM8za70pJg+6qvGguSzlsKZo
	S2NoS+lgdk6tGwiuNqw5IIlo7KMvG6P3zXCHMTWoA327QTs+qI9dsvWocOIsOflNA28qJGfqljP
	NYj9e0gBc0rUa2X33XrfagudHR28tLArpeLXWj/PptFQXpk96RSo3UedjqFCYzJheAGxS6blp7j
	wt6FcfCBne4gqKsbiIj+LAqySM1KK4fWwSLG3SUN8aF9QU6u/wxG0OluJKRvMIOYoYba8oSZc01
	XSbDlFsNDnM0M9n5jgs9O4yG4YYhkYf2xC9YwIHqik+b+Kljdz/UvFfXm8tWSamnXsL0wBVAYw8
	hWGax4NugiwxGx+GYaYgbdQJ9xmQQAlz93cTWs+Km03X4zL
X-Received: by 2002:a17:90b:390d:b0:39d:f66e:1720 with SMTP id 98e67ed59e1d1-39e1e4907e8mr11608231a91.13.1789594897275;
        Wed, 16 Sep 2026 14:41:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a1a5sm10854497eec.5.2026.09.16.14.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 14:41:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b155cdd8-54d5-49d9-b276-c24dde766dbe@roeck-us.net>
Date: Wed, 16 Sep 2026 14:41:35 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (pmbus/tps53679) Select page 0 for single-page
 TPS53676
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>
References: <20260916200331.664795-1-sanman.pradhan@hpe.com>
 <20260916200331.664795-2-sanman.pradhan@hpe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260916200331.664795-2-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 9/16/26 13:04, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> tps53676_identify() derives the number of PMBus pages but does not
> ensure that page 0 is selected for single-page configurations.
> pmbus_set_page() does not update the PAGE register when info->pages is
> 1, so if boot firmware leaves PAGE set to another value subsequent
> register accesses may target the wrong page.
> 
> For single-page devices, select page 0 explicitly and verify that the
> PAGE register was updated.
> 

Why that complexity ? We don't read back other registers. Why would it be
necessary or even make sense to do it here ? Following that logic one could
argue that every single write has to be read back to verify it.

> Fixes: cb3d37b59012 ("hwmon: (pmbus/tps53679) Add support for TI TPS53676")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> ---
>   drivers/hwmon/pmbus/tps53679.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
> index dcd4250b679d..f38c19b8cc43 100644
> --- a/drivers/hwmon/pmbus/tps53679.c
> +++ b/drivers/hwmon/pmbus/tps53679.c
> @@ -248,6 +248,30 @@ static int tps53676_identify(struct i2c_client *client,
>   		info->phases[1] = phases_b;
>   	}
>   

A much simpler
	} else {
		/*
		 * pmbus_set_page() does not update the PAGE register on
		 * single-page devices, so select page 0 explicitly in case
		 * the boot firmware left the device on another page.
		 */
		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
		if (ret < 0)
			return ret;
	}

should do the trick. Yes, the write may be unnecessary, but it
is cheaper than a read followed by an optional write.

Thanks,
Guenter
> +	/*
> +	 * pmbus_set_page() does not update the PAGE register on single-page
> +	 * devices, so select page 0 explicitly and verify it in case the
> +	 * boot firmware left the device on another page.
> +	 */
> +	if (info->pages == 1) {
> +		ret = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
> +		if (ret < 0)
> +			return ret;
> +		if (ret != 0) {
> +			ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
> +			if (ret < 0)
> +				return ret;
> +			ret = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
> +			if (ret < 0)
> +				return ret;
> +			if (ret != 0) {
> +				dev_err(&client->dev,
> +					"failed to select page 0\n");
> +				return -EIO;
> +			}
> +		}
> +	}
> +
>   	return 0;
>   }
>   

