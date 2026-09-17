Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E7C4D9F76
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647545; cv=none; b=lcoH4P/l50FP/qu62EOgoewl6QKQJYwguq1cxSv2Sre/wKjlQSCz9kQ8edG4r6uYCeb+rROwghg+wuXNlZ4x8ftAwFcSCoQUFFi5xPB74xl7sp4hWv1KuDD4onC6U8PbrUDyqn+AWVn6a7lL2alwsixMfX7iDSs3LBdVj9NGLPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647545; c=relaxed/simple;
	bh=kcYWCICZxy4tVxR3vKSLEGl5RDtmSqe639LHqvGgn/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j1rggnEdCiiaPe8Y26KO1AD7Zsd1mwVZH+IDNebEil2aaACSqO2lgirj4A3BX/3kGkIPGr3fWv+lhvHC8CuxNhhXNN7jNhZc506sRqg2Ql/j/X5Rqv7ar5/MYCR60NUEC5GQSI7+wwbzsaKvbZV7l+tslYo2kfOP8M0qzH+9mHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ol6zTXKF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SW+7PFku; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ol6zTXKF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SW+7PFku"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZnBK2210952
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLidpK666Qo4PK2scTKJdMHZcsfWyON6rHKOqwd2TFY=; b=ol6zTXKFnD4JTeBU
	LZXVlSGRIKpqvNI1JClyH012G5SMoW8Ppahz1raOklot6VsMWHMYfVhtpyAaWCPj
	WTgTCywUIvGYku13D8HmsBIWW/pVIDGQJIdsMnS+tcIVHq2vjIvxPnsjrNYdbfc2
	eJdfsaO7QUfPiJo0wGQwacAQnmbDxkhHKCuxMrRzI2R22cFj9V2UNjrDp93n5+pe
	5mgoEIrhrg+Q+uTwPhqe6QR9gn627UkrHHGaXuEJLqd5iXgtBzxQiiCSNBYO8lNj
	2UoeA8Oo6OkdXu07QvdSnKXptZhDFtDz/eoxuPlHLBdZqBIxlzIS//t1nIoX6nkv
	xyuEHw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m27rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:18:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4e496e5c3so659682a12.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647526; x=1790252326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLidpK666Qo4PK2scTKJdMHZcsfWyON6rHKOqwd2TFY=;
        b=SW+7PFkuNJAZM4NNNa6E955KvMmGJDX9F51djwiXRyhyHX5szhFiYutdXvi0owBigB
         JQLqe+deKpSan1QKMnhaPFxeVqoC/Zd/g8jTw2hO1iMsfP+iJO1yQgynTsNlinBFDkPK
         r3K4qAsD2FFv4QMfIRgbvQcuixVUHhSajXko7EiFhV3txtupnwYhp4lMghX+tJBc7VLb
         8ySmxg7TLbauOQuQWBTj4ewlozXKei2WwEbVhKWA2PcyL5uiPSNRpY9iGGnJPVFteQhb
         rrVp+Z24f68fPd0isb0g4FNB3w3Z5h0+bbNvJc5tpV4oFiRjtDY8aGoDgVo4QC7hp/pj
         oWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647526; x=1790252326;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLidpK666Qo4PK2scTKJdMHZcsfWyON6rHKOqwd2TFY=;
        b=omi+LthwdgMErAonOHKSurXVuOtc/x0M1JIZcCxDhgJ62fwE9bz+Hjdn4qcxDJBl5Y
         UU8xSVFS7qU1yOHf5A2xOMn6Sys6ByTNdMPlUAdkKE3+FKkL551m0hh7SXgvhO6svavj
         6t9tTzIPDaLu9E/WSBA9zrtis7AqBl0G7j/d0O2W6DKw1kLyA8z9OvJUl7oizYlXJU8d
         6CWio+feGhHI6305t8iUfQf13UMCcf4zXggjLiiV4h6mrw1lGMxa8A35X81xKX0otZkT
         AXDGR+ZkySjsomXNBLQfzCWkvd91OGfvhwfVshW6f/QR6aoBhlX1AVJruG9jJEUDFM03
         U5zg==
X-Forwarded-Encrypted: i=1; AKwUvBxnhnNnfaMLVcbxEs4zTIolYY95KnwkDYbYJKBnUZhO1gSKW2OXpDoHUmUefe6M8Gk3gjBxVNJoUnI/@vger.kernel.org
X-Gm-Message-State: AFuF++k6tEx/8JQb0mtCsPnUXJANt5Xd+PDyhudm2GzrHsICac+LIA++
	eTKICjs1uVA5lqASqRL9ZYatfLjxTJhf02coj2Pnis/rN9NUVlFfRKOzikiQ0WUwme0yW0yIkdq
	lbkOfFI3oWUOdvy8p0+D8CcDBjN//n7MFzGHjMo8WZpboNACuzmGs67/vxvNwvSjc
X-Gm-Gg: AYBFou3SQI3PzMPh3rDJNhRrOumcQTNI+WBAac6kyJwcJG5rMaozi/ww9qGYDfGOnff
	Mh0EhfC5aWy9jBMk8E3n8Ovy1r1tH/gjLaAYW+UCd8rzptZ5PcS/FdrxjN0wnOIJCH4OEPU8jg2
	ToeclYgDfJeKa/vZA52gqewhkTT/PslQJGeVjmqsY/zVeIta7A2TOv9Li/9sHiraGfCSjEpD2nM
	lPGRZW5Z7sARkFY4S/hnlc5p7NxQGq0Vnh1kQQS4vJxvgqVIQFn4m0mXOHzK25/+8uLH5azlQtY
	1lQLP1TxN0PvieoejlEoajCmZmenFK0+Kv8Bsw4xoglHdN6QoqZu8DfAd9fThocuR0+tvm97q8F
	sm7PG5cNYx37kMWNa2oy6g+6c9oUCrCU=
X-Received: by 2002:a17:902:f686:b0:2da:ef81:37e7 with SMTP id d9443c01a7336-2dd8e76a15dmr143387935ad.21.1789647525383;
        Thu, 17 Sep 2026 05:18:45 -0700 (PDT)
X-Received: by 2002:a17:902:f686:b0:2da:ef81:37e7 with SMTP id d9443c01a7336-2dd8e76a15dmr143387145ad.21.1789647524708;
        Thu, 17 Sep 2026 05:18:44 -0700 (PDT)
Received: from [10.218.9.75] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89c3316dsm25970945ad.0.2026.09.17.05.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:18:44 -0700 (PDT)
Message-ID: <f14f40ef-47dd-453a-875f-6cdc6804a9fd@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:48:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 04/10] firmware: psci: Add support for PSCI auxiliary
 devices
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-4-4aaf5c09b5c2@oss.qualcomm.com>
 <CAMRc=MdCWHQZ+CgW05jYA1GGJdMUwKJEBAiAvRCvx=UqvjLiUg@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdCWHQZ+CgW05jYA1GGJdMUwKJEBAiAvRCvx=UqvjLiUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aabdaa6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=mLyWk11G7CGH-Ip0H1gA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: QXT7c2B5ciaCOZI5sVN2ezXnbNYSsDeQ
X-Proofpoint-ORIG-GUID: QXT7c2B5ciaCOZI5sVN2ezXnbNYSsDeQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3MSBTYWx0ZWRfXwrSL32cGSNm2
 cPgPhxqVAaQv29Mna+PPbHSonaG5cg4U0L8KzeCTCNBhcolSfQcMvy4Q0t4ZpGA3iXFJt6BmSda
 PhMVSOOoxfvPdtrYer3rp3vxW1pTyp4ScQlABo8YF+Xt4gnXoazZB31+uTPtBJ8mVvij1RXy/B4
 BhsfwF6v47OETPC/HnPuIA8XPke09Be7sjvBQeZAadgZn958Jdq8/PseXSoF6yrx1x0J/aLgvOD
 wJDQ88OUIn5Fph65MpnTlQDgteIg2YUD3xSXCfOhsDcnVzVDkhtak9ftz6rpLccVjfiuP4Fg9so
 SM+ir+fZyCA3LIJch2YkJpU6PFmQ1l7336LsiENCYel3nZNk6ZD0sN8KDssgTHhWpfcbe3/DtwF
 Lw0izH/y1TC/Iwymo4RnF3xz/jJctSNe9oMYAKCRl5ND2aPUgj6Lhwj0m0aNSrvP4Da/NbvQCxi
 KvRWaYS829tVflhde4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3MSBTYWx0ZWRfX/foQbnQas/dW
 SXCRvMZ4UUARcPhxuS8jzvagNlJEArVC1hExXS+5XgaJZ7PgOeIjTykGlawx1k4mwKkaq3/AlPi
 R9R99fE3emPr2C2Axx2CS9kATdq0ZY8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170171



On 9/16/2026 2:59 PM, Bartosz Golaszewski wrote:
> On Mon, 14 Sep 2026 16:59:08 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
>> Currently, both the PSCI core driver and cpuidle-psci-domain bind
>> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
>> introduced, would also need to bind in the same way, leading to multiple
>> drivers attached to a single device node.
>>
>> Introduce a PSCI auxiliary-device provider that binds to "arm,psci-1.0"
>> and registers PSCI child devices on the auxiliary bus. As the first
>> user, register cpuidle-psci-domain as an auxiliary device.
>>
>> Update cpuidle-psci-domain to probe as an auxiliary driver and use
>> the PSCI device node for power-domain traversal.
>>
>> Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
>> Suggested-by: Lee Jones <lee@kernel.org>
>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                           |  1 +
>>   drivers/cpuidle/Kconfig.arm           |  1 +
>>   drivers/cpuidle/cpuidle-psci-domain.c | 31 +++++++++++++++-----------
>>   drivers/firmware/psci/Kconfig         | 14 ++++++++++++
>>   drivers/firmware/psci/Makefile        |  1 +
>>   drivers/firmware/psci/psci-devices.c  | 41 +++++++++++++++++++++++++++++++++++
>>   6 files changed, 76 insertions(+), 13 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 207a6e2db70c..9c0334ee2ed2 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21932,6 +21932,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>>   S:	Maintained
>>   F:	Documentation/devicetree/bindings/arm/psci.yaml
>>   F:	drivers/firmware/psci/
>> +F:	drivers/firmware/psci/psci-devices.c
>>   F:	include/linux/psci.h
>>   F:	include/uapi/linux/psci.h
>>
>> diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
>> index b88b01aa5829..f22e18b05053 100644
>> --- a/drivers/cpuidle/Kconfig.arm
>> +++ b/drivers/cpuidle/Kconfig.arm
>> @@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
>>   	bool "PSCI CPU idle Domain"
>>   	depends on ARM_PSCI_CPUIDLE
>>   	depends on PM_GENERIC_DOMAINS_OF
>> +	depends on ARM_PSCI_DEVICES
>>   	select DT_IDLE_GENPD
>>   	default y
>>   	help
>> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
>> index b9e4ad7d43a3..0ce6a83f6588 100644
>> --- a/drivers/cpuidle/cpuidle-psci-domain.c
>> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
>> @@ -9,10 +9,11 @@
>>
>>   #define pr_fmt(fmt) "CPUidle PSCI: " fmt
>>
>> +#include <linux/auxiliary_bus.h>
>>   #include <linux/cpu.h>
>>   #include <linux/device.h>
>>   #include <linux/kernel.h>
>> -#include <linux/platform_device.h>
>> +#include <linux/module.h>
>>   #include <linux/pm_domain.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/psci.h>
>> @@ -122,14 +123,10 @@ static void psci_pd_remove(void)
>>   	}
>>   }
>>
>> -static const struct of_device_id psci_of_match[] = {
>> -	{ .compatible = "arm,psci-1.0" },
>> -	{}
>> -};
>> -
>> -static int psci_cpuidle_domain_probe(struct platform_device *pdev)
>> +static int psci_cpuidle_domain_probe(struct auxiliary_device *auxdev,
>> +				     const struct auxiliary_device_id *id)
>>   {
>> -	struct device_node *np = pdev->dev.of_node;
>> +	struct device_node *np = auxdev->dev.of_node;
>>   	bool use_osi = psci_has_osi_support();
>>   	int ret = 0, pd_count = 0;
>>
>> @@ -177,16 +174,24 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
>>   	return ret;
>>   }
>>
>> -static struct platform_driver psci_cpuidle_domain_driver = {
>> -	.probe  = psci_cpuidle_domain_probe,
>> +static const struct auxiliary_device_id psci_cpuidle_domain_id_table[] = {
>> +	{ .name = "arm-psci.psci-cpuidle-domain" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(auxiliary, psci_cpuidle_domain_id_table);
>> +
>> +static struct auxiliary_driver psci_cpuidle_domain_driver = {
>> +	.probe = psci_cpuidle_domain_probe,
>>   	.driver = {
>> -		.name = "psci-cpuidle-domain",
>> -		.of_match_table = psci_of_match,
>> +		.suppress_bind_attrs = true,
>>   	},
>> +	.id_table = psci_cpuidle_domain_id_table,
>>   };
>>
>>   static int __init psci_idle_init_domains(void)
>>   {
>> -	return platform_driver_register(&psci_cpuidle_domain_driver);
>> +	return __auxiliary_driver_register(&psci_cpuidle_domain_driver,
>> +					   THIS_MODULE,
>> +					   "psci-cpuidle-domain");
>>   }
>>   core_initcall(psci_idle_init_domains);
>> diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kconfig
>> index 97944168b5e6..68e381f1a618 100644
>> --- a/drivers/firmware/psci/Kconfig
>> +++ b/drivers/firmware/psci/Kconfig
>> @@ -2,6 +2,20 @@
>>   config ARM_PSCI_FW
>>   	bool
>>
>> +config ARM_PSCI_DEVICES
>> +	bool "PSCI auxiliary device support"
>> +	depends on ARM_PSCI_FW
>> +	depends on OF
>> +	select AUXILIARY_BUS
>> +	default y
>> +	help
>> +	  Say Y here to enable auxiliary device support for PSCI.
>> +
>> +	  This creates auxiliary devices for PSCI functionality implemented
>> +	  outside the core PSCI firmware driver. These devices allow PSCI
>> +	  child drivers to bind through the auxiliary bus while sharing the
>> +	  PSCI firmware device as their parent.
>> +
>>   config ARM_PSCI_CHECKER
>>   	bool "ARM PSCI checker"
>>   	depends on ARM_PSCI_FW && HOTPLUG_CPU && CPU_IDLE && !TORTURE_TEST
>> diff --git a/drivers/firmware/psci/Makefile b/drivers/firmware/psci/Makefile
>> index 1956b882470f..8e75a0ed6f74 100644
>> --- a/drivers/firmware/psci/Makefile
>> +++ b/drivers/firmware/psci/Makefile
>> @@ -1,4 +1,5 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   #
>>   obj-$(CONFIG_ARM_PSCI_FW)	+= psci.o
>> +obj-$(CONFIG_ARM_PSCI_DEVICES)	+= psci-devices.o
>>   obj-$(CONFIG_ARM_PSCI_CHECKER)	+= psci_checker.o
>> diff --git a/drivers/firmware/psci/psci-devices.c b/drivers/firmware/psci/psci-devices.c
>> new file mode 100644
>> index 000000000000..f1eca61e3269
>> --- /dev/null
>> +++ b/drivers/firmware/psci/psci-devices.c
>> @@ -0,0 +1,41 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/init.h>
> 
> I think you need module.h not init.h.

Ack.


> 
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +
>> +static int arm_psci_probe(struct platform_device *pdev)
>> +{
>> +	struct auxiliary_device *auxdev;
>> +
>> +	auxdev = __devm_auxiliary_device_create(&pdev->dev, "arm-psci",
>> +						"psci-cpuidle-domain", NULL, 0);
>> +	if (!auxdev)
>> +		return -ENOMEM;
>> +
>> +	return 0;
>> +}
> 
> I would prefer you to move the code between the patches a bit. This patch
> should already be introducing the full, future-proof infrastructure for
> registering multiple auxiliary devices, so maybe add a static table with device
> info? Then in patch 10/10 you'd just extend it for reboot modes.

Ack. will update it.

> 
> I'd also not add any ifdef guards here and lesses the build-time dependencies.
> You can register the device alright, it just won't get probed if the reboot-mode
> support is not there.

Ack.

thanks,
Shivendra
