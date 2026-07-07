Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4296A33291F
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 16:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442079; cv=none; b=RNRCplLRRI0E8U/brRZMiPDEhR2K1FsLmUMYp8bzSKIMZipYZaGKMpyoO9ejABFdjW6FJgVokqXabiie/7m1IznAy8MZ5Sbx3cco2EZdL9tcpymdDVb+mhTivwDVUQ0qHx64hJx/GP+kIq0mp+9FVHUcfat+OIRYceYCTGm0XlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442079; c=relaxed/simple;
	bh=HZOQZ5+gEBXB9FFiQskUNf/8oWIAtCajF2Z9MT8W9Dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UHS1DDP9VQIA3sBkGQhBgOmxq/cLeVlRoZuoI0ETyfhzg54A4+FR+D8eb7gV/TBkqzMlvfGzip2lCt8mTtlpilzgsXygrdM5yowwI71R07wZYyGV6mtkCyhTvw323HmAN2/soJwYa+X9wPNXObp/ocqJ5SzRK+t7hsAPMV6Swi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=odla9vgw; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="odla9vgw"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba3e6so7623684a12.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1783442074; x=1784046874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m4yMg62YAe6Tk0Zq+iKrI/zpLYixVD/ZixnriSqWY5c=;
        b=odla9vgw6qcBhvarpe3TXwKagXjWpw28LyNO93mud5SjOGeb6fiTBkHlwtiqa/4q+v
         K7+Z/UxsznOao9Qq/UAxeurn0DseNG/Aj5mei911j1NIDaNBKqrB8DsKWTDjRqMloC1V
         wtkOtuUxmvVq59gbvH0+mTpHhrz+9pH9iRe6RFKEsg/XuRi/gW3mlr2fqrb9YUzbU4un
         PPS27aXNx424aDJoIbR6Rpz3cD/1iueeZG20MbUkKjQpGa84K5nZU27Oae/PuEejh9a7
         DtF0Uj5MH2xkx1MN+DBuYYk3DgIrE1wVNC422nOwueGC5eNsEf8p1Xpllr6x3AbN/snD
         0d9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442074; x=1784046874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4yMg62YAe6Tk0Zq+iKrI/zpLYixVD/ZixnriSqWY5c=;
        b=UCu2R2i8CxxPsirECtCbSsrpjz+3ELS3z6ITOoQgFoyGtRESE+Qgngf0eI0JYQUIkj
         ZSkV7I88GUQxVgCb33aIz0Hs1DqtLnetHGnhEwwzz/+1SLp1315j+ogTmxzFAGGOkLUW
         TAgXuvfZ649G51WLSdiWbvU7YyYzCuPzU1wkqIb/tle9MJbySrku2oSBOVa8seb8QG1h
         SkZ1jF4LqF6gtiGwFTY/qmbkO+VgZW5QINnKkiWtWJL7Nbsw8EzwGRrjZIcFti8EEWXO
         WtarcVM4pkKbO7PLCo2zObrLq3/0YeGZ+Zys7iCVjF4KBZlKsJbC0lcxMJOcLIdhM4Od
         UBPw==
X-Forwarded-Encrypted: i=1; AHgh+Rr2KlgWC0ZVaEkmjmgf0ZBJTse1o5hCRckYbEyDgQoFj1VoxWjoBuvFk4zyDPUJC1DPMyoiMgRhHnT9@vger.kernel.org
X-Gm-Message-State: AOJu0YwEa5RB2FB7UFBGn1CI1WwCmb0UbB54ovPoMa1uJurNTvyWwb4S
	t1fzfeSfbzsgTp01adRBQ1lQcjI+IxPd2zc+PN0to8PZDQ2OhLem4Dlxq8KzPoyKIw==
X-Gm-Gg: AfdE7cl5qVWj5I1aZVEeD0kA04xSYtC2Kxbhlxw7xF7mT0XRFNcSrk1LjYXXuQXjREW
	h1jvdsnzhMBKX/GLlwuMxOqCpJJptnFx1+Zs2I1ex9lvRy7S5f5+dAvmQyL5D86f2nRnpCmeWw4
	3Zqhh2GO92u5Ir7F0IPcb1qfvTZwL8bOVSMoxaLE5mMfOV6m+UCx6asR2vtJPk9poEzVlBDwGCP
	pr1tbEcMj6milP8cTdemeU9jEvDXqU4v6F+cU1L9lv5/bps87tQRNvr8Zg6PFTUVtiI0dx6sOmW
	zrTR7dTLUr5pHvTcm8oIyPqSKK2+M0XDV5w5Wzm1DJ4+YW/89xZin8DZeKfOL3G/LRZvKM4c5UQ
	NjWhhqeOnKb6GYE6z5A7rZOxj2+y4KEY+Ez952a1o8r50S0XM2RDo6YscHv0iS/4bAQkUnwNELM
	kM1zPFsLOdMNCD0Ohc2uNWlHNKbCEeEgIixUgp9NRAfOvk+Q==
X-Received: by 2002:aa7:d58b:0:b0:697:d4ee:ab97 with SMTP id 4fb4d7f45d1cf-69a8566812cmr2367431a12.12.1783442074173;
        Tue, 07 Jul 2026 09:34:34 -0700 (PDT)
Received: from [10.254.183.223] ([149.199.62.131])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d78a08sm6832401a12.18.2026.07.07.09.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 09:34:32 -0700 (PDT)
Message-ID: <da06120d-0850-4e79-9e07-efe481c057ff@monstr.eu>
Date: Tue, 7 Jul 2026 18:34:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] dt-bindings: clock: Move xlnx,zynqmp-clk to its
 own schema
To: Rob Herring <robh@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, git@amd.com,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, kishore Manne <nava.kishore.manne@amd.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
References: <cover.1780499520.git.michal.simek@amd.com>
 <23d848e29176706548612c4a0751481d46176f11.1780499520.git.michal.simek@amd.com>
 <CAL_JsqLWwcRjzQs4DHV265w-ROzeW_OPVS0uP0Ew8p+-dYu+EA@mail.gmail.com>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <CAL_JsqLWwcRjzQs4DHV265w-ROzeW_OPVS0uP0Ew8p+-dYu+EA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7/7/26 17:55, Rob Herring wrote:
> On Wed, Jun 3, 2026 at 10:12 AM Michal Simek <michal.simek@amd.com> wrote:
>>
>> The ZynqMP clock controller binding shares only #clock-cells with the
>> Versal bindings. Move it to a dedicated xlnx,zynqmp-clk.yaml schema.
>> Also remove "(Optional clock)" from clock description because it is visible
>> from schema itself.
>>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Michal Simek <michal.simek@amd.com>
>> ---
>>
>> Changes in v3:
>> - Cover change in zynqmp-firmware.yaml
>> - Move clock-cells to be the last in the example
>> - Remove comment around (Optional clock) which is obvious from schema
>>    itself
>>
>> Changes in v2:
>> - New patch in series
>> - Split zynqmp-clk from versal-clk
>>
>>   .../bindings/clock/xlnx,versal-clk.yaml       | 50 +-------------
>>   .../bindings/clock/xlnx,zynqmp-clk.yaml       | 68 +++++++++++++++++++
>>   .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |  7 +-
>>   3 files changed, 76 insertions(+), 49 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
> 
> This is now causing warnings in linux-next:
> 
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb:
> zynqmp-firmware (xlnx,zynqmp-firmware):
> clock-controller:clock-names:0: 'pss_ref_clk' was expected
>          from schema $id:
> http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb:
> zynqmp-firmware (xlnx,zynqmp-firmware):
> clock-controller:clock-names:1: 'video_clk' was expected
>          from schema $id:
> http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb:
> zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:clock-names:
> ['ref', 'pl_alt_ref'] is too short
>          from schema $id:
> http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb:
> zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:clocks:
> [[4294967295], [4294967295]] is too short
>          from schema $id:
> http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb:
> zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:compatible:0:
> 'xlnx,zynqmp-clk' was expected
>          from schema $id:
> http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml

I will look at it. Thanks for reporting it.
Michal


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

