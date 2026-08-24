Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478E625A642
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787556299; cv=none; b=aebw5o0G4nn1Ofk03dd7cO0F6hn/UC+FWkKVsLepbfCspJ0t4T0LyB1w9GpPvsO2/PLLUIHwMaKnEJMLPtP5PNOeiRTEl9sLn1tqi5UJnHalfkl8SqZTCyfWkKySck0wDw9hwwbhnyE9Re72JPSvEjFQ6k/85LSJURXYC3tHXZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787556299; c=relaxed/simple;
	bh=Qtw4xKKAiDQlaGMtax6UnBAU+d0Qi0wjGCAxPFyFm0g=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=hpjW3/H5UfGjBNdtm9fn7OMEi7WkcCnl6sU+b42Juv3gAonBY0zLu1G2BZBGw/y4WRUvafubnQcSJfJJsIz2S5rnpQTPBoNKl33lWseCXQ8vKJbv1QXsYTW6QhXkgp5dOTgA96ZUn9ZwJsz5YI6k66j3zIoqHkB+AEybw8ejTEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=U/TQSPv7; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="U/TQSPv7"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso5296468a12.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 00:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787556296; x=1788161096; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mReJpvtLm9dqdv3WCFEniwlCeMYP2iFL9V8+lCtTCl4=;
        b=U/TQSPv7Avokss6sadFRw5zmwNlWqihHBEw52IDszBwV8ympi3gSgu1T2DnskyhCfE
         XYnE9Zjev8CzGrENLZNU/e+uG9SUBMp6aoM2K9TfcOvFDrKclsgov3oQ8VpEBJLP9y1W
         ZfidFQUHMJ/YgThzjmoIWxaiBXsB1sArhroG+ciZRl0ugS1ox9oq+U0beTlhKNfzpWL7
         WNHl5mA8odpI8pW465MkX4MD8EYjQPmw2GcFW7MXAP+RZkymk3rdGgM3FDFy63+bE4S/
         C8TGglAbGbtF1GnBZDTlCzENHi4sDdn/VxKQmGVPdRZv9yq5s0Sny+/T1Gz+z1Qq8ZNT
         ac0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787556296; x=1788161096;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mReJpvtLm9dqdv3WCFEniwlCeMYP2iFL9V8+lCtTCl4=;
        b=aeBQ14a1YeS8OvTYnPWVD1kriHdfA3s4l25XDauIlu4+Vf/YoCpZdJRY7kTF9OaQO1
         b+djzOcJn3dxJpAfnO+NYGkVzFWRD9NXD+NX9VQudtUja0ZxtBOJZ73peauHxN+1smG9
         msedlSxgwtPcBeyJQybVRCVTkUWTY/HKXpSRUny5gckXtauuQJX0Yk/HBQMQuhqR4G9z
         DnAAHaGa9iMqKlDo4cZ3OZBPSW1Bjc2lIa29oPIdvrgcvrr6//K/GjJ+7+D+kp8Oo1Oj
         jto/8tEmcK5ZsRlK4GZtKbolT0jPyPWm5EWgvWQTVqdXIpur5CtBo/sNo4Xv/k3erQcY
         1+sQ==
X-Forwarded-Encrypted: i=1; AHgh+RrkYgZbQ/zawmbs/6/8RNXxdDsgvDDfpULvKE52+ZOKhftrR4xq8Zk8pj4sbFUGtxm4vKtAhTzN+qMK@vger.kernel.org
X-Gm-Message-State: AFuF++lLzWieMefZn0O0osN9J9ToRrwe3L92pYf+E8bFUayeERGQ/FuV
	eXZUfRrXE6YRZMJlG1IPGm6HakCEX/4g6VRkHw8kDo4vQyENY7AZTtzA72Ad1ebjtT8=
X-Gm-Gg: AR+sD10UptzAKWbC50/LGS83Y8Kx7Vs4QbW2qG3e/hKZCYiN9GoUFmtgr815UrEVxgH
	If1AUp+JNU41B5zvzMvWTNzuvW0ECLT+qHcRTfSEECRkXQFXuHL7qrE9PsI8PyzLZ7ptUxN+3AQ
	KRHVfpN/0zdrY37vKVCw92+/mQxxnRCrtQTeL9/2Z46kkX8CWHs7vh7yKgevpAkeK8CNwhBAcAm
	qpRiIwUqZSrG3tNlSuCCXwPnMwwYAw9zARHXMp3OxsUUe4xEW3ppy4xxjjRHRxESIZCqnDffM95
	C1LHveuizn5MtWqwPtZ1FUa8e/GC+YIGdRjk0c3BkJxm16wpPoXTfw11c6Bzx9F6hb9AKn+sXZm
	pSXBziYOpycteWP+VIpVoASbBlAm+zK1F4BhScaGvVpQGmA5JXu4mUPzqtCjldnZyiDtW1MdvlG
	J6E+ZX2GMpeeOYu/O8gAnkM5gZ2ZyLGMIaJyygJOMA7qmLXBKJHTv7JMu+hEq27IJkaBczw0bOv
	lnPz3gAhBJM7kR1ICTo3vNd9TFK97DboK/xQ2G4HrvhZ0W7POU=
X-Received: by 2002:a17:907:1c26:b0:c1f:29ce:76a1 with SMTP id a640c23a62f3a-c249272d9d8mr2094529166b.19.1787556296453;
        Mon, 24 Aug 2026 00:24:56 -0700 (PDT)
Received: from localhost (host-212-171-227-71.retail.telecomitalia.it. [212.171.227.71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f64e0sm1399310066b.32.2026.08.24.00.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 00:24:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 09:24:55 +0200
Message-Id: <DKWZTL9MS4PC.UYFAW9NOZG5N@baylibre.com>
From: "Carlo Caione" <ccaione@baylibre.com>
Subject: Re: [PATCH] dt-bindings: usb: mtu3: Add MT8512
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
 <devicetree@vger.kernel.org>, "Julien Stephan" <jstephan@baylibre.com>,
 <linux-mediatek@lists.infradead.org>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, <linux-arm-kernel@lists.infradead.org>,
 "Chunfeng Yun" <chunfeng.yun@mediatek.com>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>, "Carlo Caione"
 <ccaione@baylibre.com>
X-Mailer: aerc 0.22.0
References: <20260721-ccaione-upstream-mt8512-mtu3-binding-v1-1-2f229c39f121@baylibre.com> <178576344579.3104650.10771178654777991535.robh@kernel.org>
In-Reply-To: <178576344579.3104650.10771178654777991535.robh@kernel.org>

On Mon Aug 3, 2026 at 3:24 PM CEST, Rob Herring (Arm) wrote:
>
> On Tue, 21 Jul 2026 10:00:28 +0200, Carlo Caione wrote:
>> The MT8512 USB controller uses the standard MTU3 device MAC and IPPC
>> register layout and is handled by the generic mediatek,mtu3 driver. Add
>> the SoC-specific compatible so the controller can be described without a
>> legacy split node.
>>=20
>> For now the only user of this is on the U-Boot side but we want to keep
>> bindings in sync.
>>=20
>> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
>> ---
>>  Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Thanks, who should pick up this change?

Cheers,

--
Carlo Caione

