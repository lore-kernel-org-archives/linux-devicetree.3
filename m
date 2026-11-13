Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576589;
	b=j8xSrrw67mq11MS1/suDDdZ8O0aZ75Ru2rWf7NQc0vY07xFGJlHyZxYhgqMv4ai6v/yS
	 k8TOvCRyNbrkG4BaPNJf4DnKJjHe2GuI9IOF/upElJwiczvluKTmc0mqEhjesEjljvSxL
	 isgSXSSW+e5oBB8cQGx0vJl2QZanG8LX35sWHueb3pFZe9K8fkWOPqZ6A7Q43JPCq4jVV
	 QtvIsOL7Tjw9ME1dTUklZPIwVoGUpcF76ugcFqFUJ2KFdINcI4iP6ie9F8sABYt152AGT
	 k90fssLlIPhYc0/Z6E4XGhG/fzz/5ZIZ+I/LvagWNTVUb6yIuCksTJH9Guo5DJ4lRnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576589;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=GovTyvydkVkQrCGZJ5TyYvPpzcYH6KA5p9NlJ4kAQIs=;
	b=TB8Nujdc6ww3acqzweU76JnKUGakBQEYzIm8oXVewMEHO24TlfsEu5Y2Y6IMDcDotJM8
	 SkXhqNC4wRa9O8jJt9crf8Uasaenz5DqNzHjl9m7rNlH4oyg56aJTczrFM9Qkt9Rw2A6X
	 qcTtlVlMp7mS3rpzeXlpiKxU8+EQdixe7nAXBdFCAORjjwqZMZpNqw+BGkiagvRfCkXhy
	 ZqTp92DjvKDaqgMQiKtxAxcHo9oMFDfd4xK/QbvhY1A7uXDML76FSSp8QjZUpRhsJjMU8
	 pjXALBXOSLGpTU6ov16GS/wq0ZAelhYNQRfZNB3suBJ5/sTwmnt46UNTFYZULgkynRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=EF7PKa36;
	arc=none smtp.remote-ip=95.215.58.46
Received: from mta1.migadu.com (out-46.mta1.migadu.com [95.215.58.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BB9606A89A
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08BB9606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=EF7PKa36
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fhhvaKaF0+C06GIQnzgQPEoqdFIJSGlkTUn8H9rIHNM=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794576585; v=1; x=1795181385;
 b=EF7PKa362tPelz+tq20jjG0cOKYDPORaPArw2Fnjk5ikOOMtb2dzeZMA/a1ptUQIHGaJ1vJ8
 t6sScc/UVWYjZUekicRdLPqrU/6MrRdIAlmiS++CkDQzo+OegB9j698qLjL6/8HhrPS4xdjRRgc
 Ydj6hcP+qpzoLb5CyYqy4xhzA0V6mrYEcOpmIYz0rCAyoLuHvun3LXnStuRIWrj+CN8lfU+jUAI
 aLcHvT451J5hyN7C0cIIWb+EwN39Z8CJRzVl7cKKYPLbruwP4YmKXpE3sFvdU+Mfi14PMzLdbyp
 td6nrRqW8dCPu43k6aQk5pQdoJKmDe+Kcf2ILknQOy2Qw==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0231a53ba74ca531;
	Fri, 13 Nov 2026 13:29:44 +0000
X-Mizu-Trace-ID: 0231a53ba74ca531
X-Migadu-Flow: FLOW_OUT
Message-ID: <f354e6b0-c4ce-44f0-b315-60895e90ec3d@packett.cool>
Date: Fri, 13 Nov 2026 10:29:36 -0300
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
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: psci: Add
 skip-suspend-mode-switch property
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
 Reza Kurniawan <imkyufie@gmail.com>, Sudeep Holla <sudeep.holla@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com>
 <CAPx+jO-rMeg8BvemcMUcC10enjt0dkqWvsK+uRwc75rWpLXhMg@mail.gmail.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <CAPx+jO-rMeg8BvemcMUcC10enjt0dkqWvsK+uRwc75rWpLXhMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/13/26 10:09 AM, Ulf Hansson wrote:
> + Sudeep
>
> On Thu, Oct 22, 2026 at 11:41 AM Reza Kurniawan <imkyufie@gmail.com> wrote:
>> From: Alejandro Tafalla <atafalla@dnyon.com>
>>
>> On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
>> that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
>> call is rejected with NOT_SUPPORTED.
>>
>> PSCI provides no call to read back the current suspend mode, so the OS
>> cannot tell which mode the firmware is operating in or why the switch
>> is rejected.
>>
>> Add an optional flag that tells the OS not to issue
>> PSCI_SET_SUSPEND_MODE on such firmware.
> I think it would be nice to further clarify what's going on in the
> PSCI FW. If I understand correctly, the only supported mode is the
> PSCI OS-initiated mode, hence it's always running in this mode, right?
>
> This is clearly a violation of the PSCI spec - and I guess updating
> the FW isn't possible at this late state, or is it?
>
> [..]

Updating low-level FW in retail devices just doesn't happen, sadly. 
Can't be done by the user, IIUC not even if Qualcomm wanted to help out, 
because firmware is signed by the OEM and won't load w/o that signature.

And OEMs, well.. we can't even get the vendors for modern high-end 
laptops to pull important bug fixes from Qcom.. Thinkpad X13s still 
requires that stupid arm64.nopauth workaround, retail Hamoa laptops all 
struggle with the DC ZVA crash/reset 
(https://github.com/icecream95/x1e-crash) that no one from the Qcom 
IoT/Linux world has ever encountered because of different firmware 
apparently, and so on..

MSM8917/MSM8937 are found in decade old low-end mobile e-waste, only 
could be updated by force if someone finds a bug in firmware secure boot :)


Thanks,
~val

