Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551814;
	b=ppnv0PkpOrWkoywD64vFAOmE2qMpWWPl16ZMugejgCyevxNeMna7QAFACQexuihvR66a
	 /sr5XkkOEpx7vnf2mbfTbjbU/lySg8ft0ZaRpDMRspZezIrP+eVmS/HBPScmZ9T/+mD+t
	 y2QNlfTEikYNx9JQ8P9WWp98zQEoHPfH1tUKbVMZiBZWgcoQxkbHUuDTb+V9Y3hcSRhrQ
	 JjL9oMlBrbycHEC7x3smWB5WNzuozUeDOs2zZBMIWiQn05JUj2Sz82wnwyyDhUjGI2+Yn
	 nXE24shdIlGWQYH/GOYymZN1naHlSzCydDTzcURIdbiss1IpYA4X4mnWvOpwHF1HdlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mZZe4bKEcD5TSYKYkVMyAQ6dVStKsxhjunUD6f+PU+0=;
	b=yuOeAB4vmn3U/s9xbO2+cWmh3wSMGVy/vHJgHdR2ERcKoNofuvZns9V4tsVdBr2KKUQU
	 D71D7ZSOsrFbw8cCa+Q12qHNVYVAY4PdHpeAXMGZclnXqzhtTDl7HW0yB38LZyyhhL2w3
	 jKox28NWfMqdlgLKJe28lSlFqaNjjgwz6AO/LN2FK4AxOCBW7I4BRtm4XQ/01L1ctWzfu
	 dFDimxH+z6BG+MVq19zhFl5jkcBCAq8ObNKjdIAJ7YkpNjJewF0qKHzYDQe0RUYjnEf0c
	 N9FA6M3jklaj3QlNVXbBhGrkiDdvQRxeN4OnT0Un85JitWaJqlvmQ9ebqDbXRxNNvqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0jq2OaOv;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24161606A324
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 16:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24161606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0jq2OaOv
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3964284eec.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 08:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793551813; x=1794156613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZZe4bKEcD5TSYKYkVMyAQ6dVStKsxhjunUD6f+PU+0=;
        b=0jq2OaOv/VB8alV10OIyFhzRgwYGwdbak1sNcvg1B4TViZnUcpBAp2z38SSNRYDRFm
         iWL4NL6qgRA55EC9Nok9ZP8gNMVq53QnCspXz1P64Zkgy+AWhvqcouMzwsduyTkZ5012
         f4nQrmaIrmukypuridQE1Rqc2bQO2XtKr1wXs4gKemRM6oXqppdY9DKk6ZwU1tpgVLRs
         Yht0Pcfho/JnMuEIPOp4Ns3v2a6FQiGqn6Zq8Z9d2cYZdwoU6NVPn///Vpb2mGCsXGpG
         nHarEKEXX6wypiLqRLeopMvysMA2SEdZjNx/LDGITkRP6YXHoQfCv2vaKmKvnjsp/MVq
         5idw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551813; x=1794156613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mZZe4bKEcD5TSYKYkVMyAQ6dVStKsxhjunUD6f+PU+0=;
        b=oNC2flfimui78Y3AfHwzAy7iAAlq373qzQap9/XeQASZUo6rB5eB0QkXyQsqkdsBaP
         /YTNPMohtsJpTBQiwH6gLXVPiKMjce2B5KDW7233YRTad+jS1oEwA4Csdt/Sfx5XtWjh
         Lso4vs/eEA7L1aEsVwK2jqfOaVH6IR0vaz8aZi7fT8MxE41+qY+Fmvv8bbVRiKaslXO8
         PSt41lYiUgvs3LBDvmvX+nujeNm5ixmXRdgwQ4mZbrkZF+pxV/byKoRAGq5FkteBI1CQ
         68L/NyrMThbiUy9tdvnygQ/leY9tInYPBQKnO2+9ptCHmCwzppE90G8Tq4XPDx8ty8bN
         1XUg==
X-Forwarded-Encrypted: i=1; AKwUvBzDSkNxWCwPV8/F5aPZCqBjn8nu2S5Gg57ZVOPiB93gEhXWQDmnzKfoMdP+OLLv1fKxnAwIBO25Mprb@vger.kernel.org
X-Gm-Message-State: APuU4Z/5b9yarnqyO80sUUSdLr4DkwiU90V6iI7uwZ18ZQak6iN1ksOY
	mF0/7Ap/vdd5BuW06Hwp1MK6oE51Ic3fvFsGKqR1uDwYBbfoSysRbTii
X-Gm-Gg: AYBFou0IbbxHvhdfSpVhLTmpvrIhHs6IFzZthttztgxnaajh9WLvItWvptB/KaKNFAb
	dusXn/fyTaXOPA2XBRVDa7cULE1CJ0gFxeGy2k4Dn4ekXXTTASt466xLH1TJE5+gZxAtXJ1EzJh
	7hAx5Eyi63TMPO5Bo/US7BPEWeEoduLUJBFLkStwWIfPapJGMaD06xlDbCDStjLYlXNzJSeftNv
	uXVgGn5+4+XaZO27aozyY7sPiW6ppPphemDz2elZdixkkdSSkjlUS5fj72seJwI7dat+VGtpn/e
	gWkd4eySKBFldbp1cz+kVOeMnhJe1fDIIVC7aF6Si596bnu1gi632DdtxdZqigdIuq5rb0DN5yA
	fd6n9TZMdM/H7fZUO5nSerDYFFWtwqDLQbtxn0hr1PUnExtdMsdn6WRP/zZLD4fbOYcrYE3OOhN
	9ZWyzUcb7KvynSJCyA5xhDpGqZ3SFhSYQdyRn80PKHBr5qj5s2lF3s0HOsnu7Tx9yuD+dhA4q7X
	5WsA0p0Ba7NjA6+urdFWzWjhtbRNHNBU1nZdAd+sBOwmAsCi8vLx+t2PUUPM08NryHRMRpUIi+D
	e70LonjvYCsF3hX02Xm771U0fihjA+CxtQNCIeDDWWVZ0XC0au+LyQG0B1lBHbRj+aTn
X-Received: by 2002:a05:693c:87cd:20b0:36a:32de:a239 with SMTP id 5a478bee46e88-36a420643f1mr11900427eec.0.1793551813029;
        Sun, 01 Nov 2026 08:50:13 -0800 (PST)
Received: from localhost.localdomain ([121.101.131.247])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm39444940eec.16.2026.11.01.08.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:50:12 -0800 (PST)
From: Amir Hanip <killdeath104@gmail.com>
To: barnabas.czeman@mainlining.org
Cc: abelvesa@kernel.org,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	killdeath104@gmail.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	a39skl@gmail.com
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Xiaomi Poco M3
Date: Sun,  1 Nov 2026 23:49:30 +0700
Message-ID: <20261101164930.17976-1-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <239d46726c0aad84feccc3def4eafab2@mainlining.org>
References: <239d46726c0aad84feccc3def4eafab2@mainlining.org>
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

On Fri, 30 Oct 2026 13:30:28 +0100, Barnabas Czeman wrote:
> Poco M3 (citrus) is same HW like Redmi 9T (lime) and Remi 9T NFC
> (lemon) basically is a lime with NFC.
> So i think it would be better make a common base from lemon's
> devicetree instead of making the same devicetree again for the
> different variants where only the compatible and the model property
> will be the difference.
> Check sm6115-xiaomi-gingkgo-common for example, it was the same case
> for Redmi Note 8 (ginkgo) and 8T (willow).

Hi Barnabas, Adam,

Thanks for the review, that makes sense. I am preparing a v3 that
moves the shared parts of lemon into sm6115-xiaomi-lime-common.dtsi
and has both lemon and citrus include it. I used the name lime-common
following your naming. Happy to rename it.

Plan for v3:
1. dt-bindings (unchanged)
2. lemon: move the shared nodes into the common dtsi, no functional
   change intended
3. citrus on top of the common dtsi

I can only test citrus. I do not own a Redmi 9T, so lemon is untested
on hardware. Instead, I compared the lemon DTS before and after the
split, normalized with dtc (dtc -I dts -O dts -s). The only
difference is the numbering of two auto-generated phandles. I will
describe the check in the cover letter. Adam,
would you be able to test lemon once v3 is posted, or look at the
split beforehand?

The IPA carve-outs (pil_ipa_fw_mem and pil_ipa_gsi_mem) are identical
on both, so they now live in the common dtsi.

I kept the following per variant because I cannot tell whether they
are real hardware differences or just differences between the stock
firmware images:

- ADSP carve-out: 0x53800000/0x2200000 on citrus, 0x53400000/0x2600000
  on lemon. Both regions end at 0x55a00000, so only the start and
  size differ. I can only confirm that the citrus value works on my
  device.
- GPU carve-out: 0x55a15000 on citrus (right after pil_ipa_gsi_mem,
  like the SoC dtsi defaults), 0xfa400000 on lemon. The citrus value
  works: the GPU runs with a full DT that includes the display
  pipeline, which is not part of this series. I cannot verify
  lemon's value. Adam, is 0xfa400000 intentional?
- PM6125 regulators: seven have different voltage ranges (s7, l5,
  l7, l11, l17, l18, l22). l24 has the same range, but only citrus
  sets regulator-allow-set-load. lemon also marks l5, l7 and l22 as
  always-on, citrus does not.
- citrus deletes cdsp_sec_mem and the orientation-switch property of
  usb_qmpphy, lemon does not.

Barnabas, Adam: do you know whether these differences are real, or
whether they only come from the firmware of each model?

Thanks,
Amir
