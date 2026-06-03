Received: from outbound1.mail.transip.nl (outbound1.mail.transip.nl [149.210.149.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB7438D40E;
	Wed,  3 Jun 2026 16:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.210.149.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780502967; cv=none; b=brOxBiPeI303LwIP2qCgjiXYI6MOEiXIfNnZuhoPndZotSkgMZC+fdkINL8nNcJF+MYD6+MLHDcRnZzzEce2jk7tukw79V+Fq9TICJqY5fsUym9T7AT8Z9okQABzQUfSQc+qn1jg4NDqyEpw73fqe2xWgTJUv38V3q8JZfvWg6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780502967; c=relaxed/simple;
	bh=6iSSDJrd1g/5ccSaf2LhHGlopQA5o76L1WcoFbkvatk=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=DLYzvM1DsGtxwqhXq+Udef9l7mn2dZKYPJkTCza23IelRijMeXNeno4q4Kd2TL33NbK13qbSmdXlSdqjytbJC3x23NJIX4FzjFr+XR+LIl87BPHrczYKiRxdyQVbPIEyzvbZOtnoQiCWnRjH9zlItP+KUgBuCb95Of/D5ZdX0Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=lBcog0a3; arc=none smtp.client-ip=149.210.149.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="lBcog0a3"
Received: from submission12.mail.transip.nl (unknown [10.103.8.163])
	by outbound1.mail.transip.nl (Postfix) with ESMTP id 4gVt1V5zL9zRj44;
	Wed,  3 Jun 2026 18:09:18 +0200 (CEST)
Received: from transip.email (unknown [10.103.8.120])
	by submission12.mail.transip.nl (Postfix) with ESMTPA id 4gVt1V2Fs4z3SJ37R;
	Wed,  3 Jun 2026 18:09:18 +0200 (CEST)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 03 Jun 2026 18:09:18 +0200
From: me@herrie.org
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Herman van Hazendonk <github.com@herrie.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,usb-hs-phy: add
 qcom,vendor-init-seq
Reply-To: github.com@herrie.org, me@herrie.org
Mail-Reply-To: github.com@herrie.org, me@herrie.org
In-Reply-To: <ti5p3oreibkae4pl5sn52g3ctv3ufcs6aklwgbterksrxvxrbj@b6scawz2cqmq>
References: <20260603054809.565723-1-github.com@herrie.org>
 <20260603054809.565723-2-github.com@herrie.org>
 <ti5p3oreibkae4pl5sn52g3ctv3ufcs6aklwgbterksrxvxrbj@b6scawz2cqmq>
User-Agent: Webmail
Message-ID: <66905f4914dc022629158ac02df1c7df@herrie.org>
X-Sender: me@herrie.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission12.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780502958; h=from:reply-to:subject:to:
 cc:references:in-reply-to:date:mime-version:content-type;
 bh=kTA/m61jv540sGh4xUbqI8X96qKnrTavHeGABcK34xw=;
 b=lBcog0a3vWRJhh5Ky6Y9a4K8n6uHWEOvdCEfoobPhYWIdclMzODAJG95ViJwVs+pvfW+hx
 j6Ju/8EU2kjdaeF5kFQzsBDvYCf9qWAlPGGdoCy58HzC+dePji8pWoxKSKYkeDi6nFBGSo
 eAr97llmtKoUrfnkvTnlip7wE93ssiw8yVdgTGajFG9Kc+XriWd6I2FKohIb/Kv4fBGAGL
 svWzxcESHL2k86gSNnpZoaJBFSexeUi0uf/TuMkQ1CX/t43ptKJzXJq6EXTT6Gv+gwQH41
 WSP33Be/mXkW761Tc85FHqCZ6XhpAcmixSSgUGg8XKHly3abBeZ/zpMl69JHoQ==
X-Report-Abuse-To: abuse@transip.nl

On 2026-06-03 15:57, Dmitry Baryshkov wrote:
> On Wed, Jun 03, 2026 at 07:48:08AM +0200, Herman van Hazendonk wrote:
>> Add an optional "qcom,vendor-init-seq" property carrying raw ULPI
>> (address, value) pairs that are written after PHY reset.
>> 
>> Unlike the existing "qcom,init-seq" property, the address field is
>> NOT offset by ULPI_EXT_VENDOR_SPECIFIC, so the new property can
>> reach the standard ULPI vendor register range (0x30-0x3f). MSM8x60-
>> class hardware needs this range to programme pre-emphasis, HS driver
>> slope and CDR auto-reset bits the legacy msm_otg driver used to set
>> via platform data.
> 
> Are those register writes specific to the device or to the whole
> platform? In the latter case please extend the driver to write them.

Looking at every MSM8x60 reference kernel I could find (Qualcomm's own
msm8x60 board, HP TouchPad / APQ8060, and some HTC/Saumsung MSM8660
devices), the writes split into two groups:

Platform-level (same across all MSM8x60 hardware):
  - reg 0x36 bits 1+2: CDR auto-reset disabled, SE1 gating disabled
  - reg 0x32 bits [5:4]: pre-emphasis at 20%

Board-specific:
  - reg 0x32 bits [3:0]: HS driver slope — HP TouchPad uses 5, HTC
    devices use 1. This clearly depends on board layout (trace length,
    connector loading, etc.).

So the platform-level writes should move unconditionally into the driver
behind a match-data flag for the MSM8x60-class compatible, and only the
HS driver slope value belongs in DT.

> Also please note that writing raw register values is generally frowned
> upon in the upstream. It's not easy to follow those and not nice to
> modify. Instead, if some the values are required for the particular
> device, please add corresponding values to the DT using the
> human-oriented values rather than the register values.

Agreed. The old platform-data msm_otg driver already did exactly this
with named fields (hsdrvslope, pemp_level, cdr_autoreset, se1_gating).

I can drop qcom,vendor-init-seq entirely and replace it with a named
property — something like qcom,hs-driver-slope — for the one value that
genuinely varies per board.

> If you have questions regarding any of the bitfields, please ask here,
> we can try finding the data for those.

One thing I haven't been able to nail down: every HTC MSM8660 board also
writes 0x0C (bits 2 and 3) to ULPI register 0x31 via phy_init_seq, but
the HP TouchPad webOS kernel never sets that register through its named
platform fields — and USB works fine on the TouchPad without it. Do you
know what those two bits in 0x31 control? If they are needed on CI 45nm
PHY silicon but not on the APQ8060 PHY variant, I should probably leave
them out of the driver and note why.

I don't have any technical documentation for the S3 SoC family, except 
for the legacy kernels (HP, Samsung, HTC) and a bunch of various HP 
TouchPad variants.

Let me know what you expect and I'll write up a v2.

Thanks,
Herman

