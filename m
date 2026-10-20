Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792512944;
	b=TDGWceKhImwdWnh8qGp4EBOreb+bDbs/PlN3iaBTmPV68z2wQydVAvJ8jz86xg3K8mmy
	 niqJC3kd9quK36g2CGAlNYYHkERivYYRJyxHrpDzIhbQ0RGb7+a/DQ6GhUE5pyvI3CNTW
	 YuSFisAuZbTS3/iosoNpP4XJzd0QIDou14bYsMe0TsfAOEiVCSvCkIAiHDttLhX5MEk2C
	 6WAp/mvflVAb4sv5TGakxqi6bN4tgad9F3F5w/wDygD/xw1UFCLtXPyqDMstqdVqekAii
	 22pPtFwz432HmOXyq307hv7NYRfh4AOhL5JnMpoxOe79yDvpn8B5k6wyv5NvyY34GIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WQHzKVqYaZwJZUC5Pb2xzxfXVpRRuYjJWgJcr6l3L5Y=;
	b=aoepE18OcK+54cME4XR+xCGfp49mFbFysEJTTxtgy2DNxvFKvuUwp+2ak9BCscVKW4xf
	 LkS6A9103DtBNfYh5CLV6aBqQzcJLlHc4FAZaitCb1WcMR9VVjfeMq6FnCTA7FRjkP2KV
	 TepOHL2ZRK4j9KVTw2va3mdfDnTu6Gx4O9Z9TBWcrDjvkTFDoXqx9SeUry2lF4GrksGNx
	 GCjasqe/RJVyEyGfDdE4yKiNb9dRldDrFJHB/zgEf88qXsOgwhEnBVZofQ/enXWnYwXeL
	 dhLw7XmDOmQc/ZkX/ejXLAwLd3n6d4Koh31Sh8P62ydX/gddyRz+yUF1DRRItANwUaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aPwbeMPz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4F7606A31D
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 16:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E4F7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aPwbeMPz
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ba3ec92031so3724891e87.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792512943; cv=none;
        d=google.com; s=arc-20260327;
        b=WDFoD7tTBoTXK6qq2Ugg3pkJLmseVHkoPahzQ1/IGhfuWKoiEWrwRowfp3GntkpY6b
         gjcGjPsZzmffkJdEkbhxdlm3uyFD/abQaN8BxBVLDZV/QT4TSnHkrKrRy+GysltKH8tq
         GmOwDLNpKu4ZvXCS3V+LugwbL5gnOyryum/MPfVI+B75KKMA8F8blWG8UmU6VTH/estB
         WNApGmm2mF0VNw7gUJCdMFm1WCUIlF1AUAXvi3vRkk8jv/Ycs3l3o4AVH236K7hmzEMo
         0UT1dfcx4VlJ2vH0Xh6khwP+KHy3ocL8uBTWNJxK8wA9mEXqoAcmTIJWKnfu898aUG8/
         d5/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WQHzKVqYaZwJZUC5Pb2xzxfXVpRRuYjJWgJcr6l3L5Y=;
        fh=SRS3Qd8qk4yzLI6IIy0qEgyHn6UqBoLSVinh+eHQtMM=;
        b=Xfk3bCgi9SyCrjZ/CIgAS0HfB/RnRGM3SJfRkWGBFMTLL1UdgrRPipB5LL1kzlPO60
         jAIzArs54KCd+HjtYrZCK6ugCmRrDwE9+DraunV0mA9U28A/iNNDgn92fHln06LAlwi8
         vtXTO7kbHvFZyfhbTqvCMzPMNqP2JUfkSOk/PKpZmF8BgvYOGZFxZy94oc1Lv62rMU2Z
         swhf8jOCvw3KKoqrgAnOHl9mJK7RSntkiEU9QMTwZICeC4tOV5bTEwuT3YWvneWfaaTU
         i41lAB+7bbICamEPzOTtUQVvXmbMlZDN9NKn7s4HoAEd0j5kEjCSTonZAhLrSU1Kieps
         +qhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792512943; x=1793117743; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQHzKVqYaZwJZUC5Pb2xzxfXVpRRuYjJWgJcr6l3L5Y=;
        b=aPwbeMPzAdLLeNAORWON295qh9yETXyJc5a/Id43rICPN6Spi03PNjK9LcYxQJBDdB
         IrZrzj8BxqqZrDjlCJpTkSD5UTyM/53aZvsftbz7fUYKor2pNOyBIFKdFhCXP8wMnUbV
         QvsxtYuhE/JIVqy9XioMAOfY6L9gjyOxqXj8ALZXcU5bg+T3YUubiCqjlTiLVZpGxaY0
         ZzlHMlQVRJ9EbI7JOgh720G1k1xuodMFKrj5hMYsfbU4zt7L6wc8wLrIeCgFGNMzPsHg
         EqG+OmqbSuDt2Vj/ZNLsMsS0F3yTzXI/LoT/r11AcyBrGUuF5h0S6OP0W0aUeYkDUEIn
         QYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792512943; x=1793117743;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WQHzKVqYaZwJZUC5Pb2xzxfXVpRRuYjJWgJcr6l3L5Y=;
        b=ybcixo7O5Gaa5VSEnn9nVVbcX+UJN4CwpIrcDPIs4ilZjLS0C4P53NkfJfpYP43kxZ
         bLCGFvMt5isCttREutFAFh1wXq6d/fBWepO0SFclXrn3WzCyncX0r25gO8dF2AzFE7Si
         NWzjCe9P/4c/4UadWgFhbuH8XehAG9vZWRoPAPUapnV0xQYoPCnmFElteqNQph4AK48T
         XJjW+lu6fR2WG8wiw5m1OnAytRZmHVgUbuxCaf8RDJEMVwptGh6naAbLPi80AJnkLXfs
         nd4GzeASR1lMR1Wa9oDQZR/oLr1sQypqLGmjbozzXShsoI8apHMPzcjhSuaLvLPB1Cwo
         JezA==
X-Forwarded-Encrypted: i=1; AKwUvBw2egsnmBws1f9Z7fXoJ6nDafdYsFc0BbXdUKjqU+OzacUQXs/EVecJXpmz2YmLf//qTPsbbcA0Jaoq@vger.kernel.org
X-Gm-Message-State: AFq9FYIaYd2isamEQp0FsVrXgv+xpmukLQtz295+QToMnBkNm3ZfNq1w
	o86UFMDGkzs0OmkZH6HYf4MJneKOfdo/r6R3oHeNOQxAjcS/Mpwsd3Svtx5qyKvFf885eG5D2Md
	HRucr3a6+3wTFktsI1q2fvm34HOxk2R0=
X-Gm-Gg: AYBFou1C3uABCtiRlnA84kUiBPtbvwJC3aM/fOQsLY/6seDSfqYp/v1qong8CopzH8U
	l72Dijav6B+FPuVQMaTRmXEtEgbdomk7R/FD7oP3Wz9FD8q0e341MgCDodlzDjOAB0FDJSfOnSc
	Ob/Svn7WNahmejR4ZSd3R3Qbjg74YOEq1VshUnf/FWRN5AjpuhiZ9x0cQlD5j/zxmsWfEi7v5y6
	++m31m9hrPjRMCxfFV+3Iwe3PdoBXo9fYzgVqM1Fyzo5NogqyGoBdm6xVj27SAI0DMNuAZBz7zy
	z9GdcCm+msgAw0eLq57+9D9pA9w58KsAZddBQgyHdYCsV/5cgE3G7ClvGI31zTH9UT991YdX5Xi
	wDGNrNVsYkVg=
X-Received: by 2002:a05:6512:1289:b0:5bc:b375:9dbe with SMTP id
 2adb3069b0e04-5be50a6b0d2mr3742796e87.45.1792512942267; Tue, 20 Oct 2026
 09:15:42 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261011-sdm630-idle-states-v1-0-3181d488dc0f@gmail.com>
 <20261011-sdm630-idle-states-v1-1-3181d488dc0f@gmail.com> <2e5bfe2f-f639-4c55-bb4e-e8893e9f098d@oss.qualcomm.com>
In-Reply-To: <2e5bfe2f-f639-4c55-bb4e-e8893e9f098d@oss.qualcomm.com>
From: Fabricio Akio <fabricioakio@gmail.com>
Date: Tue, 20 Oct 2026 13:15:02 -0300
X-Gm-Features: AclHuK_1LQ0hgYaSfB-TfSrT7gWRZXqvLPPkmi6DcPVVcEYrpgEnBAEw1acmmg8
Message-ID: <CANxzQdH3eC97bb+eef=wizrxoB4XfvROzg8iHFxCrN_a+TZiSg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm630: Drop the cluster idle states
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Alexey Minnekhanov <alexeymin@postmarketos.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Martin Botka <martin.botka@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 10/15/26 3:51 PM, Konrad Dybcio wrote:
> I threw an LLM at the downstream tree and it decoded the states to:
>
> C2D, no cluster state    2        0x00000002
> C3, no cluster state    3        0x40000003
> pwr/perf L2 D2D + C2D    L2 2        0x01000022
> pwr/perf L2 D2D + C3    L2 2        0x41000023
> pwr/perf L2 D2E + C3    L2 3        0x41000033
> pwr/perf L2 D4 + C3    L2 4        0x41000043
> System PC + L2 D4 + C3    sys3, L2 4    0x42000343
>
> sorry for getting it wrong years ago!

Thanks! I had decoded the same values, but I didn't just put them in
place of the old ones. This firmware supports OS-initiated mode and
refuses platform-coordinated mode ("psci: [Firmware Bug]: failed to
set PC mode: -3", PSCI DENIED). In OS-initiated mode a cluster state
may only be requested by the last running CPU of the cluster, which a
flat cpu-idle-states list cannot express. I tried it: with 0x41000043
in the flat list the firmware returns DENIED to nearly every request,
accepting only the few that come from a cluster's last running CPU,
and the idle CPUs spin on it again, at about twice the battery current.
Linux runs OSI only with the CPUs described as PSCI power domains,
with 0x41000043 as each cluster's domain-idle-state and 0x42000343 for
system power collapse above them. I'm working on that, but I'm not
sure yet when it will be ready, so this is not a placeholder for a
replacement coming right behind it.

Dropping the states is not the complete fix, but it helps now, because
as they are they do harm: cpuidle records no successful entry into any
of them, and since the deepest of them is what an idle CPU picks, each
failed request is retried instead of sleeping. On the Moto X4
that is about 133,000 failed entries per second with the screen off,
and the battery current goes from 277 mA to about 115 mA without them.

Is dropping them first OK with you?
