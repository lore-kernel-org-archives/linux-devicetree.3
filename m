Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794165948;
	b=t1gA2Lq6R7GhCPeWL56u87SOsv+NMyrOy+hZKZXslrRUhSPD5sPMwdSgtLblWhWFOgZ4
	 y/Rzy5u9kWx3/gcdW+ElWkJGH4lET/tSj6XzPDfgClUGGgQvROG0XeR0S0bK3KYpclfQn
	 BRAYle5ierirjXC0oewc6Gg+M+eax+cqIjX+GLmfNSo2b7fEpGrGisAykQE8PMHlDQ/ja
	 5f3qYwJnnTatxoC1KcX6FrPnNLbeXM25kVWFZd3grkoE7q5UhYsa/wSn04UX1gAKrjyAA
	 aC7BqwYFbx5OBj1oWwbcBGISTrn8k8C+qUVYheXP1yWIfajtew/IrpR9mptqFBWxa4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:Mime-Version:
	 Content-Transfer-Encoding:X-Mailer:References:In-Reply-To;
	bh=9TFlHze0xZHVHECFNAToGkMpUA7NwrSzUebXukclDxc=;
	b=EQ6lfne9pjmToZuyuK9RQv1w+CosMDVvQiRO52wYF0JeGFnkGycMOjFicyXluZ7Lj4Fa
	 ipCzoGqK53jhiH2To694UkBNvOf8B/ku5UiO0qO9ACnlG1ddqTpk0LT53gLAiS2KJRrDz
	 gvdio4L67Vh7mX+8tA0EtEP16wtjiVI8lth2/47fiU6TYiOlyYEQRCucWHgBR1IKipx/K
	 jlYZboeqgVFgzvSbU9s1BOeDGj2ONxpImzHL062CFCkXVDjgRn1nkaXda1EAQcBwsoCTl
	 eDEyp181qWTadsN9/NwTSa0wt0AV0b3f0uMRbh9YrliMAL+r07i1spfSxzKvtS+H0bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSiv4TuA;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B314D606A323
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 19:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B314D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSiv4TuA
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c49b431f022so38721566b.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 11:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794165946; x=1794770746; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TFlHze0xZHVHECFNAToGkMpUA7NwrSzUebXukclDxc=;
        b=WSiv4TuApj5w4HZ50fhfgNst1yV6yzNn/XhgbsQuSgTm0D/HVCH4udeCvKUww6E+U0
         D3N6gs7Usyy2COHjh1RqeQGWpr2skW+hn7epsen7I7xrqYqFTEdbosd+1UWyeCKmRshx
         8JPu6ci7480u9eMj2XPPDmzzJcdd5rsQR33Z5a8L0no+54MDf6arQnvG6cwRzKOyQ/wf
         8VnQG0sN7CnI5yvoG67OJ7bwbiRqH/j7Kqt3StBXm6UkhPd7HulEHPLx40qWowz+IA7y
         Yj9eB5wyBSFmMzhXc2iYzgYS4Qh0XzHhq7n9ToLj7gD0BpKOWW80IVuoX8DQebPToFGZ
         mPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165946; x=1794770746;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9TFlHze0xZHVHECFNAToGkMpUA7NwrSzUebXukclDxc=;
        b=RSGSEktPJ/+YRfVIifCtZnBymvbOXHm+NCrz8KCM96DPVxcJyBiXawF0satHtSFfb8
         KIO7GVKAuQRCgj8Iv1/VeimPmEBAFxMME7RDTaiZMG29+yPKh4g/2vFKEmjccqeKk3xI
         JmW+9J4bCJFu4+kZFla7YEqWNM3/vzAVB7kt+gbohDDTL58cqYZq96wH+aklkbZzF70U
         74bQ25hSi0i1C3ru9XJTQZxD34EJdZ+IanczFJBqjgD1G43Qh7BbWDpoCa3pl8B3kJDd
         rI/WW/G3Os9aK739aqjZnca7nv8hg9l2lLAqyiKhL2t77MIB6mtWlUz+dJPF7AhItj6y
         nVfw==
X-Forwarded-Encrypted: i=1; AL+hErFPV95C1KqKoi5iFEX7GKLgK4pLXhed8q8OglwJ9I5wihjAxem+eh4REU+zJv9r7i7Ycy6GB0O4lTbR@vger.kernel.org
X-Gm-Message-State: APuU4Z/YuPRywcGbm2dBSu/7NTht5jxdup1a0oVUo+uxytGodfTct6q+
	Uzk90DIsHZol/cGlPhLkHKiNBw29hqwAplZhPwID1nFjXh18VLrjOiC6
X-Gm-Gg: AYBFou1UV0jyyeLvvu/n1s50y0Cbga/pBtzKwouipi1+arhTKURFa+YXCOqaXZw0GjY
	QuLDDZPZJzZslhikUwprZ42qyULT1wPZmnM2d+FUwMtkgzaApymTi2UwGSzP36BIATvh6MGgSkv
	7AE4WLjE8R+BBFMU6cCsms4ak5axF8xn9cIn8EVnHK7uTY44k1zpvFokrRqvVlx+02Z0Rxz0ELS
	xAbOe4F0XYtqVsOflv8E5q8/9kXbZWCVl+rNJYYoczuuiL+GD1ahe+jG2j8+8ikkgVwDKeEfLVF
	qFCadZOndcDWJAVKDcjt2RmSMt4GkVjN6bXHHatb12gAKt1sRlbcGE5roSdvd7+y4HViXhBMXz8
	HQAxbM4Owlrg6cXFMz/Zl6ZUW94M/NGopoOQM/fw6n7lEgUxLtj1w+ojVMhBNM0W6cvnJ9Jy3rF
	csh8dI8inui/r8LwiHtLFtsCT/M1A4lnJHZo/4kz9d9s5bOm4yvnlsdmphRaXP54w3jRV/urSOr
	0S4XYjYt1gTRxzaLrFaX9OoumRN4Jpo4N3ro3KzrbBXiG9uv5q6FN4fgw+D2Krmrphs6cpP/rZc
	WY2EoVmTtBvqFm/py+pKB4mkUjhspc8AkmEagtKbhQIdnpZs8TQjBXiF
X-Received: by 2002:a17:906:794f:b0:c34:83c0:b92b with SMTP id a640c23a62f3a-c4d6d522af9mr142299866b.23.1794165946088;
        Sun, 08 Nov 2026 11:25:46 -0800 (PST)
Received: from localhost ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a998a5asm81036666b.72.2026.11.08.11.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 11:25:45 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Nov 2026 22:25:41 +0300
Message-Id: <DMQ2QUT58NN6.10MAQ6P7FML2K@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
Cc: "Linus Walleij" <linusw@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Sean Wang" <sean.wang@kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Add support for MT6895 pinctrl
From: "Alexander Letuchiy" <asalde.le1@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com>
 <20261108-pinctrl-mt6895-v1-2-f704c443b31a@gmail.com>
 <sashiko-outbox-203909@kernel.org>
In-Reply-To: <sashiko-outbox-203909@kernel.org>

On Sun Nov 8, 2026 at 9:39 PM MSK, sashiko-bot wrote:
> [Severity: Medium]
> Can mtk_pinconf_bias_get_combo() and mtk_pinconf_bias_set_combo() read
> past the end of mt6895_pull_type[]?

Right, mtk_pinconf_get() reaches pull_type[] for the virtual EINT pins
227-246 via debugfs pinconf-pins. I will pad mt6895_pull_type[] with
zero entries in v2.
