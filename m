Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ADB4F4D1B
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 21:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841660; cv=none; b=FADRBlt+t07j2reWPKCm5wtnTXuzTXD86xknVszuqdSeoBr3kbxo7lxkwnNZOFsHwEmpfAvxTGII1bI0/8YF7RuyVzfS5emUqR/Hh4S/nsNJt2MMjLb2khply9iH0KSyxh09U3siePsnha7xjFrgdJ6saML0dqgryxNIqP+udoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841660; c=relaxed/simple;
	bh=gBFBxLm8HkrP6Q8DthyOwtOjSWDTaFoDbTRkrYjC0pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csK3D+mpNCzko2cpbs12jf5cv/S6vXH9GG74/osm3WPeBlavSfexfXlVxeWCR4VqwUtjWeZo/ThDjYh9Bx66nCXPUqwY6dLut/kPNz2lnFVf4sgnxfbYmy2V37ox2x26HfL4cZPKMVnyh2UQhMH73WMhnIfEf8mb1U+1Q+znckw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wp3fjWl+; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wp3fjWl+"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1c9879395so680592a12.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 14:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791841658; x=1792446458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQBJTSOmJET7mou+bxBw1N4I5xwZbM40VMBF+pO+89E=;
        b=Wp3fjWl+JaP9/5sMmj4HaTG4AWArX95YjxrxwjLkpb9imY30dUvc9ST+Eg0slPPuZG
         QBGzVEsA8TY663YMpP0M0JpM+wFR+y/TVbmh1p319HogyJtzLqyO17GU0RFjWGlYLlqk
         bONZOrDUZjIa8X3g9GDTWuwgI4t98o7Xx5VpPc+jELtck4u1OC/3ChWxdx6g2F0XMeyM
         S0eYCOnD4aJJr0iUmlfk93JF+DLs4Kep0EYdw8aqaKVyb6+rlw+VXNXnQFqgswmawzdJ
         wIjSz69B/v0J0LXNJUcanCOYDHf2zWZBPalbRubZBmxRVyzFj03oiNZkUyT7F1VgF45R
         GkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841658; x=1792446458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQBJTSOmJET7mou+bxBw1N4I5xwZbM40VMBF+pO+89E=;
        b=IL2ZVu2ttiNxXrPUlsMVAd7quda57a8AoFtLYXnnyqY2DKtU5dTr6odnpF0OvTbEPk
         31jAwnudGP1HaHdnx5dVBKCSHd3NrzaNGoTWP2alqBl3ctT3uUZCqEQqd4UTait4DuL4
         Hd9hcllX7I/rHIgxOWlyXqrgdA+kWlMs3CnF488Qg9paXewIG10JfDxbUXpgg1/J7BP8
         yxA6hf4cNNpMehJJ950XrfUBXBeWtY9OoQqvkEExWaRnfYPZs6rjgNrMJ29j2uaIYSxI
         0SBh08Toq3aw6eCgnlP48oFdwwM9S/aP6eHDjOEKteBCIm0oHcaTo8Vnf3Qr0ky/2NHq
         t13g==
X-Forwarded-Encrypted: i=1; AKwUvBxO6pYUGBV7mEPWVl49Pn5CZ4GMotCVHfVYDRlEzy48l/RJpmQAsE7LfawvWZEQWCncXH5H4waPNr4C@vger.kernel.org
X-Gm-Message-State: AFq9FYI68BjlfEbbJdRiR1oI4tXAvElYL/Mjky3Ye6WlWo+TkCs3ISfV
	bo2fB1BK7y8lNCBioF36zhrzM3d1bttEA6G8/YxYvYZhhR9k4isCHaVs
X-Gm-Gg: AYBFou240c9a0XEXN8X1CI6juWe2gGqb6hhnOq2eXMQSy4nzo4bbOiAEEv7hHP+5ss6
	cASSGhkzrzGZG2H0mB1lMWgPqj5nxCiqeXAduwVR5zfERYfZx1/6n4oxmZiNQPMHAnN98127bWY
	nsSt5+DV0MaDuNEPwbyE3FC7A0MzFoG/gmZ+zOT6IeeLIQXSAUINEdAgfeurDYnV3qOCfZtaskd
	O+jveh83T4U0nzZqneC5r3sTo2Ilk1G12g21AJDsg1GERyUc/gczrlxAE0mU22sRNN/GcWtci1z
	/z2BKs1ZemhxHrL5OoOoX9SzecdOpGLKJn+RphgutjcqxNIX/TE2UIk+yKzkJhXOYMmx/CHwH6R
	xwQ9hC4csebFJfpEazzPk3Q9Sqwn0L+e9os7iWHvHne9t0tkfJ6ZmVGblawvyVH7vgxU515cbIm
	lEfrQdcbilNftL5silvorXh05yhE/z7hjYRuUJcMN1ecEdz4w34o3Pznq6m3T5rwTD3ADGP6rMr
	7DrkqEuFYD5FzGWNydaHnXit/Pq0VkmAIgbY8S8KbsDkajRhjonExf/ZV56vA==
X-Received: by 2002:a17:90b:3b84:b0:3aa:f4af:1e16 with SMTP id 98e67ed59e1d1-3ab3a4871e5mr8322337a91.7.1791841657487;
        Mon, 12 Oct 2026 14:47:37 -0700 (PDT)
Received: from ryu.remote.fontis.id.au ([2403:5814:a404:0:cbc1:7a8e:f385:c576])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3abdd5adaadsm7208435a91.0.2026.10.12.14.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:47:37 -0700 (PDT)
From: Lloyd Hazlett <lloyd.hazlett@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Lloyd Hazlett <lloyd.hazlett@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH v7 03/12] arm64: dts: qcom: x1e80100: Add CCI definitions
Date: Tue, 13 Oct 2026 08:46:57 +1100
Message-ID: <20261012214658.357133-1-lloyd.hazlett@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-3-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-3-1a63eb35838b@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on an ASUS Zenbook A14 (UX3407RA, X1E80100), which this series does
not enable. Applied onto next-20261001 together with local nodes for this
machine's OV02C10 on CCI1's second I2C bus and CSIPHY4, written to the
pattern of patches 07 and 08.

The sensor is reached over CCI1 rather than a GENI controller, so these
nodes are what make it addressable at all. It binds as ov02c10 11-0036 on
a Qualcomm-CCI adapter, and libcamera enumerates it by the path the node
gives it:

  /base/soc@0/cci@ac16000/i2c-bus@1/camera@36

Both directions of the bus work, not just discovery: the sensor's
auto-exposure writes take effect, with analogue_gain moving from 96 to 199
between captures as the scene changes.

Tested-by: Lloyd Hazlett <lloyd.hazlett@gmail.com>
