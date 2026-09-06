Received: from mta1.migadu.com (out-47.mta1.migadu.com [95.215.58.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B517637FF75
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 18:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788718405; cv=none; b=IMBH4VRE0tMFSI5tFmmSE25Uhg9BYbHcxPrEUzvRzQPl0Hx4bAZb4fpQj8zSQhVR4+XGiLzHg1iNhffeSdfEFRioWeOrYVjcS8OAJwyeKy96FrPlFIzlEuGL+7TsLrNZuA9ogRsIY/fHAZX/UPzmg/q8aUYHqQVnH8bI27NEY24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788718405; c=relaxed/simple;
	bh=jkWKcMGX9RoIQ4Xk96n1ewh+X7AwVxVhAZWhTZhY0EM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UA5TIEQt3Le6HdnpW0q9u9E8qHF4oMNUWGfYdbjK9ig2m/u/KGvsSoTYUP+uSCsdRy4eM9gfLMjCz0lFwGaYYe82bbSsZ226CQK+RztN1FoZrBSBLPghty540L9+ZeA+MkTJfs7ueSJPEE04CuoJKAQOju+usUJAR7sHOtlSgd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=IwzAafjH; arc=none smtp.client-ip=95.215.58.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="IwzAafjH"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jkWKcMGX9RoIQ4Xk96n1ewh+X7AwVxVhAZWhTZhY0EM=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788718400; v=1; x=1789323200;
 b=IwzAafjHTz6YxSdaeHHTCwMQCzAp6LVpoc/eQsWNKPK4dUjaZOcebEmv34Tt8D1zm/DQcs/1
 rR4dY425E+5vA3p4PZe+B+6xTrYpikePIc0M8plX3o3J8RjL8gdlOvrq2k+5qGe7vkF38oJY3le
 9U6BRFMM1ACbD+duulSK9RUInD4lIL7VWOMtqfdpgKn3Zh3gSykQWVzTXAxfhhKhx2sEcllWUU6
 ecMh4Ai1gGe+GX0+lZNpyEJX3W0NPbzV3Bna5brRUpcURd6PGvItUHMAVNVK8G9tJVgor4dgDFv
 Q7rEmhn1pth3JevMom0iaUPowiQRV20viLDCoGgfwi18g==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e62d033d317547c0;
	Sun, 06 Sep 2026 18:13:13 +0000
X-Mizu-Trace-ID: e62d033d317547c0
X-Migadu-Flow: FLOW_OUT
Message-ID: <91e06588-94ab-49c4-a131-347caecba3b0@postmarketos.org>
Date: Sun, 6 Sep 2026 11:13:06 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-lg: Enable NFC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260902-sdm845-lg-judy-nfc-v1-1-282173900569@postmarketos.org>
 <0e5368aa-0b75-40a6-a023-af2eb4589249@oss.qualcomm.com>
Content-Language: en-US
From: Paul Sajna <sajattack@postmarketos.org>
Autocrypt: addr=sajattack@postmarketos.org; keydata=
 xjMEaVNevhYJKwYBBAHaRw8BAQdAjvGGprvrSn/CmlA1Bpjc4S5zJBNSz/6q0AESlS2JbdjN
 J1BhdWwgU2FqbmEgPHNhamF0dGFja0Bwb3N0bWFya2V0b3Mub3JnPsKZBBMWCgBBFiEEv1E8
 AP7J5F2dJQd4hycszAKyDbsFAmmt6twCGwMFCQlmAYAFCwkIBwICIgIGFQoJCAsCBBYCAwEC
 HgcCF4AACgkQhycszAKyDbv25QD9EdvXYqdH6vGQvB5HrUnMOsd37AZkKKgK87kMOXL/5tcA
 /jM3VLcq9mol+GstmBm1itIVAblXcm+H8g/wKoPXq/4LzjgEaVNevhIKKwYBBAGXVQEFAQEH
 QEgCn8S+S7t/3QvXt4dK4572qd+iTl7h4JX1FEV5XUs6AwEIB8J+BBgWCgAmFiEEv1E8AP7J
 5F2dJQd4hycszAKyDbsFAmlTXr4CGwwFCQlmAYAACgkQhycszAKyDbueJAD+IMjk8ztbONXz
 H7fieZc5LoR+6mHnddccacmQyPcGAvsA/0+5SkHEgIBuKwkzwrmKgDqcLhVuEs2f1H2GxKUX jqQI
In-Reply-To: <0e5368aa-0b75-40a6-a023-af2eb4589249@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-09-03 1:10 a.m., Konrad Dybcio wrote:
> On 9/3/26 4:03 AM, Paul Sajna wrote:
>> Add the i2c and tlmm nodes to support the NXP PN547 NFC chip
>>
>> Downstream dtsi for reference:
>> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-judyln_lao_com/sdm845-judyln_lao_com-nfc.dtsi
>>
>> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
>> ---
> 
> [...]
> 
>> +	nfc_default: nfc-default-state {
>> +		pins = "gpio12", "gpio62", "gpio63";
>> +		function = "gpio";
>> +		drive-strength = <6>;
>> +		bias-pull-up;
> 
> active-high pins and pull-ups don't really go well together, please
> verify that
> 
> Konrad

Downstream decompile sez

nfc {

				nfc_int_active {
					phandle = <0x46a>;

					config {
						pins = "gpio63";
						drive-strength = <0x02>;
						bias-pull-up;
					};

					mux {
						pins = "gpio63";
						function = "gpio";
					};
				};

				nfc_enable_suspend {
					phandle = <0x46d>;

					config {
						pins = "gpio12", "gpio62", "gpio116";
						bias-disable;
						drive-strength = <0x02>;
					};

					mux {
						pins = "gpio12", "gpio62", "gpio116";
						function = "gpio";
					};
				};

				nfc_enable_active {
					phandle = <0x46c>;

					config {
						pins = "gpio12", "gpio62", "gpio116";
						drive-strength = <0x02>;
						bias-pull-up;
					};

					mux {
						pins = "gpio12", "gpio62", "gpio116";
						function = "gpio";
					};
				};

				nfc_int_suspend {
					phandle = <0x46b>;

					config {
						pins = "gpio63";
						drive-strength = <0x02>;
						bias-pull-up;
					};

					mux {
						pins = "gpio63";
						function = "gpio";
					};
				};
			};



-- 
Hal: They're going for the kernel!
Margo: Colonel Who?
