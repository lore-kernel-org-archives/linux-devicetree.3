Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421554F93D1
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 17:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752663; cv=none; b=hrWych14qV87+egg+ki5SPGirodbsPNJXSZtAKYGlz7eollthmByas6+UYk8dKsiTDtO5aMwVunl2ggy44m2IpQjspU1i0ifPZ9l6boh+3vGpHK2an8jIKViStBjByXhlTXRCHytZxIHlB8O7qfnOqIj5i3ygpjlux8a29Vicc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752663; c=relaxed/simple;
	bh=pMGpEi39BEyUo6zCUXVX6ESUaX/7PwRrk/NnMo1pLNs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=nx23/pzSjH7HaWAx30piwxv0kdy7HsS3W//AyHYz4E6KjZanEutDgHVB5Kp5GFW3V94nQgVYucrnouZkOEs44CnEU01+2OxL8z4PGjh0xFDPPRD9HEn++5Gm3rsckLKjuS+Al+m4TOvM/K1WBwHYZvtbgG6oFCaZqGmKvEHvw4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conchuod.ie; spf=pass smtp.mailfrom=conchuod.ie; dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie header.b=L+XHPSix; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conchuod.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=conchuod.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie header.b="L+XHPSix"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48434392b02so775278f8f.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google; t=1789752654; x=1790357454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Dvc/pEW/BAh9vZt3yE6d0wx7vktxXFNO+yS8WEG5HPw=;
        b=L+XHPSixVEEG2OExWJLUUSRW/x7uwFINHTNmX+Vg5jFguap+BVj8nexJdOTztmy/mS
         t4qcL9ceW+7Zz6p4hfOMfq7NlkSw7qpmrpRv78weaR0nyhTykBvPWWpDOst5Y0et3HXt
         c1XRnEUPcWMxouLWd+Tk9/m7g3GVYmQW9aFkYYU0moBshbWUOQBdKie+VvhqfC6tktqP
         EGnirtikntG16Y0E0o5LdofWQ93KaXAQCegxRiirptlq3AyTGY09hd14REETM9i2cqwf
         R51atGuqzOinn85ZaPKGXGhfzfAQAf5uUXyLXkmc5g7KcqCvsJt4/gosJH52OcndpS3K
         FZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752654; x=1790357454;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dvc/pEW/BAh9vZt3yE6d0wx7vktxXFNO+yS8WEG5HPw=;
        b=kn9Tx3cmrbaM0v7zQOAod8vsS+ffiLmTo324qgU7hc8Axytuu0ih7Hrw3bjZSJ8V3R
         d9MvAR+sKIMm200VaUoYw4J0n6pR0CJlqkcYNFvbZ+vQRo2AK2Qy18uWKRafqYO5seFD
         boQxd5bgXMpyOgHiFqOuUtQie3BhoSCGxnRySAM24/P0cyAOY184T5tgqMM6AnYqk9N0
         fZljf8HOVlTYrodfG15dj0Lfy4JSFS6SoO6g1vwbzLJQL0TeOwxmZqQJjOkE6CWlXPQ1
         QpRotNEHklbUKsQ467GydBphHRs4rtXQM94PojV2tBYylTJHM/hOcmc4vnoVts2Av0qn
         yxZA==
X-Forwarded-Encrypted: i=1; AKwUvBy3isSw3G07kTsHL36fa7p5QBg03CAM2+ZWORUtmNfRZRYC0vTe+kqu71fKyf6CVEQ1/A9IspM+sMnT@vger.kernel.org
X-Gm-Message-State: AFuF++mSpEWwIWeQ5gI6dHtVpPwDUmU9UXN/otc4TOf+UHrVMEpV7VWX
	G3ZgaxqGi5Zks1Vo3Sd782/pLLYIBbrMbUPV7aCnINNoswl+bbp1aeR5ZWOiAUdJY5OrpMQqaKp
	/5YwMZU0=
X-Gm-Gg: AYBFou2MSSHBLE9LTG8sEkVXijcDjx7Tp2wngdjUekjABZ1bqzbUq9tPbyakWO+x3mg
	KUeQeX/N/TVxnRidFTSFmHfwjp50Al59l+fR+t4oYd1d8CQUPiBXQkWybTlUVrcL/VNl1xWGx10
	udRScg5VtFCLR2fyQpH+ChoMOiWmR+FFUXDBX6abF50xxYJrYIUPh5EEcj2TRs9OVrRRXbwdB8e
	ADRxUOQjclsLrkbDQUozRTrnUJ80n2jEomKA4nd8dAzlJtrVHet9aeVW6Lyc+echYAVauflYTsp
	G6KI75f2HL4sXzhRy/7w0PKtq517PWz4qjV6L8mqG0NAH65aRZj30kAZEL55e1l3nrMkkdbK/ei
	UBI0/9e6kc0BqT4gxvZQMdK4qqoLVyyZHXpYkPodBle4sHJSN9pF7v3qGpIJBziWLFJ28ZXS/SI
	+iPvWT23d0/qFFngRkNnZMN1JfwplJWmQXIF2ffQ2zC/eO9d/QXnAMLTjosGXMkVN4mhbtDoMXb
	XDFKobxBhPIUiCTYB+no9RUomexXV4CtnE1KPxvIF/X6aQgKmOo
X-Received: by 2002:a17:906:9f87:b0:c24:b11a:470f with SMTP id a640c23a62f3a-c2a152e3212mr337280966b.0.1789752251335;
        Fri, 18 Sep 2026 10:24:11 -0700 (PDT)
Received: from ehlo.thunderbird.net (ip-077-020-009-205.vkd66.pools.vodafone-ip.de. [77.20.9.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a358868e1sm331666b.47.2026.09.18.10.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 10:24:10 -0700 (PDT)
Date: Fri, 18 Sep 2026 19:24:05 +0200
From: Conor <mail@conchuod.ie>
To: Guenter Roeck <linux@roeck-us.net>, Colin Huang <u8813345@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
CC: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, colin.huang2@amd.com,
 linux-doc@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_2/2=5D_hwmon=3A_=28pmbus/tda38740=29?=
 =?US-ASCII?Q?_Add_driver_for_Infineon_TDA38740/TDA38725?=
User-Agent: K-9 Mail for Android
In-Reply-To: <dbd0a721-898b-4524-a0cd-c9751fd4bd68@roeck-us.net>
References: <20260918-add-tda38740-and-tda38725-v6-0-a8b11018d850@gmail.com> <20260918-add-tda38740-and-tda38725-v6-2-a8b11018d850@gmail.com> <dbd0a721-898b-4524-a0cd-c9751fd4bd68@roeck-us.net>
Message-ID: <2646A11E-8D13-4587-8027-1370E0007F36@conchuod.ie>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 18 September 2026 17:02:38 GMT+02:00, Guenter Roeck <linux@roeck-us=2En=
et> wrote:
>On 9/18/26 03:23, Colin Huang wrote:
>> Add a PMBus driver for Infineon TDA38740 and TDA38725
>> single-voltage synchronous buck regulators=2E
>>=20
>> Signed-off-by: Colin Huang <u8813345@gmail=2Ecom>
>
>For my reference (waiting for DT patch approval):
>
>Reviewed-by: Guenter Roeck <linux@roeck-us=2Enet>

I'm on holiday and only have my phone, and cannot find the binding patch t=
o reply to=2E
I found it on lore and it looks okay=2E

Cheers,
Conor=20

>
>> ---
>>   Documentation/hwmon/index=2Erst    |  1 +
>>   Documentation/hwmon/tda38740=2Erst | 65 +++++++++++++++++++++++++++++=
+++++++++++
>>   drivers/hwmon/pmbus/Kconfig      |  9 ++++++
>>   drivers/hwmon/pmbus/Makefile     |  1 +
>>   drivers/hwmon/pmbus/tda38740=2Ec   | 64 +++++++++++++++++++++++++++++=
++++++++++
>>   5 files changed, 140 insertions(+)
>>=20
>> diff --git a/Documentation/hwmon/index=2Erst b/Documentation/hwmon/inde=
x=2Erst
>> index f07977a20271=2E=2Eaeff87b3d46d 100644
>> --- a/Documentation/hwmon/index=2Erst
>> +++ b/Documentation/hwmon/index=2Erst
>> @@ -265,6 +265,7 @@ Hardware Monitoring Kernel Drivers
>>      sy7636a-hwmon
>>      tc654
>>      tc74
>> +   tda38740
>>      thmc50
>>      tmp102
>>      tmp103
>> diff --git a/Documentation/hwmon/tda38740=2Erst b/Documentation/hwmon/t=
da38740=2Erst
>> new file mode 100644
>> index 000000000000=2E=2E55ce12f14914
>> --- /dev/null
>> +++ b/Documentation/hwmon/tda38740=2Erst
>> @@ -0,0 +1,65 @@
>> +=2E=2E SPDX-License-Identifier: GPL-2=2E0-only
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +Kernel driver tda38740
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Supported chips:
>> +  * Infineon TDA38740
>> +  * Infineon TDA38725
>> +
>> +    Prefix: 'tda38740'
>> +
>> +    Addresses scanned: -
>> +
>> +    Datasheet:
>> +      https://www=2Einfineon=2Ecom/row/public/documents/24/49/infineon=
-tda38740-tda38725-datasheet-en=2Epdf
>> +
>> +Author: Colin Huang <u8813345@gmail=2Ecom>
>> +
>> +Description
>> +-----------
>> +
>> +The TDA38740 and TDA38725 are single-output synchronous buck regulator=
s with a
>> +PMBus interface=2E They expose basic voltage, current, power and tempe=
rature
>> +telemetry through the standard PMBus hwmon interfaces=2E
>> +
>> +Sysfs entries
>> +-------------
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>> +curr1_alarm		Input current alarm
>> +curr1_input		Measured input current
>> +curr1_label		"iin"
>> +
>> +curr2_crit		Critical maximum output current
>> +curr2_crit_alarm	Output current critical high alarm
>> +curr2_input		Measured output current
>> +curr2_label		"iout"
>> +
>> +in1_crit		Critical maximum input voltage
>> +in1_crit_alarm		Input voltage critical high alarm
>> +in1_input		Measured input voltage
>> +in1_label		"vin"
>> +
>> +in2_crit		Critical maximum output voltage
>> +in2_crit_alarm		Output voltage critical high alarm
>> +in2_input		Measured output voltage
>> +in2_label		"vout"
>> +in2_lcrit		Critical minimum output voltage
>> +in2_lcrit_alarm		Output voltage critical low alarm
>> +
>> +power1_alarm		Input power alarm
>> +power1_input		Measured input power
>> +power1_label		"pin"
>> +
>> +power2_input		Measured output power
>> +power2_label		"pout"
>> +
>> +temp1_crit		Critical high temperature
>> +temp1_crit_alarm	Chip temperature critical high alarm
>> +temp1_input		Measured temperature
>> +temp1_max		Maximum temperature
>> +temp1_max_alarm		Chip temperature high alarm
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>> +
>> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
>> index bcfdc4ce4c10=2E=2Ee4ca80dd0574 100644
>> --- a/drivers/hwmon/pmbus/Kconfig
>> +++ b/drivers/hwmon/pmbus/Kconfig
>> @@ -763,6 +763,15 @@ config SENSORS_TDA38640_REGULATOR
>>   	  If you say yes here you get regulator support for Infineon
>>   	  TDA38640 as regulator=2E
>>   +config SENSORS_TDA38740
>> +	tristate "Infineon TDA38725/TDA38740"
>> +	help
>> +	  If you say yes here you get hardware monitoring support for Infineo=
n
>> +	  TDA38725 and TDA38740=2E
>> +
>> +	  This driver can also be built as a module=2E If so, the module will
>> +	  be called tda38740=2E
>> +
>>   config SENSORS_TPS25990
>>   	tristate "TI TPS25990"
>>   	help
>> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefil=
e
>> index e288fe72a437=2E=2Eeb06d47816fd 100644
>> --- a/drivers/hwmon/pmbus/Makefile
>> +++ b/drivers/hwmon/pmbus/Makefile
>> @@ -70,6 +70,7 @@ obj-$(CONFIG_SENSORS_STEF48H28)	+=3D stef48h28=2Eo
>>   obj-$(CONFIG_SENSORS_SQ24860)	+=3D sq24860=2Eo
>>   obj-$(CONFIG_SENSORS_STPDDC60)	+=3D stpddc60=2Eo
>>   obj-$(CONFIG_SENSORS_TDA38640)	+=3D tda38640=2Eo
>> +obj-$(CONFIG_SENSORS_TDA38740)	+=3D tda38740=2Eo
>>   obj-$(CONFIG_SENSORS_TPS25990)	+=3D tps25990=2Eo
>>   obj-$(CONFIG_SENSORS_TPS40422)	+=3D tps40422=2Eo
>>   obj-$(CONFIG_SENSORS_TPS53679)	+=3D tps53679=2Eo
>> diff --git a/drivers/hwmon/pmbus/tda38740=2Ec b/drivers/hwmon/pmbus/tda=
38740=2Ec
>> new file mode 100644
>> index 000000000000=2E=2E067de07ba9fb
>> --- /dev/null
>> +++ b/drivers/hwmon/pmbus/tda38740=2Ec
>> @@ -0,0 +1,64 @@
>> +// SPDX-License-Identifier: GPL-2=2E0+
>> +/*
>> + * Hardware monitoring driver for Infineon TDA38725/TDA38740
>> + *
>> + * Copyright (c) 2023 9elements GmbH
>> + *
>> + */
>> +
>> +#include <linux/err=2Eh>
>> +#include <linux/i2c=2Eh>
>> +#include <linux/init=2Eh>
>> +#include <linux/kernel=2Eh>
>> +#include <linux/module=2Eh>
>> +#include "pmbus=2Eh"
>> +
>> +static struct pmbus_driver_info tda38740_info =3D {
>> +	=2Epages =3D 1,
>> +	=2Eformat[PSC_VOLTAGE_IN] =3D linear,
>> +	=2Eformat[PSC_VOLTAGE_OUT] =3D linear,
>> +	=2Eformat[PSC_CURRENT_OUT] =3D linear,
>> +	=2Eformat[PSC_CURRENT_IN] =3D linear,
>> +	=2Eformat[PSC_POWER] =3D linear,
>> +	=2Eformat[PSC_TEMPERATURE] =3D linear,
>> +	=2Efunc[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
>> +	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
>> +	    | PMBUS_HAVE_IIN
>> +	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
>> +	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
>> +	    | PMBUS_HAVE_POUT | PMBUS_HAVE_PIN,
>> +};
>> +
>> +static int tda38740_probe(struct i2c_client *client)
>> +{
>> +	return pmbus_do_probe(client, &tda38740_info);
>> +}
>> +
>> +static const struct i2c_device_id tda38740_id[] =3D {
>> +	{ =2Ename =3D "tda38725"},
>> +	{ =2Ename =3D "tda38740"},
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(i2c, tda38740_id);
>> +
>> +static const struct of_device_id tda38740_of_match[] =3D {
>> +	{ =2Ecompatible =3D "infineon,tda38725"},
>> +	{ =2Ecompatible =3D "infineon,tda38740"},
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, tda38740_of_match);
>> +
>> +static struct i2c_driver tda38740_driver =3D {
>> +	=2Edriver =3D {
>> +		=2Ename =3D "tda38740",
>> +		=2Eof_match_table =3D tda38740_of_match,
>> +	},
>> +	=2Eprobe =3D tda38740_probe,
>> +	=2Eid_table =3D tda38740_id,
>> +};
>> +
>> +module_i2c_driver(tda38740_driver);
>> +
>> +MODULE_DESCRIPTION("PMBus driver for Infineon TDA38725/TDA38740");
>> +MODULE_LICENSE("GPL");
>> +MODULE_IMPORT_NS("PMBUS");
>>=20
>
