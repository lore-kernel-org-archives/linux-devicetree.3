Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9990638F65F;
	Thu,  4 Jun 2026 08:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780562920; cv=none; b=L+Bjl+Zq7U31pG2lUE93ROwQoKwBghfgEPkHguIVFUpPgJf/4GzIOj2Us02kw044N9n4OWXJ6t1MvwtbXVxVXNJSRWKHVAuD5UjFo45Se3f/bUjRsUQSx0gKdhzd4yVpetSXu10SpKSsa/LuNEZqtP2H8nd1TYoCICjIgRWqo8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780562920; c=relaxed/simple;
	bh=x7GaYiqMTWI/bcabYGbp7H9giCfeL76lqyy7FI5AAOA=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=Faknayv2Zc0BrpRwBxHx4I1+rKfgpxNHK0eTteeEkOeAB+RNQ6tPhvdRevK/n5ApVIXWVLNo2MtxsweSMvLg+NETEWCdFKFw3EZ/oyGLZevjuS/RwS6bkvBShG/DEH/QyT91lyr6e8EtMDkxYDQbuAb/j/ZT5ctzbTppAtOiR8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Blv0Q6d5; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Blv0Q6d5"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Kh0tuMr6VTEn44mFd/E8yc0V3r7gVRubTW/7QOQfE5Y=;
	b=Blv0Q6d5R7jbsGsvojmckBh+EF5Lec6wid6lkHa1RQhtrR4gA9FAvTBM+v2y/u5YUysfOptN0
	85r53KV1+ejSxhuiB7wKEPE5/SkcFBSXmvTF6u9Qg1v+2Fq8FACrzQjvUgAzmpiQqvggOVgEPUX
	MSTIBavKImJStLwigiDiBlU=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gWJ1K4WZQz12LJg;
	Thu,  4 Jun 2026 16:40:37 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id C56C140569;
	Thu,  4 Jun 2026 16:48:32 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 4 Jun 2026 16:48:32 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 4 Jun 2026 16:48:32 +0800
Message-ID: <6A213BDF.9060202@hisilicon.com>
Date: Thu, 4 Jun 2026 16:48:31 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: Akash Sukhavasi <akash.sukhavasi@gmail.com>
CC: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <xuwei5@hisilicon.com>
Subject: Re: [PATCH] arm64: dts: hisilicon: hi3660-hikey960: move role-switch
 endpoint into connector
References: <20260520215325.55353-1-akash.sukhavasi@gmail.com> <aiBVHbRX3wxUNFs2@gmail.com>
In-Reply-To: <aiBVHbRX3wxUNFs2@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq100003.china.huawei.com (7.202.195.72)

Hi Akash,

On 2026/6/4 2:54, Akash Sukhavasi wrote:
> On Wed, May 20, 2026 at 04:53:25PM -0500, Akash Sukhavasi wrote:
>> The rt1711h Type-C controller on the HiKey960 has the USB role-switch
>> endpoint placed as a top-level 'port' node, outside the connector
>> subnode. This triggers two dtbs_check warnings against
>> richtek,rt1711h.yaml:
>>
>>   - 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
>>   - connector:ports: 'port@0' is a required property
>>
>> Move the role-switch endpoint into the connector's port@0, which is
>> where usb-connector.yaml expects it. Update the DWC3 remote-endpoint
>> phandle accordingly.
>>
>> The TCPM core (tcpm.c) looks up the role switch starting from the
>> connector fwnode via fwnode_usb_role_switch_get(). With the endpoint
>> inside the connector's port@0, it is found through the primary lookup
>> path rather than the device-level fallback.
>>
>> Cross-compiled for arm64. Verified with dt_binding_check and
>> dtbs_check. Not runtime-tested on hardware.
>>
>> Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
>> ---
>>  .../boot/dts/hisilicon/hi3660-hikey960.dts      | 17 +++++++----------
>>  1 file changed, 7 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
>> index c6056a85c..27fb08d34 100644
>> --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
>> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
>> @@ -550,6 +550,12 @@ usb_con: connector {
>>  			ports {
>>  				#address-cells = <1>;
>>  				#size-cells = <0>;
>> +				port@0 {
>> +					reg = <0>;
>> +					usb_con_hs: endpoint {
>> +						remote-endpoint = <&dwc3_role_switch>;
>> +					};
>> +				};
>>  				port@1 {
>>  					reg = <1>;
>>  					usb_con_ss: endpoint {
>> @@ -558,15 +564,6 @@ usb_con_ss: endpoint {
>>  				};
>>  			};
>>  		};
>> -		port {
>> -			#address-cells = <1>;
>> -			#size-cells = <0>;
>> -
>> -			rt1711h_ep: endpoint@0 {
>> -				reg = <0>;
>> -				remote-endpoint = <&dwc3_role_switch>;
>> -			};
>> -		};
>>  	};
>>  
>>  	adv7533: adv7533@39 {
>> @@ -683,7 +680,7 @@ port {
>>  		#size-cells = <0>;
>>  		dwc3_role_switch: endpoint@0 {
>>  			reg = <0>;
>> -			remote-endpoint = <&rt1711h_ep>;
>> +			remote-endpoint = <&usb_con_hs>;
>>  		};
>>  
>>  		dwc3_ss: endpoint@1 {
>> --
> 
> Hi Wei,
> 
> Friendly ping on this one.
> Also, is the hikey960 board still actively taking fixes?
> 

Sorry for the late reply!
Fine to me and applied to the HiSilicon arm64 dt tree.
Thanks!

Best Regards,
Wei
