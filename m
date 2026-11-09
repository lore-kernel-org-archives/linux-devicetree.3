Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243864;
	b=UFmLwhVSH7WuA7JRKpZekzUnJLDkMlffAefhyxukDA6FbQ7wY9vC99i4QiAHIIXxVjeN
	 v3nUBQ1wyfIyogbQvjzDu+pDgHAqbm2Q7Eb8nBRXoFethfvgyfOsTfdSfuPxz0OBaIr5Y
	 mo03XYrn+KnmCpaSXORcY96D33qI5kJWd7zOfCrLtldrm0Ku/BliAph8hTpO84yjfX0pJ
	 uDHoIwy2ypbYlcU9VKNk3wl8SqzernswgzN5YzUZgMJI6CmcGMWtOYUB77bf2JZqxR+Bf
	 GX08fO8LeIWJxPMrriH76JZu/mwdprUDfEsBcd4cqAHe1BWYNE8gRzt4py9OJFaD61A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VmhgsZdfI41q6bSk6Ws0aoyQukpnInOpVRPvZF0DgoY=;
	b=4fNd90DbDpqIavTINccEzWhhRYBeLRn5exRR7PeYybDFZWpWGP7Qi1425tlrUIdLxrLv
	 7vWfaKOKVdDtQkuzMKOl1KdERWHyRjI0l18b1XbSlRGpRFM4DgEwaEaIqWis1iee1ze7j
	 Wfpb83PhlRLmpESE2ZxTzqR73LeE1I4SED2D6SUgdQuFdrq9gwl2PVtVK0HZRHr4lxuET
	 /vVlMYcbWVFu7GHM9ziH3LCgu4IzwEiVnEwOEXsNa35BlfudVv62+TG7NugarEw4ivT6/
	 FMpj4DPCHhXT+njMywcCXZ3wZ6rjKImHR7aKvb1LhOi0j94mfsHlyyuswB+7me0UaKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INMhwymN;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A02606A32A
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 17:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41A02606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INMhwymN
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b5669a5100so1497975a12.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 09:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243863; x=1794848663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmhgsZdfI41q6bSk6Ws0aoyQukpnInOpVRPvZF0DgoY=;
        b=INMhwymNUoXRa1HYjajYs2VDNOXoDzVIp/an3nVGMwTgqTKKIXcrYlToz3KguYeb2w
         0JSHPrAS4tp1u64diFxx98ot8r0Zd994Q5w09w9Wo7hRC/DtQLXBMMh5MnMbGm5sg/9+
         bfSbd1NNz976A12xlmIC5rBcyt2zgrNxYngASmeZZcCyhLh9b9uOIuPyOYnguxqTaeNR
         9hUslwRJlODcmrjO84K/MqZr6AW6G7obz3aQhSgpfQbvfDlBiGQqmaSqVNfiSLuoobIb
         SEhjw+R7G4bUMif5HGg+3AGlsX3R7zQQDPntqdP45khUAZLh8+Utt3l4+Gfo8W0GMqsn
         XheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243863; x=1794848663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VmhgsZdfI41q6bSk6Ws0aoyQukpnInOpVRPvZF0DgoY=;
        b=dKvTyKKvJOdf8DTPWtwHdxS7CbmJ7YYaftOQ0L5FSs7/AAz8DQ8V7fX06oWMoqbejB
         HFsqg9LkPD3JKRaJhCKCIwtJoWT/wChqx3N2aWOi7Lc2qZQT9XBkXsSxnuFRpklehSxF
         y56SmymGICcHRMCqAYqbLvQPolBfJwhQp+X1tJKPkcHdtFvpyyaPW/ksVmcptkYCCQ9a
         DL0UForveVCA/6C3o0l/dWj5a6b0b8tIz/VJK4WZ/HcCyi1xD5Auid3V45QzdUKz+hk7
         P5jIN1aY9bk8lmxSFFqrvu4RnyAAo/bkMJodHGceSXRS37bvkl19TkROnsCzsr18LufJ
         Cp0g==
X-Forwarded-Encrypted: i=1; AL+hErGVVHrB6L75ltMMrCAERvPYF9GLMg8Gljtj5j8pWS8tsEvR0AdG6DtsFf+1VllOsz4o+etHELl+mZPe@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ck22/ExFsz+2NYQezbf1hjTICuzD9gQ7p3rPFi4jS7vOUK4uR
	dXp6PStfx8PFL/cbfx6orAQCaw+Xeo54huOEToQTAiQgvJhuYij7/C9d
X-Gm-Gg: AYBFou0RlSqiBr7brWj1WJxz4w7IywHC71Lk57+C+mwtp0qVW9I+AvWGp/vUoYpVqeZ
	5khW6JoK3jTRmKxkuzTg6x6tHRVOiLiceesE9jY1GaE61eTSe9xVnLzV+nQfaSnDZ4hG7dZ5kDr
	0aBREEvDC8P8XTM+6TNu2rCp3eQ4UYmEUtQ7m1h8SiNCJ0md/oCV4dcYoDVSWek2yhCOWP4lMXs
	gXl3GmjR15PQFGXvrlJX8W1kzMYCmvDR1ZyDn2KbwfsKpNu8TyOYsH+LoSZ4igrojx3Ealnr50o
	8Za4XNaB4KHeEUMMAA8UvKeChK90uCW1uQH6eqqmJluB0ps6IU0cU6cW/ta8eOh1+XeZhmzTCMj
	WelsUFZ8y0vwGsLVCBBIZutl/bD80qwFCb0wNVIKTIk0tS1yBz2ocC+1giAIyF1t7vaciuc+t1R
	dRQYrKU2N8WU7Pn6fifVrAxVl81AbfevYv8Uh0elxVBzeHQhaO63W4qXy4JfOlyYd/WWGlsTbmJ
	VojpfjJ16knMWeH55KijuxpCO7P5Tpzr2rKyqx4+bBKADQx5COFlsNIh9ZyeT+/axg09ZyNu1RW
	anKn1T+9ilwngNecadc5JOF9rLc=
X-Received: by 2002:a05:6402:2356:b0:6b5:7792:d82c with SMTP id 4fb4d7f45d1cf-6b756ad7482mr185305a12.16.1794243862514;
        Mon, 09 Nov 2026 09:04:22 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ebe31csm1878937a12.16.2026.11.09.09.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:04:21 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Lee Jones <lee@kernel.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Georgi Djakov <djakov@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 17/17] arm64: dts: qcom: Add Samsung Galaxy XR
Date: Mon,  9 Nov 2026 17:04:07 +0000
Message-ID: <20261109170407.2073295-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com> <20261109-halliday-dts-v1-17-289114ab8197@gmail.com> <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 09/11/2026 16:12, Konrad Dybcio wrote:
> On 11/9/26 1:33 AM, Stanislav Aleksandrov wrote:
>> +&usb_1 {
>> +	dr_mode = "peripheral";
>> +	maximum-speed = "high-speed";
>> +	qcom,select-utmi-as-pipe-clk;
>
> Is there no superspeed / dp altmode in hardware?

The headset supports USB SuperSpeed and DisplayPort via its USB Type-C
port, I just haven't brought them up yet. It seems we need a new driver
for the Type-C controller.

Stanislav
