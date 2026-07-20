Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87C5423EB6
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552993; cv=none; b=enQMtlRXLnm9EL4jjUGD0un/B4h8rTPldv2TH6Ix4ygLmYJM+meXdhQttinFawXBpqUE+q20knaO2BxygXeo7SE4k7otRsyXVTvPH3IIAztiq0ja7Bw7YZ5AJdcxLoYlK+/fb9aGuVr7o0VGhyPed4e3ce8mCVhK1xaVytD28pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552993; c=relaxed/simple;
	bh=KDWDuDL57h+gUNnkTxHplSYsFpb6d3sVT+MFcauaMsg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pi6ieCKgH7S4LjFE8qv2kP+IEtedf9jFeTrXwsuKX2MmfrliD0Y8WcOaRdcU9u03ALTlTbgsTwQPii/02utr9T7JJqJ8iWFmshWbsap++ra89NcN1+ogT1GK3HVjyC0ioiCxQnlEzCEtvLFJDpvBMrjMI640KP2qkWeqaYKLEFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e1Z2sPwH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e1Z2sPwH"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso12190115e9.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 06:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784552990; x=1785157790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iQHFbRe4vzGzrlDp1GieQYkAkV6Y+udMHh7RxbcHehI=;
        b=e1Z2sPwHkgad0RWdpSOP+1/1EDW1tR+EyqL239WNca9PLqoQd/6AeocKBS8QVnKcbn
         UqYmm+E9+6eI2J5ZbNNZmLX6PMIXwvJSNU1Rsv+vSpdOIHbLdKzhbMmV/CtJZ+oZ9qWi
         UNew49szVzeXsqxp+WZ3synAE/T736YxTwV0P7ohRJJ+zOt8cbhe7+t8Fm9BlHlnM8NB
         OjEPR24yjEMkRyr96SdGL2Sp32EWFIh0pyiJYkMZTMvGRXNTUhwtXiAN1ZUHSHUxP2m6
         HUAYLkCtfPUGeKJ7vPbadcNTdH6LPVaEGmo522dy3c891Fbp4WuKOWd5Ut9TxswJ1qed
         yoHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784552990; x=1785157790;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQHFbRe4vzGzrlDp1GieQYkAkV6Y+udMHh7RxbcHehI=;
        b=D3LzNJNr1qFMOtazS0/f6axSXxYRItw6uJ9+E6oFjJdtDfz1pHVh8s2HFEabNUGyyi
         CplInd2zRipZ/3YA/715h9u+9h1Vs9eDQEmXhrinUBjofvvhYmzqWJUiVpElHG5IaUXD
         GWOArXamLvIVjniJr1Rxm2Y+3vlFM/9WMChAScAKeYSCTac/UWfdvCjpTE9uPr8USbSb
         JtrvCBKPCn9GUdxVf9lpI8o1Wf1/ZYB6nVp6sJXr1CMXwLOgwvEz8nQ95z3bXA42a/CB
         Il7/uHQ6sbzk798sOUXCRukIY9t2eaHeg5gIGJEa3rjEJD5FMpIAM0qwg5JkPE3LZ/q5
         2Fgw==
X-Forwarded-Encrypted: i=1; AHgh+Ro79Bv0PNGiGPHJQVHLTqSyk4JW3/0N0wILppP1DGdcNERiwCaO/CrV4nw78/ngZ2ITkfTtylRFKeks@vger.kernel.org
X-Gm-Message-State: AOJu0YznHvJgzhXo5ozIS1VyKu8u33i7xeTc8bGXIZAjG/OqrwZycMwO
	ILnK4Ncjx+uir9aiOAIpbpFUeloz4kR2ZCIZSf1UkdlWO3kFG7JYjjwl5xeUZVznjfw=
X-Gm-Gg: AfdE7clj/JsxfkJmzZHWKoFJKS60We8YVPte8i6ZOGNji9WTiP4zdMRtFPPmK6FmNKr
	KYLgBphfP5iwgdojyWFNVCC4a0xx0qrQAB73q5Qo8lMBPxAKEtmD55YN1phexPiX2/R7ZZbkT/s
	ItSMJ/qKYJo9c3hYHLsYU5GKhZO8zjnsf6eeDqlhBpLbPASnoxfbfV0kcSHcl5a7z1wG1YzP0Fe
	1hyazvbFBcpX0KywyrttywH2rPHD1WYJPMIzXC5f8We+vvSTsJv48XpJhP93a1TB9V2kxAb9y/N
	tXTTApAHHaWumwvaEuVQYm4Zerbdkc3Ax3nU81MxPJ+5i3qvG91EO+TtrXP3pGWqhkKtaYsyLTM
	BQHdKn34GQSCRAe82mxxpP2dgzwHC5RDyhx9/hFc5XWrCfS1lJs3FHKmkDNUvJZE/LMSeix4Qzd
	AHS91fF/m2KCRO3Plqa/g8b/k=
X-Received: by 2002:a05:600c:c178:b0:493:e46e:157d with SMTP id 5b1f17b1804b1-4954a40481dmr125744815e9.19.1784552989874;
        Mon, 20 Jul 2026 06:09:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7ea1sm30767434f8f.24.2026.07.20.06.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:09:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] drm/panel: Add Novatek NT36536 panel driver
Date: Mon, 20 Jul 2026 15:09:40 +0200
Message-Id: <178455228139.789946.10539410573007438922.b4-ty@b4>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709142846.12463-1-mitltlatltl@gmail.com>
References: <20260709142846.12463-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,

On Thu, 09 Jul 2026 22:28:44 +0800, Pengyu Luo wrote:
> Add a driver for panels using the Novatek NT36536 Display Driver IC,
> including support for the CSOT PP8807HB1-1, a dual-link 10-bit panel
> found in LENOVO Legion Y700 Gen4.

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add Novatek NT36536
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/bebb0bac0b0fd0ca39c640462a6334b07bd093b5
[2/2] drm/panel: Add Novatek NT36536 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0355a14085b93260a2211d7da9a79ddb2fd85556

-- 
Neil
