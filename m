Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F028E406281;
	Mon, 20 Jul 2026 12:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784549330; cv=none; b=Zm8xS55fEBHblhb4LNWpyz1JE+W34Gzu6GaXEcOcBSq6kSYdYo0RLEH/HjhW/Pt2WZDiBV47JDc+OnISqFqLsRfA8lho9TwwC+PoHtLOtoChwRi8nXxr0QdnXDjv3quB8iyw/u8ejgCBV/bmycq1sf3A0gFWBnub9BhLBrg2JcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784549330; c=relaxed/simple;
	bh=XuN1ZHDosv8zSjFIBBK37p0R1UvJY5wqIYvpZy1jn24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pYqsjNhXo+yN/Ptx/VgT7GCcfNKVmL2qz9A3ICgnQxGsM/4HSauzyhkLrdIPF6ifZPLxukJfMKszRXodwDjHSUxEXiCtYdflbRUO8ljjSMhrSLDV4ch6jJJj4dh6+n5kLIPwtqirl3Ha/ic8E6Z+Ju/K3rxsSCGT/+EOZOTCK/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Cm9qtiie; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Cm9qtiie"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 256D62B;
	Mon, 20 Jul 2026 05:08:40 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA9A33F99C;
	Mon, 20 Jul 2026 05:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784549324; bh=XuN1ZHDosv8zSjFIBBK37p0R1UvJY5wqIYvpZy1jn24=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cm9qtiieufgIrsldPhEK9QZHMdTr/fgejcGBub1Axz+JF6VoIbtAcvRvhN5Y3CFTW
	 Afw2wtsK9LNMFVRokWOxMcB4lnZYvy204m0qwXbVZYKljR28n3jbTVa9czP4OeBwzA
	 A6BywJWlhmM98Nwt3sQG6EJlzF+C/xyazPfwt9uM=
Message-ID: <d7f4fae1-faa9-4504-8c2e-cbc58d8a42fe@arm.com>
Date: Mon, 20 Jul 2026 14:08:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] Arm Live Firmware Activation (LFA) support
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Varun Wadekar <vwadekar@nvidia.com>,
 Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20260706134455.132091-1-andre.przywara@arm.com>
 <alUMGCJzVG6U3Ggm@kunlun.suse.cz> <alYjFwi0dnld-wP3@kunlun.suse.cz>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <alYjFwi0dnld-wP3@kunlun.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michal,

thanks for having a look and for testing!

On 7/14/26 13:52, Michal Suchánek wrote:
> On Mon, Jul 13, 2026 at 06:02:35PM +0200, Michal Suchánek wrote:
>> On Mon, Jul 06, 2026 at 03:44:40PM +0200, Andre Przywara wrote:
>>> Hi all,
>>>
>>> this is version 3 of the Live Firmware Activation kernel support. The
>>> device part of the code now relies on Aneesh's SMCCC bus patches[1],
>>> which solves some problems rather nicely. I also added the formerly
>>> missing sysfs ABI documentation. Based on v7.2-rc1, plus the first
>>> two patches from Aneesh's series. More detailed changelog below.
>>> ==============================
>>>
>>> This series implements the kernel side support of the Arm Live
>>> Firmware Activation (LFA) specification [2]. LFA enables the activation
>>> of updated firmware components without requiring a system reboot,
>>> reducing downtime and allowing quicker deployment of critical bug fixes
>>> in environments such as data centers and hyperscale systems.
>>> It requires explicit firmware support, both via an agent running in EL3
>>> (for instance in TF-A, already merged), but also in the firmware
>>> component to be activated. TF-RMM recently merged support for this.
>>>
>>> Unlike the usual firmware update process (which may use tools like
>>> fwupd), LFA focuses solely on the activation of an already updated
>>> firmware component, called "pending activation" in LFA lingo. This works
>>> by signalling the LFA agent (part of the EL3 runtime firmware) via an
>>> SMC call, which then does the heavy lifting of the live update, in
>>> cooperation with the to-be-updated firmware component.
>>>
>>> Key features of the driver:
>>> * Detects LFA support in system firmware (EL3).
>>> * Lists all firmware components that support live activation, identified
>>>    by their GUID.
>>> * Exposes component attributes (e.g., activation capability, and
>>>    activation pending) via sysfs under /sys/firmware/lfa/<GUID>/.
>>> * Provides interfaces to:
>>>    - Trigger activation of an updated firmware component.
>>>    - Cancel an ongoing activation if required.
>>> A more detailed list of features can be found in patch 2/8.
>>> Based on v7.2-rc1.
>>>
>>> This work is conceptually similar to Intel’s Platform Firmware Runtime
>>> Update and telemetry (PFRUT) [3] and TDX module updates [4], but
>>> targets Arm platforms. The driver has been used to successfully activate
>>> a Realm Management Monitor (RMM) firmware image in a controlled test
>>> environment. RMM is analogous to Intel’s TDX module.
>>>
>>> There is effort on similar work from the OCP [5]. Future work may
>>> include integration with utilities like fwupd to automatically select
>>> the appropriate driver, based on platform architecture, for Live/Runtime
>>> firmware updates.
>>>
>>> Please have a look, test and comment!
>>
>> Hello,
>>
>> booting a kernel with v2 of this patchset applied the module does not
>> get autoloaded. Loading it manually I get
>>
>> [ 1972.957282] [   T5195] Arm LFA: Live Firmware Activation: detected v1.0
>> [ 1972.958620] [   T5195] Arm LFA: registered LFA ACPI notification
>>
>> Is this expected?
>>
>> I would expect the driver to load automatically.
>>
>> I do not see anything in the v3 changelog obviously addressing
>> autoloading but changing to using a bus might affect that.
>>
>> I will try to update to v3 later.
> 
> Hello,
> 
> updating to v3 of the patchset resolves the problem.

Yes, that was indeed a change that came for free with changing the 
probing method to be now SMCCC bus based. As Krzysztof rightfully 
mentioned before, the driver was always probing, then bailing out if the 
service was not available, which is not the way it should work under the 
driver model. As a side effect, there wasn't really any discovery or 
auto-loading mechanism. With the new SMCCC bus this should now all be 
solved.

Thanks for testing!
Cheers,
Andre

> The driver is now autoloaded.
> 
> Thanks
> 
> Michal

