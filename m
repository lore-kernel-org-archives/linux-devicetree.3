Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575363;
	b=T7It9xpGmtBhuFEH1Wly9AQohYvYXOOSM4geyhuG1bsPaIkKpFlQrsA/qIsdI/4iokaB
	 fzSp/9VNE1ypVgZaAebWEH5mG9GIu/cJ7TLnTJlqCjW1Bj7h3mLWFRDJI1PQeIoOc23pa
	 vSSc6liVsgiw6LS4vmo7IlamwPdYmlbrhe+x4dG8AhRvmX5G2WzfDGu0TbdEhTN8QW23P
	 a4EDmxvN1RT/kU/X7tkYzF28290gFX7BFnuk6EkLB+Whw4m+W2sYO7FQ0sZN0VXvrzC4f
	 HR2Xf8rIMsVQfzEBErgVxtlHLDb5GFOlQkpFRiccMLT/ESIZ3ReACyHiApj/W2GtCVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575363;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=TgkZPDfiJjMh2J8e/Fv34yjDTX8rPL0Qo9+0DabzE0k=;
	b=q9z4ZPAHn0m6tzURjhKn86ZaHJYlJU0sOqCjMOftc1NutNuro9AmJsVeovdgVU1RvE7V
	 d7bFrIzHfceDXVWkrxD4xnqeAYfgQ3Zzjdcp0aHQ3QGnqltKMaYKavS8ZD86CUV4scdlV
	 e7kTNRgA1n6t5Lak3SbvIw1m/pkcW8XIps3jAB7VMGxfXaQ15dRgEt6J7l5LBV5UyQixy
	 n95dpABxNXrcJXw8xEntkC4Ue4Sv7s8NXi2QtAP9Ku3dIWn3pygyVUnvgBr3Q17A+R6T5
	 a+ATsRhEjcQmvPFNa1HH+BEd1CEEmt8a8FqMXkyc2d+FFgt17V/Ojg6ZTWOgvxiF+iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=HuNaqE54;
	arc=none smtp.remote-ip=95.215.58.108
Received: from mta1.migadu.com (out-108.mta1.migadu.com [95.215.58.108])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48A0606A323
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E48A0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=HuNaqE54
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=n6h5sbKyK6McEKrI8Ar5CJ+toQhqjA8M6q8V8BhhvW4=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794575359; v=1; x=1795180159;
 b=HuNaqE54ZRYhvPAYVpjYMnncTEQ2iTsM5i3g1H6NY+tyS2xsNvsUVthVPPm3forEtTrK6JtH
 OFefn/bQ3R03qf6m7ObdS3QAVOeRQi/mGAPO86cCzy1y41nDTnE+uvfUGUiLFF2yZzwOkc8ZA5W
 /9pWl6PxZYADHEY3MBVZwhho5yxhaEThT02U6jFbq5YWZfgkE9PEqV1009rzXwbIjsR8UDOzv5t
 jJwcjst6SuTtSn7gllKPUE5sofSp8B3j8AI7h+H+1K+n4BS2DRu7/sLOD2rw3QBYyGK0kCT+Qp1
 c0lisplD/4+zGu3wfkjCYJ4arCmPgbxTvPN8b9QPFVJvw==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c0668823f57e9852;
	Fri, 13 Nov 2026 13:09:19 +0000
X-Mizu-Trace-ID: c0668823f57e9852
X-Migadu-Flow: FLOW_OUT
Message-ID: <e2f89f72-be30-495d-99c8-828cd170ce50@packett.cool>
Date: Fri, 13 Nov 2026 10:09:13 -0300
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
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Wire up
 PM6150L LCDB
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
 <20261113-lcdb-enablement-v1-4-1dc40b49ed82@fairphone.com>
 <DMU3O9G3L6PD.2CE9WCHR9LV0J@fairphone.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <DMU3O9G3L6PD.2CE9WCHR9LV0J@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/13/26 9:59 AM, Luca Weiss wrote:
> On Fri Nov 13, 2026 at 9:16 AM CET, Luca Weiss wrote:
>> Since Linux has gained LCDB support now, wire up the LCDB regulators so
>> we can turn them off and on as desired.
> Actually after some more testing with extra patches, it seems that on
> FP4 the touchscreen stays dead after toggling the lcdb regulator, while
> on FP3 it works perfectly fine.
>
> So please ignore this specific patch for now, I will figure out what the
> problem is and re-submit. All the other patches in the series are still
> good to go in!

Your touchscreen needs to be a drm panel follower and/or reference the 
same supplies as well :) Most modern touch controllers are part of the 
same physical DDIC as the actual display side

