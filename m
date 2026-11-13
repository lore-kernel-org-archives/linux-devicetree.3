Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602017;
	b=2Ez9BcRqQdUsdX4WySQCfxE3ZRIywFb+CUBabaAnX5lurJAX0v43JPHt0eqlhLre+C4m
	 wxzQK5KrhO+q+hNkzpaH+b2p9VWwK+1XQoKnMfVT1eVpB3/LlpKyhX+llwte8VlVTAxBi
	 LtipQNfN8fu0GL5oy0XJ5CenOyAIaBbu/CkW9iKb4LfcIaxYjnPIcaRQbv2SnaQ0+iELP
	 A+daRJ9KaH8E9XKC6yjdt4d7RkpEi02L5jK3sayNyeCxJBjHLv9kP55W7pkajEXhr5L3Y
	 sBmW3afpW7GDOwhUqifHtY5WnTlFBvplX/Vw2za/OEBMPNRnIgyDAd/jL8hR2UoJVBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=gEGhQyig/fNEybsXDYKz1iMP7UMP4XGYfAVUX5I4Sh8=;
	b=ADqAR9baUQxaIXPprypBaK9xERAZArSAjMN17roL5SNZ+BOk4DU8V7lIl4rZignWa9gL
	 Juf/ag1nl6LbL6fhUjJSdtAKaxb0wyvUmAXledH5qQ/QmBiytWiljDecbLyL7cdAdxBOn
	 9ZpZjxd7sEamlzX8cVAwYMk4t3Acu/slrn1LTwWVa7Tyl2AHlvtUfpwLpEK9Fmc4GX7/l
	 9LpQbFyiwrAvxl38eZnqdZD6oRmkLt7tipI1KcCh1H2JFNgjJlk3xEvwiaEiRYokxLRWX
	 DoiaLzl56qsUZE21H2bDfLT51iweceFaPXexWHoTJFpH+Vzb7hGtmXS0Apacv2UaK5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wSY5bQ6m;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09867606A330
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 20:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09867606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wSY5bQ6m
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so19428905e9.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602015; x=1795206815; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gEGhQyig/fNEybsXDYKz1iMP7UMP4XGYfAVUX5I4Sh8=;
        b=wSY5bQ6mHQtE7OEqfQyqajUidx6WmK8z/6DgbSY4eXxeMaI2cn/UEYpePyM6Dka2jV
         6jGyEtVtq4E+truNrt7G16Tso1F+brW6nQ6kzxtDVypoYSx5Sq2l13+8p2v5xWBj6B77
         ux6letY3KZbzw0JyToVj6Jofc9E164wVGVQhHkwlbp7e2w9iqbhQGeWYIUonXe/PUq/y
         xz5Nv+4VJewgv8F0A+TgTEmH5jweg4iZyDhbagMHF1uL1W27oa+/eaqGxJuos3mjBo3c
         nxq/dXf75zueN++GoRfXIu43thk85yIou8Xtl/GzocW2Pu2WUNse720dwfcS6dJswdae
         CaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602015; x=1795206815;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gEGhQyig/fNEybsXDYKz1iMP7UMP4XGYfAVUX5I4Sh8=;
        b=bm9fhSG7AVxMcyoqWWpS0A8oh0HMFvTFOkC8lmmen4XMdq0DIzfeDRJhRj5KilVR0p
         JWASgT6Dd7aLICTCw9RsBlzuM9f3a88JT0m6adc3B1vWPgP1PlRrJtwqDKbYrxufz9or
         535MFebeJ116wdRzrUKd0jeZCVOPQ9B7XnslrvDU09AU+oNjps/1Bxv5ttGwEsQMAzh2
         uBJgQEs7hL9cmFMq6tYlcn/lpJzQN4445GHmw3dI52HE299tKGB8DSG+V1iKWeZ15vK3
         GnaLWalMa3ZAjrWoCVE5UiMcV569biAGy7AN+a657sH4zhkgGtFnmv8rnHfbhDeU6Z9s
         SpCA==
X-Forwarded-Encrypted: i=1; AL+hErFWtjCJsF9dGoneWylAxDw1GXv1FC4Hdc9WAwVWvp/z6oA1lSTneIT8ErheIGMQQdZBRyJYMhpJ1ndM@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ho+6+QSoAsdicaMNDV+m5HkU62XW+Gsa7A9Qo8p0TabsqKMKM
	5kKGr5A6C4G62BvTCUBGQHHTsSxR3iKBbdag7sqIP+jkZHGa9XXNzVoM
X-Gm-Gg: AYBFou3cstde1ETt1ZrBJ83Tf8heyJn4mjr65moC4uYA3+biGKFiJvrJ82OE5J/TR/+
	MVN3VHJetfP0n3Eaa0+xIM4CbgrP9wZ6QKKph6aW3gg2L+2VBZoNl1ekc4Bq89a2oacOBtSk2gD
	xftq8UKG7OZgrViKx4KMVW2a+ZWI2sMMj3V+ooxplfi7qUxHOAuDWeRBzRndBTafwjRvj41ivsC
	Po0cz/B1zHlg9DEzBS2iTspKqgu35DelbyCREME7aq2l26xFjPAoaMbTEU+rzOeX6oor4Z5H27v
	v5IJtU6Obw2wBsBK75u7AJbZnjm5dP+kgBjlvNvEfdI/8WWCZ9gO5w5+8s8wnUUHzhNs+4DE1fA
	pu7AhVftv8jPpzzlqDr1QmHgPo4sHghyMZXi0aBDNFYqmbXFqr9U+72ZXceu9inuaOCr93ePCOy
	IbAeaRQlsUltCzNKa3+q9vHslwPLhGnVsxynrY+yhZh+sw/FWk9giA4LS2V4mxeTye9a0/AMRuy
	r2ByE39ZqyhS2H8NMPSb62Yq3O3kALECpLoUInOKv8kYb+nhcvw
X-Received: by 2002:a05:600c:e558:10b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4bb55a96404mr55295145e9.23.1794602015435;
        Fri, 13 Nov 2026 12:33:35 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5667a8aesm59897995e9.1.2026.11.13.12.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:33:34 -0800 (PST)
Date: Fri, 13 Nov 2026 12:33:34 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 vkoul@kernel.org, tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
 abelvesa@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: =?utf-8?q?Re=3A_=5BPATCH_1/2=5D_arm64=3A_dts=3A_qcom=3A_add_device_?=
 =?utf-8?q?tree_for_Asus_Vivobook_16_X1607QA_=E2=80=94_v2_series?=
Message-ID: <9032798812284dd2842cbf003c75cc0b@gmail.com>
In-Reply-To: <5a61c395-9eef-4c97-99a5-30f434ad2c7e@kernel.org>
References: <5a61c395-9eef-4c97-99a5-30f434ad2c7e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

SGkgS3J6eXN6dG9mLCBoaSBhbGwsCgp2MiBvZiB0aGUgc2VyaWVzLCBhZGRyZXNzaW5nIHlvdXIg
cmV2aWV3IG9mIHYxOgoKLSBUaGUgYmluZGluZyBkb2N1bWVudGF0aW9uIGlzIG5vdyBhIHNlcGFy
YXRlIHBhdGNoIChkdC1iaW5kaW5ncyBmaXJzdCksCiAgYXMgcmVxdWlyZWQgYnkgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QuCi0gVGhlIGJv
YXJkIGNvbXBhdGlibGUgJ2FzdXMsdml2b2Jvb2stMTYteDE2MDdxYScgaXMgZG9jdW1lbnRlZCBp
bgogIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sLgotIHNj
cmlwdHMvY2hlY2twYXRjaC5wbCBwYXNzZXMgd2l0aCBubyBlcnJvcnMgb24gYWxsIHBhdGNoZXM7
IC0tc3RyaWN0CiAgbGVhdmVzIG9ubHkgdGhlIE1BSU5UQUlORVJTIG5vdGUgb24gdGhlIG5ldy1m
aWxlIHBhdGNoLgotIFRoZSBEQ08gc2lnbi1vZmYgaXMgbm93IGEgcmVhbC1uYW1lIHNpZ24tb2Zm
OyBhcG9sb2dpZXMgZm9yIHRoZQogIHBzZXVkb255bW91cyB2MS4KClNlcmllczoKWzEvM10gZHQt
YmluZGluZ3M6IHFjb206IGRvY3VtZW50IEFzdXMgVml2b2Jvb2sgMTYgWDE2MDdRQQpbMi8zXSBh
cm02NDogZHRzOiBxY29tOiBhZGQgZGV2aWNlIHRyZWUgZm9yIEFzdXMgVml2b2Jvb2sgMTYgWDE2
MDdRQQpbMy8zXSBBU29DOiBxY29tOiBscGFzcyBtYWNybyAvIHNvdW5kd2lyZTogcmV0cnkgZGVm
ZXJyZWQgY2xvY2sgYWNxdWlzaXRpb24KCkFsc28gb3BlbiBhcyBwdWxsIHJlcXVlc3QgMTQzOSBh
dCBnaXRodWIuY29tL3F1YWxjb21tLWxpbnV4L2tlcm5lbC4KCkJlc3QgcmVnYXJkcywKRGFuaWVs
IENhcnRlcgo=
