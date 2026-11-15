Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794712587;
	b=uRIz+5PVn9VcxYDWWW2FqVBJJuaEx4K6/3N8pWrjlcBA9x/NEx6oy/jR8ZPx2JpBVZSs
	 Yli6flOBbzo7PEEaNaalOHEY66pC8U1RUqwfInKYhQeB1SzERF1W2I8fedFo350p4OA5M
	 df5a8TNyuGL2RwUMUSylnwKdJokvs+120vV5NSFvmAzK3z0imnyVP3JveyY8LNoWOn/wp
	 Yu7oCHHK/QTAhb6mWKM/RmsxKjkpSuTthf6/WkF/6RUsOCtqWPzKQPPiP1ZzWgdrAVFLT
	 2FVqbae6bshssaa4RF+D5KlLkc1PoqOMQBYER/RYEi1MdDQGII91guwFfRbfca1dftg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794712587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CcJ012d98pXUSkoe1frivs9auTK2SIP4GqFrJm7lBB0=;
	b=5qmLJnAlqrg4D5/c+pV2MCUnFoZMtomHOnc40kQYcqG/5N6vPpmc0pVshPJxiK1m64zA
	 oV3wU0NuMxZxAiXbI7Lsj/y/SS44cnYGpAILcCPcduzvPWJOq0EtjbK1UMOd8j6i++i0I
	 iBeOClWjkrqaAn+5R+B0TP3uX8wI7sjMxA5+qJkukmGtxRozhNIeeDACYIhQjZh+hkWw+
	 BtpFAH1I8DWZUj5GOb4hp3pj8og2JFL83SV8h37zsvYQw93dQks6qPz9lwph3Eda0LwjL
	 IE4FJ+GoeSOGBOHmvouCg2BtaI94clA19+7ym2KzqmBAIJO1PhB0+NWmK7goazelNzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nDn0QXj2;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E706606A32C
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 03:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E706606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nDn0QXj2
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-537548b811aso15205861cf.3
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 19:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794712586; x=1795317386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcJ012d98pXUSkoe1frivs9auTK2SIP4GqFrJm7lBB0=;
        b=nDn0QXj28VQiPE4K98zv5Xh4Yjwm7t62UjfcLenYcqhOo5h0hOqiS5xRcIA+4og9N2
         RQnaKdJY7YvgPODxmsSwlcrY5e5hmYdGYAcDU3VLp8O2fanyyBW03GWvOAseg3YKVdur
         kJfGd1SrZPthJUpnDRewkGPwhaYIaPPNTbbS56apxaAVCCfxkUMWfqQHbKpJT8YqXfv5
         Mcyw0FRhIlWfUUIL+x+uCTrj/JwnpVeszdWxBl+iAw38yG/4doOmbb0ThJSXidy1DVyR
         TYVJLU/lLzVbaP8O7bmJVWScaD1ks1j524vQgyhJAKOpZjMA3R6pnDA3WPVQyVZEngmE
         gcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794712586; x=1795317386;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CcJ012d98pXUSkoe1frivs9auTK2SIP4GqFrJm7lBB0=;
        b=fzD2vWlU3X6vCgc+o/zw/VNhff/tSIrDXA6vmdXuCxXKu2wP0nlr2iKg6KRyuJabHH
         7mUsmSCsfP0cByqC3AEydHidreLtnOXctLWVFrxbaJhI62Df/T+ujfX9AyCUkw0Jv5wI
         6YncdWS2M/dN+nLNHEMbw2AggK2c9IjE35e08pAwQL5wvrabpp+JrBA5jKNnZ8cB3EpU
         N3D4mHseabAq2RTjUijPYl8qHHYe8epYLANaf2xCbbG+8cVUeoF6+AwpLG/8aPCToz34
         j5Kfo4zyk90m4AboUVPn20Q2TQxJyQq4uEE4/JjUvi0Kgu5cD4Ml2qu/E3zI7kwEpkND
         22Pg==
X-Forwarded-Encrypted: i=1; AL+hErGQ+2KBkaBsz5ios7IHCqPFxR8sSI8WlAPDGuAwuPvGQ8c64g7yNDE/MYRrJTXD6z8TTJByh+njWIVb@vger.kernel.org
X-Gm-Message-State: APuU4Z968lV/04/6rVjUD8abt5ZJOkRxsNKjUMswFhXR7wLNk2CBvEN6
	RKMx9Sw4rcI/lTKySRiEtnnfybVYbeAV/oYt1WlLs8f57poYXsrsTQMU
X-Gm-Gg: AYBFou39pwWt4qFleiC6nZfTUBv02UZWlsOdc4znqAff9m4pEY3l20i1cTU8HtbJUYX
	Z9Ry/Yh1aXMqavEfzlO0cU8b3HMEpsu0ruPEBZYtC+rA0tqm1XOyO71YXyerr7uPUVZC5dtuuZT
	4e3tmGNQEAixj5OW+uOuYxGrFGBqOljEfhoZqCjXW7RHhiWRRS0WJBQRZVID00z6LqCxSrdlopw
	fYoaqwQGADyzdL6crsdX5xS2dzfofleb1X0qeE44DcDVq8Y490md8z3+YbImomr3ZypQRnbDIjU
	McwEIfJJGYy9DT2Jq10OYDmQwYJPkmerGGDRxeVRHL8F7kF7bMsKyaWjKC4s0c42GSPF3TfPP2p
	NNJRh5w9Bs5mP+fqGcXPIGguS8vCcmd7TZHye98jpA9eCBlZ+yw8JabNqUeMt+ecRELJ7F2YWtQ
	8ZPeGWItWTHGiYRBH7wIMTXHxjaeMeGBJ0qPLM3/JEtsd4v4ypiRkjJ/xWWePRZlv6gwyu9N0SH
	aLsp27ADGoY/P9rL0u1GcrA9Oy/burWKOCIy9BntBrJAjMSZuBDiU26quaeGCfdAgB3URzQJmJa
	3mcWYYrtphSrTSz/nXovj2MqKOQDOHsPE57R7zOe9FzqeRl63mr5ydwGh70gApv9SsYDC9B4doA
	XPF/eKigb7+TQnlt0PjxeiZhtmVZV3sUuGHJtRk9XEwn6yOOvQAv3WA==
X-Received: by 2002:a05:622a:451:b0:55d:13c7:c232 with SMTP id d75a77b69052e-55d13c7c737mr38400571cf.51.1794712585934;
        Sat, 14 Nov 2026 19:16:25 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad1b13917sm52366751cf.29.2026.11.14.19.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 19:16:24 -0800 (PST)
Message-ID: <64e7afd3-50e5-4134-9bf6-92c4aa740bd7@gmail.com>
Date: Sat, 14 Nov 2026 22:16:23 -0500
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
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sc8180x: Add Microsoft Surface Pro
 X
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20261104070441.74127-1-val@packett.cool>
 <20261104070441.74127-3-val@packett.cool>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <20261104070441.74127-3-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 2:04 AM, Val Packett wrote:
> From: Maximilian Luz <luzmaximilian@gmail.com>
> 
> Introduce a device tree for the Surface Pro X tablet in all 3 variants
> (SQ1 with cellular, SQ1 Wi-Fi only, SQ2 with cellular).
[...]

I believe there is also a Wi-Fi only SQ2 variant. Looking at the WoA
drivers for 8180_CAS (Caspar, Wi-Fi only)
https://github.com/WOA-Project/Qualcomm-Reference-Drivers/tree/master/Surface/8180_CAS/200.0.31.0

This variant is the only that has both SurfaceSMF_SQ1.cab and 
SurfaceSMF_SQ2.cab. Only 8180_CAS MPSS INF maps the no-modem subsystem
ID (SUBSYS_MSNM8180 -> qcmpss8180_nm.mbn), the 8180_CAR (Carina) only
lists the cellular MSWW/MSJP/MSCN IDs.

My SQ2 Wi-Fi boots with the caspar dts in this patch fine but the
gold cluster is pinned at SQ1's top clocks because the 3.072 / 3.1488
GHz OPPs are only in carina.dts.

> diff --git a/arch/arm64/boot/dts/qcom/sc8180x-microsoft-carina.dts b/arch/arm64/boot/dts/qcom/sc8180x-microsoft-carina.dts
> new file mode 100644
> index 000000000000..5d155c69907a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc8180x-microsoft-carina.dts
> @@ -0,0 +1,50 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +
> +/dts-v1/;
> +
> +#include "sc8180x-microsoft-surface-pro-x.dtsi"
> +
> +/ {
> +	model = "Microsoft Surface Pro X (SQ2)";
> +	compatible = "microsoft,carina", "qcom,sc8180x";
> +};
> +
> +&cpu4_opp_table {
> +	opp-3072000000 {
> +		opp-hz = /bits/ 64 <3072000000>;
> +		opp-peak-kBps = <8368000 51609600>;
> +	};
> +
> +	opp-3148800000 {
> +		opp-hz = /bits/ 64 <3148800000>;
> +		opp-peak-kBps = <8368000 51609600>;
> +	};
> +};
> +
[...]

Would it make sense to move opp-3072000000 and opp-3148800000 into the
shared sc8180x-microsoft-surface-pro-x.dtsi? qcom-cpufreq-hw disables
all DT OPPs first and only re-enables freqs present in the hardware LUT
so this would work for SQ1 and caspar.dtb will cover both the SQ1 and
SQ2 Wi-Fi models out of the box and carina.dts won't need its own
&cpu4_opp_table override.
> diff --git a/arch/arm64/boot/dts/qcom/sc8180x-microsoft-surface-pro-x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x-microsoft-surface-pro-x.dtsi
> new file mode 100644
> index 000000000000..17fb01c6b164
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc8180x-microsoft-surface-pro-x.dtsi
[...]
> +&smb2351_2 {
> +	status = "disabled";
> +};
> +
> +&smb2351_a {
> +	status = "disabled";
> +};

Confirmed on hardware that labeling pmic@2 and pmic@a in
sc8180x-pmics.dtsi fixes the dtc build failure here.

[...]> +&uart13 {
> +	pinctrl-0 = <&uart13_state>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
[...]

On linux-surface, ad1bb617a15a from Maximilian Luz had

&qupv3_id_2 {
  status = "okay";
};

Would it be helpful to add here? I confirmed on hardware that adding it
allows uart13 (WCN3998 Bluetooth) and uart15 (SAM EC) to populate and
probe properly.

Thanks,
Haipeng

