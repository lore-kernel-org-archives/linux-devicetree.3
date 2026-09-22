Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784135275AD
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790120380; cv=none; b=snv1OpEcFD7XVy0DaNk+dHrxE2VNAB++r0yw78ujN69kUpFhoMhNYkX+uUoasL011SQOGN+bXj7KAcFkmopjQy1uxrBlfKO1AohKbhnfcIVeRY8Aj0lz7XAo57V8YxPDVmi/aAFlvbccNzF/ddRAsgY48LdLL9eXsbYNMfW2MMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790120380; c=relaxed/simple;
	bh=b4PyemOas51sLYTItG1LKlf5UMn0KctJVlyzgXvS4fk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=JW6BgVar97X23RgWlHmejtbHMxa/yBY2heIdj3ePMCQjeomoRrlZuDDDDnR3/H/L+ToTbZVwMk1sobE65lRKRGsHW4Cwy1fwZqTrlTcLBuuQ9F8Qs8whOR9WDYPQ6vbQo4UAol8MjFRC9oon3slWAgaVO1mH2E4A+aMIdSQukw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nGTZ3u/k; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nGTZ3u/k"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso1359475e9.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790120375; x=1790725175; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b4PyemOas51sLYTItG1LKlf5UMn0KctJVlyzgXvS4fk=;
        b=nGTZ3u/kWzZEqaIqg+axaFdnzXCJuW+PrSaAzT+4cTEknGMQsJCLDJswUVeF4vneU2
         OCNR5n3p4ybKz8SsSCLFH9Y7apg/H75Z6vi8sMhlEI4ulO45TLmN2LREXMfWQV6Jfxrl
         TAulGa8oSGX4hTgEsrnoEuvfK2h0HEoZG96cGEmC6HxonTbIKQQtxShKcCxd/S7UksNi
         y2qjltP1TzW7tTxobdyQYnkAmrDLLpB8PfE1lRe2OGkR3Mzs8xaPdFvZWoiTnQo/FF39
         UYh+JdFjfZIxInLB2dv513cvYG95H7rr5v5WpbMRMR00QetKZ+FQGhN2EvJhA0KxXVOC
         6Rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790120375; x=1790725175;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b4PyemOas51sLYTItG1LKlf5UMn0KctJVlyzgXvS4fk=;
        b=mmi+7Bgb59f7XNDeLE+mubhlRRZcWKiOcbAWwR75NXQG746W6QNBTTeJoWRUeGrFPM
         5m7U+581ibne30b17oYNlYK8fmMDGXLFO0jbqt5U4xeH0QTye9cyZ/St+dyCkEFEo/pC
         9V6nkSBFgoo51JEB/3yzuWxF8P5dNW/dow9fg4AqtKQ9KDJU2MeLtQt9cSwaNiXMN7gg
         0d1UuZod81IcyDMyYOZsxI9l7xpaPAYuaMulxCHd6MTMGmZlyIKX3jWdOKJi3dyfxAL9
         tOoUr3J4hLNqbqWifYR8zfp/U3/BhQ8g/PwiQOOyTiWwmzbxwJEidL/sWVAh9ItxYZYK
         f34g==
X-Forwarded-Encrypted: i=1; AKwUvBzJPpBS9mC14qxqFvMsIFZiigNRQwSUk3iuA+FLEnPVDnANDbWS/KY4s/IeMR817gAV1IDrlOx77ipL@vger.kernel.org
X-Gm-Message-State: AFuF++mRPhjYjO97LljBxt0ZKlu6tOirBsV41r/NxzSwejx3YDnwUujN
	5Z86BQ+EwBwbIW55rtqoHbOkEQ97h4Qut8VkWGbhtqM7dw+fUgnzfaWxTtn2R9wEfQ4dUuZVMMF
	Fh9qLNk4=
X-Gm-Gg: AYBFou0KaXlfTV3Ik/LMceD6fa8yHK5lXEHo17gsIkKpItkRQDZd0VqsMHWkS24eJW2
	YGTGPOukQrOJe1hx2sMSp8xdoR1oaqhKD2KUZ1R3vNLLkgAbtjOEu/iFW7L4sKB9W8CvYIxlz0X
	lrqA9HBdgz7b7x8CtuXfLgiP2leisysaDlk4QdXjtr3Q6zQnD/QcrE/IFmXrx8ZDxaGV8bV772n
	nYo+W6FD6PMaF0SIvVwQUu7pqKw23N55qlakZ6tSkOSGTz87iFovU9r5lJCOk2M4ms8A+ndLa3Q
	vlR9//ePYeGQmu3jse1+SKtgyV4Hn0Hfv1mKI3MkBvBGNuvBMxl2VttI84OoBgJiQ58H7sVQPCi
	/6FhSEweKtrNHanUCNhefqD/soY2AuawxwPt3Az6xc2MF7G1Js13Ed0CXBEXNKxfjOWU4n0mVbR
	52DSWsgp53m7ZPjEPq0GiQ/+gwui3d45JBbPBS1IYb1L2+SPQ4bNIrtl3lOcfBR/Kil+CHhDHQw
	JStNIk3gp0NL87zVNRnxzGFplJou+Ed/ZO2jECrtTmL1d5vgxG05rn2/OLUCF8A2d7ofQ==
X-Received: by 2002:a05:600c:4f84:b0:49f:cbae:3414 with SMTP id 5b1f17b1804b1-49fdee0af33mr8327405e9.4.1790120375291;
        Tue, 22 Sep 2026 16:39:35 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1a0e00sm23315025e9.10.2026.09.22.16.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 16:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 00:39:34 +0100
Message-Id: <DLM8PMZGW3LZ.37Z3VI9NHG5D6@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>,
 <sboyd@kernel.org>
Cc: <dmitry.baryshkov@oss.qualcomm.com>, <alexey.klimov@linaro.org>,
 <r.mereu@arduino.cc>, <srini@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/5] arm64: defconfig: Enable configs for audio
 drivers on Arduino UnoQ
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <d7e64ce498db8aec475b8652563c6cd8bc8cd429.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <d7e64ce498db8aec475b8652563c6cd8bc8cd429.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>

On Tue Sep 22, 2026 at 11:11 PM BST, Srinivas Kandagatla wrote:
> Enable reset controller and pm4125 audio codec driver that are required
> to enable audio support on Arduino UnoQ board.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>
