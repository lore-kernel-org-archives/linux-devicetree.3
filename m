Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199416;
	b=LWVAogIM4JKXWRDZAwtkiQydxeUpGHHMd0AsR44LHdWAjGGo7qFsgcu1M5LKHGY5tTtQ
	 hALM5H0NYvrvqdpdAcLMN4g8OKP4g3Gci+l9KN+lJqALkapK+sXJCeRbuSeaJHEL6a7gu
	 ROgHyQ1irQa05v2/0+fnI2gdDu4wb93WeNXa8IgINk+ZaNR7gaw0ahrdoYNR34FNt6/y1
	 9b+/DCjFeqka8PtLxEd7y5R0MSUDfKGnWntF8p0Qovs8cVb2n/O2oH7n6mbJeP8stLArm
	 jt1by/527B1+7e70TmGUM0Qc+JhMqc4kUCMYDv15Cv1laju4YQf89GMMtnBVQBN5WAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199416;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=F7boTTUOUIPt+1we1rY2+5xkr9Y/R4tCTMv/ZzlovJc=;
	b=BShC1Qha6EnBQsFU+++QAvA8vHSnQmbrxV5Vs9exb6JIeCdZtc1fI0Gz++xwaFCHNMgR
	 IYqoCQ8Ti7DKiN6qAkSSHCTpnTKwyRCb21CsakYAHwe06uBmokh0Sp0qHEPIpFdqTnBeb
	 2DNTp3qjZfjRbegl5pvrk1vAAii+M0CzW5OF9da2EzQ4C47YVvUGNRqVi4TqSE+YgRhaY
	 lH6SSYhvIu6HvscCrrdDtJqNpEPKYD+4eD3RQYgtPCt9j7lQ8okPgc0XLy4812Jgi0cdy
	 YYUWzHCmNERNDJlClmk3C/VvGFA7kApF93baNFvV5RiVnkMXPh0C0wx7makmIZ4at6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ASSC1kCK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A54606A324;
	Wed, 28 Oct 2026 14:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ASSC1kCK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA72F1F031E4;
	Wed, 28 Oct 2026 14:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793199415;
	bh=F7boTTUOUIPt+1we1rY2+5xkr9Y/R4tCTMv/ZzlovJc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ASSC1kCK23aEi5cQdP9zLIFHwlOVpSVfqVCZCjJrl0CQgE0+bsRSpLQ7CcH8l428j
	 dZcelsEzcj0x/I09wMUUVdLDW1ismeo2j3D09oNo3rKpB46DOK51FFwK8pPNjTrPD6
	 rBWyDEO51PIGqEWHLbI7VJPRKJ6r+FSWA2KhpbWz4OCvseGw+MCCf74RqgPmvkMlsi
	 99FcWsfPvvKoNxL5vozdVcT8/BIeGRnPGczwIpd6jIYRPC0ZdGrbVrbxY+4da4H2nc
	 jy91TdMKnYpZbiqGppIQjt4IkjzcLs85MCRYfWZ5VNyW20idYeNt0gma0evv+dCFSW
	 Sem7bo/HXD1Jg==
Message-ID: <07c2c10c-f442-480d-b545-666069c06e91@kernel.org>
Date: Wed, 28 Oct 2026 16:56:49 +0200
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
Subject: Re: [PATCH 1/8] dt-bindings: display: panel: novatek,nt36672e:
 Document the reset GPIO polarity
To: Krzysztof Kozlowski <krzk@kernel.org>, Vladimir Zapolskiy <vz@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Ritesh Kumar <quic_riteshk@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-msm@vger.kernel.org
References: <20261028095151.1682096-1-vz@kernel.org>
 <20261028095151.1682096-2-vz@kernel.org>
 <20261028-seagull-of-illegal-prestige-6cbbfa@quoll>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <20261028-seagull-of-illegal-prestige-6cbbfa@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 15:56, Krzysztof Kozlowski wrote:
> On Wed, Oct 28, 2026 at 11:51:44AM +0200, Vladimir Zapolskiy wrote:
>> The reset GPIO of NT36672E panels has been described as active high since
>> the binding was added, also see the example and the QCM6490 IDP board
>> device tree, however actually it serves as the active low signal, also
>> panel-common.yaml expects active low reset GPIOs to be described as such.
>>
>> Document the active high description of the reset GPIO explicitly as
>> the exceptional deviation from the actual signal polarity, any new devices
>> will use it in the same way as the existing ones.
>>
>> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
>> ---
>>   .../bindings/display/panel/novatek,nt36672e.yaml         | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
>> index dc4672f3d01d..45743376995b 100644
>> --- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
>> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
>> @@ -24,7 +24,14 @@ properties:
>>     avdd-supply: true
>>     avee-supply: true
>>     port: true
>> -  reset-gpios: true
>> +  reset-gpios:
>> +    maxItems: 1
>> +    description:
>> +      GPIO connected to the reset pin of the panel. The GPIO must be described
>> +      as active high (GPIO_ACTIVE_HIGH), the asserted state releases the panel
> 
> I disagree that it has to be active high, because, since we do not
> represent pin inverters in DT, it depends on board layout. Wording would
> need to be correct if this stays.
> 

I'm all for a better wording.

The described display panel device operates (here resets) according to
the active low signal RESET_N, the device driver is written to interpret
the signal as active high. A signal inverter may be present on a board, but
then the description of this board feature would belong to the board dts,
e.g. in a form of a simple comment around the property.

>> +      from reset. Note that the RESET_N pin is in fact an active low signal,
>> +      the inverted description is kept for compatibility with existing device
>> +      trees, while it deviates from the convention of panel-common.yaml.
> 
> We might fix it at some point, so not sure if it is worth documenting in
> the binding. And what about usage of this binding in other projects
> which implement it correctly?
> 

In the upstream there is only one user qcm6490-idp.dts, and changing
the polarity will be an ABI breaking change, unfortunately.

Here it's a similar story to another one about OV9282 reset-gpios polarity,
it ended up in keeping the polarity of the signal to avoid ABI breakage:

   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso#n45

Probably the best way to operate here is to give a clear 'reset-gpios'
property description in the OV9282 sensor or this NT36672E panel dt docs.

-- 
Best wishes,
Vladimir
